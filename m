Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id B119252987
	for <meta-arago@arago-project.org>;
	Tue, 27 Sep 2016 20:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C6A5820928;
	Tue, 27 Sep 2016 20:38:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gMsiNF9anDLA; Tue, 27 Sep 2016 20:38:02 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-110-130.washdc.fios.verizon.net
	[100.15.110.130])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A138C202B9;
	Tue, 27 Sep 2016 20:38:01 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 48FD216214B;
	Tue, 27 Sep 2016 16:38:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 27 Sep 2016 16:38:00 -0400
Message-Id: <1475008680-24729-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] kernel-fitimage, arago.conf: package OPTEE OS image files into FIT
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
X-List-Received-Date: Tue, 27 Sep 2016 20:38:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/kernel-fitimage.bbclass | 193 +++++++++++++++++++---
 meta-arago-distro/conf/distro/arago.conf          |   4 +
 2 files changed, 171 insertions(+), 26 deletions(-)

diff --git a/meta-arago-distro/classes/kernel-fitimage.bbclass b/meta-arago-distro/classes/kernel-fitimage.bbclass
index a294fa0..23b162b 100644
--- a/meta-arago-distro/classes/kernel-fitimage.bbclass
+++ b/meta-arago-distro/classes/kernel-fitimage.bbclass
@@ -2,6 +2,8 @@ inherit kernel-uboot uboot-sign
 
 FITIMAGE_HASH_ALGO ?= "sha1"
 FITIMAGE_DTB_BY_NAME ?= "0"
+FITIMAGE_TEE_BY_NAME ?= "0"
+FITIMAGE_CONF_BY_NAME ?= "0"
 
 XZ_COMPRESSION_LEVEL ?= "-e -6"
 XZ_INTEGRITY_CHECK ?= "crc32"
@@ -36,6 +38,9 @@ python __anonymous () {
         if d.getVar('UBOOT_SIGN_ENABLE', True):
             uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot', True) or 'u-boot'
             d.appendVarFlag('do_assemble_fitimage', 'depends', ' %s:do_deploy' % uboot_pn)
+
+        if d.getVar('FITIMAGE_OPTEE', True):
+            d.appendVarFlag('do_assemble_fitimage', 'depends', ' optee-os:do_deploy')
 }
 
 # Options for the device tree compiler passed to mkimage '-D' feature:
@@ -89,7 +94,7 @@ EOF
 	;;
 	sectend)
 		cat << EOF >> ${1}
-	};
+        };
 EOF
 	;;
 	fitend)
@@ -171,6 +176,36 @@ EOF
 }
 
 #
+# Emit the fitImage ITS TEE section
+#
+# $1 ... .its filename
+# $2 ... Image counter/name
+# $3 ... Path to TEE image
+fitimage_emit_section_tee() {
+
+	tee_csum=${FITIMAGE_HASH_ALGO}
+
+	cat << EOF >> ${1}
+                ${2} {
+                        description = "OPTEE OS Image";
+                        data = /incbin/("${3}");
+                        type = "tee";
+                        arch = "${UBOOT_ARCH}";
+                        compression = "none";
+EOF
+	if test -n "${FITIMAGE_HASH_ALGO}"; then
+		cat << EOF >> ${1}
+                        hash@1 {
+                                algo = "${tee_csum}";
+                        };
+EOF
+	fi
+	cat << EOF >> ${1}
+                };
+EOF
+}
+
+#
 # Emit the fitImage ITS setup section
 #
 # $1 ... .its filename
