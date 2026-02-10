Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC9BEA813F
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 16:04:25 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23222.1770739458410891152
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 10 Feb 2026 08:04:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=ZbOww6jL;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.60, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFlBvVlBtHJrFLTdHuFWuMhPtXs86Jll0bQ+yOA+Y1qwcqVfkZ+/ehyzGded7Sr74QHJlzne2IFxkVBy2N5wSTcc20sgTnrU9stevPN2niamaQpuRRkghXQPQ0lce/CXk3+FwH6fG6Ww+kRIKAV0ursDg8d57YLBbSwOvMKGftWCQrcVvA13M2cjJco/oMpkrh1Njtb2SImsLMXj54EFx0r7kqMKDbQRVo7PJUshoxIr8eyO80X+WXr4Ch/O0TODTVAuHX/jetnGlfzPF32Tt9eFq/ZVFvt27fWXXupsx7m11MyZ6PsyWbhV6rRN+oNKOlzH11sacnBczfmZbLb+/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igKWWLIl/ocVyWnH3aZxJJx2bGzeOCG5ojOeM7zc4Ws=;
 b=h4SZvYxJJCNAjNmCWRpRmOd9jf6iKybeLPRdd9xM1hFUDrcUe6eccMzzppXklzwhLJ9sULe+MGpM01B/kztoTSNg2mVCQVh1LFCIFPyXU3/Ssh263dw47HNqoJKzGgUcwSJG/VSpHYE7M/K6iBaHDrmu7Hfj5w8GwMXG6EZLOlLvCHs++7Ajq3K93gZot+u2hdMhU3hgZxWcBBhRnOAbBanRoWfKn+LXpy5u1WTtF2tgKWLLA3IsRBQR3TeibTishPBQO856hIR/o9DdSyqyvL2i4+VsXKx9MDHJfammJ3cELxM/bZxgsqho/xQU+DivwnVa+BcC8JBYp5QMRtfWmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igKWWLIl/ocVyWnH3aZxJJx2bGzeOCG5ojOeM7zc4Ws=;
 b=ZbOww6jLOR1u4IJLPQXKboEm38CYsMkTJciqJbw+hD+mJ7Z2gJsUYsvakqduykTRDlybe6vrhxSg7nAcwYJ2A8uswmdQDdqNHpk3OX0bJRd3mLADO4bZ+a6wKHNbEmfSmNq8M1hmcEI+Ze94iULrN61MpBPlUzv3WiXCW/Dyuyk=
Received: from SA9PR13CA0085.namprd13.prod.outlook.com (2603:10b6:806:23::30)
 by BN0PR10MB5000.namprd10.prod.outlook.com (2603:10b6:408:128::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 16:04:16 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:806:23:cafe::19) by SA9PR13CA0085.outlook.office365.com
 (2603:10b6:806:23::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Tue,
 10 Feb 2026 16:04:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 16:04:15 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 10:04:14 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 10:04:14 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Feb 2026 10:04:14 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61AG4EZK050050;
	Tue, 10 Feb 2026 10:04:14 -0600
Message-ID: <5c16ef77-10cb-4a84-8558-519ba58e9406@ti.com>
Date: Tue, 10 Feb 2026 10:04:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master][RFC PATCH v2 3/3] recipes-core: tisdk-default-image Add
 pipewire audio stack support
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-arago@lists.yoctoproject.org>,
	<denis@denix.org>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <y-hegde@ti.com>, <khasim@ti.com>,
	<j-sahu@ti.com>
