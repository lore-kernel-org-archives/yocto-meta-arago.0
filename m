Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CCBDCE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 16:21:54 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13355.1763396506816931098
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Nov 2025 08:21:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=XDxEZemr;
 spf=pass (domain: list.ti.com, ip: 52.101.48.35, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClDqnlRtq4BF8GkSxVKMs1NO1Reaivhn/tVUdsDk2c8Wso4umLlyNV7CZva4V9xaIDNlAGYhnsms7CHHbr9GFv/AQ4yk4bVskwP9WVHRbiHMooStTpeCmKCb+Dcez5xDTs6JF388cdokj7wcAsG+zMa+hu4r9294CXZFxzskUp6tgyLd/Bs19CorHYTvGo7c5yFD0+PnwhvkI0HbZT7DKiSpxES70WOVO89PBNQEHb1FLTvQClzSvzV0zLoUM8tYTk3Te+TeHsQJIQIbaYHTgyrtGipURZdVeQaH+rMwsY6Wav1DymLURazzAIs0av+DzwVzVruNy16KdXLg7aLuAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iNZ1w6mMpOzhdGAYCn8YO/unAnL7UpfJdND18/H618=;
 b=fbSdKzpQ+EUMLAArvNcGpXa+ToQXyJpb0va6Glo8IwtnOv4PnYnDzjY6rO8M/oYyWQAcYecZId7rsSFcyTA3mHIPeHcx9NueXNuF4WKFDh4IhQbxKHIYYZ8EJm1iaDynUjwpP4h0iJt3AsmatNrp8Ebklikdhm6+BXIoEjgS2HtPRf1x3Fw1Vjg7UQLCImLlDB+Ny9zX+uejE/jLhaD0RoDBeFLrHdpBBdKPz/gt21iZe39f06m05NRfe3JjqClAzMzM+pUx88kayX7T8j+CGL1x/t2FK1lgD9AHN40RTDKQiwaWslAy7p7c9mAg14OzCDfFyv0SIGzPbZcCe/nLlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iNZ1w6mMpOzhdGAYCn8YO/unAnL7UpfJdND18/H618=;
 b=XDxEZemr4qw1/OUqnU4PDS95UcFDFGXxWQ7eGDmrn1VIPm2Pe6K7i/MtRVUkAdLHgRAEaYg1X2aChZ5nbu4NFjmZ67OG/sgxlnNPd/O4U5rNmcsF4OnBD7RCODOBPjxeHu7w3YdFvFwH40Vr8ASc6QfnyWyD/70Hdcv2dpFQuri+t8HMA0s8pxiz+Negb9mhW/16xAwln+mrrFssguEyXg97Gb2djihhNBn1l6ntAcH1geO/kvykA4xCAPORcDXwMmOIYXLOFamhhOIdlbYP7jDvMLxuIoPqDtdZh7OftSExn6tYYSuyTDG8UcPXbrYZ+oYRZ3O/2pEuB+QiiZlr0A==
Received: from SJ0PR05CA0097.namprd05.prod.outlook.com (2603:10b6:a03:334::12)
 by IA1PR10MB5969.namprd10.prod.outlook.com (2603:10b6:208:3ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Mon, 17 Nov
 2025 16:21:43 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::cc) by SJ0PR05CA0097.outlook.office365.com
 (2603:10b6:a03:334::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Mon,
 17 Nov 2025 16:21:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 16:21:41 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 10:21:36 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 10:21:36 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 10:21:36 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AHGLaVc3904139;
	Mon, 17 Nov 2025 10:21:36 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 2ECF7142E21; Mon, 17 Nov 2025 10:21:36 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Randolph Sapp <rs@ti.com>
CC: <reatmon@ti.com>, <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] udev-aragoconf: aggregate generic udev rules
Date: Mon, 17 Nov 2025 10:21:36 -0600
Message-ID: <20251117162136.4011468-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251112231224.191420-1-rs@ti.com>
References: <20251112231224.191420-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|IA1PR10MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c2cbd66-3f52-4362-e5a7-08de25f564b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MQLeEBdb9wAVr7cwmVzKOkCjIY+ZaVNQ/Nb1cAfr6qop+lLE7KX9S12MDhzG?=
 =?us-ascii?Q?p9fG/Vy9y/yT8lvlvyyp6YzDTUKiWwGnlKK/O6ovEbNSq0ykoWpjXASuHFRb?=
 =?us-ascii?Q?clOCcne/1zgIu2PVF2xkGtL3k4BkvCNW1sodeW2tyFgnwuiJmTuHTwsZ0roe?=
 =?us-ascii?Q?loHjrFcrwuVUxb2UERjF2qKwzOxALpJ9XuKS4MA9btIC+Hz1w4Gt3jrs05zF?=
 =?us-ascii?Q?kKxRu71zTIO0FItlVwb0of86poxG2ChG2RBzgipMIF4hrINR0/ohtFTUVgbn?=
 =?us-ascii?Q?9Mfgy+DB+NaeMm86DNr4jabd6Qx3ZZYWAFDPo8Jq2tMlJOVq9gMfsdyfO6Mq?=
 =?us-ascii?Q?BqEbh3kdn6Lh7yyEGUmiQG+/VCPX0qHDsNhX5HBpuFbBnJegG0GyqB0CjazN?=
 =?us-ascii?Q?8+Yu5qQ1NoAktV28fEoTXQTFXPe0geWaxZaHldbxrW9yVaQC3j2flQwsF1OA?=
 =?us-ascii?Q?+iUsGzJ+46NXIqrStzsnj3HeMWbHn/3wytJPA4/Sto6GXWeyY8GyL5dFeaq5?=
 =?us-ascii?Q?foG2z+Y1/5qokz47OBxIWasxO4pbv+SvXZAvbkUMGALTIXei77pKxZM/KNqs?=
 =?us-ascii?Q?poCF6Y6RLBQtyv86JTy0la3A5y1cmoUz9hcI9jR6GB/zyjEkj3tdB659sgA4?=
 =?us-ascii?Q?fWnWN4QyxCjRpztvLy3e3XcCGP7rIFViptjvBRk9wIIeFEXnLPKVsaa2ptVL?=
 =?us-ascii?Q?oGqHy2TxAVLnuENCRRn0grWvZnh+6fRrQ3tXoLRc26tFpGJB8PUPLUIn4sPa?=
 =?us-ascii?Q?w16mPhzbN5H/xjfHF/niWK7tF1gtAqwYzEqUfzQpzCMv0JMRyRMhANP87Eck?=
 =?us-ascii?Q?TxA4wd8Q0bfrXN2RhmsAHqfdXhxcOzZENtd4SO5eFTfSj85VQrPACqJuzZxH?=
 =?us-ascii?Q?XlaGSK64xiGWo0d8aSGMnyCYJ03dTGibItwSPIf0t4JtZr4GXu0wStiASgjO?=
 =?us-ascii?Q?vCnE8BrnPpmZ6iv3BNMRwjUU9pxK4On3ZM6XBmRIYSY0UUtVtznlFwNdZtop?=
 =?us-ascii?Q?ou4MhWCUCAepTwDyW3wycMaMujpVpVVB8RZLYyKKWdgMuy/04JawvUj76gEd?=
 =?us-ascii?Q?PXrDLuKBrsnn1bVqr5uaf0zuH5YB0XukrOTRzIvLStKWzMVTzNxD7ZDTs478?=
 =?us-ascii?Q?Pfn3aCYfDYU4k64SR+NWcz9uElErqhDPq9tYVNjMeZg21eA4cVV8mmhvuiaH?=
 =?us-ascii?Q?sYKcWoa2lsufLEQMhewPaiBKhwp4UdP/SFMV194IbEzOX2KZbV3B7a0HEOeS?=
 =?us-ascii?Q?4wUOAARM6QWCq382l7G+JLvqjUDHgtyU3WLP9uAuXrwARUR9QWbbRznYVqGJ?=
 =?us-ascii?Q?o3Lfpbk1pdjQT9VznUxJoV0qAVBgrQ8TrCG0+U2orSbMH1enwgpkTxcS741g?=
 =?us-ascii?Q?3c1mpWjoy4gDyu70ddtWeS6rr4cKKnGeb8JCB4SQtHDXFdnpczucFHkHIHQf?=
 =?us-ascii?Q?rAZEPkBPHsykr3aDkAAHApHul6VFVxQyOP4M8nFMFqVKomsS67HxxIfgQn/F?=
 =?us-ascii?Q?44Pi6TPwuYo/mlhWs1opQnJLeRcaNwsB0ZfEOSVTZW/8Yl5bQMMYEjLXjKar?=
 =?us-ascii?Q?XnEPVUbqNEg3Hp2PnJs=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 16:21:41.8946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c2cbd66-3f52-4362-e5a7-08de25f564b7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5969
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Nov 2025 16:21:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16778

meta-arago / na / 20251112231224.191420-1-rs

PRC Results: FAIL

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
- Patch Series: [meta-arago][master][PATCH] udev-aragoconf: aggregate gener=
ic udev rules
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Wed, 12 Nov 2025 17:12:24 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5b339b4a11faf074f49e0d5591940cad3=
d96a6c5

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202511170100
- Commit SHA: e477705a79159261d49c24fc664e5b039437f3f3

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
  yocto-check-layers: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ERROR: <build-dir>/sources/meta-arago/meta-arago-distro/recipes-core/udev/u=
dev-aragoconf_1.bb: Using S =3D ${WORKDIR} is no longer supported




