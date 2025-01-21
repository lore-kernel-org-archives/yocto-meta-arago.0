Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91DE6C02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 17:52:34 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.21961.1737481953680401692
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 09:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hv1r6MRY;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50LHqWYk046359
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 11:52:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737481952;
	bh=pYxd+jbQD3tPoSmnWic+ZqAMLKaByD1wXoy9vlqiTj4=;
	h=From:To:CC:Subject:Date;
	b=hv1r6MRY92r+sKiVcSKSoyN6kKyCjJ26hiuZvkGsb8K4SyyzWlcOM19fdXtLU4ncu
	 x6qfo2OloZWzXCzxc+XRk6FjTfr1n0xOLfAA7+9F0Mq0hIExJif4RT0S+H4wYGdz9+
	 IHAPv9hgNUFPFyJIQoGm1PHboMeJyt9I4yKn3aoY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50LHqWGw026834
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Jan 2025 11:52:32 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 Jan 2025 11:52:32 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 Jan 2025 11:52:32 -0600
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50LHqV98097709;
	Tue, 21 Jan 2025 11:52:32 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH v2 1/7] arago.conf: Remove old and unused config flags
Date: Tue, 21 Jan 2025 11:52:25 -0600
Message-ID: <20250121175231.27183-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jan 2025 17:52:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15720

These are no longer used in any layer, remove these.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v2:
 - No changes

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


