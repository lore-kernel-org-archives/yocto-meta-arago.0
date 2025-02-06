Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A642C02199
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 19:07:07 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.50442.1738868823086385959
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 11:07:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=P8AYQgVs;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516J71fN2784716
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 13:07:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738868821;
	bh=gvzej2wbyJaDxHKOWg42agsldaxmW9HnaUBB5QmWR4Q=;
	h=From:To:CC:Subject:Date;
	b=P8AYQgVsmONHUtsl5k+UE25VPU1oHsrbj6Te+UuypVOsr0IU3xtSnXku3E8Bg5K7m
	 MmnHuN1nstyx/22YF7VwoSHbgx/NekxNGSUaQhCmem2TcUJPoloXQ3qhoJNP9/quCi
	 Mkn2tndWY3Wwk1ouf2+8XKRlFIlrsf/vOoALyNRU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 516J71H8118337
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Feb 2025 13:07:01 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 13:07:01 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 13:07:01 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516J70u6111637;
	Thu, 6 Feb 2025 13:07:01 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 1/5] meta-arago-extras: armnn: Remove default FILESEXTRAPATHS
Date: Thu, 6 Feb 2025 13:06:56 -0600
Message-ID: <20250206190700.1190499-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Feb 2025 19:07:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15830

This is being set to the default value, remove this.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb b/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
index e965382a..d13057c0 100644
--- a/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
+++ b/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
@@ -3,8 +3,6 @@ DESCRIPTION = "Linux software and tools to enable machine learning workloads on
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3e14a924c16f7d828b8335a59da64074"
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-
 BRANCH = "branches/armnn_24_11"
 SRC_URI = "git://github.com/ARM-software/armnn.git;branch=${BRANCH};protocol=https"
 SRC_URI += "file://0001-Fix-type-casting-for-32bit-builds.patch"
-- 
2.39.2


