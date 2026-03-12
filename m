Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F9E106703C
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:37:12 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23109.1773326218339038447
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 07:36:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=nMtj2Qt4;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.43, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVGgZqkILh8HZAiQ/wTBep5mK71+XviL/YCgmjEMgUnHgXqWA0neWgXLoSsAnyyAuLzGoyOteuLA4I3V6CjtqNs9Q4vbizfoR+rCjeFoviHFrpC+wJXF8F/TazeUXoCjTmC8yxH3p1T2A7eSnTbVhZnYasb2/oBlMtrTVTmJ04IXOrSqBD+0xdQc2BazoJtil7lWIzPQFpWPV0itew9IDHWADwpBb9VYaQC7AqyhbFh6ENwo/h9sv+kehmQSr6S7cA8gNQHdXF3JhmbFVE5b9ceLXGgNtSPgPSBgHjEmRCVkf7uVl3oaa+HYsm4SP/L/+EtvClEM21/EnoXK++FeRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uduA7oIdVRERqz5Vo2caRqFDBuLhtGOC1lre9dqPCK4=;
 b=EFBk/tFHJqLhxVKM/dP/uVPOsTm6Sw63+I1dZNsrYfLtpBudm8EFCOMOHYvwN2/1WR4ceDRigRiF/gLHyDPmYy1lMHuYv6WDSieX83oydykcwC+tRCFh7NfczxbrXMPG6nTGJV6/6xDsWfaBFPsFf/uwZxhttJVA4e39rz2ZlAu7qzDCLOX9nr36F/WtdZy5pLgi5IfkyxJst8SbyQgmQJ4DVFlBt2pCWMWEZIz0P6i60iJWvMEvL2fWbM/X27Oh1mmzKjw0nZqPha8xPUmv1kYd3N97J3bPHBZWWNy1XCh60oozL+5BsjXt2ziYz4DsktrTXg+S0TTBhK0Vso/eUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uduA7oIdVRERqz5Vo2caRqFDBuLhtGOC1lre9dqPCK4=;
 b=nMtj2Qt4ml5eSH+XIarRMpteFnBTAHx/SXNDhJgCEDMNx67S/lluIEYXGvFlk0ctEsWrrapkioXLs+jOjz+5bdFovH1CI6+oluXLVqV7CJ3EFQqbyGnY4zqmErrh1+p9UBr8dOJB2FbuL0zv0XiojqJSQ6OR+ojdPBQbWTUyoXQ=
Received: from MN2PR20CA0044.namprd20.prod.outlook.com (2603:10b6:208:235::13)
 by MW4PR10MB6581.namprd10.prod.outlook.com (2603:10b6:303:22a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 14:36:53 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:208:235:cafe::9f) by MN2PR20CA0044.outlook.office365.com
 (2603:10b6:208:235::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.28 via Frontend Transport; Thu,
 12 Mar 2026 14:36:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.1 via Frontend Transport; Thu, 12 Mar 2026 14:36:52 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 09:36:50 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 09:36:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 09:36:50 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CEaonZ2472802;
	Thu, 12 Mar 2026 09:36:50 -0500
Message-ID: <653f3284-8604-441b-aba5-02e32c6121c2@ti.com>
Date: Thu, 12 Mar 2026 09:36:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 1/1] tensorflow-lite: fix undefined
 Abseil logging symbols in shared library
To: Pratham Deshmukh <p-deshmukh@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>
References: <20260312141948.1002945-1-p-deshmukh@ti.com>
 <20260312141948.1002945-2-p-deshmukh@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260312141948.1002945-2-p-deshmukh@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|MW4PR10MB6581:EE_
