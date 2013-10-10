Return-Path: <localcontrol@dntsab06real.emea.dhcp.ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B0B7452AB3
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 15:03:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AF3iaX009941
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:03:44 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AF3iZW008889
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:03:44 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 10 Oct 2013 10:03:44 -0500
Received: from dntsab06real.emea.dhcp.ti.com (dntsab06real.emea.dhcp.ti.com
	[137.167.84.131])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	r9AF3hch014859	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 10:03:44 -0500
Received: from dntsab06real.emea.dhcp.ti.com (localhost [127.0.0.1])	by
	dntsab06real.emea.dhcp.ti.com (8.14.4/8.14.4/Debian-2ubuntu2) with
	ESMTP id r9AG2QMZ016885	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 17:02:27 +0100
Received: (from localcontrol@localhost)	by dntsab06real.emea.dhcp.ti.com
	(8.14.4/8.14.4/Submit) id r9AG2QLi016884	for
	meta-arago@arago-project.org; Thu, 10 Oct 2013 17:02:26 +0100
From: Roger Monk <r-monk@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 Oct 2013 17:02:16 +0100
Message-ID: <1381420942-16810-6-git-send-email-r-monk@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1381420942-16810-1-git-send-email-r-monk@ti.com>
References: <1381420942-16810-1-git-send-email-r-monk@ti.com>
MIME-Version: 1.0
Subject: [PATCHv2 05/11] ti-connectivity/wpa-supplicant-wl18xx: Ensure version'd patch applied first
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
X-List-Received-Date: Thu, 10 Oct 2013 15:03:46 -0000
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


