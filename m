Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 097BC52A1B
	for <meta-arago@arago-project.org>;
	Tue, 16 May 2017 00:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D917020B95;
	Tue, 16 May 2017 00:11:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8Cz7cYjSiTkx; Tue, 16 May 2017 00:11:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B3CEC204E0;
	Tue, 16 May 2017 00:11:54 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 2CADA162439;
	Mon, 15 May 2017 20:11:54 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 15 May 2017 20:11:49 -0400
Message-Id: <1494893510-80131-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][RFC PATCH 1/2] k2-initramfs: rename to k2-fw-initrd to match the content and appear as real image
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
X-List-Received-Date: Tue, 16 May 2017 00:11:56 -0000

This would enable it to be used in places where real initramfs image is expected,
like FIT image processing.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../k2-fw-initrd_git.bb}                              | 19 ++++++++++++++-----
 .../packagegroup-arago-base-tisdk-server-extra.bb     |  4 ++--
 2 files changed, 16 insertions(+), 7 deletions(-)
 rename meta-arago-distro/recipes-bsp/{k2-initramfs/k2-initramfs_git.bb => k2-fw-initrd/k2-fw-initrd_git.bb} (59%)

diff --git a/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb b/meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_git.bb
similarity index 59%
rename from meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb
rename to meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_git.bb
index edfe725..ec2abb2 100644
--- a/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb
+++ b/meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_git.bb
@@ -4,7 +4,7 @@ LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c5e02be633f1499c109d1652514d85ec"
 
 PV = "0.0.6"
-PR = "r0"
+PR = "r1"
 
 CLEANBROKEN = "1"
 
@@ -12,26 +12,35 @@ COMPATIBLE_MACHINE = "keystone"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "http://arago-project.org/files/releases/k2-fw/${P}.tar.gz"
+SRC_URI = "http://arago-project.org/files/releases/k2-fw/k2-initramfs-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "1a4052bdb659de4180c7e71271fe0451"
 SRC_URI[sha256sum] = "0af426ec1bdbf59f9ad4a84d6df123300f0d921feb74d4f1de701b9a0fa1ca76"
 
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


