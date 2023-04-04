Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8B7C761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 15:11:22 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.104341.1680621077182233261
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 04 Apr 2023 08:11:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CIcsAuu9;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 334FBED2116561;
	Tue, 4 Apr 2023 10:11:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680621074;
	bh=LErWOsLXHsk99SkIAtFYixewktmmDtynrDOFpEuNWAA=;
	h=From:To:CC:Subject:Date;
	b=CIcsAuu93q03djlAh8oi3Kk1bNQUtyW4eeKyDwlp4FZ2bZmjqyY01dW+JRlFDZE1Q
	 7UHhdPyB58fEotk+dSFqOskO3HgJ9FmfDw+3IppXiHuVPnLIHek+m24ZT5GYM3e5K9
	 97fKxRejpHwJMTVTcyRMPZRu/Sm/oYQ0OaXOfKXo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 334FBEpp002610
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Apr 2023 10:11:14 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 4
 Apr 2023 10:11:14 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 4 Apr 2023 10:11:14 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 334FBE5N036462;
	Tue, 4 Apr 2023 10:11:14 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH] glmark2: Restricting udev to card0 no longer needed
Date: Tue, 4 Apr 2023 10:11:13 -0500
Message-ID: <20230404151113.6877-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 04 Apr 2023 15:11:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14294

The GPU driver should not be creating a card node, if it does then
that should be fixed in the driver, not hacked around in all these
packages, remove this workaround.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 ...-restrict-udev-enumeration-to-card0-.patch | 38 -------------------
 .../glmark2/glmark2_git.bbappend              |  6 ---
 2 files changed, 44 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-benchmark/glmark2/glmark2/0001-native-state-drm-restrict-udev-enumeration-to-card0-.patch
 delete mode 100644 meta-arago-distro/recipes-benchmark/glmark2/glmark2_git.bbappend

diff --git a/meta-arago-distro/recipes-benchmark/glmark2/glmark2/0001-native-state-drm-restrict-udev-enumeration-to-card0-.patch b/meta-arago-distro/recipes-benchmark/glmark2/glmark2/0001-native-state-drm-restrict-udev-enumeration-to-card0-.patch
deleted file mode 100644
index 48c780cd..00000000
--- a/meta-arago-distro/recipes-benchmark/glmark2/glmark2/0001-native-state-drm-restrict-udev-enumeration-to-card0-.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From bdb9181fc9b8ba0e32129e07be0a92a6bce4dc55 Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Fri, 8 Nov 2019 11:49:28 -0500
-Subject: [PATCH] native-state-drm: restrict udev enumeration to card0 only
-
-In case of separate GPU and Display devices as found in embedded system,
-there could be modeset node and render node controlled by different
-drivers.  The current udev search algorithm does not verify whether
-the GPU DRM node is able to handle modesetting operation and thus select
-an invalid DRM node and then the DRM initialization will fail.
-
-This patch restricts the udev enumeration to card0 to ensure that the
-DRM device corresponding to dispaly is selected as the primarary DRM
-device.
-
-Upstream-Status: Inappropriate [Tentative workaround only]
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- src/native-state-drm.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/native-state-drm.cpp b/src/native-state-drm.cpp
-index dc2b323..cf17d88 100644
---- a/src/native-state-drm.cpp
-+++ b/src/native-state-drm.cpp
-@@ -280,7 +280,7 @@ static std::string udev_main_gpu_drm_node_path()
-     auto dev_enumeration = udev_enumerate_new(udev);
- 
-     udev_enumerate_add_match_subsystem(dev_enumeration, "drm");
--    udev_enumerate_add_match_sysname(dev_enumeration, "card[0-9]*");
-+    udev_enumerate_add_match_sysname(dev_enumeration, "card0");
-     udev_enumerate_scan_devices(dev_enumeration);
- 
-     Log::debug("Looking for the main GPU DRM node...\n");
--- 
-2.17.1
-
diff --git a/meta-arago-distro/recipes-benchmark/glmark2/glmark2_git.bbappend b/meta-arago-distro/recipes-benchmark/glmark2/glmark2_git.bbappend
deleted file mode 100644
index bf4b3ac9..00000000
--- a/meta-arago-distro/recipes-benchmark/glmark2/glmark2_git.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-
-PR:append = ".arago0"
-
-SRC_URI += "file://0001-native-state-drm-restrict-udev-enumeration-to-card0-.patch"
-
-- 
2.39.2


