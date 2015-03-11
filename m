Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 2CEB052A59
	for <meta-arago@arago-project.org>;
	Wed, 11 Mar 2015 11:49:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2BBn57Z007769
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 06:49:05 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2BBn4KR025616
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 06:49:04 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 06:49:04 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2BBn18f022049;
	Wed, 11 Mar 2015 06:49:03 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 11 Mar 2015 17:18:58 +0530
Message-ID: <1426074538-21653-2-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426074538-21653-1-git-send-email-a0393906@ti.com>
References: <1426074538-21653-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [meta-arago 2/2] packagegroup-*-graphics: Deprecate bltsville
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
X-List-Received-Date: Wed, 11 Mar 2015 11:49:06 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../packagegroup-arago-tisdk-graphics.bb           |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 1043ce5..4cb45dd 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -41,13 +41,7 @@ GRAPHICS_RDEPENDS_omap-a15 = "\
     omapdrm-pvr \
     "
 
-GRAPHICS_BLTSVILLE = ""
-GRAPHICS_BLTSVILLE_omap-a15 = " \
-    bltsville   \
-    "
-
 RDEPENDS_${PN} = "\
     ${@base_conditional('QT_PROVIDER', 'qt4e', "", "${GRAPHICS_WESTON}", d)} \
     ${GRAPHICS_RDEPENDS} \
-    ${GRAPHICS_BLTSVILLE} \
 "
-- 
1.7.9.5


