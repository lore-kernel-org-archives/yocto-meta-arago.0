Return-Path: <localcontrol@dntsab06real.emea.dhcp.ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4984452A92
	for <meta-arago@arago-project.org>;
	Wed,  9 Oct 2013 23:57:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r99NvP1Y011927
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:57:25 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r99NvPiI014629
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:57:25 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 9 Oct 2013 18:57:24 -0500
Received: from dntsab06real.emea.dhcp.ti.com (dntsab06real.emea.dhcp.ti.com
	[137.167.84.131])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	r99NvOuU012067	for <meta-arago@arago-project.org>;
	Wed, 9 Oct 2013 18:57:24 -0500
Received: from dntsab06real.emea.dhcp.ti.com (localhost [127.0.0.1])	by
	dntsab06real.emea.dhcp.ti.com (8.14.4/8.14.4/Debian-2ubuntu2) with
	ESMTP id r9A0u77T013622	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 01:56:07 +0100
Received: (from localcontrol@localhost)	by dntsab06real.emea.dhcp.ti.com
	(8.14.4/8.14.4/Submit) id r9A0u7e8013621	for
	meta-arago@arago-project.org; Thu, 10 Oct 2013 01:56:07 +0100
From: Roger Monk <r-monk@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 Oct 2013 01:55:58 +0100
Message-ID: <1381366559-13586-2-git-send-email-r-monk@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1381366559-13586-1-git-send-email-r-monk@ti.com>
References: <1381366559-13586-1-git-send-email-r-monk@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] ti-connectivity/wlconf_r8.a6.01: Fix missing line continuation in install method
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
X-List-Received-Date: Wed, 09 Oct 2013 23:57:27 -0000
Content-Type: text/plain

   * Broken recipe, fix line continuation

Signed-off-by: Roger Monk <r-monk@ti.com>
---
 .../recipes-connectivity/wlconf/wlconf_r8.a6.01.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb
index 8cc932f..8076350 100644
--- a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb
+++ b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb
@@ -25,7 +25,7 @@ do_install() {
 	install -m 0755 README ${D}${bindir}/wlconf/
 	install -m 0755 example.conf ${D}${bindir}/wlconf/
 	install -m 0755 example.ini ${D}${bindir}/wlconf/
-	install -m 0755 ${S}/official_inis/*
+	install -m 0755 ${S}/official_inis/* \
 			${D}${bindir}/wlconf/official_inis/
 }
 
-- 
1.7.9.5


