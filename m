Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F217D26D8C
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 18:25:41 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16733.1767983140658601834
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 10:25:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=YwEptGs7;
 spf=pass (domain: list.ti.com, ip: 52.101.193.71, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXBHiuPx1PtsjCACS1dcgRs+RBwBR7z64ztT9ywbARxMx2aOo5zWVIzhcLFbWiUzNYGMjILmZh9HVhBDRIvI/TlE5L7GoXM8Tu7YybT3yRiMtk5f5YgDWHwyfZl/oYvSw8J9FZbF/phogWqgiZJ+C0s6lUosAmzYL99kIphJHf+OmfO44FYgLQPZ2CnLmPh1guR8G/pMcujU7vAwHAV9Pzv1ebTuDJEI8LoVetjBX42ExFiZniEC18FYoUUzkjHoKquD3FC/7uhaoH34WjPHyUaZqZP1z/mTW/jsGzpBMllc21iwkX7dnmUFPV3KcN2fT3OZBvS9OtP29d4KhSRm7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JuvaU/GuUTWOjtlVh9z+Sl8yDZednWCK3HAXJhe4bJ4=;
 b=mGvKXiStSDk4Zbw/Vt+wdh/r6/O1m0Q4VSjPobOyO/01YMRxLCbd5nW7EZsqJhR+2+zKVphVNJ3jBpc+Il0XDOpRfB7IjfAmtq35BQmV9v9tTHS4kNwpYLuIlM9UFaWugbsp57qHOMgzJ7HnFFf6ZRgV+/Q+BbxFzjH5RCuSvjFcKLj3etf0lPJGgg6sNj+L4Iz42gfusluaqAzW/p0gwRvd/ELWA86/2KsJauQRENBLvWRqQhsBbsBQCx40LKuGB1YvW1+K7+RArUp8NwlpsVjBjLJfD+Whg5rd7k5zPUOnxd5EIq9UlNW6ClK3YB40bi4AtzrgAagUvxgB2X8Vww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JuvaU/GuUTWOjtlVh9z+Sl8yDZednWCK3HAXJhe4bJ4=;
 b=YwEptGs7Nl+RxgXbJZQ6zYuHKPRjgqk4jNkReoAgbzCPJc4gbOa3XH+R6KJB9VDSYtn6fFaqJJ/8RYxFFSfgF+XfaCPk/pQwXyfs7Qz4+oNUBj7BnuOkT1HalM+8uhBDlAY/9qTLO4WJrsZlCfPgwlY/8pjklRv/7EH9zO9b+mdXXtiqkVzLd2Si4VX2c7MID2OMSeW9zqnzpVE90la6NIU3LhvauDTYL1oGQ1BB0ua/XBenHm06+P904ICES7Q1E4vCXToi8evG1ZQOL2tBRFFum8MNj08gFQBbEvtWcIVXCoXtviFkoevoWFkCzGuIGvgauSPws6TjMEKp993L9A==
Received: from BY5PR04CA0017.namprd04.prod.outlook.com (2603:10b6:a03:1d0::27)
 by PH0PR10MB4408.namprd10.prod.outlook.com (2603:10b6:510:39::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 18:25:37 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::a6) by BY5PR04CA0017.outlook.office365.com
 (2603:10b6:a03:1d0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 18:25:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 18:25:37 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:25:35 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:25:35 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 12:25:35 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 609IPZiq474570;
	Fri, 9 Jan 2026 12:25:35 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 135E7D6F28; Fri,  9 Jan 2026 12:25:35 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH v2] ti-core-initramfs: Shrink size of initramfs
Date: Fri, 9 Jan 2026 12:25:35 -0600
Message-ID: <20260109182535.2059721-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260109182200.2856750-1-reatmon@ti.com>
References: <20260109182200.2856750-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|PH0PR10MB4408:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e09f208-afa0-4151-17a5-08de4fac7c7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|34020700016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4WEOBYqiqQOwl15f+H4XBvfU421XaipZs/hhu2IxZ5DQLqIiISrx3oo14pzs?=
 =?us-ascii?Q?5eNme7l6CrBm5nCURdRUu/zBIjvJLsd55UgVLTuuvki/FWI785tg9STXW5b/?=
 =?us-ascii?Q?0Oh5pDm4n7RRwUNhzrwOeQq7FBvilAf6ihB5SNrTzXhezRqlhjCmxxf/0wvb?=
 =?us-ascii?Q?dHXOnokcAqFTmilN1x+KA6qazN67s/9O49LCrnRc9Cr9zAAtNGBz/4mykhzw?=
 =?us-ascii?Q?+wXvU0mBUr5EK/Via7uHDw5z+tChrVVYYudO2DgBt5Prcr9RLlT7mBAJ8/MU?=
 =?us-ascii?Q?9AZ3r6BHMvPbde8qC5J+BRR9q2D65ojxq5SChhM7Onq4vCmVPMNHoNDJ77gN?=
 =?us-ascii?Q?gLK1XqFAauC0zfkcO5m1zg5vflf7orI7GJBUvhWZsn5ZLi0bswDzK/0bttUT?=
 =?us-ascii?Q?mwWgQffLvJMpOPAgOLlBWGpHNxb81+BDsfeHKkcSKMTg1lAz/jM8aDrP08wL?=
 =?us-ascii?Q?/gr11Mr7der4WIOnmf7bbmMl12qoDkxlUpKLTjj41NUNoS2M1mVofcjVjtVS?=
 =?us-ascii?Q?Sogeyan/KBCstZD8r5dvBxtd+qWyvetiSvuJauEzFke58GcRfotgjV9s1EMV?=
 =?us-ascii?Q?YaAbW9l4QypYveOExOv4pJr2UhyYLqg5YOcPxqSW3FpX4TJtPy6DmSTcMX/U?=
 =?us-ascii?Q?B3GZvpOFOpXBHdo7oRF8+QQqbLaAG/k06dbu4/haeJDnSQ8UmvR/VRzDpXfv?=
 =?us-ascii?Q?GMCxET3/+Y2A+j5TUz4+xeU98rslMkisaMQqZ8718CiATer31pWsvL4oNEXu?=
 =?us-ascii?Q?00OwVrSGbMWxlGkYmPXRLHfYKWxhjOLuYqfWDLH65kNlZeqTlX5GH6xvhGyH?=
 =?us-ascii?Q?llsuWaKBVk//N/vqXaadvgHr1QrMfcF6HQmlQhxdbAcMuYVRhrJZvhdxGooZ?=
 =?us-ascii?Q?qArVt23OPJHS3v3QIBrO3xurO+kG9AFYojSskoe28WWrJXWad7zfPIEXywjD?=
 =?us-ascii?Q?FjCx2+xVINLsGTYaA0KktFJkSCXPodZUClt9WRAMXMAtT+hTfQriFgCF7Lkh?=
 =?us-ascii?Q?DdorNy73Oyb70FnSNS9yTUsknHChoN+tohB/8pLUZYsM3oQvnqLCJs3qLvuu?=
 =?us-ascii?Q?p6GGEl1Y84g9XzX076SUMQ+JnyeIhsbnsNvOd7faFi4sJZCmK46tkBS9vi2x?=
 =?us-ascii?Q?6vXThXSH0bL1e+SEWuaIpNxiv578MeO6VP6/AH93Bc1MON9VLP6z6yaqtf5+?=
 =?us-ascii?Q?G8dgXCx8LhhyA9OGz0j3F3r0IxkDpa1CgETQJvohra6aipn0FCLuo8ovlYnu?=
 =?us-ascii?Q?fM47sxCFKjtth+aLyaAPQviyGsrRacDubr1gX93LJYERBaNggAQiFZwHo4mq?=
 =?us-ascii?Q?pL7CwDd33IqmiPXUoBaUoaecEBd51fTF8xXg3C5f+ayrwCMZS7d1oipDCMvN?=
 =?us-ascii?Q?ci+wUFRlqeOsuTATZ6DMYccsncWIWtluRmpMCeAI+CQg4ekKZHEBULtrXkqd?=
 =?us-ascii?Q?gfpnBO/H58tfKEoWKl0hDvJqDQLn3c3te4s83NoPKGFjMkufAmNSf8GtGkxZ?=
 =?us-ascii?Q?Gpz+wHrSH+W0Tbis66K0UvpLFS8S3vOJzTvx0KjJFQfGK8ifQZGVRIyIfVQj?=
 =?us-ascii?Q?yfY5f5FtuYiKMkwVpoM=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(34020700016)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:25:37.3158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e09f208-afa0-4151-17a5-08de4fac7c7a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4408
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jan 2026 18:25:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16944

meta-arago / na / 20260109182200.2856750-1-reatmon

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
  apply-yocto-patch: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH v2] ti-core-initramfs: Shrink si=
ze of initramfs
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 9 Jan 2026 12:22:00 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2d058529c5203c793cf60eb08e446eddf=
6b67b53

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: libdrm: Remove upstreamed patch
- Commit SHA: 8c190b1e4f6a53ea641ba9d6150ef873f561c706

Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH v2] ti-core-initramfs: Shrink size of ini=
tramfs
    error: meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.=
bb: does not exist in index
    error: meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb: does not =
exist in index
    Applying: ti-core-initramfs: Shrink size of initramfs
    Patch failed at 0001 ti-core-initramfs: Shrink size of initramfs




