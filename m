Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D150D62602
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 07:08:36 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62556.1769152109805286667
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 23:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=PLKENlvJ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.46, mailfrom: y-hegde@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3D2rr0pCCyLOlxZdPNvReZcumz9BB0zr+TK9gTq0mp+nnTZpYzO8A5+y2T84NVaY4NHM0olVsAkGP6zrbiCFPc7wLMZRMokU2+4ofjpmSaXaEZxyxatVW5L0Gkqdh97ASsVQO2e7ahOjlVYlzPjrvrQY2llrqEcR5vbtsOhIAeoY/sUw5JEZbPdaSWdlHwfnNnLI+Sh7cRaqItYW3piaBlbN4b7hYKBrL/kqFmWAUbu/LTSyDPJTYWhYw/BJcmLqq97z2WwEJiWLulFbj49tOwcBtnnmvA8/5waHkYg389KGOBQrzi8onf5oft9gzQcJrnb3AeKdvoEJ1GSItn42Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klZ9A2sYcCqdxQzZSG4Gks5+5fMiyFXqvt8zAhf2mgk=;
 b=A8zhy+Q84EkYTcpzGGIY8o5sAli1RCcJTIDDWmzwFwrRf+SXEvM01wr00LANPP6GTPRq1yUoQolZzqzRNl5HHWHwKEsPLCf9/f4MmVenD9hHtkToIRrtd4YYhXUepa61tIQdJdN7IfiiOxBIWauHETfpeP1lwSJkv1VaoSVVLU3+GsIOCn5Q/IHDLReVRhsFWnlFdVReXy9ISOyC1hwMzVsqGwPEkqGiA/sR+OTuU2a/SUBReOpMoMjUbLXC1ny+UI9f77n233GZV6QcG3C9nD2CmPw9k3L9ez4Lr3a4zLLcMQq4AlFcZeXro2DgHn7dHx857sHnYZit5n/oDGJH6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klZ9A2sYcCqdxQzZSG4Gks5+5fMiyFXqvt8zAhf2mgk=;
 b=PLKENlvJhEwsSET8dU99H4dMUCTDkJViQiCsuVht7qPHs3nJW0qQRBp4f05rVU+uKsUU7ORArLLJq/NzRjpBRztpOIvpbYt2q+3+/7CFvxOnUoQMZ4xxi/guoAbdRvGj5wsxyFT8mkx8Qj5VqMJhXdYSUfpRYdLgEG8peZzhIpg=
