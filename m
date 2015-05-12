Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 1EA1252A22
	for <meta-arago@arago-project.org>;
	Tue, 12 May 2015 15:24:55 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NO800GQ8THCVQ00@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 12 May 2015 10:24:53 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=JbALdvP9 c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8	a=owc8VAkSaePvDuC63BsA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 05049200DB;	Tue,
	12 May 2015 11:24:48 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 12 May 2015 11:24:47 -0400
Message-id: <1431444287-25602-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] packagegroup-*-tisdk-matrix: check for wayland DISTRO_FEATURE introduced typo
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
X-List-Received-Date: Tue, 12 May 2015 15:24:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Should use base_contains() not base_conditional(), since it's a list.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index fd9ef70..8400ef5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r38"
+PR = "r39"
 
 inherit packagegroup
 
@@ -66,7 +66,7 @@ MATRIX_APPS_append_ti33x = "        \
     matrix-gui-clocks               \
     matrix-gui-pm-demos-governor    \
                                     \
-    ${@base_conditional('DISTRO_FEATURES', 'wayland', '', 'ts-calibrate-init', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'wayland', '', 'ts-calibrate-init', d)} \
 "
 
 MATRIX_APPS_append_ti43x = "        \
@@ -84,7 +84,7 @@ MATRIX_APPS_append_ti43x = "        \
     matrix-gui-pm-demos-governor    \
     matrix-gui-apps-dual-camera     \
     matrix-gui-apps-image-gallery   \
-    ${@base_conditional('DISTRO_FEATURES', 'wayland', '', 'ts-calibrate-init', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'wayland', '', 'ts-calibrate-init', d)} \
 "
 
 MATRIX_APPS_append_omap-a15 = "     \
-- 
2.2.0


