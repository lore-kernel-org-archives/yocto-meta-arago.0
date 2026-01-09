Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7132CD26D9E
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 21:21:32 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20435.1767993687664765690
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 13:21:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=HiuyGvSi;
 spf=pass (domain: list.ti.com, ip: 40.93.198.63, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PRQyl0ywYPwxU8/tSLCbrSsaKddgI3Yhjej3uMpOz1EE9FCqwzm3kJpvHh1GjGdGu/DynMvKe8fjQaNg3uBuH0dZw/wT05ZbiIMZrbjn/JluecegiEdrxfPo4+8wHYarxxiOzyz4tKYUi9WkxeIfbq+KiFpbdxePuXTuCS+yz813MMOQ8CysL6GJqGNZhIMWZDMVtgFFrVL3ZrwmOVPE7pX0t0lbHyi4H3tr0zamOPl9JNPuy9y+JDdluNG9XeGKUs0BcNGd32jORfoP6O4WlP4LzPiyiBG51WTIYIrqxAtwScpAIGy5X2Xvi3c+5XaBJjmYEToN4EpDOSUVQbUVdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGD6Y7W6RSUj+K02DMyLkyHqAQINDtIyGQHNWpL2tFM=;
 b=HnJtCpFaJy3mxcq6soXLl5mD0Gs988ijR4zs44Kmdl2QV7DYLmIPuimK45lB1K236+NsTuz6cyodC8qFvtsoaemppCMmFvWRt+x4CzuPzTnHzc1XZNLSSBdsgAev5r9JXw9SHRG5jq/LP6otn3EFGemXJYEx52XrrMRnCVKN7s64kt/8/nWuUnbnO2sVrQerHrZhxd/y5u7zkSk2t0yN2Q7qMDXhgjtOW2ik+8xJaJ1iO0r/UXyF+DDmUaQe4kmA5uyOl2OfkRUWFr4ADMMFidb8TUjb3bG+dBbHuVhhkscuoQK59kXQ2SLn8nMRfXZkOSDs3rrrsP7mHcebLnfVlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGD6Y7W6RSUj+K02DMyLkyHqAQINDtIyGQHNWpL2tFM=;
 b=HiuyGvSiuZh0uqjogWR8vMP5S5Oc14KoR4L4oJZFQ/s/3UPat60zH72VWK2+uPLTfPTdxCSanmzGnZnUPwEajKcHM4MROKjTtAjqaIiB1WhrMNkMQgNtXVA5idkuB5l8DYddZ8mstzs/i+buCzC2nZ8QOU5z6VfV47QtpQybBUhqX/1krDP4rG7r+u9kDLwjeb/V18EGwSGfduVpz6EKkx24gaciRO9PPG6rfFr315LSi/lK5/9Jb8DLMkSLXygk27Vhwg5EuTwR4W1jtMnPWLw8HENlHlW1uuFBA9nWYOVfq2Hz3GDjN8hLyFkgZ9sckvz+ojBrjoTN30K+6D2RzA==
Received: from BYAPR03CA0008.namprd03.prod.outlook.com (2603:10b6:a02:a8::21)
 by CO1PR10MB4547.namprd10.prod.outlook.com (2603:10b6:303:96::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 21:21:22 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a02:a8:cafe::bb) by BYAPR03CA0008.outlook.office365.com
 (2603:10b6:a02:a8::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 21:21:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 21:21:22 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 15:21:17 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 15:21:17 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 15:21:17 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 609LLHDO675065;
	Fri, 9 Jan 2026 15:21:17 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 220D29ACF4; Fri,  9 Jan 2026 15:21:17 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] ltp-ddt: Version bump to 20250930
Date: Fri, 9 Jan 2026 15:21:17 -0600
Message-ID: <20260109212117.611638-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260109210347.502225-1-reatmon@ti.com>
References: <20260109210347.502225-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|CO1PR10MB4547:EE_
X-MS-Office365-Filtering-Correlation-Id: 53680138-b85e-4e6d-9117-08de4fc50999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|34020700016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/zigS9YWBVuVbfReH7drjeJsHmFKPxa2JdlFbinZDA64jLU+5Oby1Qx7I3Nr?=
 =?us-ascii?Q?U5ZYw91h3fKMOThN2PqBCP8Csn7iR+sRgDnynUnOdfObPka5qxqjUYaFDOQq?=
 =?us-ascii?Q?YCNG5/ocR9TcsCBov+hMRSlFRvCsho00KFPnyAemAAXE7VZ4NQkzpYKSN9M/?=
 =?us-ascii?Q?owIGyw/UlcYkP+5quR9otcZdAG7Enw81Tcd9JvHiFQm45z23MotOBDT6e8Zi?=
 =?us-ascii?Q?eyc/JGEnlKLu9K8NEK/n9cGJJUty5qVTSZ6GWpAvDjYbxBFbQKzsTx23Y80/?=
 =?us-ascii?Q?n6W5i/4dAj7OMnIzEQ2bOHiPWjh/xjy33tQ7BfOZrRufYCylwf29IOQ08YDl?=
 =?us-ascii?Q?Y9rgsLoqw5ZdIYsSvDuaxegtokkZcGkVSesCVHK2LZ4N0S+KkNXy/DdYIU9R?=
 =?us-ascii?Q?yZcuJXbvyRA6PyseT3ME4TPB2x4PbW+zpusdHYy5oGltNtOS8VnhXwqfX48S?=
 =?us-ascii?Q?3+gsNqBuHBPLWx0Cxcxq2xD03puEGssp+hrWnkNAl7BnK5/Z86f6sYPCKIjO?=
 =?us-ascii?Q?bxTzxALZ4imwrBAhSFpo3Y3ErXd/WL3QqOUyCRwd/mxnP20101+oecht0dkb?=
 =?us-ascii?Q?AECBaC3LvFjNU5BjilgwSJwkjRe1q/ZZ3zD+cJfb9kC3eeXel56PiWlbrck1?=
 =?us-ascii?Q?iFUdMoQLhx/K/i5dSMiWBPiY3Pme8WQTpvRbOIM1mMUgNXy8zIHyC9saNN0h?=
 =?us-ascii?Q?eo/E9CY/UOmIKXGStJn8ov5I8dIFx4mO/gK/NYvdWvW1lwYryzO1RYJtEk/R?=
 =?us-ascii?Q?Y0872EggnNtRSHLSyPnTLgi5R1fB3Gs75FRWoUcGmO9uKozHcFVNvYhouahm?=
 =?us-ascii?Q?DndY7XIGL7icVC//Q6h4yP2DH8fXD3LwvFywktLA2qMAkEHNf43Rn+rHVcJD?=
 =?us-ascii?Q?9n7kLigm2owlOSMl2NPJn0iPPCHppJ9UMJ4bSflpw4FUvVCmQkhsGNSrBH8t?=
 =?us-ascii?Q?0um6ia2nvJQLnXZmhHXsCQDeGVUYVKk6tfw3ncuAjLVHQ7xbnFlOhdiEHmWK?=
 =?us-ascii?Q?P5bPtj3II6SbR+Ojl4s4AhiCpK5QMYfA2LlkhGC7CqotVZHLgkE1b7F++oRS?=
 =?us-ascii?Q?N0TWww8fav350Rgd3H2+VNccelrB03quoDzWZqUNP2y4Q+72LRC3q5wXjdeC?=
 =?us-ascii?Q?tkhSgUIsdD0zCM0Vq/iDkvF5CBHpEa4XywnXqBXJiRzLF+3extIONo7xX3bA?=
 =?us-ascii?Q?A8xBZsaNwVQlq+4rqzZuZgFIVnKiv70RrRc7koJfm9HyNA0UlGJcTjr8esyB?=
 =?us-ascii?Q?DuEjKItrf23X2ApAfhrNnJQ/bK2WvSdaJLYliFHOjNURW/sXpy42b8nuSJg7?=
 =?us-ascii?Q?1zrw+pnU96Gz0xplxNpAOpSNXnNc3w5i+9ATa8Km23U2GVejdcRASICwpXBU?=
 =?us-ascii?Q?Oei7CD+kxvA1dbXkgLuDWvEm0ycNAm+kGomNrMNr9SpicnZmIyNntuoNHWGk?=
 =?us-ascii?Q?D+d8XgLp4qplhNiyk1GgganhEZAFcnFp1g6o9rwhj2xUvLFeOMqZUVrpz+fG?=
 =?us-ascii?Q?EC/2IRbGRi5eQ2oLVAhurLuldK6680QioVB/ti/VIulFUPfeqf1bb57SiuHb?=
 =?us-ascii?Q?3C9u8vAsK26VyzcyPWg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 21:21:22.0144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53680138-b85e-4e6d-9117-08de4fc50999
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4547
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jan 2026 21:21:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16950

meta-arago / na / 20260109210347.502225-1-reatmon

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
- Patch Series: [meta-arago][scarthgap][PATCH] ltp-ddt: Version bump to 202=
50930
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
+From: Khem Raj <raj.khem@gmail.com>
+From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
+From: Jiaying Song <jiaying.song.cn@windriver.com>
+From: Wei Gao <wegao@suse.com>
- Date: Date: Fri, 9 Jan 2026 15:03:47 -0600
+Date: Mon, 10 Jun 2024 22:52:56 -0700
+Date: Wed, 29 Jul 2020 08:47:09 -0400
+Date: Fri, 23 May 2025 15:17:49 +0800
+Date: Sun, 14 Dec 2025 02:15:20 +0000
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a535137e489dec2ba3833aef622d1f096=
cabd385

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202512181848
- Commit SHA: 1640df60b0f75722b9e5923a5bfba3767e7d97a8

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