Received: from PH7P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::17)
 by BY5PR10MB4227.namprd10.prod.outlook.com (2603:10b6:a03:208::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 07:08:27 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:510:326:cafe::16) by PH7P220CA0028.outlook.office365.com
 (2603:10b6:510:326::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 07:08:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 07:08:25 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 01:07:55 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 01:07:55 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 01:07:55 -0600
Received: from localhost (yogi-work-pc.dhcp.ti.com [10.24.72.146])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60N77sCj1784003;
	Fri, 23 Jan 2026 01:07:55 -0600
Date: Fri, 23 Jan 2026 12:37:54 +0530
From: Yogesh Hegde <y-hegde@ti.com>
To: <p-bhagat@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
	<reatmon@ti.com>, <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>,
	<afd@ti.com>, <devarsht@ti.com>
Subject: Re: [meta-arago] [scarthgap][RFC PATCH 2/3] recipes-multimedia: Add
 wireplumber audio configuration
Message-ID: <20260123070754.w36v7s6jvf5r6lkt@yogi-work-pc>
References: <20260123060348.2493115-1-p-bhagat@ti.com>
 <20260123060348.2493115-3-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260123060348.2493115-3-p-bhagat@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|BY5PR10MB4227:EE_
X-MS-Office365-Filtering-Correlation-Id: 019c395d-40bc-4824-0159-08de5a4e33e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0jzln+6LBlJu5dQAy3veGM9bD/zYK4CUD57yQGDdAIgwLAxOxHU/j/ZrGAXU?=
 =?us-ascii?Q?rgr1UGtbI2oxk3+Pc6DvqhbnVzFJ1rB++ZT7EIJSeC1xEmJsnpUfyiYVKe/k?=
 =?us-ascii?Q?HFuDpxS4FCu6i2aoEgqGTu1l9gMQ2H7VDW/38gkO10h981YqrGJQdumJJe2E?=
 =?us-ascii?Q?/Yr5dhiLCrrxc05j34mj6A7Hf6bkafOqt6VD7O4u8D/ufZVc1I8/oUPIy3KO?=
 =?us-ascii?Q?mSSpVwJmpJ28Zsc+T03oLrXtjyBiyftE3jp8+fhdgmvUam/LMa2XrGdkUOXJ?=
 =?us-ascii?Q?jIEhvEe3PGpd+ld3focllafAiDYf7WB9cuKiF39MtHaqOy9OiFyQfiq3UtJy?=
 =?us-ascii?Q?BJG/2BsMU+MWtNzBgUlhhmp3/Ztz+fSELjaioBnaSkyH7FSce85t42E5HrZk?=
 =?us-ascii?Q?Wi8gkYoPWlYKBGWL4rHeI/TzTPA1gXqabvED4vbxj8l9vDavFUnK17wDE5F2?=
 =?us-ascii?Q?T+8k7gZlFDhObHZFivM5s6nRfVnDgy1rnN+tG1fU3QI7NNnJcsa41Jgal0PG?=
 =?us-ascii?Q?lUT7PamoW3d6oYhmAXzbem0MaJk1ROnTW+Diids3kdY5mr0kn80kUA/PalKt?=
 =?us-ascii?Q?tNaFlphFg1nSIH1n+L0H65l3RxTMFCibP5pxsDk9bOth1DYtEXi7GCIToKQB?=
 =?us-ascii?Q?h92PIoX4/WLppc6aglLwK52QMQT9qeK2nnkXTjoCkYVjbqzvyPExinXNA7Sj?=
 =?us-ascii?Q?I2GBOd5C62nmFp8XHzTRzxU2IAyT5LDNBVPvCYHJD6O25AqfaHcvjgnmhX+F?=
 =?us-ascii?Q?2uLAJ+2POtXFkhv7HwYOQHCQ6vpKqoZRWSr3iUYbJ+hYZvcT5Y2TJlpAAjR2?=
 =?us-ascii?Q?2GU1sLD5L2fBwVLkmlEBJC9cuncNcmEMI7UUgVJKsjsztfyyDtPQf2XN0RQS?=
 =?us-ascii?Q?V6vlVF7LdhYBcZMx2adSIy9cvVrCLqe2Nl3v9vwjJ5kAZxmWSSqmyPoZZp5a?=
 =?us-ascii?Q?+p2mJc1rL7eO/CZxmnwnQXHgrSD7CoTvsaumfg2cgJv3yuhokozELxT7FBKt?=
 =?us-ascii?Q?218JWVNKCgSxQ/d6fdLAzK+/mcRN62+V61plVNPjdz+gTpPLaTC3me+H0h5D?=
 =?us-ascii?Q?qL7B88ss/KrVQ7JTNsa5AEWsHBqBir6mxz3r8ULTpLSxefd86Mt3pOap85Ns?=
 =?us-ascii?Q?uwCIZhjWZrazmPJfmbxQ3DI5R1XkJoK5So9sdL9tS7EL037l/r9TIK2+CM0z?=
 =?us-ascii?Q?n7R1kK/eJXOjJQDWdVcI0NDlcoo1eLupYQ5WkpJUNrikbJax0uc/NRTpcnkz?=
 =?us-ascii?Q?8ZTZjtCN9t5ojBOEST/WldZpArMcOh9Y5SzxmlsMciLTvDLYly6Z701zCtfE?=
 =?us-ascii?Q?CgzDjU1toCBROJiqwKQQZWFVul8Vc92LRI9zG0mKxAL6nR/zTua+1cEpj/kE?=
 =?us-ascii?Q?B9Q4rd00yuTImGrTVnhUr9TZZ67CQKFlIwvNG4ofYO5bN/SpmY7o6KWbvjgn?=
 =?us-ascii?Q?NVhWY83MmEvHwZSBtmk38+EDkeSKfI+3aIPMPd0imJQBtG5KrLgUK5f9dGQn?=
 =?us-ascii?Q?FRgm31cVWR3ciZ60sDWHGl64a1wjo5aooiDX8aVRUQhkm6mJMu0PKEpY3LY0?=
 =?us-ascii?Q?yZPb7/cd8cuo9xPlrNegj2Izb05lex8KvTnCe5Iwdl411VFtA59pT/3OztwY?=
 =?us-ascii?Q?TQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 07:08:25.7062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 019c395d-40bc-4824-0159-08de5a4e33e6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4227
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 07:08:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17026

Hi Paresh, 

On 11:33-20260123, Paresh Bhagat via lists.yoctoproject.org wrote:
> - Add set-audio-defaults.sh script for audio setup
> - Add set-audio-defaults.service systemd service
> - Add wireplumber_0.5.1.bbappend recipe extension
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>

Thanks for your patch!

> ---
>  .../wireplumber/set-audio-defaults.service    | 14 +++++++++
>  .../wireplumber/set-audio-defaults.sh         | 30 +++++++++++++++++++
>  .../wireplumber/wireplumber_0.5.1.bbappend    | 25 ++++++++++++++++
>  3 files changed, 69 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
>  create mode 100755 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
>  create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_0.5.1.bbappend
> 
> diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
> new file mode 100644
> index 00000000..18881553
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
> @@ -0,0 +1,14 @@
> +[Unit]
> +Description=Set PipeWire Default Audio Devices
> +After=wireplumber.service
> +Wants=wireplumber.service

As per the systemd manual [0], with "Wants=" the service will still run
if wireplumber fails. From the script below I see that is not the
intension. "Requires=" would be the correct way. 

> +
> +[Service]
> +Type=oneshot
> +ExecStart=/usr/bin/set-audio-defaults.sh
> +StandardOutput=append:/var/log/set-audio-defaults-output.log
> +StandardError=append:/var/log/set-audio-defaults-error.log
> +RemainAfterExit=yes
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
> new file mode 100755
> index 00000000..cd193d02
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
> @@ -0,0 +1,30 @@
> +#!/bin/bash
> +
> +# Wait for WirePlumber to be ready
> +for i in {1..30}; do
> +    wpctl status &>/dev/null && break
> +    sleep 1
> +done
> +
> +# Additional delay for nodes to appear
> +sleep 2
> +
> +# Find McASP sink ID
> +SINK_ID=$(pw-cli info alsa_multidac_8ch 2>/dev/null | head -n 1 | awk '{print $2}')
> +if [[ -n "$SINK_ID" ]]; then
> +    wpctl set-default "$SINK_ID"
> +    echo "Set default sink to ID: $SINK_ID (alsa_multidac_8ch)"
> +else
> +    echo "Could not find alsa_multidac_8ch sink"
> +fi
> +
> +# Find PCM source ID
> +SOURCE_ID=$(pw-cli info alsa_multidac_4ch_capture 2>/dev/null | head -n 1 | awk '{print $2}')
> +if [[ -n "$SOURCE_ID" ]]; then
> +    wpctl set-default "$SOURCE_ID"
> +    echo "Set default source to ID: $SOURCE_ID (alsa_multidac_4ch_capture)"
> +else
> +    echo "Could not find alsa_multidac_4ch_capture"
> +fi
> +
> +echo "Done"
> diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_0.5.1.bbappend b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_0.5.1.bbappend
> new file mode 100644
> index 00000000..f6e5ff91
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_0.5.1.bbappend
> @@ -0,0 +1,25 @@
> +SRC_URI += " \
> +    file://set-audio-defaults.sh \
> +    file://set-audio-defaults.service \
> +"
> +
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

FILESEXTRAPATHS should be before SRC_URI. 

> +
> +do_install:append() {
> +    # Install the script
> +    install -d ${D}${bindir}
> +    install -m 0755 ${WORKDIR}/set-audio-defaults.sh ${D}${bindir}/
> +
> +    # Install the systemd service
> +    install -d ${D}${systemd_system_unitdir}
> +    install -m 0644 ${WORKDIR}/set-audio-defaults.service ${D}${systemd_system_unitdir}/
> +}
> +
> +inherit systemd

As per yocto docs [1], systemd bbclass will take care of installing the service files 
and the lines installing the service files can be dropped. But for this
to work inherit systemdm, should be above do_install(). 

> +
> +RDEPENDS:${PN} += "bash"
> +SYSTEMD_SERVICE:${PN} = "set-audio-defaults.service"
> +
> +FILES:${PN} += " \
> +    ${bindir} \
> +"
> -- 
> 2.34.1
> 

[0]: https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html?__goaway_challenge=meta-refresh&__goaway_id=43a15b62025865117ca287aaee83857e
[1]: https://docs.yoctoproject.org/5.0.15/ref-manual/classes.html#systemd

Regards, 
- Yogesh

