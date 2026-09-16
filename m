Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF8CC88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 12:33:58 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13730.1789562037102282100
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 16 Sep 2026 05:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Qi+xvd9s;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=DawNysfC;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68GCVhtB2811408;
	Wed, 16 Sep 2026 07:33:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=CcwwLolpKv8V3b7QZqwsNUwQ4bxv3I76CFxwVL5bu
	wg=; b=Qi+xvd9sKezevshApaGw4VqgZO7BaBHhTCnWPLbFRGTglYNA4+XdcGUnZ
	bGn5j55vs++Z2kNMfGLK37Kx5+kUP4nDWRT+7Ug0KRlaksEEs7vba4nfwKYIK7u4
	m8fOjvhbXFtDyi7cKdArsseX+8r4cQpIbAPo6zBiB2+oblv/rM0sIOnaz0O/ef0p
	xk8WIoGDu+V3fmc/Odx32JMRbdbmLZClOy82LRCXB0h7rEXwCbrGwGHtF5CAcHw+
	hVuecuWJoFWlsqSV5p1gE3bY4VtXFgVGm+y4CUbjHeYHiNUphjmVtQdo2iFoSOF+
	KIaG5IjI0EiKYS+w4yI5lAumVQO6w==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013045.outbound.protection.outlook.com [40.93.201.45])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gqqmeh56g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 07:33:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FAyvhyG/fhyWfLboN0LORDNCOLcX84JxWGRPuaXUqrhA+icJ5o/VOTUB86D3R9iVKM07++s4XIWiHTSTXSSvvZi9fsF8BOG0w0rwx+OhmJgGc+Iezb+di2Q1LDzuGR1crO+jYoU44zEbbZqPlG10lxnLW+gltuTuDrvJ50VX12YWQLagkKKpTIYEXXRtlbPmV7AyUP2wv3H7ujU/hjMv2m+t2/jhDKCsHn+Z0AjB3jVs9b7D5FA0naSVbnMeDY4OwKiwSzPQ+7qcecmNh/qYHwNZBgEE5VXqribhIgbo2ysT5zdkAOtxhxoP/MaX+8rUMA3+aBcVwdiADL7/uhIPrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcwwLolpKv8V3b7QZqwsNUwQ4bxv3I76CFxwVL5buwg=;
 b=gVFXhWWY23lRR7xwHiCxenm6xw2s3PIHk9PXnfhwCABpJdkRuNO7i76JqJNERi6n43pp9grbyCpaCJutG6emzC69OFExJHFgJpFHUNdN/dZMg8ZTANAJLrvCE9W0Wz6qzYEmLd9bz0joHkKyJ/YGR+dnTbHa5DI2KVrwaK9XmgTAf301b9Ajoa6IIZDk9yFYkl8eFWYMJOxyirY2yigv9RbL8XVGMZD9DAdXf7hEZirx/DB+iriBpcV04WbW8WYKumUJpEG93eZFJ4i23FMZ2tEOqgROl2sqyGnUXTlNP4TZdGGbI5z9kcX96ZcTRwbxMUEwbRgeJAzs4iXnXX6Hhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcwwLolpKv8V3b7QZqwsNUwQ4bxv3I76CFxwVL5buwg=;
 b=DawNysfC3pxaYvNNCIk/Dx8y/l6OgGAITM3X6bdSeFo9gzO967vA8AJDwlDAHGzT0hff5g/eRDSVty29v+gN4E+mwJY8RSO+1NUeiM2fvRVMOayzxiaXvx+JSe4oLMnMwIuEjWOmeQUIfWb0184LH7ckJWSQTDBUS18+36j0cWs=
