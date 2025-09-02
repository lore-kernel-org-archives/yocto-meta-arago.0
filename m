Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14F4CA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 07:25:16 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.71637.1756797914595846271
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 Sep 2025 00:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sH9wHrYo;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5827PEEO2474687
	for <meta-arago@lists.yoctoproject.org>; Tue, 2 Sep 2025 02:25:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756797914; i=@ti.com;
	bh=02lXAJ0VromS99SRUFRSago9jF3ALAfvpfOUxotEbdk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sH9wHrYorvZ3JsrXLPjJ1NssibwKFnp5j104cTdG2HGaxdAZgYtz68VUnO8XKrP2L
	 iuHGjAnCUsmfjW2auoquUSGVqAKPs5iETDCBp7/Cvsm7/JnhD0XXx4xhAyfTKqPFt/
	 t4neh2CXzdCphB3o2xEWqt4b3Pf9AOAtrSfvY0zQ=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5827PEDX2561335
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 2 Sep 2025 02:25:14 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 02:25:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 02:25:13 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5827PDPL3695481;
	Tue, 2 Sep 2025 02:25:13 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9656813F52F; Tue,  2 Sep 2025 02:25:13 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Shreyash Sinha <s-sinha@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: Re: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-linux: Add 11.0 release config
Date: Tue, 2 Sep 2025 02:25:13 -0500
Message-ID: <20250902072513.101454-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250902071959.877763-1-s-sinha@ti.com>
References: <20250902071959.877763-1-s-sinha@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 02 Sep 2025 07:25:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16511

meta-arago / na / 20250902071959.877763-1-s-sinha

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-linux: Add 11.0 release config
    ERROR: Invalid branch specifier: "oe-layersetup". (META-3)
        patch:42
            Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-linux: Add 11.0 release config




