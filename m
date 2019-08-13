Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id E883352987
	for <meta-arago@arago-project.org>;
	Tue, 13 Aug 2019 22:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AB59340BD4;
	Tue, 13 Aug 2019 22:56:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 5d6bb-Sn7f1L; Tue, 13 Aug 2019 22:56:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9071D40B66;
	Tue, 13 Aug 2019 22:56:05 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 43960172A53;
	Tue, 13 Aug 2019 18:56:05 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 13 Aug 2019 18:56:04 -0400
Message-Id: <1565736964-34165-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] fitimage: add load address for DTB/DTBO, clean DTBO config properties
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
X-List-Received-Date: Tue, 13 Aug 2019 22:57:04 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/kernel-fitimage.bbclass | 65 ++++++++++++++++++-----
 1 file changed, 51 insertions(+), 14 deletions(-)

diff --git a/meta-arago-distro/classes/kernel-fitimage.bbclass b/meta-arago-distro/classes/kernel-fitimage.bbclass
index e73c916..516e7fc 100644
--- a/meta-arago-distro/classes/kernel-fitimage.bbclass
+++ b/meta-arago-distro/classes/kernel-fitimage.bbclass
@@ -120,7 +120,7 @@ fitimage_emit_section_kernel() {
 
 	kernel_csum=${FITIMAGE_HASH_ALGO}
 
-	ENTRYPOINT=${UBOOT_ENTRYPOINT}
+	ENTRYPOINT="${UBOOT_ENTRYPOINT}"
 	if test -n "${UBOOT_ENTRYSYMBOL}"; then
 		ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
 			awk '$4=="${UBOOT_ENTRYSYMBOL}" {print $2}'`
@@ -155,9 +155,11 @@ EOF
 # $1 ... .its filename
 # $2 ... Image counter/name
 # $3 ... Path to DTB image
+# $4 ... Load address
 fitimage_emit_section_dtb() {
 
 	dtb_csum=${FITIMAGE_HASH_ALGO}
+	dtb_loadline="${4}"
 
 	cat << EOF >> ${1}
                 ${2} {
@@ -166,6 +168,7 @@ fitimage_emit_section_dtb() {
                         type = "flat_dt";
                         arch = "${UBOOT_ARCH}";
                         compression = "none";
+                        ${dtb_loadline}
 EOF
 	if test -n "${FITIMAGE_HASH_ALGO}"; then
 		cat << EOF >> ${1}
@@ -320,22 +323,34 @@ fitimage_emit_section_config() {
 		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
 	fi
 
-	conf_desc="Linux kernel"
-	kernel_line="kernel = \"kernel@${2}\";"
+	sep=""
+	conf_desc=""
+	kernel_line=""
+	fdt_line=""
 	ramdisk_line=""
+	setup_line=""
+	default_line=""
+
+	if [ -n "${2}" ]; then
+		conf_desc="Linux kernel"
+		sep=", "
+		kernel_line="kernel = \"kernel@${2}\";"
+	fi
 
-	# Test if we have any DTBs at all
 	if [ -n "${3}" ]; then
-		conf_desc="${conf_desc}, FDT blob"
+		conf_desc="${conf_desc}${sep}FDT blob"
+		sep=", "
 	fi
 
 	if [ -n "${4}" ]; then
-		conf_desc="${conf_desc}, ramdisk"
+		conf_desc="${conf_desc}${sep}ramdisk"
+		sep=", "
 		ramdisk_line="ramdisk = \"ramdisk@${4}\";"
 	fi
 
 	if [ -n "${5}" ]; then
-		conf_desc="${conf_desc}, setup"
+		conf_desc="${conf_desc}${sep}setup"
+		sep=", "
 		setup_line="setup = \"setup@${5}\";"
 	fi
 
@@ -348,7 +363,7 @@ fitimage_emit_section_config() {
 			nextnum=`expr ${6} + 1`
 			loadables_pager_line="loadables = \"tee@${nextnum}\";"
 		fi
-		final_conf_desc="${conf_desc}, OPTEE OS Image"
+		final_conf_desc="${conf_desc}${sep}OPTEE OS Image"
 	else
 		loadables_line=""
 		loadables_pager_line=""
@@ -358,6 +373,7 @@ fitimage_emit_section_config() {
 	dtbcount=1
 	for DTB in ${KERNEL_DEVICETREE}; do
 		DTB=$(basename "${DTB}")
+		dtb_ext=${DTB##*.}
 		if [ "x${FITIMAGE_CONF_BY_NAME}" = "x1" ] ; then
 			conf_name="${DTB}"
 		else
@@ -380,13 +396,16 @@ EOF
 			cat << EOF >> ${1}
                 ${conf_name} {
                         description = "${final_conf_desc}";
-                        ${kernel_line}
                         ${fdt_line}
+EOF
+			if [ "${dtb_ext}" != "dtbo" ]; then
+			cat << EOF >> ${1}
+                        ${kernel_line}
                         ${ramdisk_line}
                         ${setup_line}
                         ${loadables_line}
 EOF
-
+			fi
 			if test -n "${FITIMAGE_HASH_ALGO}"; then
 				cat << EOF >> ${1}
                         hash@1 {
@@ -438,13 +457,16 @@ EOF
 			cat << EOF >> ${1}
                 ${conf_name} {
                         description = "${final_conf_desc}";
-                        ${kernel_line}
                         ${fdt_line}
+EOF
+			if [ "${dtb_ext}" != "dtbo" ]; then
+			cat << EOF >> ${1}
+                        ${kernel_line}
                         ${ramdisk_line}
                         ${setup_line}
                         ${loadables_pager_line}
 EOF
-
+			fi
 			if test -n "${FITIMAGE_HASH_ALGO}"; then
 				cat << EOF >> ${1}
                         hash@1 {
@@ -520,6 +542,7 @@ fitimage_assemble() {
 	#
 	if test -n "${KERNEL_DEVICETREE}"; then
 		dtbcount=1
+		dtboaddress="${UBOOT_DTBO_LOADADDRESS}"
 		for DTB in ${KERNEL_DEVICETREE}; do
 			if echo ${DTB} | grep -q '/dts/'; then
 				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
@@ -530,11 +553,25 @@ fitimage_assemble() {
 				DTB_PATH="arch/${ARCH}/boot/${DTB}"
 			fi
 			DTB=$(basename "${DTB}")
+
+			dtb_ext=${DTB##*.}
+			if [ "${dtb_ext}" = "dtbo" ]; then
+				if [ -n "${UBOOT_DTBO_LOADADDRESS}" ]; then
+					dtb_loadline="load = <${dtboaddress}>;"
+					num1=`printf "%d\n" ${dtboaddress}`
+					num2=`printf "%d\n" ${UBOOT_DTBO_OFFSET}`
+					num3=`expr $num1 + $num2`
+					dtboaddress=`printf "0x%x\n" $num3`
+				fi
+			elif [ -n "${UBOOT_DTB_LOADADDRESS}" ]; then
+				dtb_loadline="load = <${UBOOT_DTB_LOADADDRESS}>;"
+			fi
+
 			fitimage_ti_secure ${DTB_PATH} ${DTB_PATH}.sec
 			if [ "x${FITIMAGE_DTB_BY_NAME}" = "x1" ] ; then
-				fitimage_emit_section_dtb ${1} ${DTB} ${DTB_PATH}.sec
+				fitimage_emit_section_dtb ${1} ${DTB} ${DTB_PATH}.sec "${dtb_loadline}"
 			else
-				fitimage_emit_section_dtb ${1} "fdt@${dtbcount}" ${DTB_PATH}.sec
+				fitimage_emit_section_dtb ${1} "fdt@${dtbcount}" ${DTB_PATH}.sec "${dtb_loadline}"
 			fi
 			if [ "x${dtbcount}" = "x1" ]; then
 				dtbref=${DTB}
-- 
2.7.4


