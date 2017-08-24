Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 98F6452A10
	for <meta-arago@arago-project.org>;
	Thu, 24 Aug 2017 23:07:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7ON7CvC018224
	for <meta-arago@arago-project.org>; Thu, 24 Aug 2017 18:07:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503616032;
	bh=oO5FRwVhyeG2z98yC9LCxq5Wv/wvdIZjOGzjPLajcl4=;
	h=From:To:Subject:Date;
	b=MUFbhbrOe3z8xKkaYginFRifRH2JlsZ+GZ7od2x7Nbj+d5DPqWoDDps4b+8n+MItt
	2SKX0iOMr9PHXVSA+IQSl+TYXOBq5e0RBtTC6+Y0KU376N9wwxZXu1ooTidNDu5wt8
	8RH4IVLMBtDFTPl0ZLQInpiLJAK+p+I4vETEA3/U=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7ON7Ct0023213
	for <meta-arago@arago-project.org>; Thu, 24 Aug 2017 18:07:12 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 24 Aug 2017 18:07:12 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 24 Aug 2017 18:07:12 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7ON7BGx005774
	for <meta-arago@arago-project.org>; Thu, 24 Aug 2017 18:07:11 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 24 Aug 2017 19:07:07 -0400
Message-ID: <1503616027-50489-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] matrix_browser: update for QWebEngine from QWebKit
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
X-List-Received-Date: Thu, 24 Aug 2017 23:07:12 -0000
Content-Type: text/plain

Replace QWebkit with QWebEngine because QWebkit is obslete.


Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 MatrixWebView.cpp  | 5 +----
 MatrixWebView.h    | 5 ++---
 main.cpp           | 1 -
 matrix_browser.pro | 2 +-
 4 files changed, 4 insertions(+), 9 deletions(-)
 mode change 100755 => 100644 main.cpp

diff --git a/MatrixWebView.cpp b/MatrixWebView.cpp
index 48459b7..72c4967 100644
--- a/MatrixWebView.cpp
+++ b/MatrixWebView.cpp
@@ -37,9 +37,6 @@
  *
 */
 
-#include <QtWidgets>
-#include <QtNetwork>
-#include <QtWebKitWidgets>
 #include "MatrixWebView.h"
 #include <sys/types.h>
 #include <sys/socket.h>
@@ -53,7 +50,7 @@ MatrixWebView::MatrixWebView(const QUrl& url)
     if (::socketpair(AF_UNIX, SOCK_STREAM, 0, sigtermFd))
        qFatal("Couldn't create TERM socketpair");
 
-    view = new QWebView(this);
+    view = new QWebEngineView(this);
     view->load(url);
     setCentralWidget(view);
 
diff --git a/MatrixWebView.h b/MatrixWebView.h
index fec7249..b6d2cc5 100644
--- a/MatrixWebView.h
+++ b/MatrixWebView.h
@@ -40,8 +40,7 @@
 #define MATRIXWEBVIEW_H
 
 #include <QtWidgets>
-#include <QWebView>
-#include <QGraphicsWebView>
+#include <QWebEngineView>
 #include <QSocketNotifier>
 #include <QMainWindow>
 
@@ -62,7 +61,7 @@ public slots:
 private:
     static int sigtermFd[2];
     QSocketNotifier *snTerm;
-    QWebView *view;
+    QWebEngineView *view;
 };
 
 #endif
diff --git a/main.cpp b/main.cpp
old mode 100755
new mode 100644
index a1ccd80..dceece5
--- a/main.cpp
+++ b/main.cpp
@@ -36,7 +36,6 @@
  *
 */
 
-#include <QtWidgets>
 #include <iostream> 
 #include <QApplication>
 #include "MatrixWebView.h"
diff --git a/matrix_browser.pro b/matrix_browser.pro
index a6d8e1c..c6d9894 100755
--- a/matrix_browser.pro
+++ b/matrix_browser.pro
@@ -6,7 +6,7 @@ TEMPLATE = app
 TARGET = matrix_browser
 DEPENDPATH += .
 INCLUDEPATH += .
-QT       +=   webkit webkitwidgets
+QT       +=   webenginewidgets
 # Input
 SOURCES += main.cpp MatrixWebView.cpp
 HEADERS = MatrixWebView.h
-- 
1.9.1


