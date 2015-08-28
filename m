Return-Path: <h-gou@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 0067F52A97
	for <meta-arago@arago-project.org>;
	Fri, 28 Aug 2015 04:01:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7S41xT1024562
	for <meta-arago@arago-project.org>; Thu, 27 Aug 2015 23:01:59 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7S41xHX003385
	for <meta-arago@arago-project.org>; Thu, 27 Aug 2015 23:01:59 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 27 Aug 2015 23:01:59 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t7S41vig027352;	Thu, 27 Aug 2015 23:01:58 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 28 Aug 2015 00:01:54 -0400
Message-ID: <1440734514-16165-6-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1440734514-16165-1-git-send-email-h-gou@ti.com>
References: <1440734514-16165-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] matrix-gui-3d-demos: update demo dependency for AM3 and AM4
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
X-List-Received-Date: Fri, 28 Aug 2015 04:02:00 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
index 649c673..57bba86 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 S = "${WORKDIR}/git/3d_apps"
 
@@ -44,7 +44,8 @@ do_install_prepend() {
 3D_DEMOS_RDEPENDS_MATRIX = "matrix-gui-apps-images matrix-gui-submenus-3d"
 3D_DEMOS_RDEPENDS = "${3D_DEMOS_RDEPENDS_MATRIX} libgles-omap3-rawdemos"
 3D_DEMOS_RDEPENDS_omap-a15 = "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
-
+3D_DEMOS_RDEPENDS_ti43x    = "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
+3D_DEMOS_RDEPENDS_ti33x    = "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
 
 RDEPENDS_matrix-3d-demo-chameleon = "${3D_DEMOS_RDEPENDS}"
 RDEPENDS_matrix-3d-demo-coverflow = "${3D_DEMOS_RDEPENDS}"
-- 
1.9.1


