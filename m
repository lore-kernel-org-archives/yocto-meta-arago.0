Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94ED0CFC516
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 00:00:46 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.259.1763769642085164100
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Nov 2025 16:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=eS7qntyz;
 spf=pass (domain: list.ti.com, ip: 52.101.48.45, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vs7lLPoz8/lCVbOMdGaZTXr4SHlyDWNHEHcu+gZwwlOwlEEgylqvV6BZgMfV6qEqFUaqjICiLlvsDzWev9fBbTmnd4p5Qt2ydPG/PQFYaVb9gQ8Mljhk8s1cTh+02AUbqykQbBeIz9tRj/+4mp197OxqJPgyVfnRGsB8JhTLi3uxcEu+muVa870EBQgJIrFNrGlt9/YOSdY/cK/hAGFwfVs+y6mmrXfpZPUUgKi8hzjVhnvO92a1MZKmwtIeAM0TE2bDQv4O4C6umqeK9YtLHradVPOOroD75btf7dY9OmacGByn07i65J3eHM7yRESVjvc1tBimgncvBAyCZdksaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGnhldND4sWxhA09KXN+KdwJdw2FGjlKQ4oa3Oz5zRA=;
 b=Ue608G188ltwS75ekd3bx7Yi7CJ0aALdJT1GEVPVlBUENEsrlFZ6tuoEh9bXL73BaQzjYnUeA1AYE/nZoQjsgbbXfD4tR7T//tvMcMiHmrnsm5PnUtmvlNB1kUhxAyAs25LO8XmqMkWPDl56cwydtvWIbZIE3Djxb2LJymtykzrmYczN0OCiZGnzioGllZKheRO2NvEMjEDwGnHfWLPwNlc6bQx8XYjk542f20Nb1OJU4DPyqcLrP3nIcxZjYFKK741mXrDln554NbQiXQmNPVxRWhrQVtztDsocDmytVL6VHxG9cjJzx7sIKPTTWY8EVjeZl/25aibjN9OdlTF+/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGnhldND4sWxhA09KXN+KdwJdw2FGjlKQ4oa3Oz5zRA=;
 b=eS7qntyzJm5+dlIxHw+Nr2ePXi3tRE617T4McDSSLYXwSbs/rO3mDh1KfUpeBD+qMOGJeLRQfzzHPoHgO8fsj1ivdeR8+pIu7kYxchEgGOdofU27jnoy8VsR7y8rYU4UbRDdhTOVLxP19WNseA9ZLLRj6JtYwSV2d90tXdinJC20zikd8MVwSx7ApdPOXE2x75LfVXWEb5pcEHd3Ub9my/U/M+HOI5C1vdLCE4uQT+Wd4m022qTDQK66sBjG7Qu6bmwVspszz5p0iOUpaYyJoq19yGgISkqEswgl+4btQd0aXblEHCBaUXKW+gnuL9DdYfZ9oZE7pl5u+BJu0VHJPw==
Received: from BL1P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::9)
 by LV3PR10MB8108.namprd10.prod.outlook.com (2603:10b6:408:28b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Sat, 22 Nov
 2025 00:00:38 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::16) by BL1P221CA0003.outlook.office365.com
 (2603:10b6:208:2c5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.14 via Frontend Transport; Sat,
 22 Nov 2025 00:00:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Sat, 22 Nov 2025 00:00:36 +0000
Received: from flwvowa01.ent.ti.com (10.64.41.90) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.20; Fri, 21 Nov
 2025 18:00:26 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvowa01.ent.ti.com
 (10.64.41.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.55; Fri, 21 Nov
 2025 18:00:26 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 21 Nov 2025 18:00:26 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AM00QUA082654;
	Fri, 21 Nov 2025 18:00:26 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 5DFAE142E2B; Fri, 21 Nov 2025 18:00:26 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: Re: [scarthgap][PATCH] arago,conf: set preferred runtime provider for weston-init
Date: Fri, 21 Nov 2025 18:00:26 -0600
Message-ID: <20251122000026.1022350-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251121234400.1356544-1-denis@denix.org>
References: <20251121234400.1356544-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|LV3PR10MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: 4880839b-e852-4b50-05c6-08de295a2a79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VjAa2XiKlrIUw/9Y8jrvmPt8KEsw0dGMTquo/yXXnYwH9rlZLLlvw6wLufnI?=
 =?us-ascii?Q?o22E7JuhGtr8dCm832BWRQhVikDC3iATqoyBgmsryanWIcw+j8cnZz3EXREl?=
 =?us-ascii?Q?Hvwb1EpXlwXfVPaH0mHKA93wPOvln+iDHPHijMT9HjmAD3FKA7+kElXAgWCI?=
 =?us-ascii?Q?Gz3N11/EHNHwDZoyB6K3XyP3y1gU5IBA84/hbnU+wWwNuxvXGj1fXi/s+ZWG?=
 =?us-ascii?Q?j7pX7NvcbI9COJ4dbG8KxqdfcmET2pnJdjIszjRlnOG5LYNW2VbJNBvVS8mj?=
 =?us-ascii?Q?wtd2QqLG7PllVO3vevIQI/2R7L1roffUz2in0GN6qr6KbBSRYrBzQvSb1rKu?=
 =?us-ascii?Q?ayHLM5e8xNiSRAonK8L72y+unx6wrTPa74lhw3a6ZFCV7iuFKPYLpWSAY2eR?=
 =?us-ascii?Q?FjFh82UnpxvzYOLQm2sFyTZ8FaehtqS3Bd7o86jOHvZ9WjrU6T2wRw1aHYxj?=
 =?us-ascii?Q?JdXSiWNwH6sDnY503eNped5x0xzZnL6/QlHY+BsMWcjJxflsdPdpvzXEBavT?=
 =?us-ascii?Q?PP3P7j4YYGb1JGG2cSuXbqAgCLlZOJ9OuR+E0MQrp10bhBwMKOAfatZvW3xC?=
 =?us-ascii?Q?tH+cGA496gIQ0dVc8IdHZ3Rvrb/wCxD/8XMOvkg995WpLrzBSZjbMWaZOwl2?=
 =?us-ascii?Q?faDG+IsoleS+YRrQNJlD3URx83Sj7jbUzwZX0FcsTQir+y1EVcx6DEDq7QFB?=
 =?us-ascii?Q?nTMduGZyC13AqGkUrn4Fw8Y0R69r95+x235g6HbKLT72SuQcw2mx1l+BvopB?=
 =?us-ascii?Q?Y6nrVbyNhfGC206+jo9F0LHmFK05Qnteo062+X1Vtv7DUV1ZDjfSzGWLFLg0?=
 =?us-ascii?Q?QdrLK7bgbWXfJ7e60rjZ3NoexTeehjB7omcwsR6MtqiDLgsOmR9gkqkiqVob?=
 =?us-ascii?Q?vZ2Gjkb7Vwt2VCl5lIyiFs8bl22VKIQ/Lg4KXkeB8yBawFGiRvTlVv6JKmAo?=
 =?us-ascii?Q?b6pTRUpGJ9Wchz17tENaAWXCJJ09eb/iRSLPG0MN6PH0iFVJLQ2kDko221fR?=
 =?us-ascii?Q?cUuKvoVa+Ad39/2pPLWjMm2ZqsmBFiDQQyScbJLAqGVmomvmAvQKOvb66yBC?=
 =?us-ascii?Q?ExMQBoAl99JS/1HBaXHUY8EH3NWlgmtAL6pl2oS2OoCOUZ/3Icw0iS0UGZkb?=
 =?us-ascii?Q?DVmRwLBNPkYS1rCFVzY3o/oRLJr5pW0wNqInXDSVYDD0bLhL8Kd7ojf+3kBH?=
 =?us-ascii?Q?xr3/t9S+gPs9t6tytQ+HjE8bNxgbBWq90wDcqNp9YwNDlaU1W5nkD0hSKzYN?=
 =?us-ascii?Q?awB8/DEqMcd5WF5jvrk0LC/YQwMOBcx+tiXinY1vClYUtSfAIkn6qR4KRTz9?=
 =?us-ascii?Q?lnjeyjwDjXOfKWrTzE/PP3Kb2hkUMm2JI0ANiiIKQ42MVHrPrGLrvO1wWZ2e?=
 =?us-ascii?Q?1wBkus2K8YmUpSJ+cW7xhdA6fXZHH8ZwNJqVJpY8oQ2TXhtoVrL8DarYksMB?=
 =?us-ascii?Q?Zo7oxckxmif9jFEgEh8Bocv9F5dSQzf1BLlbWXH0abUfLwJ1uaAzv0J93vzd?=
 =?us-ascii?Q?NpjotSo9b6sqUsjPEKeL3TUQGjdGH3nqSjQ/WdqbYIeWlWChinuX/yfVsa2H?=
 =?us-ascii?Q?ObrqAl0Zz4kVzZ0okMs=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 00:00:36.8392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4880839b-e852-4b50-05c6-08de295a2a79
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8108
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 22 Nov 2025 00:00:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16830

meta-arago / na / 20251121234400.1356544-1-denis

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
WARN - [scarthgap][PATCH] arago,conf: set preferred runtime provider for we=
ston-init
    WARN: Commit message does not include file/recipe name: arago,conf: set=
 preferred runtime provider for weston-init. (COMMIT-MESSAGE-2)
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
- Patch Series: [scarthgap][PATCH] arago,conf: set preferred runtime provid=
er for weston-init
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: Denys Dmytriyenko <denys@konsulko.com>
- Date: Date: Fri, 21 Nov 2025 18:44:00 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 60ec81d5be40337dee935203f16811976=
8e48293

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: nnshark: Set missing PV
- Commit SHA: 7b5396d2e36debe754adaaaef84d4eb46688d4e0

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




