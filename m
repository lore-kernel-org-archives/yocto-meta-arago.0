Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D4CC61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 15:15:07 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10229.1788448504537054404
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 03 Sep 2026 08:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=QHbOg9VU;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=jldKHQAx;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 683D8TGr1008184;
	Thu, 3 Sep 2026 10:15:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ZVYp/WAZKevv+mr/f8ITVqeaGZJaPQwI1S5r0RGPF
	Jg=; b=QHbOg9VUTe5hUOAUh/YK2zBWy4EQO4dVxy/zJCG0vOy8qUJ5ZIlKrx5fj
	U2H8X3I3ZRA2eUUNr9e7TyKX2vakP83g6pPzLs4gPctQE+nTVgfQY/HQzRk/BS0A
	1ViekIxLMQjJkpdFhF0zZjP5CAWO+eDOlyIpaP2ogUBmimykhxjEMU3P4phKB1pe
	mQ/5mMM5ERzlZFK6Jj+ZQFaHAGso7wiaHWaS928SszkDfFUxyssau7uJEFovWw5J
	xn7ulPHrg7eert6VsSiQnJNeKjdEV1WY5eXG8rqejw3oDhwckD0t4Ip+ETBFhvyn
	+//9r4aj/FsF1Bq2d8v3HXCUsHnrw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011001.outbound.protection.outlook.com [40.107.208.1])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gewt8mwup-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 10:15:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrTmqbFfA80MF4E6Nzod7WJ5Z7C5vlklG5Rew2foxYBZvefamyyS+xt3ENHp0Dw+HStypM/2ri/UKZ9gW6EOa4Ektzp2NjA0SEmvYUhS9FGCLt0EfnCNBwIFPm4DTYuMleOfwZ5lVQXoGhn0h/J8z6kdV2SxmL1Asz8UBgrZd4CZSqrdt/O58hilBT+lNVOP8WgPvZvf0iBE3BiNX2LSK5pZvnYlvxvDKW10342uGfpKbxugFcdtCzYSxElUXtI9b5ZFQBlW/RhENdaJRD+SaDe7FTF+Xcu5jMTMOqlkY9NpUvKMqOBkVS9v/ryKE5lLQ1rAm274u5NnurEXQdGRWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVYp/WAZKevv+mr/f8ITVqeaGZJaPQwI1S5r0RGPFJg=;
 b=kQ7hFAEHZfKXJOK86qrx4rXN7nSPSjiypgoXewIQknp37TZyMLERYBzwrTY5j69v1PNT8ahF27lu6OjCBojxvnC9Kgd1FoX0apsM5xqELaKrxE5sTlyfUggI3yHzs5Ph59Flu95ZoOyEFwt6L324ShH0b0OnrdymuQ6sVwbi7nOJnw5H/w3W/CsMLYLheNm2CaMkr4dtj+moOdgZwuJZOdoahb3Gjh3y5KCNny7iGEE4s4WAty/S+bzBOzo/dTOohb83No0KEEpoqdR3Ofup4lfkuogWd1F5o3wGDHo/iH7Jmp+5cFj7SbgKyYjfYRaEa6AkY0g+ZlmcAIGkoFecGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVYp/WAZKevv+mr/f8ITVqeaGZJaPQwI1S5r0RGPFJg=;
 b=jldKHQAxBlWqUi32VWjb+Y5Ey/rQj+a30kGUg0LievwtLFqC4Tzdc6Ya9hpASdyCJTL1oycPJlzkKONoIEDCyYbtT6i4knCGdU3xAbgMwd64vwhYi6S22iX1+98ckIFQzGgatxZBgc8bDVigx4NocG4AmqG+oKtdiFBBC3Nv+Ww=
Received: from CH5P221CA0007.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::15)
 by DS6PR10MB997848.namprd10.prod.outlook.com (2603:10b6:8:464::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.8; Thu, 3 Sep 2026
 15:14:57 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:610:1f2:cafe::21) by CH5P221CA0007.outlook.office365.com
 (2603:10b6:610:1f2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 15:14:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 15:14:56 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 10:14:29 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 10:14:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 3 Sep 2026 10:14:29 -0500
Received: from [10.249.66.148] ([10.249.66.148])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 683FETxh1756865;
	Thu, 3 Sep 2026 10:14:29 -0500
Message-ID: <c12cea0a-a68a-4085-9cf2-6fa0ef967649@ti.com>
Date: Thu, 3 Sep 2026 10:14:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] recipes-core/images: Build ti-core-initramfs alongside
 tisdk images
To: Moteen Shah <m-shah@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <u-kumar1@ti.com>, <s-vadapalli@ti.com>, <a-limaye@ti.com>,
        <gehariprasath@ti.com>, <denys@konsulko.com>
References: <20260902132838.2135551-1-m-shah@ti.com>
 <011794ec-fb47-45e9-bbcf-fd8450892765@ti.com>
 <10794eab-552c-440b-b430-5dd644798df8@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <10794eab-552c-440b-b430-5dd644798df8@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|DS6PR10MB997848:EE_
