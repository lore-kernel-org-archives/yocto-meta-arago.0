Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by arago-project.org (Postfix) with ESMTPS id B0BED52960
	for <meta-arago@arago-project.org>;
	Tue, 26 Apr 2016 15:37:40 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.153])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6800ICKZEDLQ10@vms173009.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 26 Apr 2016 10:37:25 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=7d5uIlp0K0vJYXdqsDoA:9
Received: by 100.15.86.14 with SMTP id 6e3e0126; Tue, 26 Apr 2016 15:37:25 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F351C161FAF;	Tue,
	26 Apr 2016 11:37:24 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 26 Apr 2016 11:37:23 -0400
Message-id: <1461685044-17513-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] qtdeclarative: patch got upstreamed to meta-qt5, remove locally
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
X-List-Received-Date: Tue, 26 Apr 2016 15:37:40 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...omparison-fix-QCoreApplication-has-not-be.patch | 28 ----------------------
 .../recipes-qt/qt5/qtdeclarative_%.bbappend        |  5 ----
 2 files changed, 33 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtdeclarative_%.bbappend

diff --git a/meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch b/meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
deleted file mode 100644
index 1687fbe..0000000
--- a/meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 1cdd3278a0b1508640d983720782d39eb919caaf Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Thu, 31 Mar 2016 19:38:58 -0400
-Subject: [PATCH] qquickviewcomparison: fix QCoreApplication has not been
- declared error
-
-Upstream-Status: Pending
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h b/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
-index 5b86c93..e77514e 100644
---- a/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
-+++ b/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
-@@ -44,6 +44,7 @@
- #include <QWidget>
- #include <QQuickWidget>
- #include <QQuickView>
-+#include <QCoreApplication>
- 
- QT_FORWARD_DECLARE_CLASS(QRadioButton)
- QT_FORWARD_DECLARE_CLASS(QCheckBox)
--- 
-2.2.0
-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtdeclarative_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtdeclarative_%.bbappend
deleted file mode 100644
index 3d4d269..0000000
--- a/meta-arago-distro/recipes-qt/qt5/qtdeclarative_%.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += " \
-    file://0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch \
-"
-- 
2.2.0


