Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id CC52E520E2
	for <meta-arago@arago-project.org>;
	Thu, 12 Sep 2019 15:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E113540C0A;
	Thu, 12 Sep 2019 15:38:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ANn3wlxUFZu4; Thu, 12 Sep 2019 15:38:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C5C8C40BFA;
	Thu, 12 Sep 2019 15:38:45 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 94338173CBE;
	Thu, 12 Sep 2019 11:38:43 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Sep 2019 11:38:09 -0400
Message-Id: <1568302717-46518-5-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568302717-46518-1-git-send-email-denys@ti.com>
References: <1568302717-46518-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 04/32] uboot-sign: sync up with upstream
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
X-List-Received-Date: Thu, 12 Sep 2019 15:39:55 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/uboot-sign.bbclass | 126 +++++++++++++++++----------
 1 file changed, 81 insertions(+), 45 deletions(-)

diff --git a/meta-arago-distro/classes/uboot-sign.bbclass b/meta-arago-distro/classes/uboot-sign.bbclass
index dbe2933..982ed46 100644
--- a/meta-arago-distro/classes/uboot-sign.bbclass
+++ b/meta-arago-distro/classes/uboot-sign.bbclass
@@ -19,13 +19,17 @@
 # The tasks sequence is set as below, using DEPLOY_IMAGE_DIR as common place to
 # treat the device tree blob:
 #
-#   u-boot:do_deploy_dtb
-#   u-boot:do_deploy
-#   virtual/kernel:do_assemble_fitimage
-#   u-boot:do_concat_dtb
-#   u-boot:do_install
+# * u-boot:do_install_append
+#   Install UBOOT_DTB_BINARY to datadir, so that kernel can use it for
+#   signing, and kernel will deploy UBOOT_DTB_BINARY after signs it.
 #
-# For more details on signature process, please refer to U-boot documentation.
+# * virtual/kernel:do_assemble_fitimage
+#   Sign the image
+#
+# * u-boot:do_deploy[postfuncs]
+#   Deploy files like UBOOT_DTB_IMAGE, UBOOT_DTB_SYMLINK and others.
+#
+# For more details on signature process, please refer to U-Boot documentation.
 
 # Signature activation.
 UBOOT_SIGN_ENABLE ?= "0"
@@ -38,58 +42,90 @@ UBOOT_NODTB_IMAGE ?= "u-boot-nodtb-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
 UBOOT_NODTB_BINARY ?= "u-boot-nodtb.${UBOOT_SUFFIX}"
 UBOOT_NODTB_SYMLINK ?= "u-boot-nodtb-${MACHINE}.${UBOOT_SUFFIX}"
 
-#
-# Following is relevant only for u-boot recipes:
-#
-
-do_deploy_dtb () {
-	mkdir -p ${DEPLOYDIR}
-	cd ${DEPLOYDIR}
+# Functions in this bbclass is for u-boot only
+UBOOT_PN = "${@d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'}"
 
-	if [ -f ${B}/${UBOOT_DTB_BINARY} ]; then
-		install ${B}/${UBOOT_DTB_BINARY} ${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
-		rm -f ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SYMLINK}
-		ln -sf ${UBOOT_DTB_IMAGE} ${UBOOT_DTB_SYMLINK}
-		ln -sf ${UBOOT_DTB_IMAGE} ${UBOOT_DTB_BINARY}
+concat_dtb_helper() {
+	if [ -e "${UBOOT_DTB_BINARY}" ]; then
+		ln -sf ${UBOOT_DTB_IMAGE} ${DEPLOYDIR}/${UBOOT_DTB_BINARY}
+		ln -sf ${UBOOT_DTB_IMAGE} ${DEPLOYDIR}/${UBOOT_DTB_SYMLINK}
 	fi
-	if [ -f ${B}/${UBOOT_NODTB_BINARY} ]; then
-		install ${B}/${UBOOT_NODTB_BINARY} ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}
-		rm -f ${UBOOT_NODTB_BINARY} ${UBOOT_NODTB_SYMLINK}
-		ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_SYMLINK}
-		ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_BINARY}
+
+	if [ -f "${UBOOT_NODTB_BINARY}" ]; then
+		install ${UBOOT_NODTB_BINARY} ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}
+		ln -sf ${UBOOT_NODTB_IMAGE} ${DEPLOYDIR}/${UBOOT_NODTB_SYMLINK}
+		ln -sf ${UBOOT_NODTB_IMAGE} ${DEPLOYDIR}/${UBOOT_NODTB_BINARY}
 	fi
-}
 
