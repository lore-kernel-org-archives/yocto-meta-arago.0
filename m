Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022E4EB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 17:08:47 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.18353.1686762522457543020
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 10:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oKBaYfbi;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35EH8UOp097137;
	Wed, 14 Jun 2023 12:08:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686762510;
	bh=LNWKYq//y4he5xyy+7M73toPmKaIkP1Ho9j1E0N6A+o=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=oKBaYfbi6z9MMMHxmOZBceH8H7fLNcq0cwQDcoNs9dpBnxzCxs9xEhatzoNOroPat
	 X8cvX3hu+Zo4bL3z1EIa1kY8uqOxL8H0p6Y73k7UB2Zi9x2txXYenerz/5QSdm38YW
	 UIXTZmVgeRNb8e0v4MI/5F7EHeftaJp12mH2FX/k=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35EH8UXL112230
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Jun 2023 12:08:30 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 12:08:29 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 12:08:29 -0500
Received: from [10.250.37.94] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35EH8T9u075547;
	Wed, 14 Jun 2023 12:08:29 -0500
Message-ID: <eb09b794-5dfb-c745-7c2d-6cb151726342@ti.com>
Date: Wed, 14 Jun 2023 12:08:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][master/kirkstone][PATCHv2 1/4] arago.conf: make
 things more readable and fix the virtuals
Content-Language: en-US
To: <rs@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
References: <20230614163814.3562779-1-rs@ti.com>
 <20230614163814.3562779-2-rs@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230614163814.3562779-2-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 17:08:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14627

On 6/14/23 11:38 AM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Make things more readable and reliable by useing the built in boolean

s/useing/using



> check instead of python's type casting. Drop the array indexing in favor
> of a more direct if else statememnt.

s/statememnt/statement

Otherwise for the whole series LGTM,

Reviewed-by: Andrew Davis <afd@ti.com>

> 
> Also fix the virtual provider for login manager. There should only be 1
> login provider and it should be shadow-base for systemd *or* busybox for
> sysVinit systemd.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-arago-distro/conf/distro/arago.conf | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 59ee9926..2606ca39 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -59,13 +59,13 @@ DISTRO_FEATURES_FILTER_NATIVESDK:append = " opencl opencv openmp"
>   
>   # Set global runtime providers for major components
>   ARAGO_SYSVINIT ?= "0"
> -VIRTUAL-RUNTIME_dev_manager = "${@["udev", "systemd"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
> -VIRTUAL-RUNTIME_init_manager = "${@["sysvinit", "systemd"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
> -VIRTUAL-RUNTIME_initscripts = "${@["initscripts", "systemd-compat-units"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
> -VIRTUAL-RUNTIME_initramfs = "${@["sysvinit-initramfs", "systemd-initramfs"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
> -VIRTUAL-RUNTIME_login_manager = "busybox shadow"
> +VIRTUAL-RUNTIME_dev_manager = "${@'udev' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd'}"
> +VIRTUAL-RUNTIME_init_manager = "${@'sysvinit' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd'}"
> +VIRTUAL-RUNTIME_initscripts = "${@'initscripts' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd-compat-units'}"
> +VIRTUAL-RUNTIME_initramfs = "${@'sysvinit-initramfs' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd-initramfs'}"
> +VIRTUAL-RUNTIME_login_manager = "${@'busybox' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'shadow-base'}"
>   
> -DISTRO_FEATURES:append = "${@[""," systemd"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
> +DISTRO_FEATURES:append = " ${@'' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else ' systemd'}"
>   
>   # Distro-specific package configuration
>   PACKAGECONFIG:append:pn-systemd = " coredump"

