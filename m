Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767C7C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 11:40:53 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.8291.1699357251955196122
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 03:40:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LyB7vgFb;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: p-bhagat@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A7Bep06001196
	for <meta-arago@lists.yoctoproject.org>; Tue, 7 Nov 2023 05:40:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699357251;
	bh=rrOFBwkgjf5dRfjuN1K6qZPfGSl0Xhnx65q8z4UgoWo=;
	h=From:To:CC:Subject:Date;
	b=LyB7vgFb5DDeyXK1Atdz/FsjSQIJSeX0JVQXoZbp6pZjmGegcHcUJmFzfqUboq23T
	 NMFj5NOf/WoYyKgGwRcmon2UBMO94o3P+kMzYRHm4PrQRYqm5l54oL39ub5edKFCgT
	 ZDVr0Cvid4tgaeFjbPTkSp4gkF+2XiR/81AocE9M=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A7BepmK011969
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 7 Nov 2023 05:40:51 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Nov 2023 05:40:51 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 Nov 2023 05:40:51 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A7BeolQ032922;
	Tue, 7 Nov 2023 05:40:50 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <khasim@ti.com>, <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>
Subject: [kirkstone][PATCH] arago.conf : Change jailhouse inmate ramfs to tisdk-tiny-initramfs
Date: Tue, 7 Nov 2023 17:10:31 +0530
Message-ID: <20231107114031.2318323-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 07 Nov 2023 11:40:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14999

Change the inmate ramfs which is used for jailhouse linux demo
to use a smaller and dedicated tisdk-tiny-initramfs instead of
tisdk-tiny-image.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 8232ca27..3735ed93 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -137,7 +137,7 @@ PACKAGECONFIG:remove:pn-alsa-plugins = "pulseaudio"
 RDEPENDS:pulseaudio-server:remove = "alsa-plugins-pulseaudio-conf"
 
 # Configure RAMFS for jailhouse linux-demo
-JH_RAMFS_IMAGE = "tisdk-tiny-image"
+JH_RAMFS_IMAGE = "tisdk-tiny-initramfs"
 
 # Enable UI and scripting for perf
 PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
-- 
2.34.1


