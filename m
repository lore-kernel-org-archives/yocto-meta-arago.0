Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id CAC9E52092
	for <meta-arago@arago-project.org>;
	Thu, 11 Jul 2019 23:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B5F1240BDB;
	Thu, 11 Jul 2019 23:42:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ePSykJxUQzmR; Thu, 11 Jul 2019 23:42:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9E07C40BB5;
	Thu, 11 Jul 2019 23:42:34 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DF15E170CD8;
	Thu, 11 Jul 2019 19:42:33 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 11 Jul 2019 19:42:33 -0400
Message-Id: <1562888553-56327-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] kernel-fitimage: Use compressed ramdisks in FIT images if available
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Jul 2019 23:43:24 -0000

This is an adaptation of the following commit from upstream OE-Core:
https://git.openembedded.org/openembedded-core/commit/?id=842ad404b36e00c89f615a3f7db4a2d30062effa

Previously, it was calling copy_initramfs from kernel.bbclass, which would
decompress the ramdisk. To make sure we use as little space as possible, we
used to re-compress it into XZ. Now it just uses the original format of the
ramdisk, either uncompressed or in any of the supported compression methods.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/kernel-fitimage.bbclass | 41 +++++++++++++++++------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/meta-arago-distro/classes/kernel-fitimage.bbclass b/meta-arago-distro/classes/kernel-fitimage.bbclass
index e58652b..e73c916 100644
--- a/meta-arago-distro/classes/kernel-fitimage.bbclass
+++ b/meta-arago-distro/classes/kernel-fitimage.bbclass
@@ -6,10 +6,6 @@ FITIMAGE_DTB_BY_NAME ?= "0"
 FITIMAGE_TEE_BY_NAME ?= "0"
 FITIMAGE_CONF_BY_NAME ?= "0"
 
-XZ_COMPRESSION_LEVEL ?= "-e -6"
-XZ_INTEGRITY_CHECK ?= "crc32"
-XZ_THREADS ?= "-T 0"
-
 python __anonymous () {
     kerneltypes = d.getVar('KERNEL_IMAGETYPES') or ""
     if 'fitImage' in kerneltypes.split():
@@ -255,6 +251,25 @@ EOF
 fitimage_emit_section_ramdisk() {
 
 	ramdisk_csum=${FITIMAGE_HASH_ALGO}
+	ramdisk_ctype="none"
+
+	case $3 in
+		*.gz|*.gz.sec)
+			ramdisk_ctype="gzip"
+			;;
+		*.bz2|*.bz2.sec)
+			ramdisk_ctype="bzip2"
+			;;
+		*.lzma|*.lzma.sec)
+			ramdisk_ctype="lzma"
+			;;
+		*.lzo|*.lzo.sec)
+			ramdisk_ctype="lzo"
+			;;
+		*.lz4|*.lz4.sec)
+			ramdisk_ctype="lz4"
+			;;
+	esac
 
 	cat << EOF >> ${1}
                 ramdisk@${2} {
@@ -263,7 +278,7 @@ fitimage_emit_section_ramdisk() {
                         type = "ramdisk";
                         arch = "${UBOOT_ARCH}";
                         os = "linux";
-                        compression = "none";
+                        compression = "${ramdisk_ctype}";
 EOF
 	if test -n "${UBOOT_RD_LOADADDRESS}"; then
 		cat << EOF >> ${1}
@@ -573,11 +588,17 @@ fitimage_assemble() {
 	# Step 4: Prepare a ramdisk section.
 	#
 	if [ "x${ramdiskcount}" = "x1" ] ; then
-		copy_initramfs
-		RAMDISK_FILE="usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio"
-		xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${RAMDISK_FILE} > ${RAMDISK_FILE}.xz
-		fitimage_ti_secure ${RAMDISK_FILE}.xz ${RAMDISK_FILE}.xz.sec
-		fitimage_emit_section_ramdisk ${1} "${ramdiskcount}" ${RAMDISK_FILE}.xz.sec
+		# Find and use the first initramfs image archive type we find
+		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz cpio; do
+			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.${img}"
+			initramfs_local="usr/${INITRAMFS_IMAGE}-${MACHINE}.${img}"
+			echo "Using $initramfs_path"
+			if [ -e "${initramfs_path}" ]; then
+				fitimage_ti_secure ${initramfs_path} ${initramfs_local}.sec
+				fitimage_emit_section_ramdisk ${1} "${ramdiskcount}" ${initramfs_local}.sec
+				break
+			fi
+		done
 	fi
 
 	fitimage_emit_section_maint ${1} sectend
-- 
2.7.4


