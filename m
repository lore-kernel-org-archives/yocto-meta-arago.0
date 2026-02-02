Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3840EE7FDC8
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 19:50:51 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62003.1770061847055251211
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Feb 2026 11:50:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=FK1twVk8;
 spf=pass (domain: list.ti.com, ip: 52.101.201.8, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZij0/chQTiujWOD68het8RaG0gsrTJc2od9efZ9LJlKkigzwJ9DZQ57fVgZycEF7sj70/RO0Um7rvQg7pJ/KQbAgfZtrmGzo+lwmXZ+8n1sYxVn0gbKWdFIQu7n7+1pK2uWXv6gWO+gR12jt5tSK/9XgzTbrteKDwDNoY2VorhdwF4we5c/ahCyP/HQpwVoDcaVHIgbYo5MgwMIKshn8qQpFAIGvoUT4MdTNoSoHvBt3mKoR9Q2r6NLA9ugdZ8q9f1yE3AIzT9oa6J/ADhS0Uwzb58yZHJ2ZAlj1W4i6dTuufDZ7fLWyWEiUmkUIhWIa8Gc3mL9dulmBNaCtpuuug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4C64HDDI+Jmx6Dt5czy9FmqbqKKzwobRSlKkPqcprFM=;
 b=X3QnbgrNwUGvaJlWR4d3kMlMnsC7IUIOg0TjZBE5V3pOPoefPptj+1RflIbWUO1K3PBMMWLcYu/6FqCBiqzrUHmidf8nc1w3WCGyBEKzeGb2xSkZLS8xDB7CBmlQRLtKewe8gbhyLxG/Hc9dFcZ3R+WJgNtGgVC7onM5t5EUFxs2jOL8jAbHactvpfubCpetSaqCOjcMC6U09ypGtYGzHHS/B80mCPQukZ071QOGKxW5raifn1aGfcW2JTA3cxMu0ANkiFykEHxCyZVIRaM2WilDCjFoPMtRsbPdXSMynKBwqcsxhk6z7YuS/9qrOQKDm30ljDY3GXBrdTO65f8GRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4C64HDDI+Jmx6Dt5czy9FmqbqKKzwobRSlKkPqcprFM=;
 b=FK1twVk8Vy/3P5VOwhcWYNSsg+Xon4COpFo59Y3PSG5Dq8I2gnogM0YQbf9/vsucHxhIIKabyY4H/FfH9FQVk4ksYL41yxPAVNv7q3M/TB4rkM/CVYebv/wt788zp+IdL8J10ZBN0YisRBuDGxOpmbwNy1FcqYelOjTebsaOonU0DBBp8r1F4sSNqLyXLV+SqCAtz2MazxBo2kZaCt6Pw2XEczVWXI7n9jrbk4nXGPRQ3rflG4BK5oesXldS7kF6MSPn5iXpVjYIDudZtwDloxvFH1zHyce+gAHBMRY2medoPkbOwA4k+v5VgpJ8jOvdh8IrvViFeVEvky9d2tM6fw==
Received: from SA0PR11CA0120.namprd11.prod.outlook.com (2603:10b6:806:d1::35)
 by PH0PR10MB5658.namprd10.prod.outlook.com (2603:10b6:510:fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 19:50:44 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:806:d1:cafe::95) by SA0PR11CA0120.outlook.office365.com
 (2603:10b6:806:d1::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Mon,
 2 Feb 2026 19:50:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 19:50:44 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 13:50:44 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 13:50:43 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 13:50:43 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 612Johg72709863;
	Mon, 2 Feb 2026 13:50:43 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id B05BC142E2D; Mon,  2 Feb 2026 13:50:43 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master-ltsprep.202602021018
Date: Mon, 2 Feb 2026 13:50:43 -0600
Message-ID: <20260202195043.3833650-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260202194811.1717449-1-lcpdbld@list.ti.com>
References: <20260202194811.1717449-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|PH0PR10MB5658:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bbcdca7-42ff-4239-d94a-08de62945a67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fsRSNqIkuSPZP+9lJt2UH0IxStNV1sh6/YZ3Cv4sshsAbjOnCFZXjXvU1MX8?=
 =?us-ascii?Q?1NdF0VFQF/LDDuvUQGznNdP2Nn1m+h0h8xO1pCYZV2rk1qrr4tKGRnE3gRDo?=
 =?us-ascii?Q?J1h8J9w1NQRkT/nonNcgWdgMSBrYn2CfWusYYTqA+bBhP2g4Vn1h+do1pNWz?=
 =?us-ascii?Q?O0vHAMnZRcxtXsGID++aMoAk13OZVVdfRq2lKQmDQTbogiF4eAjXRSQUDmW7?=
 =?us-ascii?Q?8gkVul0gAaltyZ+WV1CxdPW33AafqPQw3bVdBBDZsvJput7sO6wx/TdaLhma?=
 =?us-ascii?Q?praKw96V0xO3z2vs8G1ftK+rNOaxF9AWqHa7ck6fatzCusSEgPfIOiRL1oKL?=
 =?us-ascii?Q?5uq48C9le852MQo6Go8bwVbuDNCcMsZK0tZVuWM4Mg1K+GlbPDAiv3Afo+y6?=
 =?us-ascii?Q?/rqSt+5RukMa1CawIvd20nDEJOnChgHllJtLFvcpQ2otZjzVWj0mOAsMjvx0?=
 =?us-ascii?Q?9UAq8ocwrPYjni63PIgNmmhydmRKiEkkW3YlPy7kPUU0cr6cnBFbKS/5nPij?=
 =?us-ascii?Q?pKClXDumrVPx2SqhNeGv9Oewl84kdW1+tjku5xUH0/GW+3MP0nfhAuIz1QHe?=
 =?us-ascii?Q?ctzJDRXaaoTDCgW+ihX7D6MZlV3SOlIn+rSZNirgnmnTuKThU19yjU4t/uM+?=
 =?us-ascii?Q?HBgokOFEUBGNPgGA7eE6RoBjCGf8XbXs1+Er3sFqsmjN3EEUv3hV90ae2VN0?=
 =?us-ascii?Q?kcIwhQhbnu3wKeXrlyULHt1svKcfzyrgmXI5SI5x9f8KFxl9IP5bWzhOEIOy?=
 =?us-ascii?Q?OrjO1YObqCbFzyUpZkaHUNkGwJUEbcRYbhSjapV4uDm6kontstKiSbCSaIu/?=
 =?us-ascii?Q?6Xh1nqPZNJhHo+f8TYJDwuUMMhZcxAMgVZ8rsoPrMhBvnpEhqIm8f4FKayAc?=
 =?us-ascii?Q?O4k4WaHgBBHMyeN3BvkKXxIrqyXXQ8imnkPEZz7b2YgtoGsPCrsZR13vkFaQ?=
 =?us-ascii?Q?ju1V24yovgXb8WilY2PBapAsqNxJCZ9f685ZP2qYn1P3L2a3ZwKs+UMMO0Ab?=
 =?us-ascii?Q?7X02uIlRS8GTe9h4WuzUM+7Gt2J7yYMtCbP/QEjUQWiRaSJyJY028yITq6Z3?=
 =?us-ascii?Q?C8aXfCX75iK/njSSlNa1JDibrQDYqM7oxanzhbFb2cL8DVi+8HZgeE9VyM/l?=
 =?us-ascii?Q?1SSlA5MkWb19HqhecwD0m6cf10kfQ2WckPOXj04TdgHU2IYi6GekwBsKUyVx?=
 =?us-ascii?Q?+C4B9p8ER8h2vQ6ePlQMG7Lc16+ejoodRWoXglXcBIdnNj/A2aUlq9KNvgXm?=
 =?us-ascii?Q?pyorh6VKvE9lpF3J+zTsaPNA4c1r5gNpkKfNruAsdrwCatmAs+Jlgcldop9q?=
 =?us-ascii?Q?kH18KQg1xTsBMyr4KvA7J9cLQIMlhKo3M3bwGAQ/VZRg4Bk/4dPPgcOc4toN?=
 =?us-ascii?Q?lCP6r1ioK0y20rchFx695Spg8rd+AWH5yzTDQ9vMq4+tEI4CyGmSgdtJyhmL?=
 =?us-ascii?Q?GcQjpz7GWObspkxae/HKCMkRA1QyozFCetfL1zzUzPzDiXFSow19ZJRUL8x4?=
 =?us-ascii?Q?neW2vHSRQKvBW8U//O2rJsmgc6aUdUoISE8xII+W+kOjcvLGlSejdNQI0Ogq?=
 =?us-ascii?Q?x9KBYJDknviDFeDS2j7BxXWLHSBoP30arFZ/4VF6/UEqzGCZRDX7UV4LAeKQ?=
 =?us-ascii?Q?NsUPSJ9oLOMLSJ+lG7gFXL9J7nJCDrUPYUAmpEaiKHTScVG/QkkxplM7vSXJ?=
 =?us-ascii?Q?yUxP1A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	QpZgV3RLXqO5aqgURYy/Uag9sGrkp3u12ty+/8TlRZ803vAPB+pLSfpGNAsR7wcBQ7xof+Ga7GcbuId9p8ap8wvcMjrSUy+WjZJbsCBFzCmU5/g4rkXIdR/ZiYK6nd5qwGRH780tGDuRYVyy6Eh5wPNlHKYKMAbrPTHM2AUqAGbvhol4tRvxOtdfz+RBEvHiH5vq7M36r5t0JLmBu69Ru0uj2DeAsrrpTjuvVS1ny+ZzT9lCHmKR680MWShm54DY0VBzUg1xnt3luqrk5b7+g+H/t/PnFqPtY48g6ZdZtObT25nbCauZwySmFIGVMU0fuzSME1ojOV5DcSrxKAXT571Ef10GduHAa0IQ9aRXhNZi9BSwb2gHCmukweEqzrfaogGotq4058PJ2ikgo/jkf71BE78mMN2rqVOVp8tzKqwEXcmkk1UyNJbXLNPrNATo
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 19:50:44.3956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bbcdca7-42ff-4239-d94a-08de62945a67
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5658
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 Feb 2026 19:50:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17066

meta-arago / na / 20260202194811.1717449-1-lcpdbld

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
- Patch Series: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master-=
ltsprep.202602021018
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Mon, 2 Feb 2026 13:48:11 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ffb5a9f3855cb07375eafa266a8d0d299=
6642eb0

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602021018
- Commit SHA: 9dcf888bbe0d83aa2353c65832c67cbedce028c0

Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master-ltsprep.2=
02602021018
    error: patch failed: meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_2=
0250930.bb:11
    error: meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb: pa=
tch does not apply
    Applying: CI/CD Auto-Merger: cicd.master-ltsprep.202602021018
    Patch failed at 0001 CI/CD Auto-Merger: cicd.master-ltsprep.20260202101=
8




