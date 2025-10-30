Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 466C3CCF9EB
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 02:53:13 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.4])
 by mx.groups.io with SMTP id smtpd.web11.19430.1761792791996003160
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 19:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=i9jwuFb/;
 spf=pass (domain: list.ti.com, ip: 52.101.56.4, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VS1RxyZ4D+BLsI+K41khiC9sWi042l0kQF72D/SvaZ30vXZ8o5fxpqKDebyvtHuV0YORBz9inakziNhGwSLszz1cW5wpplil+E5h3+hKB2j0QZb8gjvhqe/QSnx9Wadq/sUtFDANetVD58dLDJl3/zzVX7JFVnphv4jhRkyVZUVv/Mo9Byvny2Z7KnAXn9/mT9P7BW9Adgf9bXJzfnT1Y+wvLFx111lQPp4B58M3gP976GrXJeC/OE72VYXe7bBlwWkRJrrnoqKjX+RDfV8rUKsRFv/RGdnDZQS4+YdUChnDgTPGI5PdyXDasjvj2Sat0I+Vq0j2Wpmk5aAcDHeT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/cZSmScW7LyVCbpmbj2OWR33IOS88mkf51pmndoDuE=;
 b=gVtmOmUxI+vRzjOrHdNm5SjcW5qeCchRmlte9BEdmf9MFz6pG5EQS77H5aHVaJu9T6hZyC8+Hn8QTaHILn1Fh9Pi2Lj/reFZ1X5fxSVTWmoCXpujGYwQAlqXW4RKWHepI5jxI66PC1WssBqSXjPru8FN7p3ML4HKxroTgodc13MTzGYOct+gYXWqjHxUzL95WCJMAkFAF8F2AmnrPZ92ZZ5NOgmkN2qRKbZEmLZNyJsmB3LsetY6IOBXPSBJYV6qY7XWe5lDeWRCbuNnYRTRFDAiNlD90Fe5fv4R9edDa+6WKvIWGp1aMVBcqWq8lJSMRagd7Sxl/FLLUIm6eAbM+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/cZSmScW7LyVCbpmbj2OWR33IOS88mkf51pmndoDuE=;
 b=i9jwuFb/3zZamR0VlbbzzpFfD2zktDzUErrjgOcRLxHsO6PhUIy08mlwgsH0Qj4JSGwMIiEioEb8vHYLYeQjhXWXJiPzRRHXEJiVcurm87KvyuvEe4OMY/usIwe67jn/fAjif98hR5SqUuxAxmOqMCx/lLc2MzID7kzUKmazS2FZyLmw5J315xh/PSlfhmQJfBDM3krDL8JDCq41b++btuFqOMctEQKWGomPCxtDmaXPhj2BOwc4pMfyu4GxgBRj7hevWOro4VOHSnJt3r//vpLu9LRHXPTAnYe3ZHFWqH71uaVKJ0JZhYDFpGGiHOOIbCHIk0uoTshQwYjQnk9S2g==
Received: from CY5P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:b::26) by
 SA2PR10MB4524.namprd10.prod.outlook.com (2603:10b6:806:118::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.13; Thu, 30 Oct 2025 02:15:20 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:930:b:cafe::b5) by CY5P221CA0012.outlook.office365.com
 (2603:10b6:930:b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 02:15:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 02:15:19 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 21:15:19 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 21:15:18 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 21:15:18 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59U2FI0M2130764;
	Wed, 29 Oct 2025 21:15:18 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A686B13F532; Wed, 29 Oct 2025 21:15:18 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510291355
Date: Wed, 29 Oct 2025 21:15:18 -0500
Message-ID: <20251030021518.3109246-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251030003121.2151431-1-lcpdbld@list.ti.com>
References: <20251030003121.2151431-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|SA2PR10MB4524:EE_
X-MS-Office365-Filtering-Correlation-Id: e45cd902-7bda-4fae-8cc5-08de175a2cd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|34020700016|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4aOh2FhvGtWqJjVGAoEsYffq8tFZQMOKRHzxiwUviczcoo/umhu60i2oIaOW?=
 =?us-ascii?Q?n3Rhwbm1VvzAenTlW33egEddcNBL5hTDTRW+ps1Ja4p8pro5YR/I8CgUoAL9?=
 =?us-ascii?Q?eZmw1O5tT+AECjfit7funyFbk53nsGKRCakDkFkQKSB8Jc5Tn0Kv4t1RD6EZ?=
 =?us-ascii?Q?XTBoCBy5S2WbPugQ2XrudR14JUVO4jnvNd8ZLZ4FMVEvrikV8ftup+6f272u?=
 =?us-ascii?Q?486H9b8HZUKlGuK6K3X0H3QJe9yEEP/Q3lYIgF962Oe0jUNaoY/5YPy7ouh5?=
 =?us-ascii?Q?Z4kx4DhntA1EMQz84DYbciqJNy6Ck/YOS6z66KZ0seBQOt7E1VDbqBGZw7eC?=
 =?us-ascii?Q?2Qh3IIEuBRKIBo9wravDMARuqu5seeB20UG5UhFecgSP0gcY9GEUU/dHN4KI?=
 =?us-ascii?Q?Tge3wWI+JxRfBZn2gju5dizLKL4CY9Nxmq2QVPn9SicqAj8mohC/tdQ2vXPs?=
 =?us-ascii?Q?ousiykIyKmLHlzSRQ1x6h5QQp4BEWgxaNMC9sptGewXBYsPvEJz1Agdii65j?=
 =?us-ascii?Q?KQ7OQ2NKsNqmTUIYPSuIh4CpTs3pKWZZxqwzHMiDCqyPupMdgx3LT4gT5UM/?=
 =?us-ascii?Q?dJ80Be/VSYkd5U34oezgmxeaP7Fb/M/S8c8VxKbJT2mLTEOc44ZtNcGHKpYN?=
 =?us-ascii?Q?/sp1U9kzQCrZlV+UXbdPqw3axTLYOLTuu/Nw4STvRXBDqMiRdNgccxDPLO8w?=
 =?us-ascii?Q?3N4BaGzvWnWK6/sXpAofBLAdOfVSQtYmTr8WEQlN9rvwvW5/pmHFZVSZJlDH?=
 =?us-ascii?Q?WWPsERNH7uy8imNp3+adpCHp7/5Qu2Ye2OlLJ/gbMfLJqTfSgSqtAB5Znzew?=
 =?us-ascii?Q?EuL0xY2VhOEiux4CgyGCspNvJJEnEw3NO/3ta2QWprSw0gie2Uzr13EnFJg+?=
 =?us-ascii?Q?6X9Vk67TXNfZT+i5ZNafBXRB5nXKBccr7BigzMNqKcLoiG/ZqoKoZF2EU68V?=
 =?us-ascii?Q?A7b23LtVovSQT5tQz6ECpRg7C5cHXMFUOR0OqbONPRngYjMmt11opQ0wz16t?=
 =?us-ascii?Q?gQ3QvgDCyPrBzosgFs8luoUMqdk0DfxX85wFFIsUHViLkxzJGnvFixt7ILSg?=
 =?us-ascii?Q?pFMZs3myoOL3m+404pz6zJ3c3r5OXpgVcTzZPZVNZawKnArVYxxn3OlcmH0n?=
 =?us-ascii?Q?qyXFupswgx1/cwyDnSyEDUaFSOY+wlr5gzXhMNmAcNyoxEdDTOSaI1v4mCHA?=
 =?us-ascii?Q?jrnHSsq+0Glvng3MyASp8mJufUMrPzJ/XerhdEhq7KonpMYyPpZTZ9zMVDQT?=
 =?us-ascii?Q?T8pixQCv437I/A6uRFvCXM993eAt4jjTMwMSlcH6XiDKnat5vc/P/+OUcv+L?=
 =?us-ascii?Q?QPHMefo3T68kQqGGkBQeTeEAP+DiWQcUx9ge+W9O55YEYBNcZi9IHR2Hya3m?=
 =?us-ascii?Q?3kyntAFNhnqGDC/VnQiNwtBYiQCUTIIfgAGio/RaCpa9QxzTBs9KFUDMDU/J?=
 =?us-ascii?Q?SjlCfpx55yWKpI7i1SZKtZGekO4qdX7NEAKIEEOfMDEBr/OCdJFkbfvOrXBX?=
 =?us-ascii?Q?5gWVRzrjHygS3prcgXCiq1olFeZl4fabN0/d3zkbKXDgmcHMt6fZp0/rwQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(34020700016)(36860700013)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 02:15:19.9290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e45cd902-7bda-4fae-8cc5-08de175a2cd3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4524
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 30 Oct 2025 02:53:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16715

meta-arago / na / 20251030003121.2151431-1-lcpdbld

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
WARN - [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202=
510291355
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merg=
er: cicd.scarthgap.202510291355. (COMMIT-MESSAGE-2)
        patch



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scar=
thgap.202510291355
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 29 Oct 2025 19:31:21 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ae4bd0dde80e4b1d37fcd25507195d0ec=
3349f93

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: packagegroup-arago-tisdk-connectivity: Move linux-firmwar=
e-ibt-18 behind guard
- Commit SHA: 5b846befd9ac78b17081222359e6620491ef75fd

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS




