Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5AD0D4662F
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 21:39:12 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123.1768513144372114933
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 13:39:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=FR3a7qFh;
 spf=pass (domain: list.ti.com, ip: 52.101.61.22, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kjAiCOcrCmazs0tKE3YZPp38uBAxEm1K6Lf6FyzFIXkKBQqPCio6MBOctuAh4pzdiEDmVWleu3CoghZV4t1biqcTGwJ8a9ODk/5l6Ni1B75VF7ti5ZghNIdVlCAouPfibZ994M06s8ca1n8kvcxAbMzDiDlD7oqkVJuvlU59lTjyTbPaaO9A/VCh5BTK+WCMpc+zMRkHlwjWvSR4387kt4VcLQxikxY0TE4KjtgLipXu5aPMZ7pJFvQES+oq8B0kGBaEWYayr29VIURxsLfrD9+pQSl0T9KV4pvLWrQO8l8EvfUuTm0j7qn0w/Ar1ODWBnuuZw0PkIDQA0lag8/27w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LaoYxRjF7b1jy58Lsnnv7MuPiKKDtcI7qj+WwcqVb5E=;
 b=ObTlMMU+eI+lExm+ALUn//hU5L8o2eGZvKAv7wrjBupXaUM6EPKej6K87rBMN5RUd0q0HTCkCBqC+P5fCWPlhLjFfYPlFDd5UOtcoNj2FlTP2kn0p3+nXojTA+R6atl4NFgU6muMAkph04YZZqNVNdQI49N18AnxqdwLYrMRZ77xCzReAM+eDOeDeP/uVsSrX44FvkA87nwtjINYQlY9DI4h1B4WwzUDZ/YjaGRAx9Z9BDHnonE4USoULuA7EFLyuy8oGTAsgkkaQ/cWxhLqMQFmNGBO6DN/73Vu79YkqbVwecOhMr1HMkWZTdfl0F7jgV+zxGskdfka/yNEeRWpWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaoYxRjF7b1jy58Lsnnv7MuPiKKDtcI7qj+WwcqVb5E=;
 b=FR3a7qFh4jd8pIRLjtCccPxK52yjd4ey638SXwVdqu3Jtj1qbrGoTn/fgxtqe2ZHS8CB3LR4Y0s04PIkZLi6abShvVjjdel2ue/Y/rZ3R36+uAjO1wBPx1ITTTF7Jc37TBL+qHVWPfeeYjcAECyiVIggmIREp/Q+jjDmiyVfaYiNrmBYOq2Jp+20EyTWs4V8CkTJp078grYSJIyAQkI0vU1+vZw7WhS4WCVPfd38PAqRjlAKwCCBm/Mo/m0qc/p5gF3NYh7Bj4PgEdSIS+/6B/0dRABfz6G9FESkuB4vfkH2ak4CXPpekZN3yiRIl0E03aLwEZ53skpODQQ53A4DPQ==
Received: from BY3PR10CA0003.namprd10.prod.outlook.com (2603:10b6:a03:255::8)
 by IA3PR10MB8758.namprd10.prod.outlook.com (2603:10b6:208:579::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 21:39:01 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::a9) by BY3PR10CA0003.outlook.office365.com
 (2603:10b6:a03:255::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Thu,
 15 Jan 2026 21:38:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 21:39:00 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 15:39:00 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 15:38:59 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 15:38:59 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60FLcxqN2195767;
	Thu, 15 Jan 2026 15:38:59 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9E7CB9ACF4; Thu, 15 Jan 2026 15:38:59 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH v3] packagegroup-arago-console: Fix package names for alsa-utils-*
Date: Thu, 15 Jan 2026 15:38:59 -0600
Message-ID: <20260115213859.4057552-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260115211028.3826580-1-reatmon@ti.com>
References: <20260115211028.3826580-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|IA3PR10MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: 86944d2a-7448-45b8-74f6-08de547e7f09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|34020700016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rcbEnGEWVTCPJcYI2eXf63TsIkoQ1gi6JKUh1FwmW59due4h5eNbjcOSu+5Q?=
 =?us-ascii?Q?mxcDOTWYQfq+Chst/6Z3fr7qlEAOU5aFwvcYr/eghWxiScw2sOA5IX4az0ht?=
 =?us-ascii?Q?UMaD5eEDAxuR5uFxqA0XKAOzG0GikM99E3YG1Nqde0mMYitWkQlGgpN6MXwH?=
 =?us-ascii?Q?BTi0Ts0GaIYBGZN+XPQbeJ7zMJE3xuszAKvU+UU1xnFTgNX10r728AX95rjE?=
 =?us-ascii?Q?82m0nlMQxntCEUEJp7lEU2i2j6BwDsmUy1JvE8sOp5jc/E++bDlru+CD98IF?=
 =?us-ascii?Q?mnph9VI+LxXhXElvaobpd4jrIxY2UK+cRbnIKyNZNMe7buhRjvccsYpK/JBE?=
 =?us-ascii?Q?6Dz0nzIVy/kjV0fSSbmPGODtVSbP1DLDcZygm2+8TcKQmPpwW9JzqQDL80uG?=
 =?us-ascii?Q?CRWSsHwegIV0UmCR2RQLagloTO+drARpvNHocOX3fNhWu/bRKMBzORoQyISA?=
 =?us-ascii?Q?Bjs4Tz+LLpN9ZPptOsjrU2ZolduYjNGnsWQqi5CMlp5rvPx935J4Y4LXTwP0?=
 =?us-ascii?Q?AfE8QarMuH8YvX5cbYEfYR1X5QoOjMAfsKeASrmP9sfHWDfaG2gAJW89APO/?=
 =?us-ascii?Q?Y11lnlRis3jaUeZwfmhaIvwi+hTvn8QvrhQ18xbFGamhkFIc7MMCQM0YtDfo?=
 =?us-ascii?Q?jvXJUAyF+DPWVFIFojI3UBBZUOK4AmXglkA0z4HO3rakMONQJFlBz8C+37J0?=
 =?us-ascii?Q?lYTkATnVxqzqpef0kvxbQ8iWo46WEk2mjjpDnqqOvu5eclUEhw39dK+pxnQD?=
 =?us-ascii?Q?2UC6IhgdXYm84QvW+ioEvwT5lOPS1kowYljgmVEbr1zMaF+g5mYLmjjmSxcJ?=
 =?us-ascii?Q?9FoPcZwuIfSnZcSQnUppLK0k52ju3PLXefXVcuRnFcM9WKaAsWZNPKV3TsP2?=
 =?us-ascii?Q?xuJ3k94Uz8S05L9t7QqmdEYVCTOTIVulrTvf3sDjpsA3qXQu+37TOXAIN3ge?=
 =?us-ascii?Q?KuuWxnyvFCRiFBLq7XPxl5iWIzMLr6l++I2loC26Myvhh2t+oPTVafmevBFK?=
 =?us-ascii?Q?5SLc0JAkrysEHQ651U2VF49MVNPnHbNjFjU0shjZwdBjEKuUerk/X8Tmyhb+?=
 =?us-ascii?Q?EesSyWbwfIYLwGizcWZiZBXgiDHoQo0Gdh4bKxu5h75bebjkntcMOOSFyIYb?=
 =?us-ascii?Q?kndv7sUFy47Kjh87OOLKV7yrQhlzfMFYehdqsH1oivgnBPm6hTBeaG+vRtTj?=
 =?us-ascii?Q?KshhHhdyNbXsUWkzUJVeLy/bd5H4TROPDaV5f4XGrDpW3fEf3LXOnTx+zRd/?=
 =?us-ascii?Q?ci3F26Zz9B7r0NnxcDFF3e3pz7NGOipaXttk0j2XpbRiLef4vt6hJCrD27eX?=
 =?us-ascii?Q?BHUFfvQrpxNJ1GL93qQr4tgisuS1gRJk0Ha8BQQA4afRmZmm+LXgW75v9aLM?=
 =?us-ascii?Q?n2DrFMyPEmF1bB5fCKU5paOnI/dHHgmHS2If/XwYToubIXEcFe3wGwQvC1qM?=
 =?us-ascii?Q?BP6XBVIFCsQskJ4PwadJ5M+at8lULOwvNxsgsu3WV4BJUMdWdpJk+jW5DIFa?=
 =?us-ascii?Q?NUagzyJNb042D9nHHEVanBosArg310Ec+EAHCo7YRCuLFMKjCE4Gb9D7Z70J?=
 =?us-ascii?Q?ZaG8AZeLncil7Y/tHfGi0xrogWQ8d1FeEq0F/why9RFT657rof70Q+2i5kKe?=
 =?us-ascii?Q?6UOgNtn7DIs3x6JEkVBfK/E4pJYCwHwvR+XTpCx8bEQS?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 21:39:00.5864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86944d2a-7448-45b8-74f6-08de547e7f09
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8758
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 Jan 2026 21:39:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16960

meta-arago / na / 20260115211028.3826580-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH v3] packagegroup-arago-console: =
Fix package names for alsa-utils-*
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 15 Jan 2026 15:10:28 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: dc96e34ff617d4712a2233d887b34b195=
b574291

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: libdrm: Remove upstreamed patch
- Commit SHA: 8c190b1e4f6a53ea641ba9d6150ef873f561c706

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




