Return-Path: <gehariprasath@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC27C61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 06:32:13 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.722.1787898731833980406
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 23:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=Gs3y3zRQ;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=TzWdSpLx;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: gehariprasath@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S65lxO931755;
	Fri, 28 Aug 2026 01:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=KOECSEXv6SrtgVgdTT3Fni2tSRrkHxBLVQQCcZncX
	MU=; b=Gs3y3zRQPAaQVKpr2ZX8DowFUAwJ+NtzF85/bxwIUyGvo2wR3sbg+Caqe
	fS6R5Hust0B1YF1C/n9o5A2KLyi7PdLWg0vxfDtfwQSCbQuQzRCVt/hNROj91dlt
	6qSZx/Cx4qKkwEKaao+Rlim6oFPsB/P0To5OLC3INk4/IXfIRKZr3iph25s1MMSf
	/NFuvajxGALZYYZ5EwzPCwiLFOJMPJm/IE3SvPrB6/Gr1Od8IzHiY4uZXrxwEcIn
	l+VvEhXF9epDX4Ma3jbfyr7AHCnHaEmXyBiUjZPIWmgiJeqdhCooAVVKpsWGhL0d
	ekYcO/e4I1cvorviXjS90P6xhDZSQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011018.outbound.protection.outlook.com [52.101.62.18])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gb24q0y2h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 01:32:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WEJ7cFUWzC1z/VVWK8yjxOJZbfBO8wX49uvSpRI8+CVm6DZ/Xdgn70SEZp7VIuXgLkYc9poTW/GLULAgXrT4Ouo/4sSG3ikZH7Ec/9sig4QmSYmCpm/4a4PIl4cphutUk6ME6oNbczEr1A2lAA8IaEK25JtvfYJM0FIJuba0Ng/bUVIvqX69R7bMFRMUfn5c+JUHJdAio8+u4jVRkle2fLQrssJZf+xYFE5KTt8P7o1paEPc17OqJc0CCH5RqI/JPPCWhuDIC156AEjzdbvSUOBOsX5MhBgYdOLVbiYC1ltMEBZCvB9nmuNCfVfQWNGklnnUTUJ2wseZddJU2BWA+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOECSEXv6SrtgVgdTT3Fni2tSRrkHxBLVQQCcZncXMU=;
 b=qw/ouy5ZjcvzqOIz79zZsqtOv3t7AHyOP+8wLnzjFsFFA7cUF4IHi3EjaM4wrmHgpR/qfi9PASTg8KEJ96LW6uN4aiZhxSbMg380HGefODG57jVjXF8fAhqeIatpxfRcnhyLgBwU0MLApfswxAS+bXNJd/riMWHPkdZIF84eGjFt3rgcdWqtnvpBd4hN0BdjUmhT20U7arqCCpkrqGeQv1fqQxxYl3JjTETVAjcptDjDzDhebAVYojbSumG5ryPVIUW14w2U21/v43gKi3pgghheg7C/OWvIQxlVBteWQpa9ZcFitre3+ZjtPrTPnwXvfyKIAKxQeKfjosQLJRnKTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOECSEXv6SrtgVgdTT3Fni2tSRrkHxBLVQQCcZncXMU=;
 b=TzWdSpLxm8rzwchMkoRvJ4QhO2kZhBH6wbjmZACtP7wOLJ0TQcL3EES8Q3t5MU10uGMxYbt0FVgADufSWHims6SHRbChhD/GvdXvXbiTB7VFxHDHFOENRx4ehwlwDdq0W8Zy4dzODCSh+8qSobPLLXASXEPwHxA71advw4gOctM=
