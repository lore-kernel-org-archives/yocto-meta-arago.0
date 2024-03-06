Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806DDC54E4A
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 13:59:59 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.12254.1709733597240153772
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 06 Mar 2024 05:59:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=a19/RNGb;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 426Dxue7094375;
	Wed, 6 Mar 2024 07:59:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709733596;
	bh=gpofuUsoAfBrnTrQJTtqz/dxgwfCt2Qw8wy69HcEU/g=;
	h=From:To:Subject:Date;
	b=a19/RNGb6h5WkXCTdsc6fUf24+7q/NVitIi27RzkPlrmAY4CJ6U+KRyxovH+FQyr+
	 K9e7j35zw370s+qQAR6jecAcq5Zlny0EWx+TV3D0KndByg9dVyEWxJFixtcvc11wer
	 F+8HPd2yioBBApOmLX07aRzzBdBLZFdiDXQ3q6LA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 426DxtJL018864
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Mar 2024 07:59:55 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Mar 2024 07:59:55 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Mar 2024 07:59:55 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 426Dxtd2061535;
	Wed, 6 Mar 2024 07:59:55 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rhroJ-0000ED-Gt; Wed, 06 Mar 2024 07:59:55 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2] websocketd: Add GOPROXY variable
Date: Wed, 6 Mar 2024 07:59:55 -0600
Message-ID: <20240306135955.837-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Mar 2024 13:59:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15228

As of go v1.21, GOPROXY is required to be set to something or you get the
following error:

go: github.com/gorilla/websocket@v1.4.0: GOPROXY list is not the empty string, but contains no entries

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Fix commit message.

 .../recipes-devtools/websocketd/websocketd_0.4.1.bb             | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
index 66475726..207cd38a 100644
--- a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
+++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
@@ -7,6 +7,8 @@ inherit go-mod
 
 GO_IMPORT = "github.com/joewalnes/websocketd"
 
+export GOPROXY = "https://proxy.golang.org,direct"
+
 SRC_URI = "git://${GO_IMPORT};protocol=https;branch=master"
 SRCREV = "035c18cc3e6962dabd5ea2ad8845260726a4a99e"
 
-- 
2.17.1


