Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 910DDE6BF1D
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 15:00:30 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12332.1769785221893979130
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 30 Jan 2026 07:00:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=GYGMZfF1;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.41, mailfrom: j-sahu@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTzy0reXHrJeKjJiXtwo9FmlDVYDSqwxvOeEe4WscqkfUqCVINE/UW+YRQ/FCEvIGdukGrQhF4STJ+Q/GpdjckvFC0pr0Lvd50SQYXwev7ov1REv0TiStyXOY4GZgrG29bkp8YLpPBGMq4ZdLny98nYe88J2tVjYUxEoe6aRHNgzVMk1fChZwVpGu/Z0iv0gCg6cTzykub42fEzaXeyBHMyboIUzqwBYjpdFG4kBzqBavwThfiuUFxf8fa8fIIP1sR4EeQ4C2XCavAw0ywArRVnRj08djkCCSHJahnni8VQ/qZtsyik4wmS8PdFH2UC1wHUFj6DnA1JcBLQSNNWmuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amnRRxUfJygkgk4TTvUWmlLHu3SxFJlLnLrtpriLkMA=;
 b=obC1hdVrTtd7Ruz0vBvFLaaOETvhBRqumTdKm9+wR2CJVtSXpa3moIwzLIZ/fRidpjlswz/QYVii8oeGJLZf/fwNYuQM79eMlPk+sKFofesU3+YEcmn1bAxZww9qWZLWqiK9B8FE64PiXcF63+FdYoXFp/CdbBvp1KvF/JOVg0DZVoN+FPdVzoNtzwm1jknofHU+qI7DIw8NFwE31VtRbS4a4Ehcrzk98C5PjNjJlxb73Ztrz98XVN/Jnwj3OqyHfe9Z+Brl+ZZWZlONy72Ciwk+3KUY5GsZYQzY1LdcIiwlcWVtGaoVsA+VtMzzXg8DlI6n1gJqhEVL1VmwM5DmGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amnRRxUfJygkgk4TTvUWmlLHu3SxFJlLnLrtpriLkMA=;
 b=GYGMZfF1UWmPYRhm/OnkVKyISABXlRva+gLJEYQqgf/PhJ7Zs4FuizyMZcpOXa27s1GGloWEekvXC3cxz/1/4mIzLxK6GzO8Rv62PdYUPiI3NSjfhVrUUlajH6l6N53M62qvQ9HVNTOVMlhTJmKv96O+AHFBiAmRgyOdLayVRbQ=
