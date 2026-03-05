Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CB3F47CB7
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 19:08:47 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52194.1772737718405647603
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 11:08:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Xy37mNuP;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.35, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVCa3GH+kHwR/BgUEnRGXmQKBtU1U+qOKHi+KlSBZm8uZkZmgOTx/mypkjB+HccjKsia6zNko8DJBlgQQPh9zG4sXJ/ijO3jTPuFWlAeMZnpWENctuK7P23Xjbq+E/VcRyMAJPa9WNzx1ufIXOFeCtDFyfOObdKCRgWrVmxH2ix4uiQ/pMSIcYJj2oPMfJQ115nVtKgjKidesmji6F1UljTrGCYEJGw4rAAMp5vMckJQfdMrcY7Hpewivrt8XrwTMxswTZGsdoyEvnmh82LSSqTjEc61vYjl8RvllwFIvUT7cSCKDf7ubiKcCv/B5j6V8taCaJ26aSJr1Cg1DPz5gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLoR7VL+LTZ75Yxjz5H2eDa1GTyYMto/VIWVqWqKNeY=;
 b=vBi4+wAa9r7GigDz5Hcv41V3XOVCSkknqh5IkP/UJ4MaF0DhUiVd1SSaUj/MPCUh1fMKkefw2VXLMF79MbnGXUl+dscqKV9eDKc8Dq2k0i36KFCfIlbz3HBNLd3sA4gAGs/DyZKFFSl0cYQwNRBM+9dm2m+WKK9osfM6UDkIFEHROYEr//2rlm3nNt08dnetg6OGbgj4tRPb3MP+hbTqdebm/KQleLPpJesRUPd6bFubO9r0Z+Wsb02qo9YwsatX+43DBrQlMoN4m3WQA2ErrAKeiMG8GkcXlbOm/B0OOwcUIYxIwU78kx8rl567rP1+5/s0dg4MqKkaMasr0Xsl8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLoR7VL+LTZ75Yxjz5H2eDa1GTyYMto/VIWVqWqKNeY=;
 b=Xy37mNuPs+su3XkQZiEp4RDuJStnrrq9TcqxUu7NbZQC/WzCos+irgzskZr5ln1o5+Enr85bxnWZwnQUXffr2SBTi386IZgc6tSvsGjnwhjRNPD1e3xK9GVXqCqTxXMc3cpbVmqG31nBoofRGg7uU0iCZPgVJt0wByVOFLKGxkI=
Received: from CH3P221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::34)
 by MN2PR10MB4335.namprd10.prod.outlook.com (2603:10b6:208:19a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 19:08:36 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::17) by CH3P221CA0014.outlook.office365.com
 (2603:10b6:610:1e7::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 19:08:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:08:35 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:08:35 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:08:35 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:08:35 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625J8YEV2892308;
	Thu, 5 Mar 2026 13:08:34 -0600
Message-ID: <96eea1bc-5bed-4a37-b5a6-e4f64f59653c@ti.com>
Date: Thu, 5 Mar 2026 13:08:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2 1/4] arm-compute-library: upgrade
 24.12 -> 52.07
To: Pratham Deshmukh <p-deshmukh@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>, <khasim@ti.com>
References: <20260305173419.1735480-1-p-deshmukh@ti.com>
 <20260305173419.1735480-2-p-deshmukh@ti.com>
 <5b1800bf-669f-4a66-9d2a-c07be1fa0036@ti.com>
 <62c09add-4c40-46c1-b7bb-4fcefea6edbc@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <62c09add-4c40-46c1-b7bb-4fcefea6edbc@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|MN2PR10MB4335:EE_
