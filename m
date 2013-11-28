Return-Path: <yanivma@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A887C529E3
	for <meta-arago@arago-project.org>;
	Thu, 28 Nov 2013 11:37:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rASBbBOp007690
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:37:11 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rASBbBMG015846
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:37:11 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 28 Nov 2013 05:37:11 -0600
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	rASBbAHT021298;	Thu, 28 Nov 2013 05:37:11 -0600
From: Yaniv Mahani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 Nov 2013 13:35:20 +0200
Message-ID: <1385638520-11753-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 04/14] hostap-daemon-wl18xx: Removed ol_r8.a6.01 recipe.
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
X-List-Received-Date: Thu, 28 Nov 2013 11:37:13 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

Clean up unsupported version.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../hostap/hostap-daemon-wl18xx_r8.a6.01.bb        |   23 --------------------
 1 files changed, 0 insertions(+), 23 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a6.01.bb

diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a6.01.bb
deleted file mode 100644
index e232b32..0000000
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a6.01.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-# This is a TI specific version of the hostap-daemon recipe for use with the
-# wl18xx wlan and bluetooth module.
-
-require hostap.inc
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e"
-
-PR_append = "b+gitr${SRCPV}"
-
-FILESEXTRAPATHS_append := "${THISDIR}/hostap-daemon:"
-
-# Add TI to the end to make it clear that this is a TI customized version
-# of hostap
-PV = "2.0-devel-ti"
-
-# Tag: ol_r8.a6.01
-SRCREV = "7190ff7dbd43243290b626068ded0d61c5019050"
-
-PROVIDES += "hostap-daemon"
-RPROVIDES_${PN} += "hostap-daemon"
-RREPLACES_${PN} += "hostap-daemon"
-RCONFLICTS_${PN} += "hostap-daemon"
-- 
1.7.9


