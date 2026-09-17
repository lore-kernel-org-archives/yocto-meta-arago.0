Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443DEC982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 08:46:40 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34935.1789634794105510735
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 17 Sep 2026 01:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=RpoS+m35;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=bCYzNDh7;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H61hEb1003372;
	Thu, 17 Sep 2026 03:46:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=k3YSlesPloEXRb9wrrdrKa87+yIOzkeqrFzazqwQw
	wY=; b=RpoS+m35O2WTzMw0p1oU/1KYg69DJ4moPlsGry/RkQjG9I/8QwC4KrTrz
	PHSHQAaVeENXgzI4p2h/1gneVB/zQ/PChMo7HMuyCE1+NdSpddLWEx/GFVdDa0bs
	EJbfcKkFUAos99PDymlni/yUbR0pN3e0sGC2lKG1L6h0+tzxFPAhbyrymwyhXH8x
	lxVyBpfxWsXP/C7Jy9hD9qtcDU3Vb/C0oO0l1qHoinVUrF3E46e0FBC78pk5nc1v
	o06P0QvVvN9SNn4+X7/hk6vhSQ79R8w4aR/e7e6p3VTIK2HZ3g7WHS/i8aXobRPN
	5qz5AIkLfF/vv0In7jm4UKMf7vw9Q==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012032.outbound.protection.outlook.com [40.93.195.32])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gr4wnjy84-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 03:46:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/ygqTOUTHb/AnXQV5XGc40Lx+XAy8SkK1z6h/2My5zkImYlEfTIWddJ773GCU+oGDKDtiSG6yp4aS3nZU0xxB0K0xc46qoDp9XwyioJdLz/X4XLX1ltu4SuxJ6MUddoESr67ONNAX94t2lfgWLPNEIp6ym4CqhEP8d9eErNOhU8hWcf5VSLsYGHx0//kbLbAhuHF1MvJBD1gGQg0dljaHm8UgnDuNhRZJs6RAMY74Y8q5ovs7syb4i+O29L4CEA4UpJbkewGiOe36LlH7JBNjbtO+r2LJMcpV7DrdSnNLku48rJ4Vsqvs4kqHEG1LLXhPVlQ+dnlyhQCLwin001oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3YSlesPloEXRb9wrrdrKa87+yIOzkeqrFzazqwQwwY=;
 b=tI+kDgblq12qtM6dA0TKNxChAji0d1JjreybsXKnWLiBQnTeaUSZhS2K2EZCGiOdZBh2h4xWSEqQINe1jEaL+BItBPacJeV2sHA4ijsRs488YOI8WXmSdVAysOnkIwURDwWxPPsrLaMy1Lsp0myOdE6X+frrARfFilc2N6Dw7T6T0bGO392QyLtBqP0d2R9Nj1b1KsO1Nn0N6TlfF/FoANY83e9Zgivk49xP2ZCSRW4I4IDlB1HnmUITD+KGzumTVnzxO8Lv2/5wCBxg+uflpNMSbJ3R5PFG2lbIHNKgT8xgAwzUsBJaEbWgVvw585CB5F+rWS6iJxiUaSju2jRBLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3YSlesPloEXRb9wrrdrKa87+yIOzkeqrFzazqwQwwY=;
 b=bCYzNDh7rPbxzCbDDVVJHrlnV3ZmiXjrmlQFK1DaD6sxBBDzhcGnQFI0nGU+4NzInYbw/bMUl4UVmX62QilK5d5iTderkgNEOuhBWh8SAfI51ku0iy6ZtYWuH+LInDHaDrCkHogrSvZ59JAfw3/2DWR8vm6+XXkRBvxUZDNHcI0=
