Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE063F013C0
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 07:27:34 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45505.1773646045958889593
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 00:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=wzlc/ibV;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.8, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDeIKA/f1ElXjNeadKmRDsiF9/vGAPF8sV5h3twScE7HXLf8ED+NU+x2SQ05akah8acAuP93NjBU2zgFOJHA5lP7t7yqFqGSyaqoSqlqwSRUX/B/XsoU2+btMA0UGGWzznPxXUCt6+YuQJnNAL6mmLEhvFPLsJuBbOQaZ6T4o+zIoph4pQ7x47ZeX94Fxjups/8rQUsRj2r8PQ0M8h4kELwiiqG7Ntb270jdcc4lGwyva+vWYiGYXTUbc1CNhXsVQsE/peayQ5OXjUi+yWJM5f6X1+X5ufyRDucvyrAKXGbuev7UNGyXUMJyVw4BQeRUU7lO79ehK9tQdM+ch5c0lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWmOyZTVbVzwN5xFnYXMkaXYgBZzbEgqRlS9bztn+JE=;
 b=XMzKXF/ISwZ7KtLLrJb0SqENwRTY+1soS3PGsFSVc5pKFg/bkohFaq60tVASi7vdDzzgz0LOk45IdUk7VDs0Qdx70+rFt+RkhG9tOxRLjUpfzQsj8HIl6fSrm2Lr49bNKOMCtYWCCFXRZ9SR7+7AJi4YEMNu8nnqNnYw4nhm+Zl3yB4RyVliku2n4wNhZlETlp+7pLHGiYqg4TQA1DtzDpJbB25CT1FPv+iKqDYEYOGXm5H+f0BVHkbrbpH0r6BztCx/UN5hJiN6lXtFEO1ZFzblvGVGykXT1eaWeaNlzawlwhM/OBFBGRmAU2CuSxPMN50lqHBV6YE/WpHHXWU4LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWmOyZTVbVzwN5xFnYXMkaXYgBZzbEgqRlS9bztn+JE=;
 b=wzlc/ibVlzCdUiiR3eZAuMnxEixqA+VMebOrK5bZzq1WeGQSRMlD0deZZyjtg4hqil114JlXXaELWgifz9YTnDR5OcrkL4/qa8kkmw6yrZ/4vGX9q/VVmJUWygn/4RfaPXKNgmDGZIHOOF1pH67JEkPYf1n4/XYZOOrOCVDmLmY=
