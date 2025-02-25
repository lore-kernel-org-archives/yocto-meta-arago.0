Return-Path: <y-abhilashchandra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2F0C021BF
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 12:00:31 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.6366.1740484821175157756
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 04:00:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ku0LDWBj;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: y-abhilashchandra@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51PC0JSw1755167
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 06:00:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740484820;
	bh=19JWj4pZ0wS4axOdZXdTtmRLljXMtdiJQ5OvJsM2HbE=;
	h=From:To:CC:Subject:Date;
	b=Ku0LDWBj7UTTWZqV7ifbcBsJCjlPTvVbYq2KRxrWMR/ORA6O7SMYmoIUxaUyyNCtY
	 7Cfv3OxvR6X6FTtEpAoAo6VP4eoq5LDrSsW9ad/xVbZ3o5gMxv5nVDCLhdTMGkRFk5
	 Ohcf5PY/Dii8qIOWcnty7F5b722f90ASVkO7nFZE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51PC0JdB062562
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Feb 2025 06:00:19 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 25
 Feb 2025 06:00:19 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 25 Feb 2025 06:00:19 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51PC0G7W038127;
	Tue, 25 Feb 2025 06:00:17 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <vaishnav.a@ti.com>, <u-kumar1@ti.com>,
        <denys@konsulko.com>, <c-shilwant@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH v2 0/2] Pick overlays for DS90UB954
Date: Tue, 25 Feb 2025 17:30:12 +0530
Message-ID: <20250225120014.102886-1-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 25 Feb 2025 12:00:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15910

DS90UB954-Q1EVM can be used to connect FPDLink-III based sensors to
TI EVMs. So pick overlays for the same.

Link: https://www.ti.com/tool/DS90UB954-Q1EVM

Changelog:
changes in v2:
1. Add an coverletter since this series has multiple patches
2. Correct a minor commit title mistake

v1:https://lore.kernel.org/all/20250225081311.86701-1-y-abhilashchandra@ti.com/

Yemike Abhilash Chandra (2):
  conf: machine: j721e-evm: Pick overlays for DS90UB954
  conf: machine: j721s2/j784s4: Pick overlays for DS90UB954

 meta-ti-bsp/conf/machine/j721e-evm.conf  | 1 +
 meta-ti-bsp/conf/machine/j721s2-evm.conf | 1 +
 meta-ti-bsp/conf/machine/j784s4-evm.conf | 1 +
 3 files changed, 3 insertions(+)

-- 
2.34.1


