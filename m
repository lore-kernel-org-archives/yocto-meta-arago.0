Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D3AF33A69
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 14:02:13 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44722.1772719330515187580
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 06:02:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=C782P8ea;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.10, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfhA1D7JMVas5FPw5Rke5Xd2bhae0Eazs0mE1cdjszZ4omN3hTgehy0RBRn3vw3+UoF+v6TokuXANtD4ptSTPAN+0PSDLACzRtaRC+5FBmZ5otdMt7vo7XUzjgY8oLn8dwc8XRkZXG71U8AsKnvBRAkPlSFmJneWvr7n9Qkz8xf1OP9YrYI2sLNnWmf4XC1MBg3wbRMuRMZ77EjHAl8x9abmQXeDlUsGWr9xUna60KpoTwQyiqTxIHCFEgYumHA8o3m2f4i+lKEaCODcMq5ARK+pxDFBctK4MFJpByynKtJmINob1O1FU2/3mkDTQ3g9NRzF+3Xt5Rpb6GDoW9NZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MOLdweHOiwQEJowfOCen94poWt1BG+yif7BUCk7XNY=;
 b=lNYp8jtmlDsmpShVo3DtjYqvm3sN8zOaeLWlgpgl1C7fSNaOQnBJhd3EYyaUUmz8LR5hf40rIqLvjOfLesln0PehQ9eGJPQSDfm0gXX1Z+qQYBuSru7dWF+JxuxdVGB1oFPo3LzAzJCrst+uHoW9zdNsBWA9xMtnz5IEJWtdIT+xvAx84iMCz++v0uNXFm6Sws0MtLA3mF4JvmuTOCeMOZw1fuWrWeyE33rBXsrsDumPgYchh2Rmrg3/+bJadVaD5qRUU2SkeyKtn8/JB1sp7+L/Icj2wH/z8L3EEqJPuH2CHSumweoJ1AIYQLp/W6KjvGwiMUzZT6svggfIM4PXqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MOLdweHOiwQEJowfOCen94poWt1BG+yif7BUCk7XNY=;
 b=C782P8ea/6z+ltMMN5c10numUcMdU4a4HCZDeNYyL1g8WBxwyPEXqdXX7jjIQvqEm12PLpWmgHx9SHyqwXEAEHGA4UgvHU3PDNP/DdHzuqoLGLexZQAF5BobQnYrSQLReei3/mWe0eLFtyIelMWg2ByOY4osSSQ3pq3ke20kEL0=
