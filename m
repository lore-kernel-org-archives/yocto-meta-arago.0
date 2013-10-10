Return-Path: <localcontrol@dntsab06real.emea.dhcp.ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 233CB52A81
	for <meta-arago@arago-project.org>;
	Wed,  9 Oct 2013 23:59:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r99Nx14Y000681
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:59:01 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r99Nx1uQ016294
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:59:01 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 9 Oct 2013 18:59:00 -0500
Received: from dntsab06real.emea.dhcp.ti.com (dntsab06real.emea.dhcp.ti.com
	[137.167.84.131])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	r99Nx0XW001400	for <meta-arago@arago-project.org>;
	Wed, 9 Oct 2013 18:59:00 -0500
Received: from dntsab06real.emea.dhcp.ti.com (localhost [127.0.0.1])	by
	dntsab06real.emea.dhcp.ti.com (8.14.4/8.14.4/Debian-2ubuntu2) with
	ESMTP id r9A0vhYY013683	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 01:57:43 +0100
Received: (from localcontrol@localhost)	by dntsab06real.emea.dhcp.ti.com
	(8.14.4/8.14.4/Submit) id r9A0vhUN013682	for
	meta-arago@arago-project.org; Thu, 10 Oct 2013 01:57:43 +0100
From: Roger Monk <r-monk@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 Oct 2013 01:57:32 +0100
Message-ID: <1381366658-13630-6-git-send-email-r-monk@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1381366658-13630-1-git-send-email-r-monk@ti.com>
References: <1381366658-13630-1-git-send-email-r-monk@ti.com>
MIME-Version: 1.0
Subject: [PATCH 05/11] ti-connectivity/wpa-supplicant-wl18xx: Ensure version'd patch applied first
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
X-List-Received-Date: Wed, 09 Oct 2013 23:59:02 -0000
Content-Type: text/plain

Signed-off-by: Roger Monk <r-monk@ti.com>
---
 .../wpa-supplicant-wl18xx_r8.a7.02.bb              |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a7.02.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a7.02.bb
index 0ea9ff5..392bff3 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a7.02.bb
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a7.02.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
                     file://../README;md5=5cb758942d25f6f61fd4ac388fd446fa \
                     file://wpa_supplicant.c;beginline=1;endline=17;md5=8835156c8ab8cad6356ec7f39ebe3aba"
 
-FILESEXTRAPATHS_append := "${THISDIR}/wpa-supplicant:"
+FILESEXTRAPATHS_append := "${THISDIR}/wpa-supplicant-wl18xx-r8.a7.02:${THISDIR}/wpa-supplicant:"
 
 COMPATIBLE_MACHINE = "(omap-a15)"
 
-- 
1.7.9.5


