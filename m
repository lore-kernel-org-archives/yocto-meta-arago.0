Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0ED3C77B7A
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 16:21:40 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.11.1685636498721422622
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 01 Jun 2023 09:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tbOFqhKD;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 351GLbxu088154;
	Thu, 1 Jun 2023 11:21:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685636497;
	bh=pdvEnejtWW6o2GJ6UYCsorp8WSDVk9Dv5djnz0PEcAQ=;
	h=From:To:Subject:Date;
	b=tbOFqhKDh8rkjCV6UPqMDwbniWiMg3nCOwgUZjW8MCCrT4bWyWcpRloqL9QLYagr2
	 r7eaRGm5BPAVpEOY1i51Fbsg5rosjKiZaZfqGAk80gEXIulvHc9ty116eb62zOUGIO
	 HFxxwUIBQrLgIAj64LOPzA2x55VJF+sBofL0AFYg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 351GLbUr018829
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Jun 2023 11:21:37 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Jun 2023 11:21:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Jun 2023 11:21:37 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 351GLbqN071818;
	Thu, 1 Jun 2023 11:21:37 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1q4l3R-0006ih-Am; Thu, 01 Jun 2023 11:21:37 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] conf: distro: arago.conf: Change FEEDURIPREFIX
Date: Thu, 1 Jun 2023 11:21:37 -0500
Message-ID: <20230601162137.25648-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 01 Jun 2023 16:21:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14488

We are changing around where we store our internal build opkg packages,
so the FEEDURIPREFIX needs to be updated to match the new location.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 379b1d44..c3d87d4d 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -4,7 +4,7 @@ DISTRO_VERSION = "2023.04"
 DISTRO_FEED_URI ?= "http://lcpd.itg.ti.com"
 BUILD_VARIANT = "${@['prod','rt','systest'][int(d.getVar('ARAGO_RT_ENABLE'))+int(d.getVar('ARAGO_SYSTEST_ENABLE'))*2]}"
 TISDK_VERSION ?= "live"
-FEEDURIPREFIX ?= "packages/${DISTRO}-dunfell/${TISDK_VERSION}/${BUILD_VARIANT}/"
+FEEDURIPREFIX ?= "builds/${DISTRO}-master/${BUILD_VARIANT}/${MACHINE}/latest/packages/"
 
 OPKG_ARGS:remove = "--prefer-arch-to-version"
 
-- 
2.17.1


