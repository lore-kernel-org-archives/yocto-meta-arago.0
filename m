Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3851FF99344
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 08:18:59 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14903.1776932330111096602
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 01:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=sEgZdx3C;
 spf=pass (domain: list.ti.com, ip: 40.107.201.29, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGdnzB7zIPbPTXz6pIv0uViVagMPoInn03DjzxbAj/qjJaD1GU81A+3bA466ZsIXItwAE50WlAuh6/lizbV4OmaU1KqgA2YlA0Ohr3LwFrfpWXn4Dqm6bcbmJC7H9hln1IkiJsita+JzHgomA2WLXGZI6wWbsjWLRGxILYZvWv/De6KKWWRBNlRgWh/CDJWE+1wtabK3l8YkoxNzJxEpnJf9BcFr/qwKNLPRMal06YtMCdi0jykXBwIK7OUguWmPVQlpabB55bv3azmJms6DCvYyYeEUrqwWzMKDXcfxdhdZJXOAQ2qziTY5JlW6ziVuC/GULWyRt6TY8ZIwwz5ObA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfZiXNUgUaW5APxzDJw+Qrwmek82MaVUehGwVLHg21I=;
 b=q5mzSAGZ4aaMWA4AEzEO56GG54lL7/yHVZTC3CWjqgCgR3pHpP0wwA855RtYrGMy9gohc7H7dSmVBpey7p9eB8/8/MSBf8qzrqbE8qVkhF/wNNCoI5YrJUAj7Gj2QrL5FbzxX3GMm3nSiSF+vaWEjDnJ/ABdxs5Ro4QBPtPavxaRhvhkp16oDs+Zf/qCe8uqrrGsCX4jzFsdBlFtb8vXxxbEDZE9cQQMYtrUZIZ1xWYGaF3MNTh5Q1F41o6BioP7zDJHDyrm0Pjhyhl3mdhJt5JdpiMUTFDkEZloPZCLM6vOCcqVTuuu8ulBWcQTmzIXBBfkdWhkcv2Y2T72F6YWvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfZiXNUgUaW5APxzDJw+Qrwmek82MaVUehGwVLHg21I=;
 b=sEgZdx3COLXxSH32+xdzZpf6MtUs96CNFsXyVzxAl6bu0ReIFO0sWB5kvRGZ3zW/qwz1mJ+AVtnVegp2QWOzqmc70xa7ZAxP8InPdhM53v8D/OfrRZmoMFXAszdbiC7oK13JcDj3eIVe/sDqgqyRPE5Q9p5MM5vufiuqhsYmXtvtiHxBfYQ4VolR3iWcysAJAgKQuto75OgWHcA433Jb2ePvjqlj1AeX+N7ISle60UOav4pWhWAGAD4yGMQTasmlzwHbnliWG/eKFHr1iKN1fZvjcJIUllxA6cBCMHtPK8JBsGh7h3fnQ+wiUuQs8Km9Jntio8xXGfaYUpJdTelrug==
Received: from SA0PR11CA0094.namprd11.prod.outlook.com (2603:10b6:806:d1::9)
 by CO6PR10MB5588.namprd10.prod.outlook.com (2603:10b6:303:147::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 08:18:47 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:d1:cafe::50) by SA0PR11CA0094.outlook.office365.com
 (2603:10b6:806:d1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Thu,
 23 Apr 2026 08:18:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 08:18:45 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 03:18:36 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 03:18:35 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Apr 2026 03:18:35 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63N8IZup1338845;
	Thu, 23 Apr 2026 03:18:35 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D14FA9ACF4; Thu, 23 Apr 2026 03:18:35 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Pratham Deshmukh <p-deshmukh@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <c-shilwant@ti.com>,
	<denys@ti.com>, <v-singh1@ti.com>
Subject: Re: [meta-arago][master][PATCH 0/1] Fix TensorFlow Lite development file packaging issues
Date: Thu, 23 Apr 2026 03:18:35 -0500
Message-ID: <20260423081835.2349388-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260423075408.1886225-1-p-deshmukh@ti.com>
References: <20260423075408.1886225-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|CO6PR10MB5588:EE_
X-MS-Office365-Filtering-Correlation-Id: ce23a894-9fbd-4208-2e25-08dea110f033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	PB/fVotQy2YLOyePKKYygqK/N3K/LlsNrp1334z9k6wQZmyfG1UhgHw6KSbnTffIVcHx893iQ//OzzZah1s2XpQ6MFWcYkvrW0CK8XEisGy/lWxW6J460kvFSCxZA7ib/7nGw8oEBPCC95+ctmWHGTwD0L/aSI2Xvrdr/wJ/ysPPiy/J87pZ07IBYIwGwHMw8NqbsSDzfYhi4VYfA5neXM9dQLzH9Q80qUm7YhXDwc8slHsIqrrdBkhyJ3Op5V0v9oUC14JgAApX2MHDh25YXEp2ylZ9hc50JkNydqW7Jp+87xIAPoVO1cDGRWwJPD8wTu1ryMrjdAVF6ZNvOoqfX/cx7w6NELTlYEShW5xhoMcrJ5vbqEkSjZccvGK3FHXmHiE4u0XNIpt2JOSz/XqCh7+delpWSubxepbrcKZnmBQDJq90RO4yM/zTG9HBpLR+PJeJqdDiOXtAkVWXKkGZZEwZPwEr6fmou+g4q+wyNLIwR+EVOL2CVEAOezZYUD238oflOoh6nPmnrGp3lUUyzrw3aYl7uVJDXXAjYT5Ism3/YipfdisOUoYFd6lP+I5ci134KQBbj1VHUUqvPbcTkwTebQLTdTQEbFHiqMEaqyvsGwR4AJROlKgZB9p6LxkiFcBH2aHBOOiZxzFy7xCu6NM+6K0jkI8xPIuPmB5FQnLpPx4A42aW9Sm9ThrJV++XxO5BUfuoUyNGqeyBY10h7dOh4qbfWiKngnyAs3NU3cdxxxvO8KrU4qmvhivTrB790ZtuzM0mqlog2eutwT7keg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	soMOdyH0dfYQGgtZue5G/e2RXIHW6VtD8qoyyvr2/Aqw2iMk4gj+8xi1ZxQpM/B6kXmFkr7CPZBLyXaVLSQ116TjXU1rT4b3eivTSppa8VGvQceaFJ5Jd1Y5fwONsumRCqiWcFk4LB4nZBcgfcnNPi0UZgnsrIpldPqX++9vc54WvNX2jiu+Y6dVeZR4M+PHsLAP5ZGkZcuvgCG5Oq1s2WyWblJLewWQeCzL/6CXdZ3HB4HEG69MrBd5DSBSl7KS8bQegz4x6cAUUIFLL6fEDKBy+4FefMWJHsJsy5rM3FjU7IQVhL5l0TjM+KRM7njx1atStlvmC8bTvVGgYYFTmNcxETp4djPLv/L1T3k7PS/Y34dqRiINM2zfoJhoFHLNVE3CIfQ83v+bgfg/f74N86WOeyRYI5iLKR2XUGyG/tFNKtMIy9PEEcLMeM/3OtMk
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 08:18:45.3833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce23a894-9fbd-4208-2e25-08dea110f033
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5588
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 23 Apr 2026 08:18:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17484

meta-arago / na / 20260423075408.1886225-1-p-deshmukh

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
- Patch Series: [meta-arago][master][PATCH 0/1] Fix TensorFlow Lite develop=
ment file packaging issues
- Submitter: From: Pratham Deshmukh <p-deshmukh@ti.com>
- Date: Date: Thu, 23 Apr 2026 13:24:07 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 12e9dc2200908d3df4133f0a7820dece1=
c2c970d

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
- Commit Subject: mesa-demos: set default PREFERRED_VERSION
- Commit SHA: fa748a709b715e7c5b55eb94576ab9b2da93f8ad

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




