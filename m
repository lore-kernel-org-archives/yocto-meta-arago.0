Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165ECC54799
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 17:01:15 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.430.1747674073006477299
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 May 2025 10:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lBjgQ4PU;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54JH1BAs967901;
	Mon, 19 May 2025 12:01:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747674071;
	bh=fOuI7DaKN9DRq/2cDaN4OIVExmoxg2/DsP7N+PyIaLI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=lBjgQ4PUTdyhvUtui/1RirW9og0Bjhe6OLfmq2Rc1G1Ny28q94oZ4iZa6Uwdq8z6u
	 SXEzGtFhbHUhDH84HJco3S/yFTrlbo2B3E9RkZe+U054CKpAcsgRrR/xffv5G0h0N+
	 ugjrw3PW2d9dbj6CuOJVGdiHBSnaL5JiCGNQaX00=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54JH1BCK888485
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 19 May 2025 12:01:11 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 May 2025 12:01:11 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 May 2025 12:01:11 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54JH1BsK100802;
	Mon, 19 May 2025 12:01:11 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uH3rT-0005sM-0G; Mon, 19 May 2025 12:01:11 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 6/8] nbench-byte: Wrap the bbappend in a compliant manner
Date: Mon, 19 May 2025 12:01:08 -0500
Message-ID: <20250519170110.22506-7-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519170110.22506-1-reatmon@ti.com>
References: <20250519170110.22506-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 May 2025 17:01:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16224

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-ti-bsp with ti-soc in the
MACHINE_OVERRIDES would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../{nbench-byte_%.bbappend => nbench-byte-ti.inc}           | 0
 .../recipes-benchmark/nbench-byte/nbench-byte_%.bbappend     | 5 ++++-
 2 files changed, 4 insertions(+), 1 deletion(-)
 copy meta-arago-test/recipes-benchmark/nbench-byte/{nbench-byte_%.bbappend => nbench-byte-ti.inc} (100%)

diff --git a/meta-arago-test/recipes-benchmark/nbench-byte/nbench-byte_%.bbappend b/meta-arago-test/recipes-benchmark/nbench-byte/nbench-byte-ti.inc
similarity index 100%
copy from meta-arago-test/recipes-benchmark/nbench-byte/nbench-byte_%.bbappend
copy to meta-arago-test/recipes-benchmark/nbench-byte/nbench-byte-ti.inc
diff --git a/meta-arago-test/recipes-benchmark/nbench-byte/nbench-byte_%.bbappend b/meta-arago-test/recipes-benchmark/nbench-byte/nbench-byte_%.bbappend
index f571f368..dfe5ea96 100644
--- a/meta-arago-test/recipes-benchmark/nbench-byte/nbench-byte_%.bbappend
+++ b/meta-arago-test/recipes-benchmark/nbench-byte/nbench-byte_%.bbappend
@@ -1 +1,4 @@
-ARM_INSTRUCTION_SET = "arm"
+NBENCH_BYTE_TI = ""
+NBENCH_BYTE_TI:ti-soc = "nbench-byte-ti.inc"
+
+require ${NBENCH_BYTE_TI}
-- 
2.17.1