Received: from BN9PR03CA0346.namprd03.prod.outlook.com (2603:10b6:408:f6::21)
 by IA3PR10MB8441.namprd10.prod.outlook.com (2603:10b6:208:581::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Thu, 17 Sep
 2026 08:46:28 +0000
Received: from BN1PEPF0001854B.namprd05.prod.outlook.com
 (2603:10b6:408:f6:cafe::14) by BN9PR03CA0346.outlook.office365.com
 (2603:10b6:408:f6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu,
 17 Sep 2026 08:46:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF0001854B.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 08:46:27 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 17 Sep
 2026 03:46:16 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 17 Sep
 2026 03:46:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 17 Sep 2026 03:46:16 -0500
Received: from [10.24.52.241] (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68H8kBQU2681318;
	Thu, 17 Sep 2026 03:46:12 -0500
Message-ID: <e596036e-c1c9-42fc-a226-c0bafc93f697@ti.com>
Date: Thu, 17 Sep 2026 14:16:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/wrynose][PATCH v2 4/4] arago-default-image: Add PipeWire
 audio stack
To: Andrew Davis <afd@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <praneeth@ti.com>, <reatmon@ti.com>, <v-singh1@ti.com>,
        <c-shilwant@ti.com>, <j-sahu@ti.com>, <p-gupta5@ti.com>,
        <r-soni@ti.com>, <s-kapoor@ti.com>, <s-sinha@ti.com>, <sen@ti.com>,
        <y-hegde@ti.com>, <devarsht@ti.com>
References: <20260916160547.1287287-1-p-bhagat@ti.com>
 <20260916160547.1287287-5-p-bhagat@ti.com>
 <6c900487-4a36-4a46-a3f2-4cb57ce4418c@ti.com>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <6c900487-4a36-4a46-a3f2-4cb57ce4418c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0001854B:EE_|IA3PR10MB8441:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd8fb6e-4e33-45a8-f763-08df149829e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|56012099006|6133799003|22082099003|18002099003|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	tbkhn4c3PMtLYCoLNSZ6ScmFIG05zbXlQOritfeQl4cCmeaHRZqsbVwSF2Cz6GLhlbyMCHW+oON0psZRKcHKbRD3mzeWjx6JolB05Q+rWFW/A5X0mA8/U4z3bh9ZLF/nPnVFzRc+ZrRSpVW9WU2enjHw7s5VYDjgyXITkDmrYlFHQh5KPCGT6V5o87mAsV9slgr80rN0ObRHT2KkCiOgPCDfmTC4ybEzDGvj/hOBCEX0bpSgPBHWr7k+/NRQLsMbEKWOCqpPoGjrpIqYQQDsUQPjGF+gI5F+TJ7LAMvOij/jpuEK/rVVoMoc/EUCwQsIbOcjec0apYnodTV6+dOuLxZvET34j/VBztcrkS+889CztXKId35BcTCl9uPy3EppQiLQMo8ZOblZBFG1GNz9x4oxnt5aMF/AJYO3WFaTQ/8WY40YVGoWDiGbilXK5mxHSo9g2NhmbZvLZThiGkr72yWnkMARRm8kK8YNYNLfihp9kvvbPn9YGbThCjj56Lyr8s6Obk8eBhxJ4SaoYL/hZAyLrk6Sz/LCwtVtlTCWrbQAFjYpJAmktV/oqKnK0GlAudQSAbSX5yMbu7Dh8ClvbizShUDTGHRI58lpMPaIu2Oarpx0pKu3frijOaNvcwIQ77wB6X+eO4gzENX671VzrKWC17bqsfYoHYPwMDtzs6D9A1FDgzxBa4n8GVFGqN1sWWBtzgUcZSwC04PBahKzZQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(56012099006)(6133799003)(22082099003)(18002099003)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RW1Xwm4ChnzGmNMtKjr8NhZXSV9s/aIwaX/CUcmJ8QZEol8ov4h4q3RNVEjKl2W1JTGYCTzR0n1lmSvNc0kDKILhBPDP8ewn4JaV/+GDwTE4kvY07OKPflhgz3sRZVfb7mvmam9syzXbXvt0Wqf6y2wTBswhTeoUbcaBtWmw7kDZ5kwzjbxkXDIUQycXqNnf/jp7wYVGcIEKcJgDtzDQr4RkmUANOGRJhsB9WXzN35dtFXzOM+CuUrF6wFiXfliT+ff2wNGiluGCcyyqvV1eeETMAOon6wQFGaacxSh/S2vKY+KiZ2SqLb6ZrkD6Jy3nOMZLz7NWohHM843L4vYZTm7yqlX5yotHA64CavQcjZyt0uAE5UDVJ+Jh+agFAfdfAqvukaSUhl+ogfqj8KfuYN2DqFcEwjQo+fERJqcv+uJmBebXAp3ge3OyvMMmnINf
X-Exchange-RoutingPolicyChecked: 
	KS4ZKtA26r1/mqnu0t+ujLnV9c8zqLWWWRQDqWL6CZAAkTQTJLH3BTQ5YCPeOAiazQ7w1BYGLe4kxw0w6UCl3OD4mXJSKyXkm4KRiA7JXqq1IicBLR0eoVoXl+fjL6QewSBPWGkHasGhESVe3Tr/P5c6c1HCwyFvww2ykKD+HEUcBmUpxe1pfSRZutYwd8pJs8Y3BLXZnzEK8YO60LgO0UOOpVwmfE5AFiOBVcb9srRlZyuCykHp1oikb+ebk+n7VTj7W1g6HWnCHAtAflpF5YjdYgysK4Vdi8MT8co/8D5al++wNT0536NAPQu8j60eUPC6DaRig0rHmZ4cia9VsA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 08:46:27.9526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd8fb6e-4e33-45a8-f763-08df149829e9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0001854B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8441
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDExOSBTYWx0ZWRfX80k8LhtMM8c3
 3jCyihbWps6hUa5GF3ZW2nH1pdUDzlGxqZO6OpeX5ppdKLEN7jWin2Td8n1VaNatryeqJEuPBsW
 H7OC1IaEgOdnHYXGlzsBZrN+PD1HJ5k=
X-Proofpoint-GUID: 7NoQmidHsavX4nOTe21qMFxatsfKYHCH
X-Authority-Analysis: v=2.4 cv=OPOyTiaB c=1 sm=1 tr=0 ts=6aaba8e6 cx=c_pps
 a=SD1VBa2HPYRYF6UykHdizg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=40nRhcq-KmKUuZ25fkEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 7NoQmidHsavX4nOTe21qMFxatsfKYHCH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDExOSBTYWx0ZWRfXxS5R4UgdrvhL
 HRu/ToW+x0hJjrx/lqAvvxtkN95iWvh4ybtI0m/fyRRtwznIXS3iFYU31EK5vu5DWsDP+NhDt+y
 Nin2T4PzOq55YUdheTlAkG0zfFTcfZPhjluIM7/NSpFg1XYVyuLhLf6BKEolt71OZp58hdYVBB6
 CkylLSBpUtRon7ZrzCsOpbWT/VsFAXFdhRRRnu1qMZgICHekJZjis4EnCPR+7OoYuMqbGwSNWBZ
 IeIKWdJ+92qfd6CnU9DLuvbVTnHjUY3Se96T/XnDNND8N6KW2UiZ9OsGgDsQ33yJDbLifxXP5O5
 WTlXSb51z4ZoTqr+hAuNW6Aj7c3f4BJ12yd/8OXwaTtxDgqlKKHYHQtm1b/yzJm6jhoU41lGX2p
 WTI/txAuPPeVrqq462rGaubqx9hawH3B1tqAkf/Bpjc0IeNOFdbd0mWaOKu1sW+jB4Eg5YMkaKM
 PSybn+LgjQmNodODCDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170119
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0002e601.pphosted.com id 68H61hEb1003372
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 17 Sep 2026 08:46:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17681

Hi Andrew,


On 16/09/26 21:59, Andrew Davis wrote:
> On 9/16/26 11:05 AM, Paresh Bhagat wrote:
>> Include PipeWire and WirePlumber as the default audio stack across all
>> platforms. This brings in the core PipeWire daemon, ALSA integration,
>> PulseAudio compatibility layer via pipewire-pulse, GStreamer plugin, S=
PA
>> plugins, and the WirePlumber session manager.
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>> =C2=A0 .../recipes-core/images/arago-default-image.bb | 18 +++++++++++=
+++++++
>
> You removed pulseaudio from the connectivity packagegroup, but only add
> back pipewire to the default-image, this means thinlinux-image and such
> now have neither. Either add PipeWire to the connectivity packagegroup
> or maybe the multimedia packagegroup so other images can include this.
>
> Andrew


Thanks. I will add it to connectivity package group similar to pulseaudio.


>
>
>> =C2=A0 1 file changed, 18 insertions(+)
>>
>> diff --git=20
>> a/meta-arago-distro/recipes-core/images/arago-default-image.bb=20
>> b/meta-arago-distro/recipes-core/images/arago-default-image.bb
>> index e01f7c2f..0b0c3d61 100644
>> --- a/meta-arago-distro/recipes-core/images/arago-default-image.bb
>> +++ b/meta-arago-distro/recipes-core/images/arago-default-image.bb
>> @@ -43,3 +43,21 @@ IMAGE_INSTALL +=3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${DEVTOOLS} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 docker \
>> =C2=A0 "
>> +
>> +PIPEWIRE =3D " \
>> +=C2=A0=C2=A0=C2=A0 gstreamer1.0-pipewire \
>> +=C2=A0=C2=A0=C2=A0 libpipewire \
>> +=C2=A0=C2=A0=C2=A0 pipewire \
>> +=C2=A0=C2=A0=C2=A0 pipewire-alsa \
>> +=C2=A0=C2=A0=C2=A0 pipewire-alsa-card-profile \
>> +=C2=A0=C2=A0=C2=A0 pipewire-dev \
>> +=C2=A0=C2=A0=C2=A0 pipewire-modules-meta \
>> +=C2=A0=C2=A0=C2=A0 pipewire-pulse \
>> +=C2=A0=C2=A0=C2=A0 pipewire-spa-plugins-meta \
>> +=C2=A0=C2=A0=C2=A0 pipewire-spa-tools \
>> +=C2=A0=C2=A0=C2=A0 pipewire-tools \
>> +=C2=A0=C2=A0=C2=A0 wireplumber \
>> +=C2=A0=C2=A0=C2=A0 wireplumber-dev \
>> +"
>> +
>> +IMAGE_INSTALL:append =3D " ${PIPEWIRE}"
>

