Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96258FCB606
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 14:50:39 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70570.1772808636673435485
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 06 Mar 2026 06:50:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=MEZbqY2p;
 spf=pass (domain: list.ti.com, ip: 52.101.46.59, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsqi9V6tH0MgnU+ct/3oignfwHxcmr0eYKpTYh9hCn4ZvtyzwGlN4khoJYnVBR6V3UYKHtxIpJsvZhYdUsjQJ6RPAVSfUm6A48TSqO16hosbrBW3ovhD0d8NQkTRXN3vgfGFBTcIpxrndsTZWHtpEtfnSLE1cD6TmOQtlHiDb/FNZ0c04g4UNfGGEp2l6jjqkdfigJ5DnQZlzmmkPgA+MLM+6Z0gt8/wbVHQmtiRV28a90O1L8Nrtm+O+4SS/8pFNT3FG/TWcbSS7rkTHN8VaiT3hOSsByYfAL/b9RKdJE6uwzWmSrpK7g5ZtRgUScNLCgABDYkAMzffHJsTcSTu1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dwMtKsW+GnebyeVSOfAIY0BkMXvsOHIQfmUL431msc=;
 b=GxYo21UmLOpMu0I75LdeDfoCfLAb20LnejoNverB2QqQVfSkYkQRWXMUGMVQiJK/s2vvy4+G7gcs23w91lOAXtKFYC9MJ6aKaSdy6AllUnFLLz2F4A4LZ5bx5kYCR5pCCB8W93DpRbrXvFRcOr+E5Zd5qj3VPMo8n+uFDh8bfZbAxHecDD0aXfEYxvozZocPEy4qushYo+4bWb3l6MTpwbt54XJNF20jKCc15MfkUozMEzuHXS4dSkiLfVucNqAKiAigNzM2ggKzhbEMHcvYM1PZcKZ3a3f193ydxBCaboHuP3LnMoNhvLK8gAsEXy3l/VuAVhwgiKsMjbqDYMHf2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dwMtKsW+GnebyeVSOfAIY0BkMXvsOHIQfmUL431msc=;
 b=MEZbqY2p9aQZlxnLliuVwNYRXpjzC4Oe0f7Pc8De0bp2PN30k9iLayf58eJUL+iF0yQ2TrkcLUE+q64Si5hKSYTvTIwwDYtIi29IWuQKz/6bMJyOW1fD8M/jZSX44dDXxnGl4PmVsq7jUm93SpUfimk0pR0uygvcmMHbIKwEZ2v0XMq+lrYGBWUKvOJb4Hoc+DYDU5QqZQ4dTqvYbRtrBlEsmj9RcDbV8tb6mM98RTaKL1rI1egoInEX3tuurH114/irjzUOiBH95hCU+njhQ6TpXrAZP13HD2Ywhp4zRpgAAHXP3+3I4ZE10swyjOwOZ19/0iNBoZnPi6sQqx8vXw==
Received: from MN2PR20CA0047.namprd20.prod.outlook.com (2603:10b6:208:235::16)
 by SA1PR10MB7593.namprd10.prod.outlook.com (2603:10b6:806:385::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 14:50:32 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:208:235:cafe::5d) by MN2PR20CA0047.outlook.office365.com
 (2603:10b6:208:235::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Fri,
 6 Mar 2026 14:50:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 14:50:31 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 08:50:17 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 08:50:16 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 08:50:16 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626EoGDf3076557;
	Fri, 6 Mar 2026 08:50:16 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id C7F559ACF4; Fri,  6 Mar 2026 08:50:16 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] check_yocto_rules: Add settings for new emptty recipe
Date: Fri, 6 Mar 2026 08:50:16 -0600
Message-ID: <20260306145016.471866-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260306143322.564676-1-reatmon@ti.com>
References: <20260306143322.564676-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|SA1PR10MB7593:EE_
X-MS-Office365-Filtering-Correlation-Id: 1469a393-9653-4f49-9c84-08de7b8fb6dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|34020700016|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	ePEaRwgbjh1430P4QkIzWmPcrzQ+2ZhjCcdMgFUrMtf5nxH4BZKpXGaH0edrGfVVrWpW+RrJRq5TT/+GcqEwQa3wCWfHEAPf+OJ1QfFcg2AZIWEqAH4MzUnzkHlwWiJ0emPGUIxQTeFZYeW/lpCrV0uMaRk9rG8dWV+xNZLRnX7wcTiwaEqNdJgmq2XjFYfDZNtmmB++2QNKP7aZu89PjpX9cCCD5NH5G5KpvzNutJ+d4DhcUvWyig7L3m48Bz/ryCB0+PApOhUiyZTYJKF7V1vBBkYddgAIZpr5hgAhQptnjndQNSN9KDqZULx4Z/lBYVuQ+E+01HWKQ2WRUaBNbMbEQf+1ZGCATZW26RYceQTqj37nHaEPLWMMYbwbV58ueu3XzKi45KPVkjhcMDFR/AoZsM9zKsWNp4ipmQdKnzdSbHHt42PUCJYglZMz/ptbWzd0UFIT55gRXNulnQyAaBbjKE424hOfxuRX+HlvY8svz2wkxaGED9ZHVHWf3Fw2TZLdeGorjuddZDJdkIka4J1HYxkkqxMArPjK0razSmUlgkTAJsGcuhTKYu5dTvuD9Xyz13oG3yvh4KC3sTSuDenI8fByt2XUvZDrGk1B48TGHgCPUvPrsAogpUCdRazV8VIU3KKM1PoSGnmWkrw5n/D94bzIfKYpsfS4O0H0t2lXHEgZJDVNXexKgA9XZWUytMRMH/B48EHCw+7P8iHY238ff5VlWGScs8QXTfN6OEbQBQndvt+/rs1mYlEaPO2N71cSFE9xK13sswrxR9NKww==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(34020700016)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hW6AQm8Ek6NEz/XGpJ8GQgCo1k4Si/01/z4KWidhKH13Q8pfG70coht8SNPCXQo7xMJ35wketaa0CShGC3p3xFoZt9usabOyPww68d13DKnkzmLjUvhGs0aGeV0011CMzjKZDHVBJE4oXytLEW8NHaRKaKkmrDuC2Gwv3Kz+R9Lbxrui/ePJPNwxX2HbyePxGEB0lIrB229fyaI6oCjomhdzXRpYgiKM96IyiF5RsJOpMPsM4I6CYqvsy8EbuAGxGvi6FHjDkX+hEC+uFnd7rnmpshrbgAjp0Pg1+77Huc79QEZF2oFbNT3spaxpQVRuON62o7wbjkYfkNi0aGEXxcs00TQRcYiW8LkPE3pska5dLsrlhoUU1W2npMBSwcla3dWVkLoknsTHQCiTWbkITSZgZSarokEy9DxK30NcAe8YQDfwkkgxTUkBzPNSY4Vw
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 14:50:31.0436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1469a393-9653-4f49-9c84-08de7b8fb6dc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7593
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 06 Mar 2026 14:50:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17276

meta-arago / na / 20260306143322.564676-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] check_yocto_rules: Add settings=
 for new emptty recipe
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 6 Mar 2026 08:33:22 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 13cbb4ed01b0a810786846870e123a871=
5d7d4bc

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: Antonios Christidis <a-christidis@ti.com>
- Commit Subject: emptty: add version 0.15.0
- Commit SHA: 7e07ca47e0a7bc77ef7ab8bc0a10061a0c57e10d

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
ERROR: Nothing PROVIDES 'xen-guest-image-minimal'
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




