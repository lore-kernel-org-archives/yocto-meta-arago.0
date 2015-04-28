Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 43AC352093
	for <meta-arago@arago-project.org>;
	Tue, 28 Apr 2015 18:14:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3SIEXmQ031778
	for <meta-arago@arago-project.org>; Tue, 28 Apr 2015 13:14:33 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3SIEWnq018753
	for <meta-arago@arago-project.org>; Tue, 28 Apr 2015 13:14:32 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 28 Apr 2015 13:14:32 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t3SIEVsA030577;	Tue, 28 Apr 2015 13:14:32 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YnA1f-0002r9-NJ;
	Tue, 28 Apr 2015 14:14:31 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 28 Apr 2015 14:14:30 -0400
Message-ID: <1430244870-10948-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] branding-processor-sdk: Use default virutal/kernel provider.
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
X-List-Received-Date: Tue, 28 Apr 2015 18:14:34 -0000
Content-Type: text/plain

* AUTOREV linux, u-boot, and ltp-ddt for all platforms
* Configure linux-ti-staging sourceipk shallow clone to 400 commits.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../conf/distro/include/branding-processor-sdk.inc |   26 ++++----------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
index 3bb724d..3ef3009 100644
--- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
@@ -5,28 +5,10 @@ DISTRO_FEATURES_remove_ti33x = "wayland"
 DISTRO_FEATURES_remove_ti43x = "wayland"
 
 # Set preferred providers and srcrevs
-PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "sitara-linux-ti-staging"
-PREFERRED_PROVIDER_virtual/kernel_am437x-evm = "sitara-linux-ti-staging"
-PREFERRED_VERSION_sitara-linux-ti-staging = "3.14%"
-
 # Auto rev important packages to pick up latest
-#SRCREV_pn-u-boot-ti-staging_omap-a15 = "${AUTOREV}"
-#SRCREV_pn-ltp-ddt_omap-a15 = "${AUTOREV}"
-
-# am3 and am4 use sitara-linux-ti-staging, so this only applies to omap-a15
-#SRCREV_pn-linux-ti-staging = "${AUTOREV}"
-
-# Freeze am3 and am4 u-boot
-PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-ti-staging"
-PREFERRED_VERSION_u-boot-ti-staging_am335x-evm = "2014.07%"
-SRCREV_pn-u-boot-ti-staging_am335x-evm = "7e537bfdd261bf8bf444f3ac4d1be3db4ee124e8"
-
-PREFERRED_PROVIDER_virtual/bootloader_am437x-evm = "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot_am437x-evm = "u-boot-ti-staging"
-PREFERRED_VERSION_u-boot-ti-staging_am437x-evm = "2014.07%"
-SRCREV_pn-u-boot-ti-staging_am437x-evm = "7e537bfdd261bf8bf444f3ac4d1be3db4ee124e8"
-
+SRCREV_pn-u-boot-ti-staging_omap-a15 = "${AUTOREV}"
+SRCREV_pn-ltp-ddt_omap-a15 = "${AUTOREV}"
+SRCREV_pn-linux-ti-staging = "${AUTOREV}"
 
 # To create newlines in the message \n is used and the slash must be escaped
 # to function properly
@@ -53,6 +35,8 @@ SRCIPK_CUSTOM_GIT_MESSAGE_pn-linux-ti-staging = "${SRCIPK_SHALLOW_GIT_COMMIT_MES
 
 SRCIPK_CUSTOM_GIT_BRANCH_pn-sitara-linux-ti-staging = "processor-sdk-1.0"
 SRCIPK_CUSTOM_GIT_MESSAGE_pn-sitara-linux-ti-staging = "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
+SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging = "true"
+SRCIPK_SHALLOW_DEPTH_pn-linux-ti-staging = "400"
 
 SRCIPK_CUSTOM_GIT_BRANCH_pn-u-boot-ti-staging = "processor-sdk-1.0"
 SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-staging = "${SRCIPK_GIT_COMMIT_MESSAGE}"
-- 
1.7.9.5


