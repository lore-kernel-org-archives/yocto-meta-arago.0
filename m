Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA663FF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 15:41:32 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.536.1777390888417132084
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 08:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=BnpPGXvS;
 spf=pass (domain: list.ti.com, ip: 52.101.61.65, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NiOx0NQhQ84ORbsjK3VVLqdp1Wz9vvD/wy3bb/L8osgFqprmyRNJXYLkSKkrF+qBfVxqsmCLkc/b/Hjz0L7oaurhFd0kPUEY/lxVesPxia1efLAAtY332xaE6OQtJDXhM3f1Wc9UBwPl+sG5Z8wLPYnn4h+Lu9nW2cCsLacK4c7RekanDhOahf6qudHCuCoR3eta3MRz+EIYL34iAs2Epsk5bWRD/a2kRTnkOMjuKB+bR+BzHCEVEZjoFPAM1gOmI78KkWWdVdOAgLagz72WAEuoxxucgepJH6aYJQJJE6NtYw732DApKW0KoSTfMhzNa1K/nHasCyZxJimU+/ioew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkiCDZdk+z+Si9PWfd95ZRfDKmLLtb6tdTGAOPoNu34=;
 b=SinFxoiNMeRJmTeKP2bI1/dndw84PV0YvLchWsVjHgSNxDJsYUfW+QsaDv7dmNyIbZKsk9azZrlhq47eFERWlmUYuVoQvz4RiU+YiZRjh6UmTioMiIKkmDfDTUjCjGwHCQn3cj87vGq4mfibuxNwKzsP6N4bH0zxzL/bouglZ7bPb20mPhrK4eWnc8H7pGi8Q84FLBFXduBhxLNOXU6hX+K6LDLIMpzlCgTMPsPw3ze6N9M/mk80pCag+NIypsCqhgWNzAGB7+MvSIIkGLnq8Wr3bUuedkk8jMv42PEKOgu1WTkhN5j9NGwG6HtD8a9xqHlFSVbdXMHnl6q/SIDxTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RkiCDZdk+z+Si9PWfd95ZRfDKmLLtb6tdTGAOPoNu34=;
 b=BnpPGXvShMM1ghTwMJYoes9qS85489ijNR7155444QO/Y2eaGX6H6EteE2wCW+8MucloiBClB8NvfSrKBgkwBhbiH8vw0g+6op9Qp5ccJ2wpGt5YH5r6KlI/97Tgtj5JXHbrrxoMScnF5hsu+3kYXCvRoaslRbIIv0jwngE7q6+DSIWW012e5IG4vKtbFpApagbOixHQZTqR32UrTRT4CPSjNJgE3cu2z7YfI4M3EK8K96p+ieBUY1RE9GZU/vuC1PWBhXC0ppRNyHdhdLxLjbzynTr6JM/QyxZ3JOlVyf2+mrZFXapf34AUEHo4NcAPrW15N+nJ1UTJABBdg5KGNw==
Received: from MW4PR04CA0359.namprd04.prod.outlook.com (2603:10b6:303:8a::34)
 by CO6PR10MB5571.namprd10.prod.outlook.com (2603:10b6:303:146::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.27; Tue, 28 Apr
 2026 15:41:25 +0000
Received: from CO1PEPF00012E61.namprd05.prod.outlook.com
 (2603:10b6:303:8a:cafe::4e) by MW4PR04CA0359.outlook.office365.com
 (2603:10b6:303:8a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Tue,
 28 Apr 2026 15:41:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E61.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 15:41:23 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 10:40:37 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 10:40:37 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 10:40:37 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63SFebbJ3974160;
	Tue, 28 Apr 2026 10:40:37 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 054259ACF4; Tue, 28 Apr 2026 10:40:37 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH v2] ltp-ddt: Fix install error
Date: Tue, 28 Apr 2026 10:40:36 -0500
Message-ID: <20260428154036.3588156-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260428151019.851603-1-reatmon@ti.com>
References: <20260428151019.851603-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E61:EE_|CO6PR10MB5571:EE_
X-MS-Office365-Filtering-Correlation-Id: 69772709-906c-4d4c-bf2e-08dea53c9a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	642NMDl0gst6tU7fTO9WkJ+mcq2SAEhOeeDtmEyU3rwQlDehSaldPf2Ku0Qg1l84bVCAZ60Xpyh1//Bsq1QPLWgJZiXsGs0MvowxUDFcXpUBpWBsDq/mSe+kL4xgsglqFYYrTgIPxVWDfkiyUw3OWH37gNVd7Yp+u3xHZFF51ykTOvCls8w1f0hSeOEFQO2WYF7ulii4Ka01DcWEirLhBwKHIodH4zIvK+SeUqtYuUzcGZ+lAisSTOpelmQok2ZqdlpavaamPdzyhSfuWVrc9bOad0YoweJcCsXKLg6pfhho/cGApENx7qNYWzcTEooeda9t2aeFmBLfw4ICOtktjp6mIcFhXU9FZ3iJk8xMGImFqwe8jQYkxxAplMveblqeBA9mcfJjwk5s82V5sIwTuRHthSlS0yzM7ZEQNkWygcO3NV80ieBoczVvRhv/7i2g0vUo8KkVWZT3Hta2wmAcR83wnok6bLaJpuCKBTWCfjSaCbRTvyp69oMFLCQu1EgU7Rm1HNsqgArIiaoveX9TvBBZRBFn5enf+RIeWYHGC0U9lENc88Hxq2OapmKWTAdzbLIlTve2iX9VpjcM58toEVetiVC+NCgTTOVjEWxYLGEzliwsOsihIXbDVQ6F97Qir3ksEQdpcPlNtNgnKfoUZtIzTDVLn37AWz98N10pF5kttE9ENlHcrMghuBFwozZGe27fhCa1MKoytYTzYqJ7N5xT5en653Qn75bJM5Q8WlSxy3UC9t4RcrNWPlSD6LBMprNEs1+j17piWXKUrArhUw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Adr8j0LDyuyiWkFucAJwhHBv0yzcyGRRuOXrths2KP+ke2FLFpmCmOV5HMb6jRIe4kgfS8FW7hYkMcertB13h2/IMXLGobqkvfXmNmwtXiuzSkhIiYMExISxgHuvMYxPmtufQ0FD1Ck8uG8W8HFDYUaPHwtevX/VSpB7dQnD1zko4fya7sxWXvh2S1qtc1be9sDpcEee1HQ8js2QjGii4TTtG26COk5KfrNOxzxoUKY7aaHCVvMNSw6sW5hNZTSxkzPYjU8DYq3kpklUWry9pm1ULdTg8boYCNir85uAYL5/Rry7Y8jpYeEuZ1dvcv6F0+0bkGMqkVxfWb5uPsowo64lXK4oVyTq85GYNqezFbqzpnGS3ElXevNJDceQqDRq/wUm8B6cqXytXY1BUAG8a+sLN93l6Sk77MIyzsBXXhp6wuIU0wmRefyRk55d2vbI
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 15:41:23.3778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69772709-906c-4d4c-bf2e-08dea53c9a17
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5571
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Apr 2026 15:41:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17503

meta-arago / na / 20260428151019.851603-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH v2] ltp-ddt: Fix install error
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
+From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 28 Apr 2026 10:10:19 -0500
+Date: Mon, 27 Apr 2026 11:02:32 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 8517b77ef7a2ed05887bf04b800e75a74=
664c7c2

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
- Commit Subject: mesa-demos: set default PREFERRED_VERSION
- Commit SHA: 8e93bc2e94dab16cbd11564c65c022aa381e4bba

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




