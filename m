Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B12EFCE59
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 13:36:33 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44214.1772717790557764105
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 05:36:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=HX/vUsX6;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.55, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9dOC81nhwZExiW+itfY8dpDj2CTvAK71HPF7Ema9rs3jgn0YWePmEcvzfbMKfCBv+1nBSFlGQURCJj71JA6cY4Oqbsnam1KfE6eGSiznnue+98HTOlojWwLIzHjVbScJNeAtzlpQ2Iqs2VzSBbYsONGKPHJ/RV6Irv37l6DJNRiyI7nzxmNXzS5XPRRbH+Pc4dSxCQ9G5Wqx7SiG5yjMJJgI435IiK+vK+EbQbx+4E90cQTYYaaqpwfZyjxeYzpBrYNfCmGqrrzj3e9UuR6/EKWSCG22VJIzK8KP54iz6cBxHcJy/NpxsAwsO3JxWn3ggh70x4IG6DcyMIVgzScsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRe3eTwKygWl31G0di7V/fQcL4CrkI5IDxnk2W90UFU=;
 b=avRQ94zj++QJWMi03REnG3W9sri2D6Ua6+me+DPHrXfxlVETTyErf7PTdqAaeWtVp2wEilzKJVRX0TabpzRNimFQ1jshS2cSwT5nzwoQZK2CLZnSj+8eSoYti1dy85+YCKaqWqFtDmzpg1l6B2axJZZz0Ec7XSIEsIlFFOMl2qI+t4q/9KhOhhtfSqG6aKR0k4LvA4LOPGXKhT2Y/xDWbJ/giaFwMt+eurOCwaCndDTWL+0/V/OyKijgQL5XAhfo0cmr+R73yhKRE5hBS5nd19C26LZ0cgR8cMpD88mZvpVwMn4dlDZMeg5rCgN1hpgfqeISdPfv75cA36V96cRvxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRe3eTwKygWl31G0di7V/fQcL4CrkI5IDxnk2W90UFU=;
 b=HX/vUsX6sShxoi7ZzkcxOnyBN6oSxL8pvf2UxC/a2rUXFkkxDdYUM0qiB0fBhMhPqGdDrySIpC2nMn+I047uqfo+UOQszP3OyhirOwttAltrVVR9kOdxkTt/DRSWdHv5olNygjbYwJv9jppfYYZJ7365NOfPSze9ZMWFtNLLZDU=
