Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56EB9EF9003
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 16:45:06 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23008.1772642703115727363
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 08:45:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=nurOdaqD;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.67, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n15mIFdzEH64eLwJqqEiW8MJHtDf4xDWHs3BWu6iufeVDJgb3QrFhML769lYMsCWhbRBx8jPkJ2Vg09vkqB0ZDHUVe3yOeQBf3muIu9mOuF5HOYuQgDSGSbBmBCaImGNJB6KFI7bhGhau9eonG5NaIhl7PIhe2iPTmr6eO4f3gyYGXDvAPwgfhqB0tzcfO5+YeS2E8KU6BzU60noDG1/P0hYCl01g+YhrVshsu2Fs1GoieTEqz0+LBl+Cm+3NUi5UgpAkY4KS3Y2UQ6jnWLupUzHvYzMOBiNofTh6r7XQlmlt3yWcA9WTT10M2VcP5Sh1+Viu7W3KAZHlmClFAfxQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80cwjsMV1LtmSTcqGAtVGsrb4+pW+EZLPeiBGJD5Tkw=;
 b=d9E0Pn1BG6fpDvDzBejD3J6UMDLaze4Ho/GOHt+DZvOhQ1b6z8kQFRPtz1tisByaQwcaEU454zZ3mWoAea1ybAikRNonI5gVREY0dk8a/Nmi1zEL52kVoDi0hGfVRQ1nLpaFFgDKtvVNdTPc/9qIgCk4l/2ybVesp7Se8pJur9i5M+1YhezjmidAIzunm2mv9n/zKsjcG1sKMPYmLFDfhziULwaU9Nc3G7ylE5oAzSOHEw6Y6gCeWS04mn2AGGfXyjYveqXXyLAtdElpJVr8+AhnoLq7q8jUtwc1wnXtOMMdAxx6EZ/+wzSUVArgB1mgACs/+Izi9LG9Fzmjaj9EFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80cwjsMV1LtmSTcqGAtVGsrb4+pW+EZLPeiBGJD5Tkw=;
 b=nurOdaqD9dXSzDuBtVtPx40vwQ5bQaIwqJh2QoF51gZAdDf8OyDQpIEBDLWbCPm8QNxxqQyCUpT/cFk4C4TNDd5PjK13xETLduk6BO7G4P2oRzM2fjHgWQkL3Eghm2sJubaNGdIcskvRaQsJl7tvl6UMSf9i5ZOrfORQrWIfrXg=
Received: from SJ0PR13CA0148.namprd13.prod.outlook.com (2603:10b6:a03:2c6::33)
 by CH3PR10MB7610.namprd10.prod.outlook.com (2603:10b6:610:171::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 16:44:58 +0000
Received: from SJ1PEPF000023D5.namprd21.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::2c) by SJ0PR13CA0148.outlook.office365.com
 (2603:10b6:a03:2c6::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Wed,
 4 Mar 2026 16:44:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023D5.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Wed, 4 Mar 2026 16:44:58 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 10:44:56 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 10:44:56 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 10:44:56 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 624GitK9713513;
	Wed, 4 Mar 2026 10:44:55 -0600
Message-ID: <f3b918ba-5006-4667-8370-028927b20834@ti.com>
Date: Wed, 4 Mar 2026 10:44:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 1/4] arm-compute-library: upgrade
 24.12 -> 52.07
To: Pratham Deshmukh <p-deshmukh@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>, <khasim@ti.com>
References: <20260304123221.1450993-1-p-deshmukh@ti.com>
 <20260304123221.1450993-2-p-deshmukh@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260304123221.1450993-2-p-deshmukh@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D5:EE_|CH3PR10MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a716d1-9465-4964-d897-08de7a0d5f30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34020700016|36860700016|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	nT6hTZeq7dAOKuJ0ZcJC+felwG23Jgr+2VFtPlpRmQCOAtjUryIKk+s19zlo/fa7GJypp4CMzYlEdSQiBiy0EANZT3r7zX9N3LKdixTbQUZ/mGLIRA2GDLo3hvzheEiRszWsS5MX8MqjvGktlPaKnwCC51clJoXc67JCfaunerTlJgnYHJEEs+6EhMbBw347DqtKJcNDVhUiRtrX9JUOETD/VdSrgYRxCuAD99uTzXPAGuvnvpZVgwLxeE2Jn085vTcuE2BLSXTX06rT2vmZVZQ9yGxlUaB6V6DETLTtUIIpJwzDQKHA1FxCPr13H/M5aUh6R8u3MKlgnY+mCJOLWmh5b7UoWxbfTuZnCqQJvPaIPd5feAkN/C86xUbC/LOUJo9pJbWCvm533I63lUb7b7r28w8MxECK36bPPzfee2G9V4wPxa/s7ayb+fHnJ6+fcVT/BUEJr+b17OzjfOH8divkQ0hlVtjJyLRASIhPJDJiCztPZm38bMTc5cSmQQOFhYQWy66OE/XCZ01X88FkQ+I8l6kOvQu3WTGjI5o4o7sXH4/5R9+H70604/iuyUqd4INn1ypvqpi9Tq3vTuq/v9KlLCgHvpqOmiNqfaqXDUK8D8zT6bIEBa+WZznhUDIPkFgAafqXeAAh1oNdsOsezkTuSFVnCCfbextEkFNAxic/xJjUW0OP9JitXp/5MnHRwirRaft4W5QLF7z6fCf5C4MZn9Bt5sdkIMectniWBsAg6j1jBki7qlBQuxaiCjmu6IwbMpWoEwaJyzFVZ1tsTQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(34020700016)(36860700016)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qJP2XCVyve4MHLhUPU3ZZR8wyECYU3uekwlogsQ5Uso6mvWZs99mPgn5QhcvZ89Puc0+tbPWBqUUPO4dQXJRNj/xWPipwikZKg1V5nTzavdKv70SBVsReE18kIjIQ9nZAXDtuR2db6XsSeg7TWbYlTs/wqFeqzf4AZ7X2/33LfktclT8BEuBhjWKaUHRpU9witSeuXBikrVjTbUOx2HWhxMOdy4D5cOXfxKIzkiFYIoGYoPJpdf9LE51jJVQr3DfV3t8dEGzdZPdpf5C0RjYBrvgtOcl3VksU75fS2T00W0Tljb04Wio8cDYxmmwaC4eIRu/L9Q1CAeF6eHMpxUTM/dC9vZAUPiBW46MuFO6jO3CF3+IgMLvC6pZ6bPN937OTbfCe1AqIYZRTgUStStAT2LMfhdVJa+u282T6z5z56+wwYR+d6+ZV7sAqTKsa/Z7
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 16:44:58.1339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a716d1-9465-4964-d897-08de7a0d5f30
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D5.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7610
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Mar 2026 16:45:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17221

On 3/4/26 6:32 AM, Pratham Deshmukh wrote:
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
> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
> ---
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
>   ..._24.12.bb =3D> arm-compute-library_52.07.bb} |  56 ++--
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
ute-library_24.12.bb =3D> arm-compute-library_52.07.bb} (58%)
>=20

Is the version 52.07? looks like they call it 52.7.0

[...]

> diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-c=
ompute-library_24.12.bb b/meta-arago-extras/recipes-devtools/arm-compute-li=
brary/arm-compute-library_52.07.bb
> similarity index 58%
> rename from meta-arago-extras/recipes-devtools/arm-compute-library/arm-co=
mpute-library_24.12.bb
> rename to meta-arago-extras/recipes-devtools/arm-compute-library/arm-comp=
ute-library_52.07.bb
> index 42e2f343..42040445 100644
> --- a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library_24.12.bb
> +++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library_52.07.bb
> @@ -1,20 +1,20 @@
>   SUMMARY =3D "The ARM Computer Vision and Machine Learning library"
>   DESCRIPTION =3D "The ARM Computer Vision and Machine Learning library i=
s a set of functions optimised for both ARM CPUs and GPUs."
>   LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSES/MIT.txt;md5=3D35f8944fae972976691f=
3483b0ac9dba"
> +LIC_FILES_CHKSUM =3D "file://LICENSES/MIT.txt;md5=3D3912d958d00bac4a6b55=
0f75d7c806bb"
>  =20
>   SRC_URI =3D " \
> -    git://github.com/ARM-software/ComputeLibrary.git;branch=3Darchived-r=
eleases;protocol=3Dhttps \
> -    file://0001-fix-Fix-indention-in-cmake-generator-script.patch \
> -    file://0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.pat=
ch \
> -    file://0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.pat=
ch \
> -    file://0004-Add-source-files-at-library-definition-time.patch \
> -    file://0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch \
> -    file://0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch=
 \
> -    file://0007-Allow-ARMv7-builds-using-CMake.patch \
> -    file://0008-Fix-undefined-symbol-error-when-building-TensorInfo.patc=
h \
> +    git://github.com/ARM-software/ComputeLibrary.git;branch=3Dreleases/a=
rm_compute_52_7_0;protocol=3Dhttps \
> +    file://0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.pat=
ch \
> +    file://0002-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE.patc=
h \
> +    file://0003-Add-source-files-at-library-definition-time.patch \
> +	file://0004-Allow-ARMv7-builds-using-CMake.patch \

Mixing tabs/spaces. Don't care which you use in a multi-line list, just be =
consistent.

Andrew

> +	file://0005-Fix-undefined-symbol-error-when-building-TensorInfo.patch \
> +    file://0006-Remove-TARGET-dependency.patch \
> +    file://0007-cmake-Generate-generic-library-name-instead-of.patch \
> +    file://0008-Add-FP16-source-path.patch \
>   "
> -SRCREV =3D "32bcced2af7feea6969dd1d22e58d0718dc488e3"
> +SRCREV =3D "c9a1fff898abd5109b759e8e16616519dc758fdd"
>  =20
>   # Only compatible with armv7a, armv7ve, and aarch64
>   COMPATIBLE_MACHINE =3D "(^$)"
> @@ -33,17 +33,26 @@ PACKAGECONFIG[cppthreads] =3D "-DARM_COMPUTE_CPPTHREA=
DS=3DON,-DARM_COMPUTE_CPPTHREAD
>   PACKAGECONFIG[openmp] =3D "-DARM_COMPUTE_OPENMP=3DON,-DARM_COMPUTE_OPEN=
MP=3DOFF"
>  =20
>   EXTRA_OECMAKE:append:aarch64 =3D " \
> -	-DARM_COMPUTE_ARCH=3Darmv8-a \
> -	-DENABLE_NEON=3DON \
> -	-DENABLE_SVE=3DOFF \
> -	-DENABLE_SVE2=3DOFF \
> +	-DACL_MULTI_ISA=3DOFF \
> +	-DACL_ARCH_ISA=3Darmv8-a \
> +	-DACL_BUILD_SVE=3DOFF \
> +	-DACL_BUILD_SVE2=3DOFF \
> +	-DCMAKE_BUILD_TYPE=3DRelease \
> +	-DARM_COMPUTE_ENABLE_BF16=3DOFF \
> +	-DARM_COMPUTE_ENABLE_FP16=3DOFF \
> +	-DARM_COMPUTE_ENABLE_I8MM=3DOFF \
> +	-DARM_COMPUTE_ASSERTS_ENABLED=3DON \
> +	-DARM_COMPUTE_ENABLE_FIXED_FORMAT_KERNELS=3DOFF \
>   "
>   EXTRA_OECMAKE:append:arm =3D " \
> -	-DARM_COMPUTE_ARCH=3Darmv7-a \
> -	-DENABLE_NEON=3DON \
> -	-DENABLE_SVE=3DOFF \
> -	-DENABLE_SVE2=3DOFF \
> +	-DACL_MULTI_ISA=3DOFF \
> +	-DACL_ARCH_ISA=3Darmv7 \
> +	-DACL_BUILD_SVE=3DOFF \
> +	-DACL_BUILD_SVE2=3DOFF \
> +	-DCMAKE_BUILD_TYPE=3DRelease \
>   	-DARM_COMPUTE_ENABLE_BF16=3DOFF \
> +	-DARM_COMPUTE_ENABLE_FP16=3DOFF \
> +	-DARM_COMPUTE_ASSERTS_ENABLED=3DON \
>   	-DARM_COMPUTE_ENABLE_FIXED_FORMAT_KERNELS=3DOFF \
>   "
>  =20
> @@ -80,8 +89,15 @@ do_install:append() {
>   			install -m 0555 $example ${D}${bindir}/${PN}-${PV}/examples
>   		done
>   	fi
> +
> +	if ${@bb.utils.contains('PACKAGECONFIG', 'tests', 'true', 'false', d)};=
 then
> +   		install -d ${D}${bindir}/${PN}-${PV}/tests
> +   		# Copy the validation and benchmark binaries from the build directo=
ry
> +   		install -m 0555 ${B}/arm_compute_validation ${D}${bindir}/${PN}-${P=
V}/tests
> +   		install -m 0555 ${B}/arm_compute_benchmark ${D}${bindir}/${PN}-${PV=
}/tests
> +	fi
>   }
>  =20
>   PACKAGES =3D+ "${PN}-tests ${PN}-examples"
> -FILES:${PN}-tests +=3D "${libdir}/tests"
> +FILES:${PN}-tests +=3D "${bindir}/*/tests"
>   FILES:${PN}-examples +=3D "${bindir}/*/examples"


