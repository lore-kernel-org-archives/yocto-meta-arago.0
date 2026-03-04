Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7129EF9010
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 16:51:37 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23202.1772643095706364087
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 08:51:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=TU4x0p8h;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.57, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZVqTPvyWl1NE8kQUIRzWk+Y3Yzy1J4rdFv1/TP2M/bh5PYI+V1dE3+TTg0+ztfyWS8ejkihoz30/A1tKWdIMKMpM6WvAtCCWpo9rLrXodigBWpUHIRb92XcgrjsZHCFYaxgaVb8qQ9aGhdldWxeLUwdhIpbV/gM2WkmDPQ8swKztygOOpKM9vF9DreGjWY+Vx6JHSSp6+5KZ7YctjIowlhZiObzNsKcGf+2mQQjNvYPdin6OqoR4oI+V/tO2Grjpwwv8W5tw3d06MNlcYkmzZ0RaJ/18ZNs3UJ7u1B8VGRxePtzypVxnJgsA02WmuX803FL5P14jBMPio7mqqqXqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnqcJdT0JLMlIdUkAADLUO06CFm4nBTKI1VtldRMnuE=;
 b=CWHaK6qS7A0FlgnTfg2KYWnaMl4sX2VskNVKrAFR8WBY1z/NZUAlZWMxpqL1XVEFat3EwUvzrcxKukiku5II0baLup5ZSFK4sEa6L/tobWqBIfrVqiDKS5yncXNUwMTE2yHSedruNe3yxpLbqLw3laYw77sJJgraFjVPNYyr65D3pL+Pwl//zGDcA2cnq/EwtuUTuvUwtLnfFtt+459OgMkKkqImCjIA/KQ/GEwoEn7+vOxhqwotUveaWd3js/cmOMQsBFoVYLke3O9sJT15c9rvc1Ej3OLS0Y+asxM3AJelIVwPfM17EqivKSfjLLENX+4Hz9werIl6+j20aaRm4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnqcJdT0JLMlIdUkAADLUO06CFm4nBTKI1VtldRMnuE=;
 b=TU4x0p8hbW1ERuGu/iPVMe4UJkwA0V6IRls3AzSZWaHQ7HzHo3HULDnOJN1R9LV32A6/rElyu7IovSOYpSBXFGqp6S+40zRSiJciVdSnFX2w5Ljx30IN7edTB5cXRXDLFXweaTTaGODLcLzV9+coR0sVxWqhPIK2PiGv53RnPy0=
Received: from SA9PR13CA0061.namprd13.prod.outlook.com (2603:10b6:806:23::6)
 by CH3PR10MB7118.namprd10.prod.outlook.com (2603:10b6:610:12b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 16:51:28 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:806:23:cafe::d5) by SA9PR13CA0061.outlook.office365.com
 (2603:10b6:806:23::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.13 via Frontend Transport; Wed,
 4 Mar 2026 16:51:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 16:51:28 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 10:51:11 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 10:51:11 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 10:51:10 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 624GpAn7722726;
	Wed, 4 Mar 2026 10:51:10 -0600
Message-ID: <192559e1-e712-4342-9a86-4cc8e54a402f@ti.com>
Date: Wed, 4 Mar 2026 10:51:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 3/4] tensorflow-lite: upgrade 2.18.0
 -> 2.20.0
To: Pratham Deshmukh <p-deshmukh@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>, <khasim@ti.com>
References: <20260304123221.1450993-1-p-deshmukh@ti.com>
 <20260304123221.1450993-4-p-deshmukh@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260304123221.1450993-4-p-deshmukh@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|CH3PR10MB7118:EE_
X-MS-Office365-Filtering-Correlation-Id: ce283df7-833c-42d9-a2ec-08de7a0e47bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|376014|1800799024|82310400026|36860700016|7142099003;
X-Microsoft-Antispam-Message-Info: 
	5/FFbAWcq/jmlth0wQ8NAHy2B9QoBofg0X6HY7hiqjnQfT1+ec83qnEXkgHWV4SQVHKk6N4YLxBj1JHE1H/RpO5nPTIbf1G3AFHWm8qw4gAWY7PoIqGdH+LBGII375wetGT1FEpoNt0DSkv/uiSSTJwBOAei+zA2AkgIl8Rykxps4pb/nWvUPZ/Fg4/IKq4+Cg3dbr2k5/dZwYu01zlQb+chkXjqtBOAYSgJEFEmElxG7i28KcSSa9XrOSt/DHCi/QWCWUQD/MBcQnAphy8gD5QVGIpc767dkLmxdpAhcI2tYCpYin7ZBdJge76xrOoeU5Bak4i45dW8LT4pq12R+LaK5Db5J0RYsu/Ntmq48J1Zl9EIIFr/YHsymhXui09tQV8OlaQduUPEeMdHr32tiDmKAEkpy1yF7viUBeaacchdDJBp5OYwb5rB0nFYc+66NBHDk77p2GvHjwQrY7saWQnCqx/jinOeh09NbLAunjftT3H1dfUEiGq1YhpGQFj8Fb5B4BFOXaWwPk5tnJPDyyUB54f1ZVR+M16M2igE96e2PbOgsIL6w10Ae4IiRZlwr52eP63Ij5/S5xQ0k1zsmeRwBFoF3RMlUQ4tayIH0RlpEXz2M9soyl+JTsUpiL8MyZRpjlhkJYzaRX/wwnwgEIwTjT0Tr9yZQuVAfdEu3oeaqPC62cMI8aiK/bqqqcNGjFNZYFGWaAKswcCsYUBHQfRwQrZwUxZFEpG5iMcNP5k=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(376014)(1800799024)(82310400026)(36860700016)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ba7ZiLCP/1vLYrXXUOanQvHrrBmyygCpL6k6MK/Whx4NjAHH7nnzcdqd7SOFIpAQlFpPjodRtejZQ5SvtkT9EuHm9tDAbT9frmuqE9BuOG4w2qguhrsAB8+PWN5pxbsfBK3r8LRsycz/jJCav7fO4F51Mn9lQCm0ScoJcFrp8CizfuJbfiE4eM7Sy1Rxi4frxHdoh28lGq2ROmUBT7SxTTlmRJamPFChtCnxHsNZCF8407UfOc7+PxwiAwDybsemTwLxeaL2c4e5xb49lYiifgrm2IV2ZfFeEt85ReTpi049SAaAIzUSuM5vTzK+CqSt2R7dA38m4/isWLolmYJGW+rK7mu6+ZbqWBeAyl9bXzQhLoaRRDKW8HulAZSUNBYC4lNq1RGfoFJ91l0k5ec9K0yUCkFKKIhlRXIIG/9d8vCRYFhRoWTpvswoi/ZZRfPj
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 16:51:28.4155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce283df7-833c-42d9-a2ec-08de7a0e47bc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7118
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Mar 2026 16:51:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17222

On 3/4/26 6:32 AM, Pratham Deshmukh wrote:
> We are migrating Tensorflow-Lite from v2.18.0 to the
> stable release v2.20.0
> 
> Key Changes:
>   - Pin flatbuffers-native and protobuf-native to use the same version as
>     TensorFlow Lite 2.20.0 to avoid version mismatch
>   - Updated SRCREV for all the dependencies
>   - Updated recipe to meet the build compatibilty
> 
> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
> ---
>   .../flatbuffers/flatbuffers-arago.inc         |  8 +++
>   .../flatbuffers/flatbuffers.bbappend          |  4 ++
>   .../protobuf/protobuf-arago.inc               | 18 +++++++
>   .../protobuf/protobuf_%.bbappend              |  5 ++
>   ...te_2.18.0.bb => tensorflow-lite_2.20.0.bb} | 52 ++++++++++---------
>   5 files changed, 62 insertions(+), 25 deletions(-)
>   create mode 100644 meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-arago.inc
>   create mode 100644 meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbappend
>   create mode 100644 meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc
>   create mode 100644 meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend
>   rename meta-arago-extras/recipes-framework/tensorflow-lite/{tensorflow-lite_2.18.0.bb => tensorflow-lite_2.20.0.bb} (86%)
> 
> diff --git a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-arago.inc b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-arago.inc
> new file mode 100644
> index 00000000..d85efc8b
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-arago.inc
> @@ -0,0 +1,8 @@
> +# Pin flatbuffers-native to use the same version as TensorFlow Lite 2.20.0
> +# to avoid version mismatch errors
> +
> +# Override version to match
> +PV = "24.3.25"
> +
> +# Use specific commit hash that corresponds to v24.3.25 tag
> +SRCREV = "595bf0007ab1929570c7671f091313c8fc20644e"
> diff --git a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbappend b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbappend
> new file mode 100644
> index 00000000..2a627698
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbappend
> @@ -0,0 +1,4 @@
> +# Conditionally include Arago-specific customizations for flatbuffers-native
> +FLATBUFFERS_ARAGO = ""
> +FLATBUFFERS_ARAGO:arago = "flatbuffers-arago.inc"
> +require ${FLATBUFFERS_ARAGO}
> diff --git a/meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc b/meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc
> new file mode 100644
> index 00000000..489b1444
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc
> @@ -0,0 +1,18 @@
> +# Pin protobuf-native to use the same version as TensorFlow Lite 2.20.0
> +# to avoid version mismatch errors
> +
> +# Override version to match
> +PV = "3.21.9"
> +
> +# Use specific commit hash that corresponds to v24.3.25 tag
> +SRCREV = "90b73ac3f0b10320315c2ca0d03a5a9b095d2f66"
> +
> +# Override SRC_URI to use 3.21.x branch and remove incompatible patches
> +SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=main;protocol=https \
> +           file://run-ptest \
> +          "
> +
> +LIC_FILES_CHKSUM = " \
> +    file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b \
> +    file://third_party/utf8_range/LICENSE;md5=ef460f31070fd7184bd9059de2e4b132 \
> +"
> diff --git a/meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend b/meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend
> new file mode 100644
> index 00000000..51c679a5
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend
> @@ -0,0 +1,5 @@
> +# Conditionally include Arago-specific customizations for flatbuffers-native
> +PROTOBUF_ARAGO = ""
> +PROTOBUF_ARAGO:arago = "protobuf-arago.inc"
> +
> +require ${PROTOBUF_ARAGO}
> diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.18.0.bb b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb
> similarity index 86%
> rename from meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.18.0.bb
> rename to meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb
> index c76939ac..57278f5b 100644
> --- a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.18.0.bb
> +++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb
> @@ -8,18 +8,19 @@ LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=4158a261ca7f2525513e31ba9c50ae98"
>   
>   # Get major of the PV variable
> -MAJOR = "${@d.getVar('PV').split('.')[0]}"
> +TF_MAJOR = "${@d.getVar('PV').split('.')[0]}"
> +TF_MINOR = "${@d.getVar('PV').split('.')[1]}"
> +TF_PATCH = "${@(d.getVar('PV').split('.') + ['0', '0'])[2]}"
>   
>   SRC_URI = " \
> -    git://github.com/tensorflow/tensorflow.git;protocol=https;branch=r2.18 \
> +    git://github.com/tensorflow/tensorflow.git;protocol=https;branch=r2.20 \
>       file://0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch \
>       file://0002-lite-Update-CMakeLists-for-building-shared-object-li.patch \
> -    file://0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patch \
>       file://tensorflow2-lite.pc.in \
>   "
>   
>   SRC_URI += " \
> -    git://github.com/abseil/abseil-cpp.git;protocol=https;branch=lts_2023_08_02;name=abseil-cpp;destsuffix=${S}/external/abseil-cpp \
> +    git://github.com/abseil/abseil-cpp.git;protocol=https;branch=lts_2025_01_27;name=abseil-cpp;destsuffix=${S}/external/abseil-cpp \
>       git://gitlab.com/libeigen/eigen.git;protocol=https;branch=master;name=eigen;destsuffix=${S}/external/eigen \
>       git://github.com/google/farmhash.git;protocol=https;branch=master;name=farmhash;destsuffix=${S}/external/farmhash \
>       git://github.com/petewarden/OouraFFT.git;protocol=https;branch=master;name=fft2d;destsuffix=${S}/external/fft2d \
> @@ -28,35 +29,35 @@ SRC_URI += " \
>       git://github.com/jax-ml/ml_dtypes.git;branch=main;protocol=https;name=ml_dtypes;destsuffix=${S}/external/ml_dtypes \
>       git://github.com/google/ruy.git;branch=master;protocol=https;name=ruy;destsuffix=${S}/external/ruy \
>       git://github.com/google/flatbuffers;branch=master;protocol=https;name=flatbuffers;destsuffix=${S}/external/flatbuffers \
> -    git://github.com/Maratyszcza/pthreadpool.git;branch=master;protocol=https;name=pthreadpool-source;destsuffix=${S}/external/pthreadpool-source \
> +    git://github.com/google/pthreadpool.git;branch=main;protocol=https;name=pthreadpool-source;destsuffix=${S}/external/pthreadpool-source \
>       git://github.com/google/XNNPACK.git;branch=master;protocol=https;name=xnnpack;destsuffix=${S}/external/xnnpack \
>       git://github.com/Maratyszcza/FXdiv.git;branch=master;protocol=https;name=FXdiv-source;destsuffix=${S}/external/FXdiv-source \
>       git://github.com/Maratyszcza/FP16.git;branch=master;protocol=https;name=FP16-source;destsuffix=${S}/external/FP16-source \
>       git://git.gitlab.arm.com/kleidi/kleidiai.git;branch=main;protocol=https;name=kleidiai;destsuffix=${S}/external/kleidiai \
>       git://github.com/Maratyszcza/psimd.git;branch=master;protocol=https;name=psimd;destsuffix=${S}/external/psimd \
> -    git://github.com/protocolbuffers/protobuf.git;branch=25.x;protocol=https;name=protobuf;destsuffix=${S}/external/protobuf \
> +    git://github.com/protocolbuffers/protobuf.git;branch=main;protocol=https;name=protobuf;destsuffix=${S}/external/protobuf \
>   "
>   
>   SRCREV_FORMAT = "default"
>   
>   # Matches v${PV} tag
> -SRCREV = "6550e4bd80223cdb8be6c3afd1f81e86a4d433c3"
> -SRCREV_abseil-cpp = "fb3621f4f897824c0dbe0615fa94543df6192f30"
> +SRCREV = "72fbba3d20f4616d7312b5e2b7f79daf6e82f2fa"
> +SRCREV_abseil-cpp = "d9e4955c65cd4367dd6bf46f4ccb8cd3d100540b"
>   SRCREV_eigen = "33d0937c6bdf5ec999939fb17f2a553183d14a74"
>   SRCREV_farmhash = "0d859a811870d10f53a594927d0d0b97573ad06d"
>   SRCREV_fft2d = "c6fd2dd6d21397baa6653139d31d84540d5449a2"
>   SRCREV_gemmlowp = "16e8662c34917be0065110bfcd9cc27d30f52fdf"
> -SRCREV_cpuinfo = "b73ae6ce38d5dd0b7fe46dbe0a4b5f4bab91c7ea"
> +SRCREV_cpuinfo = "de0ce7c7251372892e53ce9bc891750d2c9a4fd8"
>   SRCREV_ml_dtypes = "24084d9ed2c3d45bf83b7a9bff833aa185bf9172"
>   SRCREV_ruy = "3286a34cc8de6149ac6844107dfdffac91531e72"
>   SRCREV_flatbuffers = "e6463926479bd6b330cbcf673f7e917803fd5831"
> -SRCREV_pthreadpool-source = "4fe0e1e183925bf8cfa6aae24237e724a96479b8"
> -SRCREV_xnnpack = "6b83f69d4938da4dc9ad63c00bd13e9695659a51"
> +SRCREV_pthreadpool-source = "c2ba5c50bb58d1397b693740cf75fad836a0d1bf"
> +SRCREV_xnnpack = "585e73e63cb35c8a416c83a48ca9ab79f7f7d45e"
>   SRCREV_FXdiv-source = "63058eff77e11aa15bf531df5dd34395ec3017c8"
> -SRCREV_FP16-source = "0a92994d729ff76a58f692d3028ca1b64b145d91"
> -SRCREV_kleidiai = "cddf991af5de49fd34949fa39690e4e906e04074"
> +SRCREV_FP16-source = "4dfe081cf6bcd15db339cf2680b9281b8451eeb3"
> +SRCREV_kleidiai = "dc69e899945c412a8ce39ccafd25139f743c60b1"
>   SRCREV_psimd = "072586a71b55b7f8c584153d223e95687148a900"
> -SRCREV_protobuf = "4a2aef570deb2bfb8927426558701e8bfc26f2a4"
> +SRCREV_protobuf = "90b73ac3f0b10320315c2ca0d03a5a9b095d2f66"
>   
>   inherit setuptools3 cmake
>   
> @@ -91,7 +92,7 @@ OECMAKE_SOURCEPATH = "${S}/tensorflow/lite"
>   # to further optimize the build for production use.
>   # Hence, activate -O3 optimization and disable debug symbols.
>   OECMAKE_C_FLAGS_RELEASE = "-O3 -DNDEBUG"
> -OECMAKE_CXX_FLAGS_RELEASE = "-O3 -DNDEBUG -flax-vector-conversions"
> +OECMAKE_CXX_FLAGS_RELEASE = "-O3 -DNDEBUG -flax-vector-conversions -DTF_MAJOR_VERSION=${TF_MAJOR} -DTF_MINOR_VERSION=${TF_MINOR} -DTF_PATCH_VERSION=${TF_PATCH} -DTF_VERSION_SUFFIX=\"\""
>   
>   OECMAKE_C_FLAGS_RELEASE:append:arm = " -march=armv7-a -mfpu=neon"
>   OECMAKE_CXX_FLAGS_RELEASE:append:arm = " -march=armv7-a -mfpu=neon"
> @@ -112,9 +113,8 @@ EXTRA_OECMAKE:append = " \
>       -DCMAKE_SYSTEM_PROCESSOR=${TENSORFLOW_TARGET_ARCH} \
>       -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
>       -DPYTHON_TARGET_INCLUDE=${RECIPE_SYSROOT}${includedir}/${PYTHON_DIR} \
> -    -DNUMPY_TARGET_INCLUDE=${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/numpy/core/include \
> +    -DNUMPY_TARGET_INCLUDE=${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/numpy/_core/include \
>       -DPYBIND11_TARGET_INCLUDE=${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/pybind11/include \
> -    -DTFLITE_VERSION_MAJOR=${MAJOR}  \
>       -DTFLITE_HOST_TOOLS_DIR=${STAGING_BINDIR_NATIVE} \
>       -DPTHREADPOOL_SOURCE_DIR=${S}/external/pthreadpool-source \
>       -DFXDIV_SOURCE_DIR=${S}/external/FXdiv-source \
> @@ -122,6 +122,8 @@ EXTRA_OECMAKE:append = " \
>       -DCPUINFO_SOURCE_DIR=${S}/external/cpuinfo \
>       -DKLEIDIAI_SOURCE_DIR=${S}/external/kleidiai \
>       -DPSIMD_SOURCE_DIR=${S}/external/psimd \
> +    -DCMAKE_CXX_STANDARD=17 \
> +    -DCMAKE_CXX_STANDARD_REQUIRED=ON \
>       --compile-no-warning-as-error \
>       --log-level=VERBOSE \
>   "
> @@ -130,7 +132,6 @@ do_configure:prepend() {
>       for i in abseil-cpp cpuinfo eigen farmhash fft2d flatbuffers FP16-source FXdiv-source gemmlowp kleidiai ml_dtypes psimd protobuf pthreadpool-source ruy xnnpack; do
>           cp -ra ${S}/external/$i ${B}/$i
>       done
> -

Random whitespace change

>       # There is no Fortran compiler in the toolchain, but bitbake sets this variable anyway with unavailable
>       # binary & it leads to "CMake Error: Could not find compiler set in environment variable FC:"
>       unset FC
> @@ -143,7 +144,7 @@ do_compile:append() {
>       BUILD_DIR=${B}
>       TENSORFLOW_DIR=${S}
>       TENSORFLOW_LITE_DIR="${TENSORFLOW_DIR}/tensorflow/lite"
> -    TENSORFLOW_VERSION=$(grep "_VERSION = " "${TENSORFLOW_DIR}/tensorflow/tools/pip_package/setup.py" | cut -d= -f2 | sed "s/[ '-]//g")
> +    TENSORFLOW_VERSION=$(grep "_VERSION = " "${TENSORFLOW_DIR}/tensorflow/tools/pip_package/setup.py.tpl" | cut -d= -f2 | sed "s/[ '-]//g")
>       mkdir -p "${B}/tflite_runtime"
>       cp -r "${TENSORFLOW_LITE_DIR}/tools/pip_package/debian" \
>             "${TENSORFLOW_LITE_DIR}/tools/pip_package/MANIFEST.in" \
> @@ -156,22 +157,23 @@ do_compile:append() {
>          "${B}/tflite_runtime"
>       echo "__version__ = '${TENSORFLOW_VERSION}'" >> "${BUILD_DIR}/tflite_runtime/__init__.py"
>       echo "__git_version__ = '$(git -C "${TENSORFLOW_DIR}" describe)'" >> "${BUILD_DIR}/tflite_runtime/__init__.py"
> -
> +

?

>       export PACKAGE_VERSION="${TENSORFLOW_VERSION}"
>       export PROJECT_NAME="tflite_runtime"
>       cp "${B}/_pywrap_tensorflow_interpreter_wrapper.so" "tflite_runtime"
> -
> +

?

>       setuptools3_do_compile
>   }
>   
>   do_install() {
>       # Install tensorflow-lite dynamic library
>       install -d ${D}${libdir}
> -    install -m 0644 ${B}/libtensorflow-lite.so.${MAJOR} ${D}${libdir}/libtensorflow-lite.so.${PV}
> +    install -m 0644 ${B}/libtensorflow-lite.so. ${D}${libdir}/libtensorflow-lite.so.${PV}
>   
> -    ln -sf libtensorflow-lite.so.${PV} ${D}${libdir}/libtensorflow-lite.so.${MAJOR}
> +    ln -sf libtensorflow-lite.so.${PV} ${D}${libdir}/libtensorflow-lite.so.${TF_MAJOR}
>       ln -sf libtensorflow-lite.so.${PV} ${D}${libdir}/libtensorflow-lite.so
> -
> +    ln -sf libtensorflow-lite.so.${PV} ${D}${libdir}/libtensorflow-lite.so.
> +

What is a symline with the name same as the above but with a "." at the end doing for us?

>       # armnn expects the the dynamic library of tensorflow lite to be named as "libtensorflowlite.so"
>       # Eg - https://github.com/ARM-software/armnn/blob/branches/armnn_24_11/delegate/cmake/Modules/FindTfLite.cmake#L19
>       # Hence, create a symbolic link to handle the same
> @@ -197,7 +199,7 @@ do_install() {
>   
>       # Install pkgconfig file required for NNstreamer build
>       install -d ${D}${libdir}/pkgconfig
> -    install -m 0644 ${WORKDIR}/tensorflow2-lite.pc.in ${D}${libdir}/pkgconfig/tensorflow2-lite.pc
> +    install -m 0644 ${WORKDIR}/sources/tensorflow2-lite.pc.in ${D}${libdir}/pkgconfig/tensorflow2-lite.pc
>       sed -i 's:@version@:${PV}:g
>               s:@libdir@:${libdir}:g
>               s:@includedir@:${includedir}:g' \