X-MS-Office365-Filtering-Correlation-Id: b125ab70-bb07-413b-ec9f-08de8044cd4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	KjADmlDj/18hUY1xhhSIPxSe9BtqbfhE+vua/habfQI1r4MfA6cy3EPEdco7F7J1CFWpmJ5kFu/wd2w/Hwtw27Y/VqcvZh0KMNPU8bUtatDLYDJDy0UVB+As7B88FxgFFJkD1LTpgx/6wCSCjAU/xV82r1keWeb2Sulj/RmouLvkeodXdgFnEe36UWdVG1SToH1/Tgfj2ROS2UyG8erYzoepwl6HAM61+pA9CsdQkORt4cLQvHQK7s1K/MjxVXA+4uebA8QGvHPaVWMGchQcpGN3Kmdh85d2T0/ZScP4JvljR4L4KxN00JXDly2kn58NphKUcSJBXs1duQKXUgqYcCO2Vm3VRatkc1x2Om5Jayt0iydldZevQepzzfbGiL7v4qwVbd2SqFWfv/Zbst06BB54mPB6tjfn4rmB5b8swheMLfSKZDh2O02CAikjU2dFwThKaBrkfCGf/VAqpjONyz9RUPH/y+JhpqCl+8o9q4MQjIuGe3+9RuDBW9bs+Y29WTHNoI8zaBbPmYx6Euw4cryZPUSzXXVeuhD/4YOXShlxF/M2CourI1+PlMkIyqVhmeSGmar4/jbygMclKCRWwJAD46H+tqSRQN5zqBA7fbMJ/P4sfKHj/gqDnIL2J2UG5R9SV/Y/zqWsTKf/7W/tP2pPzcBnnL1uA38DIy1xlFlF+jQk55KGnk5neHn2PTkum5Yuvpox09O3T1/fFOTinQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9npTO2X1dMzF3giwnyhldmg/RK8O456RseHDywyhx2m4Ggl91ZL//a+nvuXMRQYIVEb+u5gQmVS6+I0dITX7irqnfNuUz9bbC1EBM16mdi+rK22jK03Vwgc0+CcODeZY5jh6YkEo+TATl1pO6AZPpt0xoMd4ro8t/7hvCDn6ZUTiflHRQQp+hS5jOWRlnonW/qf9HtCE5slTMsItnB4sn3Co4ZkgUJ+1c7cs/TD4Z1o9NAnVf9I95ZO3n+lg7czFdV8vefCuvL4Ke8lLy4vsIfcfqzhuzUuuZKNiWikCvxXQ5is75jI9GMBSJTUfiu5h6xBkszpJ2YTDFtsPqXpP5KkB7UTfX+ws0DkYiO8LsZqOc6vhaNW2b1qrrCPlYeDb9wnI/i1+fIQi8ihKfPuNdhkGI0iOE+5GwIWrhbkPLTVGOJDl8LUP/nundEEGyx9v
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:36:52.2822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b125ab70-bb07-413b-ec9f-08de8044cd4b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6581
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Mar 2026 14:37:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17323

On 3/12/26 9:19 AM, Pratham Deshmukh wrote:
> Add patch to resolve GStreamer pipeline failures when using TensorFlow Lite
> object detection models. The tensorflow2-lite NNStreamer plugin was failing
> to load due to missing Abseil logging symbols (_ZN4absl12lts_2025012712
> log_internal9kCharNullE, _ZN4absl12lts_2025012712log_internal10LogMessage
> C1EPKciNS2_8ErrorTagE) in the libtensorflow-lite.so.2 shared library.
> 

You could demangle these symbols[0] to make them more readable here, or just
not list them at all, the exact symbols that where missing can be seen in
the patch itself.

Andrew

[0] https://www.demangler.com/

