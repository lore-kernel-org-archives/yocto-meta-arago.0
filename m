Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 053A952A3F
	for <meta-arago@arago-project.org>;
	Mon,  1 Jun 2015 18:55:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t51Its8H001982
	for <meta-arago@arago-project.org>; Mon, 1 Jun 2015 13:55:54 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t51ItsXC028891
	for <meta-arago@arago-project.org>; Mon, 1 Jun 2015 13:55:54 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Jun 2015 13:55:54 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t51ItsvQ004733;	Mon, 1 Jun 2015 13:55:54 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YzUsL-0005cC-Pe;
	Mon, 01 Jun 2015 14:55:53 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 1 Jun 2015 14:55:46 -0400
Message-ID: <1433184950-16151-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1433184950-16151-1-git-send-email-j-stiffler@ti.com>
References: <1433184950-16151-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] packagegroup-arago-tisdk-addons_dra7xx: Add gdbc6x Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
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
X-List-Received-Date: Mon, 01 Jun 2015 18:55:56 -0000
Content-Type: text/plain

---
 .../packagegroup-arago-tisdk-addons.bb             |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 0d8116d..5f0198a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r25"
+PR = "r26"
 
 inherit packagegroup
 
@@ -35,7 +35,7 @@ UTILS_append_am180x-evm = " ti-pru-sw-examples"
 UTILS_append_omap3 = " canutils"
 UTILS_append_ti33x = " canutils"
 UTILS_append_ti43x = " canutils"
-UTILS_append_dra7xx = " canutils dsptop"
+UTILS_append_dra7xx = " canutils dsptop gdbc6x"
 UTILS_append_omap-a15 = " parted"
 
 UTILS_append_ti33x = " switch-config"
-- 
1.7.9.5


