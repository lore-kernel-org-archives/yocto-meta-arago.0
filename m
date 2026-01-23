Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B349D74EF6
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 16:04:00 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1714.1769184232322997620
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 08:03:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=K5g9cmgN;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.8, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K6BsuxR5s9+U2F4uy0J8c5N5vPw/AQkY0QwiNBx7C0XHwHqjklDR7b41bO2ehdtkIJXC59MEb6Yc3Z5fhnPbzvugXGtyfbVaxFplZmFsgJsIEMfa129BpmqTTw5IE7+xV4C+5dB6VaSBZBU93C4YhI+lyFxYsZIBpv0ulzOOYeQyelO/KX+EwApN4X27w45lYyTPuO1XxicAoOF8tRjnVAoTQMAuY1siLyLu79kbM+QeIV7umvC8/GxTB+ZzQth3vXITnOo86AZzjvRAzcNdJoDEWF391/pb//VLuz44kfiErcSYDg5zbrA0/sL3TtUKCF732Lu+5fkpLZI/WyJulg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQfuge+CRVbB92yL5GG+RqjJPOMbrlnYzOccQs3YpDU=;
 b=JgFnx+FY04mmhxTMs8TY7pXaLzbRSsQlKoYxUdhJxvqgt4WT9NAXDzbkhC/0OwGRqbHb9bpUoEoX6wi2/Qqv9tCov9btODugQvgeE4poYTnAHFsM3FfGvu0uzliuxiJzPDzhzaIEb5JAeuyZVqo2Mg4aeTdNXg+Y870Ta1oSXn9NNxB9/ecYRbMRBBiZxtabej+0Z72YcuH+ZMWLQ6BaahEs+BrOj3QIJOkW+xHsqHcs5zwp7gpyOY39TJMsD9w/V7xsmzYSTbFbZQC60mbonva19h9WzcAaSIbq83SI1ShTKoBqVHx4pj+26xKDtk0EizvryiMzQesqICO+RCrViw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQfuge+CRVbB92yL5GG+RqjJPOMbrlnYzOccQs3YpDU=;
 b=K5g9cmgNpcN8AKq41IgtuiFTztRNgHj7IB3v/cROONrFcPKt05kzHCVUfe0EjJCdVQHtoM7JKdL/UTZ80gHUqUMI55A+L2K1zG80X5Sga5JpCJHXmjGB5EcwyWhbqlhYh/fqhA7H3+lYxnvvZgF0WfINEt+xlEW3OdXBPBNn1Q0=
Received: from SJ0PR05CA0179.namprd05.prod.outlook.com (2603:10b6:a03:339::34)
 by MN6PR10MB8023.namprd10.prod.outlook.com (2603:10b6:208:4fb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 16:03:48 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::83) by SJ0PR05CA0179.outlook.office365.com
 (2603:10b6:a03:339::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Fri,
 23 Jan 2026 16:03:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 16:03:45 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 10:03:39 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 10:03:39 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 10:03:39 -0600
Received: from [10.249.42.85] ([10.249.42.85])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60NG3d4q2439707;
	Fri, 23 Jan 2026 10:03:39 -0600
Message-ID: <da8a1b60-525e-45c7-afce-7af747dd1af8@ti.com>
Date: Fri, 23 Jan 2026 10:03:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][RFC PATCH 1/3] recipes-multimedia: Add pipewire
 configuration files
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-arago@lists.yoctoproject.org>,
	<denis@denix.org>, <praneeth@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <afd@ti.com>,
	<devarsht@ti.com>
References: <20260123060348.2493115-1-p-bhagat@ti.com>
 <20260123060348.2493115-2-p-bhagat@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260123060348.2493115-2-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|MN6PR10MB8023:EE_
