Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C162D29FAC
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 18:18:29 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50972.1764872304965768350
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 10:18:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=H5M4z1vd;
 spf=pass (domain: list.ti.com, ip: 52.101.85.25, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h0xPEsRG6QasgIz6mR22b+oKPZuerPG4Q9z/4kpBLYYiBpy4/RdCWpFB2W7QCkHw3lGRJl7bI52peRptHdIk03NHj2mdHK62XfHrxCHtTLwbEjEYIijvz6H0hyqBOT5I1qQczNR+DJDMaUebjaqE2XIioHIRu2g870gQlRdseEVx9wouhkcPKddT9a4AO901JzmX/K/ks6MPKAUxT9I4CPJGUY5iZE/mJi5dYOY/j/yrBpu6n/LI7wBo4MEPcl6z9bWH1XDI0uAIJimlJSh6DGGeRiquakCH4VsAOKHt3a/nAF+HAQscbhSXzqBhTjj/QBkgGKyb2XEGkESkBS6InA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qz+Foq0+TjlcNKOrWMfveBDXZ0GKDi0wgiHDTL9P2tU=;
 b=VcSOCg/CMU9xdxO5+vS7+vJaQpH0cJaYDvmTFna4FRRIR8NEO1sB2vOwvndSVtPQCAIbcmtB674FbZb64SVL3VQpFNmPcxm2u9tiqSjpnN5IKQULPc1cmCzVliqjbM3hB70ao5M5jTwdqXYTXlGUdqlr2LwQI+lnnwuOtB0ubBjEexF3NyEio5vYOxGm87jKGF+7UFXKOwSYopfbScdm4L7eNdB8Pxjh/AsWUiexASbFjd0AztLLSMkqbMTIIV2DbPqsm7dRT/obnK+ZXXczGkAchwm9c9nh1NJy1kjzHlRPmxGrKI7O7J0Bo91C2YViMi1EvG7edg/pV5APMCgkLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qz+Foq0+TjlcNKOrWMfveBDXZ0GKDi0wgiHDTL9P2tU=;
 b=H5M4z1vdPeJ+GkQ0XshAS+DmSxwORgoorZQ8onK5mEMI/DRtto8ym/Eh5JqIj0nrQQgbLzKgAzrW0r487MFoF3fzgO8aFLUQyNw05907w2aokqVm7upgK/BssEVS6CB5/Oziu9Sw0o6cMdUoVyiIC69s4uxQB48oHWTLQCs351z1t7ReaXGDgnKRDs2Oz15gHftxgs4xc+qjWP4UbYq//e+N7yIdcUGy8aMrnwwQdcKbeCWLyWW+/If4w8BS+y5nDaSST60iieEIY/M7zyKID3Zgp3M2Z/VLiSP90j7haB99LLzEd0VpBJ3u/DaKDpKOUmiw8u1C5ay7eV8fRBpyWg==
Received: from CH5PR04CA0019.namprd04.prod.outlook.com (2603:10b6:610:1f4::8)
 by PH0PR10MB5561.namprd10.prod.outlook.com (2603:10b6:510:f0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 18:18:23 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::f) by CH5PR04CA0019.outlook.office365.com
 (2603:10b6:610:1f4::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.10 via Frontend Transport; Thu,
 4 Dec 2025 18:18:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Thu, 4 Dec 2025 18:18:21 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 12:18:16 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 12:18:16 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 4 Dec 2025 12:18:16 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B4IIGYd1989615;
	Thu, 4 Dec 2025 12:18:16 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 0B884136627; Thu,  4 Dec 2025 12:18:16 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202512040100
Date: Thu, 4 Dec 2025 12:18:16 -0600
Message-ID: <20251204181816.2021485-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|PH0PR10MB5561:EE_
X-MS-Office365-Filtering-Correlation-Id: 75fbf651-629a-44f5-70b8-08de33618194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4GSCTGKX4K4c6ndKh5DQ1h6TqEkno5ApOM9D2ni+bYtL5Pmfe1z0RRMZbJ2A?=
 =?us-ascii?Q?6crgAupIPX8+MfogEsyFeqUGcb1jykYabKxLsN2EMWFgPAWTokGSCTnA/XiY?=
 =?us-ascii?Q?vIbO28/94R8DbhQJSiOoJ+5CAIxfdPLA/sxTE8j8HeIvpG+Slw2FpiH86XMh?=
 =?us-ascii?Q?jiUCbrU/lBIWoCsQYLYnwtF1j14RDebJNV11n/d3z2cLRLEJRpSIrbYpNcUv?=
 =?us-ascii?Q?TmW7m/KNEAabVaFLqOkpyM60l6FlfqRbR1qAuuuKfphcqtfj/C4Z5WF28sZI?=
 =?us-ascii?Q?SNxjkJjAnILwHGxMVCc05rnNdxXTu9bw+z0X554vwaarakwgaY80WXYNH6CS?=
 =?us-ascii?Q?h0CI7ku+e1PitV1XTzHE30EBcxDtedkNd+Luc71R7hhfbE9r0vg3Otag7oRD?=
 =?us-ascii?Q?BrurwronzGpvc+AA2jr7Mukv0jMptoUr0FvImBaK2WfNhl/u2K9ZaWn2RU2B?=
 =?us-ascii?Q?yaweet+8DJrui8bJGCJzERvo+9Tmz/p8Yhix5uOCFb5DSqY4z+w8eC4vjJKw?=
 =?us-ascii?Q?2n+RM/WQuDLaGNmYbY69SA8AkeOC4ENp1PY+1FGczPtg/3u9vL8qPW2etDBH?=
 =?us-ascii?Q?wmS6tyqZoR/i8uEszKnhi/CI1MiTODHeBTiIheA0K2P+hV/HAMlgQCKv58n3?=
 =?us-ascii?Q?2tJKzCerHehH/cRTCETdW6lfsjFeD4pqJtBiFsgG9EE5306NAWnVo8oheJ58?=
 =?us-ascii?Q?fM4Qru02kgVp/vWI4Zkjb2ILgTUHt7pvgBA/pF3nmmQYCtI1/V1GfDtMM3vE?=
 =?us-ascii?Q?uK7Y76PH8TLFbUWcg3vNPkoNXXr34ETb5GoUgOszxl7YgE+DYmeEKisjes54?=
 =?us-ascii?Q?0tDVisjzpMYjpg/sHDB/M7YNQAao4iXbOGRmTJAwXGZAxLAuvRl6yQ5iuUjF?=
 =?us-ascii?Q?tt4H5EB+NDi7cnkaNxDnu9EyppTOpGo5aGszYDdmibwzKPUUtUwS/oE5whDU?=
 =?us-ascii?Q?U3g5nEHxi/YQiF5aaU78OLQ6PyVFAWd+7TjOMGm93HfYRK6/WvUTDuhmJKTB?=
 =?us-ascii?Q?O++XXOLvRq+V2SOiv7sHrZWf+ew8tf97fuLUoeYkTijluyTMKRvWKleLeRE0?=
 =?us-ascii?Q?mvkvJqesoH/ovfO70G+nFtQQfqE16JqEnrv8XIyzQWGMehZ8boknu78/BTG5?=
 =?us-ascii?Q?6W2HHwdWfYtvUZaDLJ5duh17Q1jR3TDogtWvF0GvP18DviqWkxJupgm48W8f?=
 =?us-ascii?Q?R8Up4uqSKahiA1i2XyFJe9m7Q9EKaKvtFmFCgpxe75Vy8XYTc/3GMqrr/0TK?=
 =?us-ascii?Q?RdwhfMUJRQn8zEryiWpM1of3sCUdq6xaG7hFFLXksJE76B+CZS6RglpaUGI6?=
 =?us-ascii?Q?nX+7euPMfZ7UnKO2dqXgdb4XmAxZ95o17qspM7zaOmnenxd0RsjMnJHUjRx7?=
 =?us-ascii?Q?BCHm3/hxozl38lfR7qsxQeMJ+UV6tFyx/eCGy32JSBR0KyiXLJHjWz4Hbsbr?=
 =?us-ascii?Q?cyGw/WWV/Opb4MFi5lw3Buueu70cu7y2K5/ZP1DTZ6wkgLKqGF5dlVFwLkOQ?=
 =?us-ascii?Q?A/cBszacc47IR8wX4BLelpkh8ZWKDy1PxltwYmy1ptvhfj+shJ3791sKl9At?=
 =?us-ascii?Q?N468K4A55TFB6oJ0Dzw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 18:18:21.0960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75fbf651-629a-44f5-70b8-08de33618194
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5561
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 04 Dec 2025 18:18:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16859

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=3Drange&=
q=3Ddc8865d0938e9eb37d662f61eb2db899c7b64bee..ed7695d077a74c374a38bd1e60545=
3c731ed31ca

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index a5cafbb9..fe16e12e 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -9,7 +9,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "dc8865d0938e9eb37d662f61eb2db899c7b64bee"
+SRCREV =3D "ed7695d077a74c374a38bd1e605453c731ed31ca"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
--=20
2.43.5


