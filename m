Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 45EDB52A67
	for <meta-arago@arago-project.org>;
	Tue,  3 Mar 2015 08:19:34 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NKM009PGN435X70@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 03 Mar 2015 02:19:15 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=QtXpBu2Y c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8	a=G89pKIJ8sAmKoO9xxUcA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id EF88020142;	Tue,
	3 Mar 2015 03:19:14 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 03 Mar 2015 03:19:14 -0500
Message-id: <1425370754-22484-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1425370754-22484-1-git-send-email-denis@denix.org>
References: <1425370754-22484-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] packagegroup-*-qte: update to include remaining qt5 modules and dependencies
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
X-List-Received-Date: Tue, 03 Mar 2015 08:19:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-qte.bb     | 11 ++++++++---
 .../packagegroups/packagegroup-arago-tisdk-qte.bb            | 12 +++++++-----
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
index 48fdb01..9618de5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
-PR = "r7"
+PR = "r8"
 
 inherit packagegroup
 
@@ -29,11 +29,16 @@ QT4_ESSENTIALS = "\
 QT5_ESSENTIALS = "\
     qtbase-plugins \
     qtdeclarative-plugins \
+    qtdeclarative-qmlplugins \
     qtlocation-plugins \
+    qtlocation-qmlplugins \
     qtmultimedia-plugins \
+    qtmultimedia-qmlplugins \
     qtwayland-plugins \
-    qt3d \
-    qtquick1 \
+    qt3d-qmlplugins \
+    qtwebkit-qmlplugins \
+    qtquick1-plugins \
+    qtquick1-qmlplugins \
 "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index a95a9cd..495247e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
-PR = "r9"
+PR = "r10"
 
 inherit packagegroup
 
@@ -14,12 +14,14 @@ QT4_DEMOS = "\
 "
 
 QT5_DEMOS = "\
-    qtwayland-examples \
-    qtwebkit-examples-examples \
+    qt3d-examples \
+    qtbase-examples \
     qtdeclarative-examples \
+    qtlocation-examples \
     qtmultimedia-examples \
-    qtbase-examples \
-    qt3d-examples \
+    qtscript-examples \
+    qtwayland-examples \
+    qtwebkit-examples-examples \
     qtquick1-examples \
 "
 
-- 
2.2.0


