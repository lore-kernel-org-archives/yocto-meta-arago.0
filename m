Return-Path: <jake@udc0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E4C1352A67
	for <meta-arago@arago-project.org>;
	Mon, 10 Aug 2015 14:11:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7AEBkO7017041
	for <meta-arago@arago-project.org>; Mon, 10 Aug 2015 09:11:46 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7AEBkY1006323
	for <meta-arago@arago-project.org>; Mon, 10 Aug 2015 09:11:46 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 10 Aug 2015 09:11:45 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7AEBjQK012238;
	Mon, 10 Aug 2015 09:11:45 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZOnnk-0004SQ-S9; Mon, 10 Aug 2015 10:11:45 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 10 Aug 2015 10:11:13 -0400
Message-ID: <1439215873-14633-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2 2/2] packagegroup-arago-tisdk-matrix: Add accelerated MM demos
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
X-List-Received-Date: Mon, 10 Aug 2015 14:11:47 -0000
Content-Type: text/plain

* Include only demos which use accelerated codecs if "mmip" is a
  feature.
* Include only demos which use non-accelerated codecs if "mmip" is
  not a feature.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* Inlcude mpeg4 demos is "mmip" is not a feature.
* This is so that OOB experience will highlight only accelerated
  codecs when available.

 .../packagegroups/packagegroup-arago-tisdk-matrix.bb           | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 6c4b817..f22be0f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r40"
+PR = "r41"
 
 inherit packagegroup
 
@@ -89,9 +89,11 @@ MATRIX_APPS_append_ti43x = "        \
 
 MATRIX_APPS_append_omap-a15 = "     \
     matrix-multimedia-demo-aac      \
-    matrix-multimedia-demo-h264dec  \
-    matrix-multimedia-demo-mpeg4aacdec \
-    matrix-multimedia-demo-mpeg4dec \
+    ${@base_contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo-ivahdh264dec','matrix-multimedia-demo-h264dec',d)} \
+    ${@base_contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo-ivahdh264enc','',d)} \
+    ${@base_contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec','',d)} \
+    ${@base_contains('MACHINE_FEATURES','mmip','','matrix-multimedia-demo-mpeg4aacdec',d)} \
+    ${@base_contains('MACHINE_FEATURES','mmip','','matrix-multimedia-demo-mpeg4dec',d)} \
     matrix-gui-generic-pm           \
     matrix-gui-clocks               \
     matrix-gui-pm-demos-governor    \
-- 
1.9.1


