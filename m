Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28643D116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 19:06:52 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27.1764616007360208484
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 11:06:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=AvM7dxgE;
 spf=pass (domain: list.ti.com, ip: 52.101.193.62, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gwaAFbj9FtWMUeYA+ydh/J9tgGNW/BHUsy7B3MR5axvcIjygt089WsKgMRBPqT8PrIw1n7f0lpLK9bqduStipLo+mohdk7iV476f6ppnwqiTqvmtVzHWbZgPve8jukGKSEIXo0vkE7CGrjmFuuTmsLIALidYzUKbDLUKBhFpBa/LRwcQFAwp3iGytOY5E/QbTLne+kZsBED3hXCAsbiq4LaE5KcPHDmYTxKaQ+asuHwgGcDMxHzzZA2gb0spjrYzTCjzc6fW4/CXb/qocFnssh46HDD01cjlTamnHcpqHaewPCEKpG79z6t2dnRvGp/NBVUNYHsUeoVpTFSmkODJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2bYM6pp/MFAdhD6QhU0S4zEjyjNGmlF9KgGDskyUP0=;
 b=d8w74wnKr6rExlKYVdovZ0M0NZGm0a23ISNN8h9Pg2M8KzT4oCArDaianAl3cg5Gi7WWRpd10v56VB4MvER1pfjH/pSlXRFoJIGVl3m8Shw93ADV4iHtzha6XcJp8N1HxYM0vszBtsnO7UOmpefjEpR64iAVHeu834IHMdG1YTN75U62hboeHfAaFbKUuA5+576aRbcWDL7YrA5oWUSvP5IPHmUlIZoW47wFoqAtqWlvinGy90mRpHUoUVK6MMut3vzFPVFvsLkICdtPIqFApIDQvghFo95Hc8dPMEcE2st7qv9pvPu68c/V7Fr4+POUtF7wD5oDj3zCm1I4hzc8iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2bYM6pp/MFAdhD6QhU0S4zEjyjNGmlF9KgGDskyUP0=;
 b=AvM7dxgE7BF8eZl1pc/7v0bz1kLB63FmFQSmw/2FjMg4a2QcgmXk/lPAtm8q1dYPZqR4+J4zjJbMDnDowIF17rRpqFuaUWbSbDMsKEUFpVsdPLKz56cJGml6vzPAoVNUscq1u13xqjPCw+wo32ohSJFAm0fG9jxzqLDMT5oTyj7/c5NDA2+ece9kKrOE5E9GlS/fftFPakY7xT3M4ST2YXNCB/rHRXY1lN6n1D2Qf24GofR7XmmHkR2s4a2mr7KXRJY4zTOSt1DgDHYDZuimBDGWFHGJ0UgXIGbquMWCy0rHGrogMKcUkhjbA5UCFy3GTatKOSQM5Z4Jek8KPJAw3g==
Received: from SN7PR04CA0207.namprd04.prod.outlook.com (2603:10b6:806:126::32)
 by BN0PR10MB5045.namprd10.prod.outlook.com (2603:10b6:408:116::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 19:06:44 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:126:cafe::d3) by SN7PR04CA0207.outlook.office365.com
 (2603:10b6:806:126::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 19:06:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 19:06:44 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 13:06:43 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 13:06:43 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 1 Dec 2025 13:06:43 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B1J6hoH1171666;
	Mon, 1 Dec 2025 13:06:43 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D12CC2A55; Mon,  1 Dec 2025 13:06:42 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] libdrm: Update patch for recent version bump to 2.4.128
Date: Mon, 1 Dec 2025 13:06:42 -0600
Message-ID: <20251201190642.3297952-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251201184055.1371866-1-reatmon@ti.com>
References: <20251201184055.1371866-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|BN0PR10MB5045:EE_
X-MS-Office365-Filtering-Correlation-Id: 367f52af-ee22-44a9-4c14-08de310cc4b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0M2wMMdyPBZOqnVWymHfu7c9J1C/N9+3jr7lL98mo6Sy9iaw3C82hhV5W7FX?=
 =?us-ascii?Q?FBjNjup4dsFx8ljR+qqHQT1NVz/5c8caVkMkAiJh+winnCot/MA+pYC7tNVz?=
 =?us-ascii?Q?WEJjFs6OpNUfGXnET+dMMDBoaiIdzUTmIh6/jsZhIQELvOdGUbf/wYKbOFtJ?=
 =?us-ascii?Q?5C1bPEXZV/ZItBIfQ/1cnsP+L36ZPKeYt64/pLsM4fpm7cnc86G8DlJNcz7e?=
 =?us-ascii?Q?rwbqK4gKEIFwM9x73IHJT6VO5gToRWez3671Qaz09fove6k/CaKD552GKebh?=
 =?us-ascii?Q?l5XMSMjgnydHxPN/amQsKBcUjG00RNI7jizdBHokR2zwcMUiyVNLv55vGhZo?=
 =?us-ascii?Q?xEt+E3CmwKLD3fbHPbTjg7MeoOKwamk9gp7IQ8xOdaFzmN2+fD1OXyIc4qa9?=
 =?us-ascii?Q?q3AuaXG2157D8//ssYbB1ZPsAg7e66NZoxt61XyCua0EMBd6zG2fI5RYGSal?=
 =?us-ascii?Q?g3UObr/oIsP2mk0d64ySQkiOGCsT6NTDYth7Ujeh5qp6C8HJBJV0oAYVad3U?=
 =?us-ascii?Q?VsljqorbUcbzm9INC7MUUvFn7cHahEckeGNOovLdfG77bI27DgJk15XCEBRv?=
 =?us-ascii?Q?Elgs4qh4XC/vG0w8/mUnaiGlY4dcjjUQMGm6Ah0MAbo/uZSo7jNdxTDo/Y11?=
 =?us-ascii?Q?qCdsD+pWX9nV8a9YWccEFKi5250JDrq0gwfaSQJkpbfD92Kmh5na7tULto/v?=
 =?us-ascii?Q?Y9a5tcynDZ02/6IM/THunK4HGSaVFOorCAr8DVPaAyU7ot+ef1iFVNE8sLIp?=
 =?us-ascii?Q?qT3PKN1c/H5j61V8zEloth1BQMF0Y6fqQIGO12ZrCRm6Wmt/WP4orBjMAz+Y?=
 =?us-ascii?Q?poexwnDCvI81zP2TiETW3niNwl5CdiIKTMjyMXYm258rZ11huRHixvS2E+C4?=
 =?us-ascii?Q?mfxfzxgLz9eBVZF0fpjPHJUMDKiZ3pXmrUIEa4i5RSLkdpws90/YhzaP1cbk?=
 =?us-ascii?Q?g+KWDJEIjhDBZjUJ/Xcr4YHVCy2qyPoxLi3O5x8iQYS7ZprgTEsWK71o8i9g?=
 =?us-ascii?Q?mA6ABLoqCv0qZ7dgBI35ElwA8rMyOQDxyM/Hw2g5yx95Agm31rXUHCI2Q/8H?=
 =?us-ascii?Q?CMNcZLVPWeaOMQyQHJp0HT6kP3STB0H59KWm/R0fEqa+B1xIPoI6UbluLJQb?=
 =?us-ascii?Q?hqFdJZcjLvRP9080l5tGEHSBSajp3+FN7ErKHv5p03J1kyO49ORvaZ4ZuCiV?=
 =?us-ascii?Q?MuRHrDvVUX3akGj1OiGRgkEV9sjKC9vRt+Fwpxe/ii9v+j2LnKxsPOZw+8Lr?=
 =?us-ascii?Q?YZpgbSqRhtc1ywetZ/o841RShkBMFV7rN7dHbVArQnWKyfNMkOp6ndRWmo6I?=
 =?us-ascii?Q?+WOZqpw+hB9XdgUdiEKOnv1N3hOPVZaZi/RPHEej5ZDoBrMe0AEHreiv+DcM?=
 =?us-ascii?Q?8TN+zyZJvVuhILMhCt5RABoQyK6g0uyzc+0yPxsojgaqc8yb1xpNgyKXth0R?=
 =?us-ascii?Q?60bEwrpsHd0XXJ5c2a8jMVzcvp7iUwGsbOekrYtwhU+1Kt8qNWJSYgO99Q1R?=
 =?us-ascii?Q?qYVqfFBX0qyLzRmwVOYj6eC2grcb/hn/+ap2fk3HQUnqDgMmfiAY2JHMnTjF?=
 =?us-ascii?Q?tcaU3TDhn808o9+3K3s=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 19:06:44.2008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 367f52af-ee22-44a9-4c14-08de310cc4b6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5045
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 Dec 2025 19:06:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16846

meta-arago / na / 20251201184055.1371866-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] libdrm: Update patch for recent=
 version bump to 2.4.128
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 1 Dec 2025 12:40:55 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2217241f5f949d7f80edb1a172095effa=
ea7016d

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202512010100
- Commit SHA: 057c703828c6d677be5d6e820c49d6682e4c2a76

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




