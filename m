Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F069C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 21:15:28 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.898.1686086124486441812
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 14:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yeWh7lIW;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 356LFMqB109641;
	Tue, 6 Jun 2023 16:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686086122;
	bh=PWdUZPolhraJwtVFnt5ymN04DUN7NnvXMCUrFzgohmw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yeWh7lIW29MVRx5rkcnWbj3+XaN+zW94adpNSYqa/yBj6JpXk8M6JFL9epNXncFEa
	 DXQNVcKUm4d99uTWZa29C9forK8rrXnqkGZ3PZUGGbbcsGDPEtgD3qtr3MNLakcXwC
	 EmhW3iMpq6zHIFfsoV+cVcmhcbDTcQ0k+lO4OgWs=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 356LFMX6094335
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Jun 2023 16:15:22 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 16:15:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 16:15:21 -0500
Received: from [10.250.37.94] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 356LFLUk048073;
	Tue, 6 Jun 2023 16:15:21 -0500
Message-ID: <c5e90f51-940d-bdf8-82f6-01702e3c7394@ti.com>
Date: Tue, 6 Jun 2023 16:15:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][master/kirkstone][PATCH] arago.conf: make things
 more readable and fix the virtuals
To: <rs@ti.com>, <denis@denix.org>, <detheridge@ti.com>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20230606191019.702649-1-rs@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230606191019.702649-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jun 2023 21:15:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14502

On 6/6/23 2:10 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Make things more readable and reliable by useing the built in boolean
> check instead of python's type casting. Drop the array indexing in favor
> of a more direct if else statememnt.
> 
> Also fix the virtual provider for login manager. There should only be 1
> login provider and it should be shadow-base for systemd *or* busybox for
> sysVinit systemd.
> 
> Also explicitly remove the sysvinit distro feature if ARAGO_SYSVINIT
> isn't set, because whatever arago inherits expects sysvinit for some
> reason. This should fix the duplicate init.d and systemd service files
> we've been seeing.
> 

Probably could have been two patches.. both look like good fixes though,

Reviewed-by: Andrew Davis <afd@ti.com>

> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-arago-distro/conf/distro/arago.conf | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 9164657c..6390a916 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -59,13 +59,14 @@ DISTRO_FEATURES_FILTER_NATIVESDK:append = " opencl opencv openmp"
>   
>   # Set global runtime providers for major components
>   ARAGO_SYSVINIT ?= "0"
> -VIRTUAL-RUNTIME_dev_manager = "${@["udev", "systemd"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
> -VIRTUAL-RUNTIME_init_manager = "${@["sysvinit", "systemd"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
> -VIRTUAL-RUNTIME_initscripts = "${@["initscripts", "systemd-compat-units"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
> -VIRTUAL-RUNTIME_initramfs = "${@["sysvinit-initramfs", "systemd-initramfs"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
> -VIRTUAL-RUNTIME_login_manager = "busybox shadow"
> -
> -DISTRO_FEATURES:append = "${@[""," systemd"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
> +VIRTUAL-RUNTIME_dev_manager = "${@ 'udev' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd'}"
> +VIRTUAL-RUNTIME_init_manager = "${@ 'sysvinit' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd'}"
> +VIRTUAL-RUNTIME_initscripts = "${@ 'initscripts' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd-compat-units'}"
> +VIRTUAL-RUNTIME_initramfs = "${@ 'sysvinit-initramfs' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd-initramfs'}"
> +VIRTUAL-RUNTIME_login_manager = "${@ 'busybox' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'shadow-base'}"
> +
> +DISTRO_FEATURES:append = "${@ '' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else ' systemd'}"
> +DISTRO_FEATURES:remove = "${@ '' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else ' sysvinit'}"
>   
>   # Distro-specific package configuration
>   PACKAGECONFIG:append:pn-systemd = " coredump"

