Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D164CCF9FF
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 08:25:36 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.48])
 by mx.groups.io with SMTP id smtpd.web11.10355.1761899128425521854
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 01:25:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=WNSYGDBG;
 spf=pass (domain: list.ti.com, ip: 52.101.85.48, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYhrxVIjzvXHoDBj4WMcuCGQjQ+zlbxSwrZj84biLhrprP6aeKC8UH2fQ+FD5JTeJlYrJaxNnMzb2n47BSSCyWSuB9IKrU/DCPGVATvPNrXjdJM375ecgxogk8I6SJdcg7z8497zZOcJirw+EkEdTkm1kY8P7VW9CHYWjUdf5aiftwPnykb4BwG5/7bYbpM+//P+l2jPFjYixdsGZMo7Z+r+4AlsB93tY/UAuUA+Zvfjm07vpmxE9jn1n8eB1IKjfo+/W+4VpXNjPE/cqDHyefDDgs8oR7xAkhCTli+XexjWwYB82LGaRPzv+CSMueQBBhNH1O0sivt7lo1BkLOcng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOvjNDb1QqUnirGMnhdzGFklNN0nZx6pNSojvHoJZco=;
 b=Zxjs+CrxWrPmWN/ktG0SiiwH9gzhhu1IVISiz45wlKekJIKwUqjZml2aT+4Vdj1q8Rga8fwyhgOQVwaQkMKyuRMwkTadDCrt+AnG53UI8CCOFOYKztQVO/NJGr4wRLDU2O8Zu3ACDk/vyQaI8E0l8twKvuTp5hKo1C3+u6WamHC3fxnv/xhdUt9QM2tgLr0oiiZMVsPx7bUhtiaiypTa0IcTvWm+8MK3lNCrLd3Qcz97bfMsO5gnAl6UIQ8BmOUt5bRqLv8nRSUBLfwrTaIfVpDnAEbkVHQ405YcbW58QapBkCuwgzna/mn0l5q6VqcUw7DU7Vkm1qKGhAnCP9lXNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOvjNDb1QqUnirGMnhdzGFklNN0nZx6pNSojvHoJZco=;
 b=WNSYGDBGpIhQqv67Rdn8iWLzilbShXu5lngwjROzLYBoFEitagwLmZ/C/R3EHeRirLZVRH0fi9sBREwS0jow7a0tYwbWhz/dx0NjADn3TjoHCS8/lG3rXmjFZX2qQWgTQbHh99rMY4/PYo1hJxsx5YJslErkV/v9N8qH1p9rcwIN/uVTMcMZilc+60kVGWMmYk4XBviX1wCROWm4apmG03wVBtzKrOunUgaXBH5uwXNq4S8/0NPyzfD3oQgmpeA/IuXa0fU2wlmJIPUM+AmGDV+VXj3iaO7Lp7XVypub/3uvZID4nkxrUBHaGBVJqRjv2sY6nUAWRlXa7/13w+ohzg==
Received: from BLAPR03CA0045.namprd03.prod.outlook.com (2603:10b6:208:32d::20)
 by MW5PR10MB5827.namprd10.prod.outlook.com (2603:10b6:303:19c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 08:25:26 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:32d:cafe::5b) by BLAPR03CA0045.outlook.office365.com
 (2603:10b6:208:32d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 08:25:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 08:25:25 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 03:25:20 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 03:25:19 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 31 Oct 2025 03:25:19 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59V8PJnI3329160;
	Fri, 31 Oct 2025 03:25:19 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id A990F142E2B; Fri, 31 Oct 2025 03:25:19 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202510310100
Date: Fri, 31 Oct 2025 03:25:19 -0500
Message-ID: <20251031082519.1170569-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251031082130.3317942-1-lcpdbld@list.ti.com>
References: <20251031082130.3317942-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|MW5PR10MB5827:EE_
X-MS-Office365-Filtering-Correlation-Id: a264ac69-71ad-4331-3e30-08de18570b06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|82310400026|376014|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DI0UpcJg1wkbQnW+7X2+FvzKopFyxQodKT2I5m2ETmPcaGnkBvOlV3UxQOVD?=
 =?us-ascii?Q?IurmKSRkaGar6a0oNcAFHvoNFJIfKHZxPdoYk/+LaJmb6FcbpLb0JScExAhb?=
 =?us-ascii?Q?ywPu9X/1oJ+cPYS5tnrYIs6Xv81xDVnXPcuF6/0GALs3VbLjeDBnW4jx8IUv?=
 =?us-ascii?Q?kuNHpx93JnjhGRUcA1erbkNgAZZbp5/w+XZwphiW6X4yO5ow3EkUl5xFL3N3?=
 =?us-ascii?Q?GbOgvKOBUJV78FbLigPaqmp+WAGpRgL1U+IPPRlT/wdt+dLP92YKTlL5jWRS?=
 =?us-ascii?Q?U0Je1JPWzMhH9Hiysje2Daxiz9DxtZMjwNPdHUzDvHLx5SjKVYxmVlUPidWU?=
 =?us-ascii?Q?MveVHPzThUl1pEkk0HB6Ee3lhFXT02SNjGrZkVaQDy2S+5KAbe2t/fqT20Nd?=
 =?us-ascii?Q?2cB0qxsc+RzHeKJQcUoS7a2F3j2xF4KY9FNblZprqjaCwqNCxyTR9WXNe9hw?=
 =?us-ascii?Q?3e6X0QD9LD13lLVFNX4W1JmQnchDmd1ITkKbrWUG4hpMjPc3Vhbws8bxQ6Ti?=
 =?us-ascii?Q?5DSsA3HlPrgnryvR8LZmjENp+jXU29Jj+SGg4ZHxgBktBuOT1GGfJv5rqGwr?=
 =?us-ascii?Q?fuisRJ1t/ke5s04BSgNzrT0mXRHZXJJHyiwnGLaXsemVEii3d9Y/fl/aL5b/?=
 =?us-ascii?Q?TB3W9m94iRTQLaTM9hqLR6EANITMk2LDQ19FXgCd38+gYR1/YwatC314imq/?=
 =?us-ascii?Q?zq59C/WNu7zyeEadVzWmid+qVZaVK/Pdxbf4gmHYhemBXMP69rklksQYTsE8?=
 =?us-ascii?Q?WYn78odbB70Ig0dnAl5JDAgy+B4l6IPEU+i3mIMRx5SEoKIyaPzAv9M55gkc?=
 =?us-ascii?Q?XQuCnxKWoOWTrAtXKlszKbFExKET7ztsbcAfIZbAuq/AyVgvLnq5pLvBahQ4?=
 =?us-ascii?Q?8qSQwhEp1g/ix0LFIJmb1krgehAFvv0TgMeFER7j8KP9dcoRr7HWL5ElS8Ug?=
 =?us-ascii?Q?98M+UjBpmwGXrSwlsau4FAuzO8UnSYbsSs9mr6wld2v/kSLI30jVOFUnPVwH?=
 =?us-ascii?Q?QdQvfMSaNruxc/bWOI74J53D+7gOypcBIhjU8wpHmDqkiYTPk8v37Fb7+LYf?=
 =?us-ascii?Q?Tv+LfwDf1Y3cMizREcHtsRfcbeurxWsVlwqXVxt0kva39aDbeENjMDrbMUB8?=
 =?us-ascii?Q?V77mq6M7pkdZ389/nf2+vHfQxdjob+KQFDCR/r0CbBSOORVvVbQl2afqTpS/?=
 =?us-ascii?Q?UU0mDiqpuvHotUhyz6DH+uSc+ysTrG/DjAalKJFYZehP1rc6JFQ5c3bTdvbT?=
 =?us-ascii?Q?d+tBOZUmTC/VjIqCkp+xJ4nsgagmLIxpM53Cd+v8+FX02ltfvSB6DKxVtU2f?=
 =?us-ascii?Q?QnEFvi+mflFTZJoLG6qB8d8X0ldF75K6JaDnP6GBTnAV3OIsN0DMiWxfHHPA?=
 =?us-ascii?Q?pqB5pa7ziHGn1YHUl8/FwLoazNUH/UYWGKO9sFfZ6J8HpvJ7z4vKNpnhopgu?=
 =?us-ascii?Q?qiBCG2nYgcZGq4sBnuVHd+LxhnTxK2oKsh7p/gGCY3/b1bGbEByHZ5IC1zEA?=
 =?us-ascii?Q?gz9g+F24Td6AB4I7/QAN8syST9DatJK5l0d2ayLUiEKPQcD/XSDIwjILwR9Z?=
 =?us-ascii?Q?uFNCGzjkpIyXKJJCZnI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 08:25:25.8886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a264ac69-71ad-4331-3e30-08de18570b06
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5827
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 31 Oct 2025 08:25:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16717

meta-arago / na / 20251031082130.3317942-1-lcpdbld

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
WARN - [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202510310=
100
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merg=
er: cicd.master.202510310100. (COMMIT-MESSAGE-2)
        patch



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
- Patch Series: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.=
202510310100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 31 Oct 2025 03:21:30 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 9e3f01d4efbbb02b7075b62fac7347e73=
a777915

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-test: Add pciutils
- Commit SHA: f69bb7b4a09e54aa0ed69670dc499a3811408d20

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




