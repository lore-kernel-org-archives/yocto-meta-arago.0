Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 8843D52A41
	for <meta-arago@arago-project.org>;
	Mon, 19 Jun 2017 18:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 914C420C17;
	Mon, 19 Jun 2017 18:30:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id WlNQQIHIyB_0; Mon, 19 Jun 2017 18:30:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6EACE20BF0;
	Mon, 19 Jun 2017 18:30:03 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id DE65F162500;
	Mon, 19 Jun 2017 14:30:02 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 19 Jun 2017 14:30:02 -0400
Message-Id: <1497897002-112394-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] k2-initramfs: update to 0.0.7 and rename to k2-fw-initrd
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
X-List-Received-Date: Mon, 19 Jun 2017 18:30:06 -0000

* Version 0.0.7 updates PA firmwares to 3.0.2.3
* New name matches image content
* Move version to filename - this is not git recipe
* Install as machine-suffixed image and symlink to short name
* Update packagegroup dependency accordingly

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../k2-fw-initrd_0.0.7.bb}                         | 24 ++++++++++++++--------
 .../packagegroup-arago-base-tisdk-server-extra.bb  |  4 ++--
 2 files changed, 17 insertions(+), 11 deletions(-)
 rename meta-arago-distro/recipes-bsp/{k2-initramfs/k2-initramfs_git.bb => k2-fw-initrd/k2-fw-initrd_0.0.7.bb} (46%)

diff --git a/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb b/meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_0.0.7.bb
similarity index 46%
rename from meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb
rename to meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_0.0.7.bb
index edfe725..b9eb57f 100644
--- a/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb
+++ b/meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_0.0.7.bb
@@ -3,35 +3,41 @@ DESCRIPTION = "Prebuilt Keystone2 initramfs with SerDes, QMSS and NETCP PA firmw
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c5e02be633f1499c109d1652514d85ec"
 
-PV = "0.0.6"
-PR = "r0"
-
 CLEANBROKEN = "1"
 
 COMPATIBLE_MACHINE = "keystone"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "http://arago-project.org/files/releases/k2-fw/${P}.tar.gz"
+SRC_URI = "http://arago-project.org/files/releases/k2-fw/k2-initramfs-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "1a4052bdb659de4180c7e71271fe0451"
-SRC_URI[sha256sum] = "0af426ec1bdbf59f9ad4a84d6df123300f0d921feb74d4f1de701b9a0fa1ca76"
+SRC_URI[md5sum] = "27fb248cbfe08ed8344bdc4451067c8f"
+SRC_URI[sha256sum] = "beb19d685ee0d20281266726e4c2ba4b245af9450c1bd5155ff06d8c1656dd26"
 
 S = "${WORKDIR}"
 TARGET = "k2-fw-initrd.cpio.gz"
+TARGETM = "k2-fw-initrd-${MACHINE}.cpio.gz"
 
 do_install() {
 	install -d ${D}/boot
-	install -m 0644 ${S}/${TARGET} ${D}/boot/${TARGET}
+	install -m 0644 ${S}/${TARGET} ${D}/boot/${TARGETM}
+	ln -s ${TARGETM} ${D}/boot/${TARGET}
 }
 
 FILES_${PN} = "/boot"
 
 inherit deploy
 
-do_deploy () {
+do_deploy() {
 	install -d ${DEPLOYDIR}
-	install -m 0644 ${S}/${TARGET} ${DEPLOYDIR}/${TARGET}
+	install -m 0644 ${S}/${TARGET} ${DEPLOYDIR}/${TARGETM}
+	ln -s ${TARGETM} ${DEPLOYDIR}/${TARGET}
 }
 
 addtask deploy before do_build after do_compile
+
+do_image_complete() {
+	:
+}
+
+addtask image_complete after do_deploy before do_build
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 784c5b4..aec9e5a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r16"
+PR = "r17"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -104,7 +104,7 @@ ARAGO_TI_KEYSTONE_PKGS = "\
     pktlib \
     cppi-lld \
     ipsecmgr-mod \
-    k2-initramfs \
+    k2-fw-initrd \
     parse-ip \
     "
 
-- 
2.7.4


