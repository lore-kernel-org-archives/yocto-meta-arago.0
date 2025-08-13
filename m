Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D91CA0EE5
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:55 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.10206.1755127554585705260
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DPyzbAuL;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPs1a2177606
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127554; i=@ti.com;
	bh=ELZM+i5Z6guEsStpCeqjQF1Si0PP0qsA3PBtNWolgLI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DPyzbAuLASbCxtnz+RlWvyGe7TwGR1qpaNzVOHyBuDKiInBhzpOXPmB45GnnhI+qg
	 X+KwOZAk+AcmgcWx9Zyj98W1QvNRiI6T+66dPnnU9KG4bl7IdPiipVmIT/yTglRX5o
	 xNPVJ4FNvynKI0fWCU0Z0RQet4nz7kIxphs0CA94=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPs3m403444
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:54 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:53 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:53 -0500
Received: from fllvdckhpci033.itg.ti.com (fllvdckhpci033.itg.ti.com [10.64.72.45])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPrZH3678274;
	Wed, 13 Aug 2025 18:25:53 -0500
Received: by fllvdckhpci033.itg.ti.com (Postfix, from userid 60899)
	id C9F479F40F; Wed, 13 Aug 2025 18:25:53 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Aniket Limaye <a-limaye@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <l-weaver@ti.com>, <reatmon@ti.com>
Subject: Re: [meta-arago][oe-layersetup][PATCH] processor-sdk-linux: Add 08.06.01 release config
Date: Wed, 13 Aug 2025 18:25:53 -0500
Message-ID: <20250813232553.2184734-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20230601142744.3618386-1-a-limaye@ti.com>
References: <20230601142744.3618386-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16441

meta-arago / na / 20230601142744.3618386-1-a-limaye

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [meta-arago][oe-layersetup][PATCH] processor-sdk-linux: Add 08.06.01 release config
    ERROR: Invalid branch specifier: "oe-layersetup". (META-3)
        patch:42
            Subject: [meta-arago][oe-layersetup][PATCH] processor-sdk-linux: Add 08.06.01 release config