X-MS-Office365-Filtering-Correlation-Id: 30a46928-e167-4e88-3030-08de7aea9a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|34020700016;
X-Microsoft-Antispam-Message-Info: 
	+xD1R5G9nUaKDr+DdDy9R7phYsCdTuuVuTvfb3+dkYY6vgGlcpoed++bZME8vjQF6m6Y88nfj/Rk86/wXK+0NBnWa2Pzz7BVGnP/6RK6LoTMM2CFfhiTXt5d2B7s3iLzNV4nbia6qwHLd4LDllQ0m74fC6JxFrdRNqHV1hZf2+CNGUGcBYSf8mJQR53+CEnQhpUpNpf1Sh+V3cW/SqOQyhW/p9V/O7STmfRY23H7rI0aLffhRzk8caDuqwiZ5kZYosa6h1askbRAp4cYA2UmnbvSAzOTXfc84rk8JVK58aimbffTQ/MyW/H/dhMehdNQEmOebgGkIcoapix4hmGNwZXWk3J1fQ0gF5vLXXSY0nuCMarv3fmQIJ0NIG5/jIUZvYf9rsjOGmXHNb2aVDFoAnd5D2oxmbp9VHhDUYE5cfLWKiO4kb3NOG8Iz5/Cym1Pg7Q9bKXyUNIL+0Z28FxxCHlIHZpJqbL9w2ma34vewpvQ0w4IymeY9p50dHWX9iqD6yuBibP1+nfqunr2/3qFruaVtFkiWjw5x+2CZpDDAaqI9TJUeibRLh5HxJ+xp723FiVRitr6kxJwP5nSzcLtBLXsoLLSQmS8qD9pIyh3QcnVEAqHd7Ge8lgTSeg6C14qWOSswwpnL9isZ839QHRQKNRzxkAmnO0Mh0u5W1CT6KYZh7QqFp2+LMC1do3ljQg6DRN0ne7bLJ72ztQFGzJk7Oh2GiXGfSBnzKInj5Ij37B2xh1dP5e1qEXtVSIoKgAuBYmQA2mt2ZoX3+iPOlT6vQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Wujq0l4igQa9EHZwwUcuDi+yinNhPhRA7MXOAjjdPURafQeQDCTEhdzGPHZkZoTaNgR/xST9e7xkJrJ6ba9WfbicPPIEl4LP4UgKPH3hYVSmiHB+ugp04rok9doYsOnMCuZw4jDFtsivnoKUN+zdBrEoPw1uTCHZkijtTaqpmQc22Shg9icga74scqZMxd4sJmBiOpyTzVq8corTjpvE/WBC/CggpvIkPEZb4Zv1aUHTqZLFNr8LHUaoRUVDh9fNq3TRb/5hdnTn98kuYuD+sds8PeOYDSVdLbNu/H7FuzbA2aZd0EmWBZhVjOQjNYsW9EQkIkXKelNDdyaLcnhFWncYOYq8haxVeWHDFmGK7BX4mCaapoCDk7Se4sBFZzpDqqu7rJIWTyXfgR5cSDp/IEZJo/DhGvPNn29KUJwLbZgcG+KAVlAdTuaJW3W07SWM
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:08:35.8159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a46928-e167-4e88-3030-08de7aea9a15
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4335
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 19:08:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17256