Received: from BN9PR03CA0237.namprd03.prod.outlook.com (2603:10b6:408:f8::32)
 by CH0PR10MB4843.namprd10.prod.outlook.com (2603:10b6:610:cb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 14:02:06 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:408:f8:cafe::17) by BN9PR03CA0237.outlook.office365.com
 (2603:10b6:408:f8::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 14:01:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 14:02:04 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 08:01:53 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 08:01:53 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 08:01:53 -0600
Received: from [172.24.233.101] (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625E1obg1956967;
	Thu, 5 Mar 2026 08:01:51 -0600
Message-ID: <e30bac07-c4c4-4e6f-b736-040f40e4f47a@ti.com>
Date: Thu, 5 Mar 2026 19:31:50 +0530
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
 <54683d99-530f-4cd2-8c74-11a293ff5ab1@ti.com>
 <4cc6010c-3245-4eb6-a800-04a81e6f3746@ti.com>
Content-Language: en-US
From: Pratham Deshmukh <p-deshmukh@ti.com>
In-Reply-To: <4cc6010c-3245-4eb6-a800-04a81e6f3746@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|CH0PR10MB4843:EE_
X-MS-Office365-Filtering-Correlation-Id: 44db20b2-8a5c-4e3e-ab90-08de7abfc82f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|34020700016|7142099003;
X-Microsoft-Antispam-Message-Info: 
	/+J7+/sgS3dir4UM4493iqFXcxMwAZdFhXkLm8qAutkPcCcUa+4MP9X4EXFsvjHeWNEjHxX9y+jpQFH0Yl4jEuWXjLXVhnDQaN6dQX5nIunz9YP6m5FvJiboyzKQYLzfLG8KXqmh1yBokXF7TrkFhFE+GP5dm/A9Z/pmLD2mGBmvA6IM4pzm2QX6Doy2pylSu1lzVrL7PppiTAAAatYktGkGjDo+jQL22An3LcDSle+r4bIFY/JuEyVwTRMx+Fj5CIbmlbDz7lxS4CmugMWUPRmHhSqk1VcaGKya8NnxOYgzFQb84L8LexUKyVZ97JLj5MTHgus96zO/0GC4h0CB1cV15qoNs/VjGK5gyjz+8BOoJj3iUAqecVV7ZLVlBTYn6d893lH1VPtC81rjPCVB3Bc7xDi3fi8r1IIbxiLziJESbZnTaOjXlMXMOvaLC8xucTno5YzFQlexnkVjD/ZPdrs02RIzUi4jTReiWYqBWNsr/S5X6aW5Da2Oj9PBP6BjYsuHgA5xZ2xzWnEOrU2FKdIFxyTPsH8E+c8B22L32gkZPe/ZkfJMqCpihTuZ4DusNlYdXDGeF4OExdJ4VbE2b91hMW+vEMm1qiek50G5dZqvFXufhEr/gxFzqX4uKktt402Ho2ka0RDX5WIjo3dqxOR1GMEdAdCGhcZt+iF0gc3Sss9uegqIQBmiPX5P4Z93aKWwdQZmOSfTTzNf5MRVfwSC4Y/WTfWQ1mC4ocF/vPM=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(34020700016)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	r7HyiDnqn7MAAmqVXLKQqErAA2eLfJWv8GSOI72lLR+EpiYDU0KGSQDBuOYmbokR9xSp3/F8HwhDxB+tax4RgUjYRXbMaMbiKCMzWFf65Nbat8//4CJwYFtmXUOKhuTlqHOIKzXA44ieZWXZNxzjX/Mgf8WP8Y0NBcZeyI3k424JKdbx9qNucNOpFm3StPMGHv/a0JKpH0PE/Z3vDsbFf7jmvv/ESGKBzdFWiLNN9FtkCXx8HFy4o5GJeKew2rTvs4/jjCYQOt1RnEwcaWN9naqdetIE8a3GFiXds8rw02shb9hrHR6Qol0XWaKMasYZSgcHXDIMfe2mzXQZcRkkXbI5SFu3Zlbqlc2hsPmObaf53Fr8gIK/P634cj2uUfVq1An2eW+Nf5vyymmE9HU5NhTffQLF7+Pxd7HM1ilFuxQZzCOXJJ7WPbRgGVlKG4nD
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 14:02:04.7946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44db20b2-8a5c-4e3e-ab90-08de7abfc82f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4843
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 14:02:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17233


On 05/03/26 7:28 pm, Andrew Davis wrote:
> On 3/5/26 7:36 AM, Pratham Deshmukh wrote:
>>
>> On 05/03/26 7:03 pm, Andrew Davis wrote:
>>> On 3/5/26 3:08 AM, Pratham Deshmukh wrote:
>>>> On 04/03/26 10:21 pm, Andrew Davis wrote:
>>>>> On 3/4/26 6:32 AM, Pratham Deshmukh wrote:
>>>>>> We are migrating Tensorflow-Lite from v2.18.0 to the
>>>>>> stable release v2.20.0
>>>>>>
>>>>>> Key Changes:
>>>>>> =C2=A0 - Pin flatbuffers-native and protobuf-native to use the same=
=20
>>>>>> version as
>>>>>> =C2=A0=C2=A0=C2=A0 TensorFlow Lite 2.20.0 to avoid version mismatch
>>>>>> =C2=A0 - Updated SRCREV for all the dependencies
>>>>>> =C2=A0 - Updated recipe to meet the build compatibilty
>>>>>>
>>>>>> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
>>>>>> ---
>>>>>> =C2=A0 .../flatbuffers/flatbuffers-arago.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +++
>>>>>> =C2=A0 .../flatbuffers/flatbuffers.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++
>>>>>> =C2=A0 .../protobuf/protobuf-arago.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 +++++++
>>>>>> =C2=A0 .../protobuf/protobuf_%.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++
>>>>>> =C2=A0 ...te_2.18.0.bb =3D> tensorflow-lite_2.20.0.bb} | 52=20
>>>>>> ++++++++++---------
>>>>>> =C2=A0 5 files changed, 62 insertions(+), 25 deletions(-)
>>>>>> =C2=A0 create mode 100644=20
>>>>>> meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-arago.inc
>>>>>> =C2=A0 create mode 100644=20
>>>>>> meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbappend
>>>>>> =C2=A0 create mode 100644=20
>>>>>> meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc
>>>>>> =C2=A0 create mode 100644=20
>>>>>> meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend
>>>>>> =C2=A0 rename=20
>>>>>> meta-arago-extras/recipes-framework/tensorflow-lite/{tensorflow-lite=
_2.18.0.bb=20
>>>>>> =3D> tensorflow-lite_2.20.0.bb} (86%)
>>>>>>
>>>>>> diff --git=20
>>>>>> a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-arago.i=
nc=20
>>>>>> b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-arago.i=
nc=20
>>>>>>
>>>>>> new file mode 100644
>>>>>> index 00000000..d85efc8b
>>>>>> --- /dev/null
>>>>>> +++=20
>>>>>> b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers-arago.i=
nc=20
>>>>>>
>>>>>> @@ -0,0 +1,8 @@
>>>>>> +# Pin flatbuffers-native to use the same version as TensorFlow=20
>>>>>> Lite 2.20.0
>>>>>> +# to avoid version mismatch errors
>>>>>> +
>>>>>> +# Override version to match
>>>>>> +PV =3D "24.3.25"
>>>>>> +
>>>>>> +# Use specific commit hash that corresponds to v24.3.25 tag
>>>>>> +SRCREV =3D "595bf0007ab1929570c7671f091313c8fc20644e"
>>>>>> diff --git=20
>>>>>> a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbappen=
d=20
>>>>>> b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbappen=
d=20
>>>>>>
>>>>>> new file mode 100644
>>>>>> index 00000000..2a627698
>>>>>> --- /dev/null
>>>>>> +++=20
>>>>>> b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers.bbappen=
d=20
>>>>>>
>>>>>> @@ -0,0 +1,4 @@
>>>>>> +# Conditionally include Arago-specific customizations for=20
>>>>>> flatbuffers-native
>>>>>> +FLATBUFFERS_ARAGO =3D ""
>>>>>> +FLATBUFFERS_ARAGO:arago =3D "flatbuffers-arago.inc"
>>>>>> +require ${FLATBUFFERS_ARAGO}
>>>>>> diff --git=20
>>>>>> a/meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc=20
>>>>>> b/meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc
>>>>>> new file mode 100644
>>>>>> index 00000000..489b1444
>>>>>> --- /dev/null
>>>>>> +++ b/meta-arago-extras/recipes-devtools/protobuf/protobuf-arago.inc
>>>>>> @@ -0,0 +1,18 @@
>>>>>> +# Pin protobuf-native to use the same version as TensorFlow Lite=20
>>>>>> 2.20.0
>>>>>> +# to avoid version mismatch errors
>>>>>> +
>>>>>> +# Override version to match
>>>>>> +PV =3D "3.21.9"
>>>>>> +
>>>>>> +# Use specific commit hash that corresponds to v24.3.25 tag
>>>>>> +SRCREV =3D "90b73ac3f0b10320315c2ca0d03a5a9b095d2f66"
>>>>>> +
>>>>>> +# Override SRC_URI to use 3.21.x branch and remove incompatible=20
>>>>>> patches
>>>>>> +SRC_URI =3D=20
>>>>>> "git://github.com/protocolbuffers/protobuf.git;branch=3Dmain;protoco=
l=3Dhttps=20
>>>>>> \
>>>>>> + file://run-ptest \
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>>>>> +
>>>>>> +LIC_FILES_CHKSUM =3D " \
>>>>>> + file://LICENSE;md5=3D37b5762e07f0af8c74ce80a8bda4266b \
>>>>>> +=20
>>>>>> file://third_party/utf8_range/LICENSE;md5=3Def460f31070fd7184bd9059d=
e2e4b132=20
>>>>>> \
>>>>>> +"
>>>>>> diff --git=20
>>>>>> a/meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend=20
>>>>>> b/meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend
>>>>>> new file mode 100644
>>>>>> index 00000000..51c679a5
>>>>>> --- /dev/null
>>>>>> +++=20
>>>>>> b/meta-arago-extras/recipes-devtools/protobuf/protobuf_%.bbappend
>>>>>> @@ -0,0 +1,5 @@
>>>>>> +# Conditionally include Arago-specific customizations for=20
>>>>>> flatbuffers-native
>>>>>> +PROTOBUF_ARAGO =3D ""
>>>>>> +PROTOBUF_ARAGO:arago =3D "protobuf-arago.inc"
>>>>>> +
>>>>>> +require ${PROTOBUF_ARAGO}
>>>>>> diff --git=20
>>>>>> a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lit=
e_2.18.0.bb=20
>>>>>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lit=
e_2.20.0.bb=20
>>>>>>
>>>>>> similarity index 86%
>>>>>> rename from=20
>>>>>> meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_=
2.18.0.bb
>>>>>> rename to=20
>>>>>> meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_=
2.20.0.bb
>>>>>> index c76939ac..57278f5b 100644
>>>>>> ---=20
>>>>>> a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lit=
e_2.18.0.bb
>>>>>> +++=20
>>>>>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lit=
e_2.20.0.bb
>>>>>> @@ -8,18 +8,19 @@ LICENSE =3D "Apache-2.0"
>>>>>> =C2=A0 LIC_FILES_CHKSUM =3D=20
>>>>>> "file://LICENSE;md5=3D4158a261ca7f2525513e31ba9c50ae98"
>>>>>> =C2=A0 =C2=A0 # Get major of the PV variable
>>>>>> -MAJOR =3D "${@d.getVar('PV').split('.')[0]}"
>>>>>> +TF_MAJOR =3D "${@d.getVar('PV').split('.')[0]}"
>>>>>> +TF_MINOR =3D "${@d.getVar('PV').split('.')[1]}"
>>>>>> +TF_PATCH =3D "${@(d.getVar('PV').split('.') + ['0', '0'])[2]}"
>>>>>> =C2=A0 =C2=A0 SRC_URI =3D " \
>>>>>> -=20
>>>>>> git://github.com/tensorflow/tensorflow.git;protocol=3Dhttps;branch=
=3Dr2.18=20
>>>>>> \
>>>>>> +=20
>>>>>> git://github.com/tensorflow/tensorflow.git;protocol=3Dhttps;branch=
=3Dr2.20=20
>>>>>> \
>>>>>> file://0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.pat=
ch=20
>>>>>> \
>>>>>> file://0002-lite-Update-CMakeLists-for-building-shared-object-li.pat=
ch=20
>>>>>> \
>>>>>> -=20
>>>>>> file://0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.pat=
ch=20
>>>>>> \
>>>>>> file://tensorflow2-lite.pc.in \
>>>>>> =C2=A0 "
>>>>>> =C2=A0 =C2=A0 SRC_URI +=3D " \
>>>>>> -=20
>>>>>> git://github.com/abseil/abseil-cpp.git;protocol=3Dhttps;branch=3Dlts=
_2023_08_02;name=3Dabseil-cpp;destsuffix=3D${S}/external/abseil-cpp=20
>>>>>> \
>>>>>> +=20
>>>>>> git://github.com/abseil/abseil-cpp.git;protocol=3Dhttps;branch=3Dlts=
_2025_01_27;name=3Dabseil-cpp;destsuffix=3D${S}/external/abseil-cpp=20
>>>>>> \
>>>>>> git://gitlab.com/libeigen/eigen.git;protocol=3Dhttps;branch=3Dmaster=
;name=3Deigen;destsuffix=3D${S}/external/eigen=20
>>>>>> \
>>>>>> git://github.com/google/farmhash.git;protocol=3Dhttps;branch=3Dmaste=
r;name=3Dfarmhash;destsuffix=3D${S}/external/farmhash=20
>>>>>> \
>>>>>> git://github.com/petewarden/OouraFFT.git;protocol=3Dhttps;branch=3Dm=
aster;name=3Dfft2d;destsuffix=3D${S}/external/fft2d=20
>>>>>> \
>>>>>> @@ -28,35 +29,35 @@ SRC_URI +=3D " \
>>>>>> git://github.com/jax-ml/ml_dtypes.git;branch=3Dmain;protocol=3Dhttps=
;name=3Dml_dtypes;destsuffix=3D${S}/external/ml_dtypes=20
>>>>>> \
>>>>>> git://github.com/google/ruy.git;branch=3Dmaster;protocol=3Dhttps;nam=
e=3Druy;destsuffix=3D${S}/external/ruy=20
>>>>>> \
>>>>>> git://github.com/google/flatbuffers;branch=3Dmaster;protocol=3Dhttps=
;name=3Dflatbuffers;destsuffix=3D${S}/external/flatbuffers=20
>>>>>> \
>>>>>> -=20
>>>>>> git://github.com/Maratyszcza/pthreadpool.git;branch=3Dmaster;protoco=
l=3Dhttps;name=3Dpthreadpool-source;destsuffix=3D${S}/external/pthreadpool-=
source=20
>>>>>> \
>>>>>> +=20
>>>>>> git://github.com/google/pthreadpool.git;branch=3Dmain;protocol=3Dhtt=
ps;name=3Dpthreadpool-source;destsuffix=3D${S}/external/pthreadpool-source=
=20
>>>>>> \
>>>>>> git://github.com/google/XNNPACK.git;branch=3Dmaster;protocol=3Dhttps=
;name=3Dxnnpack;destsuffix=3D${S}/external/xnnpack=20
>>>>>> \
>>>>>> git://github.com/Maratyszcza/FXdiv.git;branch=3Dmaster;protocol=3Dht=
tps;name=3DFXdiv-source;destsuffix=3D${S}/external/FXdiv-source=20
>>>>>> \
>>>>>> git://github.com/Maratyszcza/FP16.git;branch=3Dmaster;protocol=3Dhtt=
ps;name=3DFP16-source;destsuffix=3D${S}/external/FP16-source=20
>>>>>> \
>>>>>> git://git.gitlab.arm.com/kleidi/kleidiai.git;branch=3Dmain;protocol=
=3Dhttps;name=3Dkleidiai;destsuffix=3D${S}/external/kleidiai=20
>>>>>> \
>>>>>> git://github.com/Maratyszcza/psimd.git;branch=3Dmaster;protocol=3Dht=
tps;name=3Dpsimd;destsuffix=3D${S}/external/psimd=20
>>>>>> \
>>>>>> -=20
>>>>>> git://github.com/protocolbuffers/protobuf.git;branch=3D25.x;protocol=
=3Dhttps;name=3Dprotobuf;destsuffix=3D${S}/external/protobuf=20
>>>>>> \
>>>>>> +=20
>>>>>> git://github.com/protocolbuffers/protobuf.git;branch=3Dmain;protocol=
=3Dhttps;name=3Dprotobuf;destsuffix=3D${S}/external/protobuf=20
>>>>>> \
>>>>>> =C2=A0 "
>>>>>> =C2=A0 =C2=A0 SRCREV_FORMAT =3D "default"
>>>>>> =C2=A0 =C2=A0 # Matches v${PV} tag
>>>>>> -SRCREV =3D "6550e4bd80223cdb8be6c3afd1f81e86a4d433c3"
>>>>>> -SRCREV_abseil-cpp =3D "fb3621f4f897824c0dbe0615fa94543df6192f30"
>>>>>> +SRCREV =3D "72fbba3d20f4616d7312b5e2b7f79daf6e82f2fa"
>>>>>> +SRCREV_abseil-cpp =3D "d9e4955c65cd4367dd6bf46f4ccb8cd3d100540b"
>>>>>> =C2=A0 SRCREV_eigen =3D "33d0937c6bdf5ec999939fb17f2a553183d14a74"
>>>>>> =C2=A0 SRCREV_farmhash =3D "0d859a811870d10f53a594927d0d0b97573ad06d=
"
>>>>>> =C2=A0 SRCREV_fft2d =3D "c6fd2dd6d21397baa6653139d31d84540d5449a2"
>>>>>> =C2=A0 SRCREV_gemmlowp =3D "16e8662c34917be0065110bfcd9cc27d30f52fdf=
"
>>>>>> -SRCREV_cpuinfo =3D "b73ae6ce38d5dd0b7fe46dbe0a4b5f4bab91c7ea"
>>>>>> +SRCREV_cpuinfo =3D "de0ce7c7251372892e53ce9bc891750d2c9a4fd8"
>>>>>> =C2=A0 SRCREV_ml_dtypes =3D "24084d9ed2c3d45bf83b7a9bff833aa185bf917=
2"
>>>>>> =C2=A0 SRCREV_ruy =3D "3286a34cc8de6149ac6844107dfdffac91531e72"
>>>>>> =C2=A0 SRCREV_flatbuffers =3D "e6463926479bd6b330cbcf673f7e917803fd5=
831"
>>>>>> -SRCREV_pthreadpool-source =3D=20
>>>>>> "4fe0e1e183925bf8cfa6aae24237e724a96479b8"
>>>>>> -SRCREV_xnnpack =3D "6b83f69d4938da4dc9ad63c00bd13e9695659a51"
>>>>>> +SRCREV_pthreadpool-source =3D=20
>>>>>> "c2ba5c50bb58d1397b693740cf75fad836a0d1bf"
>>>>>> +SRCREV_xnnpack =3D "585e73e63cb35c8a416c83a48ca9ab79f7f7d45e"
>>>>>> =C2=A0 SRCREV_FXdiv-source =3D "63058eff77e11aa15bf531df5dd34395ec30=
17c8"
>>>>>> -SRCREV_FP16-source =3D "0a92994d729ff76a58f692d3028ca1b64b145d91"
>>>>>> -SRCREV_kleidiai =3D "cddf991af5de49fd34949fa39690e4e906e04074"
>>>>>> +SRCREV_FP16-source =3D "4dfe081cf6bcd15db339cf2680b9281b8451eeb3"
>>>>>> +SRCREV_kleidiai =3D "dc69e899945c412a8ce39ccafd25139f743c60b1"
>>>>>> =C2=A0 SRCREV_psimd =3D "072586a71b55b7f8c584153d223e95687148a900"
>>>>>> -SRCREV_protobuf =3D "4a2aef570deb2bfb8927426558701e8bfc26f2a4"
>>>>>> +SRCREV_protobuf =3D "90b73ac3f0b10320315c2ca0d03a5a9b095d2f66"
>>>>>> =C2=A0 =C2=A0 inherit setuptools3 cmake
>>>>>> =C2=A0 @@ -91,7 +92,7 @@ OECMAKE_SOURCEPATH =3D "${S}/tensorflow/lit=
e"
>>>>>> =C2=A0 # to further optimize the build for production use.
>>>>>> =C2=A0 # Hence, activate -O3 optimization and disable debug symbols.
>>>>>> =C2=A0 OECMAKE_C_FLAGS_RELEASE =3D "-O3 -DNDEBUG"
>>>>>> -OECMAKE_CXX_FLAGS_RELEASE =3D "-O3 -DNDEBUG -flax-vector-conversion=
s"
>>>>>> +OECMAKE_CXX_FLAGS_RELEASE =3D "-O3 -DNDEBUG=20
>>>>>> -flax-vector-conversions -DTF_MAJOR_VERSION=3D${TF_MAJOR}=20
>>>>>> -DTF_MINOR_VERSION=3D${TF_MINOR} -DTF_PATCH_VERSION=3D${TF_PATCH}=20
>>>>>> -DTF_VERSION_SUFFIX=3D\"\""
>>>>>> =C2=A0 =C2=A0 OECMAKE_C_FLAGS_RELEASE:append:arm =3D " -march=3Darmv=
7-a=20
>>>>>> -mfpu=3Dneon"
>>>>>> =C2=A0 OECMAKE_CXX_FLAGS_RELEASE:append:arm =3D " -march=3Darmv7-a=20
>>>>>> -mfpu=3Dneon"
>>>>>> @@ -112,9 +113,8 @@ EXTRA_OECMAKE:append =3D " \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DCMAKE_SYSTEM_PROCESSOR=3D${TENSORFL=
OW_TARGET_ARCH} \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DCMAKE_VERBOSE_MAKEFILE:BOOL=3DON \
>>>>>> -DPYTHON_TARGET_INCLUDE=3D${RECIPE_SYSROOT}${includedir}/${PYTHON_DI=
R}=20
>>>>>> \
>>>>>> -=20
>>>>>> -DNUMPY_TARGET_INCLUDE=3D${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}=
/numpy/core/include=20
>>>>>> \
>>>>>> +=20
>>>>>> -DNUMPY_TARGET_INCLUDE=3D${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}=
/numpy/_core/include=20
>>>>>> \
>>>>>> -DPYBIND11_TARGET_INCLUDE=3D${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_D=
IR}/pybind11/include=20
>>>>>> \
>>>>>> -=C2=A0=C2=A0=C2=A0 -DTFLITE_VERSION_MAJOR=3D${MAJOR}=C2=A0 \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DTFLITE_HOST_TOOLS_DIR=3D${STAGING_B=
INDIR_NATIVE} \
>>>>>> -DPTHREADPOOL_SOURCE_DIR=3D${S}/external/pthreadpool-source \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DFXDIV_SOURCE_DIR=3D${S}/external/FX=
div-source \
>>>>>> @@ -122,6 +122,8 @@ EXTRA_OECMAKE:append =3D " \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DCPUINFO_SOURCE_DIR=3D${S}/external/=
cpuinfo \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DKLEIDIAI_SOURCE_DIR=3D${S}/external=
/kleidiai \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DPSIMD_SOURCE_DIR=3D${S}/external/ps=
imd \
>>>>>> +=C2=A0=C2=A0=C2=A0 -DCMAKE_CXX_STANDARD=3D17 \
>>>>>> +=C2=A0=C2=A0=C2=A0 -DCMAKE_CXX_STANDARD_REQUIRED=3DON \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --compile-no-warning-as-error \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --log-level=3DVERBOSE \
>>>>>> =C2=A0 "
>>>>>> @@ -130,7 +132,6 @@ do_configure:prepend() {
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for i in abseil-cpp cpuinfo eigen far=
mhash fft2d=20
>>>>>> flatbuffers FP16-source FXdiv-source gemmlowp kleidiai ml_dtypes=20
>>>>>> psimd protobuf pthreadpool-source ruy xnnpack; do
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp -ra ${S}/e=
xternal/$i ${B}/$i
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
>>>>>> -
>>>>>
>>>>> Random whitespace change
>>>>>
>>>> I'll fix this.
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # There is no Fortran compiler in the=
 toolchain, but=20
>>>>>> bitbake sets this variable anyway with unavailable
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # binary & it leads to "CMake Error: =
Could not find=20
>>>>>> compiler set in environment variable FC:"
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unset FC
>>>>>> @@ -143,7 +144,7 @@ do_compile:append() {
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUILD_DIR=3D${B}
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TENSORFLOW_DIR=3D${S}
>>>>>> TENSORFLOW_LITE_DIR=3D"${TENSORFLOW_DIR}/tensorflow/lite"
>>>>>> -=C2=A0=C2=A0=C2=A0 TENSORFLOW_VERSION=3D$(grep "_VERSION =3D "=20
>>>>>> "${TENSORFLOW_DIR}/tensorflow/tools/pip_package/setup.py" | cut=20
>>>>>> -d=3D -f2 | sed "s/[ '-]//g")
>>>>>> +=C2=A0=C2=A0=C2=A0 TENSORFLOW_VERSION=3D$(grep "_VERSION =3D "=20
>>>>>> "${TENSORFLOW_DIR}/tensorflow/tools/pip_package/setup.py.tpl" |=20
>>>>>> cut -d=3D -f2 | sed "s/[ '-]//g")
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p "${B}/tflite_runtime"
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp -r "${TENSORFLOW_LITE_DIR}/tools/p=
ip_package/debian" \
>>>>>> "${TENSORFLOW_LITE_DIR}/tools/pip_package/MANIFEST.in" \
>>>>>> @@ -156,22 +157,23 @@ do_compile:append() {
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "${B}/tflite_runtim=
e"
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "__version__ =3D '${TENSORFLOW_V=
ERSION}'" >>=20
>>>>>> "${BUILD_DIR}/tflite_runtime/__init__.py"
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "__git_version__ =3D '$(git -C "=
${TENSORFLOW_DIR}"=20
>>>>>> describe)'" >> "${BUILD_DIR}/tflite_runtime/__init__.py"
>>>>>> -
>>>>>> +
>>>>>
>>>>> ?
>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export PACKAGE_VERSION=3D"${TENSORFLO=
W_VERSION}"
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export PROJECT_NAME=3D"tflite_runtime=
"
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp "${B}/_pywrap_tensorflow_interpret=
er_wrapper.so"=20
>>>>>> "tflite_runtime"
>>>>>> -
>>>>>> +
>>>>>
>>>>> ?
>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 setuptools3_do_compile
>>>>>> =C2=A0 }
>>>>>> =C2=A0 =C2=A0 do_install() {
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Install tensorflow-lite dynamic lib=
rary
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${libdir}
>>>>>> -=C2=A0=C2=A0=C2=A0 install -m 0644 ${B}/libtensorflow-lite.so.${MAJ=
OR}=20
>>>>>> ${D}${libdir}/libtensorflow-lite.so.${PV}
>>>>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${B}/libtensorflow-lite.so.=20
>>>>>> ${D}${libdir}/libtensorflow-lite.so.${PV}
>>>>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 ln -sf libtensorflow-lite.so.${PV}=20
>>>>>> ${D}${libdir}/libtensorflow-lite.so.${MAJOR}
>>>>>> +=C2=A0=C2=A0=C2=A0 ln -sf libtensorflow-lite.so.${PV}=20
>>>>>> ${D}${libdir}/libtensorflow-lite.so.${TF_MAJOR}
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ln -sf libtensorflow-lite.so.${PV}=20
>>>>>> ${D}${libdir}/libtensorflow-lite.so
>>>>>> -
>>>>>> +=C2=A0=C2=A0=C2=A0 ln -sf libtensorflow-lite.so.${PV}=20
>>>>>> ${D}${libdir}/libtensorflow-lite.so.
>>>>>> +
>>>>>
>>>>> What is a symline with the name same as the above but with a "."=20
>>>>> at the end doing for us?
>>>>>
>>>> benchmark_model needs libtensorflow-lite.so. for benchmarking=20
>>>> purpose. Without this the benchmarking fails when executing=20
>>>> /opt/tensorflow-lite/tools/benchmark_model
>>>
>>> It needs a library that ends in "."? Not sure I beleive that, and if=20
>>> so then that is a
>>> bug you should fix and add a patch.
>>>
>>> Andrew
>>>
>> Yeah looks like a bug [0]. I'll add a patch to fix it.
>>
>> [0] https://gist.github.com/PrathamTI/f306ee96a046c99232c77c8a39194902
>>
>
> Oh wow, that is an odd one. Looks like somehow the major version got=20
> stripped
> off, clrearly should be [libtensorflow-lite.so.2].
>
> Andrew

Yeah really an odd one. I'll look into the benchmark_model logic in=20
TFLite v2.20

>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # armnn expects the the dynamic libra=
ry of tensorflow lite=20
>>>>>> to be named as "libtensorflowlite.so"
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Eg -=20
>>>>>> https://github.com/ARM-software/armnn/blob/branches/armnn_24_11/dele=
gate/cmake/Modules/FindTfLite.cmake#L19
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Hence, create a symbolic link to ha=
ndle the same
>>>>>> @@ -197,7 +199,7 @@ do_install() {
>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Install pkgconfig file requi=
red for NNstreamer build
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${libdir}/pkgconfig
>>>>>> -=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/tensorflow2-lite.pc.i=
n=20
>>>>>> ${D}${libdir}/pkgconfig/tensorflow2-lite.pc
>>>>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/sources/tensorflow2-l=
ite.pc.in=20
>>>>>> ${D}${libdir}/pkgconfig/tensorflow2-lite.pc
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i 's:@version@:${PV}:g
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 s:@libdir@:${libdir}:g
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 s:@includedir@:${includedir}:g' \
>>>>>
>>>
>

