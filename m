Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46604CCF2DE
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 13:53:15 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35186.1792417990943690348
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 Oct 2026 06:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=YUaKsVhc;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=kXOuK+gN;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69JDQYdC3814399;
	Mon, 19 Oct 2026 08:53:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=plgCQWJ8Y0sGSV/wI9X+ogjlZBT9Uo7XSjO20QXq0
	XA=; b=YUaKsVhcCW7Irs5QZ534kCMOWxQvVH9jVBURx8hoGroXGHrmu/4T/fBd3
	eCvEpMJ106JH4mG9jxSsPZspSKTiuGSwVqwWF92M/pSLCkGXDNGXZ7MU0f903A2C
	DcesdnTVhHEVzAGG/fiDSZRTHT4xjW/iW+NAdtj57usqMulwSSJl0QgQmGfbRhCJ
	7FvhF7It5ewxOnYXg3hMRAo6HMfwCSaoex5KQqmwTupDLhy4UBgutTnc7L1SoxsY
	Q7TSClJRvCzH4Horir3lnEcMZ9C5RxiURS/WJfCYsEsUPEbRFwUNZ1f2pFESiVPn
	nu12Vf3xo76HmWKIO14g7BQ1Nwm7g==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010048.outbound.protection.outlook.com [52.101.85.48])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hct1jp9jq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 08:53:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EssbY6DJPgtYTEexwEF0EC+HlhIbBfDJeP9Q00AS2HF3CDMmVLMKN1qnBHJnAWjQ2tXVRi5SZPJvOTAIUbCFXTv8jYJ64itAYh656hYFNg+aTi+OO+FEqL8Zpaz/Nev1gR6lcIUk5ddhypvZHfssi8QxRIT+j1MDgDWIWsKRor6TGqQXbHIUd0C3A9DHh3U+Ua34VGNtbEz4eQjhTt/3NKsMf/ErQ2vHE+gDZP+Xp5yvf8ztIvZ0eMvy59H69uaiuXBjNwSqgUoobsOEPCoRnB2nQZXET06Ty4WE3Hcm371/Xr5HG8/1S2Q7+uFVxeGyV1ZGk4MG65lXwNt9vu4Rog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plgCQWJ8Y0sGSV/wI9X+ogjlZBT9Uo7XSjO20QXq0XA=;
 b=WB4ig7n7wpAdY21qbNmWNRrzr85+rfPjNIW7unYDic+X/xHvfqlBE3cN+6hq3eKLIxkDIh5Q5IJal4/6jWqJC9RwYn3W2/nuPFBGB/knFJtr8yZMoL36q18mIAj+HM6ocCLquHjTak0yRyTXd9L76E8dJ0wjcxdzh9oYBl1foReCIQ89fJC5+q6PyUBUQtVhAF57Wjxtw+Qd4Rnwp3XejmBy0lauFC/dmvLeN6WbZGCPP5XLunb6wlcYik0vVI5NFKu3TPvmQsEtBaQWHBgWo/FnhxpCBXXS1YiflqIQeXF4Zx0I9G0ZDhuez/MLY4A7gF4s9Q5IkAYQC7nu/s9PnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plgCQWJ8Y0sGSV/wI9X+ogjlZBT9Uo7XSjO20QXq0XA=;
 b=kXOuK+gNU0OiObFSdHDNOUJa09T+aOeNefvq3uD9BjFZcKh5cWCki9z/V5JL4pev/gUSYFekYT1qh0wvBgoEFF3jieNF5xIAu02up/1b7/A+DS1/nOQoL+J7qg5l43/TcAHSoCL2dzpg8KhJDRtABBMi1wfqn9VwQ3ZIzK2jg+c=
Received: from CH2PR17CA0014.namprd17.prod.outlook.com (2603:10b6:610:53::24)
 by DM3PPFEACE3F2B7.namprd10.prod.outlook.com (2603:10b6:f:fc00::c54) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 19 Oct
 2026 13:53:02 +0000
