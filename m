Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D73D2CE17
	for <webhook@archiver.kernel.org>; Sun,  7 Dec 2025 17:21:49 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31222.1765128099999675776
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 07 Dec 2025 09:21:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=BQSvuAE9;
 spf=pass (domain: list.ti.com, ip: 40.107.208.57, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ooqt5B7wa1Ws21xH47yfyL9mxoC3KWIzno7vVwvHXa4/gHbTp0MTGPpIEDYGIimPNdNWvsU9jq6IlZLmIe8ln3ct+Zu3Z75E7JIEKh14U5skkq8+vfCJ5dWTedrlp3+86OXcRsjuKyVIXy6CiWVPImvvAXNoOX5AYAJqW8rhd2dQL0vp9YASO6uIlwjBP/SeM+ud1V/2elQp/Cav4z/EOiZuGVFbdCaxkWOXLBuGa3oNCqLo8GGBql4gL2WrUc78XHGLYIUhfiMFknfe5s8m9PHPho2lxNRSK3e5tbRopRkFbS7sjpyEIp6/eb8xafAugKZJJLUlrKwtRkPw8I924Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8zaPbU5Ih39YXvoylSlxDU1Ne3K62LHrKsfg6afLOc=;
 b=bzjTCjbUltJ+M3OJHq8D2QLpIBfq70K+LQa5xcjUYESZ/xniDVblhISXVcudrbK5zywVmRE/hLmfgqJhYZDFwr7FkME6+lhyzsImKWw0iPppGPGL8BpJ623xyvZQhfi8On9eNM4IAWlW1hllJPgRE6tBX2rB/0DgbmxXr0gFs68ic5K9Kwkb1v6uBy0YOhcuqHyvYONLg6JyV3WFbb0nhy5iZpPSt5yEtrTMv8S8prz9EaOeK0anuxzzEjtlzhP0dSTIFeUD/X7xSkOSQiDURCkCBF7GiXB9zck0hcrU9/goh3ump+jAijxqglxonXxmzOLloD/ar9G/dnOBgXu5IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8zaPbU5Ih39YXvoylSlxDU1Ne3K62LHrKsfg6afLOc=;
 b=BQSvuAE9raQCe6cGn2UNjhPlEKIAaJRmcYQ6PM6xLNR7TH792A4Z7j/sDnuZPb76rWWRde5pbyt8AhG44my/PRbGHiObdUkujV0aPICeyezWvkBL115KC1yNGwopQ+BThr4KAAMLN8MoMb46dfByxiWJq5EaAYGx8Z7XOkHamVcH+x0j5ZQfbWRzdgpoikvFmr+WRaQC51yhR8cd0eVLt7bQP9xEqrXrNxLSUqU8KqgFheEJiFJESu9ATrsvYxP/DyBnVeTsmxka7UD5fgVK+W8glxm5gFYfCRIfer56p6dAefTJMmtfGy8WcGXMt1P0vXnyvhRrYgGuyK1aqIjirw==
Received: from PH0PR07CA0108.namprd07.prod.outlook.com (2603:10b6:510:4::23)
 by BLAPR10MB5058.namprd10.prod.outlook.com (2603:10b6:208:320::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Sun, 7 Dec
 2025 17:21:37 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:510:4:cafe::f3) by PH0PR07CA0108.outlook.office365.com
 (2603:10b6:510:4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Sun,
 7 Dec 2025 17:21:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Sun, 7 Dec 2025 17:21:34 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 7 Dec
 2025 11:21:33 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 7 Dec
 2025 11:21:33 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 7 Dec 2025 11:21:33 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B7HLXfY2332888;
	Sun, 7 Dec 2025 11:21:33 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 12C869ACF4; Sun,  7 Dec 2025 11:21:33 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: Re: [scarthgap][PATCH 1/2] libyang: remove unused files
Date: Sun, 7 Dec 2025 11:21:33 -0600
Message-ID: <20251207172133.2291367-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251207170309.1924061-1-denis@denix.org>
References: <20251207170309.1924061-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|BLAPR10MB5058:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ea7f80-4e1c-4e8e-3b13-08de35b51243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QOJj6L1lr6FNHZDXqFPlQ429izuFLhdREPnvKam5FDcDdGFhty1n4RVQD+8Y?=
 =?us-ascii?Q?+owOekW8LNL2KRgKAlwNZVawHOYI5u+x2d9bjjmVEhA8pkUYaVsm0OTMyrZR?=
 =?us-ascii?Q?dI3XK18EIZaScHa/v2FkYl2zcT6GTv4LItHIO8VsDwMRaEULvjz7yIxFFmX/?=
 =?us-ascii?Q?e+1JluK+T4f7TWbRiGmU6msGyfopkYdn8re5zMA2IZ7NrxO52GUVY3fIfME7?=
 =?us-ascii?Q?1JWDJLkDjAVYL+xO5dYw1V1cStMI+mo+u+pHnAdcx6JFTKnsTK4LzSXrVXRz?=
 =?us-ascii?Q?IE1UCmzfvQDOKV56PyPS89i0tZSxvlBenoblWXneurj7WIUMY0e4cvB1oYvS?=
 =?us-ascii?Q?L6MTInofzV2skivQEaOlWEqphv9hNyxM/EVnAfoVVGtPCWRKl4mWICjbuy1y?=
 =?us-ascii?Q?bw0q7AplCWb+/7Hl9d8qvCHpB+ci23t0EEo5jrsF0GBIvFfFfzPTIrM3u11H?=
 =?us-ascii?Q?muj0OxMvSr9DfHWoQoQoHMWkJjeiF9Ln48ZiIBSuxYvxez1Ma/2KFUAOJLGT?=
 =?us-ascii?Q?3dHgDELIih9IgohZJXmkCeOzO+fwQ0irDzM2C0dHd7RhKMF+eeOuQqueQFpd?=
 =?us-ascii?Q?VWFpR47qrGinTFJupDGnr1duKuSIdqVibnWnu3Ki8sNqAHOfx04D2RyCIoBB?=
 =?us-ascii?Q?01XPU+lS95Z4n8hwhkHT1MXz+gGgxle6Jq2WfLfMmPJv/jjkkZMV+0Mw3YWB?=
 =?us-ascii?Q?oY1R2Qe52FwWSkgXGNXc9r6Pgim25Y3kkXEh1VDjDPh8Qv4GhnmfrEZuQ1FA?=
 =?us-ascii?Q?ZnNdchxryDtDz/UjcrDlxbpOUaR908SneqOk3MuZQzh8ZBVECE/gZaIUuB20?=
 =?us-ascii?Q?qSt+ox/YXgJEMK47ag55XgTD3AErO1GtCS5J6liC3ZPpGtGEi18FrNnt0vy5?=
 =?us-ascii?Q?wNXK4B/1vlOSgdYiLlk2BmOpYMpFJTmQyvhSmuGKAYX6lz2yUsi1BKSQoSAF?=
 =?us-ascii?Q?nV+XYWP4uZ8Cv4djCzYhcetNoIuLIGGCRHpR/JH9YPjbnGWS36oLVhZ1fw2L?=
 =?us-ascii?Q?J6YvxCfna9mAAQdJfK7xkxGn1HQhE1PtrVRI3+mcNj8nEjohg1VbjK2/OykQ?=
 =?us-ascii?Q?efwMAhg2MA8HPP2QLLPItfaR86aU1XiQQZmly6diEzCmP6MmbfwDhcAkPyBf?=
 =?us-ascii?Q?wVDPV/kZ45nhVXzaNlQxH8rYzNjSxyuyEQzHxtuF5EB8w/pmQf7KD1a7Qb1i?=
 =?us-ascii?Q?K1jGGPSr3MpkHA1MDzkuC1Xmu6l8BrSrFOB6NDXdvcucqhuGX55SMZVByXRS?=
 =?us-ascii?Q?vWAp4cjz+YSkgN4aAHhYGJF/nOVOASKmngNMcXM/zLhiwP96ncm0ADAFv79K?=
 =?us-ascii?Q?Hw/plPhwXuPkIEoCNyfj7NkaXzTA+pYFSQPhhv0nhvKX5ruhtH6bhGujX/V+?=
 =?us-ascii?Q?JZtKm3t7PphpHsqIxIX1fMSdxFBlluvseLyYlc5mBNDm3IrR2x55U7Y0Z6Gk?=
 =?us-ascii?Q?5dW7zMMVLrju5gSZY+VTxn51Mz1EBVdMr67geiRvFGW9++Xj4XI0qM3ziqZ5?=
 =?us-ascii?Q?ZVIWvxz3cfN1MXwjd4KtRqXnAD/UDtKFjTD24Qjues8ePespEbvx511TjYJX?=
 =?us-ascii?Q?lXJXq1aVMFXZnMcduks=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2025 17:21:34.4634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ea7f80-4e1c-4e8e-3b13-08de35b51243
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5058
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 07 Dec 2025 17:21:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16871

meta-arago / na / 20251207170309.1924061-1-denis

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
- Patch Series: [scarthgap][PATCH 1/2] libyang: remove unused files
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: Denys Dmytriyenko <denys@konsulko.com>
-From: Yi Zhao <yi.zhao@windriver.com>
- Date: Date: Sun,  7 Dec 2025 12:03:08 -0500
-Date: Wed, 22 Mar 2023 16:03:56 +0800
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: e9de8c2ff2dbf4ca7dbcd3b7fcf614428=
d1eab6a

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202512041635
- Commit SHA: b9c8be5cceb1b67c6d14a871fe20e599542999f1

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




