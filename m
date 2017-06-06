Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id ED3B552A7C
	for <meta-arago@arago-project.org>;
	Tue,  6 Jun 2017 21:38:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v56Lc1qw002744
	for <meta-arago@arago-project.org>; Tue, 6 Jun 2017 16:38:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496785081;
	bh=zbkzTsU5vD0kl6LqJt41J9B0/fpLdgPEe0HiV+2fMFw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=WJnaKdeZddDUwkicJ0+DWOTlWf208ed2Ma7zsXlUnRaUhwyRoKmzpNOGI6xWKRGtb
	3n3Ee/npMDLouR0TMK3KHUZno1+tAomASA3mP6bOOf8pT0nEZGIHbx3FDkrl8whw+9
	5toHSROPtfCnxNZc2XEnyQQ+WDZ3Sl0a5BBw4/eA=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v56Lc0wR031689
	for <meta-arago@arago-project.org>; Tue, 6 Jun 2017 16:38:00 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 6 Jun 2017 16:38:00 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v56Lc01O030429	for <meta-arago@arago-project.org>;
	Tue, 6 Jun 2017 16:38:00 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 6 Jun 2017 17:37:55 -0400
Message-ID: <1496785075-26743-3-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1496785075-26743-1-git-send-email-e-ruei1@ti.com>
References: <1496785075-26743-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [morty/master][PATCH v2 3/3] qtwebbrowser: disable Fullscreen mode
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
X-List-Received-Date: Tue, 06 Jun 2017 21:38:02 -0000
Content-Type: text/plain

We need to disable full-screen mode because there is no way to exit
when the browser is launched from matrix-gui

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...0001-qtwebbrowser-disable-FullScreen-mode.patch | 32 ++++++++++++++++++++++
 .../recipes-qt/qt5/qtwebbrowser_1.0.bbappend       |  7 +++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebbrowser/0001-qtwebbrowser-disable-FullScreen-mode.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebbrowser_1.0.bbappend

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebbrowser/0001-qtwebbrowser-disable-FullScreen-mode.patch b/meta-arago-distro/recipes-qt/qt5/qtwebbrowser/0001-qtwebbrowser-disable-FullScreen-mode.patch
new file mode 100644
index 0000000..fcf768b
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebbrowser/0001-qtwebbrowser-disable-FullScreen-mode.patch
@@ -0,0 +1,32 @@
+From 720056bbce57184c1f352abb160942dbff2c1cd0 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Tue, 6 Jun 2017 14:40:08 -0400
+Subject: [PATCH] qtwebbrowser: disable FullScreen mode
+
+We need to disable full-screen mode because there is no way to exit
+when the browser is launched from matrix-gui
+
+Upstream-Status: Inappropriate
+It is a TI-specific workaround per matrix-gui operation
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
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebbrowser_1.0.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebbrowser_1.0.bbappend
new file mode 100644
index 0000000..3b7e80f
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebbrowser_1.0.bbappend
@@ -0,0 +1,7 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += " \
+    file://0001-qtwebbrowser-disable-FullScreen-mode.patch \
+"
+
+PR_append = ".arago0"
-- 
1.9.1


