Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A54F47CAD
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 18:21:07 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51246.1772734857297594815
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 10:20:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=p1RtdF9G;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.45, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkJ1TarbLcu1VkehOGKCjPSO4SKf+UcvJdzMb+gzLJNgXrBMtWiheYK7hOOB9a3k7KOHY5NPj+xFqlEs16L3dtxk0MtDUP+YU1dPUh6d9NCfRAMy/RNEJbRacR9Qx/LMkgcw8k/OEQilvpJsP2nEsr4t/rMEOx0J/gsmiBYOwEfdoZTYTGoZrNWz7VuFKvnUT/6lPYEG3LOUbfpWAy8p2lDfww0ER4arKS7TfHbBUKO3GgEswzlRIOCN6vgShjSy/kTyJsOHbQOEDDFxAv2sV7I9KHHtfiZpg1akhWlIQImmxszDG8xAqTCdSPQC1y5vy/Sd1xQtPJztGfgwWYvNMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teiaSJ0GpqdRFvr4FdjbyW2bKp38cFVOjFjOzmcvmn8=;
 b=cUQpFoSDmYWPJGaOY0VbZo5b4nOvOjDlszXj5F991DLbi2XgybT4jMzAJQt3LDI80VjV6owgs+XRhZZ4FO6XkJDSRgpBIqR2KD5DNCWWsL6YtSeZ4dR8Q8LxQ9ZNJ4nuB+xEr5+IneBAIuLmDUafRJ8TLST3Kpr4DUt4vRbDtw0FT30X/aaib1wa9czFJXUk4s0pCfgpe7a1ATaEiyhQssa9PErcwoqc03tY2lFh2Wzz0xM3nZ5GrhL+XrfPoFaRUotnkPJEr/x39jnt6vO4XiFPzgbZetXjnhNzgfyGfpvuIQTC2jZ+JYbPXyHvCWdZF7p/Q2b2rQYHpcexJrs9vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teiaSJ0GpqdRFvr4FdjbyW2bKp38cFVOjFjOzmcvmn8=;
 b=p1RtdF9GZa2ko0pMDrY1A8tLZukf+/hhKK508O9nXlw+CDX507wH1Ge7lGAiAMgh7ej7T7TUbDyTPc5o725vffDTq+WOvR8S1HR5UiImyx2AIKlveqaFAf81FCOV7USSNggzfcVZdB4XTQw/y4Q2Ekdv9MRqC/OnA5QSs7q7TME=
Received: from MN0PR02CA0024.namprd02.prod.outlook.com (2603:10b6:208:530::28)
 by CH3PR10MB7703.namprd10.prod.outlook.com (2603:10b6:610:1a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 18:20:53 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:530:cafe::a2) by MN0PR02CA0024.outlook.office365.com
 (2603:10b6:208:530::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 18:20:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 18:20:52 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 12:20:52 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 12:20:52 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 12:20:52 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625IKpeA2332639;
	Thu, 5 Mar 2026 12:20:51 -0600
Message-ID: <5b1800bf-669f-4a66-9d2a-c07be1fa0036@ti.com>
Date: Thu, 5 Mar 2026 12:20:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2 1/4] arm-compute-library: upgrade
 24.12 -> 52.07
To: Pratham Deshmukh <p-deshmukh@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>, <khasim@ti.com>
References: <20260305173419.1735480-1-p-deshmukh@ti.com>
 <20260305173419.1735480-2-p-deshmukh@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260305173419.1735480-2-p-deshmukh@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|CH3PR10MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: a3be8cba-918f-4ad5-204e-08de7ae3efa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|34020700016|82310400026|376014|36860700016;
X-Microsoft-Antispam-Message-Info: 
	SiNn1jXMJFIQcIFrRQCuo3t25ELYt14YOlGeT/OOMOAhnPVkro3gffn60c5KxYirWOt9D4SW+ZGYRx8IOKVUPxShexON3N2NGPQzkKs2hS4FzuO8QZbtm/MURI3m2jDoSDCVTVagFD2+23sEOc9VQ7bBWX2NnW7neJKwepv8r3sXIQBidIzVLMrQ1c/a5eEIPLhiqdzFsuFMLvuoe/t/LRR/dPoGv3xKU38GiyBJkpaMfkvWMH76/mgc5amTzzrcWVK2pzI+eaFjp/2uHaRjM1+CFwU35lV+OO+1Qq2v8qSjKmePLxvfgQYtvQaFhmUbq1mfn7Dfn8rMlX3/iKI0BDvryNQEKpdOIwaCbr6U9ADMexT90Ka0xz/YasBrwBlt8dQbJJAk5P4UoW+hMzEo8jyhwTDFgSiveWrn4BlDa2cVEzQTST7B+ejx+43PLBS2WZlxoIjLpDeW/M1d2EmlYjPdqXRm8lVFcjDgm2urBGk51wjvAhxz7dFKVmuGLsLtidhUZ1aHvEt60sPtB2Yh/URJxhQWDgsqp+V+RmQHHIhbYXsQvK7Ah/FMHMjjEmItcjjNpKUGmr4CK8fPKa9QBT2Rx8HMbSosf8JDfC8g1ELQapUz7uM/yzG1aOFQiIM7LsT1ZfhztDM9k/M+7qyyo1bqbx+69OVsQ1qpUTQ2hXY9xx36ExujhpoSltyCOlG1/Yf6TYTeILIzrK9wNdtRZXWnkgM32Zgij2yAgHmmWNPprg1l4LkhWMFHcGktXz7fGcmgJtvKlP3s1Q2IJ+NevQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(82310400026)(376014)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FTHSqmSkhJJQNjlRsbWOtjEkLk5F+eqMBZsTH+BW/b/HShec/gkGRUf2tLdRMOcciu8tWomHNgN8NEbWt+0S73jvF/4By+51jWhBip+T0L7l/m9pc22rijq69WOP+ctL1835FYTbFkQW0VX2egOeySXt0Ckz4ndX9oq3OgiG8Kwj4gN4YvfhVNv+xoemPUK5bUkHDO0Xnf8gAnCRAYa4shk8BKi90mM/Q3WWiMA2/BTxcGxThayoM6YbgC/ssa2swZDnO3Omb1EhVHN6IQYUjhQiAaY3Ou15g6JoCRxH+wTud/Oztmf5WN8zmQOHTx/t9dtBtscj0Jf0DHcs71560kNufoITImt+74pY5xAouJPgyolOH6z0Z1ibidrQBlwdpodKhGijdRrd6T8bx6qwrqfU1Nz6+ppv6sihtL8+cuc5kR8wx0rykxEuif5F/DKd
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 18:20:52.8501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3be8cba-918f-4ad5-204e-08de7ae3efa1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7703
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 18:21:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17253

On 3/5/26 11:34 AM, Pratham Deshmukh wrote:
> We are migrating ARM Compute Library from v24.12 to the
> latest version v52.07
>=20
> Removed Patches:
>   =E2=80=A2 0001-fix-Fix-indention-in-cmake-generator-script.patch
>     - Upstream Link: https://github.com/ARM-software/ComputeLibrary/commi=
t/e0c42ef651709fd284da3bedd2c98d420bd6fd1a
>   =E2=80=A2 0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch
>     - No need for this patch for v52.07 ACL.
>=20
> Rebased Patches:
>   =E2=80=A2 Following patches are updated with new commits
>     - 0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
>     - 0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch
>     - 0004-Add-source-files-at-library-definition-time.patch
>     - 0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch
>     - 0007-Allow-ARMv7-builds-using-CMake.patch
>     - 0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch
>=20
> License-Update: Updated LIC_FILES_CHKSUM for MIT.txt, just checksum updat=
e due to minor
> formatting/year changes in the license file for version v52.07.
>=20
> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
> ---
> Change Logs:
>=20
> v1 -> v2:
>   - Fixed arm-compute-library recipe name
>   - Fixed tabs/spacing issues
>=20
>   ...NABLE_NEON-in-code-for-checking-NEO.patch} |  72 ++---
>   ...-indention-in-cmake-generator-script.patch | 130 ---------
>   ...ENABLE_SVE-in-code-for-checking-SVE.patch} | 117 ++++-----
>   ...ce-files-at-library-definition-time.patch} | 246 ++++++++++--------
>   .../0004-Allow-ARMv7-builds-using-CMake.patch | 174 +++++++++++++
>   ...ptions-for-SVE-SVE2-and-BF16-support.patch | 112 --------
>   ...mbol-error-when-building-TensorInfo.patch} |  24 +-
>   ...SVE2-support-to-be-disabled-in-CMake.patch |  91 -------
>   .../0006-Remove-TARGET-dependency.patch       |  58 +++++
>   .../0007-Allow-ARMv7-builds-using-CMake.patch |  86 ------
>   ...rate-generic-library-name-instead-of.patch |  33 +++
>   .../0008-Add-FP16-source-path.patch           |  28 ++
>   ...24.12.bb =3D> arm-compute-library_52.7.0.bb} |  56 ++--
>   13 files changed, 551 insertions(+), 676 deletions(-)
>   rename meta-arago-extras/recipes-devtools/arm-compute-library/arm-compu=
te-library/{0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch=
 =3D> 0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch} (58%=
)
>   delete mode 100644 meta-arago-extras/recipes-devtools/arm-compute-libra=
ry/arm-compute-library/0001-fix-Fix-indention-in-cmake-generator-script.pat=
ch
>   rename meta-arago-extras/recipes-devtools/arm-compute-library/arm-compu=
te-library/{0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch=
 =3D> 0002-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE.patch} (67%)
