Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 3CA83529A5
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 18:47:39 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so2638100obb.38
	for <meta-arago@arago-project.org>;
	Thu, 01 Nov 2012 11:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=UfcsEqR54firXXuZlDvIz4910AhDPCJ9tI9WpRE/CwA=;
	b=G0OgqNED3LJofQomLB20yStPLbooz9m9e92rXq33N2upaj+nSzXLi/UjuvmuktnEFd
	sf0ZlXwv3YxsSUNdcoq3vEuAysOPKqGkxK2EofFOp+SLroNqCdANqdFgsoHbFaCqYckd
	Gz1Pcv2i9X/njyPygRPb000V7AHH9IegDhlg8rKU01wqlSg8XbstZYXGi2QqSVpx4sJm
	iiKqJozHHgLbEXXXarJ3aFvkrdHpWU8Mb2pT9jxlaivAh3ZKDR6K8JjWJVgK0wJjU+h9
	WIOFi5AwbFr8kSd+OtV4cxSgWBB3j9WyFwF2Ng/JUBV3h2lw1wGuc8KRPHYHBWmHFjgu
	a5pA==
Received: by 10.60.32.173 with SMTP id k13mr15812300oei.1.1351795659009;
	Thu, 01 Nov 2012 11:47:39 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id k8sm5463473oee.11.2012.11.01.11.47.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 11:47:38 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  1 Nov 2012 13:47:35 -0500
Message-Id: <1351795655-5766-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] arago-qt4.inc: Add maximize window patch for weatherinfo and imageviewer
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
X-List-Received-Date: Thu, 01 Nov 2012 18:47:39 -0000

* Massage a patch from arago to support Qt/E 4.8. This patch maximizes the
  application window for the weatherinfo and imageviewer demo application.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/recipes-qt/qt4/arago-qt4.inc     |    7 +++-
 ...-PATCH-make-demos-maximized-for-TISDK-use.patch |   48 ++++++++++++++++++++
 2 files changed, 54 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-qt/qt4/files/0001-PATCH-make-demos-maximized-for-TISDK-use.patch

diff --git a/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc b/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
index a447fa4..8e20bcb 100644
--- a/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
+++ b/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
@@ -1,8 +1,13 @@
 # Common file for patches or tweaks that are needed by qt4-embedded and
 # qt4-embedded-gles
 
-PR := "${PR}-arago1"
+PR := "${PR}-arago2"
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


