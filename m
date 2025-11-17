Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CCDCEBF61
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 08:35:31 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5250.1763368529155119345
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Nov 2025 00:35:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Yqe9XiLt;
 spf=pass (domain: list.ti.com, ip: 40.93.198.14, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=simzwcuIMiKQwfV6FFJV9fL/kcVsEDBXXWVLPhakkQxWpjbaiz5ZDZXnvc8j98V8Ws5ol99OwHuqZaCa5/2xIheFjjNk0fb70welOPxmBAZHSgP6ROXRTnJ1bzDzdMr5h83rEBwnCLbs+ydNYnxhviF0aNsHJg4E0yVkmnCU6wCNLNQVwPLqiajJAEy9lk43JkRxaDMkTXqTgs+jtmxSXRcujVoFiqAT+JATeEUc9DfrNcCPXPTPocRuCgXgREov8jdALXLyrPbpfEnSYXb78tl+9rXS3BkAXFk17V0QGOapW5jXzI3nkfvIMDGQIc4uXVjKRUFADdNk9TT/2Hmqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GgI20PiWSu1TI/ZAkNJur7yNWRbajTxyyuYZ32TfM0=;
 b=jdmvbRLmVX1ducKKqNclSPLHo6OzH8lxT+HZ9t2CLytYV9zVNK/4pKnAOe67j7nrDp0vEZSF8SZJMK99XVtfjAXVXBvvgAgo4y8LI7USe9xCOa40xukeIAmYq9t1WGfSNafEvN5Sg6PwUWPy4rHw45Qa2qQAsOiD5E58qPzpqvKePXcwqvorUkYY/SvsbOpfifufkcPWdDmRBM33YvzSlu4qLH/aV6OofqSVZS9PN6Xp03HEqHQQ9sqL7VKTGpLx5DImDAGtMvmXZ/qvsC224AjMaEq4kGAzP2GyZkJldgnWxNF8y3sqrTevhJTiAor1XmON2vXw1q4wPjvPlyjtfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GgI20PiWSu1TI/ZAkNJur7yNWRbajTxyyuYZ32TfM0=;
 b=Yqe9XiLt/U3qusFZZ/VJ9q/TxpMVeVP6ZV5mEMj91TolPrtLNYx8IoC75SGoioMCQLFTzp6Ra03GPSJA/RDJS3C31XY1h2QIaRJU11a8yhJPPiJwqmqfzjAM7pvgDx2hN+GL6qh+XGqVDDL0M8HgLddEH9BtUsWvMQM7A3IBFIc51d0UmAtZb/pOm70AYRRiix8DLED8V+YVgQSzQM5j1HyLpd3hkFTOuOCAUCMusVEHGK0CWE20Rxh/9DhURNJ24poe4TX000qIO90wXm5lDldlROnFGDJOw/e6lVHYtv2iYpvqxCivGrs6L9oFh3RAcuocWgfq92jDB9aNQmegTg==
Received: from SA0PR11CA0169.namprd11.prod.outlook.com (2603:10b6:806:1bb::24)
 by MN6PR10MB8048.namprd10.prod.outlook.com (2603:10b6:208:4f4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Mon, 17 Nov
 2025 08:35:26 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:1bb:cafe::c1) by SA0PR11CA0169.outlook.office365.com
 (2603:10b6:806:1bb::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 08:35:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Mon, 17 Nov 2025 08:35:24 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 02:35:21 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 02:35:21 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 02:35:21 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AH8ZLHh2182531;
	Mon, 17 Nov 2025 02:35:21 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3DBA99ACF4; Mon, 17 Nov 2025 02:35:21 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Suhaas Joshi <s-joshi@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <kamlesh@ti.com>,
	<s-tripathi1@ti.com>, <k-malarvizhi@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH] meta-arago-distro: Add libp11 library
Date: Mon, 17 Nov 2025 02:35:21 -0600
Message-ID: <20251117083521.3452470-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251117063400.3715944-1-s-joshi@ti.com>
References: <20251117063400.3715944-1-s-joshi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|MN6PR10MB8048:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fbc148b-60d1-420e-4c84-08de25b440fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3OYNcV/FH9yCWoNWdUNTfWgYLNv21il/i3oMuUWwXei9me727vGd7E9gWawZ?=
 =?us-ascii?Q?oDrlJv7mmFABn7Bt2w8dH4B3KmCMAkn0HKtspyrJXoB5KwPtLBMpzsuLr0zy?=
 =?us-ascii?Q?ilAj/RTvWJVxsTA0KLm7+TYtokXGeqbc+VpAiZZHYNxl2vy768WJVUItgECQ?=
 =?us-ascii?Q?X0wL53lzNEGD1bgU5sLfD3Ouy88i7qoIqPrYNC1SVlnMf7z1fLvegGXEvATr?=
 =?us-ascii?Q?I4gQnhYp4+48osv1ctX+Xj6LGwwmEJeC3cbjBUewbMpn3aR4/Y+qlcj4niRF?=
 =?us-ascii?Q?z092UsRkd3/ybAuwxEGlFFoMlaL8ECHyxii1WTuLLg0b1rzjf9YOvjZK+MIB?=
 =?us-ascii?Q?aple3FCdasmAfe65sUqMyzyFOnaEZ9SMVssWQLHHq/ZbH08i+66WJ35MGWX/?=
 =?us-ascii?Q?thLH8CrPV07ZFqtl+hYyaEcAKo1yzQyeyPr3QAg2iUOjwimCp6CkrZ/1LfL4?=
 =?us-ascii?Q?lRxGsCnJWkJKgISiVzpWbe2erXO4e1b7umekXNjDwLPDBi2d1U/f5UoFK1lk?=
 =?us-ascii?Q?v7stp7qOz5vmJJ2ETW5+qmqZNxdvEf8AHZ304fPNIpojY2Y8TdN4v8ZKVndB?=
 =?us-ascii?Q?/2LsiDPeNRMfM78HjXtmx95mGjG/272qngPxPQDWFZcf/2PXaAWiSKZMawMk?=
 =?us-ascii?Q?2/Ehp+8oiHEIEEjcNACI2/U52hJRKpCGUyVsP9lQ+sy043TGuiRZrQw8kAoj?=
 =?us-ascii?Q?lGhgNZcuYphu5hbFvunPOIQakmJ04KBXKCrAB8caq00SF9vpi3GjVVuoW452?=
 =?us-ascii?Q?Zlwr4B3LplJtQe9ow1PrpZ0cjYNh58eKT7F4kpSFVsJmPXm56lU+7QNrQriB?=
 =?us-ascii?Q?t1SKyvm5d0imM2ECpigezWixOFhwqporK4Xg3KTIhTpGKXfv/auclMwwc+Ey?=
 =?us-ascii?Q?VGutx4tJ9kwu4vmjP6WNmhQsiJLvffuV+n51GmFuMmNeQ7mtTB0wyHXDG8dM?=
 =?us-ascii?Q?Ny9gO/V0arBQ3qQ3JIgzze2P6NKagHgASaRYOzh6VmgCI9ZKD6WsZrhT6heU?=
 =?us-ascii?Q?swWO9s6ND60s8RYT6Jr7tgpMpVH2rAFb82hx5Sv9QFjewnt6wKQlpl3q5+Sg?=
 =?us-ascii?Q?6OPHyRPalh4KDApsI0Hzg+xk03WspAwjT0MCZ3YgASXK08mb2GmQofL9+nx5?=
 =?us-ascii?Q?GbvNDT21XMcdXIbxmlwh7S1obzSzEDJ4vmRUHnpRA/zBpokvKeCS/Ywi0J2W?=
 =?us-ascii?Q?/iq+yLusL/i0h8JM4lZ0fQOlQCXgGBqB6k6nmf69ilk9shPskLmU+xwP7tUC?=
 =?us-ascii?Q?WfXj1DwxM6VR6OqyUpBB5PVTXt3MnG6nOLuhR+pTKnaTm4Hn/x9r1vBgH/WP?=
 =?us-ascii?Q?RhUJnJJJs+BcZ68CudIvr9yGztc4JmqrPOtBQc+JM5q+N2kxUqYgDVNhKkyj?=
 =?us-ascii?Q?hXaPw7aWZY38bW7HcSM5LLukJkoDvlZUyiCy2mmL6wZoqpkf5iKNj8oAJJIU?=
 =?us-ascii?Q?BneXr+uEMishLF19KGwDhv8jaHdOByH4WeSpDaYpARte+0k7erBOx93cpR9w?=
 =?us-ascii?Q?lXURpBWLNWQ8OydXR0z6E1FYqu3I/yD0djjzXguDp3tHaCvBu+tIaWKLujz4?=
 =?us-ascii?Q?TgDHWdWB8kzGDF061+Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 08:35:24.6937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbc148b-60d1-420e-4c84-08de25b440fa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8048
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Nov 2025 08:35:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16773

meta-arago / na / 20251117063400.3715944-1-s-joshi

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
WARN - [meta-arago][scarthgap][PATCH] meta-arago-distro: Add libp11 library
    WARN: Commit message does not include file/recipe name: meta-arago-dist=
ro: Add libp11 library. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: meta-=
arago-distro: Add libp11 library.
              meta-arago-distro: (COMMIT-MESSAGE-3)
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
- Patch Series: [meta-arago][scarthgap][PATCH] meta-arago-distro: Add libp1=
1 library
- Submitter: From: Suhaas Joshi <s-joshi@ti.com>
- Date: Date: Mon, 17 Nov 2025 12:04:00 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: fbc948cf5228470593145e73a7f3d1d9d=
86f751a

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




