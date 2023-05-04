Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E06D9C77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 06:03:44 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.43492.1683180218297568958
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 03 May 2023 23:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FQW7p8bz;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: p-bhagat@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34463bW3098316
	for <meta-arago@lists.yoctoproject.org>; Thu, 4 May 2023 01:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683180217;
	bh=9SER+9yVtCapZCATlwcDxDFHGQyA1irLQSHCiV+5Sv0=;
	h=From:To:CC:Subject:Date;
	b=FQW7p8bzlXVwXJslvuE53iHx/gw+z+yTRurXv6CmRlfavgVtFCfDqojYll7gk4SAz
	 EndEmtsCL98vc5++NAUvIHXYpmB4FDyvJhtzP1xyzPcErIcjIVGjKfNkGG17QFTYQe
	 JhWeAul5UeBhblseSYbyWPyOU+xGTFXmSwsDjyU8=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34463brD030206
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 4 May 2023 01:03:37 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 4
 May 2023 01:03:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 4 May 2023 01:03:37 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34463a6h113307;
	Thu, 4 May 2023 01:03:37 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <khasim@ti.com>, <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>,
        <dannenberg@ti.com>
Subject: [kirkstone][PATCH v6] meta-arago-distro: Add Jailhouse support for am62xx
Date: Thu, 4 May 2023 11:33:14 +0530
Message-ID: <20230504060314.20063-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 04 May 2023 06:03:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14398

Update arago conf to add support for jailhouse in am62xx.
Update package group to add support for jailhouse for am62xx.
Optionally build jailhouse for am62xx if ARAGO_JAILHOUSE_ENABLE
is set to 1.

Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                      | 3 +++
 .../packagegroups/packagegroup-arago-tisdk-addons.bb          | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 094e67da..3e4c4644 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -121,6 +121,9 @@ PACKAGECONFIG:append:pn-cairo = " egl glesv2"
 PACKAGECONFIG:remove:pn-alsa-plugins = "pulseaudio"
 RDEPENDS:pulseaudio-server:remove = "alsa-plugins-pulseaudio-conf"
 
+# Configure RAMFS for jailhouse linux-demo
+JH_RAMFS_IMAGE = "tisdk-tiny-image"
+
 # Enable UI and scripting for perf
 PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 8d8a36f6..af701d85 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -59,6 +59,10 @@ UTILS:append:k3 = " mmc-utils \
 
 UTILS:append:k3 = " ti-rtos-firmware"
 UTILS:append:am64xx = " pru-icss"
+
+ARAGO_JAILHOUSE_ENABLE ?= "0"
+UTILS:append:am62xx = " ${@oe.utils.conditional("ARAGO_JAILHOUSE_ENABLE", "1", "jailhouse", "", d)}"
+
 UTILS:append:am65xx = " pru-icss"
 UTILS:append:j721e = " pru-icss"
 
-- 
2.17.1


