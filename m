Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA07EEF33D
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 13:33:53 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44162.1772717632669717558
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 05:33:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=c2B/qx9/;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.57.26, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ve6z8auVz6rMvLCMRMDkfonvommtbX6r1OJdu11GNZhriJOioTVUw49fw67qXDsKVpDtRaHS59QPLljOxKh7ILfb/cQ8S8k+DVMwkNHJe2rwvIZlPtoiF8OBbENqTelQcYX51qPL3bakXysK1HeDAfN6veeJCI7HRGJ2+r22WjVkA64JukrqiumrEOpUJUrFQoflD+MZezHglLEwQ/EneBY3ayPlITiBSjbOvMeGApUzoP3L8m4HmFYqL3zkaZg2W0hMY3BrZ5ed5AbXKpm/h3JhBU5m4A3qK950F4FLOU6/ez9QGHFIYtuY1p5BxGaY9NRvdkiIlhM9lVwkJb2pvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DVR2XWUyVCSLxWNfIG5OvvfDZ0dQTC8oYz9WZ2ZfVI=;
 b=ntTk4+ojoIZeO0rSjurCSTHgXgpu2NBHaYSMNm7BqPzFAN6X5eUlp12fE/OYyPhovK/6m+Prv/0cazHsdYS1sdEKFj4K6eUc0eq25PfVnRT6yhXtuNW9y23nOF3/HxLWunfShL/N/NPTISQ3KlmmHFtEomgbaLSx1SSZDLBuV76GehwNWtjejYwXnTqBtw9fRerZls1IhO8tU6XF8ZbTTf8cBrnUA03K5YmkbaybMqwbjfcvB2EUZzKpzruu0vdlQk/QA3mBYhB5RSYV0uzA/0X2G9MAgi+Rau+QJNLVgvFUjf102UIU4aGUfQk+F8uX65LVy7yz0ayJfrv+R1We/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DVR2XWUyVCSLxWNfIG5OvvfDZ0dQTC8oYz9WZ2ZfVI=;
 b=c2B/qx9/FawU+dKvj6BFH0GTFOIsQIAge6ucGof3rTe9a/OEXIh2wXcCaFdXvM61g4zyhODMiuTewZY/DfTKhgZ7f+Rsr7Y5oLK500N+gAz+tBOlc44RKK+01cuew1bOHc1ZIR2QQ3hE+jJ0wNnvxyaX9G5lthYdZPmhi2ua29U=
Received: from MW3PR05CA0024.namprd05.prod.outlook.com (2603:10b6:303:2b::29)
 by IA0PR10MB7604.namprd10.prod.outlook.com (2603:10b6:208:48f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 13:33:49 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:303:2b:cafe::f1) by MW3PR05CA0024.outlook.office365.com
 (2603:10b6:303:2b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.13 via Frontend Transport; Thu,
 5 Mar 2026 13:33:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 13:33:47 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 07:33:47 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 07:33:47 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 07:33:47 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625DXkhB1919527;
	Thu, 5 Mar 2026 07:33:46 -0600
Message-ID: <63a70bec-83e8-4758-97f5-1acf1d30bf5e@ti.com>
Date: Thu, 5 Mar 2026 07:33:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 3/4] tensorflow-lite: upgrade 2.18.0
 -> 2.20.0
To: Pratham Deshmukh <p-deshmukh@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>, <khasim@ti.com>
References: <20260304123221.1450993-1-p-deshmukh@ti.com>
 <20260304123221.1450993-4-p-deshmukh@ti.com>
 <192559e1-e712-4342-9a86-4cc8e54a402f@ti.com>
 <6b2dc5af-505e-44a3-9c5f-a658c1c87b42@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <6b2dc5af-505e-44a3-9c5f-a658c1c87b42@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|IA0PR10MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: dbe36351-74a2-4593-3ed2-08de7abbd4c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|34020700016|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: 
	lIODEKSBkG4cjVVc/vHuFKGu/E/xEbgLJ84GJ+uFWfmCkq4yJKAMb6l/p+ZH9aAceEwjSkQ3Z0uPncZfmf5qXGRRkRIxDsghqLTKhgBSyqQ/YfFIB8T82Rt1p4GCLEl5JbJ7PPeq4nilR83U12kraVk8IZxuhQzsmhGUr0DCsni7WXQEQPBoRYs1WA+4kmOoTWKBj9mtaI6ihdd/jiZLNndWMEbWZhpaYHwtmx8t9raNNZ8EcwIT7Pq/hYLymqgJ/vRCyiGPhEKYJm5vJdy5kmGAIhayZv2j87iHWM0Nh7Biv3JjSKyzjUSgwp0CyovR1ouxmc+fzW4TDOqw05D/Eq+kBrsf8byYM4vSI348NSj+yWx8eT5WJrTVdnL7KQQrvbj9/CnUbJ30wHPYFLoJEpY9+83I81Vh/UQpdFxyM4n+PyYCS2dzLpdqU8Y/4YVLq7q92RFZq0ZcrIxaMSsNNdUyTOd38H9Goa7N67Ef91xiuFPXTFunaX7z3SrKBzPeCb/5jLhhRreXxdx7wqVJ1IowW/O7cpG8Cjuwrt/ErrsL5/uTPtyM7sbLKoc/gVgexoEspLCjxo+M/yACs+zC/Wq8/v3mZ0TD8/C6Ua5lRc8sxm0sDs1vnEi5dP07wyJahmMMVFG9wxN1LOiQ/XT4XXloBpt7XBbnrR9lFWB6j6/HKXs+jBon9MTCeGC4d5G7wBgi96/IncGZ52WrlNF65GMDI+S0Kvl/CXXYnltrzi8=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(34020700016)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+cM22KT7Hb3rOCPmjcFpJpr5n6DJVYqqCEDKAIfHvZa8joE6e+z8Jk8JT5khiSEKYq8xkFWQ9P0zEC7DtYFskUPzm4l7OGO+ti0xi1shi1UEsDCXmpR/fkdP/K3uCVAXDG3k5fvxd2cikRSd0Lo5i2FwDMERLP7fCrx38bz9S7+D8pvJxDJSX5kGZWknBmyW9Jc0UvvoLprBpEU1Fnv+LtkUM9smf+gfsLlDSzLJPKxbVsNh/LWkZzH5FDv2JYeIuluz9gE7clmsorpDsJTdh597/HT3gQ9vhUqCH/f435TLbBlJFoXJPdlSWXdXltfivRVa0YljfuQ099vMHeMM6nHU1wMQPF6CdmhDhCd7x2ADbdBGZTtcpfmGp9CFQeQ3PvaEzK3WhrPBk5x6DFQ7CBMCC3ASnWRvlGJJeSNfGDgB38TsWVLEspO1THL1ID9/
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 13:33:47.9126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe36351-74a2-4593-3ed2-08de7abbd4c7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7604
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 13:33:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17229

On 3/5/26 3:08 AM, Pratham Deshmukh wrote:
> On 04/03/26 10:21 pm, Andrew Davis wrote:
>> On 3/4/26 6:32 AM, Pratham Deshmukh wrote:
>>> We are migrating Tensorflow-Lite from v2.18.0 to the
>>> stable release v2.20.0
>>>
>>> Key Changes:
>>> =C2=A0 - Pin flatbuffers-native and protobuf-native to use the same ver=
sion as
>>> =C2=A0=C2=A0=C2=A0 TensorFlow Lite 2.20.0 to avoid version mismatch
>>> =C2=A0 - Updated SRCREV for all the dependencies
>>> =C2=A0 - Updated recipe to meet the build compatibilty
>>>
>>> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
>>> ---
>>> =C2=A0 .../flatbuffers/flatbuffers-arago.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +++
>>> =C2=A0 .../flatbuffers/flatbuffers.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++
>>> =C2=A0 .../protobuf/protobuf-arago.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 +++++++
>>> =C2=A0 .../protobuf/protobuf_%.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++
>>> =C2=A0 ...te_2.18.0.bb =3D> tensorflow-lite_2.20.0.bb} | 52 ++++++++++-=
--------
>>> =C2=A0 5 files changed, 62 insertions(+), 25 deletions(-)
>>> =C2=A0 create mode 100644 meta-arago-extras/recipes-devtools/flatbuffer=
s/flatbuffers-arago.inc
>>> =C2=A0 create mode 100644 meta-arago-extras/recipes-devtools/flatbuffer=
s/flatbuffers.bbappend
>>> =C2=A0 create mode 100644 meta-arago-extras/recipes-devtools/protobuf/p=
rotobuf-arago.inc
>>> =C2=A0 create mode 100644 meta-arago-extras/recipes-devtools/protobuf/p=
rotobuf_%.bbappend
>>> =C2=A0 rename meta-arago-extras/recipes-framework/tensorflow-lite/{tens=
orflow-lite_2.18.0.bb =3D> tensorflow-lite_2.20.0.bb} (86%)
>>>
>>> diff --git a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers=
-arago.inc b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-ara=
go.inc
>>> new file mode 100644
>>> index 00000000..d85efc8b
>>> --- /dev/null
>>> +++ b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-arago.=
inc
>>> @@ -0,0 +1,8 @@
>>> +# Pin flatbuffers-native to use the same version as TensorFlow Lite 2.=
20.0
>>> +# to avoid version mismatch errors
>>> +
>>> +# Override version to match
>>> +PV =3D "24.3.25"
>>> +
>>> +# Use specific commit hash that corresponds to v24.3.25 tag
>>> +SRCREV =3D "595bf0007ab1929570c7671f091313c8fc20644e"
>>> diff --git a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers=
.bbappend b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbap=
pend
>>> new file mode 100644
>>> index 00000000..2a627698
>>> --- /dev/null
>>> +++ b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbappe=
nd
>>> @@ -0,0 +1,4 @@
>>> +# Conditionally include Arago-specific customizations for flatbuffers-=
native
>>> +FLATBUFFERS_ARAGO =3D ""
>>> +FLATBUFFERS_ARAGO:arago =3D "flatbuffers-arago.inc"
>>> +require ${FLATBUFFERS_ARAGO}
>>> diff --git a/meta-arago-extras/recipes-devtools/protobuf/protobuf-arago=
.inc b/meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc
>>> new file mode 100644
>>> index 00000000..489b1444
>>> --- /dev/null
>>> +++ b/meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc
>>> @@ -0,0 +1,18 @@
>>> +# Pin protobuf-native to use the same version as TensorFlow Lite 2.20.=
0
>>> +# to avoid version mismatch errors
>>> +
>>> +# Override version to match
>>> +PV =3D "3.21.9"
>>> +
>>> +# Use specific commit hash that corresponds to v24.3.25 tag
>>> +SRCREV =3D "90b73ac3f0b10320315c2ca0d03a5a9b095d2f66"
>>> +
>>> +# Override SRC_URI to use 3.21.x branch and remove incompatible patche=
s
>>> +SRC_URI =3D "git://github.com/protocolbuffers/protobuf.git;branch=3Dma=
in;protocol=3Dhttps \
>>> + file://run-ptest \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>> +
>>> +LIC_FILES_CHKSUM =3D " \
>>> + file://LICENSE;md5=3D37b5762e07f0af8c74ce80a8bda4266b \
>>> + file://third_party/utf8_range/LICENSE;md5=3Def460f31070fd7184bd9059de=
2e4b132 \
>>> +"
>>> diff --git a/meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bba=
ppend b/meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend
>>> new file mode 100644
>>> index 00000000..51c679a5
>>> --- /dev/null
>>> +++ b/meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend
>>> @@ -0,0 +1,5 @@
>>> +# Conditionally include Arago-specific customizations for flatbuffers-=
native
>>> +PROTOBUF_ARAGO =3D ""
>>> +PROTOBUF_ARAGO:arago =3D "protobuf-arago.inc"
>>> +
>>> +require ${PROTOBUF_ARAGO}
>>> diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensor=
flow-lite_2.18.0.bb b/meta-arago-extras/recipes-framework/tensorflow-lite/t=
ensorflow-lite_2.20.0.bb
>>> similarity index 86%
>>> rename from meta-arago-extras/recipes-framework/tensorflow-lite/tensorf=
low-lite_2.18.0.bb
>>> rename to meta-arago-extras/recipes-framework/tensorflow-lite/tensorflo=
w-lite_2.20.0.bb
>>> index c76939ac..57278f5b 100644
>>> --- a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-li=
te_2.18.0.bb
>>> +++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-li=
te_2.20.0.bb
>>> @@ -8,18 +8,19 @@ LICENSE =3D "Apache-2.0"
>>> =C2=A0 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4158a261ca7f2525513e3=
1ba9c50ae98"
>>> =C2=A0 =C2=A0 # Get major of the PV variable
>>> -MAJOR =3D "${@d.getVar('PV').split('.')[0]}"
>>> +TF_MAJOR =3D "${@d.getVar('PV').split('.')[0]}"
>>> +TF_MINOR =3D "${@d.getVar('PV').split('.')[1]}"
>>> +TF_PATCH =3D "${@(d.getVar('PV').split('.') + ['0', '0'])[2]}"
>>> =C2=A0 =C2=A0 SRC_URI =3D " \
>>> - git://github.com/tensorflow/tensorflow.git;protocol=3Dhttps;branch=3D=
r2.18 \
>>> + git://github.com/tensorflow/tensorflow.git;protocol=3Dhttps;branch=3D=
r2.20 \
>>> file://0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch =
\
>>> file://0002-lite-Update-CMakeLists-for-building-shared-object-li.patch =
\
>>> - file://0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patc=
h \
>>> file://tensorflow2-lite.pc.in \
>>> =C2=A0 "
>>> =C2=A0 =C2=A0 SRC_URI +=3D " \
>>> - git://github.com/abseil/abseil-cpp.git;protocol=3Dhttps;branch=3Dlts_=
2023_08_02;name=3Dabseil-cpp;destsuffix=3D${S}/external/abseil-cpp \
>>> + git://github.com/abseil/abseil-cpp.git;protocol=3Dhttps;branch=3Dlts_=
2025_01_27;name=3Dabseil-cpp;destsuffix=3D${S}/external/abseil-cpp \
>>> git://gitlab.com/libeigen/eigen.git;protocol=3Dhttps;branch=3Dmaster;na=
me=3Deigen;destsuffix=3D${S}/external/eigen \
>>> git://github.com/google/farmhash.git;protocol=3Dhttps;branch=3Dmaster;n=
ame=3Dfarmhash;destsuffix=3D${S}/external/farmhash \
>>> git://github.com/petewarden/OouraFFT.git;protocol=3Dhttps;branch=3Dmast=
er;name=3Dfft2d;destsuffix=3D${S}/external/fft2d \
>>> @@ -28,35 +29,35 @@ SRC_URI +=3D " \
>>> git://github.com/jax-ml/ml_dtypes.git;branch=3Dmain;protocol=3Dhttps;na=
me=3Dml_dtypes;destsuffix=3D${S}/external/ml_dtypes \
>>> git://github.com/google/ruy.git;branch=3Dmaster;protocol=3Dhttps;name=
=3Druy;destsuffix=3D${S}/external/ruy \
>>> git://github.com/google/flatbuffers;branch=3Dmaster;protocol=3Dhttps;na=
me=3Dflatbuffers;destsuffix=3D${S}/external/flatbuffers \
>>> - git://github.com/Maratyszcza/pthreadpool.git;branch=3Dmaster;protocol=
=3Dhttps;name=3Dpthreadpool-source;destsuffix=3D${S}/external/pthreadpool-s=
ource \
>>> + git://github.com/google/pthreadpool.git;branch=3Dmain;protocol=3Dhttp=
s;name=3Dpthreadpool-source;destsuffix=3D${S}/external/pthreadpool-source \
>>> git://github.com/google/XNNPACK.git;branch=3Dmaster;protocol=3Dhttps;na=
me=3Dxnnpack;destsuffix=3D${S}/external/xnnpack \
>>> git://github.com/Maratyszcza/FXdiv.git;branch=3Dmaster;protocol=3Dhttps=
;name=3DFXdiv-source;destsuffix=3D${S}/external/FXdiv-source \
>>> git://github.com/Maratyszcza/FP16.git;branch=3Dmaster;protocol=3Dhttps;=
name=3DFP16-source;destsuffix=3D${S}/external/FP16-source \
>>> git://git.gitlab.arm.com/kleidi/kleidiai.git;branch=3Dmain;protocol=3Dh=
ttps;name=3Dkleidiai;destsuffix=3D${S}/external/kleidiai \
>>> git://github.com/Maratyszcza/psimd.git;branch=3Dmaster;protocol=3Dhttps=
;name=3Dpsimd;destsuffix=3D${S}/external/psimd \
>>> - git://github.com/protocolbuffers/protobuf.git;branch=3D25.x;protocol=
=3Dhttps;name=3Dprotobuf;destsuffix=3D${S}/external/protobuf \
>>> + git://github.com/protocolbuffers/protobuf.git;branch=3Dmain;protocol=
=3Dhttps;name=3Dprotobuf;destsuffix=3D${S}/external/protobuf \
>>> =C2=A0 "
>>> =C2=A0 =C2=A0 SRCREV_FORMAT =3D "default"
>>> =C2=A0 =C2=A0 # Matches v${PV} tag
>>> -SRCREV =3D "6550e4bd80223cdb8be6c3afd1f81e86a4d433c3"
>>> -SRCREV_abseil-cpp =3D "fb3621f4f897824c0dbe0615fa94543df6192f30"
>>> +SRCREV =3D "72fbba3d20f4616d7312b5e2b7f79daf6e82f2fa"
>>> +SRCREV_abseil-cpp =3D "d9e4955c65cd4367dd6bf46f4ccb8cd3d100540b"
>>> =C2=A0 SRCREV_eigen =3D "33d0937c6bdf5ec999939fb17f2a553183d14a74"
>>> =C2=A0 SRCREV_farmhash =3D "0d859a811870d10f53a594927d0d0b97573ad06d"
>>> =C2=A0 SRCREV_fft2d =3D "c6fd2dd6d21397baa6653139d31d84540d5449a2"
>>> =C2=A0 SRCREV_gemmlowp =3D "16e8662c34917be0065110bfcd9cc27d30f52fdf"
>>> -SRCREV_cpuinfo =3D "b73ae6ce38d5dd0b7fe46dbe0a4b5f4bab91c7ea"
>>> +SRCREV_cpuinfo =3D "de0ce7c7251372892e53ce9bc891750d2c9a4fd8"
>>> =C2=A0 SRCREV_ml_dtypes =3D "24084d9ed2c3d45bf83b7a9bff833aa185bf9172"
>>> =C2=A0 SRCREV_ruy =3D "3286a34cc8de6149ac6844107dfdffac91531e72"
>>> =C2=A0 SRCREV_flatbuffers =3D "e6463926479bd6b330cbcf673f7e917803fd5831=
"
>>> -SRCREV_pthreadpool-source =3D "4fe0e1e183925bf8cfa6aae24237e724a96479b=
8"
>>> -SRCREV_xnnpack =3D "6b83f69d4938da4dc9ad63c00bd13e9695659a51"
>>> +SRCREV_pthreadpool-source =3D "c2ba5c50bb58d1397b693740cf75fad836a0d1b=
f"
>>> +SRCREV_xnnpack =3D "585e73e63cb35c8a416c83a48ca9ab79f7f7d45e"
>>> =C2=A0 SRCREV_FXdiv-source =3D "63058eff77e11aa15bf531df5dd34395ec3017c=
8"
>>> -SRCREV_FP16-source =3D "0a92994d729ff76a58f692d3028ca1b64b145d91"
>>> -SRCREV_kleidiai =3D "cddf991af5de49fd34949fa39690e4e906e04074"
>>> +SRCREV_FP16-source =3D "4dfe081cf6bcd15db339cf2680b9281b8451eeb3"
>>> +SRCREV_kleidiai =3D "dc69e899945c412a8ce39ccafd25139f743c60b1"
>>> =C2=A0 SRCREV_psimd =3D "072586a71b55b7f8c584153d223e95687148a900"
>>> -SRCREV_protobuf =3D "4a2aef570deb2bfb8927426558701e8bfc26f2a4"
>>> +SRCREV_protobuf =3D "90b73ac3f0b10320315c2ca0d03a5a9b095d2f66"
>>> =C2=A0 =C2=A0 inherit setuptools3 cmake
>>> =C2=A0 @@ -91,7 +92,7 @@ OECMAKE_SOURCEPATH =3D "${S}/tensorflow/lite"
>>> =C2=A0 # to further optimize the build for production use.
>>> =C2=A0 # Hence, activate -O3 optimization and disable debug symbols.
>>> =C2=A0 OECMAKE_C_FLAGS_RELEASE =3D "-O3 -DNDEBUG"
>>> -OECMAKE_CXX_FLAGS_RELEASE =3D "-O3 -DNDEBUG -flax-vector-conversions"
>>> +OECMAKE_CXX_FLAGS_RELEASE =3D "-O3 -DNDEBUG -flax-vector-conversions -=
DTF_MAJOR_VERSION=3D${TF_MAJOR} -DTF_MINOR_VERSION=3D${TF_MINOR} -DTF_PATCH=
_VERSION=3D${TF_PATCH} -DTF_VERSION_SUFFIX=3D\"\""
>>> =C2=A0 =C2=A0 OECMAKE_C_FLAGS_RELEASE:append:arm =3D " -march=3Darmv7-a=
 -mfpu=3Dneon"
>>> =C2=A0 OECMAKE_CXX_FLAGS_RELEASE:append:arm =3D " -march=3Darmv7-a -mfp=
u=3Dneon"
>>> @@ -112,9 +113,8 @@ EXTRA_OECMAKE:append =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DCMAKE_SYSTEM_PROCESSOR=3D${TENSORFLOW_=
TARGET_ARCH} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DCMAKE_VERBOSE_MAKEFILE:BOOL=3DON \
>>> -DPYTHON_TARGET_INCLUDE=3D${RECIPE_SYSROOT}${includedir}/${PYTHON_DIR} =
\
>>> - -DNUMPY_TARGET_INCLUDE=3D${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/=
numpy/core/include \
>>> + -DNUMPY_TARGET_INCLUDE=3D${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/=
numpy/_core/include \
>>> -DPYBIND11_TARGET_INCLUDE=3D${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}=
/pybind11/include \
>>> -=C2=A0=C2=A0=C2=A0 -DTFLITE_VERSION_MAJOR=3D${MAJOR}=C2=A0 \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DTFLITE_HOST_TOOLS_DIR=3D${STAGING_BIND=
IR_NATIVE} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DPTHREADPOOL_SOURCE_DIR=3D${S}/external=
/pthreadpool-source \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DFXDIV_SOURCE_DIR=3D${S}/external/FXdiv=
-source \
>>> @@ -122,6 +122,8 @@ EXTRA_OECMAKE:append =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DCPUINFO_SOURCE_DIR=3D${S}/external/cpu=
info \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DKLEIDIAI_SOURCE_DIR=3D${S}/external/kl=
eidiai \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DPSIMD_SOURCE_DIR=3D${S}/external/psimd=
 \
>>> +=C2=A0=C2=A0=C2=A0 -DCMAKE_CXX_STANDARD=3D17 \
>>> +=C2=A0=C2=A0=C2=A0 -DCMAKE_CXX_STANDARD_REQUIRED=3DON \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --compile-no-warning-as-error \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --log-level=3DVERBOSE \
>>> =C2=A0 "
>>> @@ -130,7 +132,6 @@ do_configure:prepend() {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for i in abseil-cpp cpuinfo eigen farmha=
sh fft2d flatbuffers FP16-source FXdiv-source gemmlowp kleidiai ml_dtypes p=
simd protobuf pthreadpool-source ruy xnnpack; do
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp -ra ${S}/exte=
rnal/$i ${B}/$i
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
>>> -
>>
>> Random whitespace change
>>
> I'll fix this.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # There is no Fortran compiler in the to=
olchain, but bitbake sets this variable anyway with unavailable
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # binary & it leads to "CMake Error: Cou=
ld not find compiler set in environment variable FC:"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unset FC
>>> @@ -143,7 +144,7 @@ do_compile:append() {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUILD_DIR=3D${B}
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TENSORFLOW_DIR=3D${S}
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TENSORFLOW_LITE_DIR=3D"${TENSORFLOW_DIR}=
/tensorflow/lite"
>>> -=C2=A0=C2=A0=C2=A0 TENSORFLOW_VERSION=3D$(grep "_VERSION =3D " "${TENS=
ORFLOW_DIR}/tensorflow/tools/pip_package/setup.py" | cut -d=3D -f2 | sed "s=
/[ '-]//g")
>>> +=C2=A0=C2=A0=C2=A0 TENSORFLOW_VERSION=3D$(grep "_VERSION =3D " "${TENS=
ORFLOW_DIR}/tensorflow/tools/pip_package/setup.py.tpl" | cut -d=3D -f2 | se=
d "s/[ '-]//g")
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p "${B}/tflite_runtime"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp -r "${TENSORFLOW_LITE_DIR}/tools/pip_=
package/debian" \
>>> "${TENSORFLOW_LITE_DIR}/tools/pip_package/MANIFEST.in" \
>>> @@ -156,22 +157,23 @@ do_compile:append() {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "${B}/tflite_runtime"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "__version__ =3D '${TENSORFLOW_VERS=
ION}'" >> "${BUILD_DIR}/tflite_runtime/__init__.py"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "__git_version__ =3D '$(git -C "${T=
ENSORFLOW_DIR}" describe)'" >> "${BUILD_DIR}/tflite_runtime/__init__.py"
>>> -
>>> +
>>
>> ?
>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export PACKAGE_VERSION=3D"${TENSORFLOW_V=
ERSION}"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export PROJECT_NAME=3D"tflite_runtime"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp "${B}/_pywrap_tensorflow_interpreter_=
wrapper.so" "tflite_runtime"
>>> -
>>> +
>>
>> ?
>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 setuptools3_do_compile
>>> =C2=A0 }
>>> =C2=A0 =C2=A0 do_install() {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Install tensorflow-lite dynamic librar=
y
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${libdir}
>>> -=C2=A0=C2=A0=C2=A0 install -m 0644 ${B}/libtensorflow-lite.so.${MAJOR}=
 ${D}${libdir}/libtensorflow-lite.so.${PV}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${B}/libtensorflow-lite.so. ${D}${l=
ibdir}/libtensorflow-lite.so.${PV}
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 ln -sf libtensorflow-lite.so.${PV} ${D}${lib=
dir}/libtensorflow-lite.so.${MAJOR}
>>> +=C2=A0=C2=A0=C2=A0 ln -sf libtensorflow-lite.so.${PV} ${D}${libdir}/li=
btensorflow-lite.so.${TF_MAJOR}
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ln -sf libtensorflow-lite.so.${PV} ${D}$=
{libdir}/libtensorflow-lite.so
>>> -
>>> +=C2=A0=C2=A0=C2=A0 ln -sf libtensorflow-lite.so.${PV} ${D}${libdir}/li=
btensorflow-lite.so.
>>> +
>>
>> What is a symline with the name same as the above but with a "." at the =
end doing for us?
>>
> benchmark_model needs libtensorflow-lite.so. for benchmarking purpose. Wi=
thout this the benchmarking fails when executing /opt/tensorflow-lite/tools=
/benchmark_model

It needs a library that ends in "."? Not sure I beleive that, and if so the=
n that is a
bug you should fix and add a patch.

Andrew

>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # armnn expects the the dynamic library =
of tensorflow lite to be named as "libtensorflowlite.so"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Eg - https://github.com/ARM-software/a=
rmnn/blob/branches/armnn_24_11/delegate/cmake/Modules/FindTfLite.cmake#L19
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Hence, create a symbolic link to handl=
e the same
>>> @@ -197,7 +199,7 @@ do_install() {
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Install pkgconfig file required=
 for NNstreamer build
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${libdir}/pkgconfig
>>> -=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/tensorflow2-lite.pc.in $=
{D}${libdir}/pkgconfig/tensorflow2-lite.pc
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/sources/tensorflow2-lite=
.pc.in ${D}${libdir}/pkgconfig/tensorflow2-lite.pc
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i 's:@version@:${PV}:g
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 s:@libdir@:${libdir}:g
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 s:@includedir@:${includedir}:g' \
>>


