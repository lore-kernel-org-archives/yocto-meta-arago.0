Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B059C87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 17:24:44 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.31009.1754501079924794191
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 06 Aug 2025 10:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RrZXCALm;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: b-padhi@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 576HOdDt624260;
	Wed, 6 Aug 2025 12:24:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754501079;
	bh=l875hwu2yrxcFWE/sliBzPlzax9ykvjeUshzgRCCyg4=;
	h=From:To:CC:Subject:Date;
	b=RrZXCALmczEb3Du1bNLcxEyyduLVcAoQpyft8QBtMWbnJrrfI0lJH+TFeQzQIMStr
	 pI67/4QYYjnWijiC1W1VNxMeA1H0o4i3qvK5Q5GOpNHAoKkV4gQp85U8kincn8YzxB
	 DwZ8Rlp//F7PXyKOBCD1la4V//OEb4KC0bHiI9YU=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 576HOcjS187975
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 6 Aug 2025 12:24:38 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 6
 Aug 2025 12:24:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 6 Aug 2025 12:24:38 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 576HOZ8B4188594;
	Wed, 6 Aug 2025 12:24:36 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>, <b-padhi@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH 0/2] Add more packages for omap-a15 platform
Date: Wed, 6 Aug 2025 22:54:33 +0530
Message-ID: <20250806172435.296187-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Aug 2025 17:24:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16353

Add ti-ipc-examples-linux (for app_host) and ti-rtos-messageq-test-fw (for
prebuilt firmwares) packages into packagegroup addons for omap-a15 platform.

Corresponding meta-ti patches:
https://lore.kernel.org/all/20250806170442.243461-1-b-padhi@ti.com/

Beleswar Padhi (2):
  packagegroup-arago-tisdk-addons: Add ti-ipc-examples-linux for
    omap-a15
  packagegroup-arago-tisdk-addons: Add ti-rtos-messageq-test-fw package

 .../packagegroups/packagegroup-arago-tisdk-addons.bb            | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.34.1


