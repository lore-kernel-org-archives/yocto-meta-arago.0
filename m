Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7A9D7495D
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 06:37:07 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11714.1766126225292162437
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 18 Dec 2025 22:37:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=T57/gGYV;
 spf=pass (domain: list.ti.com, ip: 40.107.200.49, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AumHmozMOiY7f5FQDN3OcNr9gH/Yo8qiCvqPk9Nr82F8WsjO1JmXcmISOEw0XxQGn6uGV4J8dL1E4Nad8L2wcbT5HKSV68u1ArNMhootCTEQf+xX9r5y2s9os+C9c/dvfTze27HuFCZ3daNE98vaXR3jG+yxAFFYg7u3wjsNztNtyWkchoQK0FcLsVQegmrDmX9SFZLnXAAp4+4OcmapN4xTruC1peYxF50tlW/ajKyS9VHK9C7WJ+WDLh54VJCwx0Wd9ZN7+tdYTIUtKvBNESQ+rGfzUjizBmZr1C11u+0cjqhcoAgll0wgz4YJTZAZVPZVVqbIdkoJRfD57UyQWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4efUGVmj1llz5rzVqbieMKOFthzQWGYWIgpwoEpzx4=;
 b=GamuhyWZzaXcsvZ0P3jGg7nKhHm9/UaSceDx0XVBMD/ayFxbHgtF5Bj/mAcnSipI8ieCsWu4FJgTp+2P+DRt9fvk7d/g6Z7TLJUyKLVmPKL5tWUrxCb16ZxUCGidc6L5WQBPi+8JgCYaU40cVVrV7L2SRss5B1md65k1Syt9d0y0uPTTcYanlH0r7CTccYb4Bjf6hMY1clJL89jqQJQufd0VQhR60Zy4+U0ySvqlkZ5FfqznZwpSFhgC0nHcpIcr0k+aDXkqH8qDZMpra1Ssb4XFTv1KryLWnT9dG80xHvFYG4hpfU8BiDIgM3HTRcxceFHijzaAyhLqT7IznyJvng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4efUGVmj1llz5rzVqbieMKOFthzQWGYWIgpwoEpzx4=;
 b=T57/gGYV4/4jSNcLGiR8XSjZp0b1pf/TdrUBhKDXb+8A5mCy8PNY0IAXIetCDkYO0Izlnl+srUk6IGH9ZoTariWYvgW9g2uhs6Owrw5tLUWo/L9Tds7axZLDZcAfPgdqMouFC1kT8O8mwMgssOlA6MzU/nLibLbtIDwCR5BF6lkycUkzj7LjySupzbtHV6qagUWQXKVGf+2w3Gm9P9ROyfoaGRJaOrWwtNMpr9z+BuiQgjBWPywA+YBhVgCYU0j7z+6p61fp/GMKBpPlDX5f0sqQxOYniw+5RPe2AdZHbLsZpVDGrUd1omO0NVhrwiSXv41ofxzYw6ny+myPAE762A==
Received: from CH0P221CA0048.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::29)
 by CH3PR10MB6689.namprd10.prod.outlook.com (2603:10b6:610:153::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 06:37:03 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::17) by CH0P221CA0048.outlook.office365.com
 (2603:10b6:610:11d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 06:36:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 06:37:02 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 00:36:58 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 00:36:58 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 00:36:58 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BJ6awfv1774508;
	Fri, 19 Dec 2025 00:36:58 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3DA879ACF4; Fri, 19 Dec 2025 00:36:58 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202512181848
Date: Fri, 19 Dec 2025 00:36:58 -0600
Message-ID: <20251219063658.143830-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251219061349.1872555-1-lcpdbld@list.ti.com>
References: <20251219061349.1872555-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|CH3PR10MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e7b39a1-f753-4ffe-4be1-08de3ec904cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9RHOfUD5U7A/zqUwjpI3UjgjBmwx8DuZouHVRYP71aZrUengmG2CeWF70tnJ?=
 =?us-ascii?Q?6AGGNQ1PCs8q+TyCWXue6ruJIQFTvMtkript3tkfqROGnCN9yP7+OBWGembs?=
 =?us-ascii?Q?k90QCvddeCOnGaxQvkRI4tUedEeRWnGA50Hz8lPm6F8r8MzXOJWJQr45vAzT?=
 =?us-ascii?Q?7DVBN7pExU3MMsg0fHCN3Xf/XgoeaSs84Y4KcBCbIqOf3A4EismPyCqG34cW?=
 =?us-ascii?Q?mQ7rip0w6dBZPgsI1ju96gybyJ5nbyuYY6vkqU5Z9jkTSn3fcQvmqIB7u7/c?=
 =?us-ascii?Q?lJ+tqdiM0W7p9o58lr9nvJqBlMFazAoxGb5M5EeDqdruLDAntPT4QCBJHIg8?=
 =?us-ascii?Q?q05/u3UMi132LKfsfYXyWHGBJpqC610yUHHr47em4EsEr3dZAXGq9BjwOXq5?=
 =?us-ascii?Q?uBxm0JolEf2G+afSHa96Q4SFLp9OVJtMFqGtL5CTXc8ReWqHeBzDs+2VTp0i?=
 =?us-ascii?Q?N9WCVx3UbN1aLVR7lzXqyx1VSxC3x1xdsVR+oY39G4s3IPOur/ikZ2/eTT8i?=
 =?us-ascii?Q?g8Z0PJbdQvp1KxKjnA0qbLaWTcP7beMvfNSOWxBOh6ZArMQae7U9GYIsGUWb?=
 =?us-ascii?Q?uvb1pDL5Onc9rxK/lqkxvS8mfcmUk55PqkD1PnTi65XvFnayWHog9c1+dR9j?=
 =?us-ascii?Q?G8D/edV1AvxF/ehCtsk4akSNr7khA5heO+wZg77TQN4oSnpTxj2C3aQfecti?=
 =?us-ascii?Q?kdEXjBcAzjn8mgAqN24GzBuf5mTIhEtsoSeVMvad//Abi0dh00udl4X+jxe1?=
 =?us-ascii?Q?Y4j7AaOLUeY0dpcMQ8zoIl5uOpYciaduJfbsJ4fCvfDSgtiR2QsA4UgsacAq?=
 =?us-ascii?Q?JTbpD/6M795ybkaNuYFwl7MaccGVUfEeyf016FpTTZ2SsONtk8WB0toGnmnk?=
 =?us-ascii?Q?9cuHUTSd113CVmlG5VDcyCpqMpwIFDNi3S0+h1frPRn5DtpuWEsEHBQdQzhG?=
 =?us-ascii?Q?2qTyI0l4lyfmlsZM3dz0WsLBe2FeRfniuvmECjgESNjrJv45lEt9V16X9cfR?=
 =?us-ascii?Q?QVIH8gE+ImT74plWs3OAFBYduCR4jc/N4fUWEE+LCSM5/Tk/lFJz6VLrodTO?=
 =?us-ascii?Q?uu34iEC5gFUPbehQD3MUDWs2IGfIAsnzNdNAEAhbP0qsvcHkHi80XaEHUvHf?=
 =?us-ascii?Q?PVifcEKE9TFU4vQYRDaq5DAePhr9hVUiZNwlhI1kXoYL+rOIC/OL/xHm41uG?=
 =?us-ascii?Q?9YnB4DtQQ3TtLlLT8buS7RMbYNw9QgHgcTJhASEkRQbFtGoSlYIU1L834OHW?=
 =?us-ascii?Q?hbnCV9/tRLyals1DlYXOBr6EjiBivfZQ0NJwtIVD8X+Yq6b5vhmzAgQO/lNI?=
 =?us-ascii?Q?KIhDE2MT6u/vrSlnnO8UzXMZbD4o7kBtlL0A5z7HjJsX8ilEON++gEyuk3+j?=
 =?us-ascii?Q?4SXKlkFt6sOF41EBF5Zhe9nnKycNjqPYzWxcMNHDrucJz0Tj4kxYxUQLFxSa?=
 =?us-ascii?Q?/ZrxJVvKrM6ibeKEZLwJXH0v4QVw8Yki92qvGqbP18C0Uf5Jx2kjEaoD54el?=
 =?us-ascii?Q?EDcOZRRN/Rqi2jcHqsSsHtZ6Oi0r9p+tOu3f4DWGT51pKY9D73Mt6CiIldkf?=
 =?us-ascii?Q?NXmKX4ILoBuQUW443vg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 06:37:02.2588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7b39a1-f753-4ffe-4be1-08de3ec904cd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6689
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 19 Dec 2025 06:37:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16896

meta-arago / na / 20251219061349.1872555-1-lcpdbld

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scar=
thgap.202512181848
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 19 Dec 2025 00:13:49 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ddfc2e8c7f9a958a6554ccbdfc597b0ea=
78bcea6

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202512111451
- Commit SHA: 4693f2b9fcdebd32d5d8c6e3106a468869b8a9cb

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



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




