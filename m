Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C465AC636D6
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 23:34:07 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1076.1675899242246015367
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 15:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EvK3Ghz5;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318NXx3c110788;
	Wed, 8 Feb 2023 17:33:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675899239;
	bh=omg+fWFJzgNHPxVkPBUKWUjP879bI/bd7eV6MtHguJI=;
	h=From:To:CC:Subject:Date;
	b=EvK3Ghz5alFKpNjf5gASGeWrJ7dPvNG82nMP4nweuZ0twJP4wBQKkBejlLqQtqltj
	 M5u2pQzaxURf9s6xJJsPjgf7fkkMMzcji/f1m4/IZY2uU1NeIYZo5D7kNvaKEJhWYu
	 Bqsbm+PRXH+gZx9exZg6kSa+U/72WIDBLxfvWwdI=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318NXxJd086335
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 17:33:59 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 17:33:59 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 17:33:59 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318NXwlE002011;
	Wed, 8 Feb 2023 17:33:58 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH 1/3] qtwebbrowser: update to the latest version 5.15.1
Date: Wed, 8 Feb 2023 17:33:56 -0600
Message-ID: <20230208233358.19714-1-afd@ti.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Feb 2023 23:34:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14210

Update to the latest upstream commit for v5.15.1.

While here also drop the appends for this recipe as it is no longer
maintained.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 ...qtwebbrowser-disable-FullScreen-mode.patch | 32 -------------------
 .../examples/qtwebbrowser_1.0.bbappend        |  7 ----
 ...bbrowser_1.0.bb => qtwebbrowser_5.15.1.bb} | 26 +++++++++++----
 3 files changed, 19 insertions(+), 46 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/examples/qtwebbrowser/0001-qtwebbrowser-disable-FullScreen-mode.patch
 delete mode 100644 meta-arago-distro/recipes-qt/examples/qtwebbrowser_1.0.bbappend
 rename meta-arago-extras/recipes-qt/examples/{qtwebbrowser_1.0.bb => qtwebbrowser_5.15.1.bb} (60%)

diff --git a/meta-arago-distro/recipes-qt/examples/qtwebbrowser/0001-qtwebbrowser-disable-FullScreen-mode.patch b/meta-arago-distro/recipes-qt/examples/qtwebbrowser/0001-qtwebbrowser-disable-FullScreen-mode.patch
deleted file mode 100644
index fcf768b5..00000000
--- a/meta-arago-distro/recipes-qt/examples/qtwebbrowser/0001-qtwebbrowser-disable-FullScreen-mode.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 720056bbce57184c1f352abb160942dbff2c1cd0 Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Tue, 6 Jun 2017 14:40:08 -0400
-Subject: [PATCH] qtwebbrowser: disable FullScreen mode
-
-We need to disable full-screen mode because there is no way to exit
-when the browser is launched from matrix-gui
-
-Upstream-Status: Inappropriate
-It is a TI-specific workaround per matrix-gui operation
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- src/main.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/main.cpp b/src/main.cpp
-index 2181f15..5f146b6 100644
---- a/src/main.cpp
-+++ b/src/main.cpp
-@@ -101,7 +101,7 @@ int main(int argc, char **argv)
-     if (view.size().isEmpty())
-         view.setGeometry(0, 0, 800, 600);
- #else
--    view.showFullScreen();
-+    view.show();
- #endif
- 
-     app.exec();
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-qt/examples/qtwebbrowser_1.0.bbappend b/meta-arago-distro/recipes-qt/examples/qtwebbrowser_1.0.bbappend
deleted file mode 100644
index 1f61a3b8..00000000
--- a/meta-arago-distro/recipes-qt/examples/qtwebbrowser_1.0.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += " \
-    file://0001-qtwebbrowser-disable-FullScreen-mode.patch \
-"
-
-PR:append = ".arago0"
diff --git a/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb b/meta-arago-extras/recipes-qt/examples/qtwebbrowser_5.15.1.bb
similarity index 60%
rename from meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb
rename to meta-arago-extras/recipes-qt/examples/qtwebbrowser_5.15.1.bb
index 366b5369..1f52d452 100644
--- a/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb
+++ b/meta-arago-extras/recipes-qt/examples/qtwebbrowser_5.15.1.bb
@@ -7,22 +7,19 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
-DEPENDS += "qtwebengine"
+DEPENDS += "qtbase qtdeclarative qtwebengine"
 PACKAGES += "${PN}-examples"
 
-PR = "r1"
+PR = "r0"
 
 BRANCH = "dev"
-SRCREV = "023733af5523a5ad84359926224fa106001215f4"
-
-SRC_URI = "git://code.qt.io/qt-apps/qtwebbrowser.git;protocol=git;branch=${BRANCH} \
-"
+SRC_URI = "git://code.qt.io/qt-apps/qtwebbrowser.git;protocol=git;branch=${BRANCH}"
+SRCREV = "a09ec269e8b296d39d78b45ae251edb3d7bada41"
 
 S = "${WORKDIR}/git"
 
 inherit qt5
 
-# Install qtwebbrowser under /usr/bin
 do_install() {
     install -d ${D}${bindir}
     install -d ${D}${datadir}/examples/webengine/webbrowser/src
@@ -32,3 +29,18 @@ do_install() {
 
 FILES:${PN} +=  "${bindir}/qtwebbrowser"
 FILES:${PN}-examples +=  "${datadir}/examples/webengine/webbrowser/*"
+
+RDEPENDS:${PN} += " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-qmlplugins', '', d)} \
+    qtvirtualkeyboard-qmlplugins \
+    qtdeclarative-qmlplugins \
+    qtquickcontrols-qmlplugins \
+    qtgraphicaleffects-qmlplugins \
+    qtmultimedia-qmlplugins \
+    qtwebengine-qmlplugins \
+    ttf-dejavu-common \
+    ttf-dejavu-sans \
+    ttf-dejavu-sans-mono \
+    liberation-fonts \
+    ca-certificates \
+"
-- 
2.39.1


