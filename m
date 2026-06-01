Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A82F7CD6E55
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 17:10:57 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4273.1780333850808160414
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 Jun 2026 10:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=rLwTJTGx;
 spf=pass (domain: list.ti.com, ip: 40.107.201.33, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iyUsFhREbtW5rpmTNG0oKfvUcUzYLq03HOXfReEOpjVVCHXKMlprQGVm6XRxGWwa/xeo18pir+faI3vFhOfJR6vL6zwiWtGGuWFpHeRsc+hZMf9xwqAANDTQEC18yqUrAewuNhxrbPqbEG9GWE2hHsjcawb1pTFqCOJXrQNyz51zG92ZoxP40eL4Ogs1mO6c8NTgxrEinDaNHQo5I5i4QuB53NyUw8xKq3FRCOkMN9qR6HMXm9ibF1Rhy+cxiL803L0Y3G1Ti76kHkXxPqRnvdCthSLsuHGw/szwGRWv6p/pVFuTzel+HW7mH9KDb8lCsYGZm8BBjm0ivsUnG4CcuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/YYIMY40hdA69q5xSUtn3o+R+H+FqvC5r+H/PFQCuk=;
 b=zWoFx3TwbJlt43QvMxFkw5hDhal3stNdNMf5MoF2wpyjaoMWEFK3RF2H7iBPEebC21J8gC84N6lOEwTVSTyhhByzEOa+B4Fa9XPtDpUihZTc45kST9wGSja/KR9xAanlkkKw6MWUYhQNrMTyG6LGm+pHiQme/eFd/IbMY4JIVn3Ln3C7tqAZF93TlGFdvriAzRe7XgG2sbicjeL3FJagdZL38mDTn2R4Js2KwQRMqognqqE3o5QItQqB7M2VtmTQ6DASX5jsrA47Z9C7oYa9FK9fLtu0kcRCQHlzNGQjDrL+++UQCUfUCXSo4G5xnPYwgaStP4jmF7eZlplAsRDFzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/YYIMY40hdA69q5xSUtn3o+R+H+FqvC5r+H/PFQCuk=;
 b=rLwTJTGxOgDpoG49xFF/S7Yo+yA8vEQ08YZlIaYSKhHIrSuOdnhaEFyTiMh6rvMIDe0J8AFtiqUDJo5dQLT1WK8Nj7fWeQL1ztO4LPT8VxxOy+QXzarLtDuL+kj/Goz9HwjxuVYVIVuGsB0s3uJH+ShGH5tRUDzx3mEQ6gM9tfPipZSQ+ml73uPKmmgVhFykcxu8jiE+ey8/kUNHbO8sQQPrEYRh1ZA2zKu/QipnsBTcNPDIRCuhvad/OLXYeGfwfrlLFU0U/pkMJBGUU/hNs+bfCL6NWX/i9mQo2CjqofbtUc6HnUQ6QpwCjGQBpuyiQCA/SembHzOzmUUKwwlRPg==
Received: from CH0PR04CA0119.namprd04.prod.outlook.com (2603:10b6:610:75::34)
 by SN7PR10MB7045.namprd10.prod.outlook.com (2603:10b6:806:342::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 17:10:47 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::a1) by CH0PR04CA0119.outlook.office365.com
 (2603:10b6:610:75::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Mon, 1
 Jun 2026 17:10:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 17:10:47 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 12:10:46 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 12:10:46 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 1 Jun 2026 12:10:46 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 651HAk3D2639081;
	Mon, 1 Jun 2026 12:10:46 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 1DE2313F531; Mon,  1 Jun 2026 12:10:46 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
	<detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: Re: [meta-arago][master/wrynose][PATCH] weston: fix assert firing when subsurfaces have no views
Date: Mon, 1 Jun 2026 12:10:46 -0500
Message-ID: <20260601171046.2283831-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260601170844.1723390-1-t-lannynd@ti.com>
References: <20260601170844.1723390-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|SN7PR10MB7045:EE_
X-MS-Office365-Filtering-Correlation-Id: d889dfbd-2873-49fb-0955-08dec000b926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	6mobFzU1WgoPkun1kbqbnqgOBmk1LnAIPETNzAObQxij/ie7BPcrK2Dx6/tSOYRwLm1eLVjOfpFALolI5//BiyUaAOSENVap4FhsTHfpFsR+gcXNwE+bFu7XOeDaQGH/E00263nkb0KOUaH08LRDjP8VpVu+3sx1/mv6cZDQAkXWN/BGhh31RMnR705hk+0CPqtRBzCjYrLQ/DzPN79uEOkAx8L7zb3XPZNIehhmn3P48CIirc6PR5mvpbZxzoRSoKVfKWz4XLUS95EVR/DcGm817b4/PIqpxV3wv19W6APZ82P5+SeqFHIaV/6EMEiVMQqkREd2JJpIq6J+fErLzY6QzN6NB+eKmmyF/+xWhi82Q+iH7dfhnaltUEvq53N4kxEYSMcbSlgEos6QWdK3p45mfyjMCzuauoXdsfRYNiuUn7D5vLuWC+V6cXYEQLfV4zAjyC1e50REjoQzDGiMKtE0Y9AhQZO8qNcDsVYlMlK4i36rkDd9pPOKsqJqBcqQlGHUADh77w1agKLSeiEBasJ+3vOkohTVvFG77vj9a/ThlnHZewzIp0+7PLpuHCyW9fDtEPnt2DcQ055EhOD0rcPHSEjTE82p26CLPq94V9PipABakCKahaVqzBvP/noyoR/IIAQ0MdD9v+nXcFH5uU5WvN7epMRw+BhH5aUmxxTjEKUlJs8lmw8RdgwMOVRTzAhtSdlhob0VBV9TqLuO7ebwWRigQKunn8HN/HQDlGA=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/ozWbLUiQN8z5Y0vT58Df0X2xdND4TIEtblxdkA/SKkwgYsmIsYhRiNC9Httf1hsICvDV8F+Au2Sd8Yk0I7YZJwX4qyOZmIlo7tZwMo8pn+ehCdk0FxStJaZ1hwINMtGVtIv0bu4RaetAckojyu896a5TSk4/Bhlnm1PNZrcdlSIOTy8Xp9zXLGoK5I24dNCRDyV0mTJ2kazfP1a7TqjYsKAioWy0z7xrHkgfWSq+EFBdcZl0Xsb7XpUeUExaZgLyADtSh0JW9gGsMmDNVwZTQTxLDb7p+7/sDS2TdMJBMQMtmzNzKIy3z+qelCclXnUZNPBSPZSaQgJjtSXKKHezt+uk6Vlr19zbcZ6bzBIwPTfDKs1xTkiTLiDBeo8o03ih1sNsgBbcTz/uGT4r7kR7DxgH5A0PDGVRif57yannDbzepGv73e9K4a8z1d1vfIy
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 17:10:47.1089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d889dfbd-2873-49fb-0955-08dec000b926
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7045
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 Jun 2026 17:10:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17545

meta-arago / na / 20260601170844.1723390-1-t-lannynd

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
- Patch Series: [meta-arago][master/wrynose][PATCH] weston: fix assert firi=
ng when subsurfaces have no views
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
+From: Derek Foreman <derek.foreman@collabora.com>
- Date: Date: Mon, 1 Jun 2026 12:08:44 -0500
+Date: Wed, 27 May 2026 14:12:36 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 7f41b6c3ff2986c3e09bde805cf125a6d=
e8d309a

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: meta-arago: chromium: clean up and simplify V4L2 patch se=
ries
- Commit SHA: 30a611f56a4bd74d421e36ecddf705b956c01648

Patches
----------------------------------------
FAIL - [meta-arago][master/wrynose][PATCH] weston: fix assert firing when s=
ubsurfaces have no views
    error: meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc: does=
 not exist in index
    Applying: weston: fix assert firing when subsurfaces have no views
    Patch failed at 0001 weston: fix assert firing when subsurfaces have no=
 views

wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master/wrynose][PATCH] weston: fix assert firi=
ng when subsurfaces have no views
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
+From: Derek Foreman <derek.foreman@collabora.com>
- Date: Date: Mon, 1 Jun 2026 12:08:44 -0500
+Date: Wed, 27 May 2026 14:12:36 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 7f41b6c3ff2986c3e09bde805cf125a6d=
e8d309a

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: meta-arago-test: Moved to meta-ti/meta-ti-test
- Commit SHA: e9bf10c0e71b08fe827200af575f9c9749be7bc2

Patches
----------------------------------------
FAIL - [meta-arago][master/wrynose][PATCH] weston: fix assert firing when s=
ubsurfaces have no views
    error: meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc: does=
 not exist in index
    Applying: weston: fix assert firing when subsurfaces have no views
    Patch failed at 0001 weston: fix assert firing when subsurfaces have no=
 views




