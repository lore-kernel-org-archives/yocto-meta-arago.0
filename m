Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 3C5E252999
	for <meta-arago@arago-project.org>;
	Tue,  6 Oct 2020 12:41:55 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 096CcsAJ055050
	for <meta-arago@arago-project.org>; Tue, 6 Oct 2020 07:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601987934;
	bh=DsG2e34VD9MJ4bf+UgvbDoOsATFkpNGcBh2sk2ASNdE=;
	h=From:To:CC:Subject:Date;
	b=lOiOJzyRPBn33wIIYTfeKY/R4UfT21giEDg3fmE1hsu4H8lDt4wve0V6WeDPk1uAX
	/v9kZg4b8AFyMg+qaU3SGv2EF40QVw+8UPqnDwXKQSqvmsr0e//gLy5h5MinsJgvul
	0w2vylbEcBjgwjFHSuscEYv+QPj7fh4sGhlSJZX0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 096CcsKK014851
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 6 Oct 2020 07:38:54 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 6 Oct 2020 07:38:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 6 Oct 2020 07:38:54 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 096Ccrw2089666;
	Tue, 6 Oct 2020 07:38:53 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.45])
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 096CcrE4096184;
	Tue, 6 Oct 2020 07:38:53 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>
Date: Tue, 6 Oct 2020 07:38:40 -0500
Message-ID: <20201006123840.26473-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell][PATCH] qtwayland: backport texture-sharing/custom-compositor fix
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
X-List-Received-Date: Tue, 06 Oct 2020 12:41:55 -0000
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 ...land-texture-sharing-custom-composit.patch | 52 +++++++++++++++++++
 .../recipes-qt/qt5/qtwayland_git.bbappend     |  3 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwayland/0001-examples-fix-wayland-texture-sharing-custom-composit.patch

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-examples-fix-wayland-texture-sharing-custom-composit.patch b/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-examples-fix-wayland-texture-sharing-custom-composit.patch
new file mode 100644
index 00000000..c209dfc4
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-examples-fix-wayland-texture-sharing-custom-composit.patch
@@ -0,0 +1,52 @@
+From 1d18591d9e7ed9b3580e06c37be23bfde24bc30c Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 3 Apr 2020 22:40:29 +0200
+Subject: [PATCH] examples: fix wayland/texture-sharing/custom-compositor
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  main.cpp:83:33: error: ‘GL_RGBA8’ was not declared in this scope; did you mean ‘GL_RGBA4’?
+     83 |             *glInternalFormat = GL_RGBA8;
+        |                                 ^~~~~~~~
+        |                                 GL_RGBA4
+  main.cpp:120:33: error: ‘GL_RGBA8’ was not declared in this scope; did you mean ‘GL_RGBA4’?
+    120 |             *glInternalFormat = GL_RGBA8;
+        |                                 ^~~~~~~~
+        |                                 GL_RGBA4
+
+Task-number: QTBUG-83304
+Change-Id: I0515f3303b08c405d162986e280e9a7bd35e28f7
+Reviewed-by: Laszlo Agocs <laszlo.agocs@qt.io>
+Reviewed-by: Eskil Abrahamsen Blomfeldt <eskil.abrahamsen-blomfeldt@qt.io>
+
+Upstream-Status: Backport [1d18591d9e7ed9b3580e06c37be23bfde24bc30c]
+
+The patch is backport from upstream commit -
+1d18591d9e7ed9b3580e06c37be23bfde24bc30c
+
+Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
+---
+ examples/wayland/texture-sharing/custom-compositor/main.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/examples/wayland/texture-sharing/custom-compositor/main.cpp b/examples/wayland/texture-sharing/custom-compositor/main.cpp
+index a39c8c38..af375024 100644
+--- a/examples/wayland/texture-sharing/custom-compositor/main.cpp
++++ b/examples/wayland/texture-sharing/custom-compositor/main.cpp
+@@ -63,6 +63,10 @@
+ 
+ #include "QtWaylandCompositor/private/qwltexturesharingextension_p.h"
+ 
++#ifndef GL_RGBA8
++#define GL_RGBA8 0x8058
++#endif
++
+ class CustomSharingExtension : public QWaylandTextureSharingExtension
+ {
+     Q_OBJECT
+-- 
+2.17.1
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
index bd529d2e..c602813c 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
@@ -1,6 +1,7 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-PR_append = ".arago1"
+PR_append = ".arago2"
 
 SRC_URI += " \
     file://0001-plugins-decorations-bradient-display-window-icon-onl.patch \
+    file://0001-examples-fix-wayland-texture-sharing-custom-composit.patch \
 "
-- 
2.17.1


