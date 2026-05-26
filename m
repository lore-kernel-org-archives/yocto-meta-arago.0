Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CC1CD5BB1
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 18:48:48 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3487.1779821320669794006
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 May 2026 11:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=vinDGfDY;
 spf=pass (domain: list.ti.com, ip: 52.101.46.39, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7PcmWOjtmoB+swugqutp/uzptHe5s7JUq1oZ+oYnV1EWDvbBfEwoX97GzM41xoFQ2tcC8TWaF7pCj2laPl05+afQ7vqY7OwjzK35mG9zHyL5cKuBmwBsgFsMrmtCfKoan9af3GYzimQSu7UJyCl4pHy804w7wsAULf8bHmg0CZx2btWYlt0a7n/hUFBR9RKySiK8IR0UoxE3KVy07u1wwVD2FzJfDw1HpulbZ3aF0vr3w+JskIl8n8zU5kF+gSqzEvtsOjGgEa/hBylLnoKbRL+ShqJWVx3WPO8ESC31Ir9+74Mq//Fvu4Q1S/mYs+yJZijeJnyWLD2XBJsbCoWiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4jC9VVfh2QH/84nIKBGkWznWjLfp7cMezgL3g7NXfs=;
 b=mfdgyrc2vveN6f9JuRXMYTnuldW0p/vMPVvXxJgDMRQcd9HEwNiyS6C42ah2BvcFNqmbhoY4zhSdZVFFiW9NHWkpXr6onOiQ5qUNki+JIXrqAfLJSxL5AKtAxP8AypA4rWO9RyJbr4uwBf7dMJS5JXYftNRS2dABGuEd1KFml4jf/ERxaDS5UWQ7po8hwsoT+zZQfln9Ba2WAnuHPbmOpyV80HisNAvy3v4dLQQV+xcL49WcZSL6tr7Z5Ws9ACLFYZRZiG275zVc6t+FpmUF4MSMHE3/KP1gn/uBXTbjGd8moL3eUemqnFuc7j2BDiqa0lCVGi0SGwAZCOMUgbFNFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4jC9VVfh2QH/84nIKBGkWznWjLfp7cMezgL3g7NXfs=;
 b=vinDGfDYcOsGMpuVn+3A9OGugxVBpukLgEHQhaaV4/GniL6td+B+BCj4evszAHR9EKM78vd/cBQSWOgrywc8HRV2aY/PXpeMFbEcNJqy64u9Jj6zwOW1kHfM8JkP+56VNdNfVcfcuDLgtEUPfiya/pFOkXJTxc6yGijcO6xGDgSt0WjaU+OMYiltCT3P0CAkroAMvs1igUSsKd3dzY0huneBJX9iU/A/NGoBupAt846ERdsCD0cfhWavdUX4u8oUwCX6XihlmqDL2DpJeut+oozfvIi1E7D3Lt+7fIGxtFow1UeI7SMMJvqA7aMuNl4rkxWw9kF9YNKzEpWYL4yvwg==
Received: from SJ2PR07CA0017.namprd07.prod.outlook.com (2603:10b6:a03:505::17)
 by SJ0PR10MB4462.namprd10.prod.outlook.com (2603:10b6:a03:2d7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 18:48:38 +0000
Received: from MWH0EPF000C6192.namprd02.prod.outlook.com
 (2603:10b6:a03:505:cafe::3a) by SJ2PR07CA0017.outlook.office365.com
 (2603:10b6:a03:505::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Tue, 26
 May 2026 18:48:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000C6192.mail.protection.outlook.com (10.167.249.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 18:48:35 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 13:47:59 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 13:47:59 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 26 May 2026 13:47:59 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64QIlxqa2628297;
	Tue, 26 May 2026 13:47:59 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B365D9ACF4; Tue, 26 May 2026 13:47:59 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
	<detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: Re: [meta-arago][master][PATCH] meta-arago: chromium: clean up and simplify V4L2 patch series
Date: Tue, 26 May 2026 13:47:59 -0500
Message-ID: <20260526184759.2117359-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260526182753.376138-1-t-lannynd@ti.com>
References: <20260526182753.376138-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6192:EE_|SJ0PR10MB4462:EE_
X-MS-Office365-Filtering-Correlation-Id: 11cf5e45-346e-44f3-0cdd-08debb5764ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	p91IKFyDME3WnJSgpdqA2dxJ+fEC9Dv6gygbff1VY8oER42v7DFpy/wzLnjgDsRGDgZCNXJkBV9is2mryKSuCpJTSFxJFCOC9yLLg7SJ3z0v+Hl5kd9MD08TuqxWtEoeVVrQIn76IoGWRN8cpEuWecri5Dj5gjAkmP/1WxlqDepvh1cWIAYYe19irBjxw8NVp9WVHnKxQxUwe+KOJH1DeqtxhgcEhAdC6sqzl2uMCf9kQz7lhZ4FCjByvNOe4t+ilM9hUP9/6IR2SviIuivzJ28sWbwJiiChYTCQ7zi2svx2PzKdYhCqMn09kSrHXi63s4EBQRRGJCiSdiPDsnhFGD7u6gZnT2DYBtWi5tzaG06eSHe7mz4D9CD3E/JH0p8yWhCjnrqt7rnZrIEJESfHPdWzybe4gT6SlCrPIcxgV0ccwHeOYIOBkZ40jdkgz9Pa1WK4OnyD4aUzJmUZ23f7pTl+nV+B6LRkocQ8YUNS2j1uUMy+jydoS53nmFbNxEdQmNz26jEWszNAjmQ5AASf5EjJ3zVqn909P8RTkb/KNVz++MgHc8Ur1vduG5hzoMLPZI+FS6Kv1Af2HTS/JFMjIT6FXbrVn2O8lFa4Tkr5ry3BTYoIuNkaKZ6RkFVzD6tyH6wA8viXBrbQwm6NZJqjQPyECSD2rHshQFsVnw8OhQgLeFrqvStcxcN9bxYft6K+FE2M8BzzOy/yiUVHwGS7LNP76KUsBub3wQn69EU++UA=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	yLMn/3hHjtUstKzjq5aK6Gh6GpYU0RwWbqRKswDi5n4KjFHG+vTyrzpe64ay1Wjz+VMaR+o4scMlnZ8eyTsJWbZPYxFMTYUYAsC3PgkM8jZ3jeYiqvtlMbUFPsKXGm8LHqAjx7k9jg2LW5DKWAEX/37UxJ/5NkBPZTBgoFadcoSCFvRmPTocM1wS32LdihsHlx6P+qtp4ZA4yFN9rhkt2QadxFiv+aGfYxdOkUKZxmXZhdP8cLVfkO0xjoKNuFzjMBUnjQfTV1O4IXhOkn7P4QcmjURfpa1kq0l6iZQRBoNQATjJ9W8Af0OyBhKx3L1mFdl6NyFLZItzGXCR+C/g01JjDN+8S9uaNmhIUGLDj8ntRJdKa0v8nL9uI+sVvNLZ1/yb0lpteTxaZt9Dk9QX29ZF1bqaq7EBtQ4D3P3Ytog7Te5kmiBXO4cMs1c+nSj0
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 18:48:35.8394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11cf5e45-346e-44f3-0cdd-08debb5764ba
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6192.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4462
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 May 2026 18:48:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17539

meta-arago / na / 20260526182753.376138-1-t-lannynd

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
- Patch Series: [meta-arago][master][PATCH] meta-arago: chromium: clean up =
and simplify V4L2 patch series
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
 From: Thorsten Lannynd <t-lannynd@ti.com>
 From: Thorsten Lannynd <t-lannynd@ti.com>
 From: Thorsten Lannynd <t-lannynd@ti.com>
 From: Alexandros Frantzis <alexandros.frantzis@collabora.com>
- Date: Date: Tue, 26 May 2026 13:27:53 -0500
-Date: Fri, 5 Dec 2025 12:40:27 -0600
+Date: Sun, 17 May 2026 02:40:44 -0500
 Date: Thu, 5 Mar 2026 12:02:31 -0600
-Date: Sat, 9 Aug 2025 01:46:14 -0500
+Date: Sun, 17 May 2026 02:29:10 -0500
 Date: Wed, 11 Jun 2025 11:07:05 +0300
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 38cb875ddeeb916512f31d2ce52023956=
d1f4d3b

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: chromium: Upgrade to v148.0.7778.167
- Commit SHA: 7fc9c9be31c9337d695da43fc0cbbee1c842da27

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




