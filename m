Return-Path: <localcontrol@dntsab06real.emea.dhcp.ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id AF2B9529B0
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 15:03:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AF3ked009947
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:03:46 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AF3ksT008946
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:03:46 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 10 Oct 2013 10:03:46 -0500
Received: from dntsab06real.emea.dhcp.ti.com (dntsab06real.emea.dhcp.ti.com
	[137.167.84.131])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	r9AF3kv9003260	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 10:03:46 -0500
Received: from dntsab06real.emea.dhcp.ti.com (localhost [127.0.0.1])	by
	dntsab06real.emea.dhcp.ti.com (8.14.4/8.14.4/Debian-2ubuntu2) with
	ESMTP id r9AG2TvI016901	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 17:02:29 +0100
Received: (from localcontrol@localhost)	by dntsab06real.emea.dhcp.ti.com
	(8.14.4/8.14.4/Submit) id r9AG2SIB016900	for
	meta-arago@arago-project.org; Thu, 10 Oct 2013 17:02:28 +0100
From: Roger Monk <r-monk@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 Oct 2013 17:02:20 +0100
Message-ID: <1381420942-16810-10-git-send-email-r-monk@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1381420942-16810-1-git-send-email-r-monk@ti.com>
References: <1381420942-16810-1-git-send-email-r-monk@ti.com>
MIME-Version: 1.0
Subject: [PATCHv2 09/11] ti-connectivity/ti-wifi-utils-wl18xx: Add Wilink8 r8.a7.02
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
X-List-Received-Date: Thu, 10 Oct 2013 15:03:48 -0000
Content-Type: text/plain

   * Add v r8.a7.02 engineering release wifi utilities for wilink8
   * This release supports the omap-a15 devices (omap5-evm/dra7-evm) with ES 2.1 WL8
   * OMAP5432 UEVMs with the following SKU contain ES2.1 Wilink8 TDK 18xx module
      * OMAP5432x-xx-x1-xx

Signed-off-by: Roger Monk <r-monk@ti.com>
---
 ...8.a6.01.bb => ti-wifi-utils-wl18xx_r8.a7.02.bb} |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 copy meta-arago-extras/recipes-devtools/ti-wifi-utils/{ti-wifi-utils-wl18xx_r8.a6.01.bb => ti-wifi-utils-wl18xx_r8.a7.02.bb} (83%)

diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a7.02.bb
similarity index 83%
copy from meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a6.01.bb
copy to meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a7.02.bb
index eab94fa..fab2ee1 100644
--- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a6.01.bb
+++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a7.02.bb
@@ -2,13 +2,15 @@ DESCRIPTION = "The calibrator and other useful utilities for TI wireless solutio
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
 
+COMPATIBLE_MACHINE = "(omap-a15)"
+
 DEPENDS = "libnl"
 RDEPENDS_${PN} = "ti-compat-wireless-wl12xx wl12xx-firmware"
 
-PR ="r3+gitr${SRCPV}"
+PR ="r1+gitr${SRCPV}"
 
-# Tag: ol_r8.a6.01
-SRCREV = "214dfbdf97cc390b0020c4ea9331a1cf82240a64"
+# Tag: ol_r8.a7.02
+SRCREV = "badbb7ecb70971857e4863c792a40e91f4f0a985"
 SRC_URI = "git://github.com/TI-OpenLink/18xx-ti-utils.git \
 "
 
-- 
1.7.9.5


