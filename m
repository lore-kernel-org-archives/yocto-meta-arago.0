Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2237EECD9B2
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 22:56:14 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33815.1770332170644603947
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Feb 2026 14:56:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=mUp5HPEA;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.38, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lrHarn5UGEg3oD/9fv1m3IJ+ystVSwwOowB56OylW7ojGlSuwQ27D37LqJud2z8J5jPbbuLkCw5Bb5vti9Sk2deWhG4BhjF+UzEO2UpwDix0aadToHxZXsrXPQ9XibqJNctakZDBp1G1OyIbpG/KUMKKzINvPFOFpA2GG22jn5j5drdn7XPZCpdo2ilSUFxDDh7btp8ux2Q2xEhPb5+cGN9AYmEBeOhOQ3EdiIcZXPjQrBiW4QWPTtXgpBsJ2fOSlhp8CqBRqPZTfUhF8fW8HbGKVnOAodDbbqDs305M36uoDi2UihJgzGkAW9VLFA0m7NmeAA5kLnRIHyrK6FC/4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzywv0NlYY0aNyHOCCQ6bSfXyNrbVpqQV0f7gyCGi6s=;
 b=d/sroGdIiklSojcWY+zTLLbg9OPN1xcSGEBlxOoqKCQKjTco8IIywO9QZ+bKIlUYcL2DzYkbdt2eTGBLXDdJYpFx/PYpbKALzu4Cga/x5qjP9IF8hFnMXvIdXDpM3sA30mccVs/tKnprPcdYH3+wUb5/y8AMesWHwd4IzCIybVFvZ2XW2VXTbFMxYgwAphy2o7hSzRPyzN3svKO1twx6DLCiU7w7z3bNQr/KTKCsQ4QCpDWbsEHzToMGzZSLPNRNDzEbNEel4HkLPLimR2trU8ECKdZBzIiGy3y753+X+1lLqMXuM46YuwZDxDZej/8LEMtkLn+vIk7uU3+OCqYZKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzywv0NlYY0aNyHOCCQ6bSfXyNrbVpqQV0f7gyCGi6s=;
 b=mUp5HPEA4jmAKkS6kA7Nz0Ud88z76m39rpYJpsPQtIfXO6ogaio5Dd1a28D64+KVJIHH0VyjoKemId0ep3BzbKaHy/NZCcjL5f9XckfLHcbra45f68bfTYAz2UucCkhVuWy9d/jII0J+QWZnDlUV5Sx8ilT4FdijpXql11IZaUc=
Received: from SN1PR12CA0044.namprd12.prod.outlook.com (2603:10b6:802:20::15)
 by SN7PR10MB6619.namprd10.prod.outlook.com (2603:10b6:806:2ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 22:56:08 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:802:20:cafe::eb) by SN1PR12CA0044.outlook.office365.com
 (2603:10b6:802:20::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 22:56:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 22:56:08 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 16:56:08 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 16:56:07 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 16:56:07 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 615Mu7v5034061;
	Thu, 5 Feb 2026 16:56:07 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <jcormier@criticallink.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][oe-layersetup][PATCH 2/5] oe-layertool-setup: trim trailing whitespace
