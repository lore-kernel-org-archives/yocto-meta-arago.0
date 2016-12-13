Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 1BD2852A7C
	for <meta-arago@arago-project.org>;
	Tue, 13 Dec 2016 22:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E1A3D20A37;
	Tue, 13 Dec 2016 22:45:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id hEvlOucfZ8v4; Tue, 13 Dec 2016 22:45:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C3026204AF;
	Tue, 13 Dec 2016 22:45:14 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 198DF1621D6;
	Tue, 13 Dec 2016 17:45:14 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 13 Dec 2016 17:45:13 -0500
Message-Id: <1481669113-4767-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] kernel-fitimage: rework decoupling of dtb/tee mapping, fix missing tee image
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
X-List-Received-Date: Tue, 13 Dec 2016 22:45:16 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/kernel-fitimage.bbclass | 59 +++++++++++------------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/meta-arago-distro/classes/kernel-fitimage.bbclass b/meta-arago-distro/classes/kernel-fitimage.bbclass
index 4810dc0..16cb2bf 100644
--- a/meta-arago-distro/classes/kernel-fitimage.bbclass
+++ b/meta-arago-distro/classes/kernel-fitimage.bbclass
@@ -289,6 +289,7 @@ EOF
 # $3 ... DTB image ID/name
 # $4 ... ramdisk ID
 # $5 ... config ID
+# $6 ... tee ID/name
 fitimage_emit_section_config() {
 
 	conf_csum=${FITIMAGE_HASH_ALGO}
@@ -317,6 +318,14 @@ fitimage_emit_section_config() {
 		setup_line="setup = \"setup@${5}\";"
 	fi
 
+	if [ -n "${6}" -a -n "${OPTEEFLAVOR}" ]; then
+		loadables_line="loadables = \"${6}\";"
+		final_conf_desc="${conf_desc}, OPTEE OS Image"
+	else
+		loadables_line=""
+		final_conf_desc="${conf_desc}"
+	fi
+
 	dtbcount=1
 	for DTB in ${KERNEL_DEVICETREE}; do
 
@@ -332,14 +341,6 @@ fitimage_emit_section_config() {
 EOF
 		fi
 
-		if test -n "${OPTEEFLAVOR}"; then
-			loadables_line="loadables = \"${OPTEEFLAVOR}.optee\";"
-			final_conf_desc="${conf_desc}, OPTEE OS Image"
-		else
-			loadables_line=""
-			final_conf_desc="${conf_desc}"
-		fi
-
 			cat << EOF >> ${1}
                 ${conf_name} {
                         description = "${final_conf_desc}";
@@ -404,6 +405,7 @@ fitimage_assemble() {
 	dtbcount=""
 	ramdiskcount=${3}
 	setupcount=""
+	teecount=1
 	rm -f ${1} arch/${ARCH}/boot/${2}
 
 	fitimage_emit_fit_header ${1}
@@ -447,26 +449,19 @@ fitimage_assemble() {
 	#
 	# Step 2a: Prepare OP/TEE image section
 	#
-	if test -n "${FITIMAGE_TEE}"; then
+	if test -n "${OPTEEFLAVOR}"; then
 		mkdir -p ${B}/usr
-		teecount=1
-		for TEE in ${FITIMAGE_TEE}; do
-			rm -f ${B}/usr/${TEE}
-			if [ -e "${DEPLOY_DIR_IMAGE}/${TEE}" ]; then
-				cp ${DEPLOY_DIR_IMAGE}/${TEE} ${B}/usr/.
-			fi
-			TEE_PATH="usr/${TEE}"
-			fitimage_ti_secure ${TEE_PATH} ${TEE_PATH}.sec
-			if [ "x${FITIMAGE_TEE_BY_NAME}" = "x1" ] ; then
-				fitimage_emit_section_tee ${1} ${TEE} ${TEE_PATH}.sec
-			else
-				fitimage_emit_section_tee ${1} "tee@${teecount}" ${TEE_PATH}.sec
-			fi
-			if [ "x${teecount}" = "x1" ]; then
-				teeref=${TEE}
-			fi
-			teecount=`expr ${teecount} + 1`
-		done
+		rm -f ${B}/usr/${OPTEEFLAVOR}
+		if [ -e "${DEPLOY_DIR_IMAGE}/${OPTEEFLAVOR}" ]; then
+			cp ${DEPLOY_DIR_IMAGE}/${OPTEEFLAVOR} ${B}/usr/.
+		fi
+		TEE_PATH="usr/${OPTEEFLAVOR}"
+		fitimage_ti_secure ${TEE_PATH} ${TEE_PATH}.sec
+		if [ "x${FITIMAGE_TEE_BY_NAME}" = "x1" ] ; then
+			fitimage_emit_section_tee ${1} ${OPTEEFLAVOR}.optee ${TEE_PATH}.sec
+		else
+			fitimage_emit_section_tee ${1} "tee@${teecount}" ${TEE_PATH}.sec
+		fi
 	fi
 
 	#
@@ -501,11 +496,15 @@ fitimage_assemble() {
 	#
 	fitimage_emit_section_maint ${1} confstart
 
-	if [ "x${FITIMAGE_DTB_BY_NAME}" = "x1" ] ; then
-		fitimage_emit_section_config ${1} "${kernelcount}" "${dtbref}" "${ramdiskcount}" "${setupcount}"
+	if [ "x${FITIMAGE_DTB_BY_NAME}" != "x1" ] ; then
+		dtbref="fdt@${dtbcount}"
+	fi
+	if [ "x${FITIMAGE_TEE_BY_NAME}" = "x1" ] ; then
+		teeref="${OPTEEFLAVOR}.optee"
 	else
-		fitimage_emit_section_config ${1} "${kernelcount}" "fdt@${dtbcount}" "${ramdiskcount}" "${setupcount}"
+		teeref="tee@${teecount}"
 	fi
+	fitimage_emit_section_config ${1} "${kernelcount}" "${dtbref}" "${ramdiskcount}" "${setupcount}" "${teeref}"
 
 	fitimage_emit_section_maint ${1} sectend
 
-- 
2.7.4


