Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC37EF4612C
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 14:33:36 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18997.1774276410568603241
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 07:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=NzpGsb1a;
 spf=pass (domain: list.ti.com, ip: 52.101.61.64, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xqr2om5SI191ksDQzZRVSFlBrP8LEtkZV5gnsBQZOKCxlcWMRaLDcRLRm5bFAu4vN5g9HjUh5QmKnrQ+kaOmgzEN6zIwxPdrAWUElLbEAc7CCtK08ITfXxqogofbJGXC/9NNxAYbshI/KEFvGyT/NYAtOQuhNGjzNBpmPPbf7zn2r9ng8aTpobZb8jqiVBx1NTxtAcujdoSZJEOXIQWjijiTcUAz0fv1YmXfKgzmurEdqBKDW+X/BRXnu2ozIuxcGMP4p7/oTjr1jFr+Z/ZtHXIyacNsvhsAQmfZJE84aDG34blf1jCSaxCG1VH1QiIZpTPrgT4WZu7pHKu4YJzkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/N4gmzWk0GlgiCd4Elm/jPABODrsJx1E6j3iTv7PPYI=;
 b=n9VfMv7r4qJrVZ4DJJcbj0kJsxdar7x4XFtPmIBgsVb3+Rj+kmUILCCSYH4T1sQLvNopza8bkN3plnTrZSvtj4P8qZh/HhgBb979YwqJMDK3hoETrZ2ix1a5WrE9H0oER7VeCR7ekM/7W/Dinuls7ctek3NW9cMNZMsn95FdXKdIG9gjrVkjEKVglIJo26cXcTIqnaUHVsezO24ZWetHmE64inaAsXlREM5GV5b5NqvfE1/J8t/+5u5hFFU3ROhWvEsGwhDRat/MIbNbCANuapVGvnVX06wrBIj5eDbg4p0GVULmxEFExOsBZ2LEk7NeQWiC+DeP3OHi2fhAh5osaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/N4gmzWk0GlgiCd4Elm/jPABODrsJx1E6j3iTv7PPYI=;
 b=NzpGsb1aGER6SC6IWIjLbU6U6bXOsE7U0HlyffGxT6hTs5eiWd4/yHy/hKf3lW9DqMqs/TInyNGyMritM3Gi66TvLAKeSogfm6igvuaNd/M6uWxoMaJuf06J0KV8WEItv2efSkWLK7kXnoirkdfFmPjQZ2TsGh8jFJfcCxgp4RFiROLLC19uEKY5m8c2dZLoZ6FAb1+xtDRyHwV9RtgfN4Bk2iOjFF/iEgOZJMBQy8PBV5/dd8aY3YLUPrzdxntOQvd1hKjAy/8jWHnG04Y6nDQ4tzKfqlydPcNR7h/BqdTHD3a9xyz5E3kzd21x1zqO6dmWMwGR2yaD3LU6qXyksQ==
Received: from BN0PR04CA0120.namprd04.prod.outlook.com (2603:10b6:408:ec::35)
 by DS4PPF381FEA7CA.namprd10.prod.outlook.com (2603:10b6:f:fc00::d14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 14:33:23 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:ec:cafe::be) by BN0PR04CA0120.outlook.office365.com
 (2603:10b6:408:ec::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 14:33:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 14:33:22 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 09:33:20 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 09:33:20 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Mar 2026 09:33:20 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62NEXKfV432033;
	Mon, 23 Mar 2026 09:33:20 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 09E75136F37; Mon, 23 Mar 2026 09:33:20 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>
Subject: Re: [meta-arago][master][PATCH 1/2] tisdk-bundle: Improve quote handling and add K3 firmware directory support
Date: Mon, 23 Mar 2026 09:33:20 -0500
Message-ID: <20260323143320.3035239-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260323135442.2056179-1-j-sahu@ti.com>
References: <20260323135442.2056179-1-j-sahu@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|DS4PPF381FEA7CA:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a5f717a-411f-4dee-bac1-08de88e922a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	A06gYU9u2O+IsGZ5LY42kUM/lAhZcIKEzKk5xSzBFZsPIpAbNWxMx9cP4jcQH0r29/2guUBu5BeT/wEVIirEN10nrQQo2t7Un8zjSWOsUl6vZ2mdSh7Tv72rZEXXlgcUeeN+WoEZx14S+F9DbKx34bKH65x1yUQuji/4iJ3Q4RdEHAQW+s2s8A4puHY1AmqmCzzSaOuWossr3UZ/wOhnHqr0OaSGyWMbyhRD9gP9FYq4+MqwM9kFLcFBf1iZWuK7srdoz8wDWQu0yqwskTJIUr3RdmRjDuoS/J/ZxptA9FegIBdEmPmKuPly+tx7xMb8oiQf8a5lChj1+2d/4eWDutO/cBHujyQmOJ6qiB0gJfzcIVy1EAdKHLgCoxkWIoj7aPO/Iiniqp1vf1hhuHGZTfxv9eMefJat9LOZP2DmfBv1IdAqY5S5/MxBGHPqID35H99/x+NqHlcAICfcNPlY/oog3AkwE1dJzL0i1EBznpPQUgEvYoS22d59LnUvkHSHtY26tGsakTPhyuSA1itH3eXDV31YZasD1nQB5kXDs1qek8UNKARh9WX4oHPmsWBHTIa4Lsobjsy7fe2OXAG6OoAYVgSvqSMsTzHcoDqnKzK3yBLmp1TyWZKe/n0NdVittMeE+2DCHtob4emZRbn4cvMoSVUZuBCAlZvb+aDLgcUXAXayjsdA8DzrkEpx6Lc3Xf2F4x9E33mcFFJlAsvjx+Yo6xNyOjpEUGbsxm6VlIT2iks9WUFN2ztPVWUPsvxIFx6xTVECH6VAcyYKDlpQeA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TzE+gbMX5B9rI/0wFh0msruqLWk7IKvLJmrGbZ7n86UyypQlKoPoKWElcbCYRE24OOAkVjWT8qz3TgUQ7BIaliW9BfmeuccDBU75zAUACSUG9GS3YUOV9VQbOk2OEcAzfhKB3E84BpomghlWPUTlV6LKtesxA9VZA0BOcz/W4TC69MxrW5zjlDhS6UbMJYfoDDobT5sYjitdo5mGM+ZfKbqeQu90Uqp0YMBsY07h8s84KQVzRFFCYETqy/vhkBjBrW+7iiwnswuXFEPT/5jQ4vHJiqrrfPqtSv2dMd7H38QAXfyU1N4uM/klEEWsZ+mQMizqC/iomwkwMMlkeU7OdEbHpQy6hipSc2aXJeG8IoGivVJfa7pBaGuwd4DL/DMJtWVdQBkCHTvBc2AmN5qt6j3K1jG+4eZZb96ukuA1hoNvpZnqiuawUBqRPBR1l8+C
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 14:33:22.2017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5f717a-411f-4dee-bac1-08de88e922a4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF381FEA7CA
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 23 Mar 2026 14:33:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17419

meta-arago / na / 20260323135442.2056179-1-j-sahu

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH 1/2] tisdk-bundle: Improve quote=
 handling and add K3 firmware directory support
- Submitter: From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Date: Date: Mon, 23 Mar 2026 19:24:41 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: b3a0316e63f05f73b880d4410a4873b2a=
ad31f03

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: libsdl2: Remove unneeded setting
- Commit SHA: 9c7ac854c1119661806e4afdc5c2c0938315f00f

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




