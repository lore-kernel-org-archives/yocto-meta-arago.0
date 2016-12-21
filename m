Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id E968652AD4
	for <meta-arago@arago-project.org>;
	Wed, 21 Dec 2016 20:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0B90320B30;
	Wed, 21 Dec 2016 20:53:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id sxg7UPJbwryA; Wed, 21 Dec 2016 20:53:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DAEDD208B1;
	Wed, 21 Dec 2016 20:53:23 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 44C9A1621E2;
	Wed, 21 Dec 2016 15:53:23 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 21 Dec 2016 15:53:19 -0500
Message-Id: <1482353600-445-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [krogoth][PATCH 1/2] linux-dtb: overlay locally to fix broken DTB symlinks
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
X-List-Received-Date: Wed, 21 Dec 2016 20:53:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-kernel/linux/linux-dtb.inc             | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-dtb.inc

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-dtb.inc b/meta-arago-distro/recipes-kernel/linux/linux-dtb.inc
new file mode 100644
index 0000000..651a19e
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-dtb.inc
@@ -0,0 +1,74 @@
+# Support for device tree generation
+FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/devicetree*"
+
+python __anonymous () {
+    d.appendVar("PACKAGES", " kernel-devicetree")
+}
+
+normalize_dtb () {
+	DTB="$1"
+	if echo ${DTB} | grep -q '/dts/'; then
+		bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
+		DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
+	fi
+	echo "${DTB}"
+}
+
+get_real_dtb_path_in_kernel () {
+	DTB="$1"
+	DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
+	if [ ! -e "${DTB_PATH}" ]; then
+		DTB_PATH="${B}/arch/${ARCH}/boot/${DTB}"
+	fi
+	echo "${DTB_PATH}"
+}
+
+do_compile_append() {
+	for DTB in ${KERNEL_DEVICETREE}; do
+		DTB=`normalize_dtb "${DTB}"`
+		oe_runmake ${DTB}
+	done
+}
+
+do_install_append() {
+	for DTB in ${KERNEL_DEVICETREE}; do
+		DTB=`normalize_dtb "${DTB}"`
+		DTB_BASE_NAME=`basename ${DTB} .dtb`
+		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+		DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
+		install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
+	done
+}
+
+do_deploy_append() {
+	for DTB in ${KERNEL_DEVICETREE}; do
+		DTB=`normalize_dtb "${DTB}"`
+		DTB_BASE_NAME=`basename ${DTB} .dtb`
+		DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+		DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
+		install -d ${DEPLOYDIR}
+		install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.dtb
+		ln -sf ${DTB_NAME}.dtb ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.dtb
+	done
+}
+
+pkg_postinst_kernel-devicetree () {
+	cd /${KERNEL_IMAGEDEST}
+	for DTB in ${KERNEL_DEVICETREE}
+	do
+		DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
+		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+		update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
+	done
+}
+
+pkg_postrm_kernel-devicetree () {
+	cd /${KERNEL_IMAGEDEST}
+	for DTB in ${KERNEL_DEVICETREE}
+	do
+		DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
+		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+		update-alternatives --remove ${DTB_BASE_NAME}.dtb /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
+	done
+}
-- 
2.7.4