X-MS-Office365-Filtering-Correlation-Id: dbfbfe69-8515-41cd-f83f-08df09ce1d3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|10067099003|13003099007|22082099003|18002099003|3023799007|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	WlEJyZOZ4NJFA1DLNciXr141csRLiy4A1zliHZ9zvOWrl6wHYsVg7Hv/jXP4Vo6SWPOkSd4dm0mDOYeJ1WoKMw4t507/+TYHJlKBrc58qKSqCWKTErcQKf1oWlxbzxmSD4Iuys7x2v4fDUY1sKNPBm6OSAFvsOOUecEDZJLTk1zWAY2mb3VysW/CvliMMC8Jp/En0XxfMf9HlRStznb0uf6ifm739mwuFdFPNpihmX5Nv8iK4/rQr/NSm8wMCFpJYbVtO/oTKQx+oUAAcJe8WnaPLcSjOZ17NJg7l/hvCJzkqCSuhv1IGnEAupLu3m0GYnHSaS682Ss6eOSu9P85lo5lVxyKhkTHZs5L+8m63T6PNPtN2Tf6W3zs9YAvvtfsPQTDbmkfnr8LFT68b/p/XkBUBgBjDcULkZ3bkxQ54kRUaf26tT2JrbxIudjzfM36Lj+oVXJls9QRWhT9jpmUXYORsFhPvADpYQEWUGrN50hLxL8Vf3Zjjt8WJDOu4f61jKwAPoMpO76e0Eh+VL8GK+W00g6kvNEgl0RCkfY2i0ICh69EPbwBTPZrOWe7ddvtR6NVCp906nH2tg/J/JSKw7mkWWHtQMcioNcYqaAtMJSK1fT7L4YebGo+DTw3GtiW49NkDk9tyxh00KPn5JUuFw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(10067099003)(13003099007)(22082099003)(18002099003)(3023799007)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	YmMbWMFkq7dZSHz6lwTLIn8G7I/N5AhxW/IEWkYbmdxVgF+dohDF1jK4SeHVVU8rOc8xlcMChWt7iUs3IreYnw4NAsy02KS3Xdny+iyp7N6g9Z4Fq3t88LHcb6IeUNUgCnr3XND1ekvp4X77c5tlGe9/tFZkkXunp5XD/rIDGe6pDRs4+BxWeeeD+lO7JNSyes3GFHFn82SNvSLd4Aq63PWtDEQ08r8s4AAsQ3ltaJlUaBejxe7QU3LzWC51hKKg19zoj2/+0VQY/vlXzIzBJnOuV+zEit5T0WWLYneW2c6mYuB6AjYpxZlO3nYt8p17CzALiVKWdCxAQaoDw+fkfCk5urp6vG2h884lZ0gvXBrN5K39/wKNdJVeNgY1ZdyAniDWOssp3zugSflh5YzTspEGZ8+mNR6SbETNdZZX3XXufUydUm+m8ok3ghQHQv0/
X-Exchange-RoutingPolicyChecked: 
	X+k4EROGKeQWtKguffSgkUJ/ThDEbvAzw1DGYoDMJL5S6D0Tfr/6FBUHncs1YXPNHn5lZ9yFLxgQ9n5CHbX81cDht2qSCSl3DwxIPt9tZvYiZAGcxCccrf77CkepI4g8zs7ZMbMCkGUFyDGz8+Fb7KO7er6XVyh+g2wCOEpmcck5u+aZlcR8cXt/iP5vqSYVXGdEDU8s1DmBa6Xi9epOhsUTuoMJLx6wW8mdmpNSgob7xPWQuWiQF/cFJNqkJNWB2X684MueEicWeAQGQSJlk4u8tYMkPhK+YEE7yj3aQDmbkqiyJEFXz/rZuVKoNA6FODdGCLhhCVHYcbFgJQn4dA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 15:14:56.7587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbfbfe69-8515-41cd-f83f-08df09ce1d3f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR10MB997848
X-Authority-Analysis: v=2.4 cv=de+wG3Xe c=1 sm=1 tr=0 ts=6a998ef6 cx=c_pps
 a=+gGuMjfID3j0L7k8h/8w9A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8
 a=sozttTNsAAAA:8 a=oPjWFkbnxtUl7rx1EXcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: FYwZmsUcPf8f5UILwFsv5iZU7Jbr9JQX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzMyBTYWx0ZWRfX75gCZpwAD2Uf
 4vBAlMbiJwKnxVXkAIVKLM2G+k1YQfFKJ/8L3Rb5r0X9Y+r70FUiBjmRphIvvh3b7oovMZjQHwz
 8rdn3vL/od9pbLo7mgyv+BhgGvmeVPw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzMyBTYWx0ZWRfX+M8MkZ5726DL
 PlZlPYUKoY+CbnpEtWloOKh3JBSd/R9VrtczjckvqAbimLeWxfkWHCGomKjDBmoUoe1o3z0b4CB
 2UW2PBmkopzdSPjOOU0m2e7n50AzKXfYrfT168FJTdq6lKlQ77p/SilLFKmwjsHXNLR4Owj3MV1
 7awBF4H4aSH3XviO3OVIm6NGN+bO5NEOjH8xSGDzGkAwzN7Iw03jgozYgfiYWBxeFrKZX5Fi9mC
 FQ/jqBIXaxh5hS1XrqWTthKp5g4zu2g4lBqgwVP++cOP8LZJSPpEFjCEqWx/6fW6XORZW47KqQ3
 u0zbc22+M+SrIcz5M0Ud6Feoob6r7HLERjLW/mTJ0SWCeXA3D+R00fv+Qj8sRJ0xCO2gKtzpWxc
 ZYjPNix4PbbMlTtaLc0u8X9c03FY+OX6kg6QHOtj5ntkrRCuzuL0T5Q4qZUhaLHda+7aH0Gecor
 ROtZqR4uLHPZCIN64Iw==
