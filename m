Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FB0E7DF08
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 16:39:09 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57469.1770050341115832993
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Feb 2026 08:39:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=er0SEbhB;
 spf=pass (domain: list.ti.com, ip: 40.93.196.21, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnUG0Wb0s0/3zt5SR0a1zhpLMwC3N3FGuWyiYcK0MNMD9YjWjHqsoacsZersYvti1UcZtYftQyqn9Lrt//vH/Pz0bBQEkjVoWAGhccY5ZpGxi9FUB5Rsa4YgtfMe+SIiFMsOQ7CXcxsXXZ4wGc3SVMTWWnRNvwjjpN26p8UFQwsjNska33jK/5vqvRqOJKBGhaM0lh1HI8ua2tn8/ix98LqJJ83ZEMTDA7XZYAMwY48qkf4mpO0OyrhdcmLR5tz9q89lRKrrIwOvDeFJ3vK3wrJ/sB6RNGEfOXzCEzOQRCBaq8pbIFn9WSgUCOTyR1xKSMgHz/zDM9wdtLl1LkEUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6P9JXEfyqNbNRpQY0v98Klawy5/6eptHRpauhvyIvIk=;
 b=KpxT0RNi1x/1wMBGthJUtAT34UXi4/DzFQuMD4xZsk+9YQFoSgtcNDbPu/O/bPhfp3qNm4Jg5kdJTLJRAOsXG2UR7K9BbuVBUeutWzGrLDAudckvNuezKHy6cB0XvUzHU07OmwNjeEXIkn2Y4b2z8bduhoDrCa+CwdHvMI8zinNFjiz+FUjVixx9W4ifjHHJqHPel0sCbI6MNuN/mSNTpBiVO1HlcjO6AC04o37NbNdMY+2wim62tKWy8urTVo2TDvdVIDIFbCK3fxT7Xs9mWbZsV+hJ8PcjmMfFhchxI/Q1SqQM+lBb/uQGM1OtOXeUyYuHOWxKbNQ62MvpwgjYYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6P9JXEfyqNbNRpQY0v98Klawy5/6eptHRpauhvyIvIk=;
 b=er0SEbhBr1vAq2atYQERFG9ofREsBzoBpOO/U3Je6K4h9HClWEmFTVQw/tAIQMQXZVLBgPCE8EcIeY9cN7AWlncunfeWJsurvKaJnepjTtX7OGgugV0al1+jQEJdYh4vSw2f3jFV1r6WozmZFjzGMvyTI8z74SG9U4eMQUA2G+BnYVBSO5EwGeWywU2ODGf6gu+THAWHGaZacKcRb8iE4GwyH/av+aeSFON7ghTVsWsEoPldxHQw7huRymC+zbAdsuzirvK82Il6TqwFPpZyVLUfqvB/2tKvNyiGV90X0yOVQQHWJj82ELUjAj1FTfwEb3DMX/3hzE0KN4XgzdIydA==
Received: from SJ0PR05CA0194.namprd05.prod.outlook.com (2603:10b6:a03:330::19)
 by SA1PR10MB997737.namprd10.prod.outlook.com (2603:10b6:806:4bd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 16:38:59 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::cf) by SJ0PR05CA0194.outlook.office365.com
 (2603:10b6:a03:330::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Mon,
 2 Feb 2026 16:38:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 16:38:57 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 10:38:57 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 10:38:56 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 10:38:56 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 612GcuTv2478815;
	Mon, 2 Feb 2026 10:38:56 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B88A19ACF4; Mon,  2 Feb 2026 10:38:56 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] ltp-ddt: Fix reproducible build issue
Date: Mon, 2 Feb 2026 10:38:56 -0600
Message-ID: <20260202163856.1931444-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260202161704.257467-1-reatmon@ti.com>
References: <20260202161704.257467-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|SA1PR10MB997737:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c6884a0-d3dd-4692-4ce7-08de62798fdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Zugr9wztqUaDHy7KK+jKzB+eOTq33/Ora2udYAmsp/8F2hLwpQ+IzP5aDO2x?=
 =?us-ascii?Q?N9wI7+apQbv1NfUrZ8XA+puyBNvYC7Mfs1sXlnIoOjiw6mFeT+3keq30qehC?=
 =?us-ascii?Q?YiKcpZOirma1+DwplwGcCNCBAIR0Hm7/wolrFOPjdnaM3LlntjOvrK+0q8ij?=
 =?us-ascii?Q?5f9lUDLHsgKZx5DNf6ge9O4T+QFkqFM9qKdgWAeliguWLdp+moHvwgt0iv7t?=
 =?us-ascii?Q?TlRni3LLtArhAxK5v/BCC32zM0H5bFvULT0hPjLl43ErxpupSE2FcBh6Wm90?=
 =?us-ascii?Q?ENxk9m5Q/QQWbYDmfsxGwu96dhJKZqmogXuoEiuBgt93gwIWKOsnZcB1UlXT?=
 =?us-ascii?Q?XSio1ry0Ff+12hY0tX+poJlbRXBCj76P0s4m6WEBHP0ibuP+HUimQlA8CfD6?=
 =?us-ascii?Q?gTEvVkznf/ZyMWKd7JscwO94Jc7sdGNgbCRJ2fdosS5xlobQNmftZzzPWOyU?=
 =?us-ascii?Q?wX1o/pwQgfB+5rml8GH6/aeXEZd8edYRIHKHdcJfmqqV1JhhEetEcCP+7gFA?=
 =?us-ascii?Q?zJ6by1mO/gKr6cMlcQIcz/lyBLcun5er6o1HpcpVbIJ3ESbEY2Ycf0k+HSPy?=
 =?us-ascii?Q?bwQQUuzE7bUFOE+HuAyNSreGfxXHTxTupBE3C6RSYkOD3ZjUgknWHC53olY4?=
 =?us-ascii?Q?Enh063fUj4KwK+zgfpKhfC7na8BogwWyqmWlAQJpz0rjUsXJbTp1UrAM+77i?=
 =?us-ascii?Q?frb/X1NaOm5CUlspamBfplWPWeT18+BBkIzScJtyZ81rS984sJ0v8k1fJs1t?=
 =?us-ascii?Q?iSdKoUV4cE0nJfzdGAmeJ6nq4KqMJAsyZ6mG2ayME47PhAkpnxpVBE7xA7dq?=
 =?us-ascii?Q?jwXpEms+VZAd2Ag/4lNOoWlE9D9zszwmVd2Lq4ngu6gJF/p4FCnhHtKY/a6v?=
 =?us-ascii?Q?aotj5t3dbxp3mZfif2nVqMBN/DYSJYnOwx/s7xA2U2bVQH10Em2LHy22F5Jc?=
 =?us-ascii?Q?b3Y/aGTO1YgT5FTjcRqvohL4BGkw9sFnbMlYDWRrm1aLrGrW9DELYwfwWN4y?=
 =?us-ascii?Q?s2x0y5joIQBGlm+VLhNKoCJ+WtGnjWTsG22/m5f0pKkI3pblG7jbpluMV+0P?=
 =?us-ascii?Q?9UXyHFzyDnJkG05VcBpniy4CpvoYWeSsXViWzn4B9/rBKyFkeD3XtrMiFYZ2?=
 =?us-ascii?Q?qvjDIYnP3ugSymXStPmb+2nKC08ML0T8SCtvtm6xNPCuoC2yD13f9U7Th8Be?=
 =?us-ascii?Q?6V69iSrpaAxPqBvc3/qVMID8AT0lntObUjY9kW97K530zT3HA8EsKjKVAERr?=
 =?us-ascii?Q?TK6f6ETJT9kKOLNPQXjbOXjKjJMV+Vrb7cLrx/FsBXfzn2KyJOCxB/pRTHqb?=
 =?us-ascii?Q?SvV9n4Bq/2IkCGl6dNBNCe222Cs8LlYgBEloz62SfO2RDc9N0i5AO3IT0YrA?=
 =?us-ascii?Q?5QOoZrbBHYE6Bhif1lXiuSo2t24zFPY7D/+HjNoBeH9UllRZ9465OxU9ubMw?=
 =?us-ascii?Q?W58EbdZYfitcGP8STFR7yHAhVi8q53+G0yyz4PW0vsKibFrGROovkt/WHX+L?=
 =?us-ascii?Q?GV0SaeMkm9NVaO57ZRnn192QLlGz07ueXzI5QRFJbe4K2OldcRsUiFF6OyFx?=
 =?us-ascii?Q?rHQhKrXaOmidU/VvxFK76EEwl8a/w+k3UeHHPENmodA78mwIF6/PUXCnQyMH?=
 =?us-ascii?Q?vWi6EbDzrHkJDqkmPnc7RYazfSw6ZqAwKbbznX7yCfALyt3tMxKFMrHrnGos?=
 =?us-ascii?Q?ojcIQw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VSMzw4aS30xWvuCvt0BDU29xZioeIpNzJq6NnIfxTCfIrwi0xSxSxaJhuKyt/vg1Og4YRYetvmRAJnB0oVpmP0y5ssqKiXtAnoJCN3imnQB4QvkErCTqyO8JOBz1S/u+SNS9n8K33mmU5N0Z2r1+sDX/Xv1yEnk4UW90E5x/s3TRIZnVHK4C1NbCeV9vsnIqDq9QwGYUB7VTl2fIUu4idgGCDZl0U+pts2aDPeVsFF0bgkGP7DFGVooZU140Agsig2bKAEF3VvHUn0cPeHXkaFBe/Afctn1atdtVliVZdHeRR48suqjYzqrFGvdjqx0huGz1cQW7+viGYRtzkWvIZzMpHOIy1ezTzFxrOtBsB9p17pxqQG0K23v6E1RkmWdJyHB5jN+J4G/0rpeQQy28qsf+L5xyKnypq2DYyVufuW0ZC008666K5RgWPtxb/Gyl
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 16:38:57.5955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c6884a0-d3dd-4692-4ce7-08de62798fdb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997737
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 Feb 2026 16:39:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17064

meta-arago / na / 20260202161704.257467-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] ltp-ddt: Fix reproducible build=
 issue
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
+From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 2 Feb 2026 10:17:04 -0600
+Date: Mon, 2 Feb 2026 09:52:27 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e74f080800e8ad240098d8e53b7b36788=
7317073

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: shadow-securetty: Remove unneeded recipe
- Commit SHA: ec59a3b33249af3f91b45428a35bca8cd1141fc6

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




