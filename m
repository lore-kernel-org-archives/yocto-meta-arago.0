Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7655DCA0EE4
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:55 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.10042.1755127548716439020
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bIIs3a7h;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPmjJ1750891
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127548; i=@ti.com;
	bh=vM7yGKRHy4SCrzU5HNUkSiAxgwiDYIkGOVPwtMaR26k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bIIs3a7h2RsngugAdMY7Lf00Aq1G0IrgI9k0bWo8yC7G5nV7uFpQM8En/V9Pqeqtu
	 AY5aq5PgzfFsaVt5KADExki840M9t2JBqOahVQgDuJxZjAqhlT5pi2xMlN80C0JJfr
	 QdmwBD4+xyPRKb4oWOvSeqY1boOl8kC/TGBi+loI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPmpg727158
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:48 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:47 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:47 -0500
Received: from fllvdckhpci098.itg.ti.com (fllvdckhpci098.itg.ti.com [10.64.72.64])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPl5b3678212;
	Wed, 13 Aug 2025 18:25:47 -0500
Received: by fllvdckhpci098.itg.ti.com (Postfix, from userid 60899)
	id 7E4052C3B; Wed, 13 Aug 2025 18:25:47 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Devarsh Thakkar <devarsht@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <khasim@ti.com>,
        <nsekhar@ti.com>, <vigneshr@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <a-m1@ti.com>, <dannenberg@ti.com>
Subject: Re: [meta-arago][oe-layersetup][master][PATCH] configs: processor-sdk:
Date: Wed, 13 Aug 2025 18:25:47 -0500
Message-ID: <20250813232547.1387132-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220510063042.20063-1-devarsht@ti.com>
References: <20220510063042.20063-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16410

meta-arago / na / 20220510063042.20063-1-devarsht

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [meta-arago][oe-layersetup][master][PATCH] configs: processor-sdk: Add AM64x 8.2.0.23 config
    ERROR: Invalid branch specifier: "oe-layersetup". (META-3)
        patch:43
            Subject: [meta-arago][oe-layersetup][master][PATCH] configs: processor-sdk:




