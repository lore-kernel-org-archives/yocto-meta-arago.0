Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE843E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 21:01:40 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.91641.1734469299449911178
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 13:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZwAwue3L;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHL1cbg4020528
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 15:01:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734469298;
	bh=VDOxIOQB06XqZTn5jhCH7TgLoqXdH+HrAZkjKJDqyEg=;
	h=From:To:CC:Subject:Date;
	b=ZwAwue3L44txAsjtUR0nxsJA1tRs2yvUKidjG+HD4r0ecb4A/YX3PMLOK6PTMrs4W
	 yMjzASqInL3fvspDkHF0oZzs5/ay6MwMqTvovfDUr/r1H+xIYPYYK7q4UjbHNFz2Sb
	 1IRuFRsoglkwSWs7O91vpMZjON+PaNvQNUnZKK8I=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHL1cw3029762
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Dec 2024 15:01:38 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Dec 2024 15:01:38 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Dec 2024 15:01:38 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHL1bb6111989;
	Tue, 17 Dec 2024 15:01:37 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 1/2] packagegroup-arago-gst: Disable vpe and ducati gstreamer plugins
Date: Tue, 17 Dec 2024 15:01:36 -0600
Message-ID: <20241217210137.46974-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Dec 2024 21:01:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15663

These are not buildable due to missing dependencies, not due to the BSP
version or missing hardware. So do not disable the MACHINE_FEATURE for
the hardware, instead simply remove them from the builds until they
can be fixed.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc       | 3 ---
 meta-arago-distro/conf/distro/include/branding-ltsprep.inc    | 3 ---
 .../recipes-core/packagegroups/packagegroup-arago-gst.bb      | 4 ++--
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index 1d52ed60..48fe36e1 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -8,9 +8,6 @@
 # Raise priority for sample IPC FW images
 ALTERNATIVE_PRIORITY:pn-ti-ipc-rtos = "15"
 
-# Remove mmip - DRM allocator, KMS sink, Wayland sink need porting to GST 1.18
-MACHINE_FEATURES:remove = "mmip"
-
 # GC320 support requires out-of-tree drivers not available in until LTS prep is
 # complete. Disable for now.
 # Remove gc320 - the driver fails to build with gcc12
diff --git a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
index 72bfe0dc..415eee8d 100644
--- a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
+++ b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
@@ -1,8 +1,5 @@
 TI_PREFERRED_BSP = "ti-6_12"
 
-# Remove mmip - DRM allocator, KMS sink, Wayland sink need porting to GST 1.18
-MACHINE_FEATURES:remove = "mmip"
-
 # GC320 support requires out-of-tree drivers not available in until LTS prep is
 # complete. Disable for now.
 MACHINE_FEATURES:remove = "gc320"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index 3bc3bfc1..0aee4773 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -22,8 +22,8 @@ GSTREAMER_DEPS:append:dra7xx = " \
 "
 
 GSTREAMER_ACCEL_MM = ""
-GSTREAMER_ACCEL_MM:omap-a15 = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', "gstreamer1.0-plugins-ducati", '', d)}"
-GSTREAMER_ACCEL_MM:append:dra7xx = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
+#GSTREAMER_ACCEL_MM:omap-a15 = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', "gstreamer1.0-plugins-ducati", '', d)}"
+#GSTREAMER_ACCEL_MM:append:dra7xx = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
 
 RDEPENDS:${PN} = "\
     ${GSTREAMER_DEPS} \
-- 
2.39.2