X-MS-Office365-Filtering-Correlation-Id: b178d1d4-29c3-46be-a236-08de5a98fd0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YXl6cDFRVG90ZEZ4bTYzbWU2V2VaUkFZYnJsVmhHSURzdnplamJRSWlFNS9W?=
 =?utf-8?B?UHNmWXk4SUd2OGVleW9vVFIrRWhWL3NMWk93YkE4VWlVeGVNYk9GR1F0d05H?=
 =?utf-8?B?Q0VFelMrNjBQbEx2WEg1WTJKcnRWNTVqRjFOL3BrOVYxelpZdmRyWS9FNDhG?=
 =?utf-8?B?RStMK1pZMlFqc05KU3FsNHZYa0dRZ0oxYVVibk8vM3p1dlRXSW5NR0ZzaGxp?=
 =?utf-8?B?aHlTRi9aWlV5MU94cE5tV3Nsa01tMFpzNm5NZzhlVVYvMHViUHB1YTh4NlRX?=
 =?utf-8?B?K0JpbENZRmU3TENXWVd1ZGVEUnR1NnA3amt4L2ZqY0hraCs3VjRleElhQVRB?=
 =?utf-8?B?VWp4MG1QSGticzNyNlBFMUtsMXdXT3lQY1d2YS9rOGFnb0lLS2E0Rzl2UnMy?=
 =?utf-8?B?bHQwOGVuNk8ydkhwM3krU1lNeGVscnNISXFNOEthTUZvMnQ5VndQWHZJSFl3?=
 =?utf-8?B?U2dZcXRIRFVmam4vV1Z4bjl0cFNZZitUbEZoRkQyRGxIbVpKSTllNXEvcXR2?=
 =?utf-8?B?ZlROK3JDbjZURHd3Q1pFU0M3cWdzK2IzR0tYdFRvRjVLcDFCWmtKSTk4dGNO?=
 =?utf-8?B?ZEJBWjhwSTd2bFNZcThLUTk3UmY3UFdhVVlnYTZBczJvM1p0U1pjVzM1VTcy?=
 =?utf-8?B?NHlYMzlhKzYydWs2WHRORDJnc3phRll6cC8zNkNjb3lRTFJzWkxDQlNoS1k3?=
 =?utf-8?B?RVV6VlFoSWlzWjM0KzBGSDh6aHFVa09PbjU5OW1Va1lhSWZISlJrRnNKUnBQ?=
 =?utf-8?B?VzVCN1liYm4vY2VzbkR0SStIVEMyZEd6eVBKdEM3WU5Bd2lOUzFwaElRdC9r?=
 =?utf-8?B?RDlMdXl1SUxmb3ZabVR4ZHNFRWNzaGwybUs4V3hPWFRlcUFkL3FaYUtpWHVa?=
 =?utf-8?B?VzJpTVEvMnVrbkV3ZHIraXB3Y002REpET0tNS2c3MVZDSW5kM1ViT2NTZ1Yy?=
 =?utf-8?B?NzdPZDhCSnl3NzdBWUJtYTJYOEswaHFNZWNMSDl2Nk1TQVJNY3kyMDMvUEV4?=
 =?utf-8?B?a2s0MFRJMTMrY2hJMDZvb0QyNEZmNmM1MnZvQUw4cE5uNkpXSERWTElFRytl?=
 =?utf-8?B?MHBJM3pYT01JQ0J6eUxZRzFpTitUT1NqS2FxeFZIRCt6WVUyQVR3MWptd0JX?=
 =?utf-8?B?OThnQ1hzNW8wVXhTK0JJSHBYcXFSRVFLZ2FKeVQ5NDJXV1lBVVluVTFxQnJk?=
 =?utf-8?B?UkNXM2c5TDFEZjN1V0hwQm5lNnJzNjVxMG5LeUFQM21QM2lBQlc4NEhCUThr?=
 =?utf-8?B?OGgyK1BYelBDYUNNK1BCdTl6Zml3ekZKSWJhQXZoT3ZHd09BVUlHZzRxT2tI?=
 =?utf-8?B?TkI2NzZqNWtUZTdFTkRBK3lrNmNlMkJDZFNHenVZak1DVlRNRkdUWGRmSzZZ?=
 =?utf-8?B?MU5RZGN0NkZsZkpMSUpSQUk0SUNsc2tYSkpWa2xXQ0EwSWZXZTVqdUNQWXFT?=
 =?utf-8?B?cVNQL01OWjZoOGJsREhFQ2p0cjd1Y1prVHVyanhpa3ZDbUJ2UnJiTU9MZzVk?=
 =?utf-8?B?ZHNGcENHRlRuNjBvNVpmcEQwRjRzb2k2NE95cno5TEhVT1NhVktaeVE0dnQ2?=
 =?utf-8?B?TDhUUVdUQm40L0o5cVJ1T1JZSjY4ZndqRDZLdy9jcVd1Qi9xZlZNM3Q3L0Zo?=
 =?utf-8?B?RkN4RUtUYnlOQ0FuczFoYitQTTI3SFllOHNkcGFORWQwQldITndrb3Mvb2Jm?=
 =?utf-8?B?MTNuWVRYZ1ljN1ZjS0gvZHNJNlR6NitPOCtQejhiN3lqWjZ2Y3c2R3pCbHZO?=
 =?utf-8?B?ZGtVNzBrUWpOSEhQSmJTT1BpVFVpMS9WaTc5cWJHRGMwbVk5ZHFjRVRvT1BX?=
 =?utf-8?B?c0tneTk4QnhGU1R1ZHdmUUNwOHVlVmRpSkVHMWx1bnhMNkNnNEdyZCttOWta?=
 =?utf-8?B?MWVKcVhlbW81L25RR09pdjJHNUorMTgraW5FcXNZSGtXOUdXUUVraEk1NGJ3?=
 =?utf-8?B?ZzFkbmxrczBwS0orVTE3TzJIa2QrMk9wYVRzd1ZOVWJmY1RCazJkVmxXaVNs?=
 =?utf-8?B?SWU5UmI4bVF1bUZLTk81ZE0rVWxJY1c1QnJGaGJhOCt1OW5sTmRWU0JkdEkw?=
 =?utf-8?B?NXBaaSt4aFQ3OE1wWkpsei9hU2JxMDRqcmdZSWNpNDdYejBiUDV2ajRXeTBx?=
 =?utf-8?B?ODYyU0V4NkhjRzJNZEQzVzdveWZkVkd4Q3p4QUkzLzRNc3BDeS9KcDZQR0Er?=
 =?utf-8?B?T0NkN3lTSm1HTlBzSU0vRDJUQWRSMVNHZUQ4VndMaGNsRkFYRnlYaUs1Q3d4?=
 =?utf-8?B?dkJ5ZTBLa2REL09BTUlNMkpaWDlnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 16:03:45.8912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b178d1d4-29c3-46be-a236-08de5a98fd0e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8023
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 16:04:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17028



