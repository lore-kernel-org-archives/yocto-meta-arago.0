Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 7F01052986
	for <meta-arago@arago-project.org>;
	Thu, 15 Feb 2018 22:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 50AED20AA4;
	Thu, 15 Feb 2018 22:32:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bG8bS7CjpVKC; Thu, 15 Feb 2018 22:32:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2BB0B20862;
	Thu, 15 Feb 2018 22:32:29 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id A7BD91632AF;
	Thu, 15 Feb 2018 17:32:28 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 15 Feb 2018 17:32:27 -0500
Message-Id: <1518733947-51895-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] opencv: backport patch "Fix sign() macro redefinition compile-time error"
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
X-List-Received-Date: Thu, 15 Feb 2018 22:32:50 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...ign-macro-redefinition-compile-time-error.patch | 39 ++++++++++++++++++++++
 .../recipes-support/opencv/opencv_3.1.bb           |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/opencv/opencv/0001-Fix-sign-macro-redefinition-compile-time-error.patch

diff --git a/meta-arago-extras/recipes-support/opencv/opencv/0001-Fix-sign-macro-redefinition-compile-time-error.patch b/meta-arago-extras/recipes-support/opencv/opencv/0001-Fix-sign-macro-redefinition-compile-time-error.patch
new file mode 100644
index 0000000..481bccb
--- /dev/null
+++ b/meta-arago-extras/recipes-support/opencv/opencv/0001-Fix-sign-macro-redefinition-compile-time-error.patch
@@ -0,0 +1,39 @@
+From 395db9e7211d58473beafa6a9643d3cd49ad4eb4 Mon Sep 17 00:00:00 2001
+From: Gregory Kramida <algomorph@gmail.com>
+Date: Mon, 23 May 2016 12:56:39 -0400
+Subject: [PATCH] Fix sign() macro redefinition compile-time error
+
+---
+ modules/tracking/include/opencv2/tracking/onlineMIL.hpp | 2 --
+ modules/tracking/src/onlineMIL.cpp                      | 2 ++
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/modules/tracking/include/opencv2/tracking/onlineMIL.hpp b/modules/tracking/include/opencv2/tracking/onlineMIL.hpp
+index b6fc25b..78e1372 100644
+--- a/modules/tracking/include/opencv2/tracking/onlineMIL.hpp
++++ b/modules/tracking/include/opencv2/tracking/onlineMIL.hpp
+@@ -54,8 +54,6 @@ namespace cv
+ //TODO based on the original implementation
+ //http://vision.ucsd.edu/~bbabenko/project_miltrack.shtml
+ 
+-#define  sign(s)  ((s > 0 ) ? 1 : ((s<0) ? -1 : 0))
+-
+ class ClfOnlineStump;
+ 
+ class CV_EXPORTS ClfMilBoost
+diff --git a/modules/tracking/src/onlineMIL.cpp b/modules/tracking/src/onlineMIL.cpp
+index 4fcfb54..29fa9fe 100644
+--- a/modules/tracking/src/onlineMIL.cpp
++++ b/modules/tracking/src/onlineMIL.cpp
+@@ -42,6 +42,8 @@
+ #include "precomp.hpp"
+ #include "opencv2/tracking/onlineMIL.hpp"
+ 
++#define  sign(s)  ((s > 0 ) ? 1 : ((s<0) ? -1 : 0))
++
+ template<class T> class SortableElementRev
+ {
+  public:
+-- 
+2.7.4
+
diff --git a/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb b/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
index 168eeff..acc9d71 100644
--- a/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
     file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
     file://fixgcc60.patch \
     file://fixpkgconfig.patch \
+    file://0001-Fix-sign-macro-redefinition-compile-time-error.patch;patchdir=../contrib \
 "
 
 PV = "3.1+git${SRCPV}"
-- 
2.7.4


