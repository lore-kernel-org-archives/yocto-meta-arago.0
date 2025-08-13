Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D23CA0EF5
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:56 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.10196.1755127551588226896
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=l0xdlgYL;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPpG81803045
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127551; i=@ti.com;
	bh=0nsx9aHYmyIhhcwwoShTQPWfoxWIRYo7F2ZAsrkxW/A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=l0xdlgYLLXT1bocsC+IX5mIj4S/kmOpKmm9UMgBJz92sWNOxt+j1z8Rw7gKDmzRtf
	 6PIkTFHvZErtZRAIWYWpDjaPlYuRu66zwvh/hbXMa/0EauZJ1SnblU7kUkMKT1JYe7
	 J7xlZLqJlGcco0yfrVa0CqSTc8ZdPt4apHmZOPGA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPp0Z727176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:51 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:50 -0500
Received: from fllvdckhpci032.itg.ti.com (fllvdckhpci032.itg.ti.com [10.64.72.43])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPoa23016569;
	Wed, 13 Aug 2025 18:25:50 -0500
Received: by fllvdckhpci032.itg.ti.com (Postfix, from userid 60899)
	id 96C3B1436D0; Wed, 13 Aug 2025 18:25:50 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <khasim@ti.com>,
        <nsekhar@ti.com>, <devarsht@ti.com>, <vigneshr@ti.com>,
        Ryan Eatmon
	<reatmon@ti.com>, <a-m1@ti.com>, <dannenberg@ti.com>
Subject: Re: [meta-arago][oe-layersetup][master][PATCH] configs: processor-sdk:
Date: Wed, 13 Aug 2025 18:25:50 -0500
Message-ID: <20250813232550.2447237-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220601053438.14521-1-s-adivi@ti.com>
References: <20220601053438.14521-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16425

meta-arago / na / 20220601053438.14521-1-s-adivi

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [meta-arago][oe-layersetup][master][PATCH] configs: processor-sdk: add config for 08.03.00.19
    ERROR: Invalid branch specifier: "oe-layersetup". (META-3)
        patch:44
            Subject: [meta-arago][oe-layersetup][master][PATCH] configs: processor-sdk:




