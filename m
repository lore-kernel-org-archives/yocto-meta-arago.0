Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11353CA5FCB
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 14:59:11 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13356.1790866743857485661
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 01 Oct 2026 07:59:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=g9B7rJmM;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=JxDgMBe7;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 691DkAXF2346157;
	Thu, 1 Oct 2026 09:58:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=NyfyCErccHSzmcItTVms1dOjY4r7KG64dOX1wjVNC
	rU=; b=g9B7rJmM8WdY9qA4bpIW6PAyYEAOUjX2zpgy1RhjEn5Yr5bE9FOHjQmvM
	v6ksETwXX8Nb8AMsT8/XzR6Agv6endYxsF38U6iNt/t4h4c40Co2Y98Wxo1XvFBI
	9AcWvSaHdY0Yya6xhBZfIYcweYIUVBS8/G1pctvQTEMyq+P+bwloV8eWqTb1jEFI
	1Lt7/uxZhRFixK/+YcqoR0ZlvX0xHDTwfDVTA6YjiFCJT+DQ5P4CeIZ3nSEEi5SR
	xLkSGCW1U9D2AEovWiB4RTPgOht6TsW/HkzLhxPQshBD9zJ2ArJT7+8v5IwpdXFn
	LemV+AUL6k5JnCREbT1D1Y2JIQEag==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012019.outbound.protection.outlook.com [52.101.43.19])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h1kufta0w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 09:58:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElLpEHi42nptLbpjF9t4ILZcpWjlqUVMOaiQrM9gF5aWE8mT9zFid7Dn3GOAmGmQaXnRVdEjDSnBxaIEv4aG91RfHExH4+NATP4/ci0nTWFWuhMbbN4Er2zxjmB2j/Vw7oaNAYTsZJFViMLa9GbPGJSl8b47RTzeN1/hWutGJ4RuwurWAQcMeXAde+yidn0oYeUmo8Az+oZ+k1e02LT/GIslr1DNW4C5i+jIuGp+vrsTE4xDAH4StleqJ/ViSouN+6ULHTsgsLwmkOfM6OEyKiyU5M80D7TTOWnKLbQTDD3Q8LflgBUmysLNZOZezntAsLqOtO+mjM2S84kkNv6PaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyfyCErccHSzmcItTVms1dOjY4r7KG64dOX1wjVNCrU=;
 b=HOfegArvUY8NFyRCW39qWm2RFHMyUp7eQMq1x2mFIuVd6MG5ElaSOTtgGeFdjdRcfBeOQlKPGxA5jfw7+yUAzbeTohi4jJ01blg1DsLztp0udfHG7HAjCoDIUdGB2ivmvWbO69Q/1qCFVmojtc4H5hgTZVLcMx5LhmDS2K7CkBAYLIsUCSQYpx68auhEmXq+AC9m3ISj9BtfCiGQO2qAxTVvUt8PdeCb2LJYUxgopWoYv6Yl5lELUCdbXI2gdycFQOmdrkvO9Igl1Q2SkjlePw2hk6ddEkXCfXS8B/OZcbeilbgBPpBFkhM7aunpWfHlLjknEt7fJdghQmZ844PT3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyfyCErccHSzmcItTVms1dOjY4r7KG64dOX1wjVNCrU=;
 b=JxDgMBe738TVMUHGAWF25UQdaTHA/UY5yT5nTSuhWa4Df+kCG3xTxNG8GL2LvHFXHJtAwtvASYuCIxjs70AJYBX4swFSYpq6ouIWQibMyCEEzQbIlR6f+hStlLDJ+jqUNuQ0lknUyyRPZcxoDAaYAm33A6Fa5tiWO1gyzupOu5M=
