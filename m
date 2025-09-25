Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E554CAC5AA
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 07:46:37 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.5982.1758786389882348688
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 00:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LLs//24t;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: y-hegde@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58P7kRsn1410085;
	Thu, 25 Sep 2025 02:46:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758786387;
	bh=pt1lzrOTqL68+pGHW90QiIFbr7Mc5/mmltiOWxLKrkQ=;
	h=Date:From:To:CC:Subject;
	b=LLs//24t1DBX0ja2+PtpQBmX/oyeD+XkAzcP3vROiTU4kthte3k1N26cV2X7EX1fB
	 W45KzbtYbq2KrdWuzReVcF7EYm3I7nZmokWBVVrfcWX2OVkSbpWRQAY38QauaRjAAF
	 oxaVG0sVlg2fzec8cAdkyWX36DN3Y9nmTFjuzWYo=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58P7kRQR3384327
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 25 Sep 2025 02:46:27 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 25
 Sep 2025 02:46:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 25 Sep 2025 02:46:26 -0500
Received: from localhost (yogi-work-pc.dhcp.ti.com [172.24.233.158])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58P7kPcR3118820;
	Thu, 25 Sep 2025 02:46:26 -0500
Date: Thu, 25 Sep 2025 13:16:24 +0530
From: Yogesh Hegde <y-hegde@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Prudhvi Veeramachaneni <prudhvi@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH v2]
 packagegroup-arago-tisdk-connectivity: Restrict BT_TI to legacy platforms
Message-ID: <20250925074624.ozym2jd6qlxczwtr@yogi-work-pc>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 25 Sep 2025 07:46:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16628

The bt-enable and bt-fw packages are only applicable for AM33X, AM43X and AM57XX
legacy platforms, but was being included for all machines. While the
bt-enable script performs noop for unsupported machines, it still adds
unnecessary overhead to boot time and generates log noise.

Restrict the bt-enable and bt-fw packages to only be included for the
specific machine overrides (ti33x, ti43x, am57xx) that actually require
Bluetooth enablement support.

Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
---
v2:
- Improved the subject as suggested by Ryan
- Implemented the change to use CONNECTIVITY_RDEPENDS instead of BT_TI 
  variable as suggested by Ryan

 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb   | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 5a91357b..0a8d4493 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -63,9 +63,12 @@ CONNECTIVITY_RDEPENDS = " \
     ${WLAN_COMMON} \
     ${WLAN_TI} \
     ${BT_COMMON} \
-    ${BT_TI} \
 "
 
+CONNECTIVITY_RDEPENDS:append:ti33x = " ${BT_TI}"
+CONNECTIVITY_RDEPENDS:append:ti43x = " ${BT_TI}"
+CONNECTIVITY_RDEPENDS:append:am57xx = " ${BT_TI}"
+
 RDEPENDS:${PN} = "\
     ${CONNECTIVITY_RDEPENDS} \
 "
-- 
2.34.1