Received: from IA0PEPF0000003E.namprd03.prod.outlook.com
 (2603:10b6:610:53:cafe::51) by CH2PR17CA0014.outlook.office365.com
 (2603:10b6:610:53::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 13:53:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 IA0PEPF0000003E.mail.protection.outlook.com (10.167.249.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 13:53:01 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 08:52:45 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 08:52:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 19 Oct 2026 08:52:45 -0500
Received: from [10.24.52.241] (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69JDqhiN2912128;
	Mon, 19 Oct 2026 08:52:43 -0500
Message-ID: <c3c014fd-fc5d-4815-a123-fde0cfa1db5e@ti.com>
Date: Mon, 19 Oct 2026 19:22:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master/wrynose][PATCH] pipewire: Set default audio
 targets and use S16LE format
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <praneeth@ti.com>, <v-singh1@ti.com>,
        <j-sahu@ti.com>, <y-hegde@ti.com>
References: <18DFF2897A379957.3823096@lists.yoctoproject.org>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <18DFF2897A379957.3823096@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF0000003E:EE_|DM3PPFEACE3F2B7:EE_
X-MS-Office365-Filtering-Correlation-Id: 1393e6fc-982c-40d3-fccd-08df2de84a67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|23010399003|22082099003|18002099003|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	WnsWBpGsiXJgEM/vMbbRRvr3opg6VtKxzk0afcNrXFygtfN/ztJcFGcaVndubqYrM3gBA6/3QwY/C+crogcaxY90w2uSWYWbwKDTGrDWYRF1mz4WYQVPGHV5f+FVYJRN1QXmfQjJ2Qc13sQU197yb72f8eTEZj4419daYmz4kygADpqfhA30kSMvIUBueQ2WNgRSk4FXhyWi8+u5Le8H6AD+SMcNfjcmnBNj7/CpREkwgfH7FfduQNPRiuMQS0QSYXRpbcycgzQn44gKVv4U1O8Vdxb4li4gR1ANBSfCIHk0pkYrwYW2ZbYXqPZzKD45XEd5NcbzDemB9Sto0vnm0J4XPKJtxeJ9DXsXP4z9HGX0HnvGOreaD827SNEahPTVhYpFF0fRhBBNJhhA9qlrx3El2Gl9qyY0G5AVmmhJS03XsLZmV1X/BqeI9S4L0yX1Vm3gFLf5rY8u33YoeJ+Pg5fORHCUPc4qY+SOSQrRm9QPAkY7vvFrgCrwHxh9x0JA8A54UVl4meCtt9nu1/cRpIgT1F68x80ygWOxKjBSkKZCq53mIWGkOU0BWFrRQjVMCbiwlof2b7AYZ6xA0snHcl85IIH8gyip+elZP3gMLWjvavzjPAjws6em1jzOmLQ9hud+tYg1JmjMnDUokY7+9ZmWL/C45nrurpSJsIGJwKrWICkSZs8Emc8sojKHkAGEcGY4HufrFwK0+tuUI24Z4w==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(23010399003)(22082099003)(18002099003)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bPq57Mf9milVTOGWr2fhQ0p8+LMun/LA3fK+gRpYy1Au/vI0AgPAoJem4GAc717LMRd3rLWdrNa2Atwy3xmtQa9pGY50jbX1Wo6dl5lkoIVko23tGYbkn9XYJX33g0AeB31Wx9yKVtrMzOFBVO0gXfBd+dtoiD+PL88XTQsO1N73A2BdjP7YBcrCJ0kFNwwjsmi/iP+HlSByR7joSNxSFKaiR6PF2vAY0jZNim7GbpVXKKiDTbrov4k84DKjUX5qYK58J48F5ZUFaULZdGWRzSRdYzmXCB2XQTBRN1t1/llFZ63Fv+Ezpq2hxjZKRbH1TKwWzeZ7Ue/V5O4XPsDk1I/FnBg27DQb6CoHE3WgBGeO+TRBTbKDo+5gjvXE9bcrrcT/UPkFyRMdr4amRpo/njVChA3YrAFyscjwQpUr2vy3cemRdmovqCIME/hTc1eB
X-Exchange-RoutingPolicyChecked: 
	vFl2dISAz0U6j1J/YcFvDI8mcIctA1gABdQVOc1RFMhL8XC+prPsj5xw9Xk4gNDZzxB2hR4rqW3rKUpsCjyuGFF5IvAc0xcZR0i1ZYeh+LSzQQ1I+DJJc+Y6NpOeuVj1Ef7xuDiHwo+3PTsqsdlWt6RlZIBVxAv/SBV90+DRjqjjOMhHKVSUAW27FQ4L375G3kMPRBlyEKxC1kNcGSt1Een6XMu6LFAXbamgIgcEuVYqb6PwqJ0nJnRZ2p6jdLo3t/CrPj7fX2SLFVoHwELiqPx59y89+orBbE5VgdqZbgjRt7cGWYvf06WZLYKBgTkZawXazA5Zcdc/NusmfqPhIg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 13:53:01.2732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1393e6fc-982c-40d3-fccd-08df2de84a67
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	IA0PEPF0000003E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFEACE3F2B7
X-Proofpoint-ORIG-GUID: lfAfPmvAffug7CneTarsBNrqD0o-TvMY
X-Authority-Analysis: v=2.4 cv=ZN9CCn7b c=1 sm=1 tr=0 ts=6ad620c4 cx=c_pps
 a=INYzEgT09ABq+JfORImVWw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8
 a=sozttTNsAAAA:8 a=5_a9QeKquPZePZbjwrkA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NSBTYWx0ZWRfX11PcaeKoPRli
 s3pad6zPARm5Bqei5cS1GpwxpDA93UrLVJOPeTq20L7xPUssR/EmUYMoJwu+E+Q29aoIWnMN8jx
 SXjvbDQMLEayRYOhLkx4F1ZqpJ68IIEEKc/pzVbreKbCPDMsENepaV2ktZzBazEO3cDtlvMdB5X
 RCNlXAj8czLlBbS/X0uRLFYOWckTBL5UtKKaPNY0VgvjOzQHDY/kSszb+2Z2Vu4hAsBWiQPxvjw
 SeUVljO2eHe+Ae/daPLpFTPTDtaLjoIu2FRNyuCIcqRepghv+tw1lTkpCVgAUQbmGkl3cQKXbVy
 musL/s6znEx3OeznhJ2dqEnTPA5oyWaNl2CRiFfLz1kUqL0fgYpAm1QIZ8jZN964/QuViKyscxl
 4cqMEsKrLblWTYn3rmZQyp837PldYK1qVpufN6+RJJvxvwd+qi1aRakYXMehAvDnvMFxnln6WZw
 BRvoGPFGX27KqUwRQcA==
X-Proofpoint-GUID: lfAfPmvAffug7CneTarsBNrqD0o-TvMY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NSBTYWx0ZWRfXxHTFueXR0iIL
 UAFYDsZcYi/oNbVycg4s4YCtAMk0nBiM8adD8eqNXIjX34vsFkeNJLxeTiblgskXr2MDJ3D4p4E
 sLMyy4hDxKqEoDP3vYD6mS+VW9dRfDo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190055
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 Oct 2026 13:53:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17744

Hi,


Ignore please wrong file. Will send a new patch.


On 19/10/26 19:19, Paresh Bhagat via lists.yoctoproject.org wrote:
> Configure PipeWire metadata to statically initialize default audio
> targets sink and source at daemon startup, by leveraging WirePlumber's
> find-selected-default-node hook priority.
> Also update audio format to 16-bit signed little-endian and
> audio position.
>
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>   .../pipewire/pipewire-ti.inc                  |  3 +++
>   .../am62dxx-evm/90-pipewire-sink.conf         |  3 ++-
>   .../am62dxx-evm/91-pipewire-source.conf       |  3 ++-
>   .../am62dxx-evm/92-pipewire-defaults.conf     | 24 +++++++++++++++++++
>   4 files changed, 31 insertions(+), 2 deletions(-)
>   create mode 100644 meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/92-pipewire-defaults.conf
>
> diff --git a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire-ti.inc b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire-ti.inc
> index 65a82671..e6a92202 100644
> --- a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire-ti.inc
> +++ b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire-ti.inc
> @@ -6,15 +6,18 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/pipewire:"
>   SRC_URI:append:am62dxx-evm = " \
>       file://90-pipewire-sink.conf \
>       file://91-pipewire-source.conf \
> +    file://92-pipewire-defaults.conf \
>   "
>   
>   do_install:append:am62dxx-evm() {
>       install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
>       install -m 0644 ${UNPACKDIR}/90-pipewire-sink.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
>       install -m 0644 ${UNPACKDIR}/91-pipewire-source.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> +    install -m 0644 ${UNPACKDIR}/92-pipewire-defaults.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
>   }
>   
>   FILES:${PN}:append:am62dxx-evm = " \
>       ${sysconfdir}/pipewire/pipewire.conf.d/90-pipewire-sink.conf \
>       ${sysconfdir}/pipewire/pipewire.conf.d/91-pipewire-source.conf \
> +    ${sysconfdir}/pipewire/pipewire.conf.d/92-pipewire-defaults.conf \
>   "
> diff --git a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
> index 857c344e..bd91a9a7 100644
> --- a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
> +++ b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
> @@ -11,7 +11,8 @@ context.objects = [
>               api.alsa.path          = "hw:AM62D2EVM,0"
>               audio.rate             = 48000
>               audio.channels         = 8
> -            audio.position         = [ FL FR FC LFE RL RR SL SR ]
> +            audio.format           = "S16LE"
> +            audio.position         = [ FL FR RL RR FC LFE SL SR ]
>           }
>       }
>   ]
> diff --git a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
> index ac7635de..467ae525 100644
> --- a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
> +++ b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
> @@ -11,7 +11,8 @@ context.objects = [
>               api.alsa.path          = "hw:AM62D2EVM,0"
>               audio.rate             = 48000
>               audio.channels         = 8
> -            audio.position         = [ FL FR FC LFE RL RR SL SR ]
> +            audio.format           = "S16LE"
> +            audio.position         = [ FL FR RL RR FC LFE SL SR ]
>           }
>       }
>   ]
> diff --git a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/92-pipewire-defaults.conf b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/92-pipewire-defaults.conf
> new file mode 100644
> index 00000000..fac730b1
> --- /dev/null
> +++ b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/92-pipewire-defaults.conf
> @@ -0,0 +1,24 @@
> +# Default target nodes for AM62D.
> +
> +context.objects = [
> +    {
> +        factory = metadata
> +        args = {
> +            metadata.name = default
> +            metadata.values = [
> +                {
> +                    key = "default.configured.audio.sink"
> +                    value = {
> +                        name = "alsa_audio_sink"
> +                    }
> +                }
> +                {
> +                    key = "default.configured.audio.source"
> +                    value = {
> +                        name = "alsa_audio_source"
> +                    }
> +                }
> +            ]
> +        }
> +    }
> +]

