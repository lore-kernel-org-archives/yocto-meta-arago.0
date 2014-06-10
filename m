Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0CF01529BC
	for <meta-arago@arago-project.org>;
	Tue, 10 Jun 2014 17:40:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5AHeaRm029410
	for <meta-arago@arago-project.org>; Tue, 10 Jun 2014 12:40:36 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5AHeavg020744
	for <meta-arago@arago-project.org>; Tue, 10 Jun 2014 12:40:36 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 10 Jun 2014 12:40:35 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5AHeWqt030009;
	Tue, 10 Jun 2014 12:40:34 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Jun 2014 12:40:30 -0500
Message-ID: <1402422030-3312-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 02/11 v2] qt example apps: Use Makefile.build instead of Makefile for the SDK makefile
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
X-List-Received-Date: Tue, 10 Jun 2014 17:40:37 -0000
Content-Type: text/plain

* This insures that Qt users will have qmake generate "Makefile" instead of
  App-Makefile which is the expected/default behavior.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Changes v2:
Rebase ontop of mainline which required this patch to bump the PR for some
recipes.

 .../recipes-core/matrix/matrix-gui-browser_2.0.bb  |    4 ++--
 .../recipes-core/matrix/refresh-screen_2.0.bb      |    4 ++--
 .../recipes-qt/qt-apps/qt-tstat_2.0.bb             |    4 ++--
 .../recipes-qt/qt-apps/quick-playground_1.0.bb     |    4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
index 7d47e5b..afd5aa3 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
@@ -11,9 +11,9 @@ RDEPENDS_${PN} += "${QT_RDEPENDS_FONTS}"
 
 DEPENDS += "${QT_DEPENDS_WEBKIT}"
 
-PR = "r6"
+PR = "r7"
 
-SRCREV = "8517ac2338295ccb4c6c2ffa58b5ad48659a5430"
+SRCREV = "7f5dccfb5b1b68a3f9162f6ee072eef0e0ba06fe"
 BRANCH ?= "master"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix_browser.git;protocol=git;branch=${BRANCH}"
diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
index fc41f32..50d95fc 100644
--- a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
@@ -9,9 +9,9 @@ inherit qt-provider
 # Make sure that QT font libraries have been installed
 RDEPENDS_${PN} += "${QT_RDEPENDS_FONTS}"
 
-PR = "r5"
+PR = "r6"
 
-SRCREV = "4dfdf85f17033f950e01f25341665f979edde6c3"
+SRCREV = "ad3835b250c8b2b55ae65ffa19c2b85e412826b0"
 BRANCH ?= "master"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/refresh-screen.git;protocol=git;branch=${BRANCH}"
diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
index 1b15f2f..494d582 100644
--- a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
+++ b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
@@ -12,12 +12,12 @@ require recipes-core/matrix/matrix-gui-paths.inc
 
 inherit qt-provider
 
-PR = "r8"
+PR = "r9"
 
 DEPENDS += "${QT_DEPENDS_SVG} ${QT_DEPENDS_SCRIPT}"
 
 BRANCH ?= "master"
-SRCREV = "2960431fd38239cc089c8738776f3ff9dcfe7f1c"
+SRCREV = "2512773c2d9da989e6a42c1e90b2b34496713072"
 
 SRC_URI = " \
 	git://gitorious.org/thermostat-demo/thermostat-demo.git;protocol=git \
diff --git a/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb b/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb
index 5f493d3..2da5a36 100644
--- a/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb
+++ b/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://Licence.txt;md5=7cc88160b55ec5db6c6c5bb8e3238c0b"
 
 require recipes-core/matrix/matrix-gui-paths.inc
 
-PR = "r1"
+PR = "r2"
 
 BRANCH = "master"
-SRCREV = "0be45ce805147798c98b2dee65e41de67bfcea5d"
+SRCREV = "4bcf4e7f5aa68dcd28f54bf921c6cc3985ce4305"
 
 SRC_URI = "git://arago-project.org/git/projects/qt4-demos.git;protocol=git;branch=${BRANCH}"
 
-- 
1.7.0.4


