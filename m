Return-Path: <a0866934local@udb0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D596952099
	for <meta-arago@arago-project.org>;
	Wed,  1 Apr 2015 17:08:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t31H8GA3016786
	for <meta-arago@arago-project.org>; Wed, 1 Apr 2015 12:08:16 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t31H8FGU002393
	for <meta-arago@arago-project.org>; Wed, 1 Apr 2015 12:08:15 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 1 Apr 2015 12:08:15 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t31H8FdZ012508;
	Wed, 1 Apr 2015 12:08:15 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YdM7j-0004OA-5p;
	Wed, 01 Apr 2015 13:08:15 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 1 Apr 2015 13:08:09 -0400
Message-ID: <1427908089-16838-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] packagegroup-arago-tisdk-matrix: Remove dual-camera-demo and image-gallery
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
X-List-Received-Date: Wed, 01 Apr 2015 17:08:18 -0000
Content-Type: text/plain

* dual-camera-demo requires some polishing before it can be presented
  in matrix.
* image-gallery is not useful without dual-camera-demo.
* Demo binaries will remain in filesystem and sources wil remain in
  SDK.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroup-arago-tisdk-matrix.bb             |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index a006c52..d724f00 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r37"
+PR = "r38"
 
 inherit packagegroup
 
@@ -82,8 +82,6 @@ MATRIX_APPS_append_ti43x = "        \
     matrix-gui-pm-demos-suspend     \
     matrix-gui-clocks               \
     matrix-gui-pm-demos-governor    \
-    matrix-gui-apps-dual-camera     \
-    matrix-gui-apps-image-gallery   \
     ${@base_conditional('DISTRO_FEATURES', 'wayland', '', 'ts-calibrate-init', d)} \
 "
 
-- 
1.7.9.5


