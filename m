Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06189C7EE2E
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 20:05:17 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.8426.1686168314288155112
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 13:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vFBdTCSM;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 357K5Avd023381;
	Wed, 7 Jun 2023 15:05:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686168310;
	bh=PPBQuKNbeA1cqODCUlir48xuIkZrakr8kGkyEq1qYpw=;
	h=From:To:CC:Subject:Date;
	b=vFBdTCSMUQSP+dqjL7koCl06Ue4M4C9VCyxpl99HNfsqIhJTQJ/ZzATJv1Pb+iawe
	 mdFvssAFm7vi9iqxwpr4dZSPBEro5uOc9bOtyShYp1X7zOi0BJ7kFZv7jhNoPdNubV
	 zs9RS2B3nIEjZuVefWsNvGqTyh8BfW04yvHURiGY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 357K5ArE030607
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Jun 2023 15:05:10 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Jun 2023 15:05:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Jun 2023 15:05:10 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 357K5AKu125548;
	Wed, 7 Jun 2023 15:05:10 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>, <nm@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [oe-layersetup][PATCH 00/15] Sacrifice your first born to the linter
Date: Wed, 7 Jun 2023 15:04:49 -0500
Message-ID: <20230607200504.3810426-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Jun 2023 20:05:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14521

From: Randolph Sapp <rs@ti.com>

Last night someone in the beagle community reported some cryptic errors from
oe-layersetup so I took the time to address all of the issues reported
by Shellcheck and add some extra sanity checks.

I tried to split it into reasonable segments.

StaticRocket (15):
  oe-layertool-setup: prefer use of $() notation
  oe-layertool-setup: replace all x comparisons with -n/-z
  oe-layertool-setup: fix all the printf calls
  oe-layertool-setup: fix all quoting, switch eval to export
  oe-layertool-setup: only invoke read with -r
  oe-layertool-setup: check exit code directly
  oe-layertool-setup: guard all cd calls
  oe-layertool-setup: eliminate useless cat
  oe-layertool-setup: use subshell execution with redirect
  oe-layertool-setup: guard against invalid expression in case
  oe-layertool-setup: replace all calls to echo with printf
  oe-layertool-setup: drop unused variable
  oe-layertool-setup: add a path sanity check for oebase
  oe-layertool-setup: fix multi-line printfs
  oe-layertool-setup: add sanity check for layer names

 oe-layertool-setup.sh | 435 +++++++++++++++++++++---------------------
 1 file changed, 220 insertions(+), 215 deletions(-)

-- 
2.40.1


