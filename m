Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A71EEF33C
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 09:08:12 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40102.1772701689893553809
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 01:08:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=kkYXNzF3;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.46, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRNIPNLwl50WdW4YxuuntEk0IkY1yOhx2mXwxGxHZupmEYoVOKklnCKcWzn41wBVWr1+uv3TdBJPCZNJnG4nV1w9j+MLcpbEIiN6HNfo3dGczqhIROySAStLp5cZFwp2T1pS07beb48V3ybPWlzNCwkgXcY0XhqWfiX3uMsQxIrbwTLpJoynxpjIR7AsBjlQL9gdHmfyqwiEjf/RWjH9lbTeRIl3nkEfLx9gD4hdKevA7zHZ18iMwK7f9lEn/h9DeFQs+h3byX5wFIt5W5dT9PgS3LkZD9UZRdt81gi4cO8YewRiKXUUYvwvrm9Rf4VXggIZ1WBANv4xIjQF11L/iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kfs9pHT30hLEUL0PcaMBRaJqSh9zia+YTcfTsrDoKlY=;
 b=C8rHpzZTQzEM8r4aujyfsk+nUVPXoD05VVghSK1zyy7RQdsU9aNBlHVYnPGFHxSt0RY2Er71pF8KDCZh9RE/E2C/Dls4MiULiofO6bMSzbS6nwZcintMhox09NmKHVnIYvUiXD4onWN8U7HqMkDwN6cIikQThoQ0Dt16IRzCuxu3rtiZLx6aevFODEqoH98y+HDXWOY6fHri52NpsxkshRw+onvc+IhxkJquw8ElaN+0IaRai6N9FG8swldoR8pNRCr/dzBrdpGwavWoTAvEpAa/RwEXUcuw7nsgvF0ZDj7jFi7OisK5FJeNscXFYGJTBzoSRdYkBeZz3r6sHj+gHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kfs9pHT30hLEUL0PcaMBRaJqSh9zia+YTcfTsrDoKlY=;
 b=kkYXNzF3xU00wIi32S3ShCYhir1ssM+dDgOa/IHne4OZrNIPe58g44GzQY9s8JoUA0GI7qBdhTcjsQePcQ6cUkEbEXYpY1fJRtECZcdlGSdu5zWfv8JXxeQTxt5EJZY/gufBFlZz5/e75ZuxI0VxzGs5ALlQsHq4IZMUaCD4+nw=
