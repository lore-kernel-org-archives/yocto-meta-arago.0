Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 6B72D529A4
	for <meta-arago@arago-project.org>;
	Mon, 28 Aug 2017 16:27:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7SGRLmt010431
	for <meta-arago@arago-project.org>; Mon, 28 Aug 2017 11:27:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503937641;
	bh=oO5FRwVhyeG2z98yC9LCxq5Wv/wvdIZjOGzjPLajcl4=;
	h=From:To:Subject:Date;
	b=buE8iJvH4YPL+aVPEnSgRUidJruNzu7JCkhCmqvBwB8ZaE3BOWpLMnNQWP2g7/bMY
	pfBySk4uZTP1aFTPWPIKEq0qPslkqi1SDo69wf05KIAEuz++GNBpWXeUwv9qOdVW3A
	jSj5u6a3qTf+XjteSysxEpjqwRgioxJCP+HvmfDA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7SGRLf5011462
	for <meta-arago@arago-project.org>; Mon, 28 Aug 2017 11:27:21 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 28 Aug 2017 11:27:21 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 28 Aug 2017 11:27:21 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7SGRKZS030646
	for <meta-arago@arago-project.org>; Mon, 28 Aug 2017 11:27:20 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 28 Aug 2017 12:26:54 -0400
Message-ID: <1503937614-50481-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [matrix_browser][PATCH v2] matrix_browser: update for QWebEngine from QWebKit
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
X-List-Received-Date: Mon, 28 Aug 2017 16:27:22 -0000
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


