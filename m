Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 508D3529A3
	for <meta-arago@arago-project.org>;
	Fri, 30 Sep 2016 00:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A515C208F7;
	Fri, 30 Sep 2016 00:14:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 55mR_4pi75pH; Fri, 30 Sep 2016 00:14:40 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-110-130.washdc.fios.verizon.net
	[100.15.110.130])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 859C120068;
	Fri, 30 Sep 2016 00:14:39 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 11B5C162141;
	Thu, 29 Sep 2016 20:14:39 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 29 Sep 2016 20:14:38 -0400
Message-Id: <1475194478-29809-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] kernel-fitimage: move ramdisk section right after kernel to fix u-boot loading
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
X-List-Received-Date: Fri, 30 Sep 2016 00:14:41 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/kernel-fitimage.bbclass | 32 +++++++++++------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta-arago-distro/classes/kernel-fitimage.bbclass b/meta-arago-distro/classes/kernel-fitimage.bbclass
index 23b162b..d9b9ff8 100644
--- a/meta-arago-distro/classes/kernel-fitimage.bbclass
+++ b/meta-arago-distro/classes/kernel-fitimage.bbclass
@@ -473,7 +473,18 @@ fitimage_assemble() {
 	fitimage_emit_section_kernel ${1} "${kernelcount}" linux.bin.sec "${linux_comp}"
 
 	#
-	# Step 2: Prepare a DTB image section
+	# Step 2: Prepare a ramdisk section.
+	#
+	if [ "x${ramdiskcount}" = "x1" ] ; then
+		copy_initramfs
+		RAMDISK_FILE="usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio"
+		xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${RAMDISK_FILE} > ${RAMDISK_FILE}.xz
+		fitimage_ti_secure ${RAMDISK_FILE}.xz ${RAMDISK_FILE}.xz.sec
+		fitimage_emit_section_ramdisk ${1} "${ramdiskcount}" ${RAMDISK_FILE}.xz.sec
+	fi
+
+	#
+	# Step 3: Prepare a DTB image section
 	#
 	if test -n "${KERNEL_DEVICETREE}"; then
 		dtbcount=1
@@ -500,7 +511,7 @@ fitimage_assemble() {
 	fi
 
 	#
-	# Step 2a: Prepare OP/TEE image section
+	# Step 4: Prepare OP/TEE image section
 	#
 	if test -n "${FITIMAGE_TEE}"; then
 		mkdir -p ${B}/usr
@@ -525,24 +536,13 @@ fitimage_assemble() {
 	fi
 
 	#
-	# Step 3: Prepare a setup section. (For x86)
+	# Step 5: Prepare a setup section. (For x86)
 	#
 	if test -e arch/${ARCH}/boot/setup.bin ; then
 		setupcount=1
 		fitimage_emit_section_setup ${1} "${setupcount}" arch/${ARCH}/boot/setup.bin
 	fi
 
-	#
-	# Step 4: Prepare a ramdisk section.
-	#
-	if [ "x${ramdiskcount}" = "x1" ] ; then
-		copy_initramfs
-		RAMDISK_FILE="usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio"
-		xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${RAMDISK_FILE} > ${RAMDISK_FILE}.xz
-		fitimage_ti_secure ${RAMDISK_FILE}.xz ${RAMDISK_FILE}.xz.sec
-		fitimage_emit_section_ramdisk ${1} "${ramdiskcount}" ${RAMDISK_FILE}.xz.sec
-	fi
-
 	fitimage_emit_section_maint ${1} sectend
 
 	# Force the first Kernel and DTB in the default config
@@ -552,7 +552,7 @@ fitimage_assemble() {
 	fi
 
 	#
-	# Step 5: Prepare a configurations section
+	# Step 6: Prepare a configurations section
 	#
 	fitimage_emit_section_maint ${1} confstart
 
@@ -567,7 +567,7 @@ fitimage_assemble() {
 	fitimage_emit_section_maint ${1} fitend
 
 	#
-	# Step 6: Assemble the image
+	# Step 7: Assemble the image
 	#
 	uboot-mkimage \
 		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
-- 
2.7.4


