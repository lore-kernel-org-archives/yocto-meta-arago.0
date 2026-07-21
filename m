Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50266C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 18:55:39 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30938.1784660130194930414
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 11:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=o5JAz8Q1;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=TlvIn8u6;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66LH60N53627404;
	Tue, 21 Jul 2026 13:55:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=zVNIaMJMU2yeN3tqAimmis1cmLnCvau3CILbncJYw
	QU=; b=o5JAz8Q1eDPvXH+iHTn+Mx0hpOs/yHXehswWvutDOpPreQ6ckidUGDzOb
	L4txK+w+lvUkyVxOPtYp+UhdCITKG+fhKqzu/fpXGdzeoWCBk0pkC3Z79hWcMxky
	xhWC4A57kc1e93tBgfEMIFeZBGF1Nn9lkMCK3r1/O73I7JGT1h0GoTicVi8wJfXk
	3ICQ1w1m1zMZP1cF4l4jXZm4lCDwxVyi+WYVWrt4/9ALGGOh/YWvurvRG5qoaGlR
	7K3oGUEPJfV8NWtFyCSUwm9BQcHqIrS5LCJBlk6I1J8R6mSbZemfjbLZWr03tb6/
	60FJqNrTqYKrLt3LZlXhv5z2Kw4sg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011021.outbound.protection.outlook.com [52.101.57.21])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fj869jpc6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 13:55:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kX7JEGcrtSVMtsVWuFJXBjKL5S4UFafhVoHRL987hHv055syxlvEAOq8RIj3/AO0FGU8SgUHOJ3oDE+00n06b3+v0uGJqrvMyRC+iA6mHvAqXsfjlpf3wMDpVthOvUrkcLwIVPX5e3ijYv9xNXgPMO8QdmW4hB9SSOkaC0xW5bk5xbf8nOAurEGqksSV8VTpB1T3FPIxw47ZhAIcNKi7LEwnisYcpkRaPBrtTu7pPbWAmWkwlk/4dJ4yurZVIRlhBSkF/M1dsXWvJdSSWet/7WVdBI/RGfPOqq+e7RMXYae63BWPX/ECPs0tHtv8B3BNMDSccpvIMiJxIVWMMY6ofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVNIaMJMU2yeN3tqAimmis1cmLnCvau3CILbncJYwQU=;
 b=HFEmXqYbcHXCs1aDb11iSFR4ZJYiO2+QforwaL+WCBr0HZFoblYmTpErI2SIohTBpmFy+W67gMY8HwE3tKmM2+QgTZUzPRdvHMKUC4fGtk5NH+si6fY4ZsdmeZP3woUGV2Gl45XcipHqjO3XUZ69syjE2YsMggarA/9JJiblAj7rIhRH6w6YwmQfPSmKa+cuZew2+JercPeHa3CKEuguMvFJ7E6x3LK9g7oYZhSREG3qcqeSy9O2JsBYVfguIp58FlIM/SVyF5AWzSX1rFWxXlI6I7x3v7BLBv+0juPKOok0YEgUSiN+ZS0Czz/08krisvboVKbTFXrFgUKEl3QC1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVNIaMJMU2yeN3tqAimmis1cmLnCvau3CILbncJYwQU=;
 b=TlvIn8u6Y4Z9FEMUJHTP+06TMklIk+YiETyYCLY0MtfCMiXrkzbdS5dDzvvFawp3RqVIX2JGz2czSttRId0X7yyTyr3V644MDyUj14zvsTVQhSegh/xfmN1DJVeuAdLB8qJIxVYwIoRycO6+kAjIhuqK1tOiCpTyCaU9n85nrhi+fL+WYNMhW2FaLof/iQetXAUY6JaG7GYdxpucow0ITr8l5e2EmCCg/x1M7RQjwk5rJFLegq8qtm7yiJnHGK1j+XpvSt6daAVV4UqcRVMMYXXNi1uhRXvhdg4Gu5jyT7bvMo8Rh0LCVUY5PbgZDChtL0EtziMLdKmmnOTh/nn6kg==
