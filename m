Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BD0F428CE
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 19:49:51 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3948.1776282587506676406
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 15 Apr 2026 12:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=jPLW9khE;
 spf=pass (domain: list.ti.com, ip: 40.93.201.67, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4REVvKLQioLIS245/HOL8g/qJthCVv8w0ge8djd/dlodPAvo0YusYDUcOTH351qNexN1iVDfvXnMCgQQvaCiBfCqJCgziV0uulgP8fTEAAF8FkA9DZ2B9zyT5Azhl/KymiRS0gmZZEvcBM3ncTH0dXLFqgri7BzT5CVc5fQKobz7N4MsD2NGt616miGVs3TXtIfChN311YzGbQDLgNJVjh1uAl8W8W/lQEFuc79GKxryCrKdz8lkTno+WfRdiaPPQmGdQ3sswy4uKjQXRnLYBD6Y1pcng9uBTztqajk7eIScsEzMR0bTmLOw2VvJ3WUgX999TN+nOB6h3lQu3KpeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/VyRGGy2EEx7tt0ya0U5S3qGInPsWy1xE9wrGwbdak=;
 b=lQRSsLhimYSvVmpoOmVPBgOcWeu3DX0ox1b2e9sYLr8ffcn5Km7IPOBcSdE1LaLRlxTYFNAVLs1K964wD4uMmtuQ6jB6cJ0wjh74OtEWRDp3b3xtT2b8gMtx3oYFdG6A3bJHVpdG4tXt2hhNOOyF8AKRquLCjAnvaYpMlxLvXQLGuOAX1XiafDrdFvT3yboizK0c/yPx7k73PUAAe13w1QoUu/V9g6MkDTZbImQAF6O/NlR+8XbWI+pA+Opwy2CJYuPuyh7TTxpu0fu1+hJ3XtolN6KTtVukYLgllFjz3saQeS8lZ5QYQABKtbhF0XtMcvPCIcbFm3SqNaxCh68/zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/VyRGGy2EEx7tt0ya0U5S3qGInPsWy1xE9wrGwbdak=;
 b=jPLW9khEumQ9AcnxtwKbGMq4O494WXmdsFXCZ3a1oY9Ul8VH1lMuMs7fpSUfpVIIDeGOfIqHZTj4VmSTHxax1TVTxXh4VmyqmED17K9xUjDAtkeMLpVkGsBf0oMdkzYrIGYvBAKVcge3Y5RYu2wnbi4l6F2k0WVyniutqlEvtnsCQdAH0j3vc+xOxuUPHoD3rW2EYYkgrz/KYrRtIGogv0xpeQ5eNpK7PANCMsr7ZUtyll/hJaKowIrHFW1+9I+XmonqS24N0HkHGb08YypqZUEF57AyYvZTYmVuqcqQbI4QqtLEHMHGNGx7P8mTQyGW2jQeljpmzVSzki5eCInH6A==
Received: from MN0P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::20)
 by MN0PR10MB5935.namprd10.prod.outlook.com (2603:10b6:208:3cd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 19:49:44 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:208:52e:cafe::6e) by MN0P220CA0010.outlook.office365.com
 (2603:10b6:208:52e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Wed,
 15 Apr 2026 19:49:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 19:49:43 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 14:49:43 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 14:49:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Apr 2026 14:49:43 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63FJnhc52615333;
	Wed, 15 Apr 2026 14:49:43 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 1E45861D; Wed, 15 Apr 2026 14:49:43 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] ti-test: Add lldpd
Date: Wed, 15 Apr 2026 14:49:43 -0500
Message-ID: <20260415194943.1231450-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260415192418.4067820-1-reatmon@ti.com>
References: <20260415192418.4067820-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|MN0PR10MB5935:EE_
X-MS-Office365-Filtering-Correlation-Id: a848e75a-e256-47b7-8805-08de9b28241d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	STkPZhnQWvaViERiabqk5jnoRJ/91w9bvx/uDmXV2ybYwnxZkcS7tiLo2PNy3ezBJhJKuJN6ySLqifsNTCYt1kvGfwiYher2azVq3e94RoNKOXRH8ecjcnsmUJ2x1HKCF/bJt5kxMbdk+00PpyZwDOQbzEH7LDMDx834K2MFzlU/n/6AKUyyd/erIVL3MD7/jwUVdWlz3vt3VgkT8PIIETvOx2OnSCgkxfP0tY5nLhmhz8W1riuScuzqmJUvHpDAwZbAf3LCXGd2ZVBMeEbCOIRcszAFSANBKRfzTWFx5E6pUq9Fut6f+WtBAwWiarejhs1vIm6yJPir0XuVI/O3sUQkeA8sMjgw2dY8S8cEd2rA82DDp1QeGLwGl2LjlBRqU7DDvt99BZYu++1tGBDDrTMUz4maP+BpByosnppaClc8P1rebitNi4YI3dcgdouaYyhCFw898nniq0ZnRkh9Bfnlbtz73/gCxnRfkp4rH+E5ptbGEYFEZ/5iRfsEN42PsQFx4ZmMyiMHnY/Yr4ZgypPB21TwkyzDMIkIRKpNvd9ibOJkpGZSrElY3xVVHkJQQxFZvX/Oh6zbypku0HGZuZR8xzw6Z2RjFIUbxvsli/AyiZz7GMyN52Q/2LCxxYQW7OlQpdYYx+UGJsiTFYxbAvuxS1lR8Vs7AWJdmoVodbc2qzgOc25vifhpnc/fIYsLilwkna0JRbPdmQl57iO0jcL3jkWVKbqQzZkMhPOYd3wvieaH2ojIyVdceggEaSrPaa95aODe+kFps3AKMfeIPQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	GGbZYFguhctCsrQ61ktFmsUxgS4GqTjmk7I/fBpKTpPSCrDdvEXrzaKQB7n3BAZOGm16F9W+tgcq1/OalJfJux32AjifwIMJibg7xN+z//z/V5SnJBSHXtO+Khd3LIK+HT6q8gd03B/0oJ6aLJof5PZYUiLO4VLtgTnErtYUHZhPAbPK3i48TySy4bS91WAYJXmb+N6eXeA+SUl9N+5i8Su+w8W3AacDGCrgzlO1mQDs8BEc0ywyM89AlYb7twFyQSF74zmzPOkCESx1MoC0krSbrBvJLuEt05rVF6d7c4Pbh7MmvJW39DoBhzyd1TGIDZeIOs426R5AMcsOW/br9StQ0IcQrTV/MVZq9WcIjU+LTCCpQBmmFxP4AJ+ERVw0X+U224Erazp9jWkCrUMhO7hsVftDVW6flsy6SSpfCS3imFfpCuPZ9zBenUe3r75N
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 19:49:43.8910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a848e75a-e256-47b7-8805-08de9b28241d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5935
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 15 Apr 2026 19:49:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17468

meta-arago / na / 20260415192418.4067820-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] ti-test: Add lldpd
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 15 Apr 2026 14:24:18 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 422c21653aa0d2ada12fbf3be2d6a6f9f=
3718c2b

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-test: Add lldpd
- Commit SHA: a613ccf5f380fd473fb97bff069dfe58c65d3f56

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

ERROR: Multiple recipes found for coremark
    meta-openembedded/meta-oe/recipes-benchmark/coremark/coremark_git.bb
    meta-arago/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb




