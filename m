Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D34C982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 09:33:46 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45355.1789983222495405416
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Sep 2026 02:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=eoU5zSmj;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=tHkXWtfw;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7AvDe3481699
	for <meta-arago@lists.yoctoproject.org>; Mon, 21 Sep 2026 04:33:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=fxGMTLqjx/+Xu5q9QBka1g8/frWCrq8SYP7QzniIk
	8w=; b=eoU5zSmjb2t5eGDxut5w3x22LbZclU2xpEFZN+ascp90wEsDl6GDX+T2C
	p3iKcCFW8WBAavkdFoRjFpVH+8PTLl2k0LxE1w5hd6gxruDe3pCQXMFKCIioq9av
	Hp2WbroM9R1ojRw8BQrZ3cd8F6Dr+5yj56INrpA/LbK/YpxeKo92gGZDo2XkvC5s
	iRSLMdw0qsbFnMpkC3QweEOg4/UL19+Aym48LnYOXBq3qkLv4TN8GzqebF9nfScD
	jpblfra6M7ybB9dIn5+3q65wq/Z7kcPVA9AhVkCZlpaqrXbVGdsZMfkSVqmm3wqy
	ZAIdMynUbBpSeihs7waWKzZY51zCg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011062.outbound.protection.outlook.com [40.93.194.62])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gt9s5p3t0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Mon, 21 Sep 2026 04:33:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=razKH03Zst3TPsw8sk8Q1KQ8wFAuogsJTTYdT+/Ya8Kkxlpo/dFAkW3PEP01PmqTFNYq1BBjiI+JOJsSRmxmolD1s93h1cl0b7ctJUIbq64U9C6ec46ojAXiZS7OidwN0/PsHMaJuQvWMxAioqkEhzfN1dzXJAciL7b88+pzmUjYNYC3+qil9sZ8vd0/wNloLKVUGpDDOp23USUrrQNr4HZm64LrsKYm+3hg5lM2RLvcmqEhPFtJkAxCxDjluGv7psxcf/y1/mhNnpQLBU3B3Xr4hHyXUxvctmlgA7jDJyyttre2LO8Gvu+rKuGgmUlq93w7X3EUs3wBVW0ME2ZkLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxGMTLqjx/+Xu5q9QBka1g8/frWCrq8SYP7QzniIk8w=;
 b=XHIkO52G4DkQooLOr09/mIIiMknxWWNEa/epN0+BtdM/sqaDoxs6VOqLQ4ITuLz3MuPL5MssWuT200dfsMfaRxxTidL3/Cdodh5sWD3ZTiLIhB3e7KmR81XQgZPe6dmqUmACbxXKkOoC4NTn4PJcll+cc/sVvUE3iPS3fqUb50CSfd33Frz94cAMvpRhlRPC5Nu9DWFW62zk3jo7rVlvg5Vcj8+bITiYNDtNiPQ7JboehQz31gsgEftirLEnOLRY61149dW3EcZ1VvKZa83d3fDd4phiDSEtRH08VOLh6WtHI4+a81K6LFO5YKypq7wzgU2W7DdaN3+k7As38HjBcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxGMTLqjx/+Xu5q9QBka1g8/frWCrq8SYP7QzniIk8w=;
 b=tHkXWtfwfqWiJuasAb2Y2VaoSrs3nJCiGM8ohFS8KCtq1qP8HReWqs/MaLatUpJIuoKg9N0R8ES3vD6FYOykdx5t9BccAnFjXtqX7gYZF74HvixQgyasdHxcdFiutSFaw2YMcyW6uUmqDGRt0vRqoU4n9OA7QWYjIBBMFue6zNk=
Received: from SJ0PR05CA0109.namprd05.prod.outlook.com (2603:10b6:a03:334::24)
 by DS4PR10MB603080.namprd10.prod.outlook.com (2603:10b6:8:53d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Mon, 21 Sep
 2026 09:33:37 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::9f) by SJ0PR05CA0109.outlook.office365.com
 (2603:10b6:a03:334::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8 via Frontend Transport; Mon, 21
 Sep 2026 09:33:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 09:33:36 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 04:33:19 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 04:33:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 21 Sep 2026 04:33:18 -0500
Received: from [10.24.52.241] (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68L9XHMR1781818;
	Mon, 21 Sep 2026 04:33:17 -0500
Message-ID: <887d540f-497d-4fbd-826c-e33136168a52@ti.com>
Date: Mon, 21 Sep 2026 15:03:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master/wrynose][PATCH v2 2/4] recipes-multimedia:
 Add PipeWire bbappend, service and config files
To: <reatmon@ti.com>, <j-sahu@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20260916160547.1287287-1-p-bhagat@ti.com>
 <20260916160547.1287287-3-p-bhagat@ti.com>
 <681846.1789647419422393550@lists.yoctoproject.org>
 <ad52a32b-c804-4ff4-9b9d-191320876310@ti.com>
 <18D7457506CC2ED2.2119511@lists.yoctoproject.org>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <18D7457506CC2ED2.2119511@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|DS4PR10MB603080:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb212cb-52aa-44de-f343-08df17c3693c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|23010399003|4022899009|56012099006|4143699003|10063799003|10067099003|13003099007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	WOrILSRiIo7XOmJiPdKrX/bgkO3SPEeZO59WmIvTl/xn9VXIx3e9anYwI5M6qE9o0w/dH9c/XOHheL83/xdFyEUFdiSibotpCDifTA5lERhs4x9iXNHHV0DpEAJSULIYS5glz9tSdEn3F6rT+lIiF0he1X+ODCbiYziVVCglFHaPQqouXO2dc4UEKiJNh0v5/2GH85rtYoD0LpGApdsEBj88nJRlUl5pTdmtvIoe8nnLXcbit+mCdYEHxKgxIe9AfLvZBKleGb1RB75xm4fqOVSZvTMgLG6msC5ok1e1fkMoXNFdmjz1m0c05qT0gdBJ4E8HqsirRhj/Pww6Ld5v56/VwJdK/ys2EryeTLi0IkWSQa+KQ14cvTQBBQ8PIMPMDrNwEbucYXwfBclODnxzDZ2G5dFyBJnD1WaRTc1gJowRzczpWUeoa3sc2UGg3i+lT5seY+AVtDclZBwvEdfHpXtnznjdXfyVJzYlRcyQxVkguGvZTCK+Q1odaD/hApQaOZbJ1+fkpxgU4zUMoyIKlHSBkWnobvCJQntBSGAtNKAF1st8wkYRbkPgJRZk31oUs3NpM0QgIoxcfQktOb/sgF3/kvNeOW34gi+iE8unySD6IfD3dIuUL/xdx4jaJi6Pa6oSacrgGDpxV/vWRBR2DQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(4022899009)(56012099006)(4143699003)(10063799003)(10067099003)(13003099007)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	o8B4hiNCZOtZbsLnumRuKKoOFY3Aglt9qaijiXbTv6RxKs8mBDajrwWaIQDqRX0znFkqU/vN018ph5a4d+dTODTfEDIGeyOgTssZPsNBvglIQWyT+5mesZQlnQyVvQ8YZ4wIyVRu1tird5dYWFtdguIsNtezA0p01djHDoU2rks5RyCvno9+BQX7YOL5WuPnPwxE+FoE9MF9dXn5E1OtJaEY9VV33+V7F4qym4qQmhcjWOD3K6a7EKYpfzYwSlgHViYfc2QOIfvxXY671uUFj9KNwI9eMnxLSu95zP3GFX3Lmj4sJe5Ow7MKHoOwFzG/uk9SEo8R9QZArhGehllivOZzHyrb3fxhQOuInPO5cc3XSbWN76l/p8IuYAhFXto2TllB/maS0P3hiqtyXUcMkvz4OjlbL4dmlRGAhP6I7SeaB9SQtMzKYhc0ENM+Eds5
X-Exchange-RoutingPolicyChecked: 
	tdzwyAsL1DZyQpug7Ryl2wWjTmHoYWxRAtNrNjAxipt0AeJXFLer0dfzbtdosLKpweWLtg/Lgy5LiHByW0iHjD3Q3m//D0hBUJn3uNzzBpQYZZ/wL6+t+dePcv7iSZ5JXKAP3dnK3V+EGJsm7Gg85p7dNJRSvzIZAkbHDOv4NNAuoNtS3NHZetrXZW+8XKMyam9BR7Hgp0Putseg9v3W1lzQGHNnBrZjO84xRmQlr3v+4T3T+iLuda5QbDHLp8kaQaupBs3KSR5dwzSwWPPh2VorS4lGlqHC6auOxiHgLVZodhNcneceMOYIPYbLtqz1MvwQurLmMAUanUQuvuC6wQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 09:33:36.0160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb212cb-52aa-44de-f343-08df17c3693c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR10MB603080
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzNyBTYWx0ZWRfX391iysWV/BCm
 PaVrkZAOCwSZt0Nphk7iVxRQlqmHnYfYp+L5ivBJV/8XOKb4YnTkQPYT5ybOUg7UMF+J/x7V7Fq
 awQOFAjg6OVT27amiZMAvBESD9tswD0FtUC4WsEjjbXhcZgBELLp7O+Qy8wJvSugG2uv1pT9p+6
 jvJYZ0UZpeo6JHD+kQ24uBbVsPPz6mXYcVx06P3V0m5GzpB6RJSr6+nOMEnM/t1MSk55XbBhbur
 eGnVPUNvRm+1goUMVNE8z0SLuGEN9pdEtcgoJ5WacT9b4DltNDcyurhd301XYxd8XuC/PSMIeaR
 B5W/AmoBuX5n15D3sL6W8ktQO04BxnOakI+EtMn6/kf2asSvdAAg9cc8Tkx+0JBA8wsexdbWoKo
 NJALXvBTiTxQzhJ38T6g5sn5Gjbpuh0Q0qzBoQwnrIO+NMXWh+wns1GQ7QyHoTDHEefVOAt/wrA
 Nf06QBrFTyFwYKyCVqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzNyBTYWx0ZWRfX9TeIlJhuYPnJ
 oGCJOyWRs4k/Ly83lUhO/kIJ8TgiIZVC+MILN+km7ewcqeNMhYEtINfmu/a3omP9TXfnYoPn3fN
 GWDBt4bC2qY6ud69Xxhu7dgsW/n3Pq4=
X-Proofpoint-GUID: aEsxHeKCe7jTVsMrDl12LMKRNOvr5Xs1
X-Proofpoint-ORIG-GUID: aEsxHeKCe7jTVsMrDl12LMKRNOvr5Xs1
X-Authority-Analysis: v=2.4 cv=X6rHu2Te c=1 sm=1 tr=0 ts=6ab0f9f5 cx=c_pps
 a=MAgfROEylrrND5Jw8NuT2A==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8
 a=sozttTNsAAAA:8 a=n0wI6RDkLuhc0gXDHFYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210137
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0002e601.pphosted.com id 68L7AvDe3481699
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 21 Sep 2026 09:33:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17687


On 21/09/26 12:57, Paresh Bhagat via lists.yoctoproject.org wrote:
> Hi Ryan and Jeevan,
>
>
> On 18/09/26 21:40, Ryan Eatmon via lists.yoctoproject.org wrote:
>>
>>
>> On 9/17/2026 7:16 AM, Jeevan via lists.yoctoproject.org wrote:
>>> On Wed, Sep 16, 2026 at 09:37 PM, Paresh Bhagat wrote:
>>>
>>>>
>>>> Extend the PipeWire recipe to add platform-specific ALSA configurati=
on
>>>> and service file. Service file added to start PipeWire as a system
>>>> service with proper socket dependency.
>>>>
>>>> Add sink and source configuration for 8-channel audio playback and
>>>> capture on the AM62D2EVM as the default configuration is 2-channel.
>>>>
>>>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>>>> ---
>>>> =C2=A0 .../pipewire/pipewire-arago.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 28=20
>>>> +++++++++++++++++++
>>>> =C2=A0 .../am62dxx-evm/90-pipewire-sink.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 17 +++++++++++
>>>> =C2=A0 .../am62dxx-evm/91-pipewire-source.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 17 +++++++++++
>>>> =C2=A0 .../pipewire/pipewire/pipewire.service=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 26 +++++++++++++++++
>>>> =C2=A0 .../pipewire/pipewire_%.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +++
>>>> =C2=A0 5 files changed, 92 insertions(+)
>>>> =C2=A0 create mode 100644
>>>> meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
>>>> =C2=A0 create mode 100644
>>>> meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/9=
0-pipewire-sink.conf=20
>>>>
>>>> =C2=A0 create mode 100644
>>>> meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/9=
1-pipewire-source.conf=20
>>>>
>>>> =C2=A0 create mode 100644
>>>> meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.serv=
ice=20
>>>>
>>>> =C2=A0 create mode 100644
>>>> meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
>>>>
>>>> diff --git=20
>>>> a/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
>>>> b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
>>>> new file mode 100644
>>>> index 00000000..6545c364
>>>> --- /dev/null
>>>> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.i=
nc
>>>> @@ -0,0 +1,28 @@
>>>> +PR:append =3D ".arago1"
>>>> +
>>>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/pipewire:"
>>>> +SRC_URI:append =3D " file://pipewire.service"
>>>> +
>>>> +# AM62D-specific config files
>>>> +SRC_URI:append:am62dxx-evm =3D " \
>>>> +=C2=A0=C2=A0=C2=A0 file://90-pipewire-sink.conf \
>>>> +=C2=A0=C2=A0=C2=A0 file://91-pipewire-source.conf \
>>>> +"
>>>
>>> Is it okay to have AM62D-specific PipeWire and WirePlumber=20
>>> configuration files, scripts, and services
>>> in meta-arago or set somewhere else? Ryan/Denys any thoughts?
>>> My recommendation would be to have a more generic/runtime-detectable=20
>>> configs that is device agnostic.
>>
>> That's why I keep asking why we have something specific for am62d in=20
>> here.=C2=A0 If there are other ways of doing it to make it more generi=
c=20
>> then I am all for it.
>>
>> Generally speaking, if this is required then it is ok.=C2=A0 The other=
 way=20
>> of doing this would be to have the distro add in pipewire support and=20
>> then move this specific change over to meta-ti-extras as a bbappend=20
>> so that the platform specific tweaks are in the BSP repo.=C2=A0 That w=
ay=20
>> if someone wanted to use poky with pipewire then we would add in the=20
>> needed tweaks.
>>
>> Denys?=C2=A0 Thoughts?
>
>
> Agreed. I could not find any variables, macros in pipewire doc which=20
> could help generalize the pipewire configuration for all devices. Only=20
> ways i see now see is to generate a config during build by either=20
> specifying values in recipe or use a service/script and inherit=20
> whatever alsa reports. But what if it needs modification (example=20
> AM62D). Furthermore other devices do not need it as they work with=20
> default configs (only support mono/stereo).
>
>
>
> Since these are no doubt AM62d specific changes, I can move them to=20
> meta-tisdk for now and keep only the pipewire package support in=20
> meta-arago. Let me know if your thoughts.


meta-ti as Ryan mentioned not meta-tisdk.


>
>
>>
>>
>>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17686):=20
> https://lists.yoctoproject.org/g/meta-arago/message/17686
> Mute This Topic: https://lists.yoctoproject.org/mt/121281282/7067447
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub=20
> [p-bhagat@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

