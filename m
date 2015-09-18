Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id E43915209B
	for <meta-arago@arago-project.org>;
	Fri, 18 Sep 2015 13:32:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8IDWJCa011370
	for <meta-arago@arago-project.org>; Fri, 18 Sep 2015 08:32:19 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8IDWJeW027575
	for <meta-arago@arago-project.org>; Fri, 18 Sep 2015 08:32:19 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 18 Sep 2015 08:32:19 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8IDWI7n000905;
	Fri, 18 Sep 2015 08:32:18 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zcvly-0003Bf-6J; Fri, 18 Sep 2015 09:32:18 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 18 Sep 2015 09:32:16 -0400
Message-ID: <1442583136-12216-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] branding-processor-sdk: Update processor-sdk branding file.
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
X-List-Received-Date: Fri, 18 Sep 2015 13:32:24 -0000
Content-Type: text/plain

* Remove SRCREV overrides
  - These are moved to local.conf per build
* Add CMEM reserved memory region
* Remove version from preserved GIT repo branches to avoid confusion

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../conf/distro/include/branding-processor-sdk.inc        | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
index 3ef3009..ebcc7b5 100644
--- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
@@ -4,11 +4,9 @@ ARAGO_TISDK_IMAGE = "processor-sdk-linux-image"
 DISTRO_FEATURES_remove_ti33x = "wayland"
 DISTRO_FEATURES_remove_ti43x = "wayland"
 
-# Set preferred providers and srcrevs
-# Auto rev important packages to pick up latest
-SRCREV_pn-u-boot-ti-staging_omap-a15 = "${AUTOREV}"
-SRCREV_pn-ltp-ddt_omap-a15 = "${AUTOREV}"
-SRCREV_pn-linux-ti-staging = "${AUTOREV}"
+# Set CMEM reserved memory region
+CMEM_BASE ?= "a0000000"
+CMEM_SIZE ?= "08000000"
 
 # To create newlines in the message \n is used and the slash must be escaped
 # to function properly
@@ -30,13 +28,10 @@ script located in the sdk\'s bin directory\\n\
 The script may take several minutes but you will then have a full copy of\\n\
 the git repository including its entire git history.\\n"
 
-SRCIPK_CUSTOM_GIT_BRANCH_pn-linux-ti-staging = "processor-sdk-1.0"
+SRCIPK_CUSTOM_GIT_BRANCH_pn-linux-ti-staging = "processor-sdk-local"
 SRCIPK_CUSTOM_GIT_MESSAGE_pn-linux-ti-staging = "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
-
-SRCIPK_CUSTOM_GIT_BRANCH_pn-sitara-linux-ti-staging = "processor-sdk-1.0"
-SRCIPK_CUSTOM_GIT_MESSAGE_pn-sitara-linux-ti-staging = "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
 SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging = "true"
 SRCIPK_SHALLOW_DEPTH_pn-linux-ti-staging = "400"
 
-SRCIPK_CUSTOM_GIT_BRANCH_pn-u-boot-ti-staging = "processor-sdk-1.0"
+SRCIPK_CUSTOM_GIT_BRANCH_pn-u-boot-ti-staging = "processor-sdk-local"
 SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-staging = "${SRCIPK_GIT_COMMIT_MESSAGE}"
-- 
1.9.1


