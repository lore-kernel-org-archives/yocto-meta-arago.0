Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 57518529D6
	for <meta-arago@arago-project.org>;
	Mon,  5 Jun 2017 19:30:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v55JUHGA008968
	for <meta-arago@arago-project.org>; Mon, 5 Jun 2017 14:30:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496691017;
	bh=8WoGV0hB7LYMTa60k4SewupnNKqvO9NPoYGnWfXB1JY=;
	h=From:To:Subject:Date;
	b=fa2uptbkDFq/l4h5QtrwZPo+onNHNBV1ZMm+sAcw0xAQvKOTVM9S2DNd/3nhMW0NV
	z9KSopbY3WwxA0W42HdPs46gFfelr2FFYpvp3obLt9iriPyZG8whVy/3Lx84KidDsN
	bsOTQNtBerS7d42j+wQe1BDeJfxDiJw/L9wGwiWY=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v55JUHVG025294
	for <meta-arago@arago-project.org>; Mon, 5 Jun 2017 14:30:17 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 5 Jun 2017 14:30:17 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v55JUHaL018150	for <meta-arago@arago-project.org>;
	Mon, 5 Jun 2017 14:30:17 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 5 Jun 2017 15:30:13 -0400
Message-ID: <1496691014-53218-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH 1/2] qtwebbrowser-example: add QT web browser example
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
X-List-Received-Date: Mon, 05 Jun 2017 19:30:19 -0000
Content-Type: text/plain

- This is a touch-friendly web broswer based on qtwebengine and QML

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...0001-qtwebbrowser-disable-FullScreen-mode.patch | 28 ++++++++++++++++++
 .../recipes-qt/qt5/qtwebbrowser-example_1.0.bb     | 33 ++++++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebbrowser-example/0001-qtwebbrowser-disable-FullScreen-mode.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebbrowser-example_1.0.bb

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebbrowser-example/0001-qtwebbrowser-disable-FullScreen-mode.patch b/meta-arago-distro/recipes-qt/qt5/qtwebbrowser-example/0001-qtwebbrowser-disable-FullScreen-mode.patch
new file mode 100644
index 0000000..9cac96a
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebbrowser-example/0001-qtwebbrowser-disable-FullScreen-mode.patch
@@ -0,0 +1,28 @@
+From 268cf8dec9486fd875ab7fae241273e7b5b2a143 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Fri, 2 Jun 2017 15:29:01 -0400
+Subject: [PATCH] qtwebbrowser: disable FullScreen mode
+
+We need to disable full-screen mode because there is no way to exit in that mode
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ src/main.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/main.cpp b/src/main.cpp
+index 2181f15..5f146b6 100644
+--- a/src/main.cpp
++++ b/src/main.cpp
+@@ -101,7 +101,7 @@ int main(int argc, char **argv)
+     if (view.size().isEmpty())
+         view.setGeometry(0, 0, 800, 600);
+ #else
+-    view.showFullScreen();
++    view.show();
+ #endif
+ 
+     app.exec();
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebbrowser-example_1.0.bb b/meta-arago-distro/recipes-qt/qt5/qtwebbrowser-example_1.0.bb
new file mode 100644
index 0000000..a063207
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebbrowser-example_1.0.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Qt Touch-Friendly WebBroswer"
+HOMEPAGE = "http://blog.qt.io/blog/2016/07/18/qt-webbrowser-1-0/"
+SECTION = "multimedia"
+LICENSE = "GPL-3.0 & GFDL-1.3"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.GPLv3;md5=a40e2bb02b1ac431f461afd03ff9d1d6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+"
+DEPENDS += "qtwebengine"
+
+PR = "r1"
+
+BRANCH = "dev"
+SRCREV = "023733af5523a5ad84359926224fa106001215f4"
+
+SRC_URI = "git://code.qt.io/qt-apps/qtwebbrowser.git;protocol=git;branch=${BRANCH} \
+    file://0001-qtwebbrowser-disable-FullScreen-mode.patch \
+"
+
+S = "${WORKDIR}/git"
+
+inherit qt-provider
+
+# Install qtwebbrowser under /usr/share/qt5/examples/webengine
+do_install() {
+    install -d ${D}${datadir}/qt5/examples/webengine/webbrowser/src
+    install -m 0755 src/qtwebbrowser ${D}${datadir}/qt5/examples/webengine/webbrowser/qtwebbrowser
+    cp -r ${S}/* ${D}${datadir}/qt5/examples/webengine/webbrowser/.
+}
+
+FILES_${PN} +=  " \
+/usr/share/qt5/examples/webengine/webbrowser/* \
+"
-- 
1.9.1


