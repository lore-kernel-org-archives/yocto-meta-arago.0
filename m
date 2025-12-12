Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0902D43366
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 01:52:50 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3175.1765504369825816495
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 17:52:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=GBooD94o;
 spf=pass (domain: list.ti.com, ip: 40.93.194.70, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5vfs/9sJns3Tg4scnkkCpSMlJIhg//M9pePE+7t2/qS9VJ1a3ZJeGxkApz3eqXCDcgPLs/IVaz64VnNbNSls5Ko3vvh6JKFqtVFWR2rGc/G03LN/0sI8Rmvgc0vOgFqe2WwKw0jBeASQKxulM+4+tsTKPpSBO15gGz/W0fmxXZpH9HG4264I64TNDoBCVheqYA1T3IpIatzurOrOW8XYujztXJCDIKwXz/j7F8tsXUo2dQOfkh98ivHfNA8Kw+/4ubSNdncWUUutBxkWHCtai7GWVV0iLbOcLD8sd+R6adcD5ePVc50wRxMw7d4sXFuMwgCefSqBhszAcuBA+QqMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=laP8oJGf+8sl6feUBdB3Lyf9n4sFjnIcDR9nAjUretE=;
 b=PuqjDz5mJXYaDWhv5jCkuEG7KK4vAvReJk3HNM9qc97UOpVB6IYe4bMZkbu+4Hc9BWiQNysZhlZechhUZK3H+2EsVXn08Fuvfp7mQhmwkdBn5dH34+pR0srtUA5XEWF9zbN700H7hvdvdpv6bylp4wud4rdrTJd143HzBhnRvMiJZQHWLPzdVfRTogfcca/Y+5zSE/AARjGUrVV2nGeohEHPcy9HkazOSMlyUVFvJjgiT+1Lb+c7XVo5dQ0jSlu/6JdOKOCdGaKcgxnPM8kP2IYf4FPK+fx/woLhK/Q3lRHWqm5xQqlM51h/CtPWAbbgcNmof6MxxzYnfsCGHz4qEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laP8oJGf+8sl6feUBdB3Lyf9n4sFjnIcDR9nAjUretE=;
 b=GBooD94o/nwvABgoI745ohbU1DNdPOx92jHWLEa8vBrMvBmvLZg0msp1TCly+VvpnRNQ5gJTxX3y6Or6aqh9sf7sSyRkiLC1enJyHHZ+BKJDEDHf0u7NKg5LzMqCc131qxYEIMJLD9fooYeDh64bADjtivR7al7OoC+PiH2qLSG0BwoMx7B0yrmBqNAT8qAhcul0ya7Nzdkkj1xjvB+7MvfxRQA6QMppWMZmTve1tWHddncZ98TXxIJRy6Exm1jKQgGMltQHWinggx6jc2Ai+4NuHImW3WgTgQYsXf5J2xf503bBPzp807xebv/T1XgIYx9hGHcZjNnCc2oet5rc7g==
Received: from BYAPR05CA0072.namprd05.prod.outlook.com (2603:10b6:a03:74::49)
 by IA1PR10MB5995.namprd10.prod.outlook.com (2603:10b6:208:3ed::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 01:52:45 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:a03:74:cafe::a8) by BYAPR05CA0072.outlook.office365.com
 (2603:10b6:a03:74::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.8 via Frontend Transport; Fri,
 12 Dec 2025 01:52:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.0 via Frontend Transport; Fri, 12 Dec 2025 01:52:43 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 19:52:39 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 19:52:38 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Dec 2025 19:52:38 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BC1qcL23120737;
	Thu, 11 Dec 2025 19:52:38 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 998DC2A67; Thu, 11 Dec 2025 19:52:38 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202512111451
Date: Thu, 11 Dec 2025 19:52:38 -0600
Message-ID: <20251212015238.1862940-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|IA1PR10MB5995:EE_
X-MS-Office365-Filtering-Correlation-Id: 79bf98db-7d7f-4e66-9888-08de392123e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NU9xZl9M8Tq6ZV94MF3ZNUb9l2n2/kxAWuUcxmbx+u2Nb7o4SJvf0Z1SSmsz?=
 =?us-ascii?Q?B6QBODi4hZbC+psiXI5wSce38ZKca1ZnIqgdz3F9FwljpJaY+W6N+RIBD5+8?=
 =?us-ascii?Q?z+YBgqc2Skx716Dl5+goS8ND/7q3ARGqV/l/Z9CVmN8yTAGjjapRawM9rFYG?=
 =?us-ascii?Q?9WhBDnIcjvYffN5glcSumnsbAFSZQWTSJiq+8IXUL32gfuJBXcwDeehx5rf0?=
 =?us-ascii?Q?P1dRXITFBkypAd0YuTkjPY0RI3HJQwyze8JhMBfQE+jqeh5O+upjB2DbI1QF?=
 =?us-ascii?Q?cg5rHGe0b1b6LrXuX/8eji5Mif71L5bl36ABYZjKd3IklQrMUU6j83IFsQYt?=
 =?us-ascii?Q?t+NL8WmEbA+1CzhAkGTHJZPX8hqfjPbejubLVrQ1N0p6oc2X/aHkvjm2Azy2?=
 =?us-ascii?Q?E1macDlmwjKrfM4HSF1TGne+FZ6YClT0LHM5RLKR2CXExw94SkmbCo9jImeN?=
 =?us-ascii?Q?5zL4dzKGVS3PiEEyfU6H7CDxRqO43S85hkj378ngiK3kxjxwOhGTr1kAJEC0?=
 =?us-ascii?Q?70CbW1gw6NZcUf9zEhhAKvzKeNyoUX7DlfJbDYXGfZT3LCDS+7l6V2vNUJGh?=
 =?us-ascii?Q?BAAVjD8W1S35NXVrV/F/dq2BMzVQrkq7h5v9Y3duBzYji0NCV1E0km82WiMn?=
 =?us-ascii?Q?y4jy0gwx53hJ351+qhXNVbJGgW4hcQCsnXOTLkEKfClIqT29MIOx1jm6YWmM?=
 =?us-ascii?Q?/C/4HqZTIySFitDnZt0VsVA7uEnb8/VtmYtz++VmI/VwNGWFPkaJmseALuVD?=
 =?us-ascii?Q?xRk0hZzThr9YIbdKZAjxLtJjFA+I3AWrvyhqpzB3v/urd/wojTag9q6qaOHO?=
 =?us-ascii?Q?WAFzdPjoDz9It3Kb8C9lHPh/GlgLYZSzHCxjrrb30YOS571X4BSdOqJrBN73?=
 =?us-ascii?Q?mL2vL50s3UDi15JBuEoZPWjRpyCv/ttZoi0Cv/aNROoEsngHZlTVAZCCg7fh?=
 =?us-ascii?Q?Bd2uNiR0qFaGijHdrqeVwe2sPjeiZrn6FQyR2xqP5ukLVSw+Yd/LgSFF3PFM?=
 =?us-ascii?Q?ZfgzoN0LAFDaW8UnCRdtd8Z5ghXFmCdHFWJ237nD80JmnMQkq/BHKaHbKNO3?=
 =?us-ascii?Q?zOX3/vDQtJIKJk3q/OqkO9eAkzVxVXSG0Dia+zxynUfPpnMeGrTdWKpaIoop?=
 =?us-ascii?Q?gqS02ESYrzE84DD40dCAANwEZrNi/VOqwHE//o7M92R+sdnmzDuNqRaFURvY?=
 =?us-ascii?Q?CJIddYzFN7WKH+LgY1wmtRiXrsjF8YJPf5fwf6b3YmkfietYqfwWBKtQ2rSm?=
 =?us-ascii?Q?fCH/obilrEmcc4qZTTtfZlLScm+F/DD/J/EQGLizXxot0mEhF/pKG4ZwDLvb?=
 =?us-ascii?Q?VPwgCe+6zg2X3Jp01DkKTRHQes40EDd16fVINyzwpWxqTjI0AOeOqVe5agS7?=
 =?us-ascii?Q?AaR4YOv619ujMc1nxz+/hsYI0h8hsLV5GUNundJ0OhQKQYWBjCYEE+je1I/T?=
 =?us-ascii?Q?0apGWp0otpywzXwxY9bSK9zaGb/56jkDFjFZkKme7D99wWZAdJ7+psLlN0Fk?=
 =?us-ascii?Q?ELLt+l+HczfLin6+iHn+kYiiI9lWT33AxGUPHNdCliG5Z1pNehne98mSpFdL?=
 =?us-ascii?Q?LktCtdfgAKBGDgUILXo=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 01:52:43.1212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79bf98db-7d7f-4e66-9888-08de392123e1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5995
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 12 Dec 2025 01:52:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16889

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=3Drange&=
q=3Dd6180b2718b632cb8de3be30df98c33f9cad87a6..5c3f50a492aa9133a89ff3d678336=
74cc1018180

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index 60d5d50a..67a8e3e2 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -12,7 +12,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "d6180b2718b632cb8de3be30df98c33f9cad87a6"
+SRCREV =3D "5c3f50a492aa9133a89ff3d67833674cc1018180"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
--=20
2.43.5