Received: from BL1P221CA0042.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::7)
 by IA0PR10MB7603.namprd10.prod.outlook.com (2603:10b6:208:485::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 18:55:25 +0000
Received: from BN3PEPF0000B06A.namprd21.prod.outlook.com
 (2603:10b6:208:5b5:cafe::a6) by BL1P221CA0042.outlook.office365.com
 (2603:10b6:208:5b5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 18:55:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B06A.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.0 via Frontend Transport; Tue, 21 Jul 2026 18:55:25 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 13:55:24 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 13:55:24 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 21 Jul 2026 13:55:24 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66LItO1q1983672;
	Tue, 21 Jul 2026 13:55:24 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 54F329ACF4; Tue, 21 Jul 2026 13:55:24 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] recipes: Convert to SPDX license strings
Date: Tue, 21 Jul 2026 13:55:24 -0500
Message-ID: <20260721185524.3744877-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260721185329.3006359-1-reatmon@ti.com>
References: <20260721185329.3006359-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06A:EE_|IA0PR10MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dc4ffa0-1632-4527-2b92-08dee759a001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|13003099007|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	MmAxoXo66acm8IvYBOMflnehYeAEcaaCEOmf2FFQT0Fm+o6H16S22SkcBDrfJy9FYmFK/W1dFfWJTrRmcZmaRJNnT0iVe8K9FvzaoHa2sELsSiPdsslQhjFc2TINc+603JHxIHyKFbMyL5u45bWSGFKhatcp5xElRgkRwmv13libm5dZxaDhb89J70/ZgPN7ALtpLe4wnfDMs3auUWGmAtObn9L0NAkpw/x9JJf5zC+LWs28Do1H/uvK1z+rznOqfjwrSljw6qEBTc2/vXKVwfpF1/kbAs25Q084M99vr2DdKQ7Y6FwsBfiW2XsfGYORZfOHEYwVESiKJN1raobsapLdorVZMlS/nydKlGsWRg6LJ5IxnemqpJOTJce6fmdr9nyi+MliSuiY22+vCmjN5nkQ3yKrhhQzBuF+XRsEVJTGMflrSafoj5/v0NsPkvUJRwP+n144KgoNthifFv6+BdhteAHxyCB4kDnfulkDr0WlO56VRZDBnXgQyfbv/cE4ACowh1eBuOOdA9puGivOvQOw7DEWaSAieNd6M3RfyZNW3xQt6qPApsXPsElTLhg46NNwqoBxRXqfqqFLldug6TsdmHW00MQObY7wt3l69iJTRAZ7f0KOdYh4YArdBQtgMp1ksLJokFcbZaUNgZqGFnKvkLnOLW5V9sjWeJCs0urQr8c8EEKPBHVTSuYvhv6x+UdYDkEFoSiu4ZEPlsR8Sw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(13003099007)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	10Ay4t0AW9mmgY2EGhlIXm9Bm6VWexm+klRbQLLKOssYeNnWL0YY91WgTVgLew9npzcPaJ+AoyKo7FON4308ERn76KjHydT4NnEeJw8ibnJsoGDW1zidyjpyCC0QxsrbqNAXa6fEQxuh91IUrtdv5XjXKSf0X6FrSR5oyUdfUlASIsgLSQDUPG19dqXqVlwt62whUtNMl556gQ+WuxPxzoVGpNCZwpHa4gSu7bspXKa4LRwR/fnu6MBzQFXxvRtyyjzTbR1EUhMV9Lfh8ywQfuKdBfakQM72gz27JM0hlYOsYprKmIxkbx/Dp90+03l2L3sGODMNsHdfm9EcpN5DhBC6iGJJoNaPPjlZvm1qO7jZK3UfRf1nXbg3r+h6STShrW3k/QMuTmJPBT4/sdLqpx9R+WM5B5Vm5AGZVMUcjy//FtUZ2UqX+ZnbosKeDpKv
X-Exchange-RoutingPolicyChecked: 
	fhuRreahuY9MiN5MIC/nZh0l5ObF5KAVhicl7crHySbqiGru9z/5p6s9a/DvAH96AYAd7fKmVl6dvoN21MB8OqWBERlgCIl9obO/NahLs/M0hfWX4Z7MsDg/p7ZwGHiynS3rWWEXc2LeaVX3OPOZJMZlGnj8tiP9zuyAzDHlJ9nbV3FAK3b/R9+tzng45ZuLZmn8Dj/h7OQG/SwHuOC8PvsDhkoIvlMrJpp35Zgude1eExFsPIKCmcuJFWCkE/UQTbNd4Yykzkjil+CmbYAiFxVnd5O8rc4sRRwkJfKVysWk6QBrYf3kUMrHAhOH/a21hlF5pyfIu1YySMG96Qu5RA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 18:55:25.4562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc4ffa0-1632-4527-2b92-08dee759a001
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7603
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5OSBTYWx0ZWRfXyIH5H1DZ+qmE
 fyiQYysqhFFwBQ3PIabNmo58F8F9ialGw0eOwRi7GA1+bNcuj/YuwMF5lYjOlk6czJnC3C2jERH
 52M1EQmQdT5W/iLnYpMfReyNipZ209ltEG7ckBPYpcWuIe/c1L/+heNWFZVfNDRS/jDWEie2qxg
 JlmWUoHdPMveMgoPAPpmXlVrbpfrA8g9Aqd5ZteJZwLr4fiDxsGmPvoT9IUQDQGsI7YU34vru2w
 30PRTFCZXX6l76zXX/Q+EgenLs4rhYRwrSynOkGSbVzDO67vEyRK1SsbGKZ13j3U6Iws2pSHOjs
 A1OIZbK6sEyTlHBUwHjdcRS9dWhStepP7qiHgYl2Ps2uD/QC2qzonMHa528QK3bF3qLK1H5QShB
 bPJtyvIWBIVB3geCwbOl1X1wpXDi1nbmqqO7B/vqEGgplqCcoZyuwdHcCiGE9/V3x63V/aPPx5o
 Yfpwefp1H8848Xd22jQ==
X-Authority-Analysis: v=2.4 cv=WbI8rUhX c=1 sm=1 tr=0 ts=6a5fc0a0 cx=c_pps
 a=UGDxSQ6JIm3CXF+tY3HRSA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8 a=9N0LWyPMKQHeskBcyUYA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: daDcR9226Lh8PNaJPLHlSsw3luGRGP0U
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5OSBTYWx0ZWRfXwOmeAGt3EwAl
 +uGLJgBJVhAMHvknB6c/7Cjky27V7PzeFk8ioqIp1zc1c6tzAqLJ0l6ygxFyzeFRxTbaR18Qypb
 WmZXHbYIC/ehTul/rAK9CvckyeaMZTo=
X-Proofpoint-GUID: daDcR9226Lh8PNaJPLHlSsw3luGRGP0U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210199
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jul 2026 18:55:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17589

meta-arago / na / 20260721185329.3006359-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH] recipes: Convert to SPDX license strings
    WARN: Commit message does not include file/recipe name: recipes: Convert to SPDX license strings. (COMMIT-MESSAGE-2)
        patch
    
    ERROR: Missing License-Update for change in LICENSE. (LICENSE-UPDATE-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




