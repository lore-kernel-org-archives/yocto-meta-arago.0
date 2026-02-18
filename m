Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F450E9A047
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 13:44:22 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12026.1771422257566121921
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Feb 2026 05:44:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=AuM1VhCE;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.14, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8jXBrdjh84DhogbSm6bW14NAVizHwZ8sLV/ZnsuFJUyh2rbHfTZH/KthUfS6yWsCM5C3hG8/uPW6GUoQFSfEWxTqwY6NFxLMSOhLsEf+r822rmV7U0ZbyFBBgUKNO1nRIdXq81rYh6Ozs9Pfd/G5yn/HjIp6tV7rjTfUvaSXrKrW1rWso5X4a+IFqx6rwixg/pnwkpBWoUhThrGFBx6TBhuK5Vu0WOY44fRcg6QoHaeck1zix1BiAFNUKj2/YodwGJQoXpsZCdu77g5X5TKgyJluK8q31QX8WaX+4L6JrgHeZw+tOsQeCtjFBYAhRNgBSW50g/cPhAXHBNAgsnw3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70uubP2hePwaV2BUuEOCSvyfrtVvRT2aN2deBG1+jBg=;
 b=w3+M59XiRUfOzbrCvV94nx0ZAEjzwY4O4niOlpV0WvHXS93Q5wi7bJBUAHJEVU1IOcuT+u6eSRHivC0B7eaMAxabIdanMdrKgN50lXiD9AgjtirBrqW7/xIaPL5Xs/3fG2Sr2JK46ZWsknN1C9xx7o8tZyI3th/1Rdw5rBw9+cm2XxYEdUkT07727RA4KijkTGpVc/h41JLquWV0TT2ObpIlxuiZSfWLRHbe68adJl3UjnQsOy1lyJ4fY1Hwx7b9IbB9b4crnBA3K/trbOMYmcIfCHVLOjquSeZGihOKQn+z6PwVBpcn7bCKUbqrAFHkm6f5N7oSekd6hojAw4AD9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70uubP2hePwaV2BUuEOCSvyfrtVvRT2aN2deBG1+jBg=;
 b=AuM1VhCEcWe9p4Edh2FOh/XPtErACUg3Z3mg2e4eAJSSzhqTUpG0CFZH9Q1EGbqWfT3r2cn/mhK/F78UX6SgMlgahSosUhDJGJsRnGxmZv7nhquXN4lJgq58r/PHzxZgxLYAJznGMMinSgh5Gn+s4U6krIGrXIIeVQp0FACY+z0=
Received: from SA0PR11CA0197.namprd11.prod.outlook.com (2603:10b6:806:1bc::22)
 by CY8PR10MB6514.namprd10.prod.outlook.com (2603:10b6:930:5e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 13:44:15 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:1bc:cafe::d2) by SA0PR11CA0197.outlook.office365.com
 (2603:10b6:806:1bc::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Wed,
 18 Feb 2026 13:44:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 13:44:14 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 07:44:06 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 07:44:06 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 07:44:06 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61IDi5mU921270;
	Wed, 18 Feb 2026 07:44:05 -0600
Message-ID: <5d577743-4b41-4f9d-bf82-2d428b5c186b@ti.com>
Date: Wed, 18 Feb 2026 07:44:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master][RFC PATCH v3 1/3] recipes-multimedia: Add
 pipewire configuration files
To: <p-bhagat@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <praneeth@ti.com>, <reatmon@ti.com>, <v-singh1@ti.com>,
	<y-hegde@ti.com>, <j-sahu@ti.com>, <khasim@ti.com>
