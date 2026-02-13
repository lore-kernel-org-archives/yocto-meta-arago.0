Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D601EF99CD
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 19:03:45 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.79425.1771009422015521624
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 Feb 2026 11:03:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=DCmipoOs;
 spf=pass (domain: list.ti.com, ip: 52.101.48.22, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNjD6L/bqWgr3bOFajP4YbL+/zUrTcepLQMkcRsJ8qvrb84rmFyBzn2TFdlMGsJwYPwJakWVYYxaUTPZZ9ur0mdice5GrYdYH/V24wnIFwBycdVLmNyCUMrjOqTMCO2rP3LC+qOjCH7HWMGrRtNRl1zMuGUykfO1DHlAfSe/UEXym6LE/iallS3QhJsr64M8/8TlKuWrjVjarev7uw2jvoJCTba+eR2VHyUkiZ/kGVa1NNMg0rF2eKxThF9U6w0k57BS61qdZTO9yyGMQ10+WjEFEOqQvombLgrLgpBPVxZ5ZbjdHkyGakL7u+manpQznzG9wvhE5cJf4nkhA6qDqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPBZe/Wxm0ympg7YhUxpCu1xoFUtJh+/207CCwHMCUI=;
 b=h2AAcm8idcM+TSUTH/+Ce32aUHesQ6UDKtLBR83bQTOs+kmzybbRE4P7b5dfM1vGYlWCG9ZwivUhyek/0dOahQs6gOPMUhmMR0IkKAzBilKrc/O2e9+0Xrly1b2ycSgCUMd31xbG7bYPc0CCKq7czJ5VEDlsh8rAZ/2P030tSg1hWjuOZBj/47kUM3dCt65LoPAWDfU5p+tzV9XECEZ9SBmxit80vRzJQ9xusbJVh5dBJppDnXFp2q/sDH/IsKOT+8N4iDpPFGYDcg79ZVl0F3IWiTozSeelFFIi48+WxfL5uYqTr5Dw3P7D6pHQjDUa1acJt57b1ZOIX58lpstovA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPBZe/Wxm0ympg7YhUxpCu1xoFUtJh+/207CCwHMCUI=;
 b=DCmipoOskaRTt7SrBb99SK9MGy7ivvTjUIRFptDsje9rcp/rGvJ40G0nLSt/F0BWmEBwdNdFhgnppyXxj6ymW3IDIGxwUeoXoqC/fj3RYyueRmgKplUHr0JCTLV+Pol5foMYSmKKZ0l2noURWpSVrQ+zPgdR3NzrTyWNECX+vy4FxpT7BV6NiUOpVaAkthLw5yXXhtEK63O4luBHrmIlC/Y5+UdhoA3F3HGRZrTo8JhQVUT3DFAB/goCeXt6ZlfHZ7Md1YAmUJJx4Pb8QmQ98gaTvTpOvdE5HyqCdZ+Rab0nGyGChLNOFiLhodWLOn/7nfuICXXysWJhU+bLY3/Vsg==
Received: from SJ0PR03CA0121.namprd03.prod.outlook.com (2603:10b6:a03:33c::6)
 by MW5PR10MB5873.namprd10.prod.outlook.com (2603:10b6:303:19b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 19:03:38 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::3f) by SJ0PR03CA0121.outlook.office365.com
 (2603:10b6:a03:33c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Fri,
 13 Feb 2026 19:03:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 19:03:33 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 13:03:29 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 13:03:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Feb 2026 13:03:29 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61DJ3TlH1700173;
	Fri, 13 Feb 2026 13:03:29 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 5222A2A6C; Fri, 13 Feb 2026 13:03:29 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master-ltsprep.202602130934
Date: Fri, 13 Feb 2026 13:03:29 -0600
Message-ID: <20260213190329.2150661-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|MW5PR10MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dd68771-2bfc-4344-0726-08de6b329581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TYdqYAZ1UGGzDRl02k951PoA4+yQhCmRLCHUjzLc7sxzM0j/Moq3Xgtxm9g7?=
 =?us-ascii?Q?dDm4klQ+Dz4WFPVh2dQzkxpMlV+LSwcHno0O5nh5PwnPn9p8FDupYm+pWccs?=
 =?us-ascii?Q?fdxlwISMtUM6GNqczJ60kD1zp4K5CkIpJgYRlC2azQceQ9z05sK1fCDgpJeM?=
 =?us-ascii?Q?LB/EAsyFyZf8Fm8eq+sykI8VFX5XJwAm0pGMpospcdFBqAl2Z7bCBoUyVvnp?=
 =?us-ascii?Q?cajcK9ihaWyH7niR4OVPrcp0AeohS2oTjiwzCR/j9aFLrTGEEjzdjsHE2G4Q?=
 =?us-ascii?Q?uo8LCV9x7MGAtIiFv/b/SJ2U4pKV+69wM56iKOhckKFnoA0jS18gfdyFiTxR?=
 =?us-ascii?Q?XvRcaj4uix+bAYLQnca9kzTGpBD8mdn+pinxH2A8rgQfeA2Pl9jKR6MoiNrC?=
 =?us-ascii?Q?JOIZ/tWONzZkxXElj0qOsXIrS6qFB+SDPL8JTUKJYeubQUcj8Vpy+1BvZYVw?=
 =?us-ascii?Q?dkHXwaDd15ZGH81qu3Me3DVgxHIwesDJQP3+en2XH7p1yLEtXy2gllgYmQpj?=
 =?us-ascii?Q?TlJUPq/m1g5TyM5WNwnGz6rHHwt3zzo9GLWNK7jqF0SO+Z9IjVqWLYwihIAv?=
 =?us-ascii?Q?cgJF70PF8NciojGSaUrhDq1IosL/+TrzOs5cyYVck5HdWHTo93TxFSo6VTPK?=
 =?us-ascii?Q?m5vy8fRSO0fmUKPTE3jTExVi3WqA2vUxvv1h0qsXjkp8zEs+fa5weZN3v0nT?=
 =?us-ascii?Q?LSdrwW2P/5DZI0f70vXfJs6Qh0IV4ji7Yz4kIQbjy54d0VkeSGa2TP8nBfjh?=
 =?us-ascii?Q?659DRTBVbIM5u4H45R0X7GTKuHY48nglTF7ePKiRm+QuKGb+XrPwJmZV5ZYH?=
 =?us-ascii?Q?RAUMDYqwNrv3FVU6Yu8pgxP7h1m3XMzwgQ/nh5EsqGldKOAZ2KlL6FxMzrdJ?=
 =?us-ascii?Q?zuN6oyYoWFgx4tEDjefNrZCXwM4kcn8Jsb2RgKfi6//pCQk2H8c6jFRyMq9l?=
 =?us-ascii?Q?PEUV3MH7VjgJhs+hQQOX6NEF7kXrvq/YfWi+EC5vewcent0wUGX+HxDAUfAe?=
 =?us-ascii?Q?zwfukhV5X1DJeYF+gxZ3emrh2c9bmoBSqmbnle148mdMaMRlffpnC901CfzW?=
 =?us-ascii?Q?IUr0nS5jNWKa2hZ/2JxRQIHexL6FvCWemRt6DHSBouDOv9wDgItijmn3OsSL?=
 =?us-ascii?Q?5p/oSL6yuiCvbL1iyhtGXFVL6C8RJUmOAvbiEmz6GMgXsAmXOnacZYQKbSuR?=
 =?us-ascii?Q?i7WqAn683J7KgjjVSf3UKct0DbYo5Pxm9ORhPxeXXOdW4Y3DuW30D35JuCLd?=
 =?us-ascii?Q?q6/QRCdtDiGlcEeU68kvCVzKXGZU+iCIBBiP1dD85RCrv/1gkPNZTMV232Wv?=
 =?us-ascii?Q?hdgT95mQyjKuxplM5KY9NfLSicRiwmiuW7rFZOeCI+GllWWqOqz2UIANzTeJ?=
 =?us-ascii?Q?4tNNl7/Bz17YinJb/hu6GsSoEMR5gdP3Rky/77LsFJXVCwW//9irprML326T?=
 =?us-ascii?Q?meubnXyhDIbLsu9419MlNC9qvT3oN2ZT6qFcpzsocRZ5PyI3zWXVifKPwkbj?=
 =?us-ascii?Q?PqJLS9wn6mmcTQG5o00/8vqPLTEMjriD5H57Npd7uQxVurxVmIOzBmxp26wQ?=
 =?us-ascii?Q?aJ0zqkbEmEkgVx+ToeZCR46ngOrcvTY35wYf1EKfZd6cvmiGPmH8dMFlUwTm?=
 =?us-ascii?Q?jDCxPeJYmEzFc43lsru2TFyAjZmqR2pA+XEuABPT412GKeXg2SorSdSL+N2S?=
 =?us-ascii?Q?Gi80hA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RAyJTn4A7S/nwFfauDtcY5sjT1tqNdSqADRliqq0WiU7xW/S1haxXWEBXcfjDUMz1bmBzxhU/pvEh/TqJagLUfUgyaH5Kk+WjRhlxymTmErD9Ss/D9PZthxsrmMwOa64tu4Gejwb1QiW185o3e1qKHnNxvAgE1zTaW2/Japt14k5Oa+FPrd6vTZzq3HFATDepOpvmqWOAZ10P+tL4Y56nWb2lfdvFE3UDDJi/kdKrAessEup4tec99mavIPzL68r8IrcjoTF+E6UOpqOfC+xdYNOOTVy3P1nteIv7EC+3bAV4KruP84xIIeIpkGzsrqC9kwjr53tj8OKFEjKP2jsF1vz69qjDpQzq28c4YcGYvspqn0Wk6338l6WAR2K4Joi8zOCcAt2c6sy5SIF7tSmGNcYvAiLdPWG41Ny4w9F0UBboRtplaVocI2fbSCZgUgg
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 19:03:33.2690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd68771-2bfc-4344-0726-08de6b329581
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5873
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 Feb 2026 19:03:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17104

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=3Drange&=
q=3D009ab8e98152dcc4ee070e066882eda6b42f720c..ced5ca724ba628eb1251f9f47a9ee=
1b3c8064e97

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
index 613ff399..77798074 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
@@ -11,7 +11,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "009ab8e98152dcc4ee070e066882eda6b42f720c"
+SRCREV =3D "ced5ca724ba628eb1251f9f47a9ee1b3c8064e97"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
--=20
2.43.5


