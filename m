Return-Path: <a0866934local@udb0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7D73B529E0
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2015 17:29:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t38HTmvL026527
	for <meta-arago@arago-project.org>; Wed, 8 Apr 2015 12:29:48 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t38HTlEe024406
	for <meta-arago@arago-project.org>; Wed, 8 Apr 2015 12:29:47 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 8 Apr 2015 12:29:47 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t38HTjQE003639;
	Wed, 8 Apr 2015 12:29:46 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YftnN-0000GP-8M;
	Wed, 08 Apr 2015 13:29:45 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 8 Apr 2015 13:29:41 -0400
Message-ID: <1428514181-971-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] branding-processor-sdk: Disable AUTOREV of kernel and u-boot.
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
X-List-Received-Date: Wed, 08 Apr 2015 17:29:49 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../conf/distro/include/branding-processor-sdk.inc |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
index c2327fa..3bb724d 100644
--- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
@@ -10,11 +10,11 @@ PREFERRED_PROVIDER_virtual/kernel_am437x-evm = "sitara-linux-ti-staging"
 PREFERRED_VERSION_sitara-linux-ti-staging = "3.14%"
 
 # Auto rev important packages to pick up latest
-SRCREV_pn-u-boot-ti-staging_omap-a15 = "${AUTOREV}"
-SRCREV_pn-ltp-ddt_omap-a15 = "${AUTOREV}"
+#SRCREV_pn-u-boot-ti-staging_omap-a15 = "${AUTOREV}"
+#SRCREV_pn-ltp-ddt_omap-a15 = "${AUTOREV}"
 
 # am3 and am4 use sitara-linux-ti-staging, so this only applies to omap-a15
-SRCREV_pn-linux-ti-staging = "${AUTOREV}"
+#SRCREV_pn-linux-ti-staging = "${AUTOREV}"
 
 # Freeze am3 and am4 u-boot
 PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-ti-staging"
-- 
1.7.9.5


