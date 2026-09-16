Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC80C982C1
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 16:30:11 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19265.1789576206369143422
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 16 Sep 2026 09:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=WOzVTU4W;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=a3HbsU16;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: afd@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68GFaRHm3174549;
	Wed, 16 Sep 2026 11:30:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=E2EHNBilfRiZSvU7mUvbRJDotnTNNrVg2VMTkVFiW
	tk=; b=WOzVTU4WhuhKwnRe7qalIynk6PblKkWRGWlTw+x8AKRsPVWcpdhE0ucCD
	lba3y7pQt6zd7VMSYyuexvmSNQMp22xNecVpaRoalNrXcKJJZ0oVjRsTQsyApYe8
	K+j+evUGDkYRmo8yGjH6FWqJex2wzyXruG1YddmVOExXuIkQovVFeoE36bDnh92M
	JgujwCNyCpz2+04/qGGlUmJWiFbK0KVRJtz9V7Lq/l3kFdapDa15LZuv2CPrYuha
	MmCbMpHy9M+7+qQqioFuovxUxZ5M41PfW2WUlucFdJtV2mEC1TTkLvL4rN1BzPVI
	5adWCuPJMgjmDSJb6W4pG0mOfnQPg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010016.outbound.protection.outlook.com [52.101.85.16])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gqqmeju5r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 11:30:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgucJbFNrsmMJjnOFstw03FfeEcUSDpk2nOPHNCRZN1rPCBXf6gjCqVtjX9dhSn1JO0fXMRTRPvuXq2LKexCFdpvwNuj8sNkk/keGMrrJpkjurEhjymbgwkN7V/QHH8W1CdR2644Pz6ZXK5Bil2vHqA1uTJHMBqhBOL3eDKs8vvy+VWWOdO/rhKyoo9wGp/5G4JFnLfdlMZD/M8LfPEMriGHPahnUM75TB3W+cYaVdIQ5mRCAdUw4QPYDshBwsZimgqHf/4l+dZC7kL7DyqtJ1s66Jf9g41yoePIYDuen0u7BfDG3FaeP4RpqobCdHYwRT+a7bPOVQkGPcLJfh6WKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2EHNBilfRiZSvU7mUvbRJDotnTNNrVg2VMTkVFiWtk=;
 b=eKxzmfe/IXBOd58JQ/kpQbHwMbuXtm0dSK2OSJZfwYNXHqAC9DreOuKgpN3eWkO49OEvy92PwGHsrujiiZQSpeDZX47L1iKdIrw9GXMhVSA4sBB+9Y8S0tG1GOXSxZjpUSGUHm0/kXB27jU8InUEkNCX1C7mcYmjSfCItpxlhb12fCSE1VSyQL8FGh20RsrfQHh3k9hsUetJS6f18mggkYO2KdgWPY4MnSRaHFwxJddLdrjQIkEupPEkwMVUfeCAvtjGmpjL+RU8jPAvxnI90099zL8hDM4tC+lnNs6NLDlmyLzzUJ5yAdb91YbTxBnB4lulEMN1PmDR8Vtn1PV8ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2EHNBilfRiZSvU7mUvbRJDotnTNNrVg2VMTkVFiWtk=;
 b=a3HbsU162TRk6rwTXjuyUJUFUGKN6MrmpFEW1/n/gQEPAtUH1WaPOTIj6F4W4jKxxJd1UkcWC3aE+ZnpVRh2mQyTnNYV7bHecd2uaMZ0puidWzytJSm43MrPq+qMLJ5iPNhmtX9Y1vgeMTlfhIOuesH24dfkD6Up5HIzCjDIvBk=