On 1/23/2026 12:03 AM, Paresh Bhagat wrote:
> - Add 92-capture.conf for capture configuration
> - Add 90-multichannel.conf for multichannel setup
> - Add pipewire_1.0.9.bbappend recipe extension
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>   .../pipewire/pipewire/90-multichannel.conf      | 17 +++++++++++++++++
>   .../pipewire/pipewire/92-capture.conf           | 17 +++++++++++++++++
>   .../pipewire/pipewire_1.0.9.bbappend            | 14 ++++++++++++++
>   3 files changed, 48 insertions(+)
>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-multichannel.conf
>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/92-capture.conf
>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_1.0.9.bbappend
> 
> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-multichannel.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-multichannel.conf
> new file mode 100644
> index 00000000..1dd926bc
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-multichannel.conf
> @@ -0,0 +1,17 @@
> +context.objects = [
> +    {
> +        factory = adapter
> +        args = {
> +            factory.name     = api.alsa.pcm.sink
> +            node.name        = "alsa_multidac_8ch"
> +            node.description = "Multi-DAC 8ch Output"
> +            media.class      = "Audio/Sink"
> +
> +            api.alsa.path = "hw:0,0"
> +            api.alsa.disable-mmap = true
> +
> +            audio.channels = 8
> +            audio.position = [ FL FR FC LFE RL RR SL SR ]
> +        }
> +    }
> +]
> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/92-capture.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/92-capture.conf
> new file mode 100644
> index 00000000..b0871da2
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/92-capture.conf
> @@ -0,0 +1,17 @@
> +context.objects = [
> +    {
> +        factory = adapter
> +        args = {
> +            factory.name     = api.alsa.pcm.source
> +            node.name        = "alsa_multidac_4ch_capture"
> +            node.description = "ALSA 4ch Capture (L1 L2 R1 R2)"
> +            media.class      = Audio/Source
> +
> +            api.alsa.path = "hw:0,0"
> +            api.alsa.disable-mmap = true
> +
> +            audio.channels = 4
> +            audio.position = [ FL FR SL SR ]
> +        }
> +    }
> +]
> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire_1.0.9.bbappend b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_1.0.9.bbappend
> new file mode 100644
> index 00000000..29b17af3
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_1.0.9.bbappend


We do not directly bbappend recipes to maintain yoctoproject compatible 
status.  Please check other bbappends in meta-arago for examples on how 
to do this properly.  For example: 
meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend


This same comment applies to the other patches where you add bbappend 
files as well.


> @@ -0,0 +1,14 @@
> +SRC_URI += " \
> +    file://90-multichannel.conf \
> +    file://92-capture.conf \
> +"
> +
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> +
> +do_install:append() {
> +    install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
> +    install -m 0644 ${WORKDIR}/90-multichannel.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> +    install -m 0644 ${WORKDIR}/92-capture.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> +}
> +
> +FILES:${PN} += " ${sysconfdir}"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

