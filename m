Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A098CF2562
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 22:16:51 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1080.1763504204537299633
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Nov 2025 14:16:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=qWcmbDc6;
 spf=pass (domain: list.ti.com, ip: 52.101.43.34, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmbhAR50sXA64mQ7yjtrT2Jay8uKyK5QX2oa2l1Jyh4QDfufpXdJkhpDtoeUg7RHmoLNnFIQOeyGogwDMM2do96b7klCKyevaGEyNWN0eVoe+95LGHtbC1TDEQeHJO0DII8dmrp8sCekVw3SHGfMMu72p18txnv8PJkd3P6CNyPZmgzDkD4nprbuEIO/wjBS2w/pj/hwjsAmI8Gcut3NweCQ1/PYt1sE53IpA7cidDBs8grB+kXxIIZxiB2cgt+vIoLqFe1TztJfxJSRx38oVjQEOGvM3UPlX+dkV24fr3qP3f242XrasHEaKmq0MymlBo0LR3EMOLyg2YaeGWueKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pxlgWMCI+EJZ0yiIpKV6DR+faIosJRR4PKAsJAxtpA=;
 b=WoM5IHC5ls3RRcjvjAA2XZs8C2oJbVT64D2qsFJ7AeWuDyyDOJ7eqI1dDEJHQ1g1G4MdTXrS/naBDy3HXYfty9JbB6SZ8KaBBzeqFH5RDIyjjs/siJiEnl+YMkfGyO9zSyfVIBRWabG81GHXkTHTxXUkC0d5ulvGnSMjnTsETouiapfE3ySFmqSeE30lea6zWof5cEUBlSMcBHD63SYXOreHnyuZ0O4sdt+20Ro385WMIBqfCaj3fpXmBR66VQda8du6DwKYy3zJg1n792Q60OY66p6enhzVt8gMLPchwOoq/5eqq1qq0MQTxm0CBJEs3xSwL7hgnqISDBgVdRPYiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pxlgWMCI+EJZ0yiIpKV6DR+faIosJRR4PKAsJAxtpA=;
 b=qWcmbDc6Nwf1z3NJvvf7WRd0bPA4jPzCTM2zPMUayrE7w8W1ZTE7sZQVPPjmv5joUpyHiZPb5M+mXWt2J3DOrE/n70e1UtnWDmY4C3AmLzcNGKj6VOBn2MXO9pGyykXNOzg0wCNw+ezB2OykgX1Mm+1BzbQOLX4kmSl2nCVwPo+uOwzDPuVEVimfaMw72QfWh6tLa4KAQrdfUPLGsTe1sFyCYzG0KUbdTu7KQXHdT/V/wGsT6EGsU7un2YspHI2znq4eiNEFgbvS7wjnRYm3EPlFOhG0g2zvKVk6DhpdJ3QNLMcpetA1S6Kcl/kzMFI8iCS8MpQ7GhsAt/Ut5xCWwA==
Received: from DSZP220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:280::15) by
 LV8PR10MB7773.namprd10.prod.outlook.com (2603:10b6:408:1e6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 22:16:41 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:5:280:cafe::14) by DSZP220CA0001.outlook.office365.com
 (2603:10b6:5:280::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 22:16:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 22:16:41 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 16:16:35 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 16:16:35 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 16:16:35 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AIMGZPC818289;
	Tue, 18 Nov 2025 16:16:35 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 71442D6F30; Tue, 18 Nov 2025 16:16:35 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Randolph Sapp <rs@ti.com>
CC: <d-gole@ti.com>, <reatmon@ti.com>, <denis@denix.org>,
	<s-vadapalli@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] udev-aragoconf: remove legacy usb rules
