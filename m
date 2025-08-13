Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD60FCA0EE7
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:55 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.10052.1755127551755197636
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xI7HUEco;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPpuW1803049
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127551; i=@ti.com;
	bh=Y5sll/S4JcKjU2qrq7aBDIxf6hIt+W21o7E7UvCOJHQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xI7HUEcoiBXsVp5cABcsc19YD9GK08fVJWsq7WLAL1cqc18n8dN/ULBvAYZTTgt21
	 ywfRaiR5mDzjb0aMXefDbpWMn6ArMQKBGvWEPbnF/Ew6vt470ttCFqDRZHeWuG0OqF
	 SgcSfpfWaLezR2FzdHPUMQv1gcJ777bVN69YGLw4=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPppn1300424
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:51 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:51 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:50 -0500
Received: from fllvdckhpci084.itg.ti.com (fllvdckhpci084.itg.ti.com [10.64.72.30])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPoCg3678241;
	Wed, 13 Aug 2025 18:25:50 -0500
Received: by fllvdckhpci084.itg.ti.com (Postfix, from userid 60899)
	id AE2B7134B38; Wed, 13 Aug 2025 18:25:50 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <g-gupta@ti.com>, <reatmon@ti.com>,
        <khasim@ti.com>, <dannenberg@ti.com>
Subject: Re: [meta-arago][oe-layersetup][master][PATCH] configs: Add oe-config file for 08.04.01.09 Release
Date: Wed, 13 Aug 2025 18:25:50 -0500
Message-ID: <20250813232550.1370184-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20221207173740.20664-1-p-bhagat@ti.com>
References: <20221207173740.20664-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16426

meta-arago / na / 20221207173740.20664-1-p-bhagat

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [meta-arago][oe-layersetup][master][PATCH] configs: Add oe-config file for 08.04.01.09 Release
    ERROR: Invalid branch specifier: "oe-layersetup". (META-3)
        patch:42
            Subject: [meta-arago][oe-layersetup][master][PATCH] configs: Add oe-config file for 08.04.01.09 Release