X-Proofpoint-GUID: FYwZmsUcPf8f5UILwFsv5iZU7Jbr9JQX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030133
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0380145.ppops.net id 683D8TGr1008184
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 03 Sep 2026 15:15:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17654



On 9/3/2026 4:50 AM, Moteen Shah wrote:
> Hey Ryan,
>=20
> On 02/09/26 19:35, Ryan Eatmon wrote:
>>
>>
>> On 9/2/2026 8:28 AM, Moteen Shah wrote:
>>> Neither image sets TI_CORE_INITRAMFS_KERNEL_MODULES or
>>> TI_CORE_INITRAMFS_EXTRA_INSTALL for j722s, so the machine-wide
>>> TI_CORE_INITRAMFS_ENABLED gate in meta-ti-bsp stays off by default fo=
r
>>> this machine. Force ti-core-initramfs to build via an explicit
>>> do_build dependency in arago-image.inc, the common include every
>>> tisdk-*-image recipe require.
>>
>> Why do we need to force an initramfs on every platform/image? What is=20
>> the point?=C2=A0 The point of the initramfs was that *some* boards nee=
d=20
>> some kernel modules to boot so we only require it for those platforms.
>>
>=20
> Is something like this okay?

To be fair, I'm not 100% certain about backporting any of this.  We did=20
the initramfs in response to the newer kernels (ie upstream) building=20
something as modules and not built in.  And we moved to that model in=20
6.18 (master/wrynose).

If there is something in scarthgap for 6.12 that requires this then we=20
should just update our 6.12 kernel to build the correct thing and not=20
need the initramfs.  We haven't tested any of this code under scarthgap=20
and I'm not comfortable just shoving this in.  We need to try and keep=20
scarthgap somewhat stable and not do things like this.

We should be able to have a config fragment that only applies for j722s=20
when building the kernel to configure it exactly how we want for just=20
j722s.  No need to shoehorn in the initramfs for this.


> --- a/meta-arago-distro/recipes-core/images/arago-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
> @@ -30,3 +30,11 @@ BAD_RECOMMENDATIONS +=3D " \
>  =C2=A0BAD_RECOMMENDATIONS +=3D "${@oe.utils.conditional("INIT_MANAGER"=
,=20
> "sysvinit", "", "busybox-syslog", d)}"
>=20
>  =C2=A0inherit core-image remove-net-rules
> +
> +ARAGO_TI_CORE_INITRAMFS_STEP ?=3D ""
> +ARAGO_TI_CORE_INITRAMFS_STEP:j722s =3D "ti-core-initramfs:do_image_com=
plete"
> +
> +do_build[depends] +=3D "${ARAGO_TI_CORE_INITRAMFS_STEP}"
>=20
>=20
> With the above change I need to do some meta-ti fix as well.
>=20
> Regards,
> Moteen
>=20
>=20
>>
>>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>>> ---
>>> This patch has a dependency on the following series:
>>> https://lists.yoctoproject.org/g/meta-ti/message/20235
>>>
>>> =C2=A0 meta-arago-distro/recipes-core/images/arago-image.inc | 4 ++++
>>> =C2=A0 1 file changed, 4 insertions(+)
>>>
>>> diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc=20
>>> b/meta-arago-distro/recipes-core/images/arago-image.inc
>>> index 37b20850..398e299f 100644
>>> --- a/meta-arago-distro/recipes-core/images/arago-image.inc
>>> +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
>>> @@ -30,3 +30,7 @@ BAD_RECOMMENDATIONS +=3D " \
>>> =C2=A0 BAD_RECOMMENDATIONS +=3D "${@oe.utils.conditional("INIT_MANAGE=
R",=20
>>> "sysvinit", "", "busybox-syslog", d)}"
>>> =C2=A0 =C2=A0 inherit core-image remove-net-rules
>>> +
>>> +# Force ti-core-initramfs to build alongside every image based on=20
>>> this common include.
>>> +
>>> +do_build[depends] +=3D "ti-core-initramfs:do_image_complete"
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

