Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2D6CF6486
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 22:15:51 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19432.1763590549181043840
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 14:15:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=L+4jFLmU;
 spf=pass (domain: list.ti.com, ip: 40.107.200.16, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=db9ZD0PTU3UyeW1ntUD7yYUwvlyXKsddxy/rtD3O5kYou16fU/y6K0Pd1hezOR1+iNiM2UQFQ8yc+ifwp4ScXKjpo6MQU91rtmrSkukIdg5QHNgekRUG0OFJdheWugqHl43KgyIHWLRAToGxm0GWYF6lCaunY4+I9KWi4gnnjOQS6mPPBPD6Y1FD04kNSBL1EhAMMMKLZHrwfQnPGTeN+kp0RC4VMTG2/+0NXDv1fK2J3tQccGWXu+QgHGd2tyBlEO94JQD/H4b3KiNKpcze/n/ZtAJIanacgUXJmQVJ/d/Sviu7iyCncbGC2BPZz0hNi75nNsr4DAPvBNilE3XVVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBnCK11MnoxUhauk6lQQ5kRm4H5ice7vI95e8c5DYcQ=;
 b=IdjWphPxom34Dm5pH+e3p5mdPoT5NIVSeRzP5WXRtcDJeoeEnbQbnpgtg5ujoHwPyX+NCRFBwls6ABlEIx8kSnqR3OKmIdbOYkmQ3BKXikcX09q9SXX02JRnnaIzTuc/Cc6cPJsiRqSYBFfyCHd1HUTXjDb7XivhxImP6gXlHTiqRfuGnv9UW5q5zNgYc0LQCC3XlMqUIRK2502HUPdNK0wR1AUIQ2kK1R6aYQlV9TjwXrAOxc7MIx5YczU9/TO36Zxb/X0sg1HfRNsinszMtbUuLDQ6mVPas87VzgD7n+53uSzI8iKRo1UOxzBBq04u21aGq3SqOlrEncrswXlswQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBnCK11MnoxUhauk6lQQ5kRm4H5ice7vI95e8c5DYcQ=;
 b=L+4jFLmUt/ZTXzo4Jv+dHp40XcE7eAkDiyEnsoP3gP4t3BdJQrXzQ9ju3Z4H97RlibomYhPHlzk9zOkDp97To0df1RKVrVhtI8kCphd0TP3i149HSuYA8xrmB13HBnnTCHsykgkd2H5DCQycCKUVbTygHsKwm5flEDrkyHf36fJR61AX39A1tHQN2fi48/M6VYAuA2sXgjcfkTc7j8LHB53vR01NZpI+59+IijiQzoufPXT6ejGKnAtbnbNf/lUWlfKg9PbnKARaLstgCvlSAaQR61fWYBuBGQWbxHU6An+y/4QsAlljpFkoiHwuXXqZysgWxdFI3mVLOMtM1RtILA==
Received: from MW4PR04CA0371.namprd04.prod.outlook.com (2603:10b6:303:81::16)
 by SJ0PR10MB5632.namprd10.prod.outlook.com (2603:10b6:a03:3df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 22:15:46 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:303:81:cafe::b5) by MW4PR04CA0371.outlook.office365.com
 (2603:10b6:303:81::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 22:15:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 22:15:45 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 16:15:39 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 16:15:39 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 16:15:39 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJMFdt32067300;
	Wed, 19 Nov 2025 16:15:39 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 2170A9ACF4; Wed, 19 Nov 2025 16:15:39 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] nnshark: Set missing PV
Date: Wed, 19 Nov 2025 16:15:39 -0600
Message-ID: <20251119221539.2689158-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251119215254.186164-1-reatmon@ti.com>
References: <20251119215254.186164-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|SJ0PR10MB5632:EE_
X-MS-Office365-Filtering-Correlation-Id: de659341-2f7f-4ed6-7643-08de27b92fe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sRQ7+kgp6mWTCjv7aJN+/p5F+4HLpnHL6XEHW80PuSktdIRv8pqMBOz/wx3t?=
 =?us-ascii?Q?6CRYbN3L/sFpWCpPfdHcr6KwPmgaukKkr5sihIHpb4rK1V5RO3tXrUAPFpQU?=
 =?us-ascii?Q?RafK5FwNoN7UsqHjSNCMnWg9n8rxzQvpMI5cB+fkY7RF7/IzwmNQgSGKK0Jt?=
 =?us-ascii?Q?Eutjv845X/F8lvZBKiRkBDHToE9TWNa4iD447BwVV3JKEzqYvYJIqwtAfr5x?=
 =?us-ascii?Q?8zjSuEfEhLabpIcDt04ruRAhNFUvvxVklP3Wfbj0O9Q8UExyyzXApEs2NQ8N?=
 =?us-ascii?Q?erNiPMLK1GNyXth0OSyh2Y5b9BHltBtoN/bQmwupJXIOz+aDditRefRxbCbt?=
 =?us-ascii?Q?UroKz9TBis3W0x0AeSSXM8Oz/m7hadvZBfHE66FoAamcnZTso5MD6FQ2vQmZ?=
 =?us-ascii?Q?2/PNrBtOhZZck/bw2jfjrodftxgCg2LwH2OlPuzNi5NLl/kPXe5PKdizq7gL?=
 =?us-ascii?Q?Tda4D4hwnRYGcuS8uQIKDnyxQotaYslbdu+fyYl/R1bRXSgKfkWhXNA7DZhe?=
 =?us-ascii?Q?kgOjYFcizZziZHli+69YW1lGhOi1xpVeImQTkoXvtV1blYcJBRV/9V8zn7TS?=
 =?us-ascii?Q?E/6cjecmmj2uxkZ6Vln/H7R3erajFmFBQ53I5ztTUHu4b96zPKoQNDP01pyW?=
 =?us-ascii?Q?RAcQIcOfWcpggF8TZjd041cQCBMxpRV0Mv7Byif1xpWlBg2Is1GWX0LqJ/Lo?=
 =?us-ascii?Q?Za+nyzk/fZoV/sJDGXtNVfb639b6GNYBQh2nqwC6x6TAAZRGQLyojygnr86u?=
 =?us-ascii?Q?FGPWf3mdm4RzcBcT9yznmXUG4U8tRcEVdY+N3atBBNRdCkRvpHda1VkxbrRL?=
 =?us-ascii?Q?pH89aWhWIYfiLkXKFKtw8DX5+STPqZLeyPOgGDhf/rJrnhBjvCzFpxc8BkaP?=
 =?us-ascii?Q?0jTaY9tOiDx7a9VQ4H5YIPms/vlEouV+Hpl/0grjNUpKG91XXEl21GEH1UC3?=
 =?us-ascii?Q?yrNfdv6t+1tvw1zBf/KeeBW7rLWFCU3qjBI6De5c7U8n0Xd0Jhy3fppjmgBa?=
 =?us-ascii?Q?xP753yMAudnO6+VgCxFyr0vsrG9s8/RJVQ5euWuv/DuvUOLaIvATQZx65yCH?=
 =?us-ascii?Q?vmdVcXev4eN4X4N9FfI9WElMFJo63HzUFoJpYzIemg2bksES3jSYi0DSR+Ie?=
 =?us-ascii?Q?lTuQNL+QKz2esccK5ruqD44h4Be65h4VMJ1HYvLRflCeRFI9xnhL1PR03tnY?=
 =?us-ascii?Q?vl09lhCbP9YLlEln/vfrcByRtotgJE8YD6c1rN8O7lRjZh8gsF2YUKT+OMF0?=
 =?us-ascii?Q?k6U5JDtnMkNsN1/gTedZ04oxjUFERd3X6TjDW1Qv4bidYmBzRu64lcMJvMrq?=
 =?us-ascii?Q?sGL6ku3VYz4zt4HGum+qA5JgQMRGXV8ifszhWH6kNtGiu2rJ/a0d+zFf/HAo?=
 =?us-ascii?Q?ImrtmjrC1G6LKVkZpkawoZpUXw6ATGei5QAdqpQc2smBmcVg3WyH5fPP/pB0?=
 =?us-ascii?Q?awVogehb0W0dgrC6q4Adzrx1HlKOTCtwW/Ulu9h2hZMUAMvn/UNKS9y3MOKr?=
 =?us-ascii?Q?UO3J5KduDL6kN+tc+WqUW0AJDe9mJpHR0w67oG/ZWkUQH1bE2Q7z0tCyIicj?=
 =?us-ascii?Q?4dyXmM0JMRAxR7mwRWU=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 22:15:45.7849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de659341-2f7f-4ed6-7643-08de27b92fe5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5632
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Nov 2025 22:15:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16813

meta-arago / na / 20251119215254.186164-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] nnshark: Set missing PV
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 19 Nov 2025 15:52:54 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 983f2a475ae3ba0890fba1733d045ba22=
5b1946a

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202511180100
- Commit SHA: 82a437373896b01cd89d456dcc9cb28521b64ac7

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




