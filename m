Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 6D634529AA
	for <meta-arago@arago-project.org>;
	Fri, 12 Oct 2012 05:31:54 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2474688oag.38
	for <meta-arago@arago-project.org>;
	Thu, 11 Oct 2012 22:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=89IOwuWOg220OGXRek8gPfo9rKJfMSX5DbEQS3+3mW4=;
	b=OCNYIdb/NHSGm+9vdnOf3a35XE8BoHGiP3vqmMebYOwCtx+ZjM/gvUFAU0bbRAkQQy
	b09TXvypd90j5sfwiCWRujjMoFwZiI8VjNjkg3nZaF7cxEz8KWd9gmLQ6Y+Bp3IS57/w
	ZZEJp3Lp1gJwgc07WgxN4edjcbRhNREBqP9S3sYp6JsReMb6wDOOmuazuiegdoNlh9JC
	GZu2t/11i2nNPgB/BGvE6kxXedWQR1O4tH8KhHc92RCIryGZEoEDHI0g+mTj+x4CVQdt
	l3bB4n+ZIbEK/8H6yPvK4trdu3/unJd3hGxux+V7A7I5nmTXvyNVHcJ+qGzaUdyDbmkW
	0m6A==
Received: by 10.60.27.229 with SMTP id w5mr2513694oeg.125.1350019913826;
	Thu, 11 Oct 2012 22:31:53 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v3sm4713599oee.0.2012.10.11.22.31.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Oct 2012 22:31:53 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 12 Oct 2012 01:02:43 -0500
Message-Id: <1350021763-12973-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] qt4-embedded: Port Arago patch
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
X-List-Received-Date: Fri, 12 Oct 2012 05:31:54 -0000

* Port patch from Arago to apply to Qt v4.8.0
* Add patch that maximizes the weatherinfo and imageviewer demos.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...d-Maximize-weatherinfo-and-imageviewer-de.patch |   47 ++++++++++++++++++++
 .../recipes-qt/qt4/qt4-embedded_4.8.0.bbappend     |    7 +++-
 2 files changed, 53 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-qt/qt4/files/0001-qt4-embedded-Maximize-weatherinfo-and-imageviewer-de.patch

diff --git a/meta-arago-distro/recipes-qt/qt4/files/0001-qt4-embedded-Maximize-weatherinfo-and-imageviewer-de.patch b/meta-arago-distro/recipes-qt/qt4/files/0001-qt4-embedded-Maximize-weatherinfo-and-imageviewer-de.patch
new file mode 100644
index 0000000..d7dc847
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt4/files/0001-qt4-embedded-Maximize-weatherinfo-and-imageviewer-de.patch
@@ -0,0 +1,47 @@
+From d79e87d256320e3b735e0bb02d1c6588dd211972 Mon Sep 17 00:00:00 2001
+From: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
+Date: Sun, 2 Sep 2012 14:34:47 -0500
+Subject: [PATCH] qt4-embedded: Maximize weatherinfo and imageviewer demos
+
+* Port patch from arago that maximizes the weatherinfo and imageviewer demos
+
+Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
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
diff --git a/meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend b/meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
index 462a746..73cd7f3 100644
--- a/meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
+++ b/meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
@@ -2,4 +2,9 @@
 # For our distribution purposes we only use LGPLv2.1
 LICENSE = "LGPLv2.1"
 
-PR_append = "-arago1"
+PR_append = "-arago2"
+
+# look for files in this layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI += "file://0001-qt4-embedded-Maximize-weatherinfo-and-imageviewer-de.patch"
-- 
1.7.0.4


