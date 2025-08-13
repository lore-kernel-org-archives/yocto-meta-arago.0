Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1A8CA0EF1
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:56 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.10043.1755127548875510539
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fSkNB3L2;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPmLq1803037
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127548; i=@ti.com;
	bh=tHN74TOj8HNFEvIEjrbw15UvAAx/ny0EVrZ+9ApRnNE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fSkNB3L2p6wd9o+XxvRhstcNXheWJzCXkihH1lFK3WrMWm9QIvhpDyVf7JSh+eeu3
	 +VK4pfhmVvZQ4wYnzCOisSaJfZ85E5GDkDPAjbVRzaD9PBsxYwRmXC85AIoiz/U1oh
	 2AdhTY8Z8yCU1UlFuL5n1Z/qXiTZJKkk2XomOPUo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPmpH1412340
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:48 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:48 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:48 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPmaH3611057;
	Wed, 13 Aug 2025 18:25:48 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id DC3FE142E3A; Wed, 13 Aug 2025 18:25:47 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Devarsh Thakkar <devarsht@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <nikhil.nd@ti.com>,
        <nsekhar@ti.com>, <vigneshr@ti.com>, Ryan Eatmon
	<reatmon@ti.com>,
        <a-m1@ti.com>
Subject: Re: [meta-arago][oe-layersetup][master][PATCH] configs: processor-sdk:
Date: Wed, 13 Aug 2025 18:25:47 -0500
Message-ID: <20250813232547.141200-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220428145917.3764-1-devarsht@ti.com>
References: <20220428145917.3764-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16412

meta-arago / na / 20220428145917.3764-1-devarsht

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [meta-arago][oe-layersetup][master][PATCH] configs: processor-sdk: Add AM64x 8.2.0.17 config
    ERROR: Invalid branch specifier: "oe-layersetup". (META-3)
        patch:44
            Subject: [meta-arago][oe-layersetup][master][PATCH] configs: processor-sdk:




