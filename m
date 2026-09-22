Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFDFCC98302
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 21:17:45 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.217.1790111859320434326
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 14:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=aE+kyun2;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=MOHysMTY;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68MIw0QB109154;
	Tue, 22 Sep 2026 16:17:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=3/v2fiuOYR4RfXuM+znPiOj8rchyITbR21mFXEH3N
	nI=; b=aE+kyun2ge3Dcz7VdsXz3w+mFYl2YL18mE/WxYM48w0E8ENQvkmOMS4y/
	7J9Ysiz7ZsS+jPGhMVvpXnv5lJCwko/ylSj1pWizBUJc2yCdB6S7upGLkpJNDpcy
	haMvMePJiMxCmm9rJRv+7wEHTrlk++aQZWOrStmSBdeVBe+BfA8LvBu5BuTSlTjc
	paDT3E4RClp68rmfVT1sNCkDK8li1Cwa5PJlDtEDeHV+GeyA9BL1LYsM0WvhVcet
	ZnNQQFcgrDQt0Pe0OLQSbQz7+XuIr2cR83Ui1c02UMb7DdPt+prqAaqSRLrWgcEF
	sBPC60rnwSg2XS0J0lsdTwYoMCE/g==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010053.outbound.protection.outlook.com [52.101.46.53])
	by m0384305.ppops.net (PPS) with ESMTPS id 4guwpm1p3d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 16:17:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xk8dBxymv4XVlV9u5RFcLxPQH4k63/U0kOt68Fzhtc1C7Tt5EFV3M9AQTK8AU7ri3S8nNYnfOfp4yAYuRZQz7R/DbXcdclemNdNI+QpyGxbXkL1ABjsuC/tt0yNYenOuGpC9d09YLtQFXW8ZovAO9zQc8ygVBMvAIcs1M87eD4gtoIOluccuhUsF/35a/aTQvPM62on+FAyLgzhjaLdZgbZBXLn9E0013pdaFEV3fq1T1/9G/HGvyvQ33DUV1eZypmq/uwAVVyBqptI902GVvTR1Y1yCEnJirx7RWzjrxl7aau5N9mEIC62zBdnrAONEpQ8C5cWeXlL8uaUd61f6lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/v2fiuOYR4RfXuM+znPiOj8rchyITbR21mFXEH3NnI=;
 b=InNKAmBFBdjlVZjQbeObSuVAEvJ11+73xk1Bp8waOpVHYwjAJVu/166vB7wz1oW1l6BrjGnm6TxfvAV2nkFBYfmup8DARKwQD6T2ZNF56DneVNEvROCe3XFj72S+WWojFKZiMkheTIsb7c7vYUUTIknF7436xOBKa0WeykUtCEnY6qyXVHn1FOWsyA0i/0x1Y43RL5CwLVORESZb61mZOqKd7xNEnzKyvPtYbExShf2BMen88LKysR965Zyw42InvuR4q6i2lG4+pKHRymgdBf/7WTEPARwG9D3OI58WmCG91rtCprGEIPN8kpXrDTkGOU75ByE4rsrdIJT/NrcdlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/v2fiuOYR4RfXuM+znPiOj8rchyITbR21mFXEH3NnI=;
 b=MOHysMTYGSCkc9HrvIHn82HvXo87z4u76PzhZysI/OfNgSzRg2MKxBrZ3bR4ipWcp/pzfKen8yJlQ4WD5FSo25/wFXLnunyJinYw6tShjEqlEqnqx1uGXyUbLb3IO5ksMhBjWQ+Rjhd/jGjesD4hYTZ91c4l6fJs5FbaD7xkL8E=
Received: from CH0P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::35)
 by PH0PR10MB4600.namprd10.prod.outlook.com (2603:10b6:510:36::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 21:17:31 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::33) by CH0P220CA0015.outlook.office365.com
 (2603:10b6:610:ef::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Tue,
 22 Sep 2026 21:17:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 21:17:30 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 16:16:49 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 16:16:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 16:16:49 -0500
Received: from [10.249.33.88] ([10.249.33.88])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MLGnXP718529;
	Tue, 22 Sep 2026 16:16:49 -0500
Message-ID: <0c1388ae-e231-4724-bfdb-8758fe68b929@ti.com>
Date: Tue, 22 Sep 2026 16:16:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/wrynose][PATCH v3 4/4] packagegroup-arago-connectivity:
 Add PipeWire audio stack
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <denis@denix.org>,
        <j-sahu@ti.com>, <p-gupta5@ti.com>, <r-soni@ti.com>, <s-kapoor@ti.com>,
        <s-sinha@ti.com>, <sen@ti.com>, <y-hegde@ti.com>
References: <20260922102559.3717785-1-p-bhagat@ti.com>
 <20260922102559.3717785-5-p-bhagat@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260922102559.3717785-5-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|PH0PR10MB4600:EE_
X-MS-Office365-Filtering-Correlation-Id: e0b4676d-a51a-4d40-e6ea-08df18eee92d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|6133799003|10067099003|56012099006|4143699003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	5w+gnL1Js09uQ8CWIKlDgt4dgeIwsBzg5vLCrvf+rEdmzM9Q27X3ijPa0PteIJqoMh/wMfkYSj6MZ8AF4SGa5med8aJ4ZSYKzsvAvQNRoOntyCwad0VHo2osa7J4RF3aE8EuaZFoEDEEU9DRkJxnYqUj37+Of+xww57+8PIxfkxz8U4kz3wvH23DLffqlW/Qe5iX1H33JcyLE3JrRCZCt7yQqIVVW03typ0DPMqPz9xo1RgVKHtyYV/Ej7H+qKs/qdaWawNGmHcestuU5qCtAhhdHwN7RDmQzCPtXGXsyxpKz3DXAjBVQAEjaRkiLKksirAa8iagAr+MbzWsw5nAmdrvzMh0RtnDLzCmBjnNsVuXMiEa3pjJZ4VjljdVje30jaqh8YVPvzYzwErdSnlczNvbSngLxNzbKFxffj5AD62xUdFtPVGJCIklPLa9/x09BIjTcBG54XEaBAJsGluHcXVYrdDVsxQ7wKRkUOCfaAC9RsuTULTSaD3fMzROsjOaooH2mFrUodMLAZdOFSKauVUzY8jBswvlVJnSXdOdu/PA7ncRsRuTPVSKgsCp0MjIfLMMuzXsTbZ4Dl7Ai6FWJPsBvI6qu4IRft5BNC5WQI1hixh9xpDV1NUMSlyXr79WJN05GdWBZn6c5FwmqUpxTUzL1ZmPDCHSXvUUK7dYCN8ShB2c5i/+rp4yuh7j9DfOOMaEcMpx31PdfwJOij/wWA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(6133799003)(10067099003)(56012099006)(4143699003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	m2CTaiOFV5tXjFMCHNvqmgSTM/MzCiQLM2TbTIuJe2/oCBe91Wj7nJPoK/PcmuQsR9NnrmHiFvGAa0uJlmAOyyW6Zkc/wup/8DZ3z66bOCHQVeuYFlMHrjPtwhSOiowCV0GsNef01woKSrgxYQMuGVBjK3Zc8W7TVChDhgfhh2NOuPpkrQyWgvgLa5Qh39ifoXioHh5q3okL2GMTkhKIfIX8MB9SE2plVNgSAoIcoPQXNDLMUty2LSUmp5zGptaazZAKmobjrTshOALjkQX/5zcNtuL37U42Hf4jxkEo204m0BKyN6lMQ6T/n+Nltev+qyRU1PyHwX56O0oQAP/OdQ200UO6PQngtreJltOsSfFhcAAH5Yvk8CamLz1nneW5e8KuHF/T5QjpC8GhLI2K5yebVfmRRWADnDjBX1SMKE1DnsfutduHFRNyXdZjPVJQ
X-Exchange-RoutingPolicyChecked: 
	U/QFbBv6RuFuZ57cgPMBgmQdZFcW+YFTqfnr/m5ng3M/F7531W93Mz9lMF79motvEqZ3Cnewe1Kz7a0WY5agAm+ZOfpYPoBHQZ+JtFFze35ekoidZzdkQCgPMUIRTM5Y+H6C7GTQjOT3+z2voB9egClN4juHKl5RznoP08FzpQBJs+5AwIKD6gVji0lgY9k/vspd5i51f7dxqmE02+rA262xqFeCa36SaS7OpCVBsj1i4bXTzPJc3R90Dd0lBzhMQAB5WNnQqWTGbhQXiVYhcpLxeDNouR+T5KKpXLelAQ9hvo8kV/cgOhHErWCdQ7zKDcLWrim3aVIMJx4udICECw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 21:17:30.2168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b4676d-a51a-4d40-e6ea-08df18eee92d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4600
X-Authority-Analysis: v=2.4 cv=apMnmiZV c=1 sm=1 tr=0 ts=6ab2f070 cx=c_pps
 a=QnLLxHS9Rj8Jz4O0ufpOyQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=EO6fu92TXDdE-SUMLkcA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NyBTYWx0ZWRfXx8hngRG98BSh
 R3iHZ2WtThdQassL8+ZHBYH7XudP/Uk3h2MrX/PuuEBVY5AHYk+c/9DfuPQwYQrSyPSo3uOUgVe
 JIsNIPY3ApNrp3AcQhS1FCZ6LD1Mp0U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NyBTYWx0ZWRfX+2ebAWikn6fE
 nf7F7f3W3l2SmmN/6nQxQqqxlb9H4p6O21bzACAhSOFe5qY9f6nmYncJbPqAI1OHsW/DoP0cx2w
 jVk/MpEtDf4UhRO2/ZMCd7hCo6J1ST/06MNVHHYXpObxV+gbJmfFVUWDwkSqtj2wHRktV8ijhyN
 v+vrrYmpVtKtL1wSlubprbfrRh3m5F3HVV25CjRd7tWl3wfBgq6aPwhpid3r811+RTc5WOqYxwq
 OCL+NOYkNDsuIIISAiA3wNVvZBDm/r5c4lBq/nDXCgwYDurngWk+8kAaXOeXgY12iA5zr7NuFxz
 eqngvdY3x8Omeuqa8/6AyaM1iVSzHZW3GxxR/4xyQz4Vfv6+J1918uxhvM7I5XIkm3wygtm3Ye2
 g+jUJQVfJ7Oks9nAOhf6WOxwYtmpNuMo3pbGhfyrb77P6Rk0Zv0oc961mjC37eWP9GbmZn2iGfu
 8U+NPvpaBqiZhV8FE/Q==
X-Proofpoint-ORIG-GUID: gZ_8FAWlT9Hs83S9w95TNU_DnL2j3iTm
X-Proofpoint-GUID: gZ_8FAWlT9Hs83S9w95TNU_DnL2j3iTm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220297
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Sep 2026 21:17:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17694



On 9/22/2026 5:25 AM, Paresh Bhagat wrote:
> Include PipeWire and WirePlumber as the default audio stack across all
> platforms. This brings in the core PipeWire daemon, ALSA integration,
> PulseAudio compatibility layer via pipewire-pulse, GStreamer plugin, SPA
> plugins, and the WirePlumber session manager.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>   .../packagegroup-arago-connectivity.bb         | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity.bb
> index a1de8f4d..35a6e59b 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity.bb

Denys and I were just talking and we kind of feel like this should go 
into packagegroup-arago-multimedia instead of connectivity.  Please make 
that change and then this series should be good to go.


> @@ -50,6 +50,23 @@ ZEROCONF_TI = "\
>   	avahi-autoipd \
>   "
>   
> +# PipeWire audio stack packages
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
>   CONNECTIVITY_RDEPENDS = " \
>       htop \
>       iptables \
> @@ -60,6 +77,7 @@ CONNECTIVITY_RDEPENDS = " \
>       ${WLAN_COMMON} \
>       ${WLAN_TI} \
>       ${BT_COMMON} \
> +    ${PIPEWIRE} \
>   "
>   
>   CONNECTIVITY_RDEPENDS:append:ti33x = " ${BT_TI}"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