> The fix adds missing Abseil logging targets to the CMake build system and
> links required logging libraries (log_internal_nullguard, log_internal_message,
> log_severity, raw_logging_internal) to ensure all symbols are available at
> runtime.
> 
> Added Patch:
>    - 0003-Fix-GStreamer-TensorFlow-Lite-pipeline-failures-due-.patch
> 
> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
> ---
>   ...nsorFlow-Lite-pipeline-failures-due-.patch | 62 +++++++++++++++++++
>   .../tensorflow-lite/tensorflow-lite_2.20.0.bb |  1 +
>   2 files changed, 63 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0003-Fix-GStreamer-TensorFlow-Lite-pipeline-failures-due-.patch
> 
> diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0003-Fix-GStreamer-TensorFlow-Lite-pipeline-failures-due-.patch b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0003-Fix-GStreamer-TensorFlow-Lite-pipeline-failures-due-.patch
> new file mode 100644
> index 00000000..f286018f
> --- /dev/null
> +++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0003-Fix-GStreamer-TensorFlow-Lite-pipeline-failures-due-.patch
> @@ -0,0 +1,62 @@
> +From 0e6c2c6d0911897e38f54dd0739e13ea15ccedd8 Mon Sep 17 00:00:00 2001
> +From: Pratham Deshmukh <p-deshmukh@ti.com>
> +Date: Thu, 12 Mar 2026 16:50:33 +0530
> +Subject: [PATCH] Fix GStreamer TensorFlow Lite pipeline failures due to
> + missing Abseil logging symbols
> +
> +When running GStreamer pipelines with TensorFlow Lite object detection [0]
> +
> +The pipeline failed with undefined symbol errors:
> +  undefined symbol: _ZN4absl12lts_2025012712log_internal9kCharNullE
> +  undefined symbol: _ZN4absl12lts_2025012712log_internal10LogMessageC1EPKciNS2_8ErrorTagE
> +
> +TensorFlow Lite shared library was missing Abseil logging
> +components that are required at runtime but weren't being linked during build.
> +
> +Add missing Abseil logging targets (log_internal_message, log_internal_nullguard)
> +to the Findabsl.cmake module and link the required Abseil logging libraries in the
> +tensorflow-lite target, including absl::log_internal_nullguard for the kCharNull
> +symbol, absl::log_internal_message for the LogMessage constructor, and absl::log_severity
> +and absl::raw_logging_internal for base logging support.
> +
> +[0] https://texasinstruments.github.io/processor-sdk-doc/processor-sdk-linux-AM62X/esd/docs/master/linux/Foundational_Components/Machine_Learning/tflite.html#example-applications
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
> +---
> + tensorflow/lite/CMakeLists.txt                     | 4 ++++
> + tensorflow/lite/tools/cmake/modules/Findabsl.cmake | 2 ++
> + 2 files changed, 6 insertions(+)
> +
> +diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.txt
> +index 7e0004ef..8c43fdac 100644
> +--- a/tensorflow/lite/CMakeLists.txt
> ++++ b/tensorflow/lite/CMakeLists.txt
> +@@ -732,6 +732,10 @@ target_link_libraries(tensorflow-lite
> +     absl::strings
> +     absl::synchronization
> +     absl::variant
> ++    absl::log_internal_nullguard
> ++    absl::log_severity
> ++    absl::raw_logging_internal
> ++    absl::log_internal_message
> +     farmhash
> +     fft2d_fftsg2d
> +     flatbuffers::flatbuffers
> +diff --git a/tensorflow/lite/tools/cmake/modules/Findabsl.cmake b/tensorflow/lite/tools/cmake/modules/Findabsl.cmake
> +index 75041749..685b851b 100644
> +--- a/tensorflow/lite/tools/cmake/modules/Findabsl.cmake
> ++++ b/tensorflow/lite/tools/cmake/modules/Findabsl.cmake
> +@@ -99,6 +99,8 @@ if(abseil-cpp_POPULATED)
> +     leak_check_api_enabled_for_testing
> +     leak_check_disable
> +     log_severity
> ++    log_internal_message
> ++    log_internal_nullguard
> +     main_lib
> +     malloc_internal
> +     memory
> +--
> +2.34.1
> +
> diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb
> index 43562303..ee445e75 100644
> --- a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb
> +++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb
> @@ -16,6 +16,7 @@ SRC_URI = " \
>       git://github.com/tensorflow/tensorflow.git;protocol=https;branch=r2.20 \
>       file://0001-Update-CMakeLists-for-building.patch \
>       file://0002-Update-CMakeLists-for-building-shared-object.patch \
> +    file://0003-Fix-GStreamer-TensorFlow-Lite-pipeline-failures-due-.patch \
>       file://tensorflow2-lite.pc.in \
>   "
>   


