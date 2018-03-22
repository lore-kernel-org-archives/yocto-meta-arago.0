Return-Path: <x0038811@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 86D55529BD
	for <meta-arago@arago-project.org>;
	Thu, 22 Mar 2018 04:07:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2M4735n025521
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 23:07:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521691623;
	bh=CH0VLZ/+RChijOCXM33vVMVaqFNfrf2yVjp8OS8FfdU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QqWeA5TDlSNGok0f23t71R0ZaQtGJ9amwKKUBo/Sj3szGKiK5B/3EGPyiOa9wb1Fy
	V6B77xD5OuSAivWXjHrcL/hMzX8X2dSqF5OPdYNTJKksaGpAehCE0zjWcs3rDNT1AK
	TFNypGNmoOqtCBxBfk+VLDfgHJbesVBhk/t11uYM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2M472EE002867
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 23:07:02 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 21 Mar 2018 23:07:01 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 21 Mar 2018 23:07:01 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2M46nAT028035;
	Wed, 21 Mar 2018 23:07:00 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Mar 2018 09:36:45 +0530
Message-ID: <1521691605-49259-10-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521691605-49259-1-git-send-email-x0038811@ti.com>
References: <1521691605-49259-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko 9/9] branding-{core, processor-sdk}: re-enable mmip
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
X-List-Received-Date: Thu, 22 Mar 2018 04:07:04 -0000
Content-Type: text/plain

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc          | 4 ----
 meta-arago-distro/conf/distro/include/branding-processor-sdk.inc | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index 10c5acf..2cdaf8b 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -11,9 +11,5 @@ ALTERNATIVE_PRIORITY_pn-opencl-monitor = "1"
 # Raise priority for sample IPC FW images
 ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos = "15"
 
-# Temporarily disable "mmip" machine feature for all SOCs while building
-# latest code base, until it is fixed for gstreamer > 1.10
-MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('mmip', '')}"
-
 # Temporarily disable UBI images for K2 "server" rootfs due to size
 IMAGE_FSTYPES_remove_pn-tisdk-server-rootfs-image = "ubi ubifs"
diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
index 93c575f..cd79078 100644
--- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
@@ -33,9 +33,5 @@ SRCIPK_SHALLOW_DEPTH_pn-linux-ti-staging = "400"
 SRCIPK_CUSTOM_GIT_BRANCH_pn-u-boot-ti-staging = "processor-sdk-local"
 SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-staging = "${SRCIPK_GIT_COMMIT_MESSAGE}"
 
-# Temporarily disable "mmip" machine feature for all SOCs while building
-# latest code base, until it is fixed for gstreamer 1.12
-MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('mmip', '')}"
-
 # Temporarily disable UBI images for K2 "server" rootfs due to size
 IMAGE_FSTYPES_remove_pn-tisdk-server-rootfs-image = "ubi ubifs"
-- 
1.9.1