Received: from PH7P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::9)
 by DS0PR10MB6056.namprd10.prod.outlook.com (2603:10b6:8:cb::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18; Thu, 5 Mar 2026 09:08:06 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:510:32a:cafe::78) by PH7P221CA0013.outlook.office365.com
 (2603:10b6:510:32a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 09:08:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 09:08:05 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 03:08:05 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 03:08:05 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 03:08:05 -0600
Received: from [172.24.233.101] (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625982vJ1567121;
	Thu, 5 Mar 2026 03:08:03 -0600
Content-Type: multipart/alternative;
	boundary="------------Qrs657wmHagq5Mt9VPyJLvAp"
Message-ID: <6b2dc5af-505e-44a3-9c5f-a658c1c87b42@ti.com>
Date: Thu, 5 Mar 2026 14:38:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 3/4] tensorflow-lite: upgrade 2.18.0
 -> 2.20.0
To: Andrew Davis <afd@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>, <khasim@ti.com>
References: <20260304123221.1450993-1-p-deshmukh@ti.com>
 <20260304123221.1450993-4-p-deshmukh@ti.com>
 <192559e1-e712-4342-9a86-4cc8e54a402f@ti.com>
Content-Language: en-US
From: Pratham Deshmukh <p-deshmukh@ti.com>
In-Reply-To: <192559e1-e712-4342-9a86-4cc8e54a402f@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|DS0PR10MB6056:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eac846f-1664-48a4-8120-08de7a96b688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|34020700016|1800799024|13003099007|8096899003|7142099003;
X-Microsoft-Antispam-Message-Info: 
	vCqQveK47bLUMg6rIdhM6u+tAskltc5P4Ju8ydHYunlxquHkHNM1/gvyuki5TyqfVO1C5cjkO8r4QZA0Dl2/YrBJ4Ri2dP62wLKAK/KtMBu4uzH0fw78bFq+sMqOJjV31n5Q7XoZpKn0B3PVIlHab7zKoAsWQkTCh08nhPKa+quRKmH1eKLsvXNlfCbCv/xvRTUeXqZrim1ARbvcoKov9+irmMVBcmwkfgsFYW9eJF7sGaWu2NXs5u8tjYRHvY2b4Il/mfSwhEEYefeI+pCDFvuz6ZsaGKihSArlPrtst2NhG7oVBaoKQiqsAKlhNW1x+/HZsn0zuroFO14axC2sgiR2VFLfYmD6cL33pcUeJM6MF5SNevk+uumauyhFqNpPkloAKfUvbGTTly2NPdM/2eXXoIub1Gua2OkBosyxhH8IcSiZSmN/N3vs87tfdRnM9UXlOJtiQBAgKd14VjVjVdHWpsrKllVoT6ZcxXYLF4E+g71sS6t8ms1YNwo+OYLEWgW7GD9c2xafRziEY6Zq8uzMVNPhdqov9WpBgj95fz97oeOrLrig55/k9LHw8CE0lCki6ZCCoCIXEqAK/dV8EFBcEupbN443Lb3C00Wv8tqIiHibMEqaInXgL/ItyTE4J04kLE8I2j02bfBq9Sxsv8QVIVSihyPaNsLvywOffS/8/honedsxxSfoAXy1XUpbX+mwroGpY99RRqse9GSMw0QVOV7eYBppK4JFCKHeC98=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(34020700016)(1800799024)(13003099007)(8096899003)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	32uk2c9l41yhR4ifta3wY0oj05Ade0ah0f9m3p4ordnMr+iQlkAuZYGa8Mpxh/AdhF1IXBTl4nQBxCBXNYMaGsK7iChmppo45EBKfeaflbPKnkVel3Stn+uROxS65mKVMvF1+M8/SOUrypsLWvG3aT/CcZ6UripbLyq+X2IvDHK6ae+/y9x9mm6dMUYCT6Clxki63ARPmgJBYMNElSGstgWDhZ7otv6sFhHNs3hu8HD6wsrgtz1AjflOsgSAD8OlhyWPW8jxAEtuVJRRzOLccMg1Ni9slQqmexR6OkGei8j+1Ojnkk4GszZZ323D4ZLWaT41mLzeJlvugcZH7GoWqD0U9E5MSPCd4vtyz76vQPoXkvpaTNnU9vQLscB/H/42wbRQrUHhd+m2Wb/KheDU5NkmJeYJvE7+LXLBLKviVRCYcOkye9gelyBjcTQzVuWq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 09:08:05.8584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eac846f-1664-48a4-8120-08de7a96b688
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6056
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 09:08:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17227

--------------Qrs657wmHagq5Mt9VPyJLvAp
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 04/03/26 10:21 pm, Andrew Davis wrote:
> On 3/4/26 6:32 AM, Pratham Deshmukh wrote:
>> We are migrating Tensorflow-Lite from v2.18.0 to the
>> stable release v2.20.0
>>
>> Key Changes:
>>   - Pin flatbuffers-native and protobuf-native to use the same 
>> version as
>>     TensorFlow Lite 2.20.0 to avoid version mismatch
>>   - Updated SRCREV for all the dependencies
>>   - Updated recipe to meet the build compatibilty
>>
>> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
>> ---
>>   .../flatbuffers/flatbuffers-arago.inc         |  8 +++
>>   .../flatbuffers/flatbuffers.bbappend          |  4 ++
>>   .../protobuf/protobuf-arago.inc               | 18 +++++++
>>   .../protobuf/protobuf_%.bbappend              |  5 ++
>>   ...te_2.18.0.bb => tensorflow-lite_2.20.0.bb} | 52 ++++++++++---------
>>   5 files changed, 62 insertions(+), 25 deletions(-)
>>   create mode 100644 
>> meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-arago.inc
>>   create mode 100644 
>> meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbappend
>>   create mode 100644 
>> meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc
>>   create mode 100644 
>> meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend
>>   rename 
>> meta-arago-extras/recipes-framework/tensorflow-lite/{tensorflow-lite_2.18.0.bb 
>> => tensorflow-lite_2.20.0.bb} (86%)
>>
>> diff --git 
>> a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-arago.inc 
>> b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-arago.inc
>> new file mode 100644
>> index 00000000..d85efc8b
>> --- /dev/null
>> +++ 
>> b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-arago.inc
>> @@ -0,0 +1,8 @@
>> +# Pin flatbuffers-native to use the same version as TensorFlow Lite 
>> 2.20.0
>> +# to avoid version mismatch errors
>> +
>> +# Override version to match
>> +PV = "24.3.25"
>> +
>> +# Use specific commit hash that corresponds to v24.3.25 tag
>> +SRCREV = "595bf0007ab1929570c7671f091313c8fc20644e"
>> diff --git 
>> a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbappend 
>> b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbappend
>> new file mode 100644
>> index 00000000..2a627698
>> --- /dev/null
>> +++ 
>> b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbappend
>> @@ -0,0 +1,4 @@
>> +# Conditionally include Arago-specific customizations for 
>> flatbuffers-native
>> +FLATBUFFERS_ARAGO = ""
>> +FLATBUFFERS_ARAGO:arago = "flatbuffers-arago.inc"
>> +require ${FLATBUFFERS_ARAGO}
>> diff --git 
>> a/meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc 
>> b/meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc
>> new file mode 100644
>> index 00000000..489b1444
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc
>> @@ -0,0 +1,18 @@
>> +# Pin protobuf-native to use the same version as TensorFlow Lite 2.20.0
>> +# to avoid version mismatch errors
>> +
>> +# Override version to match
>> +PV = "3.21.9"
>> +
>> +# Use specific commit hash that corresponds to v24.3.25 tag
>> +SRCREV = "90b73ac3f0b10320315c2ca0d03a5a9b095d2f66"
>> +
>> +# Override SRC_URI to use 3.21.x branch and remove incompatible patches
>> +SRC_URI = 
>> "git://github.com/protocolbuffers/protobuf.git;branch=main;protocol=https 
>> \
>> + file://run-ptest \
>> +          "
>> +
>> +LIC_FILES_CHKSUM = " \
>> + file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b \
>> + 
>> file://third_party/utf8_range/LICENSE;md5=ef460f31070fd7184bd9059de2e4b132 
>> \
>> +"
>> diff --git 
>> a/meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend 
>> b/meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend
>> new file mode 100644
>> index 00000000..51c679a5
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend
>> @@ -0,0 +1,5 @@
>> +# Conditionally include Arago-specific customizations for 
>> flatbuffers-native
>> +PROTOBUF_ARAGO = ""
>> +PROTOBUF_ARAGO:arago = "protobuf-arago.inc"
>> +
>> +require ${PROTOBUF_ARAGO}
>> diff --git 
>> a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.18.0.bb 
>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb 
>>
>> similarity index 86%
>> rename from 
>> meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.18.0.bb
>> rename to 
>> meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb
>> index c76939ac..57278f5b 100644
>> --- 
>> a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.18.0.bb
>> +++ 
>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb
>> @@ -8,18 +8,19 @@ LICENSE = "Apache-2.0"
>>   LIC_FILES_CHKSUM = 
>> "file://LICENSE;md5=4158a261ca7f2525513e31ba9c50ae98"
>>     # Get major of the PV variable
>> -MAJOR = "${@d.getVar('PV').split('.')[0]}"
>> +TF_MAJOR = "${@d.getVar('PV').split('.')[0]}"
>> +TF_MINOR = "${@d.getVar('PV').split('.')[1]}"
>> +TF_PATCH = "${@(d.getVar('PV').split('.') + ['0', '0'])[2]}"
>>     SRC_URI = " \
>> - 
>> git://github.com/tensorflow/tensorflow.git;protocol=https;branch=r2.18 \
>> + 
>> git://github.com/tensorflow/tensorflow.git;protocol=https;branch=r2.20 \
>> file://0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch \
>> file://0002-lite-Update-CMakeLists-for-building-shared-object-li.patch \
>> - 
>> file://0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patch \
>> file://tensorflow2-lite.pc.in \
>>   "
>>     SRC_URI += " \
>> - 
>> git://github.com/abseil/abseil-cpp.git;protocol=https;branch=lts_2023_08_02;name=abseil-cpp;destsuffix=${S}/external/abseil-cpp 
>> \
>> + 
>> git://github.com/abseil/abseil-cpp.git;protocol=https;branch=lts_2025_01_27;name=abseil-cpp;destsuffix=${S}/external/abseil-cpp 
>> \
>> git://gitlab.com/libeigen/eigen.git;protocol=https;branch=master;name=eigen;destsuffix=${S}/external/eigen 
>> \
>> git://github.com/google/farmhash.git;protocol=https;branch=master;name=farmhash;destsuffix=${S}/external/farmhash 
>> \
>> git://github.com/petewarden/OouraFFT.git;protocol=https;branch=master;name=fft2d;destsuffix=${S}/external/fft2d 
>> \
>> @@ -28,35 +29,35 @@ SRC_URI += " \
>> git://github.com/jax-ml/ml_dtypes.git;branch=main;protocol=https;name=ml_dtypes;destsuffix=${S}/external/ml_dtypes 
>> \
>> git://github.com/google/ruy.git;branch=master;protocol=https;name=ruy;destsuffix=${S}/external/ruy 
>> \
>> git://github.com/google/flatbuffers;branch=master;protocol=https;name=flatbuffers;destsuffix=${S}/external/flatbuffers 
>> \
>> - 
>> git://github.com/Maratyszcza/pthreadpool.git;branch=master;protocol=https;name=pthreadpool-source;destsuffix=${S}/external/pthreadpool-source 
>> \
>> + 
>> git://github.com/google/pthreadpool.git;branch=main;protocol=https;name=pthreadpool-source;destsuffix=${S}/external/pthreadpool-source 
>> \
>> git://github.com/google/XNNPACK.git;branch=master;protocol=https;name=xnnpack;destsuffix=${S}/external/xnnpack 
>> \
>> git://github.com/Maratyszcza/FXdiv.git;branch=master;protocol=https;name=FXdiv-source;destsuffix=${S}/external/FXdiv-source 
>> \
>> git://github.com/Maratyszcza/FP16.git;branch=master;protocol=https;name=FP16-source;destsuffix=${S}/external/FP16-source 
>> \
>> git://git.gitlab.arm.com/kleidi/kleidiai.git;branch=main;protocol=https;name=kleidiai;destsuffix=${S}/external/kleidiai 
>> \
>> git://github.com/Maratyszcza/psimd.git;branch=master;protocol=https;name=psimd;destsuffix=${S}/external/psimd 
>> \
>> - 
>> git://github.com/protocolbuffers/protobuf.git;branch=25.x;protocol=https;name=protobuf;destsuffix=${S}/external/protobuf 
>> \
>> + 
>> git://github.com/protocolbuffers/protobuf.git;branch=main;protocol=https;name=protobuf;destsuffix=${S}/external/protobuf 
>> \
>>   "
>>     SRCREV_FORMAT = "default"
>>     # Matches v${PV} tag
>> -SRCREV = "6550e4bd80223cdb8be6c3afd1f81e86a4d433c3"
>> -SRCREV_abseil-cpp = "fb3621f4f897824c0dbe0615fa94543df6192f30"
>> +SRCREV = "72fbba3d20f4616d7312b5e2b7f79daf6e82f2fa"
>> +SRCREV_abseil-cpp = "d9e4955c65cd4367dd6bf46f4ccb8cd3d100540b"
>>   SRCREV_eigen = "33d0937c6bdf5ec999939fb17f2a553183d14a74"
>>   SRCREV_farmhash = "0d859a811870d10f53a594927d0d0b97573ad06d"
>>   SRCREV_fft2d = "c6fd2dd6d21397baa6653139d31d84540d5449a2"
>>   SRCREV_gemmlowp = "16e8662c34917be0065110bfcd9cc27d30f52fdf"
>> -SRCREV_cpuinfo = "b73ae6ce38d5dd0b7fe46dbe0a4b5f4bab91c7ea"
>> +SRCREV_cpuinfo = "de0ce7c7251372892e53ce9bc891750d2c9a4fd8"
>>   SRCREV_ml_dtypes = "24084d9ed2c3d45bf83b7a9bff833aa185bf9172"
>>   SRCREV_ruy = "3286a34cc8de6149ac6844107dfdffac91531e72"
>>   SRCREV_flatbuffers = "e6463926479bd6b330cbcf673f7e917803fd5831"
>> -SRCREV_pthreadpool-source = "4fe0e1e183925bf8cfa6aae24237e724a96479b8"
>> -SRCREV_xnnpack = "6b83f69d4938da4dc9ad63c00bd13e9695659a51"
>> +SRCREV_pthreadpool-source = "c2ba5c50bb58d1397b693740cf75fad836a0d1bf"
>> +SRCREV_xnnpack = "585e73e63cb35c8a416c83a48ca9ab79f7f7d45e"
>>   SRCREV_FXdiv-source = "63058eff77e11aa15bf531df5dd34395ec3017c8"
>> -SRCREV_FP16-source = "0a92994d729ff76a58f692d3028ca1b64b145d91"
>> -SRCREV_kleidiai = "cddf991af5de49fd34949fa39690e4e906e04074"
>> +SRCREV_FP16-source = "4dfe081cf6bcd15db339cf2680b9281b8451eeb3"
>> +SRCREV_kleidiai = "dc69e899945c412a8ce39ccafd25139f743c60b1"
>>   SRCREV_psimd = "072586a71b55b7f8c584153d223e95687148a900"
>> -SRCREV_protobuf = "4a2aef570deb2bfb8927426558701e8bfc26f2a4"
>> +SRCREV_protobuf = "90b73ac3f0b10320315c2ca0d03a5a9b095d2f66"
>>     inherit setuptools3 cmake
>>   @@ -91,7 +92,7 @@ OECMAKE_SOURCEPATH = "${S}/tensorflow/lite"
>>   # to further optimize the build for production use.
>>   # Hence, activate -O3 optimization and disable debug symbols.
>>   OECMAKE_C_FLAGS_RELEASE = "-O3 -DNDEBUG"
>> -OECMAKE_CXX_FLAGS_RELEASE = "-O3 -DNDEBUG -flax-vector-conversions"
>> +OECMAKE_CXX_FLAGS_RELEASE = "-O3 -DNDEBUG -flax-vector-conversions 
>> -DTF_MAJOR_VERSION=${TF_MAJOR} -DTF_MINOR_VERSION=${TF_MINOR} 
>> -DTF_PATCH_VERSION=${TF_PATCH} -DTF_VERSION_SUFFIX=\"\""
>>     OECMAKE_C_FLAGS_RELEASE:append:arm = " -march=armv7-a -mfpu=neon"
>>   OECMAKE_CXX_FLAGS_RELEASE:append:arm = " -march=armv7-a -mfpu=neon"
>> @@ -112,9 +113,8 @@ EXTRA_OECMAKE:append = " \
>>       -DCMAKE_SYSTEM_PROCESSOR=${TENSORFLOW_TARGET_ARCH} \
>>       -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
>> -DPYTHON_TARGET_INCLUDE=${RECIPE_SYSROOT}${includedir}/${PYTHON_DIR} \
>> - 
>> -DNUMPY_TARGET_INCLUDE=${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/numpy/core/include 
>> \
>> + 
>> -DNUMPY_TARGET_INCLUDE=${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/numpy/_core/include 
>> \
>> -DPYBIND11_TARGET_INCLUDE=${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/pybind11/include 
>> \
>> -    -DTFLITE_VERSION_MAJOR=${MAJOR}  \
>>       -DTFLITE_HOST_TOOLS_DIR=${STAGING_BINDIR_NATIVE} \
>>       -DPTHREADPOOL_SOURCE_DIR=${S}/external/pthreadpool-source \
>>       -DFXDIV_SOURCE_DIR=${S}/external/FXdiv-source \
>> @@ -122,6 +122,8 @@ EXTRA_OECMAKE:append = " \
>>       -DCPUINFO_SOURCE_DIR=${S}/external/cpuinfo \
>>       -DKLEIDIAI_SOURCE_DIR=${S}/external/kleidiai \
>>       -DPSIMD_SOURCE_DIR=${S}/external/psimd \
>> +    -DCMAKE_CXX_STANDARD=17 \
>> +    -DCMAKE_CXX_STANDARD_REQUIRED=ON \
>>       --compile-no-warning-as-error \
>>       --log-level=VERBOSE \
>>   "
>> @@ -130,7 +132,6 @@ do_configure:prepend() {
>>       for i in abseil-cpp cpuinfo eigen farmhash fft2d flatbuffers 
>> FP16-source FXdiv-source gemmlowp kleidiai ml_dtypes psimd protobuf 
>> pthreadpool-source ruy xnnpack; do
>>           cp -ra ${S}/external/$i ${B}/$i
>>       done
>> -
>
> Random whitespace change
>
I'll fix this.
>>       # There is no Fortran compiler in the toolchain, but bitbake 
>> sets this variable anyway with unavailable
>>       # binary & it leads to "CMake Error: Could not find compiler 
>> set in environment variable FC:"
>>       unset FC
>> @@ -143,7 +144,7 @@ do_compile:append() {
>>       BUILD_DIR=${B}
>>       TENSORFLOW_DIR=${S}
>>       TENSORFLOW_LITE_DIR="${TENSORFLOW_DIR}/tensorflow/lite"
>> -    TENSORFLOW_VERSION=$(grep "_VERSION = " 
>> "${TENSORFLOW_DIR}/tensorflow/tools/pip_package/setup.py" | cut -d= 
>> -f2 | sed "s/[ '-]//g")
>> +    TENSORFLOW_VERSION=$(grep "_VERSION = " 
>> "${TENSORFLOW_DIR}/tensorflow/tools/pip_package/setup.py.tpl" | cut 
>> -d= -f2 | sed "s/[ '-]//g")
>>       mkdir -p "${B}/tflite_runtime"
>>       cp -r "${TENSORFLOW_LITE_DIR}/tools/pip_package/debian" \
>> "${TENSORFLOW_LITE_DIR}/tools/pip_package/MANIFEST.in" \
>> @@ -156,22 +157,23 @@ do_compile:append() {
>>          "${B}/tflite_runtime"
>>       echo "__version__ = '${TENSORFLOW_VERSION}'" >> 
>> "${BUILD_DIR}/tflite_runtime/__init__.py"
>>       echo "__git_version__ = '$(git -C "${TENSORFLOW_DIR}" 
>> describe)'" >> "${BUILD_DIR}/tflite_runtime/__init__.py"
>> -
>> +
>
> ?
>
>>       export PACKAGE_VERSION="${TENSORFLOW_VERSION}"
>>       export PROJECT_NAME="tflite_runtime"
>>       cp "${B}/_pywrap_tensorflow_interpreter_wrapper.so" 
>> "tflite_runtime"
>> -
>> +
>
> ?
>
>>       setuptools3_do_compile
>>   }
>>     do_install() {
>>       # Install tensorflow-lite dynamic library
>>       install -d ${D}${libdir}
>> -    install -m 0644 ${B}/libtensorflow-lite.so.${MAJOR} 
>> ${D}${libdir}/libtensorflow-lite.so.${PV}
>> +    install -m 0644 ${B}/libtensorflow-lite.so. 
>> ${D}${libdir}/libtensorflow-lite.so.${PV}
>>   -    ln -sf libtensorflow-lite.so.${PV} 
>> ${D}${libdir}/libtensorflow-lite.so.${MAJOR}
>> +    ln -sf libtensorflow-lite.so.${PV} 
>> ${D}${libdir}/libtensorflow-lite.so.${TF_MAJOR}
>>       ln -sf libtensorflow-lite.so.${PV} 
>> ${D}${libdir}/libtensorflow-lite.so
>> -
>> +    ln -sf libtensorflow-lite.so.${PV} 
>> ${D}${libdir}/libtensorflow-lite.so.
>> +
>
> What is a symline with the name same as the above but with a "." at 
> the end doing for us?
>
benchmark_model needs libtensorflow-lite.so. for benchmarking purpose. 
Without this the benchmarking fails when executing 
/opt/tensorflow-lite/tools/benchmark_model
>>       # armnn expects the the dynamic library of tensorflow lite to 
>> be named as "libtensorflowlite.so"
>>       # Eg - 
>> https://github.com/ARM-software/armnn/blob/branches/armnn_24_11/delegate/cmake/Modules/FindTfLite.cmake#L19
>>       # Hence, create a symbolic link to handle the same
>> @@ -197,7 +199,7 @@ do_install() {
>>         # Install pkgconfig file required for NNstreamer build
>>       install -d ${D}${libdir}/pkgconfig
>> -    install -m 0644 ${WORKDIR}/tensorflow2-lite.pc.in 
>> ${D}${libdir}/pkgconfig/tensorflow2-lite.pc
>> +    install -m 0644 ${WORKDIR}/sources/tensorflow2-lite.pc.in 
>> ${D}${libdir}/pkgconfig/tensorflow2-lite.pc
>>       sed -i 's:@version@:${PV}:g
>>               s:@libdir@:${libdir}:g
>>               s:@includedir@:${includedir}:g' \
>
--------------Qrs657wmHagq5Mt9VPyJLvAp
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>
</p>
    <div class="moz-cite-prefix">On 04/03/26 10:21 pm, Andrew Davis
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:192559e1-e712-4342-9a86-4cc8e54a402f@ti.com">On 3/4/26
      6:32 AM, Pratham Deshmukh wrote:
      <br>
      <blockquote type="cite">We are migrating Tensorflow-Lite from
        v2.18.0 to the
        <br>
        stable release v2.20.0
        <br>
        <br>
        Key Changes:
        <br>
          - Pin flatbuffers-native and protobuf-native to use the same
        version as
        <br>
            TensorFlow Lite 2.20.0 to avoid version mismatch
        <br>
          - Updated SRCREV for all the dependencies
        <br>
          - Updated recipe to meet the build compatibilty
        <br>
        <br>
        Signed-off-by: Pratham Deshmukh <a class="moz-txt-link-rfc2396E" href="mailto:p-deshmukh@ti.com">&lt;p-deshmukh@ti.com&gt;</a>
        <br>
        ---
        <br>
          .../flatbuffers/flatbuffers-arago.inc         |  8 +++
        <br>
          .../flatbuffers/flatbuffers.bbappend          |  4 ++
        <br>
          .../protobuf/protobuf-arago.inc               | 18 +++++++
        <br>
          .../protobuf/protobuf_%.bbappend              |  5 ++
        <br>
          ...te_2.18.0.bb =&gt; tensorflow-lite_2.20.0.bb} | 52
        ++++++++++---------
        <br>
          5 files changed, 62 insertions(+), 25 deletions(-)
        <br>
          create mode 100644
        meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-arago.inc
        <br>
          create mode 100644
        meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbappend
        <br>
          create mode 100644
        meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc
        <br>
          create mode 100644
        meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend
        <br>
          rename
meta-arago-extras/recipes-framework/tensorflow-lite/{tensorflow-lite_2.18.0.bb
        =&gt; tensorflow-lite_2.20.0.bb} (86%)
        <br>
        <br>
        diff --git
        a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-arago.inc
b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-arago.inc
        <br>
        new file mode 100644
        <br>
        index 00000000..d85efc8b
        <br>
        --- /dev/null
        <br>
        +++
        b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-arago.inc
        <br>
        @@ -0,0 +1,8 @@
        <br>
        +# Pin flatbuffers-native to use the same version as TensorFlow
        Lite 2.20.0
        <br>
        +# to avoid version mismatch errors
        <br>
        +
        <br>
        +# Override version to match
        <br>
        +PV = "24.3.25"
        <br>
        +
        <br>
        +# Use specific commit hash that corresponds to v24.3.25 tag
        <br>
        +SRCREV = "595bf0007ab1929570c7671f091313c8fc20644e"
        <br>
        diff --git
        a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbappend
b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbappend
        <br>
        new file mode 100644
        <br>
        index 00000000..2a627698
        <br>
        --- /dev/null
        <br>
        +++
        b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbappend
        <br>
        @@ -0,0 +1,4 @@
        <br>
        +# Conditionally include Arago-specific customizations for
        flatbuffers-native
        <br>
        +FLATBUFFERS_ARAGO = ""
        <br>
        +FLATBUFFERS_ARAGO:arago = "flatbuffers-arago.inc"
        <br>
        +require ${FLATBUFFERS_ARAGO}
        <br>
        diff --git
        a/meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc
        b/meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc
        <br>
        new file mode 100644
        <br>
        index 00000000..489b1444
        <br>
        --- /dev/null
        <br>
        +++
        b/meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc
        <br>
        @@ -0,0 +1,18 @@
        <br>
        +# Pin protobuf-native to use the same version as TensorFlow
        Lite 2.20.0
        <br>
        +# to avoid version mismatch errors
        <br>
        +
        <br>
        +# Override version to match
        <br>
        +PV = "3.21.9"
        <br>
        +
        <br>
        +# Use specific commit hash that corresponds to v24.3.25 tag
        <br>
        +SRCREV = "90b73ac3f0b10320315c2ca0d03a5a9b095d2f66"
        <br>
        +
        <br>
        +# Override SRC_URI to use 3.21.x branch and remove incompatible
        patches
        <br>
        +SRC_URI =
"git://github.com/protocolbuffers/protobuf.git;branch=main;protocol=https
        \
        <br>
        +           <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
        <br>
        +          "
        <br>
        +
        <br>
        +LIC_FILES_CHKSUM = " \
        <br>
        +    <a class="moz-txt-link-freetext" href="file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b">file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b</a> \
        <br>
        +   
<a class="moz-txt-link-freetext" href="file://third_party/utf8_range/LICENSE;md5=ef460f31070fd7184bd9059de2e4b132">file://third_party/utf8_range/LICENSE;md5=ef460f31070fd7184bd9059de2e4b132</a>
        \
        <br>
        +"
        <br>
        diff --git
        a/meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend
b/meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend
        <br>
        new file mode 100644
        <br>
        index 00000000..51c679a5
        <br>
        --- /dev/null
        <br>
        +++
        b/meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend
        <br>
        @@ -0,0 +1,5 @@
        <br>
        +# Conditionally include Arago-specific customizations for
        flatbuffers-native
        <br>
        +PROTOBUF_ARAGO = ""
        <br>
        +PROTOBUF_ARAGO:arago = "protobuf-arago.inc"
        <br>
        +
        <br>
        +require ${PROTOBUF_ARAGO}
        <br>
        diff --git
a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.18.0.bb
b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb
        <br>
        similarity index 86%
        <br>
        rename from
meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.18.0.bb<br>
        rename to
meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb<br>
        index c76939ac..57278f5b 100644
        <br>
        ---
a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.18.0.bb<br>
        +++
b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb<br>
        @@ -8,18 +8,19 @@ LICENSE = "Apache-2.0"
        <br>
          LIC_FILES_CHKSUM =
        <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=4158a261ca7f2525513e31ba9c50ae98">"file://LICENSE;md5=4158a261ca7f2525513e31ba9c50ae98"</a>
        <br>
            # Get major of the PV variable
        <br>
        -MAJOR = <a class="moz-txt-link-rfc2396E" href="mailto:${@d.getVar('PV').split('.')[0]}">"${@d.getVar('PV').split('.')[0]}"</a>
        <br>
        +TF_MAJOR = <a class="moz-txt-link-rfc2396E" href="mailto:${@d.getVar('PV').split('.')[0]}">"${@d.getVar('PV').split('.')[0]}"</a>
        <br>
        +TF_MINOR = <a class="moz-txt-link-rfc2396E" href="mailto:${@d.getVar('PV').split('.')[1]}">"${@d.getVar('PV').split('.')[1]}"</a>
        <br>
        +TF_PATCH = <a class="moz-txt-link-rfc2396E" href="mailto:${@(d.getVar('PV').split('.')+['0','0'])[2]}">"${@(d.getVar('PV').split('.') + ['0', '0'])[2]}"</a>
        <br>
            SRC_URI = " \
        <br>
        -   
        git://github.com/tensorflow/tensorflow.git;protocol=https;branch=r2.18
        \
        <br>
        +   
        git://github.com/tensorflow/tensorflow.git;protocol=https;branch=r2.20
        \
        <br>
             
        <a class="moz-txt-link-freetext" href="file://0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch">file://0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch</a>
        \
        <br>
             
        <a class="moz-txt-link-freetext" href="file://0002-lite-Update-CMakeLists-for-building-shared-object-li.patch">file://0002-lite-Update-CMakeLists-for-building-shared-object-li.patch</a>
        \
        <br>
        -   
        <a class="moz-txt-link-freetext" href="file://0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patch">file://0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patch</a>
        \
        <br>
              <a class="moz-txt-link-freetext" href="file://tensorflow2-lite.pc.in">file://tensorflow2-lite.pc.in</a> \
        <br>
          "
        <br>
            SRC_URI += " \
        <br>
        -   
git://github.com/abseil/abseil-cpp.git;protocol=https;branch=lts_2023_08_02;name=abseil-cpp;destsuffix=${S}/external/abseil-cpp
        \
        <br>
        +   
git://github.com/abseil/abseil-cpp.git;protocol=https;branch=lts_2025_01_27;name=abseil-cpp;destsuffix=${S}/external/abseil-cpp
        \
        <br>
             
git://gitlab.com/libeigen/eigen.git;protocol=https;branch=master;name=eigen;destsuffix=${S}/external/eigen
        \
        <br>
             
git://github.com/google/farmhash.git;protocol=https;branch=master;name=farmhash;destsuffix=${S}/external/farmhash
        \
        <br>
             
git://github.com/petewarden/OouraFFT.git;protocol=https;branch=master;name=fft2d;destsuffix=${S}/external/fft2d
        \
        <br>
        @@ -28,35 +29,35 @@ SRC_URI += " \
        <br>
             
git://github.com/jax-ml/ml_dtypes.git;branch=main;protocol=https;name=ml_dtypes;destsuffix=${S}/external/ml_dtypes
        \
        <br>
             
git://github.com/google/ruy.git;branch=master;protocol=https;name=ruy;destsuffix=${S}/external/ruy
        \
        <br>
             
git://github.com/google/flatbuffers;branch=master;protocol=https;name=flatbuffers;destsuffix=${S}/external/flatbuffers
        \
        <br>
        -   
git://github.com/Maratyszcza/pthreadpool.git;branch=master;protocol=https;name=pthreadpool-source;destsuffix=${S}/external/pthreadpool-source
        \
        <br>
        +   
git://github.com/google/pthreadpool.git;branch=main;protocol=https;name=pthreadpool-source;destsuffix=${S}/external/pthreadpool-source
        \
        <br>
             
git://github.com/google/XNNPACK.git;branch=master;protocol=https;name=xnnpack;destsuffix=${S}/external/xnnpack
        \
        <br>
             
git://github.com/Maratyszcza/FXdiv.git;branch=master;protocol=https;name=FXdiv-source;destsuffix=${S}/external/FXdiv-source
        \
        <br>
             
git://github.com/Maratyszcza/FP16.git;branch=master;protocol=https;name=FP16-source;destsuffix=${S}/external/FP16-source
        \
        <br>
             
git://git.gitlab.arm.com/kleidi/kleidiai.git;branch=main;protocol=https;name=kleidiai;destsuffix=${S}/external/kleidiai
        \
        <br>
             
git://github.com/Maratyszcza/psimd.git;branch=master;protocol=https;name=psimd;destsuffix=${S}/external/psimd
        \
        <br>
        -   
git://github.com/protocolbuffers/protobuf.git;branch=25.x;protocol=https;name=protobuf;destsuffix=${S}/external/protobuf
        \
        <br>
        +   
git://github.com/protocolbuffers/protobuf.git;branch=main;protocol=https;name=protobuf;destsuffix=${S}/external/protobuf
        \
        <br>
          "
        <br>
            SRCREV_FORMAT = "default"
        <br>
            # Matches v${PV} tag
        <br>
        -SRCREV = "6550e4bd80223cdb8be6c3afd1f81e86a4d433c3"
        <br>
        -SRCREV_abseil-cpp = "fb3621f4f897824c0dbe0615fa94543df6192f30"
        <br>
        +SRCREV = "72fbba3d20f4616d7312b5e2b7f79daf6e82f2fa"
        <br>
        +SRCREV_abseil-cpp = "d9e4955c65cd4367dd6bf46f4ccb8cd3d100540b"
        <br>
          SRCREV_eigen = "33d0937c6bdf5ec999939fb17f2a553183d14a74"
        <br>
          SRCREV_farmhash = "0d859a811870d10f53a594927d0d0b97573ad06d"
        <br>
          SRCREV_fft2d = "c6fd2dd6d21397baa6653139d31d84540d5449a2"
        <br>
          SRCREV_gemmlowp = "16e8662c34917be0065110bfcd9cc27d30f52fdf"
        <br>
        -SRCREV_cpuinfo = "b73ae6ce38d5dd0b7fe46dbe0a4b5f4bab91c7ea"
        <br>
        +SRCREV_cpuinfo = "de0ce7c7251372892e53ce9bc891750d2c9a4fd8"
        <br>
          SRCREV_ml_dtypes = "24084d9ed2c3d45bf83b7a9bff833aa185bf9172"
        <br>
          SRCREV_ruy = "3286a34cc8de6149ac6844107dfdffac91531e72"
        <br>
          SRCREV_flatbuffers =
        "e6463926479bd6b330cbcf673f7e917803fd5831"
        <br>
        -SRCREV_pthreadpool-source =
        "4fe0e1e183925bf8cfa6aae24237e724a96479b8"
        <br>
        -SRCREV_xnnpack = "6b83f69d4938da4dc9ad63c00bd13e9695659a51"
        <br>
        +SRCREV_pthreadpool-source =
        "c2ba5c50bb58d1397b693740cf75fad836a0d1bf"
        <br>
        +SRCREV_xnnpack = "585e73e63cb35c8a416c83a48ca9ab79f7f7d45e"
        <br>
          SRCREV_FXdiv-source =
        "63058eff77e11aa15bf531df5dd34395ec3017c8"
        <br>
        -SRCREV_FP16-source = "0a92994d729ff76a58f692d3028ca1b64b145d91"
        <br>
        -SRCREV_kleidiai = "cddf991af5de49fd34949fa39690e4e906e04074"
        <br>
        +SRCREV_FP16-source = "4dfe081cf6bcd15db339cf2680b9281b8451eeb3"
        <br>
        +SRCREV_kleidiai = "dc69e899945c412a8ce39ccafd25139f743c60b1"
        <br>
          SRCREV_psimd = "072586a71b55b7f8c584153d223e95687148a900"
        <br>
        -SRCREV_protobuf = "4a2aef570deb2bfb8927426558701e8bfc26f2a4"
        <br>
        +SRCREV_protobuf = "90b73ac3f0b10320315c2ca0d03a5a9b095d2f66"
        <br>
            inherit setuptools3 cmake
        <br>
          @@ -91,7 +92,7 @@ OECMAKE_SOURCEPATH = "${S}/tensorflow/lite"
        <br>
          # to further optimize the build for production use.
        <br>
          # Hence, activate -O3 optimization and disable debug symbols.
        <br>
          OECMAKE_C_FLAGS_RELEASE = "-O3 -DNDEBUG"
        <br>
        -OECMAKE_CXX_FLAGS_RELEASE = "-O3 -DNDEBUG
        -flax-vector-conversions"
        <br>
        +OECMAKE_CXX_FLAGS_RELEASE = "-O3 -DNDEBUG
        -flax-vector-conversions -DTF_MAJOR_VERSION=${TF_MAJOR}
        -DTF_MINOR_VERSION=${TF_MINOR} -DTF_PATCH_VERSION=${TF_PATCH}
        -DTF_VERSION_SUFFIX=\"\""
        <br>
            OECMAKE_C_FLAGS_RELEASE:append:arm = " -march=armv7-a
        -mfpu=neon"
        <br>
          OECMAKE_CXX_FLAGS_RELEASE:append:arm = " -march=armv7-a
        -mfpu=neon"
        <br>
        @@ -112,9 +113,8 @@ EXTRA_OECMAKE:append = " \
        <br>
              -DCMAKE_SYSTEM_PROCESSOR=${TENSORFLOW_TARGET_ARCH} \
        <br>
              -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
        <br>
             
        -DPYTHON_TARGET_INCLUDE=${RECIPE_SYSROOT}${includedir}/${PYTHON_DIR}
        \
        <br>
        -   
-DNUMPY_TARGET_INCLUDE=${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/numpy/core/include
        \
        <br>
        +   
-DNUMPY_TARGET_INCLUDE=${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/numpy/_core/include
        \
        <br>
             
-DPYBIND11_TARGET_INCLUDE=${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/pybind11/include
        \
        <br>
        -    -DTFLITE_VERSION_MAJOR=${MAJOR}  \
        <br>
              -DTFLITE_HOST_TOOLS_DIR=${STAGING_BINDIR_NATIVE} \
        <br>
              -DPTHREADPOOL_SOURCE_DIR=${S}/external/pthreadpool-source
        \
        <br>
              -DFXDIV_SOURCE_DIR=${S}/external/FXdiv-source \
        <br>
        @@ -122,6 +122,8 @@ EXTRA_OECMAKE:append = " \
        <br>
              -DCPUINFO_SOURCE_DIR=${S}/external/cpuinfo \
        <br>
              -DKLEIDIAI_SOURCE_DIR=${S}/external/kleidiai \
        <br>
              -DPSIMD_SOURCE_DIR=${S}/external/psimd \
        <br>
        +    -DCMAKE_CXX_STANDARD=17 \
        <br>
        +    -DCMAKE_CXX_STANDARD_REQUIRED=ON \
        <br>
              --compile-no-warning-as-error \
        <br>
              --log-level=VERBOSE \
        <br>
          "
        <br>
        @@ -130,7 +132,6 @@ do_configure:prepend() {
        <br>
              for i in abseil-cpp cpuinfo eigen farmhash fft2d
        flatbuffers FP16-source FXdiv-source gemmlowp kleidiai ml_dtypes
        psimd protobuf pthreadpool-source ruy xnnpack; do
        <br>
                  cp -ra ${S}/external/$i ${B}/$i
        <br>
              done
        <br>
        -
        <br>
      </blockquote>
      <br>
      Random whitespace change <br>
      <br>
    </blockquote>
    I'll fix this.
    <blockquote type="cite"
      cite="mid:192559e1-e712-4342-9a86-4cc8e54a402f@ti.com">
      <blockquote type="cite">      # There is no Fortran compiler in
        the toolchain, but bitbake sets this variable anyway with
        unavailable
        <br>
              # binary &amp; it leads to "CMake Error: Could not find
        compiler set in environment variable FC:"
        <br>
              unset FC
        <br>
        @@ -143,7 +144,7 @@ do_compile:append() {
        <br>
              BUILD_DIR=${B}
        <br>
              TENSORFLOW_DIR=${S}
        <br>
              TENSORFLOW_LITE_DIR="${TENSORFLOW_DIR}/tensorflow/lite"
        <br>
        -    TENSORFLOW_VERSION=$(grep "_VERSION = "
        "${TENSORFLOW_DIR}/tensorflow/tools/pip_package/setup.py" | cut
        -d= -f2 | sed "s/[ '-]//g")
        <br>
        +    TENSORFLOW_VERSION=$(grep "_VERSION = "
        "${TENSORFLOW_DIR}/tensorflow/tools/pip_package/setup.py.tpl" |
        cut -d= -f2 | sed "s/[ '-]//g")
        <br>
              mkdir -p "${B}/tflite_runtime"
        <br>
              cp -r "${TENSORFLOW_LITE_DIR}/tools/pip_package/debian" \
        <br>
                   
        "${TENSORFLOW_LITE_DIR}/tools/pip_package/MANIFEST.in" \
        <br>
        @@ -156,22 +157,23 @@ do_compile:append() {
        <br>
                 "${B}/tflite_runtime"
        <br>
              echo "__version__ = '${TENSORFLOW_VERSION}'" &gt;&gt;
        "${BUILD_DIR}/tflite_runtime/__init__.py"
        <br>
              echo "__git_version__ = '$(git -C "${TENSORFLOW_DIR}"
        describe)'" &gt;&gt; "${BUILD_DIR}/tflite_runtime/__init__.py"
        <br>
        -
        <br>
        +
        <br>
      </blockquote>
      <br>
      ?
      <br>
      <br>
      <blockquote type="cite">      export
        PACKAGE_VERSION="${TENSORFLOW_VERSION}"
        <br>
              export PROJECT_NAME="tflite_runtime"
        <br>
              cp "${B}/_pywrap_tensorflow_interpreter_wrapper.so"
        "tflite_runtime"
        <br>
        -
        <br>
        +
        <br>
      </blockquote>
      <br>
      ?
      <br>
      <br>
      <blockquote type="cite">      setuptools3_do_compile
        <br>
          }
        <br>
            do_install() {
        <br>
              # Install tensorflow-lite dynamic library
        <br>
              install -d ${D}${libdir}
        <br>
        -    install -m 0644 ${B}/libtensorflow-lite.so.${MAJOR}
        ${D}${libdir}/libtensorflow-lite.so.${PV}
        <br>
        +    install -m 0644 ${B}/libtensorflow-lite.so.
        ${D}${libdir}/libtensorflow-lite.so.${PV}
        <br>
          -    ln -sf libtensorflow-lite.so.${PV}
        ${D}${libdir}/libtensorflow-lite.so.${MAJOR}
        <br>
        +    ln -sf libtensorflow-lite.so.${PV}
        ${D}${libdir}/libtensorflow-lite.so.${TF_MAJOR}
        <br>
              ln -sf libtensorflow-lite.so.${PV}
        ${D}${libdir}/libtensorflow-lite.so
        <br>
        -
        <br>
        +    ln -sf libtensorflow-lite.so.${PV}
        ${D}${libdir}/libtensorflow-lite.so.
        <br>
        +
        <br>
      </blockquote>
      <br>
      What is a symline with the name same as the above but with a "."
      at the end doing for us? <br>
      <br>
    </blockquote>
    benchmark_model needs 
    <style type="text/css">p, li { white-space: pre-wrap;</style>libtensorflow-lite.so.
    for benchmarking purpose. Without this the benchmarking fails when
    executing <span style="white-space: pre-wrap">/opt/tensorflow-lite/tools/benchmark_model</span>
    <style type="text/css">p, li { white-space: pre-wrap; }</style>
    <style type="text/css">p, li { white-space: pre-wrap; }</style>
    <style type="text/css">p, li { white-space: pre-wrap; }</style>
    <blockquote type="cite"
      cite="mid:192559e1-e712-4342-9a86-4cc8e54a402f@ti.com">
      <blockquote type="cite">      # armnn expects the the dynamic
        library of tensorflow lite to be named as "libtensorflowlite.so"
        <br>
              # Eg -
<a class="moz-txt-link-freetext" href="https://github.com/ARM-software/armnn/blob/branches/armnn_24_11/delegate/cmake/Modules/FindTfLite.cmake#L19">https://github.com/ARM-software/armnn/blob/branches/armnn_24_11/delegate/cmake/Modules/FindTfLite.cmake#L19</a><br>
              # Hence, create a symbolic link to handle the same
        <br>
        @@ -197,7 +199,7 @@ do_install() {
        <br>
                # Install pkgconfig file required for NNstreamer build
        <br>
              install -d ${D}${libdir}/pkgconfig
        <br>
        -    install -m 0644 ${WORKDIR}/tensorflow2-lite.pc.in
        ${D}${libdir}/pkgconfig/tensorflow2-lite.pc
        <br>
        +    install -m 0644 ${WORKDIR}/sources/tensorflow2-lite.pc.in
        ${D}${libdir}/pkgconfig/tensorflow2-lite.pc
        <br>
              sed -i 's:@version@:${PV}:g
        <br>
                      s:@libdir@:${libdir}:g
        <br>
                      s:@includedir@:${includedir}:g' \
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------Qrs657wmHagq5Mt9VPyJLvAp--