@@ -262,7 +297,11 @@ fitimage_emit_section_config() {
 	fi
 
 	# Test if we have any DTBs at all
-	conf_desc="Linux kernel"
+	if test -n "${FITIMAGE_TEE}"; then
+		conf_desc="Linux kernel, OPTEE OS Image"
+	else
+		conf_desc="Linux kernel"
+	fi
 	kernel_line="kernel = \"kernel@${2}\";"
 	fdt_line=""
 	ramdisk_line=""
@@ -282,54 +321,131 @@ fitimage_emit_section_config() {
 		setup_line="setup = \"setup@${5}\";"
 	fi
 
-	cat << EOF >> ${1}
-                default = "conf@1";
-                conf@1 {
+	if test -n "${FITIMAGE_TEE}"; then
+		teecount=1
+		for TEE in ${FITIMAGE_TEE}; do
+			DTB=`basename ${TEE} | sed 's,\.optee$,.dtb,g'`
+
+			if [ "x${FITIMAGE_CONF_BY_NAME}" = "x1" ] ; then
+				conf_name="${DTB}"
+			else
+				conf_name="conf@${teecount}"
+			fi
+
+			if [ "x${teecount}" = "x1" ]; then
+				cat << EOF >> ${1}
+                default = "${conf_name}";
+EOF
+			fi
+
+			cat << EOF >> ${1}
+                ${conf_name} {
                         description = "${conf_desc}";
-			${kernel_line}
-			${fdt_line}
-			${ramdisk_line}
-			${setup_line}
+                        ${kernel_line}
+                        fdt = "${DTB}";
+                        ${ramdisk_line}
+                        ${setup_line}
+                        loadables = "${TEE}";
 EOF
 
-	if test -n "${FITIMAGE_HASH_ALGO}"; then
-		cat << EOF >> ${1}
+			if test -n "${FITIMAGE_HASH_ALGO}"; then
+				cat << EOF >> ${1}
                         hash@1 {
                                 algo = "${conf_csum}";
                         };
 EOF
-	fi
+			fi
 
-	if [ ! -z "${conf_sign_keyname}" ] ; then
+			if [ ! -z "${conf_sign_keyname}" ] ; then
 
-		sign_line="sign-images = \"kernel\""
+				sign_line="sign-images = \"kernel\""
 
-		if [ -n "${3}" ]; then
-			sign_line="${sign_line}, \"fdt\""
-		fi
+				if [ -n "${3}" ]; then
+					sign_line="${sign_line}, \"fdt\""
+				fi
+
+				if [ -n "${4}" ]; then
+					sign_line="${sign_line}, \"ramdisk\""
+				fi
+
+				if [ -n "${5}" ]; then
+					sign_line="${sign_line}, \"setup\""
+				fi
+
+				sign_line="${sign_line};"
+
+				cat << EOF >> ${1}
+                        signature@1 {
+                                algo = "${conf_csum},rsa2048";
+                                key-name-hint = "${conf_sign_keyname}";
+                                ${sign_line}
+                        };
+EOF
+			fi
+
+			cat << EOF >> ${1}
+                };
+EOF
+
+			teecount=`expr ${teecount} + 1`
+		done
+	else
 
-		if [ -n "${4}" ]; then
-			sign_line="${sign_line}, \"ramdisk\""
+		if [ "x${FITIMAGE_CONF_BY_NAME}" = "x1" ] ; then
+			conf_name="${3}"
+		else
+			conf_name="conf@$1"
 		fi
 
-		if [ -n "${5}" ]; then
-			sign_line="${sign_line}, \"setup\""
+		cat << EOF >> ${1}
+                default = "${conf_name}";
+                ${conf_name} {
+                        description = "${conf_desc}";
+                        ${kernel_line}
+                        ${fdt_line}
+                        ${ramdisk_line}
+                        ${setup_line}
+EOF
+
+		if test -n "${FITIMAGE_HASH_ALGO}"; then
+			cat << EOF >> ${1}
+                        hash@1 {
+                                algo = "${conf_csum}";
+                        };
+EOF
 		fi
 
-		sign_line="${sign_line};"
+		if [ ! -z "${conf_sign_keyname}" ] ; then
 
-		cat << EOF >> ${1}
+			sign_line="sign-images = \"kernel\""
+
+			if [ -n "${3}" ]; then
+				sign_line="${sign_line}, \"fdt\""
+			fi
+
+			if [ -n "${4}" ]; then
+				sign_line="${sign_line}, \"ramdisk\""
+			fi
+
+			if [ -n "${5}" ]; then
+				sign_line="${sign_line}, \"setup\""
+			fi
+
+			sign_line="${sign_line};"
+
+			cat << EOF >> ${1}
                         signature@1 {
                                 algo = "${conf_csum},rsa2048";
                                 key-name-hint = "${conf_sign_keyname}";
-				${sign_line}
+                                ${sign_line}
                         };
 EOF
-	fi
+		fi
 
-	cat << EOF >> ${1}
+		cat << EOF >> ${1}
                 };
 EOF
+	fi
 }
 
 #
@@ -384,6 +500,31 @@ fitimage_assemble() {
 	fi
 
 	#
+	# Step 2a: Prepare OP/TEE image section
+	#
+	if test -n "${FITIMAGE_TEE}"; then
+		mkdir -p ${B}/usr
+		teecount=1
+		for TEE in ${FITIMAGE_TEE}; do
+			rm -f ${B}/usr/${TEE}
+			if [ -e "${DEPLOY_DIR_IMAGE}/${TEE}" ]; then
+				cp ${DEPLOY_DIR_IMAGE}/${TEE} ${B}/usr/.
+			fi
+			TEE_PATH="usr/${TEE}"
+			fitimage_ti_secure ${TEE_PATH} ${TEE_PATH}.sec
+			if [ "x${FITIMAGE_TEE_BY_NAME}" = "x1" ] ; then
+				fitimage_emit_section_tee ${1} ${TEE} ${TEE_PATH}.sec
+			else
+				fitimage_emit_section_tee ${1} "tee@${teecount}" ${TEE_PATH}.sec
+			fi
+			if [ "x${teecount}" = "x1" ]; then
+				teeref=${TEE}
+			fi
+			teecount=`expr ${teecount} + 1`
+		done
+	fi
+
+	#
 	# Step 3: Prepare a setup section. (For x86)
 	#
 	if test -e arch/${ARCH}/boot/setup.bin ; then
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index db6f119..c44857e 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -26,14 +26,18 @@ IMAGE_FSTYPES += "tar.xz.md5"
 KERNEL_CLASSES = "kernel-fitimage"
 FITIMAGE_HASH_ALGO = ""
 FITIMAGE_DTB_BY_NAME = "1"
+FITIMAGE_TEE_BY_NAME = "1"
+FITIMAGE_CONF_BY_NAME = "1"
 
 KERNEL_IMAGETYPES_dra7xx-hs-evm = "zImage fitImage"
 INITRAMFS_IMAGE_dra7xx-hs-evm = "arago-base-tisdk-image"
 INITRAMFS_FSTYPES_dra7xx-hs-evm = "cpio.xz"
+FITIMAGE_TEE_dra7xx-hs-evm = "dra7-evm.optee dra72-evm-revc.optee"
 
 KERNEL_IMAGETYPES_am57xx-hs-evm = "zImage fitImage"
 INITRAMFS_IMAGE_am57xx-hs-evm = "arago-base-tisdk-image"
 INITRAMFS_FSTYPES_am57xx-hs-evm = "cpio.xz"
+FITIMAGE_TEE_am57xx-hs-evm = "am57xx-evm.optee"
 
 KERNEL_IMAGETYPES_am437x-hs-evm = "zImage fitImage"
 INITRAMFS_IMAGE_am437x-hs-evm = "arago-base-tisdk-image"
-- 
2.7.4


