Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD21F364C5
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 22:05:45 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.144002.1775772337991364620
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 09 Apr 2026 15:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=guX3amzW;
 spf=pass (domain: list.ti.com, ip: 52.101.57.57, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqTUlp3Ks1/GCHxRku+Isu57+oO7aNnEC0JPvXsdAyuRPWgdlBnnl2bvSGwN/IKW1FOSbwKJohUN5Tyr52wCSnfBMV5AqnrTWFx+coOHluT1NulojEaBMfz3sCd70R0ZdhOfWmFuQBvq1Igg1R3FQ3lp0PIFxbuI+qrALyiBiFBejJdtAiNIAVWWkcwAr5OXpb2lU/zvgnvzuPP73S3W+B/IC5d3SWHZrleD6yNWg6WALf5oQ+R5cCfKtdL+m4CMI8UoN5/fio/llDdlLJAVzGFJjaKki8IDxBve+xP6AjHyJF1yIG3iCIBb5RMIjiDu4j3sLa1q7Yq/1TtXhjQJng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlwbRLXVcrraLgaNNd4dhdx3Ggezd/XzM6NrbnpIst0=;
 b=rDLUCk/+cDcIdVIxCp3VEc+s2a7Pqn1r3O4t9/Qx2QNYkLUS9zzGGyu0jzmFnfaZ0jaExGNI8OkCiPIIxvdqEa6D6XWI8yDdU+emmNrWy0KTQ78pRi56nxIyvRJsAR4tuUQZd22w1m1+tOPGSoSpPWpZ6d7K25gBJKQR8KJWpVg3ta2f1JZ0ACjiWg1SxiFJ37O4a+D8DWEBrepKn3g0VxozCVp7WBWllv5j+eyMBPqTgv3S6srYddMWc0iH+o8os7+USfHv3NxYQs3htMa/WXtndQ7inE2GAAn8BPzrOfjQHJyvMJyN0JUnyTKkOncRcVIXZlACfO1BdNSJRQFqqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LlwbRLXVcrraLgaNNd4dhdx3Ggezd/XzM6NrbnpIst0=;
 b=guX3amzWLcSfa05iHkg4p5OQNmhtsm9jypVU0u2AU66d0+GFbJOKLuqUhWYuhllH8bxys8aKXwlAXczWds3sENeVQI3gdWxl61hGmkCveSZ4nzl0NGgqT4sT5XiQUO7a6ELmcTO9m3vTJ1Zo4xEdvksIfq8CePTMPXZvRQ/O/FKPp1iDHyjW4PjDX5TlyDFSO34z4ghoRKNKvn3nbzX32nRczr4Ro7H04zWaX3mBN9+5OwipLERL5H+bzzJF8wxxvNVtX8OeDN+ejhCFUxhYiY/YhypFmwJZLx1G1bWdfHLfOPC6JfaHpEZN1IAn1dCRGONJt1SZ0RlhERWwR7z+iw==
Received: from SJ0PR03CA0254.namprd03.prod.outlook.com (2603:10b6:a03:3a0::19)
 by LV0PR10MB997636.namprd10.prod.outlook.com (2603:10b6:408:343::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 22:05:36 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::69) by SJ0PR03CA0254.outlook.office365.com
 (2603:10b6:a03:3a0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 22:05:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 22:05:34 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 17:05:34 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 17:05:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 17:05:33 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 639M5Xcl3301280;
	Thu, 9 Apr 2026 17:05:33 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DCB269ACF4; Thu,  9 Apr 2026 17:05:33 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <b-brnich@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] gstreamer1.0-plugins-good: oe-core v126->128 migrate  bbappends
Date: Thu, 9 Apr 2026 17:05:33 -0500
Message-ID: <20260409220533.2644371-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260409213918.1020996-1-a-christidis@ti.com>
References: <20260409213918.1020996-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|LV0PR10MB997636:EE_
X-MS-Office365-Filtering-Correlation-Id: bf91bf64-9e55-4b77-6ef1-08de96841fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	2EnHhOm/g89O0is1a9bVCrpJALHGP9UYmXKIMD5D7KojTih6fom/B814ck8ife5QWywxcBJ+1HmvHzxo2vu9PcmDIdIFOeGMHyVLKsR46fkeAOMoYXnUYjtilK/cmisAR7xbeKTB5sEHpF65cBaK7OId529z8x1fN2Kw3MdjkPUMIzXxRSNEDJw8NUDYCFL0b5gn//3ecWKvFoXdMBeARtIR0XIxbuoTSHdtBFI9vY5oohTxecC5SVha6grn3QCNwI7+sK0npGPgJzOkAhwCIH7bp5WuZ3EYYEBl1lYkxFCJVkitFimgVCLodX7vc30T7n1rv1NwnlqOls7mZ5rqP+RCLpKv3Z2SIMruhDWeCMvLYY2AGP0D6Et+SAHWphFAQX6UeFT0FoKZZfApDqQ9w4NdIUoYI3xdY28q33tEhc39/cWS4tZuipspcUv3SSYv7AxZrgA5krTGhfs7/vEPYJJWA2MU8PG5ubF9CYsXir0+cAZhl4Pv0z2QcGpm6Lu3Ivy1dvfVZohBWiEoFnXWcqL1ZWQeQkbKukHiRNGY6Ovyk7d0kq/y4b8NwLvXlFS5Y2682r36Of0ngJmDskzTJILgQMEXYYmr5aXGY5c5tQZM1bOdWk344O2ZImPsiUN4cY50Us8ENAH64E+FJQFcAdj86X3nes5wEdMj9ect9RuKsU9zozwbrWSkMh1vnsYc7/pIqi67bldGSH4GonrOw5OrYDLZVhFIv2w2gfT/2V9C2hyhvvhRnmQMCqdaJxDa/kg46bC2SehMuyJDwWdqDg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	DrA8SxC4xuGZeAwbdlsg6QgmvWo/FhlxrYZGrLDOpHhPyNOp4FSxW+Zuaw9sLRU4Dv3Pgz8HjfQiN57cZ237F3bJy2v0q1f+oaUJJzqidFe2/mPe+cCtw4ELrrgraGO3vDie4FD6hD4ILm8cKevYNWKjx/Vhw6yRV9BAxSVhTrvveXwDtgSKFf4AFO/QknxSbcHkL+ZZzsXgldj+uU2rF4ooSrgh2LxqxO51Q08FvEMxKf0XRp8efXXtIw+9wnLERARjqSNyfqqZDBbM3avKzdjpJLl/05MVygKmhiHqqR1zTxhRZDQTB7vM7In13mi27EO8haJ3GvQZSdJPlOV/PAbLSrLKi6YksBO+gisosOH/B5ZWGYHLWLDHq+Kq6CBtsMW7yP2UWg0i57PlM/wjNapHYXaACqtIe2l4Gk488s2tt07BhSG8ye5dK++koGx2
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 22:05:34.7087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf91bf64-9e55-4b77-6ef1-08de96841fe9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997636
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 09 Apr 2026 22:05:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17459

meta-arago / na / 20260409213918.1020996-1-a-christidis

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
- Patch Series: [meta-arago][master][PATCH] gstreamer1.0-plugins-good: oe-c=
ore v126->128 migrate  bbappends
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Thu, 9 Apr 2026 16:39:18 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 1d3723e87daff6cb75a353519b88d601a=
76343f9

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202604090400
- Commit SHA: 2ac1e48732f82a896b2fc310930eecf2b247e035

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

ERROR: Multiple recipes found for mesa-demos
    oe-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
    meta-arago/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb




