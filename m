Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AF2C83F1B
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 19:05:00 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.21693.1752260695989381248
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Jul 2025 12:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xU0/l8UM;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56BJ4s161872480;
	Fri, 11 Jul 2025 14:04:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752260694;
	bh=1Z6e2s63584CKC5Ku6vZJJRMo5+8nUIRVZOP3zlQadY=;
	h=From:To:CC:Subject:Date;
	b=xU0/l8UMcVISxBPYZWH/exo79jm+myfzAzE7unRIBeoUvx5rflX52y/5j376WVVYK
	 Y3lQPYsEa8MzwrdTrxOpoZzRevdQilYZS+ZWuLkTOQUPDflxaac3/QBKe9dGsJ4C37
	 6urVcPPRqVtjzd4ggsADpmtCp1EhPU2gH14pyIHc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56BJ4sLd2571830
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 11 Jul 2025 14:04:54 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 11
 Jul 2025 14:04:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 11 Jul 2025 14:04:53 -0500
Received: from fllvem-mr08.itg.ti.com ([10.250.35.60])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56BJ4rvT3991142;
	Fri, 11 Jul 2025 14:04:53 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH]  packagegroup-arago-tisdk-multimedia: Remove OMAP5-EVM appends
Date: Fri, 11 Jul 2025 14:04:52 -0500
Message-ID: <20250711190452.965034-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 11 Jul 2025 19:05:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16293

We no longer support OMAP5-EVM nor the abefw firmware, remove this.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb      | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 6b0397b3..1aa6b161 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -25,10 +25,6 @@ MULTIMEDIA:append:dra7xx = " \
     hevc-arm-decoder \
 "
 
-MULTIMEDIA:append:omap5-evm = " \
-    abefw \
-"
-
 ACCEL_MM = ""
 
 ACCEL_MM:append:omap-a15 = " \
-- 
2.39.2


