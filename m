Return-Path: <e-ruei1@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id 0CADB52A20
	for <meta-arago@arago-project.org>;
	Mon,  7 Nov 2016 22:28:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id uA7MSkZn030885
	for <meta-arago@arago-project.org>; Mon, 7 Nov 2016 16:28:46 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uA7MSkL9010395
	for <meta-arago@arago-project.org>; Mon, 7 Nov 2016 16:28:46 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 7 Nov 2016 16:28:45 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	uA7MSjSi028654	for <meta-arago@arago-project.org>;
	Mon, 7 Nov 2016 16:28:45 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 7 Nov 2016 17:28:40 -0500
Message-ID: <1478557720-1016-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] qtwebengine_git: Add include <QtGui/qcolor.h> at qquickwebengineview_p.h to fix compile error
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
X-List-Received-Date: Mon, 07 Nov 2016 22:28:47 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...quickwebengineview_p.h-add-include-QtGui-.patch | 26 ++++++++++++++++++++++
 .../recipes-qt/qt5/qtwebengine_git.bbappend        |  6 +++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p.h-add-include-QtGui-.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p.h-add-include-QtGui-.patch b/meta-arago-distro/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p.h-add-include-QtGui-.patch
new file mode 100644
index 0000000..f572f63
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p.h-add-include-QtGui-.patch
@@ -0,0 +1,26 @@
+From 07eeb01ea39e0fa2f9d30900c07fd0345d32562b Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Thu, 1 Sep 2016 17:49:56 -0400
+Subject: [PATCH] WebEngine qquickwebengineview_p.h add include
+ <QtGui/qcolor.h>
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ src/webengine/api/qquickwebengineview_p.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/webengine/api/qquickwebengineview_p.h b/src/webengine/api/qquickwebengineview_p.h
+index 98d0bbc..93ef9e4 100644
+--- a/src/webengine/api/qquickwebengineview_p.h
++++ b/src/webengine/api/qquickwebengineview_p.h
+@@ -51,6 +51,7 @@
+ #include <private/qtwebengineglobal_p.h>
+ #include "qquickwebenginescript_p.h"
+ #include <QQuickItem>
++#include <QtGui/qcolor.h>
+ 
+ QT_BEGIN_NAMESPACE
+ 
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
new file mode 100644
index 0000000..935e744
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
@@ -0,0 +1,6 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+PR_append = ".arago0"
+
+SRC_URI += " \
+    file://0001-WebEngine-qquickwebengineview_p.h-add-include-QtGui-.patch \
+"
-- 
1.9.1


