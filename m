Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD38D46952
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 06:48:16 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62339.1769150889834209801
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 22:48:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=EKdXOLVb;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.44, mailfrom: y-hegde@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p43h+8NN6jRzpwiRVosRH/jSpU4cUzPt9gcflwrCQOgs8b6pv0V26qD71/GqTWAhbvs1ZBgo93X5roD7rXNC7cl30CFj2QLBeGMQyM/1rPwJLADvlcdjK8JRS9xBX6xZXMIm8xGeUeiNs2T4eRqV5edOET08tz3afZgK3k0PlPcHKe63OIP6G+qZ9DxEkcGW2j5lvEchmpchA4zd6SMbRMlDcrYtrRDbLLws/4iCUm916gy6pPLc2JVZ9LJNCS6ySdzCAc5DeTNO1Q+1BNhfCgoHxhxS5VoO5zYZ6DUTuEpIdzWz2ZMpBz66T6rEv9boivjRmTi+fR3zo8XzOWA1qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LP15bVsLIvPWBkC8es51x70EtbbHP2XRoKRzVyRHVh8=;
 b=S/tz5C35uSs8otYIcJ8kowO2oLRufnMdjwa3IOBLvDZbpGqIP1wtbdj06nd7G/3yJDDf6jue3zKykiu+xO7QT6rcnuwMHaIzSVpRBUzzoOcse+C17+jA/7Adpfx2EMVMRARoksjle2/d9kcLxGlHg0YM4EtlNUSmho825/Mvo14LcWrVgYWglUHwA3wNxrUI8YSKahut6ZDTAeyleCGdNZzHa3hMbzuC2+5sFZHpQ23xsCV/2GS1v2BnhUfSlP8r+UJk5lQXj1IlUvGndn+tBqLHFxOlRV3bWZVM4/LUUaPp++IcIilHHD9whgkLa7acFNtOr6Q/YJ9OYQwYOe/K/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LP15bVsLIvPWBkC8es51x70EtbbHP2XRoKRzVyRHVh8=;
 b=EKdXOLVbwl6mxwVi8n1nk6k9W9QhQ8zEvfxgmjm+NNwyWdi0JCKVgwtj+o9p3oWqgNRhZ+caEcnFkjDdFrdHxO8Tiotl1FsWGcSk+z4iewDf63SwuvL7IAa41pt1TZs5/oyaCG3siywT5hgh2g9Sct+bU9Gedpn2dEZOsm8G09Y=