Received: from BY3PR05CA0042.namprd05.prod.outlook.com (2603:10b6:a03:39b::17)
 by DS7PR10MB5200.namprd10.prod.outlook.com (2603:10b6:5:3a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Wed, 16 Sep
 2026 16:29:57 +0000
Received: from SJ1PEPF000037A5.namprd04.prod.outlook.com
 (2603:10b6:a03:39b:cafe::71) by BY3PR05CA0042.outlook.office365.com
 (2603:10b6:a03:39b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.7 via Frontend Transport; Wed, 16
 Sep 2026 16:29:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000037A5.mail.protection.outlook.com (10.167.244.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 16:29:55 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 16 Sep
 2026 11:29:05 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 16 Sep
 2026 11:29:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 16 Sep 2026 11:29:05 -0500
Received: from [10.249.33.205] ([10.249.33.205])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68GGT46G1340605;
	Wed, 16 Sep 2026 11:29:04 -0500
Message-ID: <6c900487-4a36-4a46-a3f2-4cb57ce4418c@ti.com>
Date: Wed, 16 Sep 2026 11:29:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/wrynose][PATCH v2 4/4] arago-default-image: Add PipeWire
 audio stack
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <praneeth@ti.com>, <reatmon@ti.com>, <v-singh1@ti.com>,
        <c-shilwant@ti.com>, <j-sahu@ti.com>, <p-gupta5@ti.com>,
        <r-soni@ti.com>, <s-kapoor@ti.com>, <s-sinha@ti.com>, <sen@ti.com>,
        <y-hegde@ti.com>, <devarsht@ti.com>
References: <20260916160547.1287287-1-p-bhagat@ti.com>
 <20260916160547.1287287-5-p-bhagat@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260916160547.1287287-5-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A5:EE_|DS7PR10MB5200:EE_
X-MS-Office365-Filtering-Correlation-Id: c7e8be5f-e6b6-4020-ac24-08df140fbe3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|10067099003|6133799003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	ozdu6eqcROTG/xjRWj/8BgmOSZCmYZGaQr7gJdzdxJbn0CAzgtaUUtdGXxY6/viePtYcFhUQnRGPvfiIBpNXDAfi19sPzvXklyEjYKOfoVZK55cZlbhygAUOV8/ERefm/FKvgzkYVKbBizRsTRyJudp5IlDJTmrfUo/BCKMkDnvYremIQFpzd6KwS+N7mEPzGdu55i2FCJ2FEeNNjKxnuHfN514ImWsqvtkeh62QKJ7apRR/9lpSg54NahYpimxAS7JDjvG3ng/lCaT/QLZ2zkDrGzC9C2nrEb5012iu356WKzO6AwfzJraBObfqasDYRdZx0OmOrnwDCS9j/SPjgVopYobrWUayvKksCUK/f0fhEmI+oJ2Wzpwa1WeHRHwlg1GrmUz+UmPDNFcOohFILqKMob7vqALZEHXuFEVjKoz3nzy9/8lLk0eNRMjzxb1uNJsfevyOQM8g3jqkX9XtISHbQVrlM1mLqYU+pLYvi7f4ppcrk0z+xhOIncrxNTOQoQd1l1SWEdaNoBlQFgFAO/NEqPNhlW7ZvcXHIb5LIUToSYMxj6F4feEvjGTSSZuX9y3d1RMhn7fUn0EvSxfI6PtznzBZTDQLxSfZjNrlPvB3ej+KYf6ep27GVUrosQrZTYZHryA/t5Zc8acWkpNUsfas4hH17byQHrIP9TFII/c8EB+MmARjX63/N+zpcxmFohovfuJG8ppy76eLLwINag==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(10067099003)(6133799003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	EH56aycD0tn4ZnwNjvFRG8obmYEq8+KAyZ+cZPdocPrZirXq9z+Gq8Rb88fOk0ak5KHvykpKRs3Wp5xsEFXiDQ5DllC/69aDQXvDVSaJRlF6FLQzqoXIq9QHVxUc0TFxN9ejOar5Zt4u7hcUPHxcv2UR3tovXP6UacSxAyEsg4CP7uqcFWcTeEN9y0oR6lp/lhpW/RjYy6DvFbxFbYT89/kvnbG9xQsrCOKGNjwXBVyrh7pI2k5L8fyrhhewarP35MMhokx0OLyhpEgwV2lA8HHX29O11l4eVW+q/NK6FtyBK02GazUcnpZWymRtXwUDcBFBo7K9fn5Aykc5YhsBkNndLzFsRJ6SnGhbtaAr6LH9xjSsInXIPZyS9MgVK6DhhOCvp3rIM9BI5wAb0u5IovaxYQhVrARVJ6rnmmiz9ZZvrRbVQk10/RlWkSqqOzA0
X-Exchange-RoutingPolicyChecked: 
	GUMdzxuowP/fH55YgHzTuW14ROLDRra63XxNbDlTTedeH7Zm6e/KEp0UdUEzORnOwyad9SdgC6Tdg4vnCrbx9MTcFV5u2kpoj3RTYpE51f1HZInn0Ps4YKb/yBQbPZchqL0TdUKOHJ0A4YxsJ/vxC9t18tfNbJKJicO9eIWiEPOKs2NkcTbeUgi8x6PwfvrkaXxYGh50ZV4IxOKDbJeLWQeEpsUO3v1vU6ciTTp/NWfGSwVRqj5vQl//kkmCb29qkCuGV1K/HZx+c2qeZAdwlZEAo0Us5Rd20aHna9+wHGuXOdm0HReQIe1AmO5Qd/J191q4ohZNjJmR4Qq82VHlyg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 16:29:55.7567
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e8be5f-e6b6-4020-ac24-08df140fbe3f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000037A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5200
X-Proofpoint-GUID: kUstuRHX8ikHJ1zfOwRfTWrNLHjn3EkN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIyNSBTYWx0ZWRfX/sGEu/f1LKN+
 gENVWetd2iqG4UZ/71w9Pxll3Stj3oVdLON2b4kMFfCeHqS3HMRq5v/P1JmWssBU0+9wRnaQucP
 KoEoh9noYBojZo2MeBVOAXMhAefoKyE=
X-Authority-Analysis: v=2.4 cv=ausnmiZV c=1 sm=1 tr=0 ts=6aaac409 cx=c_pps
 a=4V0jRqm32qvR0De7z9omKQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=vAt1RinoeEvtqRCZXtQA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: kUstuRHX8ikHJ1zfOwRfTWrNLHjn3EkN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIyNSBTYWx0ZWRfX4rqvW5Ez4wpM
 5e2kGYgII7j+MpmkMokwZEwHNadksZgioszkh+rQCB69Tu/dk8+O/Nw0uQmsI/3DGTKWutnwK9j
 6XwvTgIRaglqWvqxC3kiW+l/OP/XQ4V6NADdjE6lpUtPMPwhs1w3mr99DNoK5dGNEuQwKoG3Seh
 UNI0IsXQdOLqKs4Awg9nYby9TIdc95cEpf88bcrIxAZWd7fy0cELdGkn26yWTBY9njKUCwBd9Fa
 ikpjeHk/uepfx9xVHp8VR9wCE7u6GpHDyaYhKMr8ffBRoHSVbN1KxePGUTQ0Z4VxibW4mP1k6oR
 If4TEri2PzOz8ualGaPlY3DVnCglHKB7paTXf6TDgEyTL+Hl/qokQiAXyLEmJiuHcNXxjBfZSoG
 dAvvxYjtivcTL+Oi/Zl7M5lTfq+KtNTT7dKhheqn+NyY6m9/MYG8uarfz7ncDTrygwgawx1EnhR
 XLXmBPlPkInMyyMWJOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160225
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 16 Sep 2026 16:30:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17680

On 9/16/26 11:05 AM, Paresh Bhagat wrote:
> Include PipeWire and WirePlumber as the default audio stack across all
> platforms. This brings in the core PipeWire daemon, ALSA integration,
> PulseAudio compatibility layer via pipewire-pulse, GStreamer plugin, SPA
> plugins, and the WirePlumber session manager.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>   .../recipes-core/images/arago-default-image.bb | 18 ++++++++++++++++++

You removed pulseaudio from the connectivity packagegroup, but only add
back pipewire to the default-image, this means thinlinux-image and such
now have neither. Either add PipeWire to the connectivity packagegroup
or maybe the multimedia packagegroup so other images can include this.

Andrew

>   1 file changed, 18 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/arago-default-image.bb b/meta-arago-distro/recipes-core/images/arago-default-image.bb
> index e01f7c2f..0b0c3d61 100644
> --- a/meta-arago-distro/recipes-core/images/arago-default-image.bb
> +++ b/meta-arago-distro/recipes-core/images/arago-default-image.bb
> @@ -43,3 +43,21 @@ IMAGE_INSTALL += "\
>       ${DEVTOOLS} \
>       docker \
>   "
> +
> +PIPEWIRE = " \
> +    gstreamer1.0-pipewire \
> +    libpipewire \
> +    pipewire \
> +    pipewire-alsa \
> +    pipewire-alsa-card-profile \
> +    pipewire-dev \
> +    pipewire-modules-meta \
> +    pipewire-pulse \
> +    pipewire-spa-plugins-meta \
> +    pipewire-spa-tools \
> +    pipewire-tools \
> +    wireplumber \
> +    wireplumber-dev \
> +"
> +
> +IMAGE_INSTALL:append = " ${PIPEWIRE}"


