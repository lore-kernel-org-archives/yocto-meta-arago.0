Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A15EEF338
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 09:04:42 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40061.1772701476896180709
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 01:04:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Dkfh9HQB;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.39, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFMXGyI1kJB+dtHarr59ZzYN5WrISlEIu640/T3tJLfsTEieMqgiT9B2TZBfwtbrOHAoArS/+ZnynJj1cgMXTCjSZGRp8JKj9lknV3un0JfQ7JW6jCGsCyjKO12Qa9zSl4942JuDemEtZhZIR5Ekh6gIIEn+oKi5Ln8wxJ2jg0FxQpIaN1HAogGYjZ1QQ5GWbsMaHgwWuvCa063utzrtA8jPzPoxDX3KzItzDNlbjGmu+TSHJTtD7GQ2UT5j8rECmFlNnqPpDwD6JT0+ipMqP6JE+7Nqm3UwNGQ24HGm1qMqW87egFc4cZ7kmle2mgXEyabG4EjDca1ZcCcTb/pQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5ZgQN6LygPuagSHDzbfYb7KNuPNG+N2Dz8NvMd0G4A=;
 b=Utf/1InbrK0D60Rhe9is5tl+sdW12aRSL6UXY534hkpRHvQUg5d8tbdkJAxz3T9CR0bgToEWvb2XL5eK+UuCP8PWWxHEVp0M12HNNkZ4bWIN6TPlT6N6cCR5lYHkpu9fdixwTNbOtNV9+NztD8CGPbaNZVUaGHNoyELwXvG+EM+m/Etltp56MIkNE9Ay/L78UWLdSrmMUcwauthQzEzX+Yu84fjWhu++Q7yEb4TOoiD7mbhaingsxrmBp0AzZSe+FPN+VRW+CIK2arnb0LPirpDsabQ2Ri5WB8zrTMMHLYkDXhqzoQNobtxxN1mdk723I0GqGXTCK4NQEidCMb8XyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5ZgQN6LygPuagSHDzbfYb7KNuPNG+N2Dz8NvMd0G4A=;
 b=Dkfh9HQBxgicZFslB6dbtvAKi67lD4x8kyQeNsJS/+QeEE6kt0JAzoyoy2vpi3HnLsj+GX9HzYBje9ULVeEAHyz52vOM7PQoYOVEuHFntgQeyG7In1YpvLt7HC5Y1sXn/c4Q7g+5dH8BFVsZlaXP1XGGqWhnkNU3/q5FEj8gOYE=