References: <20260218055715.219075-1-p-bhagat@ti.com>
 <20260218055715.219075-2-p-bhagat@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260218055715.219075-2-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|CY8PR10MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: ba795def-0266-4d5a-1b75-08de6ef3cdd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WnV2SUVRM2QyNVZsRm9ZNVlHNkIxNnZ6RjBWdFM2ZFd3UXdxS0sxOGNlZW5C?=
 =?utf-8?B?WG5tNkgwRTdDTVc0b0Q1NTJMRDJHMFo4WWlFYllhMVQ2elFNVjhrTGIyT3oy?=
 =?utf-8?B?VTl3akxLeGRXWm9adjhiVXZnRGUrYlI3bWxMZkdMdzV4NzNWSUtybnBFMlhI?=
 =?utf-8?B?R1pab0NocS8yS2hVZEdnRTFTL3N1SjFOTVlxd3JoaGk2bC95OGdnM1lRdFU5?=
 =?utf-8?B?WERFRWxkcHpENlBBeUxMNHljRFJCZGxGM0tDY2ttWmV1SUpERUV5M2FEbFVn?=
 =?utf-8?B?NU9pL1hKd2FHYmZlYVFtbURnaVhUV1h0Y0xicWhpWmJTcEhYVHpwRGtnanFZ?=
 =?utf-8?B?bkl2V2tMTGF5S1VCRU1NWmdnQmNxSVMzNHRxcm1ZTzZhM0hSL251bjR1UTEy?=
 =?utf-8?B?cVhjdUEyMVhERmE4blVDNUpLSmVMVlNVMTdSV1ZDeTlwTXRUM0ZzQ0YweUVa?=
 =?utf-8?B?Y1hUZ05wTWRVNjIrS0ZTb2dQUTNJZDFLcWtmMlM5MlhORXFZS1ZwQWRRWUli?=
 =?utf-8?B?cDcvNDhZMkJTMFRWSDhLclhaNFk2Smhzc20ySDlZSUwzNy8xWlMyZ0Y5QnNN?=
 =?utf-8?B?SWRyQkdyK0daekRtSDVvVFZ5WnEvQVhhZTNrSFdsSzRXeWxvNVdoNDgyN3dm?=
 =?utf-8?B?UjA3Sko0a0tTK2ZhMmdBZERBZlFCcEhxS2RHcGtsQzhHbXRnV0F0Z1lmaktR?=
 =?utf-8?B?QThaUE1USXBkWWUxUW53RU1FS1drWVlyOExoVFBnZmZqQXhBUzQwWlk3RW94?=
 =?utf-8?B?REpEVHY0RFl3ZEtBT1RVaG9oa09yS0xnSm9wNVA1SmkvUkY3MUkxc3VMakxj?=
 =?utf-8?B?aW9RWkQ3Zk9rQmh2c1hJdjU2cDdnYkZZeWJPMDFOZkZOY3k3Mk5MN3Z1WjVi?=
 =?utf-8?B?MmRURCt4cXBiRjAwTmdYd1JpUngyUVNCWTJOdWx0Mmo1WEFEdTlsK3FScXR0?=
 =?utf-8?B?VkhXdmdnekhReEtpbGlDTFk0K3EzbTYrOEI1cVNBdkxhcmdRVnBMQzhqL3VO?=
 =?utf-8?B?S2dVQ1JubG9TSDJKbmNMUVJLcjY5d1JYVDBBK3g3NkQ2SnBiWWJpU09jckFL?=
 =?utf-8?B?RTZhbFN5cGRzWThrQkg5Tkh4OWpVQTE5SGYrR0ROTVNUejgzclVKVlJHU3ht?=
 =?utf-8?B?R2hkS0k3M1pPUkR3WThFdVM2WC94R0d4MWVON1NBcy9FNGxGWDF1MEpINFJj?=
 =?utf-8?B?SXlaL1lBV1o5SnM5dFRMRDk2NVpDSHhKL0dhZEZ3blRSZmc5R1FqcHpOZTZ1?=
 =?utf-8?B?YnZwbWFpY1czaC91dDQyekdFN0NPRDUzR2gzTXNyMDB3ZVhjcUR4dnVqZDhn?=
 =?utf-8?B?c3dZNHRRRHB2M2RWd1hzZ0dvaUVHSk12cHo3UG96bXBPRzVhV2dtcXRORDVi?=
 =?utf-8?B?YWdHbWNPZ01wcVVxTW8wUWtxMGhsblE1S2pZT0pnVSsyKzFqNU1RbjlUdS9F?=
 =?utf-8?B?SEhsZGZGcVl4Nms1M1RzVHEwTmlSZUpXczFiM1VCRVRDRElhV21RYzIzUDUy?=
 =?utf-8?B?UXl5czlpQXA4VnB6bXhHcnU2d0wxS0pGZmtIcDhiOHErbGZPd1Z4WHEwMkdm?=
 =?utf-8?B?TjdiYkxyUERLRE12aGhYZUZJeEtIazUwc1p3bktvN1Y0NG92VmJlZGU3bTdl?=
 =?utf-8?B?NER0Q2lkOUlIMHIwKzl5OHNSUzR3T3lsYnArS2J5a0tSa1o2eG5xUDcvSnZ1?=
 =?utf-8?B?cHdTYXVNb0lzcVRtTFhQWHZ4V1UzamFlS1RLa0xUcUZEa0hDOTFpUFdoL3hm?=
 =?utf-8?B?L21Sc290aU9RWnRCK2hlTkVmZDJ6OFdqUTRESFU3R0ZNN0ozMGNyZHV6SlVW?=
 =?utf-8?B?VmwwQUdvMFBhdWMveDNmMExtak1mMEpjaExPc1RRN3lKQ2I0ZHJNOXRkVWY3?=
 =?utf-8?B?cmZScmQ2MmU3SndYTDlXamJ0a1Q0ZnNNSUw5YmxPaFRjbldaU2pWTERhVjdB?=
 =?utf-8?B?VFVlaUppMkdvQjBBbnZHalpLZ1A5Yjd4a0hmYkNFSEVIUDNTek9LcHFaWjVN?=
 =?utf-8?B?K0w1UXBlc04rSjFDMjl6NWUvbjZ6VHpqaEZ2ai9CN0djcmhuOUpzeU9PeEox?=
 =?utf-8?B?SFRnczF6NjVnSlNrazM2VXh3N2ZUSmdjNDBqNXIwYkJSQW1GaElRK2paNW9M?=
 =?utf-8?B?SzJtN0FrNFVtY3BUVGU2QW5GQ3RDeVR5TUZUUFVjNllISnJ2NVQxcmlTbUxU?=
 =?utf-8?B?c1dGK2dKMlk1ekU2d1VTWE9Ecmc3OVo5T2V5VkFmVFk5SERjbGVRazBZOGNq?=
 =?utf-8?B?d2puYmJlZjA2MTlMcW1FZGVMVkVBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	h8f3y67a9tWkLwiHxASZ7/ghrREPehAAsFxsuciqdC/AQHtAJBCvUqaSYckEUHglPV5VXJlRBXQWZDs2+qJIxS+qUiQU/rRmMmNHIwQzaKZXOF2yL3nCai4KPCYDfzom5Kh1Mho55f1qSB4/iW2Rdyn+s/cOItiPsTF+U0yThN/pQvmLnY2wg9U1FdqJvoTpO1HMnGkdNy2x8IzeFY7oP0Nh2sJPzojw/M6V5zZJdd6PVqI1WBFkMPg2x34cxTsf0+pDihrWWAEK8IgbFzFBioeo6KqDW7aSONtBt1do8cOJPU9Ly8rN3L6glXEuCYY6ogM2cSQUGgJnW/pRlg/edbzvd/4V8HtPwDH+sEb2qdfbcLqQ9I9X0IKah32JhOto9KYFFRh6r6MQO066Wrf7T4j8UzYTr/HSjn/IHncqXkP1B/eYhxCV2wEHycocDMgJ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 13:44:14.1761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba795def-0266-4d5a-1b75-08de6ef3cdd4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6514
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Feb 2026 13:44:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17119

