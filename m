Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA35CCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 23:25:55 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1368.1762471553204418633
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 15:25:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=C+Hs8Zlr;
 spf=pass (domain: list.ti.com, ip: 40.107.209.60, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IU1n7i+WH8aFoCIBafBU4kOgwAHzyC56lW8gxc5wCN1j2gXpxuQdkJ5Ol7Yx4NVnHr43W/iLsRuS6kb0B9Rurpt3D227Uub2iu1JaSoUPzt677DTsCA8C+CI9jVZ2W5/qbdVc74+2aBHectwvFDs6aah5+cEbWtIAkJGTQNRPnTYkeoMLixS735XVMLH8bD4y2BvYNGlHqbz7dwL5cH//x0UQQ5KsVWahJGfUqECZ2J7y82qifbWCpGDVEODWt5xk3/9Dz+JlmeQG+RoxPL49uzvo9dY8uugZ5y2AhMW15u4nT/DQEWGamw+FwevPNEsKlHzrxXANlPxERCP7PEFug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5RZT2OM2LlmMaeq92agQyNxy9pA1klBas9lZQ5TFXk=;
 b=p6VYrbEz0nsUp7J3I1OMt+v8M8DWqZ/JKrPX5YsmN8wE51jAeoBedG2q1JTRQStQyVTrIe52pYEqkEkCRtVtym20Zbt22cbEi/e74fc5WXO7Mpi/SQHJYn9SKQCJmfjdqpgDkuRLTeAYdnCSesv0VF/xVKjHGiIoyCHxeUT6vuMzDPFE1dkFXx9gUrKXgyWHIjGM29diyDoEDtug3Lb+SU1Qci/Udm/mUw/+KAWnF70pAySk+4t64w8wMYc1gtigPWoeVz0psY7h7M+NgaWajdlTuMCPMCcitq3xpeV1M+JL1ESvsJH9ZZu80JDbRRJXn7nM2lqdnm81G8dR5XYg+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5RZT2OM2LlmMaeq92agQyNxy9pA1klBas9lZQ5TFXk=;
 b=C+Hs8ZlrUt02MECURBSK748HOJ/R1sxZbTrcmq9DIFOSg3pU5UsDkcrZ1bUYnUKvIAInw5kHkxsjVRFX3PTs71dK2VaWSbszisO6HqpFiZggrUcqcViVvE1IS5K0QjjD6qkj9d0A++LKgHc/bZeB9KbCABj5jJTveKoJz5rCO1WJ/jCJQY8AMuJ13MiCji/NgrVDEeWVMWGVRPLgAw1g1z3xA8JPWqEjLkAG7iuCy7ZSg42YmtSX7Yd4Cv3+FFK/gzRRjNQuOjR27+e9QEzTM6YuHNRGsubMXWTwqwUBVv3kjBt0EYfmbH62pEeA7P0wy1hV1IS4/Vwsr16846JVsQ==
Received: from PH8PR07CA0032.namprd07.prod.outlook.com (2603:10b6:510:2cf::6)
 by CO1PR10MB4802.namprd10.prod.outlook.com (2603:10b6:303:94::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 23:25:51 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::79) by PH8PR07CA0032.outlook.office365.com
 (2603:10b6:510:2cf::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 23:25:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 23:25:49 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 17:25:46 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 17:25:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 6 Nov 2025 17:25:46 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A6NPkfY2025229;
	Thu, 6 Nov 2025 17:25:46 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0FBF29ACF4; Thu,  6 Nov 2025 17:25:46 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Randolph Sapp <rs@ti.com>
CC: <reatmon@ti.com>, <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] emptty-conf: remove extra "-conf" strings
Date: Thu, 6 Nov 2025 17:25:46 -0600
Message-ID: <20251106232546.1325559-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251106232339.628461-2-rs@ti.com>
References: <20251106232339.628461-2-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|CO1PR10MB4802:EE_
X-MS-Office365-Filtering-Correlation-Id: a7bf72f2-66e8-4723-74cb-08de1d8bd212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014|34020700016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FqOynpv3PUwzQuNgVPs2j7XsTULOLvj69QNTMCnnswmriMTKPYJPH2rcoE9+?=
 =?us-ascii?Q?w76owNVJ0NMXtUnH/usboreko488CLLHVoYLAww+mCzc+rQ3iw7DWaTOZVHD?=
 =?us-ascii?Q?/ORZkoAbpdT8v2aDCJjrq7qqg3846sEODTrwT1zC+hFC1PiKoXqlwWynIVn7?=
 =?us-ascii?Q?t3ZmrpLadsuCEqIk4lJlRJrNSbFR4PI/RvUxzO8a+iZ+lRFlgalK6jScN5LI?=
 =?us-ascii?Q?8nYAEOptsRVk78gJIJB/Bz7C3L+tvPyhPp4l3WiavLtwchdRRt5w84GY0RC5?=
 =?us-ascii?Q?BkegwBic8D66m37cqAouvguZP5dotQAAjbFlxYWpGwxHWeOvVuXerVyaxaJw?=
 =?us-ascii?Q?nIPsMcakDu2HpQRUuz+PWbVN7fBlpUWNySI4kTF7RT1nIXDZ4uFuSxjlevDc?=
 =?us-ascii?Q?Vj2oEUlFoC1xn9bFtzZKbsAvl7ROt6phTYxgle/aZDUxBPkyfl+b5o+gPoyt?=
 =?us-ascii?Q?HuCe7AUMpJd+jr2b2a125APAvOuBmdsAIwAV246Sxb9hLXt6ugsrj9fvmnHw?=
 =?us-ascii?Q?1ZwEd/9eX5WHQ4a2MsU/xGH8oV3J5+aHMiyfDu+HcN1TuHQj0ngrovqGKNuY?=
 =?us-ascii?Q?H9wZdU8ndnbd9zcUDgzBcXEKTcMTafaTIdgeWMTBLRPVBt/CGIZrUusB31yZ?=
 =?us-ascii?Q?230N2CsV4LI+oFEbRnVX77itvWKgaXenDcIpvW8tbaBITrWkDmr2f6xAeiy1?=
 =?us-ascii?Q?0cNgjogFsWLVymTw5uZqpYnpvURWThEgr7tssXXO/ZidFPm37KOlhodSRvPq?=
 =?us-ascii?Q?I1/ORW/z4QBW2R7FY2lQi4awufm3NRmypcJ06oEZAgu82H0AXlQEjvrvKN7X?=
 =?us-ascii?Q?fXvluOrHeya3MvmetMa/PWUcJYkf8hKDN5oLO2C69tx9l/5ox8yNb9AizTCY?=
 =?us-ascii?Q?7LLu2CC3HaAL7jJRNSrwEEFokLmg2SuC9lGucgwdF0j3N4Ees8DDyKI6f5VJ?=
 =?us-ascii?Q?NWGLa3sYpxuavT8Mf5h64VSoV5pSf5J22z+4UFe+k6sm0dSAI8Q5sbLHTG57?=
 =?us-ascii?Q?gs9FkoYJRq1PM+E6lkCUcCKQugfq0bjNZpRNIn+TPh58I2V9TJ8UX//EiK82?=
 =?us-ascii?Q?YL7vZ+C/kPgL8vCfH+BCwwoyRW4VOCu3/1TxtnmrZ9AEvDi7gLxDbZ/0KrEW?=
 =?us-ascii?Q?p22fnNkPxKLq6z58H59xsV+OMbTGrQRGyA199QRkhLt3j9pBD2tKLGJICOk+?=
 =?us-ascii?Q?qK/YWwY2hu3oqY1LxiTfi7ANqmra96xJnxv2Uj8B2J8T0VN4eZbIopBqfzvG?=
 =?us-ascii?Q?XBqn0yh+vbQmI/eP0SzCQsTBMC0y5jsXrpfzM+k6gSdYRSaMKUqX/PKZsiV1?=
 =?us-ascii?Q?CFly6BwlVeZfQnXwdcBH6Dy72PyIFf3ktAWJRtsf3uBL3zXsYspKF6UdHH78?=
 =?us-ascii?Q?VaAVfpBBA0gN7oV82uHnzaeINVIfSys/nMuQZXhjG+KWnf+RXKHu3jPND2/7?=
 =?us-ascii?Q?70HPMlDgP4ELZ+biUFjnDHKYa8jrfOf3Z7fdlsrrhu0SJhjbUywnvst7L97u?=
 =?us-ascii?Q?CXCwnF8Cx9U1Ln0wZNcquVcJ99HgzMMjFcjlyQdyAy7WrjmyjesRg1aBAAK7?=
 =?us-ascii?Q?wLkOSSG7JZvB2cY2kDI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 23:25:49.4565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7bf72f2-66e8-4723-74cb-08de1d8bd212
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4802
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Nov 2025 23:25:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16727

meta-arago / na / 20251106232339.628461-2-rs

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
- Patch Series: [meta-arago][scarthgap][PATCH] emptty-conf: remove extra "-=
conf" strings
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Thu, 6 Nov 2025 17:23:40 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 3343f0076a32a98375f09434e5eb67de8=
4a332d7

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202511061511
- Commit SHA: d02ab05da3b6fcb24387237d36c2390159c8862d

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