Date: Thu, 5 Feb 2026 16:55:26 -0600
Message-ID: <20260205225528.92769-4-rs@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205225528.92769-2-rs@ti.com>
References: <20260205225528.92769-2-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|SN7PR10MB6619:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ddbbc06-df23-454b-a33a-08de6509c00d
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PQrFt37rrbCA96V+5Lneqp9gi7QUNy2IqmToVZQfbhQf0nXCLVhY4vyMSopR?=
 =?us-ascii?Q?FizGbS47rLLr0oR1sDirdbV8EagJSmJfikyPGGfcdqK01qo826PDIEhhE2tB?=
 =?us-ascii?Q?bkZLqCVS8PqcHKEXkU/66k1GGyJWn/pSivxyZRuS7MiG8wxCA7uTxPH9F06/?=
 =?us-ascii?Q?0CZvT+wt+Bl9Jor46faItjXo9JV2mu5/CdLY6uEG0kDbEsGuKb1YkXLhehAC?=
 =?us-ascii?Q?dWbS9SpAIV6Oczc9W3bwd4CtX/Wm96kKEGWzUD10yU7KztMXyGx9PxR+aPWo?=
 =?us-ascii?Q?oHJT5YtBTtaHzIezGSF5grnGfc8Y+zoLw5L5gYGyJFHoW364sT8aotR6bdDj?=
 =?us-ascii?Q?I07N2TJV/WOM4eZfD3kDIfq5tqSSbiettBfojY4FqvebAhqOcUVcj2sLM8KH?=
 =?us-ascii?Q?BuBVmlcjssYxsDTMbwPBiYzFwTtcbhgof9khR1qwNsirx/HxH8fsrdQ48ioA?=
 =?us-ascii?Q?oMph91O7LWZYuZ5m0jBpbnqUcQpvnHWCr0/d4WJvq81KUO4B8vpaADMmXHDT?=
 =?us-ascii?Q?9DW3oznwnUjWEesKgX2SaUIwDtrfR2e8nnY75zKrFNftfuucVxrfsDD9u5o/?=
 =?us-ascii?Q?rhHQ5nCeruT1rn40KsZ2E/IPCncN/h76vclEiaqCyAJhOsnjrF56iGBCuTIL?=
 =?us-ascii?Q?lxERwC3Vck8FthhN+W4J86DPVmWJCah6CKZleqoT0HAFR964j1IrBPQHy/vI?=
 =?us-ascii?Q?MiWvFw4JM5tjM/WMpgbJkM16ZbFMef8s0i3suHHth4IkkMhjkHYC/dW9Y38T?=
 =?us-ascii?Q?2Q/K3MTCLpXTEPsRDsIEzDSOqt5eT3dNo/HAcSH4f92kOEy9f2/1l51gL4Sg?=
 =?us-ascii?Q?RCrKGw0yxS9ougMF8wK4quFuKKL6IWkH7FAjbxoAuVToI/QcULxV5trTEJnx?=
 =?us-ascii?Q?FjZVrdr4Fl+etGKc/hDpDuvKUtX8vuHrlderMYwQlR9GqFk4S3DKxcLder0w?=
 =?us-ascii?Q?2tx/BsDmNHXykbvmrcboFTdbxAR9x9zrXVrq3tbJEQWLLMR0nISRyVbDuaro?=
 =?us-ascii?Q?fkfw5VSCDJK/tHCw+2swU5btmmQiVgv0klzfIQ3QP1sNuwYxpjKzL5RGIJK6?=
 =?us-ascii?Q?zKYjvnkCESeemkYpheLSDErnljwmHBOTlTMOZI88U4yWU5c0Tj909HEjNlUF?=
 =?us-ascii?Q?aBNqiEffBv+Reu+NASOnCpGYbOubyzrSQi+JpPpeiERE2aw5rILbGwTl46DW?=
 =?us-ascii?Q?/VEE0VmcM778ykIBnzCjC5GTZJFg79cbyNSIPidtQiELUec6in8jOfwjBrX6?=
 =?us-ascii?Q?61oAB0ozLSIMTMu7IrtWc8E0APWRs9CxofQ35vaESbfIwP1JlaruYyty1+ph?=
 =?us-ascii?Q?xiNY17z8ehjriZWwGKfOP5gu90clQZtMHIyXmoSHO/FxaPFH+CVnLSIyLAuE?=
 =?us-ascii?Q?SFjSPSNmr+pTWMCmyReS2N/Tgs7fZPVsfNNnlYo9QwFnHh5e5duB7fTfpyws?=
 =?us-ascii?Q?vmG0+owdIJMZ1Q+stEc+VZaINaI5Spu3tUlvSCA538CSG8lBWYAJgmhuDQE4?=
 =?us-ascii?Q?dJZDHRxfydbvF4Qjd3MIys/848k7Oe2atgewmaoE0Rstra5EQLIlTDTa1H7k?=
 =?us-ascii?Q?ltVLvuYCSBwdNToPffrEN3jZeN33XoSkH/V8vesLqW2bH1MsPxqIvclqZco/?=
 =?us-ascii?Q?zUfqQM9bUFZITp1x44d7dyFeLOhUxGC97ulba2bRoyqPc+7uv9wN8wMF1Czs?=
 =?us-ascii?Q?AjlLXQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bbDajLGItYaqAmE44jvmlsixmVxr7MEDK/d7G4OXrNsHkTMhAaZypdcLxN/hj7W2k9SQknHGo7StS7IIblHG9R1/TSCXEhnNQlEqHjsXns2QM42vDFT8nvjLJapXWsFcjYkj3V9CTF/HlUu9J3peBIPQUS1s/sViV5K/zqjGk2DaUPYzNuLDzqG8mgmljgIH4KGaQHjx8i4akhjhU9VGjp5eAqkZ06U0NAzmLqxufVCbApuh730wowghS/eG9OGGL7ZaXToZCA7Ngsieazrc09Bw99sTw4meowrGrdYunjF05W/i7s2A61W1qW3vIZzKBpDXVH2brjmBAGbZt1ny1F9vVtFInCqirXTQ6yjwobfF8UTs8XgBg801VqZQBIAYeCpTwemCbPEz6WV2jkHvpQvNq4M5L0rA5hHEPX88oO5e+C5T86tTgZXlEmvU3Wqn
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 22:56:08.3974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ddbbc06-df23-454b-a33a-08de6509c00d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6619
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Feb 2026 22:56:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17086

From: Randolph Sapp <rs@ti.com>

Trim the existing trailing whitespace to align with editorconfig.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 oe-layertool-setup.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index eb412ff..cd6d04e 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -136,7 +136,7 @@ check_input() {
     if [ ! -f "$inputfile" ]
     then
         printf '%s\n' "ERROR: the file \"$inputfile\" given for inputfile =
does not exist"
-        usage=20
+        usage
     fi
=20
     # If directories do not exist then create them
@@ -348,7 +348,7 @@ configure_repo() {
         printf '%s\n' "Skipping configuring duplicate repository"
         return 1
     fi
- =20
+
     if [ -z "$uri" ]
     then
         get_repo_uri
@@ -431,7 +431,7 @@ The $name repository has the following branches availab=
le:
=20
 $branches
=20
-What branch would you like to checkout for the $name repository?=20
+What branch would you like to checkout for the $name repository?
 EOM
         read -r input
=20
--=20
2.52.0


