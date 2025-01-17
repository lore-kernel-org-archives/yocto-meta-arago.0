Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55905C0218B
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 21:20:03 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.5926.1737148794479019604
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 13:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=o6ZigAbp;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50HLJqIm261018
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jan 2025 15:19:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737148793;
	bh=fSX9jGM54Mavd0M/h6ZufGrYjxEhDzUl8T3qh0zRLKo=;
	h=From:To:CC:Subject:Date;
	b=o6ZigAbp7IsQ2Eomhy+aGmlKVIodLxr8Eqsh9ZSxBd7w8KwQyjhCb2t2mTW35walt
	 jjXC4YpDmRL3rEjXi8Cb1pQUWi9cEE77wscX8ksyQQHQjOQ6tpUUG2heSIcfMiBWUQ
	 50Z4aO9s5Sy8ubObQuXUkjOSyMq9Te2ML3OhzUJY=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50HLJqLw112891
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Jan 2025 15:19:52 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 Jan 2025 15:19:52 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 Jan 2025 15:19:51 -0600
Received: from fllvsmtp7.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50HLJp5e030757;
	Fri, 17 Jan 2025 15:19:51 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 1/5] arago.conf: Remove old and unused config flags
Date: Fri, 17 Jan 2025 15:19:47 -0600
Message-ID: <20250117211951.698377-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 17 Jan 2025 21:20:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15709

These are no longer used in any layer, remove these.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 8e094e02..6e8c6cb9 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -140,9 +140,6 @@ JH_RAMFS_IMAGE = "tisdk-jailhouse-inmate"
 # Enable UI and scripting for perf
 PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
 
-# Do not warn on meta-gnome w/o x11
-SKIP_META_GNOME_SANITY_CHECK = "1"
-
 ARAGO_KERNEL_SUFFIX ?= ""
 ARAGO_IMAGE_SUFFIX ?= ""
 
@@ -169,17 +166,9 @@ ARAGO_BRAND ??= "core"
 
 require conf/distro/include/branding-${ARAGO_BRAND}.inc
 
-# Disable polkit's systemd configuration from meta-oe
-POLKITAUTH = ""
-
 # Disable meta-virtualization sanity check and warning
 SKIP_META_VIRT_SANITY_CHECK = "1"
 
-# Set ENTERPRISE_DISTRO flag to ensure that recipes that have been flagged
-# do not attempt to enable features that have potential commercial
-# licensing issues.
-ENTERPRISE_DISTRO = "1"
-
 # oe-core uses external libav instead of internal libav for gst-ffmpeg. We
 # disable by default the codecs in libav that causes issues with shipping an
 # Arago based SDK. No need to prevent gst-ffmpeg from being used since we
-- 
2.39.2