On 3/5/26 12:31 PM, Pratham Deshmukh wrote:
>=20
> On 05/03/26 11:50 pm, Andrew Davis wrote:
>> On 3/5/26 11:34 AM, Pratham Deshmukh wrote:
>>> We are migrating ARM Compute Library from v24.12 to the
>>> latest version v52.07
>>>
>>> Removed Patches:
>>> =C2=A0 =E2=80=A2 0001-fix-Fix-indention-in-cmake-generator-script.patch
>>> =C2=A0=C2=A0=C2=A0 - Upstream Link: https://github.com/ARM-software/Com=
puteLibrary/commit/e0c42ef651709fd284da3bedd2c98d420bd6fd1a
>>> =C2=A0 =E2=80=A2 0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.p=
atch
>>> =C2=A0=C2=A0=C2=A0 - No need for this patch for v52.07 ACL.
>>>
>>> Rebased Patches:
>>> =C2=A0 =E2=80=A2 Following patches are updated with new commits
>>> =C2=A0=C2=A0=C2=A0 - 0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-check=
ing-NEO.patch
>>> =C2=A0=C2=A0=C2=A0 - 0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checki=
ng-SVE-.patch
>>> =C2=A0=C2=A0=C2=A0 - 0004-Add-source-files-at-library-definition-time.p=
atch
>>> =C2=A0=C2=A0=C2=A0 - 0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-=
CMake.patch
>>> =C2=A0=C2=A0=C2=A0 - 0007-Allow-ARMv7-builds-using-CMake.patch
>>> =C2=A0=C2=A0=C2=A0 - 0008-Fix-undefined-symbol-error-when-building-Tens=
orInfo.patch
>>>
>>> License-Update: Updated LIC_FILES_CHKSUM for MIT.txt, just checksum upd=
ate due to minor
>>> formatting/year changes in the license file for version v52.07.
>>>
>>> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
>>> ---
>>> Change Logs:
>>>
>>> v1 -> v2:
>>> =C2=A0 - Fixed arm-compute-library recipe name
>>> =C2=A0 - Fixed tabs/spacing issues
>>>
>>> =C2=A0 ...NABLE_NEON-in-code-for-checking-NEO.patch} |=C2=A0 72 ++---
>>> =C2=A0 ...-indention-in-cmake-generator-script.patch | 130 ---------
>>> =C2=A0 ...ENABLE_SVE-in-code-for-checking-SVE.patch} | 117 ++++-----
>>> =C2=A0 ...ce-files-at-library-definition-time.patch} | 246 ++++++++++--=
------
>>> =C2=A0 .../0004-Allow-ARMv7-builds-using-CMake.patch | 174 ++++++++++++=
+
>>> =C2=A0 ...ptions-for-SVE-SVE2-and-BF16-support.patch | 112 --------
>>> =C2=A0 ...mbol-error-when-building-TensorInfo.patch} |=C2=A0 24 +-
>>> =C2=A0 ...SVE2-support-to-be-disabled-in-CMake.patch |=C2=A0 91 -------
>>> =C2=A0 .../0006-Remove-TARGET-dependency.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 58 +++++
>>> =C2=A0 .../0007-Allow-ARMv7-builds-using-CMake.patch |=C2=A0 86 ------
>>> =C2=A0 ...rate-generic-library-name-instead-of.patch |=C2=A0 33 +++
>>> =C2=A0 .../0008-Add-FP16-source-path.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 28 ++
>>> =C2=A0 ...24.12.bb =3D> arm-compute-library_52.7.0.bb} |=C2=A0 56 ++--
>>> =C2=A0 13 files changed, 551 insertions(+), 676 deletions(-)
>>> =C2=A0 rename meta-arago-extras/recipes-devtools/arm-compute-library/ar=
m-compute-library/{0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NE=
O.patch =3D> 0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patc=
h} (58%)
>>> =C2=A0 delete mode 100644 meta-arago-extras/recipes-devtools/arm-comput=
e-library/arm-compute-library/0001-fix-Fix-indention-in-cmake-generator-scr=
ipt.patch
>>> =C2=A0 rename meta-arago-extras/recipes-devtools/arm-compute-library/ar=
m-compute-library/{0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE=
-.patch =3D> 0002-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE.patch=
} (67%)
>>> =C2=A0 rename meta-arago-extras/recipes-devtools/arm-compute-library/ar=
m-compute-library/{0004-Add-source-files-at-library-definition-time.patch =
=3D> 0003-Add-source-files-at-library-definition-time.patch} (24%)
>>> =C2=A0 create mode 100644 meta-arago-extras/recipes-devtools/arm-comput=
e-library/arm-compute-library/0004-Allow-ARMv7-builds-using-CMake.patch
>>> =C2=A0 delete mode 100644 meta-arago-extras/recipes-devtools/arm-comput=
e-library/arm-compute-library/0005-Add-CMake-options-for-SVE-SVE2-and-BF16-=
support.patch
>>> =C2=A0 rename meta-arago-extras/recipes-devtools/arm-compute-library/ar=
m-compute-library/{0008-Fix-undefined-symbol-error-when-building-TensorInfo=
.patch =3D> 0005-Fix-undefined-symbol-error-when-building-TensorInfo.patch}=
 (68%)