Received: from BYAPR11CA0070.namprd11.prod.outlook.com (2603:10b6:a03:80::47)
 by LV3PR10MB8107.namprd10.prod.outlook.com (2603:10b6:408:290::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 09:04:34 +0000
Received: from SJ1PEPF00001CE1.namprd05.prod.outlook.com
 (2603:10b6:a03:80:cafe::da) by BYAPR11CA0070.outlook.office365.com
 (2603:10b6:a03:80::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 09:04:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE1.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 09:04:34 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 03:04:32 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 03:04:32 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 03:04:32 -0600
Received: from [172.24.233.101] (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62594Uho2057356;
	Thu, 5 Mar 2026 03:04:30 -0600
Message-ID: <f51db6ac-21fc-4c54-bb39-10daca30ad8d@ti.com>
Date: Thu, 5 Mar 2026 14:34:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 1/4] arm-compute-library: upgrade
 24.12 -> 52.07
To: Andrew Davis <afd@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>, <khasim@ti.com>
References: <20260304123221.1450993-1-p-deshmukh@ti.com>
 <20260304123221.1450993-2-p-deshmukh@ti.com>
 <f3b918ba-5006-4667-8370-028927b20834@ti.com>
Content-Language: en-US
From: Pratham Deshmukh <p-deshmukh@ti.com>
In-Reply-To: <f3b918ba-5006-4667-8370-028927b20834@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE1:EE_|LV3PR10MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: 71c41ca3-9703-4fdb-e76c-08de7a963880
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|34020700016|376014|36860700016;
X-Microsoft-Antispam-Message-Info: 
	ZU4cQN4+6VLnCIw7isb2y6Qcw52SUyZmIEWLzyDsYq5zScSWJhuCLBv7+POAW1P9NnZouNtPSFvKEQ5vLWE3SYAsGgXDovLcf2W2WBHrfQc0CbGozKlIqDMcnsy3cFeYpvRp6xRlxyYLi3e05Ml71AOa3+39JgECK2PqPQlFu+9Znhj5uOy8YuX33qK9Jx7rQ4ssbcX2UMl18/Z5izhHz+oV4kQgBWWwyHBc2xDs/kxv2yTZNFaIxlIx6nY6GdNLCcrF+/1xBW6uMg4/N0K+uSvemO451D/2P+EKxwoicFjv/J6FTYI8tRnvDdfh34DLVBXpekkCqlfQm0XAAFgasaHupX0WfJayfTE/iwa18JJ0/p2ADt2fItws/OYYpF18E13Zpk6F0F446q5XdMAf1jEh0IN+g6vdIzVlwdlyx6c8DM1yqNhxApsDl0d29pxQWOVTRUISv+DF7EC6zTTqdm1AsHUvBqvLX7UHOvcU84I9JpzHtVE72jCLPLmo/lJLG2hs85e/gZa4iE+JOhYOuuAHQrzdkGgdp69gwd5tCK0jgrzOTxr1C53VkI42Ezolbd7pADW8FWTSnV3Uf5TBXsO0A0voGqFIC3tkXo5ZZ57zJo2vyXoAEd5RADW4yp0Gd7/ta9biz7c6U4kXNjswTREKD7GORl46iS/VIhrKrt3qLi0Yos76qWYogslJ/tfHuKKx4lWDQKQqNR1+2R9zBxazD9Is52fS/8U8ipZlCTqcg71pvaLk4r2LrgMkz/vVavVzF72Z3ssFpi5qjO77aw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(34020700016)(376014)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bnuR22IaL1w4Mgh/RlYVtuAdXX13OZ0FXRmOEushIp5lCrJUC1M25TncjZuD/2UmIridaiYEo6DMlVJxSNFUFLzWBaBbttehsDzb7dGHQAjog/fBrrM2LQr1oB/MM9gCsq8qQHLlljITXjVMrvPosxsYv4EB23QyqR4jiCDqV/wU6HfuGsKN7ialol7T1L9s3D/0AAkLIxz5HlrND/lgUrUSdY2LQs0m/RDFP32b0xHL2NQoPRfRHS8Bwf+bcfY3MhktC9MLBNCyYxFM+j5Y582KRYZJiOZ1yGS3HCOoYEUz/0zPv7/d/Mse6puQo0NRgQyYv4KXN8vz+uAGYIiDmgBh+V/zCybbeDbT/Lt2YxfRDBxDlBW75Ew3e9uacrlNz7ci7dmov5AGPrfXsrh9RDlh1KyVti/5b9PCcU7cnYDIZnzHOE4y4UFhwHru+bII
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 09:04:34.3556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c41ca3-9703-4fdb-e76c-08de7a963880
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8107
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 09:04:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17226


On 04/03/26 10:14 pm, Andrew Davis wrote:
> On 3/4/26 6:32 AM, Pratham Deshmukh wrote:
>> We are migrating ARM Compute Library from v24.12 to the
>> latest version v52.07
>>
>> Removed Patches:
>> =C2=A0 =E2=80=A2 0001-fix-Fix-indention-in-cmake-generator-script.patch
>> =C2=A0=C2=A0=C2=A0 - Upstream Link:=20
>> https://github.com/ARM-software/ComputeLibrary/commit/e0c42ef651709fd284=
da3bedd2c98d420bd6fd1a
>> =C2=A0 =E2=80=A2 0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.pa=
tch
>> =C2=A0=C2=A0=C2=A0 - No need for this patch for v52.07 ACL.
>>
>> Rebased Patches:
>> =C2=A0 =E2=80=A2 Following patches are updated with new commits
>> =C2=A0=C2=A0=C2=A0 - 0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checki=
ng-NEO.patch
>> =C2=A0=C2=A0=C2=A0 - 0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checkin=
g-SVE-.patch
>> =C2=A0=C2=A0=C2=A0 - 0004-Add-source-files-at-library-definition-time.pa=
tch
>> =C2=A0=C2=A0=C2=A0 - 0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-C=
Make.patch
>> =C2=A0=C2=A0=C2=A0 - 0007-Allow-ARMv7-builds-using-CMake.patch
>> =C2=A0=C2=A0=C2=A0 - 0008-Fix-undefined-symbol-error-when-building-Tenso=
rInfo.patch
>>
>> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
>> ---
>> =C2=A0 ...NABLE_NEON-in-code-for-checking-NEO.patch} |=C2=A0 72 ++---
>> =C2=A0 ...-indention-in-cmake-generator-script.patch | 130 ---------
>> =C2=A0 ...ENABLE_SVE-in-code-for-checking-SVE.patch} | 117 ++++-----
>> =C2=A0 ...ce-files-at-library-definition-time.patch} | 246 ++++++++++---=
-----
>> =C2=A0 .../0004-Allow-ARMv7-builds-using-CMake.patch | 174 +++++++++++++
>> =C2=A0 ...ptions-for-SVE-SVE2-and-BF16-support.patch | 112 --------
>> =C2=A0 ...mbol-error-when-building-TensorInfo.patch} |=C2=A0 24 +-
>> =C2=A0 ...SVE2-support-to-be-disabled-in-CMake.patch |=C2=A0 91 -------
>> =C2=A0 .../0006-Remove-TARGET-dependency.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 58 +++++
>> =C2=A0 .../0007-Allow-ARMv7-builds-using-CMake.patch |=C2=A0 86 ------
>> =C2=A0 ...rate-generic-library-name-instead-of.patch |=C2=A0 33 +++
>> =C2=A0 .../0008-Add-FP16-source-path.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 28 ++
>> =C2=A0 ..._24.12.bb =3D> arm-compute-library_52.07.bb} |=C2=A0 56 ++--
>> =C2=A0 13 files changed, 551 insertions(+), 676 deletions(-)
>> =C2=A0 rename=20
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-libra=
ry/{0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch=20
>> =3D> 0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch}=20
>> (58%)
>> =C2=A0 delete mode 100644=20
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-libra=
ry/0001-fix-Fix-indention-in-cmake-generator-script.patch
>> =C2=A0 rename=20
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-libra=
ry/{0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch=20
>> =3D> 0002-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE.patch} (67=
%)
>> =C2=A0 rename=20
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-libra=
ry/{0004-Add-source-files-at-library-definition-time.patch=20
>> =3D> 0003-Add-source-files-at-library-definition-time.patch} (24%)
>> =C2=A0 create mode 100644=20
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-libra=
ry/0004-Allow-ARMv7-builds-using-CMake.patch
>> =C2=A0 delete mode 100644=20
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-libra=
ry/0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch
>> =C2=A0 rename=20
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-libra=
ry/{0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch=20
>> =3D> 0005-Fix-undefined-symbol-error-when-building-TensorInfo.patch} (68=
%)
>> =C2=A0 delete mode 100644=20
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-libra=
ry/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch
>> =C2=A0 create mode 100644=20
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-libra=
ry/0006-Remove-TARGET-dependency.patch
>> =C2=A0 delete mode 100644=20
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-libra=
ry/0007-Allow-ARMv7-builds-using-CMake.patch
>> =C2=A0 create mode 100644=20
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-libra=
ry/0007-cmake-Generate-generic-library-name-instead-of.patch
>> =C2=A0 create mode 100644=20
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-libra=
ry/0008-Add-FP16-source-path.patch
>> =C2=A0 rename=20
>> meta-arago-extras/recipes-devtools/arm-compute-library/{arm-compute-libr=
ary_24.12.bb=20
>> =3D> arm-compute-library_52.07.bb} (58%)
>>
>
> Is the version 52.07? looks like they call it 52.7.0
>
> [...]
>
Yes its 52.7.0. Will change this.
>> diff --git=20
>> a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-lib=
rary_24.12.bb=20
>> b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-lib=
rary_52.07.bb=20
>>
>> similarity index 58%
>> rename from=20
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-libra=
ry_24.12.bb
>> rename to=20
>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-libra=
ry_52.07.bb
>> index 42e2f343..42040445 100644
>> ---=20
>> a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-lib=
rary_24.12.bb
>> +++=20
>> b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-lib=
rary_52.07.bb
>> @@ -1,20 +1,20 @@
>> =C2=A0 SUMMARY =3D "The ARM Computer Vision and Machine Learning library=
"
>> =C2=A0 DESCRIPTION =3D "The ARM Computer Vision and Machine Learning lib=
rary=20
>> is a set of functions optimised for both ARM CPUs and GPUs."
>> =C2=A0 LICENSE =3D "MIT"
>> -LIC_FILES_CHKSUM =3D=20
>> "file://LICENSES/MIT.txt;md5=3D35f8944fae972976691f3483b0ac9dba"
>> +LIC_FILES_CHKSUM =3D=20
>> "file://LICENSES/MIT.txt;md5=3D3912d958d00bac4a6b550f75d7c806bb"
>> =C2=A0 =C2=A0 SRC_URI =3D " \
>> -=20
>> git://github.com/ARM-software/ComputeLibrary.git;branch=3Darchived-relea=
ses;protocol=3Dhttps=20
>> \
>> - file://0001-fix-Fix-indention-in-cmake-generator-script.patch \
>> -=20
>> file://0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch \
>> -=20
>> file://0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch \
>> - file://0004-Add-source-files-at-library-definition-time.patch \
>> - file://0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch \
>> - file://0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch \
>> -=C2=A0=C2=A0=C2=A0 file://0007-Allow-ARMv7-builds-using-CMake.patch \
>> -=20
>> file://0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch \
>> +=20
>> git://github.com/ARM-software/ComputeLibrary.git;branch=3Dreleases/arm_c=
ompute_52_7_0;protocol=3Dhttps=20
>> \
>> +=20
>> file://0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch \
>> +=20
>> file://0002-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE.patch \
>> + file://0003-Add-source-files-at-library-definition-time.patch \
>> +=C2=A0=C2=A0=C2=A0 file://0004-Allow-ARMv7-builds-using-CMake.patch \
>
> Mixing tabs/spaces. Don't care which you use in a multi-line list,=20
> just be consistent.
>
> Andrew
>
Ok
>> +=20
>> file://0005-Fix-undefined-symbol-error-when-building-TensorInfo.patch \
>> +=C2=A0=C2=A0=C2=A0 file://0006-Remove-TARGET-dependency.patch \
>> + file://0007-cmake-Generate-generic-library-name-instead-of.patch \
>> +=C2=A0=C2=A0=C2=A0 file://0008-Add-FP16-source-path.patch \
>> =C2=A0 "
>> -SRCREV =3D "32bcced2af7feea6969dd1d22e58d0718dc488e3"
>> +SRCREV =3D "c9a1fff898abd5109b759e8e16616519dc758fdd"
>> =C2=A0 =C2=A0 # Only compatible with armv7a, armv7ve, and aarch64
>> =C2=A0 COMPATIBLE_MACHINE =3D "(^$)"
>> @@ -33,17 +33,26 @@ PACKAGECONFIG[cppthreads] =3D=20
>> "-DARM_COMPUTE_CPPTHREADS=3DON,-DARM_COMPUTE_CPPTHREAD
>> =C2=A0 PACKAGECONFIG[openmp] =3D=20
>> "-DARM_COMPUTE_OPENMP=3DON,-DARM_COMPUTE_OPENMP=3DOFF"
>> =C2=A0 =C2=A0 EXTRA_OECMAKE:append:aarch64 =3D " \
>> -=C2=A0=C2=A0=C2=A0 -DARM_COMPUTE_ARCH=3Darmv8-a \
>> -=C2=A0=C2=A0=C2=A0 -DENABLE_NEON=3DON \
>> -=C2=A0=C2=A0=C2=A0 -DENABLE_SVE=3DOFF \
>> -=C2=A0=C2=A0=C2=A0 -DENABLE_SVE2=3DOFF \
>> +=C2=A0=C2=A0=C2=A0 -DACL_MULTI_ISA=3DOFF \
>> +=C2=A0=C2=A0=C2=A0 -DACL_ARCH_ISA=3Darmv8-a \
>> +=C2=A0=C2=A0=C2=A0 -DACL_BUILD_SVE=3DOFF \
>> +=C2=A0=C2=A0=C2=A0 -DACL_BUILD_SVE2=3DOFF \
>> +=C2=A0=C2=A0=C2=A0 -DCMAKE_BUILD_TYPE=3DRelease \
>> +=C2=A0=C2=A0=C2=A0 -DARM_COMPUTE_ENABLE_BF16=3DOFF \
>> +=C2=A0=C2=A0=C2=A0 -DARM_COMPUTE_ENABLE_FP16=3DOFF \
>> +=C2=A0=C2=A0=C2=A0 -DARM_COMPUTE_ENABLE_I8MM=3DOFF \
>> +=C2=A0=C2=A0=C2=A0 -DARM_COMPUTE_ASSERTS_ENABLED=3DON \
>> +=C2=A0=C2=A0=C2=A0 -DARM_COMPUTE_ENABLE_FIXED_FORMAT_KERNELS=3DOFF \
>> =C2=A0 "
>> =C2=A0 EXTRA_OECMAKE:append:arm =3D " \
>> -=C2=A0=C2=A0=C2=A0 -DARM_COMPUTE_ARCH=3Darmv7-a \
>> -=C2=A0=C2=A0=C2=A0 -DENABLE_NEON=3DON \
>> -=C2=A0=C2=A0=C2=A0 -DENABLE_SVE=3DOFF \
>> -=C2=A0=C2=A0=C2=A0 -DENABLE_SVE2=3DOFF \
>> +=C2=A0=C2=A0=C2=A0 -DACL_MULTI_ISA=3DOFF \
>> +=C2=A0=C2=A0=C2=A0 -DACL_ARCH_ISA=3Darmv7 \
>> +=C2=A0=C2=A0=C2=A0 -DACL_BUILD_SVE=3DOFF \
>> +=C2=A0=C2=A0=C2=A0 -DACL_BUILD_SVE2=3DOFF \
>> +=C2=A0=C2=A0=C2=A0 -DCMAKE_BUILD_TYPE=3DRelease \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DARM_COMPUTE_ENABLE_BF16=3DOFF \
>> +=C2=A0=C2=A0=C2=A0 -DARM_COMPUTE_ENABLE_FP16=3DOFF \
>> +=C2=A0=C2=A0=C2=A0 -DARM_COMPUTE_ASSERTS_ENABLED=3DON \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DARM_COMPUTE_ENABLE_FIXED_FORMAT_KERNELS=
=3DOFF \
>> =C2=A0 "
>> =C2=A0 @@ -80,8 +89,15 @@ do_install:append() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 install -m 0555 $example=20
>> ${D}${bindir}/${PN}-${PV}/examples
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>> +
>> +=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('PACKAGECONFIG', 'tests', 't=
rue',=20
>> 'false', d)}; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d=
 ${D}${bindir}/${PN}-${PV}/tests
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Copy the=
 validation and benchmark binaries from the=20
>> build directory
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m=
 0555 ${B}/arm_compute_validation=20
>> ${D}${bindir}/${PN}-${PV}/tests
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m=
 0555 ${B}/arm_compute_benchmark=20
>> ${D}${bindir}/${PN}-${PV}/tests
>> +=C2=A0=C2=A0=C2=A0 fi
>> =C2=A0 }
>> =C2=A0 =C2=A0 PACKAGES =3D+ "${PN}-tests ${PN}-examples"
>> -FILES:${PN}-tests +=3D "${libdir}/tests"
>> +FILES:${PN}-tests +=3D "${bindir}/*/tests"
>> =C2=A0 FILES:${PN}-examples +=3D "${bindir}/*/examples"
>

