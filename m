Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08085C88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 12:31:18 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13691.1789561869213134326
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 16 Sep 2026 05:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=NuJ0wVsE;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=KJxNVQPq;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68G8SBJ92344429;
	Wed, 16 Sep 2026 07:31:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Hdq2dzjeng6ih8pNmXGHJC8+/O+dU18sOJEPJnIPR
	B8=; b=NuJ0wVsE5szE3yiHFBQbCud5R/PjM8q0Cc3KztFLZkgs50fmHEwF7Q3RR
	fLKcgvsNoGqCGIROYbgfMEQJr81QkWt4kEqPKbW7ALX75hsvo9A2vbaa3kv1lZe0
	S2XBYb2UP/AmG5/ooouc6TOsrw+GkAAsSYFdFs4PWxMVsx+kgaI/YfK+zz9CFw5q
	m4xJvre4GluhlGlpz5keYz4VscvwdlkfGDLeAkdYUFW5zdYGP5kM5r3ZS2eNCXaI
	y3+AsD7lj/3gxa2JAJ/3rEIp4dspl6mhaXZJqH9gE5aaTN3+8GCCM9lkFM1poLeA
	Q1Yvf+yXV+QdB49O8WPrCYY82qLKg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011050.outbound.protection.outlook.com [52.101.57.50])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gqqmeh4p5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 07:31:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6HsnFMShT0d9rYXPnSvP8xxzPcAeMCR8Hqdm/UvHbom3kkHvOlOmbJyrIh8Jo3wYuqd79dvLW5PII8Pxl1KI7C/HLr42pa/TUJrabAdDSBYUQTfcAYG0k9w+T2IXcexr4AAzfoGNJRK3Rwu/wrxXx43TnQM2ytBu3BwhH7EnNiMPlwxkr/vukaQy5qBJFmwwFn6gkpXxX02vtJnj9k6lfQcPBobJOfAf6smjijmdX3TRb3F3baffvUOtGKaBAarG933rpWqk7avH+2ws3n4mHpoX53LS0BUiSTj/f8wh6pJeR92lCMAUHvMnpqBe56pj0KB89V2RU1qrJyy/wIDOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hdq2dzjeng6ih8pNmXGHJC8+/O+dU18sOJEPJnIPRB8=;
 b=m1iX4/iZ233K4gDaErNyuipz37BdMjtmNdUoA64l3FFEyRHrscHBtoJmMDSwkM2yElCBjfg6cURWQ+8g3P2mRB1l8D6RpEZoidzSN7+bhyOd3C6zYpbxS8pS8X07KVQCQVkPvZaL/FDjVJ5UBexsX/J10G364myp1cf9h4GnJc0QO5T500uU+MJ/TE5fdZtCciCtTIFta/uLBbfMJ8ehJkEJLJSpR03cSMQN1cEz1HcTOHX+n3q9X+B0V6P5d+cjHJOV9DueYpDGvbCS2GIc2nP54AmlZw7GV2/SbiHC++rxJ0lXksqc+t/PGJgxFL0GzcLg2Yn5NzaqNXLMH3SpfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hdq2dzjeng6ih8pNmXGHJC8+/O+dU18sOJEPJnIPRB8=;
 b=KJxNVQPq+vnFUMkLDQUWBnVyvj1FYqbaIq69+4k8AjQj/4YHl5Ilocq06yqY2b+t5MiPBsMurUYdrSxpNWg+uNLSCEQQkaE4ZGXYZh2jxkS7PGGG7kb12pMoNznmPglCQjp2UcrP2YvXRvyd8PPziykO0YMJ+vFCoJhJUsmn/SI=