Received: from SJ0PR05CA0024.namprd05.prod.outlook.com (2603:10b6:a03:33b::29)
 by PH3PPF0A8D5CDB5.namprd10.prod.outlook.com (2603:10b6:518:1::788) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 13:36:28 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:a03:33b:cafe::18) by SJ0PR05CA0024.outlook.office365.com
 (2603:10b6:a03:33b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 13:36:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 13:36:26 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 07:36:25 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 07:36:25 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 07:36:25 -0600
Received: from [172.24.233.101] (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625DaMgo2418047;
	Thu, 5 Mar 2026 07:36:23 -0600
Message-ID: <54683d99-530f-4cd2-8c74-11a293ff5ab1@ti.com>
Date: Thu, 5 Mar 2026 19:06:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 3/4] tensorflow-lite: upgrade 2.18.0
 -> 2.20.0
To: Andrew Davis <afd@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>, <khasim@ti.com>
References: <20260304123221.1450993-1-p-deshmukh@ti.com>
 <20260304123221.1450993-4-p-deshmukh@ti.com>
 <192559e1-e712-4342-9a86-4cc8e54a402f@ti.com>
 <6b2dc5af-505e-44a3-9c5f-a658c1c87b42@ti.com>
 <63a70bec-83e8-4758-97f5-1acf1d30bf5e@ti.com>
Content-Language: en-US
From: Pratham Deshmukh <p-deshmukh@ti.com>
In-Reply-To: <63a70bec-83e8-4758-97f5-1acf1d30bf5e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|PH3PPF0A8D5CDB5:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fed7d6a-7b04-4a60-b1dd-08de7abc333c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|34020700016|376014|36860700016|7142099003;
X-Microsoft-Antispam-Message-Info: 
	qf6cqfMwV9HKC7TzhE5IH6pYfiSkIMljbTjRMgt86Vv08tvWyF0VHGGZt87bW8pYrOQjd0+tnW7D2hMJMl9UE0cvGuvvXhHc/dW1V7SxLsYhpeEFhLHYfZUi699mDbDakIGZt8nol+BzdlI72AfUK4FLB3MZ0o4s23YhGktSqI+MEUUGt/tJSIFjzoWDGXCDDSG9f5zgcrFeYxCluIkCFu+mc12qE3llW2GTv+PVRM0vSSBTt2EaB8x3cfNaCjPcZFDEEoDQMzSMG/8C9hASEqV9rsCG9IbnWucU3voBXz/J9CvvLBurNGAr/QlO/4WaNF0KtFygIH+0BpjEEa0M3FUkHiCWaAqFElnYEsYn3kNOgHytz7G7kkk0Ej2VcXv0myZO/aW0f6Q+8Vj4+vYpbdhyCEODDpTyVxXghVB9TQr5lxrUHLsqGm6OplBeGeotMT4md7NRmb1nraT4BjMb5s7kpGuQt/AL5Or3REOqb6Yy9To9UfnZ6aujO8yyD6mp/laTg9QCQfqb8BFBH0UF7UxRi3NCmk7GqR3yzwTmVf2lt7lM7S2Pf3OLdqc8kvmPNEIYleffe13j5GnD8wVN3VWeLQxGb0hLLOF9pApapvonw8r1lpBUFxzWfOX2Z5npuNhMpv1T1eeXtwnfcF2PI/vyE2vaxLgX9vtHCiV7PYkG0ZkX6JTIyr305kO9Jp9DU2OpbtqiicQIVaj+LKrdGKsr07nRoX5jjCQWsAtICZQ=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(34020700016)(376014)(36860700016)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	W1rgtr9N1E52+XEOW5MqJvRXh7H0Ob8czPpO7vyP7NNyOY6njf2pINgQD9T2q9uJFkmkD86KZCmWMKIAaIWehI4wVRFynl4+3DYf1tJtN+SkIvN3Es9NFToGiTWKq1rrMXknTWfk6/PgIleOHeszqdz8W7ueyVPGzeKC8a7zrWnia5na8aMarUMw0Ji82aUGgOXQIk0lGe0uHvvhJ8mFwCRa34zuJf7kTqJfrpFLGi+qTm9IlSsKpeSux1/gKdYFiGzKTJdBdb2Qz7c11QtF0b3xp/QoWTjOc7az/9rKV5cakqqs0tC88T+Q5McFrNW/i/kvWQiPf6V8Ac2MQi00z+c1gsYOy2F1dcKR0la8rF3yed59TwqD0jjSGsIy1XHPuHgCsAQxj+kDoNR+GFAB4W1rwj7cwswOGwZGy4R/KGGhtlCYR1r4wk67AYWSQCAO
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 13:36:26.3891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fed7d6a-7b04-4a60-b1dd-08de7abc333c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF0A8D5CDB5
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 13:36:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17230


On 05/03/26 7:03 pm, Andrew Davis wrote:
> On 3/5/26 3:08 AM, Pratham Deshmukh wrote:
>> On 04/03/26 10:21 pm, Andrew Davis wrote:
>>> On 3/4/26 6:32 AM, Pratham Deshmukh wrote:
>>>> We are migrating Tensorflow-Lite from v2.18.0 to the
>>>> stable release v2.20.0
>>>>
>>>> Key Changes:
>>>> =C2=A0 - Pin flatbuffers-native and protobuf-native to use the same=20
>>>> version as
>>>> =C2=A0=C2=A0=C2=A0 TensorFlow Lite 2.20.0 to avoid version mismatch
>>>> =C2=A0 - Updated SRCREV for all the dependencies
>>>> =C2=A0 - Updated recipe to meet the build compatibilty
>>>>
>>>> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
>>>> ---
>>>> =C2=A0 .../flatbuffers/flatbuffers-arago.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +++
>>>> =C2=A0 .../flatbuffers/flatbuffers.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++
>>>> =C2=A0 .../protobuf/protobuf-arago.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 +++++++
>>>> =C2=A0 .../protobuf/protobuf_%.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++
>>>> =C2=A0 ...te_2.18.0.bb =3D> tensorflow-lite_2.20.0.bb} | 52=20
>>>> ++++++++++---------
>>>> =C2=A0 5 files changed, 62 insertions(+), 25 deletions(-)
>>>> =C2=A0 create mode 100644=20
>>>> meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-arago.inc
>>>> =C2=A0 create mode 100644=20
>>>> meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbappend
>>>> =C2=A0 create mode 100644=20
>>>> meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc
>>>> =C2=A0 create mode 100644=20
>>>> meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend
>>>> =C2=A0 rename=20
>>>> meta-arago-extras/recipes-framework/tensorflow-lite/{tensorflow-lite_2=
.18.0.bb=20
>>>> =3D> tensorflow-lite_2.20.0.bb} (86%)
>>>>
>>>> diff --git=20
>>>> a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-arago.inc=
=20
>>>> b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-arago.inc
>>>> new file mode 100644
>>>> index 00000000..d85efc8b
>>>> --- /dev/null
>>>> +++=20
>>>> b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-arago.inc
>>>> @@ -0,0 +1,8 @@
>>>> +# Pin flatbuffers-native to use the same version as TensorFlow=20
>>>> Lite 2.20.0
>>>> +# to avoid version mismatch errors
>>>> +
>>>> +# Override version to match
>>>> +PV =3D "24.3.25"
>>>> +
>>>> +# Use specific commit hash that corresponds to v24.3.25 tag
>>>> +SRCREV =3D "595bf0007ab1929570c7671f091313c8fc20644e"
>>>> diff --git=20
>>>> a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbappend=
=20
>>>> b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbappend
>>>> new file mode 100644
>>>> index 00000000..2a627698
>>>> --- /dev/null
>>>> +++=20
>>>> b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbappend
>>>> @@ -0,0 +1,4 @@
>>>> +# Conditionally include Arago-specific customizations for=20
>>>> flatbuffers-native
>>>> +FLATBUFFERS_ARAGO =3D ""
>>>> +FLATBUFFERS_ARAGO:arago =3D "flatbuffers-arago.inc"
>>>> +require ${FLATBUFFERS_ARAGO}
>>>> diff --git=20
>>>> a/meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc=20
>>>> b/meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc
>>>> new file mode 100644
>>>> index 00000000..489b1444
>>>> --- /dev/null
>>>> +++ b/meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc
>>>> @@ -0,0 +1,18 @@
>>>> +# Pin protobuf-native to use the same version as TensorFlow Lite=20
>>>> 2.20.0
>>>> +# to avoid version mismatch errors
>>>> +
>>>> +# Override version to match
>>>> +PV =3D "3.21.9"
>>>> +
>>>> +# Use specific commit hash that corresponds to v24.3.25 tag
>>>> +SRCREV =3D "90b73ac3f0b10320315c2ca0d03a5a9b095d2f66"
>>>> +
>>>> +# Override SRC_URI to use 3.21.x branch and remove incompatible=20
>>>> patches
>>>> +SRC_URI =3D=20
>>>> "git://github.com/protocolbuffers/protobuf.git;branch=3Dmain;protocol=
=3Dhttps=20
>>>> \
>>>> + file://run-ptest \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>>> +
>>>> +LIC_FILES_CHKSUM =3D " \
>>>> + file://LICENSE;md5=3D37b5762e07f0af8c74ce80a8bda4266b \
>>>> +=20
>>>> file://third_party/utf8_range/LICENSE;md5=3Def460f31070fd7184bd9059de2=
e4b132=20
>>>> \
>>>> +"
>>>> diff --git=20
>>>> a/meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend=20
>>>> b/meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend
>>>> new file mode 100644
>>>> index 00000000..51c679a5
>>>> --- /dev/null
>>>> +++ b/meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend
>>>> @@ -0,0 +1,5 @@
>>>> +# Conditionally include Arago-specific customizations for=20
>>>> flatbuffers-native
>>>> +PROTOBUF_ARAGO =3D ""
>>>> +PROTOBUF_ARAGO:arago =3D "protobuf-arago.inc"
>>>> +
>>>> +require ${PROTOBUF_ARAGO}
>>>> diff --git=20
>>>> a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_=
2.18.0.bb=20
>>>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_=
2.20.0.bb=20
>>>>
>>>> similarity index 86%
>>>> rename from=20
>>>> meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.=
18.0.bb
>>>> rename to=20
>>>> meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.=
20.0.bb
>>>> index c76939ac..57278f5b 100644
>>>> ---=20
>>>> a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_=
2.18.0.bb
>>>> +++=20
>>>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_=
2.20.0.bb
>>>> @@ -8,18 +8,19 @@ LICENSE =3D "Apache-2.0"
>>>> =C2=A0 LIC_FILES_CHKSUM =3D=20
>>>> "file://LICENSE;md5=3D4158a261ca7f2525513e31ba9c50ae98"
>>>> =C2=A0 =C2=A0 # Get major of the PV variable
>>>> -MAJOR =3D "${@d.getVar('PV').split('.')[0]}"
>>>> +TF_MAJOR =3D "${@d.getVar('PV').split('.')[0]}"
>>>> +TF_MINOR =3D "${@d.getVar('PV').split('.')[1]}"
>>>> +TF_PATCH =3D "${@(d.getVar('PV').split('.') + ['0', '0'])[2]}"
>>>> =C2=A0 =C2=A0 SRC_URI =3D " \
>>>> -=20
>>>> git://github.com/tensorflow/tensorflow.git;protocol=3Dhttps;branch=3Dr=
2.18=20
>>>> \
>>>> +=20
>>>> git://github.com/tensorflow/tensorflow.git;protocol=3Dhttps;branch=3Dr=
2.20=20
>>>> \
>>>> file://0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch=
=20
>>>> \
>>>> file://0002-lite-Update-CMakeLists-for-building-shared-object-li.patch=
=20
>>>> \
>>>> -=20
>>>> file://0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patch=
=20
>>>> \
>>>> file://tensorflow2-lite.pc.in \
>>>> =C2=A0 "
>>>> =C2=A0 =C2=A0 SRC_URI +=3D " \
>>>> -=20
>>>> git://github.com/abseil/abseil-cpp.git;protocol=3Dhttps;branch=3Dlts_2=
023_08_02;name=3Dabseil-cpp;destsuffix=3D${S}/external/abseil-cpp=20
>>>> \
>>>> +=20
>>>> git://github.com/abseil/abseil-cpp.git;protocol=3Dhttps;branch=3Dlts_2=
025_01_27;name=3Dabseil-cpp;destsuffix=3D${S}/external/abseil-cpp=20
>>>> \
>>>> git://gitlab.com/libeigen/eigen.git;protocol=3Dhttps;branch=3Dmaster;n=
ame=3Deigen;destsuffix=3D${S}/external/eigen=20
>>>> \
>>>> git://github.com/google/farmhash.git;protocol=3Dhttps;branch=3Dmaster;=
name=3Dfarmhash;destsuffix=3D${S}/external/farmhash=20
>>>> \
>>>> git://github.com/petewarden/OouraFFT.git;protocol=3Dhttps;branch=3Dmas=
ter;name=3Dfft2d;destsuffix=3D${S}/external/fft2d=20
>>>> \
>>>> @@ -28,35 +29,35 @@ SRC_URI +=3D " \
>>>> git://github.com/jax-ml/ml_dtypes.git;branch=3Dmain;protocol=3Dhttps;n=
ame=3Dml_dtypes;destsuffix=3D${S}/external/ml_dtypes=20
>>>> \
>>>> git://github.com/google/ruy.git;branch=3Dmaster;protocol=3Dhttps;name=
=3Druy;destsuffix=3D${S}/external/ruy=20
>>>> \
>>>> git://github.com/google/flatbuffers;branch=3Dmaster;protocol=3Dhttps;n=
ame=3Dflatbuffers;destsuffix=3D${S}/external/flatbuffers=20
>>>> \
>>>> -=20
>>>> git://github.com/Maratyszcza/pthreadpool.git;branch=3Dmaster;protocol=
=3Dhttps;name=3Dpthreadpool-source;destsuffix=3D${S}/external/pthreadpool-s=
ource=20
>>>> \
>>>> +=20
>>>> git://github.com/google/pthreadpool.git;branch=3Dmain;protocol=3Dhttps=
;name=3Dpthreadpool-source;destsuffix=3D${S}/external/pthreadpool-source=20
>>>> \
>>>> git://github.com/google/XNNPACK.git;branch=3Dmaster;protocol=3Dhttps;n=
ame=3Dxnnpack;destsuffix=3D${S}/external/xnnpack=20
>>>> \
>>>> git://github.com/Maratyszcza/FXdiv.git;branch=3Dmaster;protocol=3Dhttp=
s;name=3DFXdiv-source;destsuffix=3D${S}/external/FXdiv-source=20
>>>> \
>>>> git://github.com/Maratyszcza/FP16.git;branch=3Dmaster;protocol=3Dhttps=
;name=3DFP16-source;destsuffix=3D${S}/external/FP16-source=20
>>>> \
>>>> git://git.gitlab.arm.com/kleidi/kleidiai.git;branch=3Dmain;protocol=3D=
https;name=3Dkleidiai;destsuffix=3D${S}/external/kleidiai=20
>>>> \
>>>> git://github.com/Maratyszcza/psimd.git;branch=3Dmaster;protocol=3Dhttp=
s;name=3Dpsimd;destsuffix=3D${S}/external/psimd=20
>>>> \
>>>> -=20
>>>> git://github.com/protocolbuffers/protobuf.git;branch=3D25.x;protocol=
=3Dhttps;name=3Dprotobuf;destsuffix=3D${S}/external/protobuf=20
>>>> \
>>>> +=20
>>>> git://github.com/protocolbuffers/protobuf.git;branch=3Dmain;protocol=
=3Dhttps;name=3Dprotobuf;destsuffix=3D${S}/external/protobuf=20
>>>> \
>>>> =C2=A0 "
>>>> =C2=A0 =C2=A0 SRCREV_FORMAT =3D "default"
>>>> =C2=A0 =C2=A0 # Matches v${PV} tag
>>>> -SRCREV =3D "6550e4bd80223cdb8be6c3afd1f81e86a4d433c3"
>>>> -SRCREV_abseil-cpp =3D "fb3621f4f897824c0dbe0615fa94543df6192f30"
>>>> +SRCREV =3D "72fbba3d20f4616d7312b5e2b7f79daf6e82f2fa"
>>>> +SRCREV_abseil-cpp =3D "d9e4955c65cd4367dd6bf46f4ccb8cd3d100540b"
>>>> =C2=A0 SRCREV_eigen =3D "33d0937c6bdf5ec999939fb17f2a553183d14a74"
>>>> =C2=A0 SRCREV_farmhash =3D "0d859a811870d10f53a594927d0d0b97573ad06d"
>>>> =C2=A0 SRCREV_fft2d =3D "c6fd2dd6d21397baa6653139d31d84540d5449a2"
>>>> =C2=A0 SRCREV_gemmlowp =3D "16e8662c34917be0065110bfcd9cc27d30f52fdf"
>>>> -SRCREV_cpuinfo =3D "b73ae6ce38d5dd0b7fe46dbe0a4b5f4bab91c7ea"
>>>> +SRCREV_cpuinfo =3D "de0ce7c7251372892e53ce9bc891750d2c9a4fd8"
>>>> =C2=A0 SRCREV_ml_dtypes =3D "24084d9ed2c3d45bf83b7a9bff833aa185bf9172"
>>>> =C2=A0 SRCREV_ruy =3D "3286a34cc8de6149ac6844107dfdffac91531e72"
>>>> =C2=A0 SRCREV_flatbuffers =3D "e6463926479bd6b330cbcf673f7e917803fd583=
1"
>>>> -SRCREV_pthreadpool-source =3D=20
>>>> "4fe0e1e183925bf8cfa6aae24237e724a96479b8"
>>>> -SRCREV_xnnpack =3D "6b83f69d4938da4dc9ad63c00bd13e9695659a51"
>>>> +SRCREV_pthreadpool-source =3D=20
>>>> "c2ba5c50bb58d1397b693740cf75fad836a0d1bf"
>>>> +SRCREV_xnnpack =3D "585e73e63cb35c8a416c83a48ca9ab79f7f7d45e"
>>>> =C2=A0 SRCREV_FXdiv-source =3D "63058eff77e11aa15bf531df5dd34395ec3017=
c8"
>>>> -SRCREV_FP16-source =3D "0a92994d729ff76a58f692d3028ca1b64b145d91"
>>>> -SRCREV_kleidiai =3D "cddf991af5de49fd34949fa39690e4e906e04074"
>>>> +SRCREV_FP16-source =3D "4dfe081cf6bcd15db339cf2680b9281b8451eeb3"
>>>> +SRCREV_kleidiai =3D "dc69e899945c412a8ce39ccafd25139f743c60b1"
>>>> =C2=A0 SRCREV_psimd =3D "072586a71b55b7f8c584153d223e95687148a900"
>>>> -SRCREV_protobuf =3D "4a2aef570deb2bfb8927426558701e8bfc26f2a4"
>>>> +SRCREV_protobuf =3D "90b73ac3f0b10320315c2ca0d03a5a9b095d2f66"
>>>> =C2=A0 =C2=A0 inherit setuptools3 cmake
>>>> =C2=A0 @@ -91,7 +92,7 @@ OECMAKE_SOURCEPATH =3D "${S}/tensorflow/lite"
>>>> =C2=A0 # to further optimize the build for production use.
>>>> =C2=A0 # Hence, activate -O3 optimization and disable debug symbols.
>>>> =C2=A0 OECMAKE_C_FLAGS_RELEASE =3D "-O3 -DNDEBUG"
>>>> -OECMAKE_CXX_FLAGS_RELEASE =3D "-O3 -DNDEBUG -flax-vector-conversions"
>>>> +OECMAKE_CXX_FLAGS_RELEASE =3D "-O3 -DNDEBUG -flax-vector-conversions=
=20
>>>> -DTF_MAJOR_VERSION=3D${TF_MAJOR} -DTF_MINOR_VERSION=3D${TF_MINOR}=20
>>>> -DTF_PATCH_VERSION=3D${TF_PATCH} -DTF_VERSION_SUFFIX=3D\"\""
>>>> =C2=A0 =C2=A0 OECMAKE_C_FLAGS_RELEASE:append:arm =3D " -march=3Darmv7-=
a -mfpu=3Dneon"
>>>> =C2=A0 OECMAKE_CXX_FLAGS_RELEASE:append:arm =3D " -march=3Darmv7-a -mf=
pu=3Dneon"
>>>> @@ -112,9 +113,8 @@ EXTRA_OECMAKE:append =3D " \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DCMAKE_SYSTEM_PROCESSOR=3D${TENSORFLOW=
_TARGET_ARCH} \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DCMAKE_VERBOSE_MAKEFILE:BOOL=3DON \
>>>> -DPYTHON_TARGET_INCLUDE=3D${RECIPE_SYSROOT}${includedir}/${PYTHON_DIR}=
 \