Received: from SJ0PR03CA0209.namprd03.prod.outlook.com (2603:10b6:a03:2ef::34)
 by CH5PR10MB997740.namprd10.prod.outlook.com (2603:10b6:610:2f0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.7; Fri, 28 Aug
 2026 06:32:06 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::75) by SJ0PR03CA0209.outlook.office365.com
 (2603:10b6:a03:2ef::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 06:32:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 06:32:05 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 01:31:44 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 01:31:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 01:31:44 -0500
Received: from [10.249.138.105] ([10.249.138.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67S6VfTU3315320;
	Fri, 28 Aug 2026 01:31:42 -0500
Message-ID: <36cd2b18-3e94-47ec-93a1-76565eaf2c81@ti.com>
Date: Fri, 28 Aug 2026 12:01:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH] linux-libc-headers: add
 DMA_HEAP_IOCTL_EXPORT uapi patch
To: Ryan Eatmon <reatmon@ti.com>, Andrew Davis <afd@ti.com>
CC: <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <u-kumar1@ti.com>
References: <20260827150719.821469-1-gehariprasath@ti.com>
 <6aa57f3e-0274-4c7b-acda-d3937d542c27@ti.com>
 <4e87a573-85e4-4e72-b1fe-81c49bd53517@ti.com>
Content-Language: en-US
From: Hari Prasath G E <gehariprasath@ti.com>
In-Reply-To: <4e87a573-85e4-4e72-b1fe-81c49bd53517@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|CH5PR10MB997740:EE_
X-MS-Office365-Filtering-Correlation-Id: f0c333bc-487e-4f24-87fa-08df04ce143e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|56012099006|10067099003|22082099003|18002099003|4143699003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	tGKfwPE9UfWz3yaLI6rgpX7+z/WggpwTYvegmr4mWVmicgdy2YWur8JlMTFN9a+1ppl1SOF2cKqEolmWSaskTBLiu+iMFw6h9GT4RMbgYuGSSoU7OEAFH0us9xLLSTnuWNN58xZG810EHYm7p6jvdtNgGIYze9f8nFNTb9clU6+Vgrv2JTGGnsjYsG2OmSmx17kGXhbMkmRqGHdJPkJAXFzaN9jc630/tx+WnHPvuwa8WEavfy9QoFiEYGg0Vs5IzNi6D3NpCVnzBG1eBjROo30AqEIFvDsqslbBp4wPD4X7mpXNJuB6YwTn/i5mr9th8yrjReaL+klEUyY2+AQB79Nyq6NzVqU4zvoVb5Bkf1be+defFvUKMmSsZ/hlANB0YKkPuRfuwJ5+WamEhnYWtOwwOwbcRtKruOXwnV4MbBHmmY9kGji4gmINXAWSA+LpMbMDeg7ZVfaPPydtjm+jh2HpemAVARRU9lhOOymO1JH27Bh0gVstr3MPhnN1JlbIofE6/6PnLqlknB+Bx/uGYAlORc0TdvvEB3sjEpQbcQ0q5SyC8F7A+1C1T3uowIeOUbuPn54S3XbCNqVeBFSgrijfG2dDk4w8s2N/9bogDV3WDz0K9HTdj4hFLzbS480visKLjBjtYR3n8/FhJyrAC56pxjz7ICLKPDEjuH7liBOhERe/FBuDIW62CoZbzeRt1FPML/Q2KvKaFo3fUefltA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(56012099006)(10067099003)(22082099003)(18002099003)(4143699003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5HSN6MkDF8yYgwJqpwkPNVZnolHZbnsqWi2Yg9wAWrdLG+UtRq21hcy6VFw8BLvOgPSR8fTx+3GbFb1HblxOf57HB6/cYaFxcvCXQfw6tBcQRUiFRJ2w8GK0bapDbTayKEkFbeOxnxNfL9lDQSwbDnPsQeDcEUTbYAW1ttSOc0ydPyzRYXEQagWjiRmwV8ohmXVwmD9QZ+S4w1Ih2XfZrz6tpleedNLeV6tDdHGjwtyzMiG8htaeC+9TU5kvb2hTZxDgUTFTh19G566jWgZN9FBm4F2mNgSA5/EkqVkcIRVCATvWB3GZBUii+JbVUYM8c/DsFYP5tP1KTDi05k4LWShJKRpHvTKhH1Xo/oYawhWwhM94YU+UU+yoaev9Lxq5fV8Nj8p4+J52neHTj65ujVz3LSJZXQvH0PZLlqbuJ4d9kLkyjjp579nzlyx288LS
X-Exchange-RoutingPolicyChecked: 
	w8gR0go0a0Q0HJz4HcpmvaH5OigtUsO2DBuEASWxmirHzFpjKBx7yc2mgun/FtdZ/YB/2AZAcqbnyKH7qs3D1VrLzzwnekGXmpZZcoBKoVuuFyXHxBPb/RKaWN64HY707iGDqfbPy4PudTTU6LXf9XaRaaadv36T5KyUBGuYECGia+73DSeEqu2Vmq0Li76c+RDBRYWxmbB8t8qEVMOMJSaj81Q9g/qDqrhUyWZRbe09Xh9CEqlunxS/O9nev2NSRD6+qrDShVGDvijSazz7n6waezuZTjYQC4zwrykKleV2tH4cgn2Gh/1rTpQ5ox9CvCFYigIWxEC9sBJsTPVCIg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 06:32:05.8030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c333bc-487e-4f24-87fa-08df04ce143e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR10MB997740
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA1NCBTYWx0ZWRfX1ZxmsFMLVJ61
 E5oYq32Z9n4OF9/vK55rN066/a+PCbwW0cfbMMTW3CEhfZzu3BHSRP8y9t1xEd3gVeQwJGbDajV
 qhech48GxrIBxHfNKpRr5+0xO2D9cQFj1sU+IS5w2TF0wTVQwSJ3fpffXtvGaGX9xyNi0K8da18
 nUMWFXlYoy1yNMsKGaW9L4ChjdOWw0Wh8lm1UH0PlHCCnQbs9ku5NTFUs43aWFzM9aHevmyIZ9s
 ata95RKgZJXncYHwDPmZI9hi1yRGHkXXQPgw0c6q7Br22p4oo1fuXUN8EOJMt5XOrSdy5peRJoe
 RW5frHg2EFpNEcgsCfKxroF1BtwnN4UJ9idvWTVY+Sfey/dzXX5K7+rltg27A/UakenQGSqIJAP
 ZgdgjmVE+1YNWNoZoUmWTwLFgdxWcnb91TAkWWbnJ7juSD26GIQVn+FPp11KSYLs75fj3vt1cmm
 2S1TbTRR1fXxhjya3VA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA1NCBTYWx0ZWRfX+bN/ZhhImnKx
 aHD62b1IwD0yG38kbvvR0Ov7UeD6aQqDJLHESzPHUohSLnOXnL0KE3WUhoi/sXi6ORn0l9iF2yD
 Y5clm/cqaSbaFkS7t49TnlP2ilJdITA=
X-Proofpoint-ORIG-GUID: 2gN9EIS2baus-1hViYGqgW-djzO_w8UE
X-Proofpoint-GUID: 2gN9EIS2baus-1hViYGqgW-djzO_w8UE
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6a912b69 cx=c_pps
 a=QW6cWtaKxEx5aDBFEJsq+w==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=WfHZuIUsAAAA:20
 a=vFMwHQQjAAAA:20 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=hildoXwwRU8Mu28u4XAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280054
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0002e601.pphosted.com id 67S65lxO931755
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Aug 2026 06:32:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17616

Hello Ryan,

On 8/28/2026 2:38 AM, Ryan Eatmon wrote:
>=20
>=20
> On 8/27/2026 11:51 AM, Andrew Davis wrote:
>> On 8/27/26 10:07 AM, Hari Prasath via lists.yoctoproject.org wrote:
>>> Copy the TI vendor kernel dma-heap.h header, which has the
>>> DMA_HEAP_IOCTL_EXPORT ioctl that the default linux-libc-headers
>>> doesn't have.
>>>
>>> Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
>>> ---
>>
>> https://github.com/openembedded/openembedded-core/blob/master/meta/=20
>> recipes-kernel/linux-libc-headers/linux-libc-headers.inc#L7
>>
>=20
> Hari, what happened to doing this like what NXP did?=C2=A0 Install this=
=20
> header into a different subdir in /usr/include?
>=20
> https://github.com/nxp-imx/meta-imx/blob/wrynose-6.18.20-2.0.0/meta-imx=
-=20
> bsp/recipes-kernel/linux/linux-imx-headers_6.18.bb
>=20
> I don't think doing it this way is going to be the right way of doing i=
t.

I did try this approach. The downside I saw was it clone's the entire=20
kernel source repo again which took too long. I also ended up in some=20
do_unpack() failures (the logs which I shared with you) so I gave up on=20
this approach. I have sent a new patch which ends up doing the same i.e.=20
it copies the needed UAPI header into /usr/include/ti/linux, same as=20
what NXP does.

Regards,
Hari

>=20
>=20


