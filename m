Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 5566A529A9
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2015 11:45:50 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NLC00J35TZTN060@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 17 Mar 2015 06:45:34 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=ReEn0Opq c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=lRxpQPx1AAAA:8 a=0gcC27t9AAAA:8	a=oR5dmqMzAAAA:8 a=-9mUelKeXuEA:10
	a=emO1SXQWCLwA:10 a=sozttTNsAAAA:8	a=r2I-TmqqRc9_iFBieNkA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B1430200D7;	Tue,
	17 Mar 2015 07:45:29 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 17 Mar 2015 07:45:29 -0400
Message-id: <1426592729-8555-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] matrix*: switch gitorious.org git repos to http
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
X-List-Received-Date: Tue, 17 Mar 2015 11:45:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc   | 4 ++--
 meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb | 4 ++--
 meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb         | 4 ++--
 meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb     | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 8cef18a..2a6ad36 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -3,10 +3,10 @@ LICENSE = "CC-BY-SA-3.0"
 LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
-SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=http;branch=${BRANCH}"
 SRCREV = "e8edfa25cee38f17523c845607c5de5fdd6d1a50"
 BRANCH = "master"
-INC_PR = "r28"
+INC_PR = "r29"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
index cc73456..775b7ce 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
@@ -11,12 +11,12 @@ RDEPENDS_${PN} += "${QT_RDEPENDS_FONTS}"
 
 DEPENDS += "${QT_DEPENDS_WEBKIT}"
 
-PR = "r8"
+PR = "r9"
 
 SRCREV = "7f5dccfb5b1b68a3f9162f6ee072eef0e0ba06fe"
 BRANCH ?= "master"
 
-SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix_browser.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix_browser.git;protocol=http;branch=${BRANCH}"
 
 QT5_DIFF = " \
 	file://qt5-webkit.patch \
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 1b61ff1..8843521 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r21"
+PR = "r22"
 
 INITSCRIPT_NAME = "matrix-gui-2.0"
 INITSCRIPT_PARAMS = "defaults 97"
@@ -18,7 +18,7 @@ inherit update-rc.d
 BRANCH ?= "master"
 SRCREV = "d65a5e1d178bb30653f16322bebf7e7ee530d613"
 
-SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2.git;protocol=git;branch=${BRANCH} \
+SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2.git;protocol=http;branch=${BRANCH} \
            file://init \
            file://php.ini"
 
diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
index 8c36433..09fad98 100644
--- a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
@@ -9,12 +9,12 @@ inherit qt-provider
 # Make sure that QT font libraries have been installed
 RDEPENDS_${PN} += "${QT_RDEPENDS_FONTS}"
 
-PR = "r8"
+PR = "r9"
 
 SRCREV = "4c8817e28ceed2dd886761e3ec1971b11436ba33"
 BRANCH ?= "master"
 
-SRC_URI = "git://gitorious.org/matrix-gui-v2/refresh-screen.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://gitorious.org/matrix-gui-v2/refresh-screen.git;protocol=http;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-- 
2.2.0