Date: Tue, 18 Nov 2025 16:16:35 -0600
Message-ID: <20251118221635.855614-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251118215640.249268-2-rs@ti.com>
References: <20251118215640.249268-2-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|LV8PR10MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 61a2073c-fe06-4450-a4e4-08de26f02660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kcJVe5UwiwyH9ghnoG9MgvLoyZJxsUvurW+savUyyrmYpU/bq+21W1YlxeRE?=
 =?us-ascii?Q?TmQrA4V/qt7bZLXT/CrN0bcRHlxmJo9CvlzmASEp6MWGhaQBULHm5v+uR355?=
 =?us-ascii?Q?9cDvatoiU9QTf5tZV40a0xCWg3g5bko8/f6rsvNKF7m7lpM2LnGr7PYtMrkH?=
 =?us-ascii?Q?y/rWZvQomv4/Yu3bE2wZPODQno1Aosae92K8BJU9YtDaJJNy2ENSo3VjTQl5?=
 =?us-ascii?Q?vKRpfo/cVD8qByIul0Xz5uTJS4mlXEgyDZyr8Ttnh3TSLZv7j2ryXlZ9sGkk?=
 =?us-ascii?Q?beiColPZTBomZ1w6BSgUMNIjTt9u3HZkKauJFLcjI8pZQPlkB+qKcTpNXiHq?=
 =?us-ascii?Q?VbPxxCqZisq+F57dsDtFY+KZEKEDR7Ik1JQCri1ivdULw0YOLUu6311EioxM?=
 =?us-ascii?Q?nAL4xnRFyhsJdURlqGuzDFeKDdWM1MCgnIP9Ogo/FLyH3yTrA/iYMgMp/SX4?=
 =?us-ascii?Q?yZ5V6SJsB1t8K1bdCOeRE7JDvrsrjm7Dg43MNNleeLR9VsQrG2BYi6cVmelS?=
 =?us-ascii?Q?IxD5kT4dVghfwWR1lh9sxvHspMcb2d5d+F/7EcYUAQu7ZL7H+fGApaH0V/Gz?=
 =?us-ascii?Q?S5sWHzUMkoUqUPLbc+HpJZtWA2swob059inAX416vXJawMRmrc+t4AbnCqB/?=
 =?us-ascii?Q?061f818Hj+z0aKXv9SzFyHosBsw0ke5/DfRd9n50XTYOUOmthCbjdAVuUmIs?=
 =?us-ascii?Q?KxvkSia8DXu+ealm9Sh17BqD6yS/YwmoCci1HqMZtOqV20gtv0Uu+ms8ulnr?=
 =?us-ascii?Q?TO8e8mMg7RgsdfEBCsmD0wz9TFx2spoDlBUAEOQZuKrAB2urG8YweoaIz+ze?=
 =?us-ascii?Q?sR32wPIEOxdJdp8VAzU1iSKaAPqmndGG6w1USgr6FUon++CsMmubMA8M/mnU?=
 =?us-ascii?Q?ssl+m4AoYWGIYB9/uJWZvfdqvOQWUMJ8W4mXLk1tJzMpv8MLmi38GUBdzDnM?=
 =?us-ascii?Q?T5G5sEYm8M40lxmT3KZ3qS86BdbwG7reNMPiYepk8Rwv+R9z34WGdcJrN6X7?=
 =?us-ascii?Q?mEHQiEW2ptVDRIBQkGYkKaAB29B3KqBB9pLiLjkvSShGbv6whasg0bvgC1ZA?=
 =?us-ascii?Q?FzBHP/S1xl3vijrFmCmKQxrMj35g9zL7o347amYmzDfzkICZqpdqrfGyaaDI?=
 =?us-ascii?Q?WFX0/nhZ1uZV/7/Qba7fBHoD4+q0nRMIiw+gU/+eB3T/rZd2DlYUI/3R/oR+?=
 =?us-ascii?Q?RkqUlQPUjQt2saBe+ECag6IL5KON3XvS/NLr7NQ0P85FLPBVBfyoviUYUZEZ?=
 =?us-ascii?Q?ne/fqe9huD/iBDGXmirgLRopKBL8yEtln6xrerkFRfKMB0qyl+tmMPSs95QK?=
 =?us-ascii?Q?yCL2cDQkJGrxoVcoAxvMUX5+fGQWkqS4Ffh25+inTTlNlZWnKXe64Dh8Ai8Z?=
 =?us-ascii?Q?i2+mgY/zwCC1bIvGjsbjuz9seg7MNq19pL+Zk06oUgsq8AVoievpbLKbcR7N?=
 =?us-ascii?Q?VtH3dsmvIrcvaP1Lt/FZ1VJKMDoNDisrdhurcm/Af2Vho/jURd8GUExW/XpR?=
 =?us-ascii?Q?F88W+9IPcHmL/o6d59wNrx1XusOmNYA7QeZ8lpKL5Mir8Yd/dJftLO+nSmzG?=
 =?us-ascii?Q?E+Sadog9RHbIxsNVVkw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 22:16:41.0259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a2073c-fe06-4450-a4e4-08de26f02660
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7773
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 18 Nov 2025 22:16:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16789

meta-arago / na / 20251118215640.249268-2-rs

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
WARN - [meta-arago][scarthgap][PATCH] udev-aragoconf: remove legacy usb rul=
es
    WARN: Commit message should not include directory path to recipe: udev-=
aragoconf: remove legacy usb rules.
              udev-aragoconf: (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [meta-arago][scarthgap][PATCH] udev-aragoconf: remove legac=
y usb rules
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Tue, 18 Nov 2025 15:56:41 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 82fcf6ba64f64ea949684a4f5e89df6c1=
dcbff36

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: v4l-utils: Do the version bump in a yocto-check-layer com=
pliant manner
- Commit SHA: 312752656aed73c1187d9d0cf5d246e5731965fe

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