References: <20260210155201.3029549-1-p-bhagat@ti.com>
 <20260210155201.3029549-4-p-bhagat@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260210155201.3029549-4-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|BN0PR10MB5000:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8d94ce-b98d-4ea1-c7b7-08de68be09ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dmRWd1ZyNHJwMkJtWXJ4aHV6M0dFb0E5cU90andrU0dadkttQm16V0x3c3I0?=
 =?utf-8?B?ekZtU01HTGRjV2ljVUpBQUt3ZlRSR1dLTVBhSXJLU0pXbHVNZFdJbUNsb1dj?=
 =?utf-8?B?cEhOZWVxSERhanNLa0FtbzNMa3ZpdnpjWkxONExEZldXVmpKd3VxRWNWMytU?=
 =?utf-8?B?UXVmTTlkbTJBcWVlam1Yb2pIOHdVdkZOcmtRNEs3bklSNUlnaTBYcEovOWpz?=
 =?utf-8?B?SlRsTUpadUljSkJ2YU1BUlp5NENHQUdsT0VJQjVEdGNmNzdqSUgzOS9IMlZJ?=
 =?utf-8?B?Mm1LbkhUNVpvL2lwNGp1TEtkT1ZRaFovNzR3U20rYjlrTzc4VUVpSmphWE1q?=
 =?utf-8?B?UVRZV0x4cG5odXBYR1QwOVdSVElKZGsybjJhWWpXMGJIckkwSmlWd2hWa1lL?=
 =?utf-8?B?UGc4djRDVW8rNDJvQ004Q2VUUDJiWTV2TE1Zc3VqZmxZSVd2blFPeDl2Zlpq?=
 =?utf-8?B?MDJ5bktwd0QrdXNqdThkUElsSEtJUUJ3L2xyVGlWd1V0SjRsWi9qVjgreEtk?=
 =?utf-8?B?a1VrSVFMQXMzUEdmSUlPeU1QVDY1cG83OVdiODUzNkcvU0ZiUStwUUN6ajJN?=
 =?utf-8?B?N0lXa2xobmY0T0ptQVFzUlRBZDVOejEyNDlYMGFHeVJ6YXRWMTBkRG5xbUtr?=
 =?utf-8?B?L0FMZ1I4MGtaclJ5dWl6V2pKUitHREExa1dwMVl3UHVWa2pBVUtLTUxzU2Vt?=
 =?utf-8?B?a1hCR0ZTaEZ4dHhONFhlK0cxVk9KWTFwK09ZSXh0TitwaDlhOTZsaXo3S2hR?=
 =?utf-8?B?b2txQUdIMFdYVnllaG8xT3EvNjRHV0Y5QTZZMURBNVhWaW4zQTRNODU4Z1BG?=
 =?utf-8?B?ekRKa1B3d01KUVRnVXVEOHhLbE9LMjd2TDRuVzMvQmhmVEpMYmVURVlxVWd5?=
 =?utf-8?B?d0d5Y0dGYTNKV1krYXlTOXZ3Q1E2akw2WmppNVZJc0pMQitPdmFhRCsxUTMr?=
 =?utf-8?B?U3ZWS1dGTEkvS1BidndDM1VwY3BGNmVrYTZhLzdIdHVVbzRHRjdPdis3bEVE?=
 =?utf-8?B?ZWhlU29Rd2tCYzRqRGlwMUdmT2xxVlpNSGltVWwvaVdadjJ5eGJNaGsxMmNv?=
 =?utf-8?B?UHBvbXdSVzdKamM3OE9vU0ZtWE1JK2VRc0crOUV2VG5uOW5FeVJQaTlKdXFl?=
 =?utf-8?B?TzVYWUFveXVsbTJDaTJ1bjJuRlB3NVJTTU5leEZJZnYrcXArbHlkeFF3WHJS?=
 =?utf-8?B?T0NZL3I3bWE5MnYzT0FxRGVPelNwM0VCdjJQRUxhUmFaMFNkU25JRCtOem00?=
 =?utf-8?B?ZnNZOUhZNWFqVDN1ZzlCNkNLQ1pkUWRsUGdsV2RoT3NmMVdRbW52QnRCQ0Mx?=
 =?utf-8?B?WXZnelVYZjdjUkdRQUkybGJsM3ZhNXNtN1FIazNiSC9odVk0d1dpa2ZVYi9Z?=
 =?utf-8?B?NDl3TXVSRVRBb0R2R0hiWUttRDZSVXRIZ0NLYWhBYWZDTGJUQXhnVlBNVkhQ?=
 =?utf-8?B?ZzNwamkyazVacmhBaEVKSm9iUjNsK0NSb2drWnBkZ25OaW93UGJ5cGF2eVkv?=
 =?utf-8?B?RWNETWJNVzgya1BJbjNUckFDYXBvUzRUTkVtb2JGWndaZG9FK0FpUU9wbkNx?=
 =?utf-8?B?NFBjZjRpWnhRclJyeUJITTRnWmNNS0VVWHhJM2EzVnBEaHpUUkxQVm1tWVVu?=
 =?utf-8?B?NEw1cGh6UHlxaFFvYUJIUlVZMlBhandiUG1CL1JibEp3VGlidU1TWXEzNHNZ?=
 =?utf-8?B?VEFtN0NaZFkrMjd4NVI2VWZXaVY3QS9hZXVUWnc0ancwa2R6cEpuT0w1MkVs?=
 =?utf-8?B?cGZkRGQ0OFdqK3dDZmFJTWs1VUtFWk5WUlNIV296ZjNXck1ZbEVQVXppdTdk?=
 =?utf-8?B?c1BYNmIrbTJ5alQyV3JybzdiUm5sODdQWnB6aHV5RCt4bU5JRW1qVWhFQUYr?=
 =?utf-8?B?dzlwSDFTM28yK3VyNWs2MzdHU2h6WXkvbDFtc1ZrZzdNZ1NGb0RzOUlhZXVl?=
 =?utf-8?B?UWJrbnBGYVd1T2xFeGxaUUtZQXhsbXE5cGlHcWlGUVJyZmFXQVQwNTQwT2Ro?=
 =?utf-8?B?RG1DdGRNSm00WjRudDRaaWUxMEgrbWZOQUthUkNZY2s1ajJuV3ZaVUhFOHRi?=
 =?utf-8?B?a0hhSUttZkdtbVdob1AyZmJrQU5MZFRmcWZTdmNWR2xnUGRiT2lxcytaRStP?=
 =?utf-8?B?dURybU5ERE5OYUpZMU13N241clpTUWtQQkZOZUpCUlNNdlQ4SmhzSnVvZnhE?=
 =?utf-8?B?RDUxaFdPS1c4eVZQQkxXdCtKbjRHcU55S1ZSb0IrbmtmK2oxa3pYRjRzVUls?=
 =?utf-8?B?RzBHL3ZBUE15WEY0MUpLZDFxdXZnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ETRCe0gVXUlXKGtKmHrhCVugftL918ZYvJfhL+0JvPkmCFGn00sRTgBxHc5IC2BYJ3oxZDZast7tn0DoPBYP9lR9zlS4T1AUNkzhxhkAdUff1LdVExrBW7vxttzdE4UghW2zymmBEHnjQ9cFk/oMcC3En92aMsjZcXIzh0PNRz3+suZ8nTfYyZ32ua7QSeOraYIs03ILFsAT0df12nzl84WyIqy5Ds+DFwGPixOKxpilV7fuvqfTwi4ZZxqJG6S3wX2LwUbkFvWHtmoajbC0m4n/m3xXSVPo6Hwgt/92L0JVfiTbuowbeJEdSeUroHEfUcl+Wa92LxECqEfDCpzO91j2VvQeE7EnvnPrJOl/4oU47z4AR3KsaLRDNzXoCHB6Q3FYFDJ6SiRQNMV7PjfinVLt3EupLAFkWAGe084WKYD+v4sysUXKUR71oJKVd+BB
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 16:04:15.2363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8d94ce-b98d-4ea1-c7b7-08de68be09ef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5000
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 10 Feb 2026 16:04:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17099



