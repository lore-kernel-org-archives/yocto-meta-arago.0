Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7AAFF6E86
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 21:23:21 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.172.1773782591883805230
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 14:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=HPJqqIth;
 spf=pass (domain: list.ti.com, ip: 52.101.56.3, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZ0WUoaS5SpJ8NqL7xm93LmRHfSGjdKACatxeuNF8ug+ljpAGpm3nCbj0HZqn79Ge5TRnD41k1kprXN1YL1Zsd6b9E4VYo5S3O9C9gqEBS6FQKDoa1y/qeooj4/MpeOPh4t9OOYsb7CQqSYjwL8/uqLiQKSJnKMz9u4XyMOd+DuMDtr9EXWEKZ6qczwYXPEuUhIF+frRuquiRR7bq16QrHcJD3nCI9MbqK1Wiw0xciTv7ThEx8m1bNOkVU9NVPw0Q0ZcvDz8BP8u/gxM/wA1oKKW6B5pRgkfUUhxlXRFL5372IUGQBE6AEJK5sJbmfec2xNzltm/OR+boExarje80g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8bxwwNi3PhGotICKsJHgBmcgPhQgFMctzjqDQFjHOU=;
 b=rQAfwzIvJB3GDY6ZY8mVLe9Qa6t4QE9MrqDudl0gwMBp3h2A/dH0/Ze9zuVjLOJh6O0093IpLEf5uZEgc75rSSu2P0RNbA9zi/Jl5mfI7KBS1tnCQS2k6eFww36eEGtfU0yk5MdCd4ELp9aGfxt3afCCpRAYJCIrgn0GHYXOFLzmSn+LsI9GJMkFRAqAduGmwZXgHFYCcfhG2k04BU9wHSDyOX7WhBjCQ7POjOSzoQFYHBP6h39zzuBG9liqScjq4z6OyBm/5CIj2Om0fb3106L5S0UD6kss3DtVpTWMs8+e+xUW4qQSOP2Lfbw7/SzCDRjN4xXoHnEbSjxxsf+POg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8bxwwNi3PhGotICKsJHgBmcgPhQgFMctzjqDQFjHOU=;
 b=HPJqqIthLYo1zezameURRpF1TJnd5rHu96NfXtfC4Z/cVFC0GKPdoYBjz5HeLba1ot8Zdu6Xeaed7EXOPOE236+KN2jP9izCfjRTnQZgmEAQWG1Y1ovtoJizD+9Qdk2G7kkTvVh9HwplbhoZe3TURqBt5TktbzjMccPuNm5dh6jL8syaqnmqT/DJOiCrRwqQaUmCg2vRl7Wp8/+NOEph/+APz9j9g6uIggLRCY0LNh7UTDpfNNMxOQuY28g3hwRv9HlcffwXMAPf3swY9LBbkJII1QEHqTN/AgL1WvmLCLSAnHHn4pJ4MVB5N6BOdfTcWJn2up1Igd/jru9LOfhq2g==
Received: from SA1P222CA0134.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::7)
 by BN0PR10MB4950.namprd10.prod.outlook.com (2603:10b6:408:12a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 21:23:09 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:806:3c2:cafe::ff) by SA1P222CA0134.outlook.office365.com
 (2603:10b6:806:3c2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 21:23:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 21:23:08 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 16:23:08 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 16:23:08 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 16:23:08 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HLN8uk3029435;
	Tue, 17 Mar 2026 16:23:08 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 76DA99ACF4; Tue, 17 Mar 2026 16:23:08 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
	<detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>,
	<denis@denix.org>
Subject: Re: [meta-arago][master][PATCH v2] chromium: Add a patch to fix build against GLIBC 2.43
Date: Tue, 17 Mar 2026 16:23:08 -0500
Message-ID: <20260317212308.3874927-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260317211840.384483-1-t-lannynd@ti.com>
References: <20260317211840.384483-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|BN0PR10MB4950:EE_
X-MS-Office365-Filtering-Correlation-Id: 030cc4ec-2eb6-42ab-19a7-08de846b62f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	4Q9L/MjfVR9VWH64WhqGl4FbWCujxNzGyQsRAiQV4+mWf9BwYI4bR7w2xp1DM6BrlorehG3gDBqFDP9EOMmu4rAqc6CnBfJrmS2MUTLkjdpRgVkBoAAnWEjFoD2ELx65Y/POqnaaKB0i8rCLXT0yXKoU0fDn5+L/XI7CbYKWFfC9fLKPwkjWUDO4xkdyo+E2wcduPVLzC9/AX1DBmRktPecNy08B1+ODwZjz1JpKVs/9zTTR2lxn3HvJSJMkjripoEeNwnzaJqLB5cLw2L2HX4tBtnw3J03wPONK2l8IILwtCK+8MXkLwUd3mY6Xx85pG4SJXxKB98jPGHXsZyZvMxI+Y1CzjO8WayS0u+Xa2li0ivMTOYds6LVg9cLK3AEA+7oz5Zo3xvxBCViQn/OhS9vtYKDUfU0CdkOHTybLRr2duJiyVTjxLW+9y8Sz0lhXafqathYe5z6ku9YiYLLXHSwR8V9mcNad0eU4itP9mvCKBHO+wPoC9dddi9bvAjdO2MD6qabqNVES4Fx1qjGOIhIMXJmUsIkgogUpAW9Tygty/eEADdZ5PGv7su+J06qsZ7H8X+s5afNGthUfYUGDpFVUTYD40cEuWJrVXpSSVNGEUK/bvj7xiythCZTo5V6t3VKU4U9T2B6sPepnMoRAdLYqKGZkz+L/zY8+exaKRlREeI/CcBuKao2MTSIlBCyJFHzTgW9YVLoxWRaGKef26k8KT5fO5tHzniXCJYJzAla+75j1OPmMzYGo7O/H+O3WQ3El2KDBYeVrK8IXXQLa1g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ID2oy9zZXqdJN9DMsSbOQcguI72NrNWDfl2ZHLSce8vETyPGKokxhodi/O1uaLSS5VAHD9SwQsiMOyEGPMDAYkr550TVC0zTByjK6/wyIVNCtv87aFz6FpBnrU3yb9RdzPWJvgXVf0wz5ycCN9LKhngUcSKQjM5qCgHXMydRhGHwmOl38Lekb/RCA2nU7HihaQDaxMzMlfbKv2pJb4uxKVbsjHLj4Aujk3CpfMmSKeW9k75LE4g/D2e7swjIjXN1pJtQPiKmWSxtkc5D1JbJ6aBvHbnzO5JMzDFJb47mZmIk16JwEuswrstYB8MWmrxLSnQEb5JQh7E1lnD1jEa+ukIWEcAc2QNDLmkiMjnVU01LKO9GmhtjR8XW4S2s/f2GskGyUbvG/ZBj87PNvS9srGsAhhh69Qxf6maSVT1+vX0HEVmaSY7vqNDNd2xS1Qtd
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 21:23:08.9391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 030cc4ec-2eb6-42ab-19a7-08de846b62f9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4950
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 21:23:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17389

meta-arago / na / 20260317211840.384483-1-t-lannynd

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
- Patch Series: [meta-arago][master][PATCH v2] chromium: Add a patch to fix=
 build against GLIBC 2.43
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
From: Zolt=3DC3=3DA1n B=3DC3=3DB6sz=3DC3=3DB6rm=3DC3=3DA9nyi <zboszor@gmail=
.com>
- Date: Date: Tue, 17 Mar 2026 16:18:40 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 75f94b9e99c9280eeccfc4c4ddd465cec=
9686c70

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: ti-test: Add request and websocket-client to packagegroup
- Commit SHA: 64d6190f700d54addcd17687b7428a64c2bbb0fb

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
ERROR: Nothing PROVIDES 'gstreamer1.0-vaapi' (but <build-dir>/sources/meta-=
openembedded/meta-networking/recipes-support/spice/spice-gtk_0.42.bb DEPEND=
S on or otherwise requires it). Close matches:
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




