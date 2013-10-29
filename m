Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTP id A1F665299C
	for <meta-arago@arago-project.org>;
	Tue, 29 Oct 2013 21:11:20 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MVG00KIO85VLB21@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 29 Oct 2013 16:10:44 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B5EF2200E5; Tue,
	29 Oct 2013 17:10:43 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 29 Oct 2013 17:10:38 -0400
Message-id: <1383081038-6177-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Cc: "Franklin Cooper Jr." <fcooper@ti.com>
Subject: [PATCH] qtwebkit: adjust one of the patches to apply clean on some hosts
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
X-List-Received-Date: Tue, 29 Oct 2013 21:11:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Franklin Cooper Jr. <fcooper@ti.com>
---
 .../recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch           | 4 ++--
 meta-arago-distro/recipes-qt/qt5/qtwebkit_5.1.1.bbappend              | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch
index 46c93f7..89712a8 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch
@@ -1,6 +1,6 @@
-diff -Nurp8 Source/WebCore/platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.cpp Source/WebCore/platform/graphics/surfaces/qt_new/GraphicsSurfaceGL_NoX.cpp
+diff -Nurp8 Source/WebCore/platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.cpp Source-new/WebCore/platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.cpp
 --- qtwebkit/Source/WebCore/platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.cpp	1970-01-01 05:30:00.000000000 +0530
-+++ qtwebkit/Source/WebCore/platform/graphics/surfaces/qt_new/GraphicsSurfaceGL_NoX.cpp	2013-09-07 13:43:55.186851650 +0530
++++ qtwebkit-new/Source/WebCore/platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.cpp	2013-09-07 13:43:55.186851650 +0530
 @@ -0,0 +1,266 @@
 +/*
 + Copyright (C) 2012 Nokia Corporation and/or its subsidiary(-ies)
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.1.1.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.1.1.bbappend
index aed6b51..e86c8a2 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.1.1.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.1.1.bbappend
@@ -11,4 +11,4 @@ SRC_URI += " \
 	file://WebCore.pri.patch \
 "
 
-PR_append = "-arago0"
+PR_append = "-arago1"
-- 
1.8.3.2