>   rename meta-arago-extras/recipes-devtools/arm-compute-library/arm-compu=
te-library/{0004-Add-source-files-at-library-definition-time.patch =3D> 000=
3-Add-source-files-at-library-definition-time.patch} (24%)
>   create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-libra=
ry/arm-compute-library/0004-Allow-ARMv7-builds-using-CMake.patch
>   delete mode 100644 meta-arago-extras/recipes-devtools/arm-compute-libra=
ry/arm-compute-library/0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support=
.patch
>   rename meta-arago-extras/recipes-devtools/arm-compute-library/arm-compu=
te-library/{0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch =
=3D> 0005-Fix-undefined-symbol-error-when-building-TensorInfo.patch} (68%)
>   delete mode 100644 meta-arago-extras/recipes-devtools/arm-compute-libra=
ry/arm-compute-library/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CM=
ake.patch
>   create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-libra=
ry/arm-compute-library/0006-Remove-TARGET-dependency.patch
>   delete mode 100644 meta-arago-extras/recipes-devtools/arm-compute-libra=
ry/arm-compute-library/0007-Allow-ARMv7-builds-using-CMake.patch
>   create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-libra=
ry/arm-compute-library/0007-cmake-Generate-generic-library-name-instead-of.=
patch
>   create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-libra=
ry/arm-compute-library/0008-Add-FP16-source-path.patch
>   rename meta-arago-extras/recipes-devtools/arm-compute-library/{arm-comp=
ute-library_24.12.bb =3D> arm-compute-library_52.7.0.bb} (58%)
>=20
> diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-c=
ompute-library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.pa=
tch b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
> similarity index 58%
> rename from meta-arago-extras/recipes-devtools/arm-compute-library/arm-co=
mpute-library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.pat=
ch
> rename to meta-arago-extras/recipes-devtools/arm-compute-library/arm-comp=
ute-library/0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
> index 1c33ac3c..b7dfa7b2 100644
> --- a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
> +++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
> @@ -1,7 +1,8 @@
> -From 4350c56d14b7b68acd060d8331f3ade1fb74e167 Mon Sep 17 00:00:00 2001
> -From: Andrew Davis <afd@ti.com>
> -Date: Thu, 5 Dec 2024 09:21:23 -0600
> -Subject: [PATCH] Use ARM_COMPUTE_ENABLE_NEON in code for checking NEON s=
upport
> +From 6902148626781de2b4a2aec2c00fb6a13328209c Mon Sep 17 00:00:00 2001
> +From: Pratham Deshmukh <p-deshmukh@ti.com>
> +Date: Wed, 4 Mar 2026 15:24:41 +0530
> +Subject: [PATCH 1/8] Use ARM_COMPUTE_ENABLE_NEON in code for checking NE=
ON
> + support
>  =20
>   ENABLE_NEON is a flag used by the build systems. The flag is not used
>   in code, instead ARM_COMPUTE_ENABLE_NEON is used everywhere.
> @@ -11,19 +12,17 @@ use in code.
>  =20
>   Upstream-Status: Pending
>  =20
> -Signed-off-by: Andrew Davis <afd@ti.com>
> -Change-Id: I65f5e7411c99280e2dd8c187140909cefd1c6892
> +Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>

You take the signoff line and authorship for yourself, even in
patches that you made little change to other than what was needed
for rebasing them.

Maybe some tools you are using are doing that automatically, but
some might take issue with claiming their work as your own. I don't
really care too much in this case, but under one condition: you
should work these upstream so we don't have to carry them here in
Arago for next LTS.

Andrew


