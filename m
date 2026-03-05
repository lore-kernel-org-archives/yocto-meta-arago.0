Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8DBF47CA3
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 17:40:44 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50084.1772732438190639813
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 09:40:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=hC4mZ8bP;
 spf=pass (domain: list.ti.com, ip: 40.93.196.32, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KswYTcHMvQeF5KYr8BSeJAdj2CS/V5RbwPSk1am3GOo5G0oTF/76zzjiVV1ZwiAB70BcEKFvzbQplDw8S9LOI6jmPDrOtWj7z2ON3YbxHNc10hobQhdyeF2mEWAdHthPcDFigTViSzKlRYtHNoW85SI6MEkQwYuHJJuwH+PORIY4Rt40WGM13yuCJ8q3r05CzTHLebSwgQr39vm7V/K3ZberW7ewhYnn1yoU45lxWkaE/BhtpINVUDQXi5JB9j7Zwa44P8/KrYmNtmrx3oC0DeX7/llvxRGmFsR8hwEzu0XUqZPYBxjsPoyL8rYRwhx6sYoUVJ2EHjsazbQiiN7ZXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2JjaKapaCHRwg2av5SmV/BvxVa8XhWXsVUBsnEsG/U=;
 b=qg/grReY9FPAzT1ww45ifcKuVKHQpzhcDr3VjzXnZNaVraDaDPmsrmgWilaxR6LzDowksiBDbmBVeydTeDkoo4wBYOzpxEMhi7qtt+en9VNvbCftgcPVpG0nIMduCCzG12UBPJ8l2K8pVhNhmpOClay2rFYavG9j2qLOTrPrY1nPFNVF9HLpumUO9WMqFnDJbowYtDSTgFc8VheCjtfPFZfFXVSH1x1Pj+DfSBiwCRPg3mLK6ykdxtMxjBZCL2VG7oPU7qRUVHARosAZ8SXsAaasqKetq6mlfvl2ca5H7qwSwTapn0amS2nSQ4flNyWnZTbmbJWzGULWnquMDkSnwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2JjaKapaCHRwg2av5SmV/BvxVa8XhWXsVUBsnEsG/U=;
 b=hC4mZ8bPg88Cc19JyBuCBBSFCH3mqd+G8TULg2r9lFbUwPNamAYC852PXeVlnMD9mGROMbDkjvTwMfqUbGm3JmlTp2F/Esbca1VTqAo3/oeIRk2p2XrfHzJ76L/Oywk4wQT1gXhoM0Z0PLUVQHldPM1lOmxytpNvvUiPoSsDrS3IBhc74yfA1PpDGbvJKCq9wvlugtA8NbDNR5hddh5/lA2xuZ/VZad67RYzoadvEqJBZCJ/Hd9pk8oSK/DNTLzzBT3o/NgHA3fvidPQqTLwtDbn5fLwcd4riBmkxheicDmRbqwNpzL1svjZfeUpZ8jSuALqpD1RRFIS9cfOVQkU5Q==
Received: from CH5P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::7)
 by BLAPR10MB5043.namprd10.prod.outlook.com (2603:10b6:208:332::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 17:40:36 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::78) by CH5P222CA0012.outlook.office365.com
 (2603:10b6:610:1ee::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 17:40:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 17:40:34 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 11:40:23 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 11:40:23 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 11:40:23 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625HeNZO2278188;
	Thu, 5 Mar 2026 11:40:23 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 124379ACF4; Thu,  5 Mar 2026 11:40:23 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Pratham Deshmukh <p-deshmukh@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <c-shilwant@ti.com>,
	<denys@ti.com>, <v-singh1@ti.com>, <khasim@ti.com>
Subject: Re: [meta-arago][master][PATCH v2 0/4]  Migrate GP AI Stacks
Date: Thu, 5 Mar 2026 11:40:23 -0600
Message-ID: <20260305174023.2715070-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260305173419.1735480-1-p-deshmukh@ti.com>
References: <20260305173419.1735480-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|BLAPR10MB5043:EE_
X-MS-Office365-Filtering-Correlation-Id: 593b5591-72dd-4ff9-b3cd-08de7ade4e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|34020700016|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	N7tIRBNU+tMBxTZ4rOvq9myBRd+lfoB3aIBrmEC1bBiCkouQYzGWHou7UoZHho7ST+SlOzMW+XgFRlghlJaURzlawhoUO/xU1U3/Ut4gQOZYxMkJycUdYrWQiv2VexC8i1z0gW+QC4Yiw9Mhl2rZM0PCyY8owq5pV2/fIkU7PIj/9b0RIM4k6f+iAXEQSprI4IkH7+QjJjkEGlLa1vSHXyas+2w3lbzhi5CO6iryYkqai1D47DW7rmwSDDjDEmTLVe7/0t3jdJeHm6IWlV+TJrBnkQIW53DwegTuYlqMmc7OmgnXfFn6M+boIBB10Lel8wwlk0v9YxJ4hyo60DG+xV6zX71xlqHWlKPvcev1Zj6GSG8K4K4He4y+sDEc15tefSgzo+MrcdilllWv4KtgtP1k1H1oJjTQPjisyTPW+5z4/yDMsyyU0jhTL9bQxaUNcU1T+ih96NOgAl2q+mhrQxx4bLDdYDT5a06sXH6GgQ+pEcxCGnL5IypTIulGuCWJu5bteCOtlzfFeQIyX3Y1W3av1CvLJyFD79IViQgNHTz+n88ripXeDSI2iOVNV7ckbvIW88JM1xS9tnfg7apyzq+HhZ6ULPciw+x5pA1CVg+o0q3jZuR67szIaK27amvC3EBlgSVeoCFoo3FVAlPAAe6V96gWdqtYRvmv5jM1yMg5EPNB/LbkHBC2XbhnAUqnmY4vuoZ1cjsEpwilBSBFVXIY/Zee8mLx8I4HnlRtSbrdMVhXAoXuh8YsVTWisGjk9rtU8S/KO7cztEoFYeVcVg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(34020700016)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/xSQDH8rOEA511GXpuvvoV94FFvnkv1YWvVOGKjUMGtipWeZzBRATCdn0h5/5hg9gXK9ShJKeO2Ej84YmwXrQi7qCSP1OM3rvLD8uzuZ7tJRh2RWixRF9xFuu3pFoTMcjpAUnSTowgci64NPwkZA6dtg4wzW07khlSWxXzpWt1AZekvPy2egIUYIgrweUWr33MEXXN7LsWtf5X+VwJxoT+APCsFDi88svlAHUGLrPFXfkmv2K5g3tiAkujKxDTiVx06RE1HvWg8Fa3CRNQtpkJ0wlr8x0mdyVIBME/KatQMQpXoIKrpqjiVTBVvT1obKGMj2B+QPWOm17KOGYL4gDBTtoLeTgbuoe5cnrQU7qjCuxidq9E5ufGzFpN+H04noomAXitBYIrZCsIfUpHwKY/ZvOUzy7nUcsBXrLPCWuNaxnpyMBoo7y8U9m0UHSNGO
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 17:40:34.4177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 593b5591-72dd-4ff9-b3cd-08de7ade4e1d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5043
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 17:40:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17249

meta-arago / na / 20260305173419.1735480-1-p-deshmukh

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
- Patch Series: [meta-arago][master][PATCH v2 0/4]  Migrate GP AI Stacks
- Submitter: From: Pratham Deshmukh <p-deshmukh@ti.com>
- Date: Date: Thu, 5 Mar 2026 23:04:15 +0530
- Num Patches: 4
- Mailing List (public inbox) Commit SHA: 308ac5b62a0dc4eb4874e5f60005b54c0=
6568015

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-test: Add iproute2-bridge
- Commit SHA: 538a04f7f91be5e391fe5613f298d6689ac3a2c0

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-devtools/armnn/armnn/0001-Fix-type-castin=
g-for-32bit-builds.patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




