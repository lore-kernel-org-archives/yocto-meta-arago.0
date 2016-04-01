Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id AC51752A1C
	for <meta-arago@arago-project.org>;
	Fri,  1 Apr 2016 21:51:06 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.152])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4Z003UQ60ROV50@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 01 Apr 2016 16:50:51 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=mSHRny2LGBfvt4CTynkA:9
Received: by 100.15.86.14 with SMTP id 214d45d7; Fri, 01 Apr 2016 21:50:51 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C0D15161F75;	Fri,
	1 Apr 2016 17:50:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 01 Apr 2016 17:50:50 -0400
Message-id: <1459547450-19113-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1459547450-19113-1-git-send-email-denis@denix.org>
References: <1459547450-19113-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] qtquickcontrols: fix compilation of examples/texteditor
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
X-List-Received-Date: Fri, 01 Apr 2016 21:51:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

git/examples/quick/controls/texteditor/src/documenthandler.cpp:136:12: error: invalid use of incomplete type 'class QDebug'
      qDebug() << "saved to" << localPath;

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...fix-invalid-use-of-incomplete-type-class-.patch | 27 ++++++++++++++++++++++
 .../recipes-qt/qt5/qtquickcontrols_%.bbappend      |  3 +++
 2 files changed, 30 insertions(+)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtquickcontrols_%.bbappend

diff --git a/meta-arago-distro/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch b/meta-arago-distro/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
new file mode 100644
index 0000000..10793e6
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
@@ -0,0 +1,27 @@
+From c39a563984693efac577adb137115693634c038f Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Thu, 31 Mar 2016 19:57:01 -0400
+Subject: [PATCH] texteditor: fix invalid use of incomplete type 'class QDebug'
+
+Upstream-Status: Pending
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ examples/quick/controls/texteditor/src/documenthandler.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/examples/quick/controls/texteditor/src/documenthandler.cpp b/examples/quick/controls/texteditor/src/documenthandler.cpp
+index 2e9987a..c8bf419 100644
+--- a/examples/quick/controls/texteditor/src/documenthandler.cpp
++++ b/examples/quick/controls/texteditor/src/documenthandler.cpp
+@@ -44,6 +44,7 @@
+ #include <QtGui/QTextCursor>
+ #include <QtGui/QFontDatabase>
+ #include <QtCore/QFileInfo>
++#include <QtCore/QDebug>
+ 
+ DocumentHandler::DocumentHandler()
+     : m_target(0)
+-- 
+2.2.0
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtquickcontrols_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtquickcontrols_%.bbappend
new file mode 100644
index 0000000..d666f8c
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtquickcontrols_%.bbappend
@@ -0,0 +1,3 @@
+SRC_URI += " \
+    file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
+"
-- 
2.2.0


