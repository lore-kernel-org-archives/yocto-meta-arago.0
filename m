Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id C1A7452094
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:19 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so4861422oag.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=nLKokgNZCBmQbYv75goGuGxuRKcM5hUErrT8R49Zok8=;
	b=xbtD0GiFYMNlWgrUNkXvzwD2Y1GQWD0Su7d/mZ2wHhOHDzSW4o6t4MY0nSVDlbPs0h
	qkWMIh5fva5FyJ/Byuw88x+dXgYOU2D+6mmhTxNe2U/ejKmsME66uJKsmy4bAGqI8T5r
	RCKHQ/gDbPLyJBGVFV0pGN9XBAgJEcCIQj7rn+qOuJ2bg4UqwGskzm0tr5hT/2V5MK3R
	zVMXouKUCzybK1NuWx39AT/fksSrERzhIdl6rpannbzMJ5RCjMChKeMhp89j9Ysp+YyA
	r3vwsWAG2LJ7AaSVsQ/yQxA7LWilNt/jw7zelHTlcclpHYnshqnkJiNRiO+B94qLsFwO
	W6Xw==
Received: by 10.60.19.230 with SMTP id i6mr6588193oee.138.1352080459486;
	Sun, 04 Nov 2012 17:54:19 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:19 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:24 -0600
Message-Id: <1352080417-9792-27-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 29/42] arago-qt4.inc: Add maximize window patch for weatherinfo and imageviewer
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:20 -0000

* Massage a patch from arago to support Qt/E 4.8. This patch maximizes the
  application window for the weatherinfo and imageviewer demo application.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/recipes-qt/qt4/arago-qt4.inc     |    7 +++-
 ...-PATCH-make-demos-maximized-for-TISDK-use.patch |   48 ++++++++++++++++++++
 2 files changed, 54 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-qt/qt4/files/0001-PATCH-make-demos-maximized-for-TISDK-use.patch

diff --git a/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc b/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
index 0e80318..0faf8ac 100644
--- a/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
+++ b/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
@@ -1,8 +1,13 @@
 # Common file for patches or tweaks that are needed by qt4-embedded and
 # qt4-embedded-gles
 
-PR := "${PR}-arago2"
+PR := "${PR}-arago3"
+
+# look for files in this layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 # Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
 # For our distribution purposes we only use LGPLv2.1
 LICENSE = "LGPLv2.1"
+
+SRC_URI += "file://0001-PATCH-make-demos-maximized-for-TISDK-use.patch"
diff --git a/meta-arago-distro/recipes-qt/qt4/files/0001-PATCH-make-demos-maximized-for-TISDK-use.patch b/meta-arago-distro/recipes-qt/qt4/files/0001-PATCH-make-demos-maximized-for-TISDK-use.patch
new file mode 100644
index 0000000..70f67fd
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt4/files/0001-PATCH-make-demos-maximized-for-TISDK-use.patch
@@ -0,0 +1,48 @@
+From d8d20f1a7b889ee28f786cc1dfaa65b610d63b13 Mon Sep 17 00:00:00 2001
+From: Franklin S. Cooper Jr <fcooper@ti.com>
+Date: Wed, 31 Oct 2012 21:06:01 -0500
+Subject: [PATCH] make demos maximized for TISDK use
+
+* Maximize the weatherinfo and imageviewer demos for use in the TISDK
+
+Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
+---
+ demos/embedded/weatherinfo/weatherinfo.cpp |    5 -----
+ examples/widgets/imageviewer/main.cpp      |    4 ----
+ 2 files changed, 0 insertions(+), 9 deletions(-)
+
+diff --git a/demos/embedded/weatherinfo/weatherinfo.cpp b/demos/embedded/weatherinfo/weatherinfo.cpp
+index 0614149..c47504d 100644
+--- a/demos/embedded/weatherinfo/weatherinfo.cpp
++++ b/demos/embedded/weatherinfo/weatherinfo.cpp
+@@ -492,12 +492,7 @@ int main(int argc, char *argv[])
+     QApplication app(argc, argv);
+ 
+     WeatherInfo w;
+-#if defined(Q_OS_SYMBIAN)
+     w.showMaximized();
+-#else
+-    w.resize(520, 288);
+-    w.show();
+-#endif
+ 
+     return app.exec();
+ }
+diff --git a/examples/widgets/imageviewer/main.cpp b/examples/widgets/imageviewer/main.cpp
+index 8d1a068..35fb80d 100644
+--- a/examples/widgets/imageviewer/main.cpp
++++ b/examples/widgets/imageviewer/main.cpp
+@@ -46,10 +46,6 @@ int main(int argc, char *argv[])
+ {
+     QApplication app(argc, argv);
+     ImageViewer imageViewer;
+-#if defined(Q_OS_SYMBIAN)
+     imageViewer.showMaximized();
+-#else
+-    imageViewer.show();
+-#endif
+     return app.exec();
+ }
+-- 
+1.7.0.4
+
-- 
1.7.0.4