>>> =C2=A0 delete mode 100644 meta-arago-extras/recipes-devtools/arm-comput=
e-library/arm-compute-library/0006-Allow-SVE-and-SVE2-support-to-be-disable=
d-in-CMake.patch
>>> =C2=A0 create mode 100644 meta-arago-extras/recipes-devtools/arm-comput=
e-library/arm-compute-library/0006-Remove-TARGET-dependency.patch
>>> =C2=A0 delete mode 100644 meta-arago-extras/recipes-devtools/arm-comput=
e-library/arm-compute-library/0007-Allow-ARMv7-builds-using-CMake.patch
>>> =C2=A0 create mode 100644 meta-arago-extras/recipes-devtools/arm-comput=
e-library/arm-compute-library/0007-cmake-Generate-generic-library-name-inst=
ead-of.patch
>>> =C2=A0 create mode 100644 meta-arago-extras/recipes-devtools/arm-comput=
e-library/arm-compute-library/0008-Add-FP16-source-path.patch
>>> =C2=A0 rename meta-arago-extras/recipes-devtools/arm-compute-library/{a=
rm-compute-library_24.12.bb =3D> arm-compute-library_52.7.0.bb} (58%)
>>>
>>> diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm=
-compute-library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.=
patch b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
>>> similarity index 58%
>>> rename from meta-arago-extras/recipes-devtools/arm-compute-library/arm-=
compute-library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.p=
atch
>>> rename to meta-arago-extras/recipes-devtools/arm-compute-library/arm-co=
mpute-library/0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.pat=
ch
>>> index 1c33ac3c..b7dfa7b2 100644
>>> --- a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-comput=
e-library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
>>> +++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-comput=
e-library/0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
>>> @@ -1,7 +1,8 @@
>>> -From 4350c56d14b7b68acd060d8331f3ade1fb74e167 Mon Sep 17 00:00:00 2001
>>> -From: Andrew Davis <afd@ti.com>
>>> -Date: Thu, 5 Dec 2024 09:21:23 -0600
>>> -Subject: [PATCH] Use ARM_COMPUTE_ENABLE_NEON in code for checking NEON=
 support
>>> +From 6902148626781de2b4a2aec2c00fb6a13328209c Mon Sep 17 00:00:00 2001
>>> +From: Pratham Deshmukh <p-deshmukh@ti.com>
>>> +Date: Wed, 4 Mar 2026 15:24:41 +0530
>>> +Subject: [PATCH 1/8] Use ARM_COMPUTE_ENABLE_NEON in code for checking =
NEON
>>> + support
>>> =C2=A0 =C2=A0 ENABLE_NEON is a flag used by the build systems. The flag=
 is not used
>>> =C2=A0 in code, instead ARM_COMPUTE_ENABLE_NEON is used everywhere.
>>> @@ -11,19 +12,17 @@ use in code.
>>> =C2=A0 =C2=A0 Upstream-Status: Pending
>>> =C2=A0 -Signed-off-by: Andrew Davis <afd@ti.com>
>>> -Change-Id: I65f5e7411c99280e2dd8c187140909cefd1c6892
>>> +Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
>>
>> You take the signoff line and authorship for yourself, even in
>> patches that you made little change to other than what was needed
>> for rebasing them.
>>
>> Maybe some tools you are using are doing that automatically, but
>> some might take issue with claiming their work as your own. I don't
>> really care too much in this case, but under one condition: you
>> should work these upstream so we don't have to carry them here in
>> Arago for next LTS.
>>
>> Andrew
>>
>=20
> Hi Andrew,
> Thank you for pointing this out. I sincerely apologize for the oversight;
> I am still learning the nuances of patch authorship and attribution, and
> it certainly wasn't my intention to claim your work as my own. I was simp=
ly
> focused on getting the rebase working and wasn't aware of the protocol fo=
r
> maintaining the original "From" line.
>=20

No worries, as I mentioned I assumed it was just an honest mistake :)

> I will update the series to ensure you are credited as the author for the=
se patches,
> and I'll include my sign-off below yours.
>=20
> I=E2=80=99ll take the lead on pushing these upstream so they don't have t=
o be carried in
> Arago indefinitely.
>=20

Thanks, that would be great.

Andrew

> Pratham


