Return-Path: <nikhil.nd@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id C9E0252970
	for <meta-arago@arago-project.org>;
	Fri, 27 Sep 2019 09:45:58 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8R9impj085834
	for <meta-arago@arago-project.org>; Fri, 27 Sep 2019 04:44:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569577488;
	bh=SRqCCMwic7cfBSlIafeuS1kEOBb5hgFie1F+D62L1T4=;
	h=From:To:CC:Subject:Date;
	b=u47Efk7OgftoeRRTZEM1qVEs/JLnKWQP84Gkjw+w14jPgVCDG1ec/IwJFq351sQgU
	g4LxYcpny1Pc/49XwMxAqVD3jTMShjp0sjZz5+tYi+mO5fGQduZjajk+IZ6rmcdk9I
	lZkUs847D0YLqj4vvhWC7rRHY+dxjuROl2ZCCMLk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8R9imVr106934
	for <meta-arago@arago-project.org>; Fri, 27 Sep 2019 04:44:48 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 27 Sep 2019 04:44:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 27 Sep 2019 04:44:40 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8R9ik5C023237; 
	Fri, 27 Sep 2019 04:44:47 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 27 Sep 2019 15:14:38 +0530
Message-ID: <1569577478-68202-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master PATCH v1] tisdk-readme: Add separate README for k3 platforms
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
X-List-Received-Date: Fri, 27 Sep 2019 09:45:59 -0000
Content-Type: text/plain

For machines with k3 platforms, install the README_k3 as README
It describes all the new files needed for booting k3 devices.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../recipes-tisdk/tisdk-readme/tisdk-readme.bb     |  8 +++++--
 .../tisdk-readme/tisdk-readme/README_k3            | 26 ++++++++++++++++++++++
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README_k3

diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
index 6fdcaff..18f8c04 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
+++ b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
@@ -4,19 +4,23 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 SRC_URI = "\
     file://README \
+    file://README_k3 \
 "
 
-PR = "r0"
+PR = "r1"
 PV = "1.0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}"
 
+README_FILE = "README"
+README_FILE_k3 = "README_k3"
+
 do_install () {
     install -d ${D}/board-support/prebuilt-images
 
-    install -m 0644 ${S}/README ${D}/board-support/prebuilt-images/
+    install -m 0644 ${S}/${README_FILE} ${D}/board-support/prebuilt-images/README
 }
 
 FILES_${PN} += "board-support/*"
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README_k3 b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README_k3
new file mode 100644
index 0000000..0eb6dd3
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README_k3
@@ -0,0 +1,26 @@
+The files contained in this directory represent the images that were built
+as part of the original SDK build and packaging process.  They are meant
+to serve as a restore and starting point for your development.  In order
+to use these images with an SD card they should be placed in the appropriate
+locations.
+
+By default these locations are:
+
++-------------+-----------------------------------------+
+|    File     |                Location                 |
++-------------+-----------------------------------------+
+| tiboot3.bin | boot partition                          |
+| tispl.bin   | boot partition                          |
+| u-boot.img  | boot partition                          |
+| sysfw.itb   | boot partition                          |
+| uEnv.txt    | boot partition                          |
++-------------+-----------------------------------------+
+| Image       | /boot directory of the rootfs partition |
+| *.dtb       | /boot directory of the rootfs partition |
+| *.dtbo      | /boot directory of the rootfs partition |
++-------------+-----------------------------------------+
+
+By default the boot loaders are read from the first FAT partition, which is
+usually called the "boot" partition.  Then the bootloader will look for the
+Image and .dtb .dtbo files in the /boot directory of the ext4 partition, which is
+usually called the "rootfs" partition.
-- 
1.9.1