Received: from SA0PR12CA0012.namprd12.prod.outlook.com (2603:10b6:806:6f::17)
 by MN0PR10MB5910.namprd10.prod.outlook.com (2603:10b6:208:3d2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 07:27:23 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:6f:cafe::cd) by SA0PR12CA0012.outlook.office365.com
 (2603:10b6:806:6f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 07:27:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 07:27:22 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 02:27:22 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 02:27:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 02:27:22 -0500
Received: from [172.24.233.101] (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62G7RJYG867772;
	Mon, 16 Mar 2026 02:27:20 -0500
Message-ID: <89a4dcf3-ed46-4a73-8993-904751fb6c30@ti.com>
Date: Mon, 16 Mar 2026 12:57:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 1/1] tensorflow-lite: fix undefined
 Abseil logging symbols in shared library
To: Andrew Davis <afd@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>
References: <20260312141948.1002945-1-p-deshmukh@ti.com>
 <20260312141948.1002945-2-p-deshmukh@ti.com>
 <653f3284-8604-441b-aba5-02e32c6121c2@ti.com>
Content-Language: en-US
From: Pratham Deshmukh <p-deshmukh@ti.com>
In-Reply-To: <653f3284-8604-441b-aba5-02e32c6121c2@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|MN0PR10MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: f2ccdd36-97ca-4dc8-578d-08de832d7707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	1N5cDOpMSmhnUyS+IigZ2aFfXz0eOqY3zzwd/YJzgHyA2aV1OBbE2wGnF3OrBPtDs/QCSn/NkmOHhNJFRpoQnyFCtheHMfJ4zzPT/duDqfTHYlFrWiGwydOB95RdOl8xCZm1M1kRqEQGyDYybsxc3zQuvCfrtQFTmf2z5Acd64OukApD47AKkOSVG2hlGRegbCjxv2MbSoOJvE380E8UQ10yiN8LCR2jvQjFTkSGIa33yhmaV9HxLQEzvmpe34ZOXshueppOrXd9+6imWsGNxJDGQ08vtVulR3VGs5qHsYo0Xjal0JNyjXMlA796mCMg3D5gMK1lJtQp/OaNZ+w9cVV7tjTbhTGAtz9cEoW66gI4o/pqQWpjhfcJPkXbrzwb8RuXcUPiIGai7J2wjcq5s3wWK0GiuTecbCR37H7IsFW+Re7zGdvPjRmf3iffkW74BAMvnDqLHo0y5q+e93VnFv8FhsHujzVnyYbFZ+WzYe4nEHkrdas0ek6hb8BLzxNAJCWdj/jX+9rAAmxU4gdNF+lBnYIxF3kZipL6yUD2eKt4dBAOHWUY+kNWCLoALphHaWdiVgwki2OFSVZmS2+MCM2tJbQIJIxFiAHWRJkdFhfEL80HFwqrozw5pbyxJPFYzxQdVg+nQ1gX15UdFHdN8aZrvFBhzeD+TXkxNZZcDfnTBOkyEwsZe+PhEfY9VNfU88cSs8qU+VZ/DDCWEhieGA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ScR38pUcMkTJNJZ7fmJwSKnEcOio373r8MN7ft6MdFSJd3J/HuOp0/27KGBZWG/PkLmu9TKhIZJ7PvTn6KzX8vV1SYc5RBwC7CapfQ22jvjuYMbPNzAUZcpkRvTgXoXl8Swu1LBPC3t/PPADh95ZTJ1J2rjxWNpVvotlLdws2f8bGXmeio0lflAzDYqJng6dlFR+PtTl0Fj6yyeulkB2bJwmhMiBqZozKaTSjFAdC4mSYzkkPNJnH6/8gbrqQkwYZFMe0zJ3geCnWkDYggRanfsi3/iMzlOs+9ypw3LvWzIW7aqRaBovRW7hVzsrFhiBFTjekcSyPQcQgEFL5ST6MIbKLnukVapE48AhVOyCan4Mudq4tvanwJdY3dc8W7NB2PJd2d/2RCnkJFQt93ksqMT805ylNSHQKAdEbDhNoqSHc4QgtkXUps6H54oOtZkM
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 07:27:22.6498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ccdd36-97ca-4dc8-578d-08de832d7707
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5910
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 16 Mar 2026 07:27:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17344


On 12/03/26 8:06 pm, Andrew Davis wrote:
> On 3/12/26 9:19 AM, Pratham Deshmukh wrote:
>> Add patch to resolve GStreamer pipeline failures when using=20
>> TensorFlow Lite
>> object detection models. The tensorflow2-lite NNStreamer plugin was=20
>> failing
>> to load due to missing Abseil logging symbols (_ZN4absl12lts_2025012712
>> log_internal9kCharNullE,=20
>> _ZN4absl12lts_2025012712log_internal10LogMessage
>> C1EPKciNS2_8ErrorTagE) in the libtensorflow-lite.so.2 shared library.
>>
>
> You could demangle these symbols[0] to make them more readable here,=20
> or just
> not list them at all, the exact symbols that where missing can be seen in
> the patch itself.
>
> Andrew
>
> [0] https://www.demangler.com/
>
Understood. I'll ensure this in future patch submissions.
Thanks.
>> The fix adds missing Abseil logging targets to the CMake build system=20
>> and
>> links required logging libraries (log_internal_nullguard,=20
>> log_internal_message,
>> log_severity, raw_logging_internal) to ensure all symbols are=20
>> available at
>> runtime.
>>
>> Added Patch:
>> =C2=A0=C2=A0 - 0003-Fix-GStreamer-TensorFlow-Lite-pipeline-failures-due-=
.patch
>>
>> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
>> ---
>> =C2=A0 ...nsorFlow-Lite-pipeline-failures-due-.patch | 62 ++++++++++++++=
+++++
>> =C2=A0 .../tensorflow-lite/tensorflow-lite_2.20.0.bb |=C2=A0 1 +
>> =C2=A0 2 files changed, 63 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0003=
-Fix-GStreamer-TensorFlow-Lite-pipeline-failures-due-.patch
>>
>> diff --git=20
>> a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/00=
03-Fix-GStreamer-TensorFlow-Lite-pipeline-failures-due-.patch=20
>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/00=
03-Fix-GStreamer-TensorFlow-Lite-pipeline-failures-due-.patch=20
>>
>> new file mode 100644
>> index 00000000..f286018f
>> --- /dev/null
>> +++=20
>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/00=
03-Fix-GStreamer-TensorFlow-Lite-pipeline-failures-due-.patch
>> @@ -0,0 +1,62 @@
>> +From 0e6c2c6d0911897e38f54dd0739e13ea15ccedd8 Mon Sep 17 00:00:00 2001
>> +From: Pratham Deshmukh <p-deshmukh@ti.com>
>> +Date: Thu, 12 Mar 2026 16:50:33 +0530
>> +Subject: [PATCH] Fix GStreamer TensorFlow Lite pipeline failures due to
>> + missing Abseil logging symbols
>> +
>> +When running GStreamer pipelines with TensorFlow Lite object=20
>> detection [0]
>> +
>> +The pipeline failed with undefined symbol errors:
>> +=C2=A0 undefined symbol: _ZN4absl12lts_2025012712log_internal9kCharNull=
E
>> +=C2=A0 undefined symbol:=20
>> _ZN4absl12lts_2025012712log_internal10LogMessageC1EPKciNS2_8ErrorTagE
>> +
>> +TensorFlow Lite shared library was missing Abseil logging
>> +components that are required at runtime but weren't being linked=20
>> during build.
>> +
>> +Add missing Abseil logging targets (log_internal_message,=20
>> log_internal_nullguard)
>> +to the Findabsl.cmake module and link the required Abseil logging=20
>> libraries in the
>> +tensorflow-lite target, including absl::log_internal_nullguard for=20
>> the kCharNull
>> +symbol, absl::log_internal_message for the LogMessage constructor,=20
>> and absl::log_severity
>> +and absl::raw_logging_internal for base logging support.
>> +
>> +[0]=20
>> https://texasinstruments.github.io/processor-sdk-doc/processor-sdk-linux=
-AM62X/esd/docs/master/linux/Foundational_Components/Machine_Learning/tflit=
e.html#example-applications
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
>> +---
>> + tensorflow/lite/CMakeLists.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 4 ++++
>> + tensorflow/lite/tools/cmake/modules/Findabsl.cmake | 2 ++
>> + 2 files changed, 6 insertions(+)
>> +
>> +diff --git a/tensorflow/lite/CMakeLists.txt=20
>> b/tensorflow/lite/CMakeLists.txt
>> +index 7e0004ef..8c43fdac 100644
>> +--- a/tensorflow/lite/CMakeLists.txt
>> ++++ b/tensorflow/lite/CMakeLists.txt
>> +@@ -732,6 +732,10 @@ target_link_libraries(tensorflow-lite
>> +=C2=A0=C2=A0=C2=A0=C2=A0 absl::strings
>> +=C2=A0=C2=A0=C2=A0=C2=A0 absl::synchronization
>> +=C2=A0=C2=A0=C2=A0=C2=A0 absl::variant
>> ++=C2=A0=C2=A0=C2=A0 absl::log_internal_nullguard
>> ++=C2=A0=C2=A0=C2=A0 absl::log_severity
>> ++=C2=A0=C2=A0=C2=A0 absl::raw_logging_internal
>> ++=C2=A0=C2=A0=C2=A0 absl::log_internal_message
>> +=C2=A0=C2=A0=C2=A0=C2=A0 farmhash
>> +=C2=A0=C2=A0=C2=A0=C2=A0 fft2d_fftsg2d
>> +=C2=A0=C2=A0=C2=A0=C2=A0 flatbuffers::flatbuffers
>> +diff --git a/tensorflow/lite/tools/cmake/modules/Findabsl.cmake=20
>> b/tensorflow/lite/tools/cmake/modules/Findabsl.cmake
>> +index 75041749..685b851b 100644
>> +--- a/tensorflow/lite/tools/cmake/modules/Findabsl.cmake
>> ++++ b/tensorflow/lite/tools/cmake/modules/Findabsl.cmake
>> +@@ -99,6 +99,8 @@ if(abseil-cpp_POPULATED)
>> +=C2=A0=C2=A0=C2=A0=C2=A0 leak_check_api_enabled_for_testing
>> +=C2=A0=C2=A0=C2=A0=C2=A0 leak_check_disable
>> +=C2=A0=C2=A0=C2=A0=C2=A0 log_severity
>> ++=C2=A0=C2=A0=C2=A0 log_internal_message
>> ++=C2=A0=C2=A0=C2=A0 log_internal_nullguard
>> +=C2=A0=C2=A0=C2=A0=C2=A0 main_lib
>> +=C2=A0=C2=A0=C2=A0=C2=A0 malloc_internal
>> +=C2=A0=C2=A0=C2=A0=C2=A0 memory
>> +--
>> +2.34.1
>> +
>> diff --git=20
>> a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.=
20.0.bb=20
>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.=
20.0.bb=20
>>
>> index 43562303..ee445e75 100644
>> ---=20
>> a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.=
20.0.bb
>> +++=20
>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.=
20.0.bb
>> @@ -16,6 +16,7 @@ SRC_URI =3D " \
>> git://github.com/tensorflow/tensorflow.git;protocol=3Dhttps;branch=3Dr2.=
20 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-Update-CMakeLists-for-buildin=
g.patch \
>> file://0002-Update-CMakeLists-for-building-shared-object.patch \
>> +=20
>> file://0003-Fix-GStreamer-TensorFlow-Lite-pipeline-failures-due-.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://tensorflow2-lite.pc.in \
>> =C2=A0 "
>

