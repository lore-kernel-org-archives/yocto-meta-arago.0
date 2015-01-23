Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 28F8752A72
	for <meta-arago@arago-project.org>;
	Fri, 23 Jan 2015 03:37:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0N3bwPD025922
	for <meta-arago@arago-project.org>; Thu, 22 Jan 2015 21:37:58 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0N3bvLZ022092
	for <meta-arago@arago-project.org>; Thu, 22 Jan 2015 21:37:57 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 22 Jan 2015 21:37:56 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0N3bmoH021861;	Thu, 22 Jan 2015 21:37:56 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Jan 2015 22:37:45 -0500
Message-ID: <1421984265-11173-7-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1421984265-11173-1-git-send-email-sam.nelson@ti.com>
References: <1421984265-11173-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 7/7] matrix-gui: Add matrix gui for utility applications
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
X-List-Received-Date: Fri, 23 Jan 2015 03:37:59 -0000
Content-Type: text/plain

- Add matrix gui for keystone2 specific utility applications

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 ...demos_2.0.bb => matrix-gui-utility-apps_2.0.bb} |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 copy meta-arago-extras/recipes-core/matrix/{matrix-gui-ks2-demos_2.0.bb => matrix-gui-utility-apps_2.0.bb} (57%)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-ks2-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-apps_2.0.bb
similarity index 57%
copy from meta-arago-extras/recipes-core/matrix/matrix-gui-ks2-demos_2.0.bb
copy to meta-arago-extras/recipes-core/matrix/matrix-gui-utility-apps_2.0.bb
index 1d53122..d6b1d69 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-ks2-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-apps_2.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Matrix GUI for kesytone2 applications"
+DESCRIPTION = "Utility application GUI for Keystone2"
 HOMEPAGE = "http://git.ti.com/cgit/cgit.cgi/keystone-demos/matrix-apps.git"
 
 require matrix-gui-apps-ks2-git.inc
@@ -7,11 +7,11 @@ PR = "${INC_PR}.0"
 
 inherit allarch
 
-S = "${WORKDIR}/git/demo_apps"
+S = "${WORKDIR}/git/utility_apps"
 
-PACKAGES += "${PN}-demos"
+PACKAGES += "${PN}-utility"
 
-# Make sure app images and submenus for ks2 has been installed.
-RDEPENDS_${PN} += "matrix-gui-apps-ks2-images matrix-gui-submenus-ks2"
+# Make sure keystone2 app images and submenus has been installed.
+RDEPENDS_${PN} += "matrix-gui-apps-ks2-images matrix-gui-submenus-ks2-"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
-- 
1.7.9.5


