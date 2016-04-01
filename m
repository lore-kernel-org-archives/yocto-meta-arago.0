Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id C657A52A1C
	for <meta-arago@arago-project.org>;
	Fri,  1 Apr 2016 21:51:12 +0000 (UTC)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.158])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4Z0008E60R9380@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 01 Apr 2016 16:50:56 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=W8DY27sA+pJ1DslXMfMu3Q==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=Sa2kaFFEjJH7jJ1Niy4A:9
Received: by 100.15.86.14 with SMTP id 550e0921; Fri, 01 Apr 2016 21:50:56 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BE8FB161F74;	Fri,
	1 Apr 2016 17:50:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 01 Apr 2016 17:50:49 -0400
Message-id: <1459547450-19113-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] qtdeclarative: fix compilation of examples/qquickviewcomparison
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
X-List-Received-Date: Fri, 01 Apr 2016 21:51:13 -0000

From: Denys Dmytriyenko <denys@ti.com>

git/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.cpp:180:14: error: 'QCoreApplication' has not been declared
          if (!QCoreApplication::arguments().contains(QStringLiteral("--no_render_alpha")))

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...omparison-fix-QCoreApplication-has-not-be.patch | 28 ++++++++++++++++++++++
 .../recipes-qt/qt5/qtdeclarative_%.bbappend        |  3 +++
 2 files changed, 31 insertions(+)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtdeclarative_%.bbappend

diff --git a/meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch b/meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
new file mode 100644
index 0000000..1687fbe
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
@@ -0,0 +1,28 @@
+From 1cdd3278a0b1508640d983720782d39eb919caaf Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Thu, 31 Mar 2016 19:38:58 -0400
+Subject: [PATCH] qquickviewcomparison: fix QCoreApplication has not been
+ declared error
+
+Upstream-Status: Pending
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h b/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
+index 5b86c93..e77514e 100644
+--- a/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
++++ b/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
+@@ -44,6 +44,7 @@
+ #include <QWidget>
+ #include <QQuickWidget>
+ #include <QQuickView>
++#include <QCoreApplication>
+ 
+ QT_FORWARD_DECLARE_CLASS(QRadioButton)
+ QT_FORWARD_DECLARE_CLASS(QCheckBox)
+-- 
+2.2.0
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtdeclarative_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtdeclarative_%.bbappend
new file mode 100644
index 0000000..96cd201
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtdeclarative_%.bbappend
@@ -0,0 +1,3 @@
+SRC_URI += " \
+    file://0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch \
+"
-- 
2.2.0


