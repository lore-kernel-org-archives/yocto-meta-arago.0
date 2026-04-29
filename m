Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A3DFF8864
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 08:36:05 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6646.1777451755164136286
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 01:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=CJHfUlcP;
 spf=pass (domain: ti.com, ip: 52.101.48.65, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jVim2P7tO+yCvBon9EpwqUP1skfawg7iyc7luiZXeP/HC9G16BwLYyAS7rEe1hWUP+jhTucb0ZqyM7i2WeyVlGt1k5sr0J2OQk+cF0eCXb0L+Www2rNCjDKTZYeFo4sJKenJmFlqg09FCaQ2zc+Ni1DD4Pehmm6/7t/kcq4KVSBneLZbmCQCj71+BuNATnwLQqZS3oCphchfNNlutbzfbAeRMtqPqLs9YrWsem/DTtDdwqsgeUTDERbeFOYWHJk9JgoHqpFZNi8kA3bBzN4H6j4I1Q710CgHouf8NeXMyLfocnlrcryj9+04oWDT32n6D7K2yoS9EDIAj5fldEQ3Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVLgfs9ekoYF5VcccqilEcnnUV43rzLmeQKprL7G1x0=;
 b=Ib53OOUb0VFMVmYMySOY53Kcesz4MY7rppAf3PnAc2UfjHzCtSAOxzJKlTDqGHn2TKyAV2H4rDFeQgw9WHiJv9F2yl0EXRuin+ilbWcl39V7xb7To2Frp90E/Ja537Ya4J+8uCOgM/k2srEXCLo1WtYyEdrna4xKj+K3TdL3RyqEwfIrEJPMDOwiLMq9LEq2jQ/+hDPI62ZZ8oyJT9MNw0QZzD+jtXL0yQQFJgx4UzLiGSf5eKf1djMV1OF+IqeOHL7xljca1maM041Pm2IUqBLX+W2iwj4aQ+Pwm9LId8wTB18S5j5pJNDA/OxQFWv+TpontZHav1mwWZAM6bnl3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVLgfs9ekoYF5VcccqilEcnnUV43rzLmeQKprL7G1x0=;
 b=CJHfUlcPA4Q2MhjiSap8W1SEYmCBQEkpGwBrEgFCGEhfNHyMbEphwiNMfctY+w9FgtblRiRdPozFC0Ai3AfcgEEH7PqqMcyM+qX6710CGK15ZB+gk4foihwcHIlJeI4getkYIayndYgnoFpBVWQ4awyduyhyvhSOXm4QmYo1kig=
Received: from CH0PR03CA0299.namprd03.prod.outlook.com (2603:10b6:610:e6::34)
 by BL3PR10MB6020.namprd10.prod.outlook.com (2603:10b6:208:3b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 08:35:52 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:e6:cafe::dc) by CH0PR03CA0299.outlook.office365.com
 (2603:10b6:610:e6::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Wed,
 29 Apr 2026 08:35:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 08:35:50 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 03:35:43 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 03:35:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 03:35:42 -0500
Received: from [172.24.233.101] (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63T8ZdXa2742071;
	Wed, 29 Apr 2026 03:35:41 -0500
Message-ID: <42b22397-721a-4d7c-a3e0-ab62ab86a537@ti.com>
Date: Wed, 29 Apr 2026 14:05:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v 1/1] tensorflow-lite: Fix file
 packaging for headers and symlinks
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <c-shilwant@ti.com>,
	<denys@ti.com>, <v-singh1@ti.com>
References: <20260423075408.1886225-1-p-deshmukh@ti.com>
 <20260423075408.1886225-2-p-deshmukh@ti.com>
 <20260427153537.GG4186@denix.org>
Content-Language: en-US
From: Pratham Deshmukh <p-deshmukh@ti.com>
In-Reply-To: <20260427153537.GG4186@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|BL3PR10MB6020:EE_
X-MS-Office365-Filtering-Correlation-Id: cb56a64f-ecb2-483a-19da-08dea5ca51ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	QNeENLnXkg/yej8xzXcsrty5uDiyBc/HPijv4C60V82sONlg2vW9K4ER6mO5cao8cPDQ1GQ+5jLoBQuWklJnZY7Z10d+25zzCzI0bJjaskyRN5uUw7IWtvezvw6P/gPJEbTH5NrqjgkKClociyWJySPI/AyAB2xDZAsCKL4W3utDOLrWtFWTfldTcKyRCF94+zGb3+w1hNiO8SvsaSgjhRiU+rPJ0sxLT267x2HrgNT3knYikm2r3oBe2Vxjg3qTEtitcBPjp5DwW0rqEZ01H2oc+bLBohkN60ahg57sllIj3gvzMMaw3J/cJwf6/ysvnqgctXdkKpc6cdApTt1gH+usupQhiKhcvnfwL7ni6ytnDjCZ2cLmUESzZLTNxKyuX23p5Kczmv00gyRCANzzfOcF++Lye2NUQqqcgyzX/gcxU1+ABPLGwFt9TqJyl+Y7r54DxalsAcLPL9e5X3xIPtNgUAFKIuxbb4gA6uwSmjCx/MtvZKYC5k518oCOLdBafzcVVB/2jtNvhbaUesoOZx6LC4ewej0/SowXRsrbYKbcp86WQP/IapepnY8fZqWDvxnFdXpq/RQP3OUb+aDetGz6eziH3u43Q5CWabOeHuEQoO8gfZ4Js6MBi6vGMhh920Ao27l/5cX3CW8Cm6fA+wIedaK2uPggB0QujrEyHPk9+2wQwNJ2BMhLluJhpiCClba6ii1ht4mRz4Syw0+1X+oKovptvgn9TR1vKuygnsQ=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	kuefK8YJYBWIm893OZ4hH6r7Lu/SLV+g9UIULT3c7mJlkyBrQAeL5uwwCLBhjcbP4UbvqtBNohC+mKC7WPnVwDCOrs66BpMtrfDbn2Y0w0f9Ezmfh3HGoWOgB6TPWEACyoDsXiUvMWLraigCN0ZuZ3gUaI2m3crJgsaNyc/Qcv97qJASBq4MupEnHb600XkD2qQffEGtwkAwiYmd1EksuPAPBG4EwgHXlDI061mYKyhuymlRpbT3GySusQgeqsG8TbG1fufX2354SeGqQUVBYesC5A1waODgL68v3X3uvtoRO4F3vsx0x6MubfN1QUYdn9TZFbfAP4we6iX4iHMC1fIye/hnmaqvQnVseGu+sb09AEW/ZIXf3ph1K0PHfeHCioM8IEzeRS/OJfRSURFlsMIgiGBAIkOAn/YoZy4AqrN3LCZ0s3cNgHaWoeR73EgL
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 08:35:50.4455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb56a64f-ecb2-483a-19da-08dea5ca51ae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6020
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 29 Apr 2026 08:36:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17507


On 27/04/26 9:05 pm, Denys Dmytriyenko wrote:
> On Thu, Apr 23, 2026 at 01:24:08PM +0530, Pratham Deshmukh via lists.yoct=
oproject.org wrote:
>> The TensorFlow Lite recipe was missing proper packaging directives for
>> development files, causing two issues:
>>
>> 1. Headers installed to ${includedir} were not being packaged into any
>>     specific package, resulting in missing headers in the final rootfs
>>     despite being built and installed correctly.
>>
>> 2. Unversioned .so symlinks (libtensorflow-lite.so, libtensorflowlite.so=
)
>>     were incorrectly placed in the main runtime package instead of the
>>     development package, triggering QA error [dev-so].
>>
>> Add FILES:${PN}-dev to properly assign development files:
>>     - ${includedir}/* for TensorFlow Lite headers
>>     - libdir}/lib*.so for unversioned shared library symlinks
>>
>> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
>> ---
>>   .../tensorflow-lite/tensorflow-lite_2.20.0.bb                | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorf=
low-lite_2.20.0.bb b/meta-arago-extras/recipes-framework/tensorflow-lite/te=
nsorflow-lite_2.20.0.bb
>> index 559ec5ef..75889b7e 100644
>> --- a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lit=
e_2.20.0.bb
>> +++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lit=
e_2.20.0.bb
>> @@ -229,6 +229,11 @@ FILES:${PN}-tools =3D " \
>>       /opt/* \
>>   "
>>  =20
>> +FILES:${PN}-dev +=3D " \
>> +    ${includedir}/* \
>> +    ${libdir}/lib*.so \
> These are part of the defaults:
> https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.con=
f#n356
>
> I'm not sure your change even does anything here...
>
Hi Denys

Thanks for the insights.
Yes there's no need for these changes as it is already

part of defaults.=C2=A0 Also, without these changes the headers are

included in the rootfs. So this patch can be ignored/rejected.

Thanks & Regards,
Pratham

>> +"
>> +
>>   FILES:python3-${PN} =3D " \
>>       ${PYTHON_SITEPACKAGES_DIR}/tflite_runtime \
>>       ${PYTHON_SITEPACKAGES_DIR}/tflite_runtime.egg-info \
>> --=20
>> 2.34.1

