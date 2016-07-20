Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id 461BE529A5
	for <meta-arago@arago-project.org>;
	Wed, 20 Jul 2016 14:52:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u6KEqSsc026195
	for <meta-arago@arago-project.org>; Wed, 20 Jul 2016 09:52:28 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6KEqS7M011845
	for <meta-arago@arago-project.org>; Wed, 20 Jul 2016 09:52:28 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 20 Jul 2016 09:52:27 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u6KEqRBO008837;	Wed, 20 Jul 2016 09:52:27 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 20 Jul 2016 10:51:50 -0400
Message-ID: <1469026310-25139-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [RFC] k2-initramfs: create initramfs image from other packages
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
X-List-Received-Date: Wed, 20 Jul 2016 14:52:30 -0000
Content-Type: text/plain

* Previously, the k2-initramfs is provided pre-built.
* This recipe can construct the initramfs image from other packages.
* In addition to constructing the image, this recipe also creates a
  package containing the image so that it may be installed within
  other filesystem images.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/images/k2-initramfs_1.0.0.bb      | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/k2-initramfs_1.0.0.bb

diff --git a/meta-arago-distro/recipes-core/images/k2-initramfs_1.0.0.bb b/meta-arago-distro/recipes-core/images/k2-initramfs_1.0.0.bb
new file mode 100644
index 0000000..d27a89b
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/k2-initramfs_1.0.0.bb
@@ -0,0 +1,89 @@
+DESCRIPTION = "Keystone2 initramfs with SerDes, QMSS and NETCP PA firmware"
+
+LICENSE = "TI-TFL"
+PACKAGES = "${PN}"
+
+PR = "r0"
+
+COMPATIBLE_MACHINE = "keystone"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+
+inherit rootfs_${IMAGE_PKGTYPE}
+
+PACKAGE_INSTALL = " \
+    netcp-pa-fw \
+    serdes-fw \
+    qmss-pdsp-fw \
+"
+
+
+export IMAGE_BASENAME = "k2-fw-initrd"
+export IMAGE_NAME = "${IMAGE_BASENAME}"
+export IMAGE_NAME_SUFFIX = ""
+
+USE_DEVFS = "1"
+
+# adjust task dependencies
+python () {
+    pkgtype = (d.getVar("IMAGE_PKGTYPE", True) or "")
+
+    package_write_task = 'do_package_write_%s' % pkgtype
+
+    # Remove "do_package_write_*" from recrdeps as that will pull in the
+    #  dependency on this recipe's packaging.
+    flags = d.getVarFlag('do_rootfs', 'recrdeptask', True)
+    flags = flags.replace(package_write_task, "")
+    d.setVarFlag('do_rootfs', 'recrdeptask', flags)
+
+    # Add depends on PACKAGE_INSTALL do_package_write_*
+    for p in (d.getVar("PACKAGE_INSTALL", True) or "").split():
+        flags = d.appendVarFlag('do_rootfs', 'depends', ' %s:%s' % (p, package_write_task))
+}
+
+# Do the minimal to create a rootfs
+fakeroot python do_rootfs () {
+    from oe.rootfs import create_rootfs
+    from oe.manifest import create_manifest
+
+    # Generate the initial manifest
+    create_manifest(d)
+
+    # Generate rootfs
+    create_rootfs(d)
+}
+do_rootfs[dirs] = "${TOPDIR}"
+do_rootfs[cleandirs] += "${S}"
+do_rootfs[umask] = "022"
+addtask rootfs before do_install
+
+# Create the cpio.gz image
+do_image() {
+    local image_base_path="${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}"
+
+    cd ${IMAGE_ROOTFS}
+
+    # Only capture the firmwares
+    (echo .; echo ./lib; find ./lib/firmware; ) | cpio -o -H newc >${image_base_path}.cpio
+    gzip -f -9 -c ${image_base_path}.cpio > ${image_base_path}.cpio.gz
+}
+do_image[dirs] = "${TOPDIR}"
+do_image[umask] = "022"
+addtask do_image after do_rootfs before do_install
+
+# Now install this image for packaging
+do_install() {
+    local image_base_path="${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}"
+
+    install -d ${D}/boot
+    install -m 0644 ${image_base_path}.cpio.gz ${D}/boot/${IMAGE_BASENAME}.cpio.gz
+}
+
+FILES_${PN} = "/boot"
+
+do_fetch[noexec] = "1"
+do_unpack[noexec] = "1"
+do_patch[noexec] = "1"
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
-- 
2.7.4


