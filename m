Return-Path: <a0866934local@udb0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B047952099
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2015 14:58:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2HEwGCI021566
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 09:58:16 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HEwFTv025486
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 09:58:15 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 17 Mar 2015 09:58:15 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HEwFS8002968;
	Tue, 17 Mar 2015 09:58:15 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YXswh-00033P-3b;
	Tue, 17 Mar 2015 10:58:15 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 17 Mar 2015 10:58:12 -0400
Message-ID: <1426604292-11709-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] branding-processor-sdk: Set more preferences
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
X-List-Received-Date: Tue, 17 Mar 2015 14:58:18 -0000
Content-Type: text/plain

* AUTOREV linux-ti-staging and u-boot-ti-staging for omap-a15
* Freeze u-boot for am335x-evm and am437x-evm.
* Add commit message for linux-ti-staging.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../conf/distro/include/branding-processor-sdk.inc |   23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
index d277aac..c2327fa 100644
--- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
@@ -4,10 +4,30 @@ ARAGO_TISDK_IMAGE = "processor-sdk-linux-image"
 DISTRO_FEATURES_remove_ti33x = "wayland"
 DISTRO_FEATURES_remove_ti43x = "wayland"
 
+# Set preferred providers and srcrevs
 PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "sitara-linux-ti-staging"
 PREFERRED_PROVIDER_virtual/kernel_am437x-evm = "sitara-linux-ti-staging"
 PREFERRED_VERSION_sitara-linux-ti-staging = "3.14%"
 
+# Auto rev important packages to pick up latest
+SRCREV_pn-u-boot-ti-staging_omap-a15 = "${AUTOREV}"
+SRCREV_pn-ltp-ddt_omap-a15 = "${AUTOREV}"
+
+# am3 and am4 use sitara-linux-ti-staging, so this only applies to omap-a15
+SRCREV_pn-linux-ti-staging = "${AUTOREV}"
+
+# Freeze am3 and am4 u-boot
+PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-ti-staging"
+PREFERRED_VERSION_u-boot-ti-staging_am335x-evm = "2014.07%"
+SRCREV_pn-u-boot-ti-staging_am335x-evm = "7e537bfdd261bf8bf444f3ac4d1be3db4ee124e8"
+
+PREFERRED_PROVIDER_virtual/bootloader_am437x-evm = "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot_am437x-evm = "u-boot-ti-staging"
+PREFERRED_VERSION_u-boot-ti-staging_am437x-evm = "2014.07%"
+SRCREV_pn-u-boot-ti-staging_am437x-evm = "7e537bfdd261bf8bf444f3ac4d1be3db4ee124e8"
+
+
 # To create newlines in the message \n is used and the slash must be escaped
 # to function properly
 
@@ -28,6 +48,9 @@ script located in the sdk\'s bin directory\\n\
 The script may take several minutes but you will then have a full copy of\\n\
 the git repository including its entire git history.\\n"
 
+SRCIPK_CUSTOM_GIT_BRANCH_pn-linux-ti-staging = "processor-sdk-1.0"
+SRCIPK_CUSTOM_GIT_MESSAGE_pn-linux-ti-staging = "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
+
 SRCIPK_CUSTOM_GIT_BRANCH_pn-sitara-linux-ti-staging = "processor-sdk-1.0"
 SRCIPK_CUSTOM_GIT_MESSAGE_pn-sitara-linux-ti-staging = "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
 
-- 
1.7.9.5


