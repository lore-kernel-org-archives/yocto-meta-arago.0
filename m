Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id BC39D5297D
	for <meta-arago@arago-project.org>;
	Mon, 21 Sep 2015 17:10:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8LHAMNP024879
	for <meta-arago@arago-project.org>; Mon, 21 Sep 2015 12:10:22 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8LHALBu021772
	for <meta-arago@arago-project.org>; Mon, 21 Sep 2015 12:10:22 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 21 Sep 2015 12:10:21 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8LHAL2U028824;
	Mon, 21 Sep 2015 12:10:21 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Ze4bW-0002G9-HA; Mon, 21 Sep 2015 13:10:16 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 21 Sep 2015 13:10:11 -0400
Message-ID: <1442855411-4931-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] branding-processor-sdk: Only reserve CMEM memory for omap-a15
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
X-List-Received-Date: Mon, 21 Sep 2015 17:10:23 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-processor-sdk.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
index ebcc7b5..31507dc 100644
--- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
@@ -5,8 +5,8 @@ DISTRO_FEATURES_remove_ti33x = "wayland"
 DISTRO_FEATURES_remove_ti43x = "wayland"
 
 # Set CMEM reserved memory region
-CMEM_BASE ?= "a0000000"
-CMEM_SIZE ?= "08000000"
+CMEM_BASE_omap-a15 ?= "a0000000"
+CMEM_SIZE_omap-a15 ?= "08000000"
 
 # To create newlines in the message \n is used and the slash must be escaped
 # to function properly
-- 
1.9.1