Received: from BYAPR03CA0023.namprd03.prod.outlook.com (2603:10b6:a02:a8::36)
 by CH0PR10MB5179.namprd10.prod.outlook.com (2603:10b6:610:c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 06:48:05 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a02:a8:cafe::db) by BYAPR03CA0023.outlook.office365.com
 (2603:10b6:a02:a8::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.12 via Frontend Transport; Fri,
 23 Jan 2026 06:48:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 06:48:02 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 00:47:29 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 00:47:28 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 00:47:28 -0600
Received: from localhost (yogi-work-pc.dhcp.ti.com [10.24.72.146])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60N6lRJc1890670;
	Fri, 23 Jan 2026 00:47:28 -0600
Date: Fri, 23 Jan 2026 12:17:27 +0530
From: Yogesh Hegde <y-hegde@ti.com>
To: <p-bhagat@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
	<reatmon@ti.com>, <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>,
	<afd@ti.com>, <devarsht@ti.com>
Subject: Re: [meta-arago] [scarthgap][RFC PATCH 1/3] recipes-multimedia: Add
 pipewire configuration files
Message-ID: <20260123064727.w4tn7ckeqber4kcd@yogi-work-pc>
References: <20260123060348.2493115-1-p-bhagat@ti.com>
 <20260123060348.2493115-2-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260123060348.2493115-2-p-bhagat@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|CH0PR10MB5179:EE_
X-MS-Office365-Filtering-Correlation-Id: 722b7b38-ecb7-426a-51f2-08de5a4b5b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Nyi3fGJtLqdhWodzqpZyOyIAxsl1hddcPMNMDPLXxqcG0w3z492KqheoLITi?=
 =?us-ascii?Q?+Hy5xzhrzd4zwiiamAz/SmgQJTA2nklFn4Pv93PpjlqMVNkqxnxsEgTKE8aD?=
 =?us-ascii?Q?9aZMWSMLyj9/RoJuefO2zui/x7SeqdB5PHv3Ls+gH+68hVtqLulApOABeQPb?=
 =?us-ascii?Q?c2oos1QB8S0JROYe1mvH4JpqEKwHvP3P8fXTA5n3ZKNk1OdR04oYCO5GxIhW?=
 =?us-ascii?Q?vQyHpEL3XJZNK7OXyrLrjQMe+guBnAc70NRmaGkUOcCLh6cPBpYwaS3PZpsd?=
 =?us-ascii?Q?DBanyDOHmHBVBghYwhYHB6Jbo7mON0syhdjgmc+SlXhz2Uy+NhQcMQzN6ZVs?=
 =?us-ascii?Q?YxZrv0cYN16Xw4q9L+9LdDc6u+95M2upj4Q1UtAg8SYlaYgU3UnIFfUah95+?=
 =?us-ascii?Q?rKifR/cJk8HKYboR2zmh7x48X9c6/CQmnbNvHdIZCBGph9SIQNu/cuR+/bxu?=
 =?us-ascii?Q?cAfoPGGwOLVLPBaDxswpRKg4wVN62WUidsO2pgCReYcEnZCTWgzHicIxDd1A?=
 =?us-ascii?Q?kumw2oQVG92gS2pA8+cJIlie4KJuthT72zLzqkLqfgxFZvHLszjg3iw9+Jj3?=
 =?us-ascii?Q?YzIkv3Y1zlpco3LA8X5SgN89Kyed99/Pf77o+CiijWmTibn6a5zM3hIUvAPl?=
 =?us-ascii?Q?FWcc5eIjc4UWToz6Ct/+BJ3vIxlBuxXScLk+J4/PKEEi0Xe2X8tSCGmVeJqp?=
 =?us-ascii?Q?yq27dQibn+zsVUK03pwRYsyZ4/1IoARawIdT8ta07LoOardnxJasIVxNdWFA?=
 =?us-ascii?Q?latOZnsI25TvI6boygvvjhEQwxmgZzxRBkdxxfOjVsCfLfwEhw47FpjeiXo0?=
 =?us-ascii?Q?65SLKKj8O+fRldmj6iR7ddMfgLhDXXeNx/f76BELL/b4g9EceihL+dN1BzZd?=
 =?us-ascii?Q?sfFVUT46aB2hUk4YbB7VCzhd8Y/wSlLBpW5n3ToH5D8HvcZ7SQ3tzJfpN9EO?=
 =?us-ascii?Q?uL33ScqklTZw4PoyPqTpf4J+YcWE6sRR+a9TLPyRcJbl3NInx3VbaNFac2Fx?=
 =?us-ascii?Q?MEsevd/7AwRRk4EdSP0onD0T+GAFjWdIDO5AgMf7u27u/+fMrFCA834DLirg?=
 =?us-ascii?Q?0RmGur9QlaqRXVNfiOwmN1M/ru/RjqJZHghuQUqHmNVHMXioQbQEtyBHHTYb?=
 =?us-ascii?Q?KGwpmMXrFKL1HdhSSXjR5TJAT2LHasFe8F6wdes0MGKLQVY91y1sUmF4l1vE?=
 =?us-ascii?Q?ch/EVqPljs3NeR0BdkQPg/qb8XpVPaol/aU+UJM+J0gLNTkMcBLerGNU2EXt?=
 =?us-ascii?Q?KBNS/9gV5kSy9bsZhdPTmW5odhhZqCMk+DLc56HASvl78BXxIiwnca5j9Lqm?=
 =?us-ascii?Q?lbNVa8j80spa2hoUZ4c1eI59eqP6wED2WZQ+wgn4XTdJejC1T1CcOO7RpKw/?=
 =?us-ascii?Q?rzvHLPCFc8hp63FGJ/pL65hWvrjfxlh4EazKWbKoDnZ4l0p79RfTLlkPvdoq?=
 =?us-ascii?Q?RViRGt8qSRMyWRFZm1xt/ONRZd79jXFJ+RHps6l0knOj3HVxknyhOzs9Y0wO?=
 =?us-ascii?Q?3kwU9bVNAfMbpNdBL8i9GEvU6l6RmF4JPm5vmUDPedUpymMFs748xmuKQB/j?=
 =?us-ascii?Q?UkzrZQ7/JC4fZ0q2Var0HeAqIYLIYy/1jxgfQWK0LGqtaq2CU3m/9Uy6DonX?=
 =?us-ascii?Q?Qg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 06:48:02.9179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 722b7b38-ecb7-426a-51f2-08de5a4b5b16
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5179
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 06:48:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17025

Hi Paresh,

On 11:33-20260123, Paresh Bhagat via lists.yoctoproject.org wrote:
> - Add 92-capture.conf for capture configuration
> - Add 90-multichannel.conf for multichannel setup
> - Add pipewire_1.0.9.bbappend recipe extension
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>

Thanks for your patch! 

> ---
>  .../pipewire/pipewire/90-multichannel.conf      | 17 +++++++++++++++++
>  .../pipewire/pipewire/92-capture.conf           | 17 +++++++++++++++++
>  .../pipewire/pipewire_1.0.9.bbappend            | 14 ++++++++++++++
>  3 files changed, 48 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-multichannel.conf
>  create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/92-capture.conf
>  create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_1.0.9.bbappend
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

As per pipewire docs [0], Audio/Source should be in quotes. 

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
> @@ -0,0 +1,14 @@
> +SRC_URI += " \
> +    file://90-multichannel.conf \
> +    file://92-capture.conf \
> +"
> +
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

FILESEXTRAPATHS should be before SRC_URI so that bitbake knows where to
find files mentioned in the SRC_URI. 

> +
> +do_install:append() {
> +    install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
> +    install -m 0644 ${WORKDIR}/90-multichannel.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> +    install -m 0644 ${WORKDIR}/92-capture.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> +}
> +
> +FILES:${PN} += " ${sysconfdir}"

Nitpick, packaging entire ${sysconfdir} might not be a best practice, best
would be to package only the required files or the pipewire.conf.d dir. 

FILES:${PN} += "${sysconfdir}/pipewire/pipewire.conf.d/*.conf"

[0]: https://docs.pipewire.org/page_man_pipewire_conf_5.html

Regards, 
- Yogesh