>>>> -=20
>>>> -DNUMPY_TARGET_INCLUDE=3D${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/n=
umpy/core/include=20
>>>> \
>>>> +=20
>>>> -DNUMPY_TARGET_INCLUDE=3D${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/n=
umpy/_core/include=20
>>>> \
>>>> -DPYBIND11_TARGET_INCLUDE=3D${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR=
}/pybind11/include=20
>>>> \
>>>> -=C2=A0=C2=A0=C2=A0 -DTFLITE_VERSION_MAJOR=3D${MAJOR}=C2=A0 \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DTFLITE_HOST_TOOLS_DIR=3D${STAGING_BIN=
DIR_NATIVE} \
>>>> -DPTHREADPOOL_SOURCE_DIR=3D${S}/external/pthreadpool-source \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DFXDIV_SOURCE_DIR=3D${S}/external/FXdi=
v-source \
>>>> @@ -122,6 +122,8 @@ EXTRA_OECMAKE:append =3D " \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DCPUINFO_SOURCE_DIR=3D${S}/external/cp=
uinfo \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DKLEIDIAI_SOURCE_DIR=3D${S}/external/k=
leidiai \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DPSIMD_SOURCE_DIR=3D${S}/external/psim=
d \
>>>> +=C2=A0=C2=A0=C2=A0 -DCMAKE_CXX_STANDARD=3D17 \
>>>> +=C2=A0=C2=A0=C2=A0 -DCMAKE_CXX_STANDARD_REQUIRED=3DON \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --compile-no-warning-as-error \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --log-level=3DVERBOSE \
>>>> =C2=A0 "
>>>> @@ -130,7 +132,6 @@ do_configure:prepend() {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for i in abseil-cpp cpuinfo eigen farmh=
ash fft2d flatbuffers=20
>>>> FP16-source FXdiv-source gemmlowp kleidiai ml_dtypes psimd protobuf=20
>>>> pthreadpool-source ruy xnnpack; do
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp -ra ${S}/ext=
ernal/$i ${B}/$i
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
>>>> -
>>>
>>> Random whitespace change
>>>
>> I'll fix this.
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # There is no Fortran compiler in the t=
oolchain, but bitbake=20
>>>> sets this variable anyway with unavailable
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # binary & it leads to "CMake Error: Co=
uld not find compiler=20
>>>> set in environment variable FC:"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unset FC
>>>> @@ -143,7 +144,7 @@ do_compile:append() {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUILD_DIR=3D${B}
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TENSORFLOW_DIR=3D${S}
>>>> TENSORFLOW_LITE_DIR=3D"${TENSORFLOW_DIR}/tensorflow/lite"
>>>> -=C2=A0=C2=A0=C2=A0 TENSORFLOW_VERSION=3D$(grep "_VERSION =3D "=20
>>>> "${TENSORFLOW_DIR}/tensorflow/tools/pip_package/setup.py" | cut -d=3D=
=20
>>>> -f2 | sed "s/[ '-]//g")
>>>> +=C2=A0=C2=A0=C2=A0 TENSORFLOW_VERSION=3D$(grep "_VERSION =3D "=20
>>>> "${TENSORFLOW_DIR}/tensorflow/tools/pip_package/setup.py.tpl" | cut=20
>>>> -d=3D -f2 | sed "s/[ '-]//g")
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p "${B}/tflite_runtime"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp -r "${TENSORFLOW_LITE_DIR}/tools/pip=
_package/debian" \
>>>> "${TENSORFLOW_LITE_DIR}/tools/pip_package/MANIFEST.in" \
>>>> @@ -156,22 +157,23 @@ do_compile:append() {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "${B}/tflite_runtime"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "__version__ =3D '${TENSORFLOW_VER=
SION}'" >>=20
>>>> "${BUILD_DIR}/tflite_runtime/__init__.py"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "__git_version__ =3D '$(git -C "${=
TENSORFLOW_DIR}"=20
>>>> describe)'" >> "${BUILD_DIR}/tflite_runtime/__init__.py"
>>>> -
>>>> +
>>>
>>> ?
>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export PACKAGE_VERSION=3D"${TENSORFLOW_=
VERSION}"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export PROJECT_NAME=3D"tflite_runtime"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp "${B}/_pywrap_tensorflow_interpreter=
_wrapper.so"=20
>>>> "tflite_runtime"
>>>> -
>>>> +
>>>
>>> ?
>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 setuptools3_do_compile
>>>> =C2=A0 }
>>>> =C2=A0 =C2=A0 do_install() {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Install tensorflow-lite dynamic libra=
ry
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${libdir}
>>>> -=C2=A0=C2=A0=C2=A0 install -m 0644 ${B}/libtensorflow-lite.so.${MAJOR=
}=20
>>>> ${D}${libdir}/libtensorflow-lite.so.${PV}
>>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${B}/libtensorflow-lite.so.=20
>>>> ${D}${libdir}/libtensorflow-lite.so.${PV}
>>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 ln -sf libtensorflow-lite.so.${PV}=20
>>>> ${D}${libdir}/libtensorflow-lite.so.${MAJOR}
>>>> +=C2=A0=C2=A0=C2=A0 ln -sf libtensorflow-lite.so.${PV}=20
>>>> ${D}${libdir}/libtensorflow-lite.so.${TF_MAJOR}
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ln -sf libtensorflow-lite.so.${PV}=20
>>>> ${D}${libdir}/libtensorflow-lite.so
>>>> -
>>>> +=C2=A0=C2=A0=C2=A0 ln -sf libtensorflow-lite.so.${PV}=20
>>>> ${D}${libdir}/libtensorflow-lite.so.
>>>> +
>>>
>>> What is a symline with the name same as the above but with a "." at=20
>>> the end doing for us?
>>>
>> benchmark_model needs libtensorflow-lite.so. for benchmarking=20
>> purpose. Without this the benchmarking fails when executing=20
>> /opt/tensorflow-lite/tools/benchmark_model
>
> It needs a library that ends in "."? Not sure I beleive that, and if=20
> so then that is a
> bug you should fix and add a patch.
>
> Andrew
>
Yeah looks like a bug [0]. I'll add a patch to fix it.

[0] https://gist.github.com/PrathamTI/f306ee96a046c99232c77c8a39194902

>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # armnn expects the the dynamic library=
 of tensorflow lite to=20
>>>> be named as "libtensorflowlite.so"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Eg -=20
>>>> https://github.com/ARM-software/armnn/blob/branches/armnn_24_11/delega=
te/cmake/Modules/FindTfLite.cmake#L19
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Hence, create a symbolic link to hand=
le the same
>>>> @@ -197,7 +199,7 @@ do_install() {
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Install pkgconfig file require=
d for NNstreamer build
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${libdir}/pkgconfig
>>>> -=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/tensorflow2-lite.pc.in=
=20
>>>> ${D}${libdir}/pkgconfig/tensorflow2-lite.pc
>>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/sources/tensorflow2-lit=
e.pc.in=20
>>>> ${D}${libdir}/pkgconfig/tensorflow2-lite.pc
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i 's:@version@:${PV}:g
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 s:@libdir@:${libdir}:g
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 s:@includedir@:${includedir}:g' \
>>>
>