Received: from BN9PR03CA0416.namprd03.prod.outlook.com (2603:10b6:408:111::31)
 by MN2PR10MB4254.namprd10.prod.outlook.com (2603:10b6:208:199::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 12:30:59 +0000
Received: from BN2PEPF0000A990.namprd04.prod.outlook.com
 (2603:10b6:408:111:cafe::89) by BN9PR03CA0416.outlook.office365.com
 (2603:10b6:408:111::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Wed, 16
 Sep 2026 12:30:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF0000A990.mail.protection.outlook.com (10.167.248.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 12:30:58 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 16 Sep
 2026 07:30:16 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 16 Sep
 2026 07:30:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 16 Sep 2026 07:30:16 -0500
Received: from [10.24.52.241] (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68GCUC9f1954009;
	Wed, 16 Sep 2026 07:30:13 -0500
Message-ID: <89d344c6-0459-4a0b-bd60-98007c134bd2@ti.com>
Date: Wed, 16 Sep 2026 18:00:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/wrynose][PATCH 2/4] recipes-multimedia: Add PipeWire
 bbappend, service and config files
To: Yogesh Hegde <y-hegde@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <reatmon@ti.com>,
        <v-singh1@ti.com>, <c-shilwant@ti.com>, <afd@ti.com>, <j-sahu@ti.com>,
        <praneeth@ti.com>, <s-sinha@ti.com>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <r-soni@ti.com>, <sen@ti.com>
References: <20260901030233.686017-1-p-bhagat@ti.com>
 <20260901030233.686017-3-p-bhagat@ti.com>
 <20260910081545.vl276qiry2psvqel@uda1250336>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <20260910081545.vl276qiry2psvqel@uda1250336>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A990:EE_|MN2PR10MB4254:EE_
X-MS-Office365-Filtering-Correlation-Id: f1d2abbe-34a0-4b82-d4f0-08df13ee5c80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|4143699003|56012099006|10067099003|3023799007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	TzFREKvds1y4UeLjte5ZGwoM920qsIKNxBlYYp/qD+K6O/IAEYtbje3Ll0KKTPVUT3Diwazs0Z1Cg1SvCishkFywXEKXtvafu2vfTh9QWVqP88fVQYiVFB2sOiZeh1OBkqMTL5Y35G+nIjlftST6YOZC8hCOz35hbH0YE9hJTQNROTkBscpbGgQvVYmZZscHZcNUjYfq8KlSGmO0mgAgIIWAc2mtKmeLPIt/46xz58oxQ7btS4T320oWxfwR8nNx+UNBd8IAqBOyIDkaaflAVxmS2n1WauYcUY0eVmfk+sSvhsYyNoMaIzNncCEzo6d+ov+Af99WGsLIs6EFip/8qNr0+1E6ZFkusbI/mapEYwlccKNdX/vKXZxg8FmUk43C+whtLtRocgdBAegjQsAY0eHDW3/pO1bndUC8bwRvmUbkLb0IBnQWO+bOk/dAUm77bYsABIj5FuIMFEk1UpxWhhF2fU5CZ1OaGao85n580ppdAtdOyi0/YdW4TzLOU8tOUGh1b1rD8cW9r/ko3v4QG2LLhjLXbjENN5jFPz5JI7aypqpefwCw52BOiyWhlIWT2K0TGoRzF/dimUprLtM5FfXWMNzM9x61n3Z1yNdBrv99RBayk2juV539Y6O8hIgY/9Thy8kKeHNd2owXfj3Fj9SlUXIIIJDzHBeTx/09nfoeQ+3iTesfABJQuy6AkDA2ORpPmzNWcQ8qYLSccnvrTQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(4143699003)(56012099006)(10067099003)(3023799007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	M1OaTi3Fk/LC8apEqK243XTs1aWqC4BRtpeCq3RR3UpZf6BUis58k6g4AlqgESSaRfd/W7CCot2zbWcB8UWzHtXQa2Ta2jIXx9pXu9iyOVje6LJnVfIM1xnOui8276V51jcQ1c7s0gamc1u+l0D4QnZqxdQ4CSzJHcexSfTD36JEZOEe1OfVobf9Vyw6hQQTk62wgT/hUkYcdWEcWNDqUGaX6tfiV3bfEYiH0nRkteRFChzhlvVbVEvSlmN4WD6JV/XO4tUBrBm9ENzSJeFYGoq921EcFFRc/EZOtKPRTxzfdsZO/Mjc4l8a8KIyoOwS8f1FN0ZldVFkc4hH+uP+YXY70ChR5XmlmKdT51USJB+3IdcURPNRJFWGlBKz/8mP16Gt9Uuy+NQ89Hh3NjVqhhvf3sKna46ahfstT3h83fMu+XLCxZe0LzMMJjpxaoLT
X-Exchange-RoutingPolicyChecked: 
	L5XCOHuBk5EAUulTPW1fn+BhAsQ+JRkudfLVykgR+z04MPpq9ytFeymu5lHep60ubE9LOqimOrs9mo4i8b5++0xZMrcYLVlh8LLdAQGcXWOtbzpeVt+PlGISTNCiS9e6ZCRiHvwwQBmQddkTbEWQB7otXQbbDKINLKDAhF6JaycuvyrbmkPlgVLWElNrDiuL9vKrN+9MD4i93dnGLtMDqE/Wa/kCHzfBg41D6WUGgBPnEuoGt7so5KXuzdzXNVoOdC5v4VMoSYT9JaPVHJKNDWcH8ZGd0DswFHBz9QXzX+oMMe5VWYdYPk4LYYm5pnz+L/p4yluiSXZ9YXSscOwlWg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 12:30:58.3811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d2abbe-34a0-4b82-d4f0-08df13ee5c80
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000A990.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4254
X-Proofpoint-GUID: ZwBWSGydBahPJ0gNzZmU3wnBwHBmwiE_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE2NSBTYWx0ZWRfX2PKJ1Ku+298Q
 Qlj1dJz5Or61sha/ToDIZVRlFYDF2hAl1FhEGHsum42IxlZCyxX6WVyEEQJkenTNTcacJ9l1+rQ
 6icYLEis6T8gj8ruc9lmbhL7yAX6+TY=
X-Authority-Analysis: v=2.4 cv=ausnmiZV c=1 sm=1 tr=0 ts=6aaa8c06 cx=c_pps
 a=l+Dg58WJtlZLJwH7BKFLvw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=zH_SRdH17qHPImB18lYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ZwBWSGydBahPJ0gNzZmU3wnBwHBmwiE_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE2NSBTYWx0ZWRfXzZFHFuLBFBVQ
 jyi3OpIVy94XLhdLoEm2XhBeFL0hZBY3OiZa1uh5F6CB7EaP4eftcXk39Kkf/JhGqsMjbdX5ydN
 sbKX1mU1gtHoBtR4hPZhQdwDG+twGz6P5n5Rps/a3fIujYG50Yu/EcA3Lx8/m+boxe/GQh4XyDZ
 IXJjAgm5I/opg9B6xSt70MDkUYUa7ahdcdO2muRfQ7FSRIxR567VchFFITNxizfzwfVL1pMntOP
 bOL9eRdFT2FyZmuzkKjxiDfJP0ixETzwfzLHV5egcjiSxLXYd9CMSGZI3GCCE0zyQZSTjOuC2A2
 xojcWbV4AfcK7d3oIH1i7xX+LSz3LRZgG5/9ahIC/aOLVLc6bJaYkffEfXoz6RjDoFSFy6TI6K9
 IongBKXe3qlaJOGmqJXl9/j8n0oUVw33mIn5Zi+Zc9figTUMqJDw3EidgJo9Oeue+/GmpZwyWTO
 8ZH3xouV3oBUzDfzfdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160165
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 16 Sep 2026 12:31:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17672

Hi Yogesh,


On 10/09/26 13:45, Yogesh Hegde wrote:
> Hi Paresh,
>
> On 08:32-20260901, Paresh Bhagat wrote:
>> Extend the PipeWire recipe to add platform-specific ALSA configuration
>> and service file. Service file added to start PipeWire as a system
>> service with proper socket dependency.
>>
>> Add sink and source configuration for 8-channel audio playback and
>> capture on the AM62D2EVM as the default configuration is 2-channel.
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>>   .../pipewire/pipewire-arago.inc               | 28 +++++++++++++++++++
>>   .../am62dxx-evm/90-pipewire-sink.conf         | 21 ++++++++++++++
>>   .../am62dxx-evm/91-pipewire-source.conf       | 21 ++++++++++++++
>>   .../pipewire/pipewire/pipewire.service        | 26 +++++++++++++++++
>>   .../pipewire/pipewire_%.bbappend              |  4 +++
>>   5 files changed, 100 insertions(+)
>>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
>>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
>>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
>>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
>>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
>>
>> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
>> new file mode 100644
>> index 00000000..b3e0c555
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
>> @@ -0,0 +1,28 @@
>> +PR:append = ".arago1"
>> +
>> +# Pipewire service for all platforms
>> +FILESEXTRAPATHS:prepend := "${THISDIR}/pipewire:"
>> +SRC_URI:append = " file://pipewire.service"
>> +
>> +# AM62D-specific config files
>> +FILESEXTRAPATHS:prepend:am62dxx-evm := "${THISDIR}/pipewire:"
>> +SRC_URI:append:am62dxx-evm = " \
>> +    file://90-pipewire-sink.conf \
>> +    file://91-pipewire-source.conf \
>> +"
>> +
>> +do_install:append() {
>> +    install -d ${D}${systemd_system_unitdir}
>> +    install -m 0644 ${UNPACKDIR}/pipewire.service ${D}${systemd_system_unitdir}/
>> +}
> drop the do_install:append, this installs the service file even if systemd absent from the rootfs
> bloating the rootfs. pipewire recipe already installs the service file via systemd class
> `SYSTEMD_SERVICE:${PN} = "pipewire.service"`


do_install:append will be needed here to replace the service file 
installed via make and not using recipe.
I will add a check to install the service file only if DISTRO_FEATURES 
has systemd.


>
>> +
>> +do_install:append:am62dxx-evm() {
>> +    install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
>> +    install -m 0644 ${UNPACKDIR}/90-pipewire-sink.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
>> +    install -m 0644 ${UNPACKDIR}/91-pipewire-source.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
>> +}
>> +
>> +FILES:${PN} += " ${sysconfdir}"
>> +
>> +PACKAGECONFIG:append = " pipewire-jack"
>> +PACKAGECONFIG:remove = "jack"
>> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
>> new file mode 100644
>> index 00000000..86481af6
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
>> @@ -0,0 +1,21 @@
>> +# PipeWire source configuration for AM62D.
>> +
>> +context.objects = [
>> +    {
>> +        factory = adapter
>> +        args = {
>> +            factory.name           = api.alsa.pcm.sink
>> +            node.name              = "alsa_audio_sink"
>> +            node.description       = "Audio Output"
>> +            media.class            = "Audio/Sink"
>> +            api.alsa.period-size   = 1024
>> +            api.alsa.headroom      = 0
>> +            api.alsa.disable-mmap  = false
>> +            api.alsa.disable-batch = false
>> +            api.alsa.path          = "hw:AM62D2EVM,0"
>> +            audio.rate             = 48000
>> +            audio.channels         = 8
>> +            audio.position         = [ FL FR FC LFE RL RR SL SR ]
>> +        }
>> +    }
>> +]
>> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
>> new file mode 100644
>> index 00000000..71b7ec76
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
>> @@ -0,0 +1,21 @@
>> +# PipeWire source configuration for AM62D.
>> +
>> +context.objects = [
>> +    {
>> +        factory = adapter
>> +        args = {
>> +            factory.name           = api.alsa.pcm.source
>> +            node.name              = "alsa_audio_source"
>> +            node.description       = "Audio Input"
>> +            media.class            = "Audio/Source"
>> +            api.alsa.period-size   = 1024
>> +            api.alsa.headroom      = 0
>> +            api.alsa.disable-mmap  = false
>> +            api.alsa.disable-batch = false
>> +            api.alsa.path          = "hw:AM62D2EVM,0"
>> +            audio.rate             = 48000
>> +            audio.channels         = 8
>> +            audio.position         = [ FL FR FC LFE RL RR SL SR ]
>> +        }
>> +    }
>> +]
>> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
>> new file mode 100644
>> index 00000000..c26bf93f
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
>> @@ -0,0 +1,26 @@
>> +[Unit]
>> +Description=PipeWire Multimedia Service
>> +# Ensure kernel modules are loaded and udev has finished device processing
>> +After=systemd-modules-load.service systemd-udev-settle.service
>> +
>> +Requires=pipewire.socket
>> +
>> +[Service]
>> +LockPersonality=yes
>> +MemoryDenyWriteExecute=yes
>> +NoNewPrivileges=yes
>> +SystemCallArchitectures=native
>> +SystemCallFilter=@system-service
>> +Type=simple
>> +AmbientCapabilities=CAP_SYS_NICE
>> +ExecStart=/usr/bin/pipewire
>> +Restart=on-failure
>> +RestartSec=2
>> +RuntimeDirectory=pipewire
>> +RuntimeDirectoryPreserve=yes
>> +User=pipewire
>> +Environment=PIPEWIRE_RUNTIME_DIR=%t/pipewire
>> +
>> +[Install]
>> +Also=pipewire.socket pipewire-manager.socket
>> +WantedBy=default.target
>> \ No newline at end of file
>> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
>> new file mode 100644
>> index 00000000..dc32422b
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
>> @@ -0,0 +1,4 @@
>> +PIPEWIRE_ARAGO = ""
>> +PIPEWIRE_ARAGO:arago = "pipewire-arago.inc"
>> +
>> +require ${PIPEWIRE_ARAGO}
>
> -- Yogesh