Received: from CH0PR13CA0049.namprd13.prod.outlook.com (2603:10b6:610:b2::24)
 by MW6PR10MB7615.namprd10.prod.outlook.com (2603:10b6:303:23f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 12:33:41 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::46) by CH0PR13CA0049.outlook.office365.com
 (2603:10b6:610:b2::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.7 via Frontend Transport; Wed, 16
 Sep 2026 12:33:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 12:33:38 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 16 Sep
 2026 07:33:20 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 16 Sep
 2026 07:33:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 16 Sep 2026 07:33:20 -0500
Received: from [10.24.52.241] (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68GCXGtL1958732;
	Wed, 16 Sep 2026 07:33:16 -0500
Message-ID: <4a19a503-084b-47de-b1d9-04fd10173f60@ti.com>
Date: Wed, 16 Sep 2026 18:03:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/wrynose][PATCH 3/4] recipes-multimedia: Add wireplumber
 audio configuration
To: Yogesh Hegde <y-hegde@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <reatmon@ti.com>,
        <v-singh1@ti.com>, <c-shilwant@ti.com>, <afd@ti.com>, <j-sahu@ti.com>,
        <praneeth@ti.com>, <s-sinha@ti.com>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <r-soni@ti.com>, <sen@ti.com>
References: <20260901030233.686017-1-p-bhagat@ti.com>
 <20260901030233.686017-4-p-bhagat@ti.com>
 <20260910082911.tskvsfvvpxln3qdw@uda1250336>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <20260910082911.tskvsfvvpxln3qdw@uda1250336>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|MW6PR10MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: 758292f4-43c0-4712-ad1b-08df13eebbb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|3023799007|6133799003|4143699003|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	sGxb25t7yhuf8tgKOXHNLaJyD4H9Zc2uz0hSV+vAPEdpGlvtck8GjEjcua7xWpRxbtCyHiBte8DJMP6mIPKBuRPkkgToAWuQXVIbhkE3VYopk3LBkunJVcbvJ9W3mlSslNJgYEGn82gr2kT9Zo0+YxQpM4diPFTlHXMSinGY6ERSyelNEAb2qE4wEu6TLw2iVCszWQOfeyz3fOTX1fKY48h6EhiTgiBscUnPGsD81QdhjRXP3nkpsFdoIAxl6kjF6BMW0wY8Y46KfLQEOAC6iQaGcsPW9yh4mYQb15B/lk4ZTGG+ulkkB1xlvcTe9K9uCtwHJ3f9e3ffNa2leu/LgGX8BHcdVmghGAB6kLOAo24YoeoH77bS0+LoIE/Ec+obMFLyeT3isne+jlMb9abn+DPckSGJg27WL0OmodRB48mJ5AUKc/bX1ZfZ00zicsuEs02otEes5QnyLPPnDjh5KY7jdoYhehhT7Mh6S/1+ahGQwsBJ35A9hYn/Tk50zGpd9z4GMzYZXKACCw4AWwwTiJYPZd0FU6T5Iq9JGCm1GfnRvWZGHHcCO7cBtuYQa2uiZj9ZRgIjlBSr7sKBcFTWzNEqp5sbx7UIBZLsc8LllD6d4q3davR0n1uzVEhaAVHKd9VWRk6LUWVXaLYghUcTFVAZhOtHYXg9BoOO27MPJO0c2VYNX8bFMqrNpTTVSitUGwty92bCuVLarFbuRjrfJA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(3023799007)(6133799003)(4143699003)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1JUZmwSW0r1mNd/8PzmGBxvRoNz4CzvJ+qCT+R3wrrinhbvRavu3Gh6uLG/AHcl6HIxs3yiUpQr3NBybCXRMjb3MTk6T6vJNWB1bTU5db67sxZDo29rnKABind5AJc413vvV0As3odhnmTFEl2FjHUseAEj/Cd+K6N2XG1aKW0+KkQ4ZiPnUlHKe8zQfk8ORfFTLmgh78ke/vGfhsoVL7BirrUPPgHd65P70Tsj+rWn5StcfiD+KO1iw3DzB7LjeSHlegHfJW5D+UTWSydKQAeaUA06vFd2Zg5F8ri2mE6+u0S7I0ZZY31Cjx8AJqdUNdkfgOhvIt24spZOWyyHGP536TI49hhuiCf2CsdC3Sn3X7lBnYBCLWX9Qht9wVQ2Fb1zlOL45eNtOJIgWCnMVd8zITkHRzywnjEsrQVh8d3B1N3391PVrCaq9yz7fwfUf
X-Exchange-RoutingPolicyChecked: 
	y8jZ4MDQsUZmpKXbOrLwpyDoCmpMsBvusBOLkHnmPCcjWw9G0gwOlIoHnOgtsusgu6BbA7n5ch3EJ3yaz0cpjjUUt0X/i+hTkTOpPdMx0s/wLpIyOyepGnPyh57Udr1Gp7l5u8jnfDcLOXKTTzzXb8t8os+/XAhjvGu0FORoPuwIOPx7ikGdm5PmN6N1HFWevcCy6qOt+JW0vkHu8r74qZraEX/WvpV6adxBo7itb0gypmvlQlVMp5Yo7QwXFWKVRIVT+cTCFWX7yBZs4TpzG9vlOoErk5GIAmTOGQLv31QwPd2LFlXqJZlXkW63nERuurMCV8QgXjPX7rkEaGHlPg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 12:33:38.1504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 758292f4-43c0-4712-ad1b-08df13eebbb8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7615
X-Proofpoint-GUID: -Mu6tnKGQlDNZxf1nHnzCnBHWOs5BR2Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE2NiBTYWx0ZWRfX/2ywMcRbOQPY
 2MWV+7u1Yj3KLoIRcYR7eBBqdkqRgoindmiXK3J8mSeExpVOM5FYgm07AhMlQKmVrjUsiysVx10
 QeSefEDOSA3CrTfjptg6JhPwrRTaWxo=
X-Authority-Analysis: v=2.4 cv=ausnmiZV c=1 sm=1 tr=0 ts=6aaa8cae cx=c_pps
 a=vt7ZpyDplQGd1SQmd2LaWQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=-zj3_5qqJDoFt5ORA4QA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: -Mu6tnKGQlDNZxf1nHnzCnBHWOs5BR2Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE2NiBTYWx0ZWRfX7pE9GZ+/3g1x
 abIvfxN3E2zYqyc/wZT3fXNfWN/z5PTAAvImH352O4PGm9ujYVJ66jyIwPFBriRYST5H5Qto3Nr
 yzwP0FuAG19lqTKG2Bjt/N63jTvOiv87KM1XhyM8ixNOg6doyIANZsVBUo/YNaXbdJ2mrgjE21X
 SwLvBtFSN7IUscrgfwakDfbBNKgOrNKyOAMmbbjgJV3CBwlHWGT/SBoOatySGvGXc3MP7f+iNWv
 0Qcpa2s7HONoqYvI7KhCImMBuDhM284LzzxGu2jCipM1XKJVMviHB9QY3/wnTnaTNLYkbBXxxEl
 hUaeIrKO5kPQLLBhhABSWK/b7wmRIP+Hm9j3Hv1DYHPiqKQzuS62Tp9Z6uJ2QdtdjEJzSxa93it
 +MIH5L0rxChdfkynq6T7xrGyH3/IfILi24bULPt2i9TbuwROC3jGyj3Iti0JxTuiazVV2mvL8X1
 j2f81vLBXA7+7kYt2fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160166
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 16 Sep 2026 12:33:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17673

Hi Yogesh,


On 10/09/26 13:59, Yogesh Hegde wrote:
> Hi Paresh,
>
> On 08:32-20260901, Paresh Bhagat wrote:
>> Extend the wireplumber recipe to enable the session manager on all
>> plaorms and provide AM62D2 EVM specific audio initialization.
>> A set-audio-defaults.sh script is packaged to configure default audio
>> sinks and sources at runtime, managed by a dedicated systemd service
>> that runs after wireplumber starts.
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>>   .../wireplumber/wireplumber-arago.inc         | 33 +++++++++++++++++++
>>   .../wireplumber/set-audio-defaults.service    | 21 ++++++++++++
>>   .../wireplumber/set-audio-defaults.sh         | 32 ++++++++++++++++++
>>   .../wireplumber/wireplumber_%.bbappend        |  4 +++
>>   4 files changed, 90 insertions(+)
>>   create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
>>   create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
>>   create mode 100755 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
>>   create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend
>>
>> diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
>> new file mode 100644
>> index 00000000..6325d26c
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
>> @@ -0,0 +1,33 @@
>> +PR:append = ".arago1"
>> +
>> +FILESEXTRAPATHS:prepend:am62dxx-evm := "${THISDIR}/wireplumber:"
>> +
>> +SRC_URI:append:am62dxx-evm = " \
>> +    file://set-audio-defaults.sh \
>> +    file://set-audio-defaults.service \
>> +"
>> +
>> +inherit systemd
>> +
>> +# Enable wireplumber for all platforms
>> +SYSTEMD_PACKAGES = "${PN}"
>> +SYSTEMD_SERVICE:${PN} = "wireplumber.service"
> `wireplumber.service` file seems to be missing. `meta-openembedded` does
> not add the file neither does `meta-arago` nor the patch.


The service files comes from sources and not via yocto layers.


>
>> +SYSTEMD_AUTO_ENABLE:${PN} = "enable"
>> +
>> +do_install:append:am62dxx-evm() {
>> +    # Install the script
>> +    install -d ${D}${bindir}
>> +    install -m 0755 ${UNPACKDIR}/set-audio-defaults.sh ${D}${bindir}/
>> +
>> +    # Install the systemd service file
>> +    install -d ${D}${systemd_system_unitdir}
>> +    install -m 0644 ${UNPACKDIR}/set-audio-defaults.service ${D}${systemd_system_unitdir}/
>> +}
>> +
>> +SYSTEMD_PACKAGES:am62dxx-evm = "${PN}"
>> +SYSTEMD_SERVICE:${PN}:am62dxx-evm = "wireplumber.service set-audio-defaults.service"
> Consider append instead of `=` in the line above, so that the variable does not get
> overridden.


Thanks will correct this in next version.


>   
>
>> +SYSTEMD_AUTO_ENABLE:${PN}:am62dxx-evm = "enable"
> Is there a need to re-define `SYSTEMD_AUTO_ENABLE:${PN}:am62dxx-evm = "enable"`
> and `SYSTEMD_PACKAGES:am62dxx-evm = "${PN}"` ?


Will correct this in next version.


>
>> +
>> +FILES:${PN} += " \
>> +    ${bindir} \
>> +"
>> diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
>> new file mode 100644
>> index 00000000..191b89f5
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
>> @@ -0,0 +1,21 @@
>> +[Unit]
>> +Description=Set PipeWire Default Audio Devices
>> +# Wait for pipewire and wireplumber services to be started
>> +After=pipewire.service wireplumber.service
>> +# Ensure udev has settled so audio devices are available
>> +After=systemd-udev-settle.service
>> +Wants=pipewire.service wireplumber.service
>> +
>> +[Service]
>> +Type=oneshot
>> +ExecStart=/usr/bin/set-audio-defaults.sh
>> +StandardOutput=append:/var/log/set-audio-defaults-output.log
>> +StandardError=append:/var/log/set-audio-defaults-error.log
>> +RemainAfterExit=yes
>> +TimeoutStartSec=90
>> +# Restart on failure with delay
>> +Restart=on-failure
>> +RestartSec=5
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>> diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
>> new file mode 100755
>> index 00000000..49be177e
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
>> @@ -0,0 +1,32 @@
>> +#!/bin/sh
>> +
>> +# Wait for WirePlumber to be ready
>> +i=1
>> +while [ "$i" -le 30 ]; do
>> +    wpctl status >/dev/null 2>&1 && break
>> +    sleep 1
>> +    i=$((i + 1))
>> +done
>> +
>> +# Additional delay for nodes to appear
>> +sleep 2
>> +
>> +# Find audio sink ID
>> +SINK_ID=$(pw-cli info alsa_audio_sink 2>/dev/null | head -n 1 | awk '{print $2}')
>> +if [ -n "$SINK_ID" ]; then
>> +    wpctl set-default "$SINK_ID"
>> +    echo "Set default sink to ID: $SINK_ID (alsa_audio_sink)"
>> +else
>> +    echo "Could not find alsa_audio_sink"
>> +fi
>> +
>> +# Find audio source ID
>> +SOURCE_ID=$(pw-cli info alsa_audio_source 2>/dev/null | head -n 1 | awk '{print $2}')
>> +if [ -n "$SOURCE_ID" ]; then
>> +    wpctl set-default "$SOURCE_ID"
>> +    echo "Set default source to ID: $SOURCE_ID (alsa_audio_source)"
>> +else
>> +    echo "Could not find alsa_audio_source"
>> +fi
>> +
>> +echo "Done"
>> diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend
>> new file mode 100644
>> index 00000000..541b2963
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend
>> @@ -0,0 +1,4 @@
>> +WIREPLUMBER_ARAGO = ""
>> +WIREPLUMBER_ARAGO:arago = "wireplumber-arago.inc"
>> +
>> +require ${WIREPLUMBER_ARAGO}
> -- Yogesh