Received: from SJ0PR03CA0192.namprd03.prod.outlook.com (2603:10b6:a03:2ef::17)
 by DS0PR10MB7344.namprd10.prod.outlook.com (2603:10b6:8:fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Thu, 1 Oct
 2026 14:58:45 +0000
Received: from BY1PEPF00026965.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::40) by SJ0PR03CA0192.outlook.office365.com
 (2603:10b6:a03:2ef::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 14:58:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF00026965.mail.protection.outlook.com (10.167.244.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 14:58:42 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 09:57:56 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 09:57:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 09:57:56 -0500
Received: from [10.249.66.148] ([10.249.66.148])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 691EvumJ2146629;
	Thu, 1 Oct 2026 09:57:56 -0500
Message-ID: <e3bbe94d-90a0-4f60-896b-764bba47753e@ti.com>
Date: Thu, 1 Oct 2026 09:57:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] mesa-demos: Update recipe to match
 oe-core
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20260930222241.3467841-1-reatmon@ti.com>
 <20260930233622.GK4190@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260930233622.GK4190@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026965:EE_|DS0PR10MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: b4381c3c-8812-46a7-516b-08df1fcc7c2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|56012099006|10067099003|4143699003|3023799007|18002099003|13003099007|22082099003;
X-Microsoft-Antispam-Message-Info: 
	+0Rbz4hYg+H6JIhE/FxNxZlQ9+wY4pEySpdL3dtG0llkqMOdTxKjXeTSXcxUz+s8LEUoVA1/RVsTRqEBHrtjWhlbz9ePE4gvhqTPQ98jRGm574/BZdku/Ezn88ef2+cCioG4ak3mi0wcF2M9Oltho+OyrQeXhPdnDk5ZFE+H55X4jaXesfVV8p5dfCIhqceMPOlV2ndhhs0MDyClxl6FNGP8fcWEWgfjXj+/a7F5Lmu4azh7MS13/WKMg4mf6a0woQudGofZXhY4FoQQlcfd3BMYyiUFKowZzwLknSEq5z+1Gxi75XxeWubw5XiDQoE1Yp1743slRqyvL1rs3scHrrAq7engd6Ef4C+RzveYuv/9nAiQHNX1RyNtivDsXgvZBGOtlhQpMTv96/YqcdsdAioCFX/edx91FMaBO25J1neL9h1RY+S0IhZjbCt83PNY1NTH8CBlpY5H/rT3s+1oV+vvidl5kWBbnKh6n+xIqvc27KDoHZFTV3Kw6LzqNfYMdSU5kI1M6pcmynOKT7qpR9YSInhJL0I3LNmSbsaZuHHWJE51snuxWmLZU4Cv1oUUDFzwyqN5Iz0j7qItr8ZUmEkSmNiq4BzyGrjIG8S2lY+kNj2ZztZx/+nthaOjmmhR9i+doD+7bRGbYmaW41d6Zg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(56012099006)(10067099003)(4143699003)(3023799007)(18002099003)(13003099007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4GSdwhrXqxI8gOrzmG756Vb1nd0/zoEXxnGaq8HqT4il1oSMMj2y+CjMUkgfBxXmzQA5l3aTGzb/cNk3kRjZYf36f2te2CHslOHem6Y7xtlgo//qVCCG5JNe7dKef6lOwgea3UYzSfjMkAGYFEayzbPdRJlVknhWAF//eSwU2yqVuPRv+4CGh/gGKB6UksyFDBvmD1qD7TLCzEUhpYAdNHHxMRqTWwed1xvb+jhNBrS9u45oBJGnKunBYYkAb9tdWKBqadlCys7sy/hq7hbKp5DawWWJEJ356z6RyQBt/Jv/CkbhScw63apMyLDKRzY+3jnc/nI94MtzxHhW2p/ms+ftAunw1I8PvNCkQzI+P13mYQyYrks/gSzdZM+jmdKrPye37y4pNRSV3DxHKOQszuqh4TliH0xVnPyQIROPYaQWuNJyIALlPWV6lU3MJxG5
X-Exchange-RoutingPolicyChecked: 
	VQVRN1rwxtfzJtCb9jKIPggQyUbskcFxU/7Uhkn5rVHzgEHg6pW/XQtpvGpYg8v1N96PizPwTbc1/SsVEM5MAmjjj2byVZUrwpQCK2TWv/fK8JnamRU/Ijd86OpS55/UNFZFkIosPcsIcNhhj75KmDUa99RShHrtmTZ45UzU5T5oOq6oOaZObPDZ5lvoT42pMYhKh7EBZ6IVsBq5eYyoG0Kq3saaT3jIGg1jxUJmcan1R2MoqXUAml0tUk4fix8f+UilobEevp29ZcM7RJir8nszHtyS6W+5JcsDwRmvKJGLo5REmXSs5UP09fkJYPziJ6gfP3I95UiSOrTa0RaX+w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 14:58:42.5790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4381c3c-8812-46a7-516b-08df1fcc7c2e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF00026965.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7344
X-Proofpoint-ORIG-GUID: eBwoFD4LtWdJz2mGzcP20S0pEL57Hnrw
X-Authority-Analysis: v=2.4 cv=I+Lw19gg c=1 sm=1 tr=0 ts=6abe7533 cx=c_pps
 a=/2P0sUepIMZl1V3lWabuzw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=ZpVaWaFtAAAA:8 a=e5mUnYsNAAAA:8 a=iGHA9ds3AAAA:8
 a=sozttTNsAAAA:8 a=95MdnHVV0P0apCzh3JIA:9 a=QEXdDO2ut3YA:10
 a=5tn4MO8azEBWFjlAA-rn:22 a=Vxmtnl_E_bksehYqCbjh:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: eBwoFD4LtWdJz2mGzcP20S0pEL57Hnrw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1OSBTYWx0ZWRfXwJYGscY+5bIO
 m6eaIQJDQOkh0eTyuCjiGCbM1l9pHBVcLJLln4n6Eg6N/8nkVprP4HFbC1eaYPzsris1oy6XZdT
 Obeo9ZRPANcixP6GGh/7heF5WVLidjcBmHT6OqkwnWPDCcPFRc1tQWdYHEKbTRsj0ZHBvimvRUh
 vojtZb1cUxDV0Cq5JZ6ha78WHR/1CQKco+w22AobEIccIcWp+cbuAD8+i1Z46eQzh+AvjuHUlCo
 K+RX077C2e9Qf4FlpkxV1/WXDR82JLKI8bE08haxBzl8XV9lvAuF8gUmd7ktDEln3sYKH7paO9d
 MFJjrNw/luR/Tnm7Ef7q4e3M7iI8d+PhHTLOWBMJZ/SWfho5R4YWGSti3zMpNXQolH4+P2qCVNt
 Zsx60+1NIEZfQzB74qMEok+EQTSTLZj5gv7B/B0FxiuXUvGgFfWIS6OJdT46IPV8cvqlDXKpKh3
 wck+rr2+XTvWiKejhug==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1OSBTYWx0ZWRfX+o7OCA/4+taj
 Z3ph8QRCjbxsO8jm5BfrcODTmmGD3gnGTd1Z3k2jpDuLc4sgrtvWNK77F1TESKnAZ4KWks4Pfpw
 m3r7kVRVetwhQYaAsN6wommXWa00me4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010059
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 01 Oct 2026 14:59:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17728



On 9/30/2026 6:36 PM, Denys Dmytriyenko wrote:
> On Wed, Sep 30, 2026 at 05:22:41PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> oe-core has moved the version of mesa-demos beyond the SRCREV that we
>> were pointing to in our mesa-demos_get.bb recipe.  We can safely remove
>> our recipe in favor of the oe-core version... except there is one change
>> in our recipe that is needed that oe-core does not have.  Removing "x11"
>> as a REQUIRED_DISTRO_FEATURES.
>>
>> We are working on a patch to oe-core to fix this, in the meantime we can
>> carry a simple bbappend to correctly adjust this.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../mesa/mesa-demos-arago.inc                 |  1 +
>>   .../mesa/mesa-demos_%.bbappend                |  4 ++
>>   .../recipes-graphics/mesa/mesa-demos_git.bb   | 41 -------------------
>>   3 files changed, 5 insertions(+), 41 deletions(-)
>>   create mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
>>   create mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos_%.bbappend
>>   delete mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
>>
>> diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc b/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
>> new file mode 100644
>> index 00000000..ff3f2992
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
>> @@ -0,0 +1 @@
>> +REQUIRED_DISTRO_FEATURES:remove = "x11"
>> diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_%.bbappend b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_%.bbappend
>> new file mode 100644
>> index 00000000..3b26e342
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_%.bbappend
>> @@ -0,0 +1,4 @@
>> +MESA_DEMOS_ARAGO = ""
>> +MESA_DEMOS_ARAGO:arago = "mesa-demos-arago.inc"
> 
> For a one-liner like this, I'd suggest doing it directly in the arago.conf,
> instead of a distro-guarded .bbappend:
> 
> REQUIRED_DISTRO_FEATURES:remove:pn-mesa-demos = "x11"
> 
> Similar to how we do this for different PACKAGECONFIGs...
> 
> It seems cleaner and is already distro-guarded.

True.

> 
>> +
>> +require ${MESA_DEMOS_ARAGO}
>> diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
>> deleted file mode 100644
>> index 8dab581b..00000000
>> --- a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
>> +++ /dev/null
>> @@ -1,41 +0,0 @@
>> -SUMMARY = "Mesa demo applications"
>> -DESCRIPTION = "This package includes the demonstration application, such as glxgears. \
>> -These applications can be used for Mesa validation and benchmarking."
>> -HOMEPAGE = "http://mesa3d.org"
>> -BUGTRACKER = "https://bugs.freedesktop.org"
>> -
>> -LICENSE = "MIT AND LicenseRef-PD"
>> -LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=a481fbdb2ac800ecb12405c33bcfacae \
>> -                    file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
>> -
>> -SRC_URI = "git://gitlab.freedesktop.org/mesa/demos.git;protocol=https;branch=main"
>> -SRCREV = "02eae079cb0b8186064d5b194ca4cc2995f099ee"
>> -
>> -PV = "9.0.0+git"
>> -
>> -inherit meson pkgconfig features_check
>> -REQUIRED_DISTRO_FEATURES = "opengl"
>> -
>> -EXTRA_OEMESON = "-Dwith-system-data-files=true"
>> -
>> -PACKAGECONFIG ?= "drm egl gles1 gles2 \
>> -                  ${@bb.utils.filter('DISTRO_FEATURES', 'vulkan x11 wayland', d)}"
>> -
>> -PACKAGECONFIG[drm] = "-Dlibdrm=enabled,-Dlibdrm=disabled,libdrm"
>> -PACKAGECONFIG[egl] = "-Degl=enabled,-Degl=disabled,virtual/egl"
>> -PACKAGECONFIG[gles1] = "-Dgles1=enabled,-Dgles1=disabled,virtual/libgles1"
>> -PACKAGECONFIG[gles2] = "-Dgles2=enabled,-Dgles2=disabled,virtual/libgles2"
>> -PACKAGECONFIG[glut] = "-Dwith-glut=${STAGING_EXECPREFIXDIR},-Dglut=disabled,freeglut"
>> -PACKAGECONFIG[osmesa] = "-Dosmesa=enabled,-Dosmesa=disabled,"
>> -PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader glslang-native"
>> -PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/libgl wayland wayland-native wayland-protocols libxkbcommon libdecor"
>> -PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11 libglu libxkbcommon libxcb"
>> -
>> -do_install:append() {
>> -	# it can be completely empty when all PACKAGECONFIG options are disabled
>> -	rmdir --ignore-fail-on-non-empty ${D}${bindir}
>> -
>> -	if [ -f ${D}${bindir}/clear ]; then
>> -		mv ${D}${bindir}/clear ${D}${bindir}/clear.mesa-demos
>> -	fi
>> -}
>> -- 
>> 2.43.0

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

