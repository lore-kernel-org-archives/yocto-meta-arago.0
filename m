Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5F5CA0EE6
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:26:07 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.10215.1755127557939468283
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TYWOTCQj;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPvgu1803123
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127557; i=@ti.com;
	bh=Ht5rSGL9BEhd/1NKAjgCpU4ff67ia2yDZdv6oAU7teU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TYWOTCQjfshwtiXBn4+ga+rxeUrz/FcQoi8BNnsAsjhe99GPtdsuFJKMKjLtgrZS7
	 pPoWIsxY77hlfk8F/dgHDfrK0UffG2cSLspiU+mINruAfK4Cs6kt0oHtrR/VtV7Gou
	 GePHpfAXK2eTOgca3vcG9Sg2UYiWzPHPc4IyL7ek=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPvKe1412396
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:57 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:57 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:57 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPvbl3678314;
	Wed, 13 Aug 2025 18:25:57 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DB8CD13F538; Wed, 13 Aug 2025 18:25:56 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Devarsh Thakkar <devarsht@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <nikhil.nd@ti.com>,
        <nsekhar@ti.com>, <vigneshr@ti.com>, Ryan Eatmon
	<reatmon@ti.com>,
        <a-m1@ti.com>
Subject: Re: [meta-arago][oe-layersetup][master][PATCH] configs: processor-sdk:
Date: Wed, 13 Aug 2025 18:25:56 -0500
Message-ID: <20250813232556.3936575-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220412122040.5108-1-devarsht@ti.com>
References: <20220412122040.5108-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:26:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16461

meta-arago / na / 20220412122040.5108-1-devarsht

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [meta-arago][oe-layersetup][master][PATCH] configs: processor-sdk: Add AM64x 8.2 config
    ERROR: Invalid branch specifier: "oe-layersetup". (META-3)
        patch:44
            Subject: [meta-arago][oe-layersetup][master][PATCH] configs: processor-sdk:




