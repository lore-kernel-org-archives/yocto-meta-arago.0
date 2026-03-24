Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1214AF54ABA
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 14:06:38 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20550.1774361189832757267
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 24 Mar 2026 07:06:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=VRJYu/RE;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.62, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kdto61ScHBRETGloSB6ainVQk6y25+mnNm23Xta6fZSEDnBYLwFv4UwJCwX/UGoFJ0YtolkAfaUfSUTR5sVRODCMtYMwKcTDScvRikn7lvDjdlWFhOG66kZHfMnhyPa61C4Hp4Hesp9XkofghMFKDDXEAWHBj11m7xUOcE3vwHFbj7UAK4lKM64Krt6d0AbmNYRVPiKWDnEHWdrpxQLf+d7OZMCVyf1jpD8sf6KUigfFz7Swn8VaH6T88Zm0y1jLt2GHdImCViVAzUW7rFaUKSI9qF+sBXsrxLkpY7wVUIQw8dsmd2lfJYrhTgbN184RIGNwDgaUwi4r7WwQfznMVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUEI77hrf88va524lHZtV6fbVeXam47rpGwEtogvUEs=;
 b=LnSbacf6V3bKm8UwFzNESZidcNxJoE3TuAm0Gy5G7PK6bA0qzdrZNe1L4wMqzk0ipPrYIN8EVYoD86Mk4hklU53o6lDN0Dl26yI60PWSjoMLqkfAxWEaoIPJFAJtBm9AjmSunqFx0L0GfWniHn0lJOAzoywBfuMMHGIdphli6LFASpes9DPFdu7R+dkrNGxWL2M7RYAXX+06o0V/RHODN2jBLmB1noYBQN6ALJS1ngY+5IIhEkNPVG9b9MkVO4b2PYKQG7TVG/2qY0UzZ2fE+yThT7Bira8ELQJeIXxdzMmbcZ55oF832xboKNNpI3hdngiEwo+yl8i+25v3kv9vCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUEI77hrf88va524lHZtV6fbVeXam47rpGwEtogvUEs=;
 b=VRJYu/REjYpsBKCl2TtDbhLUpp/fhZ8e1zN1vi62u0g2FKpcLDrXnXOTR74dkRnvejMp4mV4/c1D0TY7AyzKvM94X1LxdM5kmuax7MS64FGKIVcEyOyWk+I6h14Nk9+M57WlIktmmWCoNrJ8bkGvzU3oKSrD0S232zxDqVA0XwU=
Received: from PH3PEPF000040AD.namprd05.prod.outlook.com (2603:10b6:518:1::58)
 by MW4PR10MB5839.namprd10.prod.outlook.com (2603:10b6:303:18f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 14:06:27 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2a01:111:f403:f90f::2) by PH3PEPF000040AD.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 14:06:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 14:06:25 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 09:06:09 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 09:06:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Mar 2026 09:06:08 -0500
Received: from [128.247.81.216] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62OE68VU2746667;
	Tue, 24 Mar 2026 09:06:08 -0500
Message-ID: <16006872-4b4c-4ec8-962a-6a25be82a9c7@ti.com>
Date: Tue, 24 Mar 2026 09:06:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][oe-layersetup][master][PATCH] arago-master: Update
 meta-browser commit SHA
To: Thorsten Lannynd <t-lannynd@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <b-brnich@ti.com>
References: <20260324130118.551882-1-t-lannynd@ti.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <20260324130118.551882-1-t-lannynd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|MW4PR10MB5839:EE_
X-MS-Office365-Filtering-Correlation-Id: 384a395d-7902-401e-5ae1-08de89ae894a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Gu0gPHk7Vt0hkZ5T5aT2QzlCMCLyGOxb/Bw/hNkNrH2qZ8hu634P5qe8369WESj7gFYJunsM2yRn2onu8xhVbh4ICJq7Kzn/9Hib+ZXDf1pq+wMCm+DnSgnZN9lbGhaZxPKj81DUxMzJn4/7qei5Yk7d5K3AZPuciajnESg1GFM/2E1lYh44bwtVsUUQJYQeC2H1nOIBdzzRhWqIKWX3UN00dj03sqHt4aXp9SvosY0lG6PEtW47OVoRYr4ic6qeIKiCuWtVLML03okVcG3omu6Mu8/pK478wjoop5j84vliEmmHfMOvdLru/Wvy/vR7kg2T4wGvv6/O+DXe6msVBTmypijV/3js0FxtWZqiVmeZQJZAzNEkI6kg2ywyR25gSaaOhsw79oUG1gmOWkjzAye/cXmJ0TMGUuFxMe3v/4p7MtP4XOEkh5pBTAxzfarHt+r2/zCk982X3rOhGPckt1VXB6IXxOCui/KJ//NcmETy5AgJ/QO/vmEi1Kd3QFyMQdfYeylnDCeuc39vPVkPXTwW7UMbgPpT6NqhFNQlvHSdMcT7WMGNU9cbITVSRRefH3vkhoavpgy6OcVGK1b/DugejojACP5UkIMDUH99HQbetTxesSMANne0ARCY/TWZU0RGojQ4nNj9kPRB9m0npDkqtJETn8UNVXXaidDo3e8KQpWqXqOXX6C3PYJgj7ZHJIIp3RePkvqjp7bVFAwEM47SOxhytAtSwQgD5oz2Hio=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7ne3VS5TSbsRjoNDvqDMHPA/FUMcWwuvSjcrpQnpX4ojZwsvmJVizqWz5W0qP9xh35v/CLyrDrGtiCfwPFL2cxr3t9nFrOTBLtwfN94hEkB/YUDbnJi2QxeQnMLpDJFq2YGShbwiK/PPWRuYjU1TrUVmBbGOeceKeUJxv8CU+Zfq2yscttrFgz9j7WCwGPvaH/rGmkbq8qyhq+JWJ8dxcPGDuAU8GnYt4wRuNYnXZUxNgNRLZ8Ack0t9iyc1D1Z3IiyhFxosfniDNlsnQBNvKHVaFd0pctZOiqvixMSddAov+hVPj9J98gTV9VGjTjUJsWGgl8jTz90oCOC5Ff2YOI7yIRe14VRa8UsbND3e65vRjtEaYoLZrxh7UzhahP+PRBWSUD+DAZh5SYHu9/dZ04BIODxAkQINh96LRcd8wAxMYYPGrsslCxJ3zsSJwoWG
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:06:25.3130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 384a395d-7902-401e-5ae1-08de89ae894a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5839
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 24 Mar 2026 14:06:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17427

Tested this configuration and it works.

Thank you Thorsten.

On 3/24/26 8:01 AM, Thorsten Lannynd wrote:
> Update meta-browser layer to commit e252b51f which fixes the layer.conf
> incompatibility with wrynose and adds multiple fixes for v142
>
> Patch Notes:
> https://github.com/OSSystems/meta-browser/commit/e252b51fd261a4cb05be932f0143ac444693a1ea
>
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ---
>
> This patch requires on meta-arago: `Revert: chromium: Add a patch to fix
> build against GLIBC 2.43` to build successfully
>
>   configs/arago-master-chromium-config.txt     | 2 +-
>   configs/arago-master-config.txt              | 2 +-
>   configs/arago-master-next-config.txt         | 2 +-
>   configs/arago-master-selinux-config.txt      | 2 +-
>   configs/arago-master-wip-config.txt          | 2 +-
>   kas/arago-master-chromium-config.yml         | 2 +-
>   src/configs/arago-master-chromium-config.xml | 2 +-
>   src/configs/arago-master-config.xml          | 2 +-
>   src/configs/arago-master-next-config.xml     | 2 +-
>   src/configs/arago-master-selinux-config.xml  | 2 +-
>   src/configs/arago-master-wip-config.xml      | 2 +-
>   11 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/configs/arago-master-chromium-config.txt b/configs/arago-master-chromium-config.txt
> index e1fda52..1a2a0f1 100644
> --- a/configs/arago-master-chromium-config.txt
> +++ b/configs/arago-master-chromium-config.txt
> @@ -4,7 +4,7 @@
>   bitbake,https://git.openembedded.org/bitbake,master,HEAD
>   meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
>   #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
> -meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f14862f261623d48f412af0be94a6721ade3930,layers=meta-chromium
> +meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51fd261a4cb05be932f0143ac444693a1ea,layers=meta-chromium
>   #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
>   meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=
>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
> diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
> index 53262bb..132a505 100644
> --- a/configs/arago-master-config.txt
> +++ b/configs/arago-master-config.txt
> @@ -4,7 +4,7 @@
>   bitbake,https://git.openembedded.org/bitbake,master,HEAD
>   meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
>   #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
> -#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f14862f261623d48f412af0be94a6721ade3930,layers=meta-chromium
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51fd261a4cb05be932f0143ac444693a1ea,layers=meta-chromium
>   #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
>   meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=
>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
> diff --git a/configs/arago-master-next-config.txt b/configs/arago-master-next-config.txt
> index 0644138..1744c2f 100644
> --- a/configs/arago-master-next-config.txt
> +++ b/configs/arago-master-next-config.txt
> @@ -12,7 +12,7 @@ MOTD: NOTE:
>   bitbake,https://git.openembedded.org/bitbake,master,HEAD
>   meta-arago,https://git.yoctoproject.org/meta-arago,master-next,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
>   #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
> -#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f14862f261623d48f412af0be94a6721ade3930,layers=meta-chromium
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51fd261a4cb05be932f0143ac444693a1ea,layers=meta-chromium
>   #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
>   meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=
>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
> diff --git a/configs/arago-master-selinux-config.txt b/configs/arago-master-selinux-config.txt
> index cd0ca0e..96c8dd5 100644
> --- a/configs/arago-master-selinux-config.txt
> +++ b/configs/arago-master-selinux-config.txt
> @@ -4,7 +4,7 @@
>   bitbake,https://git.openembedded.org/bitbake,master,HEAD
>   meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
>   #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
> -#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f14862f261623d48f412af0be94a6721ade3930,layers=meta-chromium
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51fd261a4cb05be932f0143ac444693a1ea,layers=meta-chromium
>   meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
>   meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=
>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
> diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip-config.txt
> index 1ad6f58..9f38a6d 100644
> --- a/configs/arago-master-wip-config.txt
> +++ b/configs/arago-master-wip-config.txt
> @@ -4,7 +4,7 @@
>   bitbake,https://git.openembedded.org/bitbake,master,HEAD
>   meta-arago,https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
>   #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
> -#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f14862f261623d48f412af0be94a6721ade3930,layers=meta-chromium
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51fd261a4cb05be932f0143ac444693a1ea,layers=meta-chromium
>   #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
>   meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=
>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
> diff --git a/kas/arago-master-chromium-config.yml b/kas/arago-master-chromium-config.yml
> index b114247..3c83535 100644
> --- a/kas/arago-master-chromium-config.yml
> +++ b/kas/arago-master-chromium-config.yml
> @@ -27,7 +27,7 @@ repos:
>     meta-browser:
>       url: "https://github.com/OSSystems/meta-browser.git"
>       branch: "master"
> -    commit: "5f14862f261623d48f412af0be94a6721ade3930"
> +    commit: "e252b51fd261a4cb05be932f0143ac444693a1ea"
>       path: "sources/meta-browser"
>       layers:
>         meta-chromium:
> diff --git a/src/configs/arago-master-chromium-config.xml b/src/configs/arago-master-chromium-config.xml
> index c242124..ba8ff60 100644
> --- a/src/configs/arago-master-chromium-config.xml
> +++ b/src/configs/arago-master-chromium-config.xml
> @@ -23,7 +23,7 @@
>                   <layer>meta-flutter-apps</layer>
>               </layers>
>           </repo>
> -        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='5f14862f261623d48f412af0be94a6721ade3930'>
> +        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='e252b51fd261a4cb05be932f0143ac444693a1ea'>
>               <layers>
>                   <layer>meta-chromium</layer>
>               </layers>
> diff --git a/src/configs/arago-master-config.xml b/src/configs/arago-master-config.xml
> index 28cd760..c058317 100644
> --- a/src/configs/arago-master-config.xml
> +++ b/src/configs/arago-master-config.xml
> @@ -23,7 +23,7 @@
>                   <layer>meta-flutter-apps</layer>
>               </layers>
>           </repo>
> -        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='5f14862f261623d48f412af0be94a6721ade3930' disabled='true'>
> +        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='e252b51fd261a4cb05be932f0143ac444693a1ea' disabled='true'>
>               <layers>
>                   <layer>meta-chromium</layer>
>               </layers>
> diff --git a/src/configs/arago-master-next-config.xml b/src/configs/arago-master-next-config.xml
> index 8a7e009..14b0e88 100644
> --- a/src/configs/arago-master-next-config.xml
> +++ b/src/configs/arago-master-next-config.xml
> @@ -24,7 +24,7 @@
>                   <layer>meta-flutter-apps</layer>
>               </layers>
>           </repo>
> -        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='5f14862f261623d48f412af0be94a6721ade3930' disabled='true'>
> +        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='e252b51fd261a4cb05be932f0143ac444693a1ea' disabled='true'>
>               <layers>
>                   <layer>meta-chromium</layer>
>               </layers>
> diff --git a/src/configs/arago-master-selinux-config.xml b/src/configs/arago-master-selinux-config.xml
> index b09a45c..0ac2929 100644
> --- a/src/configs/arago-master-selinux-config.xml
> +++ b/src/configs/arago-master-selinux-config.xml
> @@ -23,7 +23,7 @@
>                   <layer>meta-flutter-apps</layer>
>               </layers>
>           </repo>
> -        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='5f14862f261623d48f412af0be94a6721ade3930' disabled='true'>
> +        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='e252b51fd261a4cb05be932f0143ac444693a1ea' disabled='true'>
>               <layers>
>                   <layer>meta-chromium</layer>
>               </layers>
> diff --git a/src/configs/arago-master-wip-config.xml b/src/configs/arago-master-wip-config.xml
> index 497f431..6e401bd 100644
> --- a/src/configs/arago-master-wip-config.xml
> +++ b/src/configs/arago-master-wip-config.xml
> @@ -23,7 +23,7 @@
>                   <layer>meta-flutter-apps</layer>
>               </layers>
>           </repo>
> -        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='5f14862f261623d48f412af0be94a6721ade3930' disabled='true'>
> +        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='e252b51fd261a4cb05be932f0143ac444693a1ea' disabled='true'>
>               <layers>
>                   <layer>meta-chromium</layer>
>               </layers>

