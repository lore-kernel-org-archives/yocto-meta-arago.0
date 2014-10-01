Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id BD36A5298E
	for <meta-arago@arago-project.org>;
	Wed,  1 Oct 2014 15:25:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s91FPBFf012488
	for <meta-arago@arago-project.org>; Wed, 1 Oct 2014 10:25:11 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s91FPBZK027233
	for <meta-arago@arago-project.org>; Wed, 1 Oct 2014 10:25:11 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 1 Oct 2014 10:25:11 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s91FPAQn011811;	Wed, 1 Oct 2014 10:25:10 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s91FP76Q013316;	Wed, 1 Oct 2014 20:55:08 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 1 Oct 2014 10:25:07 -0500
Message-ID: <1412177107-9409-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] packagegroup-arago-tisdk-matrix: Don't use ts-calibrate-init if Qt 5 is used
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
X-List-Received-Date: Wed, 01 Oct 2014 15:25:13 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* When Qt 5 is used tslib isn't built so there is need to include this
  calibration script.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-matrix.bb             |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 71f79e0..084811b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r33"
+PR = "r34"
 
 inherit packagegroup
 
@@ -49,7 +49,7 @@ MATRIX_APPS_append_omap3 = "        \
     matrix-multimedia-demo-h264dec      \
     matrix-multimedia-demo-mpeg4aacdec   \
     matrix-multimedia-demo-mpeg4dec     \
-    ts-calibrate-init \
+    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'ts-calibrate-init', d)} \
 "
 
 MATRIX_APPS_append_ti33x = "        \
@@ -66,7 +66,7 @@ MATRIX_APPS_append_ti33x = "        \
     matrix-gui-clocks               \
     matrix-gui-pm-demos-governor    \
                                     \
-    ts-calibrate-init \
+    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'ts-calibrate-init', d)} \
 "
 
 MATRIX_APPS_append_ti43x = "        \
@@ -83,7 +83,7 @@ MATRIX_APPS_append_ti43x = "        \
     matrix-gui-pm-demos-suspend     \
     matrix-gui-clocks               \
     matrix-gui-pm-demos-governor    \
-    ts-calibrate-init \
+    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'ts-calibrate-init', d)} \
 "
 
 MATRIX_APPS_append_omap-a15 = "     \
-- 
1.7.9.5