-do_concat_dtb () {
 	# Concatenate U-Boot w/o DTB & DTB with public key
 	# (cf. kernel-fitimage.bbclass for more details)
-	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ]; then
-		if [ "x${UBOOT_SUFFIX}" = "ximg" -o "x${UBOOT_SUFFIX}" = "xrom" ] && \
-			[ -e "${DEPLOYDIR}/${UBOOT_DTB_IMAGE}" ]; then
+	deployed_uboot_dtb_binary='${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE}'
+	if [ "x${UBOOT_SUFFIX}" = "ximg" -o "x${UBOOT_SUFFIX}" = "xrom" ] && \
+		[ -e "$deployed_uboot_dtb_binary" ]; then
+		oe_runmake EXT_DTB=$deployed_uboot_dtb_binary
+		install ${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+	elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e "$deployed_uboot_dtb_binary" ]; then
+		cd ${DEPLOYDIR}
+		cat ${UBOOT_NODTB_IMAGE} $deployed_uboot_dtb_binary | tee ${B}/${CONFIG_B_PATH}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
+	else
+		bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
+	fi
+}
+
+concat_dtb() {
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${PN}" = "${UBOOT_PN}" -a -n "${UBOOT_DTB_BINARY}" ]; then
+		mkdir -p ${DEPLOYDIR}
+		if [ -n "${UBOOT_CONFIG}" ]; then
+			for config in ${UBOOT_MACHINE}; do
+				CONFIG_B_PATH="${config}"
+				cd ${B}/${config}
+				concat_dtb_helper
+			done
+		else
+			CONFIG_B_PATH=""
 			cd ${B}
-			oe_runmake EXT_DTB=${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
-			install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
-			install ${S}/${UBOOT_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_IMAGE}
-		elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e "${DEPLOYDIR}/${UBOOT_DTB_IMAGE}" ]; then
-			cd ${DEPLOYDIR}
-			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} | tee ${B}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
+			concat_dtb_helper
+		fi
+	fi
+}
+
+# Install UBOOT_DTB_BINARY to datadir, so that kernel can use it for
+# signing, and kernel will deploy UBOOT_DTB_BINARY after signs it.
+install_helper() {
+	if [ -f "${UBOOT_DTB_BINARY}" ]; then
+		install -d ${D}${datadir}
+		# UBOOT_DTB_BINARY is a symlink to UBOOT_DTB_IMAGE, so we
+		# need both of them.
+		install ${UBOOT_DTB_BINARY} ${D}${datadir}/${UBOOT_DTB_IMAGE}
+		ln -sf ${UBOOT_DTB_IMAGE} ${D}${datadir}/${UBOOT_DTB_BINARY}
+	else
+		bbwarn "${UBOOT_DTB_BINARY} not found"
+	fi
+}
+
+do_install_append() {
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${PN}" = "${UBOOT_PN}" -a -n "${UBOOT_DTB_BINARY}" ]; then
+		if [ -n "${UBOOT_CONFIG}" ]; then
+			for config in ${UBOOT_MACHINE}; do
+				cd ${B}/${config}
+				install_helper
+			done
 		else
-			bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
+			cd ${B}
+			install_helper
 		fi
 	fi
 }
 
 python () {
-	uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
-	if d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') == uboot_pn:
-		kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel')
+    if d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') == d.getVar('UBOOT_PN') and d.getVar('UBOOT_DTB_BINARY'):
+        kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel')
 
-		# u-boot.dtb and u-boot-nodtb.bin are deployed _before_ do_deploy
-		# Thus, do_deploy_setscene will also populate them in DEPLOY_IMAGE_DIR
-		bb.build.addtask('do_deploy_dtb', 'do_deploy', 'do_compile', d)
+        # Make "bitbake u-boot -cdeploy" deploys the signed u-boot.dtb
+        d.appendVarFlag('do_deploy', 'depends', ' %s:do_deploy' % kernel_pn)
 
-		# do_concat_dtb is scheduled _before_ do_install as it overwrite the
-		# u-boot.bin in both DEPLOYDIR and DEPLOY_IMAGE_DIR.
-		bb.build.addtask('do_concat_dtb', 'do_install', None, d)
-		d.appendVarFlag('do_concat_dtb', 'depends', ' %s:do_assemble_fitimage' % kernel_pn)
+        # kernerl's do_deploy is a litle special, so we can't use
+        # do_deploy_append, otherwise it would override
+        # kernel_do_deploy.
+        d.appendVarFlag('do_deploy', 'prefuncs', ' concat_dtb')
 }
-- 
2.7.4


