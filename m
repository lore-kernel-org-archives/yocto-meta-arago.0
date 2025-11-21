Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979EDCFC28C
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 16:22:27 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15152.1763742141117030769
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Nov 2025 08:22:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=NQyJ5/Qz;
 spf=pass (domain: list.ti.com, ip: 40.93.201.13, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1aEJla4Zn6Q8O8XT7Mrnnh/VYONIOU+Q2rXQdrRyQ9rrjSHU6oU0wUxfh7ZgfgXqgk8bXV+89YDftSNnYw8OBX7h3+UvDubnrZukNa8jeA859kr6ZGtVbFeauwvEL13TErsEY7pCHsIn0zpenIrvaJTUyoKQnYLKY6tR+G6csNBJI4EQDAz3MR5vkKdh0tmc1cVIw7oVBLTBVZ/WZ/ZVtwBnCPDTKgJjZC3m69H4HbI8B1QpUOcHgC3zeBK48HJ73EVvg5DbR7yxjraaZxkbn9vvX1c3ieGhEgnzJzxv199iEdN+JkBvaLMcerFWkoq9YHZL+KnSqmUSxmzplYzew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uxdBd1hw+x6V1kmNiIUmU3x42era0goOxdkPNcioV0=;
 b=DTyzSm7YG8pdWPkDtCONIZZP+5Kf+50qjs0DOVEqdKNrj9IBcXeyfsqmEdYOyXOQJ233e6dcArE7cD3OnqFhEy+sVTwmP6WP/sa8eM3z5hRwr9w/eoAzaSKoCLvIjGf5N+FmfWFm0rbCIzfjji1ieEU+MESZMivR85+SCbZqeMH3OmU6Z+5jhB446haLsA/iOjbXp1sQ7tTcwNNbOp4XhhfTB8L9SqF5yn6uyWWdrdUJ8aNpgVVWN0rQMyTjnnSLUWJXC4qKQzQ8kDIx7AiFMccjko49DEUPm5XUPxUFY7Wx/OaXWhA1Y0pnrWKVDEx2ynMlpgWavzK05vke+/98pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uxdBd1hw+x6V1kmNiIUmU3x42era0goOxdkPNcioV0=;
 b=NQyJ5/Qz4xbtTarfEBUxQddwstRnbBJSYHAVsvOHBDwpOWk8FXiyHPhiBjY9WRDbN73AGN0+JyXtcnwCV8jpGbw0viA+Y8G7uXIJJVvU0zgm0dUI6bAkgrshSTP/PN2d76qhbpsfkZ6ooUsFTu77Se+Nfp83fY/P5Z2xkbOWkP7LwsblOj7V7Rei42yxOVUo5oE5CFeMmobeoCuGHn2EKi+Z28aN2iEhK4rjd6Qnz+2ul4Tipc2yXrpCGpbCBjo/I7dFvItmNrSSiYKYWQv8txhK67MkpVYo3tb2vbwUKHXP7/rMxrklXsJIailTi7eS+e/pzZBFUBhTH+e3WgLRJA==
Received: from CH2PR20CA0029.namprd20.prod.outlook.com (2603:10b6:610:58::39)
 by PH7PR10MB6457.namprd10.prod.outlook.com (2603:10b6:510:1ec::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 16:22:16 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:610:58:cafe::67) by CH2PR20CA0029.outlook.office365.com
 (2603:10b6:610:58::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.14 via Frontend Transport; Fri,
 21 Nov 2025 16:22:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 16:22:13 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 10:22:07 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 10:22:07 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 21 Nov 2025 10:22:07 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ALGM7eA3940643;
	Fri, 21 Nov 2025 10:22:07 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 88F2E9ACF4; Fri, 21 Nov 2025 10:22:07 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] meta-arago-extras: nnstreamer: Update to 2.4.4
Date: Fri, 21 Nov 2025 10:22:07 -0600
Message-ID: <20251121162207.3467805-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251121160030.459921-1-afd@ti.com>
References: <20251121160030.459921-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|PH7PR10MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: ea939243-3c06-4cc8-c20a-08de291a2168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zXaVwmTsBceuarIl5aitl0l/UL1LCzdpPHy1smrxInA3j7CCBfHT9lZmgNyF?=
 =?us-ascii?Q?1CyrQ4vH3VKPtyvrB3m7cGYgZOvWn3otbzoXBdk31YW+G+l5MrGRFhP40+Wg?=
 =?us-ascii?Q?zAaNb8qDbChNj1t5rEV4cwYcqUrd+h7k6SOBCg+zhce8qVgSAUIJrYcfiijE?=
 =?us-ascii?Q?Ac8ENvJK3Vb89SK5nmzvaDKXrHUe5xmcZvD3jLDJd+KkXkYWV/xDCjkDB3HW?=
 =?us-ascii?Q?mGE7leovlFX9wIaB3dAVQIG9N1Vtp21Swno9p0D5lZzmZRWy/NmSTblsk2XH?=
 =?us-ascii?Q?nLoJ3eMDAUJGvgfdA7oKRTkHteDFBOLUznvaliZ6RFBW3Bj66AyUdP0150eM?=
 =?us-ascii?Q?8BZiD23S58zdPhGMlxrPP5K832G0EO/3MUMg3GmC2xeMRgvsktckYkeKE9QU?=
 =?us-ascii?Q?PD83yMFfgyTEufzjxoZmSQs/NRly0+dm3Lpacz+yeSlk2PH9R0bjiHNGvY+B?=
 =?us-ascii?Q?mynrSd3hNmqG7N+nhGXoNTnHYQ5KWOAgiUYnpCHZO642ntUqh3GeAVLkL3Bp?=
 =?us-ascii?Q?vGJxzD+0yEC3PqSBCXWYIkAtGADysGIcLIO9gK7iN0c0uLFNNW9r2Z42fyyx?=
 =?us-ascii?Q?FoF1MFqy+nkxalRLfisOPUN/tit8r6c6ItkXaoT1JoLE+4WA9s42I4TCfLpb?=
 =?us-ascii?Q?5jaBri96gdbaIp9jtAnJm2yBgb1w3RsVemEFjxxNpRynWv+LVvZHiJSCsrUD?=
 =?us-ascii?Q?WMgRCF/qyBxdh2UJCUm3K3Kr4+iQe9fhLGKxEVREzVjg8GgmxeTesLR8mgEI?=
 =?us-ascii?Q?hE5AA8jQ1ygs4+HvTQuqyOWWjwJva/3PWH54roMiA7w0fwG5rcPhwnePPrq4?=
 =?us-ascii?Q?k1ZdHTkd1ek9v3J2eEr+VKSwRi5umu6dwjZWebNJg9ShaZnpex68WAd6f2Y8?=
 =?us-ascii?Q?KxXRgi9dMPqDzpZDlozfJOwbFPCAVRcl7P3OUvCjgE8Giyc0bRq2OwWEOq3o?=
 =?us-ascii?Q?D2byrYeoT4ae8WmwmzCaWZ5VHKPI/YdJNenEN9OFN9AuVTv6pvg2KRQacOBF?=
 =?us-ascii?Q?xJnMatbzI4Dmi057Edh/k0vUqOvr8SiTIJWNOOg7yB6HyBmhIs97GUNkeabh?=
 =?us-ascii?Q?dnw3J79DXxAppMAsgQaDRMPlB9Vv4H2uGF6M/9QStdcxgmx1lBZQRwLDo7pA?=
 =?us-ascii?Q?fTm+rMrZTNUDakPM7Dp/91s/gmAxYHop7JF7ZCRRRaMpdbnFU6UD7uHCdFwm?=
 =?us-ascii?Q?PKtbpudAA5VCAOdrmRIZoD56rTakd4M/0UjkCWRQXrTT2Axy9M/Cf1z6oJx+?=
 =?us-ascii?Q?lXVNlDPfSOE7c6LcYyUNBZgd/aWxcDWMVNXkmRuTn6g53751vz9UbDCPaA+8?=
 =?us-ascii?Q?aDMem+P/q9GjaWTsEvDhJStJoDdiUFfNwv2w+hDEVM5eXHi1JOfXk9GPLdue?=
 =?us-ascii?Q?Oom0gGwAHnZlmYUmydFW//eMwuQCojNK8v1jQeVNnuGIAznlcq0eP2WF8Ns+?=
 =?us-ascii?Q?mjrzNK/Hcn+HKZOG0JNQ/wHflGCKA07yKsvaNbdN12UsDksmOEshGXxTVJ5l?=
 =?us-ascii?Q?V6JFaUdcW/o6gvD/wwZw3hSZ4T1/1L0fnaF+Glv5TBsEHlM36KiLxwrmVAXJ?=
 =?us-ascii?Q?l7XXkAOAipLIZmSU8Bs=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 16:22:13.8532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea939243-3c06-4cc8-c20a-08de291a2168
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6457
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Nov 2025 16:22:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16821

meta-arago / na / 20251121160030.459921-1-afd

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
WARN - [meta-arago][master][PATCH] meta-arago-extras: nnstreamer: Update to=
 2.4.4
    WARN: Commit message should not include directory path to recipe: meta-=
arago-extras: nnstreamer: Update to 2.4.4.
              meta-arago-extras: (COMMIT-MESSAGE-3)
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
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH] meta-arago-extras: nnstreamer: =
Update to 2.4.4
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Fri, 21 Nov 2025 10:00:30 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e5c0b49944747dcc1bf5683be013ab298=
e5a06ae

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: nnshark: Set missing PV
- Commit SHA: dd71cd480cef2a081b1383e05fd290c01d04ad62

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




