Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 29E56529ED
	for <meta-arago@arago-project.org>;
	Wed, 27 Apr 2016 03:01:21 +0000 (UTC)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.153])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O690048KV1ROS90@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 26 Apr 2016 22:01:08 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=U0uVXvqPMAszEtoJXCcA:9
Received: by 100.15.86.14 with SMTP id 0a6aa1a1; Wed, 27 Apr 2016 03:01:08 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0AE81161BC9;	Tue,
	26 Apr 2016 23:01:03 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 26 Apr 2016 23:01:02 -0400
Message-id: <1461726062-27902-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] qtwebkit: update WebCore.pri patch to apply to 5.6
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
X-List-Received-Date: Wed, 27 Apr 2016 03:01:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-qt/qt5/qtwebkit/WebCore.pri.patch        | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
index 050d301..276b3cf 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
@@ -1,11 +1,8 @@
---- qtwebkit/Source/WebCore/WebCore.pri.orig	2013-09-08 14:18:22.315635577 +0530
-+++ qtwebkit/Source/WebCore/WebCore.pri	2013-09-08 14:18:44.271634981 +0530
-@@ -213,18 +213,20 @@ use?(3D_GRAPHICS) {
-     } else {
-         contains(QT_CONFIG, opengles2): CONFIG += egl
-     }
- }
- 
+diff --git a/Source/WebCore/WebCore.pri b/Source/WebCore/WebCore.pri
+index 0189394..00f7090 100644
+--- a/Source/WebCore/WebCore.pri
++++ b/Source/WebCore/WebCore.pri
+@@ -227,8 +227,10 @@ use?(3D_GRAPHICS) {
  use?(GRAPHICS_SURFACE) {
      mac: LIBS += -framework IOSurface -framework CoreFoundation
      linux-*: {
@@ -14,12 +11,7 @@
 +        xlibAvailable() {
 +            LIBS += -lXcomposite -lXrender
 +            CONFIG *= x11
-+	}
++        }
      }
  }
  
- have?(sqlite3) {
-     mac {
-         LIBS += -lsqlite3
-     } else {
-         PKGCONFIG += sqlite3
-- 
2.2.0