On 2/10/2026 9:52 AM, Paresh Bhagat wrote:
> Add pipewire and wireplumber audio stack support for all am62* devices.
> - Include pipewire core components and tools
> - Add ALSA and PulseAudio compatibility layers
> - Include wireplumber session manager
> - Add GStreamer pipewire plugin
> - Configure pipewire with proper modules and plugins
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>   .../images/tisdk-default-image.bb             | 23 +++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> index 27c5671c..c442e2ba 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> @@ -43,3 +43,26 @@ IMAGE_INSTALL += "\
>       ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
>       docker \
>   "
> +
> +PIPEWIRE = " \
> +    gstreamer1.0-pipewire \
> +    libpipewire \
> +    pipewire \
> +    pipewire-alsa \
> +    pipewire-alsa-card-profile \
> +    pipewire-modules-meta \
> +    pipewire-pulse \
> +    pipewire-spa-plugins-meta \
> +    pipewire-spa-tools \
> +    pipewire-tools \
> +    speexdsp \
> +    wireplumber \
> +"
> +
> +IMAGE_INSTALL:append:am62dxx-evm = " ${PIPEWIRE}"
> +IMAGE_INSTALL:append:am62xx-evm = " ${PIPEWIRE}"
> +IMAGE_INSTALL:append:am62pxx-evm = " ${PIPEWIRE}"
> +IMAGE_INSTALL:append:am62xx-lp-evm = " ${PIPEWIRE}"
> +IMAGE_INSTALL:append:am62axx-evm = " ${PIPEWIRE}"
> +IMAGE_INSTALL:append:am62xxsip-evm = " ${PIPEWIRE}"
> +IMAGE_INSTALL:append:am62lxx-evm = " ${PIPEWIRE}"

Why are we doing this just for the am62 devices?  Why aren't we doing 
this for all of Arago?


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

