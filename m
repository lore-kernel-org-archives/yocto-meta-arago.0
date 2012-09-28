Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id C80EF529A4
	for <meta-arago@arago-project.org>;
	Fri, 28 Sep 2012 01:45:58 +0000 (UTC)
Received: by obblz20 with SMTP id lz20so2448678obb.38
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2012 18:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=e2PsM+W3Z7x4rOKBmCVyMSUl7uOss2OdJSHw7QGXXa4=;
	b=vuQIIeUlJsy3MTVoTOAMIw+xEFHWptn8smKpoaIidtLm7z6dPICBsI3TRjFG571y0O
	tec96Bw9TfFBLYDMmUfENvRyhGbfvSw6uTDY3IrkGn5UT/XtnCJJTQVUAO1Y4NgzLq8H
	wBPVTxgJpkf0BnCGuA+8axm2SASZEJ9U4J18xbO29JUdfZvwzfJN2+WoPDKyr3MuUlv7
	gOqt7VV/b4KEhha5qGKavSnB1nRl1VTZf7uj1L2MYZs+T5y8bSxiDuyFMV5+GfSMn0LX
	cvhgzO4BhG7nj0kzVXPZzs0thS+e/t7BtrVmr5Kk+wzOaGW4Old1jlCCmPWDc0RPMSDh
	W9Vw==
Received: by 10.182.131.98 with SMTP id ol2mr4631404obb.69.1348796758265;
	Thu, 27 Sep 2012 18:45:58 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id r2sm3797690obn.4.2012.09.27.18.45.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 18:45:57 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 27 Sep 2012 21:11:38 -0500
Message-Id: <1348798298-24118-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] wl1271-demo: Port wl1271-demo recipe
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
X-List-Received-Date: Fri, 28 Sep 2012 01:45:59 -0000

* Port wl1271-demo recipe from arago to meta-arago.
* Temporarily using the README.md for the license checksum since
  no license exist within the git repo.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../wl12xx-demo/wl1271-demo_git.bb                 |   45 ++++++++++++++++++++
 1 files changed, 45 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo_git.bb

diff --git a/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo_git.bb b/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo_git.bb
new file mode 100644
index 0000000..f220ec0
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo_git.bb
@@ -0,0 +1,45 @@
+DESCRIPTION = "Initialization and demo application for bluetooth on WL1271 chipset"
+SECTION = "network"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://README.md;md5=7fd458a478fbc8a473a2d5b95c5cb048"
+
+DEPENDS += "openobex"
+RDEPENDS += "bluez4 openobex ussp-push obexftp bluez-hcidump"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+PACKAGE_STRIP = "no"
+
+PR = "r0+gitr${SRCREV}"
+
+SRCREV = "c7faa4cd2ef26b72ef2ae3d3d4854ea83a2ee636"
+
+COMPATIBLE_MACHINE = "am37x-evm|am180x-evm|da850-omapl138-evm|am335x-evm"
+
+SRC_URI = "git://github.com/TI-ECS/wl1271-bluetooth.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+PLATFORM_am37x-evm = "omap3evm"
+PLATFORM_am180x-evm = "am1808"
+PLATFORM_da850-omapl138-evm = "am1808"
+PLATFORM_am335x-evm = "am335x"
+PLATFORM ?= "UNKNOWN"
+
+do_install () {
+	install -d ${D}${datadir}/wl1271-demos
+	install -d ${D}${datadir}/wl1271-demos/bluetooth
+	install -d ${D}${datadir}/wl1271-demos/bluetooth/gallery
+	install -d ${D}${datadir}/wl1271-demos/bluetooth/scripts
+	install -d ${D}${datadir}/wl1271-demos/bluetooth/ftp_folder
+
+	install -m 0755 ${S}/gallery/* ${D}${datadir}/wl1271-demos/bluetooth/gallery
+	install -m 0755 ${S}/script/common/* ${D}${datadir}/wl1271-demos/bluetooth/scripts
+	install -m 0755 ${S}/script/${PLATFORM}/* ${D}${datadir}/wl1271-demos/bluetooth/scripts
+	install -m 0755 ${S}/ftp_folder/* ${D}${datadir}/wl1271-demos/bluetooth/ftp_folder
+}
+
+FILES_${PN} +=" \
+	${datadir}/wl1271-demos/bluetooth/scripts \
+	${datadir}/wl1271-demos/bluetooth/gallery \
+	${datadir}/wl1271-demos/bluetooth/ftp_folder \
+	"
-- 
1.7.0.4