On 2/17/26 11:57 PM, Paresh Bhagat via lists.yoctoproject.org wrote:
> - Add 90-pipewire-sink.conf and 91-pipewire-source.conf for stereo AM62*
>    audio playback and capture.
> - Add 90-pipewire-sink.conf and 91-pipewire-source.conf for 8 channel
>    audio playback and capture.
> - Add pipewire_%.bbappend recipe extension
> 

Why do we need this, what do these configs do for us that the defaults do
not already handle?

> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>   .../pipewire/pipewire-arago.inc               | 19 +++++++++++++++++++
>   .../pipewire/pipewire/90-pipewire-sink.conf   | 19 +++++++++++++++++++
>   .../pipewire/pipewire/91-pipewire-source.conf | 19 +++++++++++++++++++
>   .../pipewire/am62dxx/90-pipewire-sink.conf    | 19 +++++++++++++++++++
>   .../pipewire/am62dxx/91-pipewire-source.conf  | 19 +++++++++++++++++++
>   .../pipewire/pipewire_%.bbappend              |  4 ++++
>   6 files changed, 99 insertions(+)
>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-pipewire-sink.conf
>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/91-pipewire-source.conf
>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx/90-pipewire-sink.conf
>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx/91-pipewire-source.conf
>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
> new file mode 100644
> index 00000000..4aa17166
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
> @@ -0,0 +1,19 @@
> +PR:append = ".arago1"
> +
> +FILESEXTRAPATHS:prepend := "${THISDIR}/pipewire:"
> +
> +SRC_URI:append = " \
> +    file://90-pipewire-sink.conf \
> +    file://91-pipewire-source.conf \
> +"
> +
> +do_install:append() {
> +    install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
> +    install -m 0644 ${UNPACKDIR}/90-pipewire-sink.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> +    install -m 0644 ${UNPACKDIR}/91-pipewire-source.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> +}
> +
> +FILES:${PN} += " ${sysconfdir}"
> +
> +PACKAGECONFIG:append = " pipewire-jack"
> +PACKAGECONFIG:remove = "jack"
> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-pipewire-sink.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-pipewire-sink.conf
> new file mode 100644
> index 00000000..72562018
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-pipewire-sink.conf
> @@ -0,0 +1,19 @@
> +# Pipeeire sink configuration for AM62x, AM62A, AM62P and other AM62 variants (excluding AM62D).

s/Pipeeire/Pipewire

> +
> +context.objects = [
> +    {
> +        factory = adapter
> +        args = {
> +            factory.name     = api.alsa.pcm.sink
> +            node.name        = "alsa_audio_sink"
> +            node.description = "Generic Audio Output"
> +            media.class      = "Audio/Sink"
> +
> +            api.alsa.path = "hw:0,0"
> +            api.alsa.disable-mmap = true

Why, what is wrong with the mmap API?

Andrew