Received: from SN7PR04CA0051.namprd04.prod.outlook.com (2603:10b6:806:120::26)
 by CY5PR10MB6069.namprd10.prod.outlook.com (2603:10b6:930:3b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Fri, 30 Jan
 2026 15:00:17 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:806:120:cafe::34) by SN7PR04CA0051.outlook.office365.com
 (2603:10b6:806:120::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Fri,
 30 Jan 2026 15:00:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 15:00:15 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 09:00:07 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 09:00:07 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 09:00:07 -0600
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.233.81])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60UF05Nr1885173;
	Fri, 30 Jan 2026 09:00:05 -0600
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [meta-arago][master][PATCH] tisdk-core-bundle: Set IMAGE_BASENAME to include ARAGO_IMAGE_SUFFIX
Date: Fri, 30 Jan 2026 20:29:53 +0530
Message-ID: <20260130145953.981914-1-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|CY5PR10MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: af0a1b3d-cd22-4d01-f41c-08de601046f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ot+N7MFTucePzZ5KFahiPgrpv21jnDpZSLjvP3DwUZXTO4hph+LB/qm/VD2m?=
 =?us-ascii?Q?ZxU6OqmOKK8a7VbmOhccze75l9c6fqJy1VTqiKZUBYeo0CTFvvo8SFRIYp+g?=
 =?us-ascii?Q?lz7dgiKQs4yGl3dBfN05o7IRxed/Yw5txqaEjMW9J3QjxLQQ1KK0xsojLM+N?=
 =?us-ascii?Q?lPBAxZzch6/op7Mgk4E6nZBNirScpDpMQ1GnMJDyJrkKYnDBckjLMdkOah/1?=
 =?us-ascii?Q?ggGcwmiDjjVVUSNr4tL0aiq3mockvuf+QOrbKn6KqhAqz2qREJmzL8Poq0vc?=
 =?us-ascii?Q?1g6eKVpIegVPFQdJdvgnjMUFrxHaCBwnw5HLK8Crauq5ad/237SB20CxFD+k?=
 =?us-ascii?Q?UEseGXir072vINSFu75fO2ofHuMtTpggUUNv/lslzhgmDRmvo4JDvEtxkDnX?=
 =?us-ascii?Q?lIv2w653EXt8oSIA0nbeT4SgjkMRPivMd/ZgThuvrud2gmVZ7BQaOAoxJ6Z0?=
 =?us-ascii?Q?TH/zzPsfSYfPzkiofQewhgss9CgWbYO6vqBJZQEKo/stF6IUOOeuuIhfm6L3?=
 =?us-ascii?Q?v32UN9XF9WFnPstZ3uxL131z3iFSni2FeEkqZv4zLs4PdSDDBCdTvC78x1bj?=
 =?us-ascii?Q?4k269KrPZ7iR3L0MOkN1iikFSy7tPMQpmLEVaXmGmdtauncFUttkB8hLRi+M?=
 =?us-ascii?Q?wlA5ho8+knjDFnaiA350B77KFcDXL6pSthePdeyPn/3s8LJXm7/K8yj4tWI6?=
 =?us-ascii?Q?tP2uZAC+NPc6KCw9zKONE3buNIfdex/nY2a33QTc+kQmZDOLiG8DcKXc3N/6?=
 =?us-ascii?Q?CvA8BZAj2Fq7mZeK/jOO2Q+ZyA5H6M/yxo/cF0jlJcmHRgAUN0QDSwmeWKR3?=
 =?us-ascii?Q?BsM5evEkpvJZLjm53mIv0ibeKr++VEsKlE1zqr0HWZq9t2Yf5S7MsiRtnAX4?=
 =?us-ascii?Q?fQqP5ATnI6yj4uoEPFu/8XICW6B9jHYi8O3kFpfgMORL8sTXlX4BiRlMjEyA?=
 =?us-ascii?Q?YpsPvPYxIe1B/beQsejECEAtGmI+B/wSBk2TtPw2E3STiza/uwuMPxTrQS/M?=
 =?us-ascii?Q?qmWSlRpH3zW9dUN9xGVQgs+QwTpMgwRTLsUW52l5u6A9KPCIt42dug7P2idM?=
 =?us-ascii?Q?0Apnvfg+9DClepn2NnSVNHorM3rG391cMO31hIDytyA4aR2PiaNIEprOIrwh?=
 =?us-ascii?Q?6nvpDXrZVWbfPPDCyqogr10F3CCDpqo1M0kOlfQg/pHnqrnSSAaacx2ZUcDz?=
 =?us-ascii?Q?c4CKaD79RE97rRclRBz9yWWRG2kyGC6bHabqheqCCwklNW0kh+Zbwyz/YFdQ?=
 =?us-ascii?Q?BMYpvKu65qm44X8bQ7d6vFyJEkgxgYh+fWzUPJs3LSo0N3LPJpyMnoeZu+Iy?=
 =?us-ascii?Q?ZYSd86QLOiyS4kvL4bVP/AbiGGpWJoEvoG6TtC3NmkcRJ+US2tWqYjW3lzll?=
 =?us-ascii?Q?Q0XV4bMsWbPFpA+VAl9fbH1MM839hTMzLe25mWu9AsfXFVEXam0BbKh2q5Fd?=
 =?us-ascii?Q?s20eyA5J9n4UAwxB6DbXKRu+avbS7w4x5XXYbWrijzadFnWrarkITQigB4rh?=
 =?us-ascii?Q?X5dst4xpHeXDy9YlmuoGzlgJEsphvUEXwDkTbzuiw0eAe8UuC3OVzik1vcpZ?=
 =?us-ascii?Q?qZ1bt+biE/Y99yGKOuvk05hkPDmgxW6Qm/HJPtydms/mAhwoUorpJIo4mSCG?=
 =?us-ascii?Q?Sl9VAN+zgQe7eA3w+pAeMY8sY94/zushM8kZjzhC5RtbcLLi4kHbFK2DlKxQ?=
 =?us-ascii?Q?FdsA7Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RijcmaHDhn3yzUgOXIPB0R0MC/wNMNuXoJEZGPVcbZcjlQ0vpJyrayu/euN1dTEviH7S7n62SIM1c+twvafT3Gxh0neM441+xreGBQSNmdjYNlzdpw5pfrmlzc2H1sr1N6bfKq+xbPWEC1OrB52Z8aIIPNy7YadGucu/Mo0i6KV2ZixZh+jqCmAgXi534heHU+usdY8uoEkMr0o7Ne3mt/zpM/FxInqfGEBPeTN3nmiBLd/UUqCIpLzseO1xR/o5e9QCMTsB+/bAJfZEQe2ZtqAmC0NPtcvwIAHCUGGFuQ+f7qTJqu9PxtwHb2fdLMldfaePuoCLo5fuf0ntm0qEPZIq85W4i99rJ0eg7xTALVmVfTspIjX5kBZq6PAlLBuD31sJPZUatFX7C83HyV3YekWIh0p3RkthYUU13JEJJhXI6Q3CEARRZAIjsgCNC/hh
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 15:00:15.8434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af0a1b3d-cd22-4d01-f41c-08de601046f0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6069
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 30 Jan 2026 15:00:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17049

Recent changes in IMAGE_BASENAME[0] updates the image base names based
on package name to arago-image.inc. As tisdk-core-bundle doesnot inherit
arago-image.inc, set this variable in the core bundle recipe.

[0]: https://git.ti.com/cgit/arago-project/meta-arago/commit/?id=3D3cafabdf=
bb64166fa56c8ba188411bb4b65a8235

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/m=
eta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index 0711ec10..f12caed6 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -18,3 +18,5 @@ DEPLOY_IMAGES_NAME:append:am65xx-evm =3D " sysfw-am65x_sr=
2-gp-evm.itb"
 DEPLOY_IMAGES_NAME:append:am65xx-hs-evm =3D " sysfw-am65x_sr2-hs-evm.itb"
 DEPLOY_IMAGES_NAME:append:ti33x =3D " extlinux.conf"
 DEPLOY_IMAGES_NAME:append:ti43x =3D " extlinux.conf"
+
+export IMAGE_BASENAME =3D "${PN}${ARAGO_IMAGE_SUFFIX}"
--=20
2.34.1


