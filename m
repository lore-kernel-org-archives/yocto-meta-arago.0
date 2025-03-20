Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C158C36001
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:10:53 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1862.1742494251263482347
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GOu5wFp/;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAol1684461
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494250;
	bh=BznLTjcdBZvA+f06lcshmJf5aHuYIGQGz+KWsRe4T9c=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=GOu5wFp/MBOu+6r3P34//JcalLL0mlsL1H4cTbsjAMGFenb83vJrsF714BtsopTGx
	 hshfVJdg3wU1HMPkjALFGarG9o2rPa5q4t3nPzSConVler0xATcbo4etmJh7oRYQ+w
	 zuJC9nUM1MyiDAput68wdKM9ThF5d/tyjVRo1oO4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAo4D024534
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 13:10:50 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:10:50 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:10:50 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIAoKN126264;
	Thu, 20 Mar 2025 13:10:50 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKLy-0001Pm-09; Thu, 20 Mar 2025 13:10:50 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 24/26] netperf: Wrap the bbappend in a compliant manner
Date: Thu, 20 Mar 2025 13:10:45 -0500
Message-ID: <20250320181047.18035-25-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250320181047.18035-1-reatmon@ti.com>
References: <20250320181047.18035-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Mar 2025 18:10:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16125

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../netperf/{netperf_git.bbappend => netperf-arago.inc}      | 0
 .../recipes-support/netperf/netperf_git.bbappend             | 5 ++++-
 2 files changed, 4 insertions(+), 1 deletion(-)
 copy meta-arago-distro/recipes-support/netperf/{netperf_git.bbappend => netperf-arago.inc} (100%)

diff --git a/meta-arago-distro/recipes-support/netperf/netperf_git.bbappend b/meta-arago-distro/recipes-support/netperf/netperf-arago.inc
similarity index 100%
copy from meta-arago-distro/recipes-support/netperf/netperf_git.bbappend
copy to meta-arago-distro/recipes-support/netperf/netperf-arago.inc
diff --git a/meta-arago-distro/recipes-support/netperf/netperf_git.bbappend b/meta-arago-distro/recipes-support/netperf/netperf_git.bbappend
index f63b608f..e31e7081 100644
--- a/meta-arago-distro/recipes-support/netperf/netperf_git.bbappend
+++ b/meta-arago-distro/recipes-support/netperf/netperf_git.bbappend
@@ -1 +1,4 @@
-CFLAGS += "-fcommon"
+NETPERF_ARAGO = ""
+NETPERF_ARAGO:arago = "netperf-arago.inc"
+
+require ${NETPERF_ARAGO}
-- 
2.17.1


