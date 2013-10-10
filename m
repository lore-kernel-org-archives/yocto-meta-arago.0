Return-Path: <localcontrol@dntsab06real.emea.dhcp.ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6E56952A81
	for <meta-arago@arago-project.org>;
	Wed,  9 Oct 2013 23:59:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r99Nx2qw000688
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:59:02 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r99Nx28c016431
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:59:02 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 9 Oct 2013 18:59:02 -0500
Received: from dntsab06real.emea.dhcp.ti.com (dntsab06real.emea.dhcp.ti.com
	[137.167.84.131])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	r99Nx1aR025792	for <meta-arago@arago-project.org>;
	Wed, 9 Oct 2013 18:59:02 -0500
Received: from dntsab06real.emea.dhcp.ti.com (localhost [127.0.0.1])	by
	dntsab06real.emea.dhcp.ti.com (8.14.4/8.14.4/Debian-2ubuntu2) with
	ESMTP id r9A0viOP013691	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 01:57:44 +0100
Received: (from localcontrol@localhost)	by dntsab06real.emea.dhcp.ti.com
	(8.14.4/8.14.4/Submit) id r9A0vio0013690	for
	meta-arago@arago-project.org; Thu, 10 Oct 2013 01:57:44 +0100
From: Roger Monk <r-monk@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 Oct 2013 01:57:34 +0100
Message-ID: <1381366658-13630-8-git-send-email-r-monk@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1381366658-13630-1-git-send-email-r-monk@ti.com>
References: <1381366658-13630-1-git-send-email-r-monk@ti.com>
MIME-Version: 1.0
Subject: [PATCH 07/11] ti-connectivity/hostap-daemon-wl18xx: Ensure version'd patch applied first
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
X-List-Received-Date: Wed, 09 Oct 2013 23:59:03 -0000
Content-Type: text/plain

Signed-off-by: Roger Monk <r-monk@ti.com>
---
 .../hostap/hostap-daemon-wl18xx_r8.a7.02.bb        |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a7.02.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a7.02.bb
index 734a798..517462c 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a7.02.bb
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a7.02.bb
@@ -10,7 +10,7 @@ COMPATIBLE_MACHINE = "(omap-a15)"
 
 PR_append = "c+gitr${SRCPV}"
 
-FILESEXTRAPATHS_append := "${THISDIR}/hostap-daemon:"
+FILESEXTRAPATHS_append := "${THISDIR}/hostap-daemon-wl18xx-r8.a7.02:${THISDIR}/hostap-daemon:"
 
 # Add TI to the end to make it clear that this is a TI customized version
 # of hostap
-- 
1.7.9.5


