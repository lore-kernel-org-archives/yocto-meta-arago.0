Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F34C7EE2F
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 22:16:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.314.1686089808358571206
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 15:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 360BD40AE9;
	Tue,  6 Jun 2023 22:16:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aRGHaEtDcIqm; Tue,  6 Jun 2023 22:16:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E93C440031;
	Tue,  6 Jun 2023 22:16:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 05D1116394F; Tue,  6 Jun 2023 18:15:55 -0400 (EDT)
Date: Tue, 6 Jun 2023 18:15:54 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: detheridge@ti.com, reatmon@ti.com, afd@ti.com,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH] arago.conf: make things
 more readable and fix the virtuals
Message-ID: <20230606221554.GT9226@denix.org>
References: <20230606191019.702649-1-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606191019.702649-1-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jun 2023 22:16:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14504

On Tue, Jun 06, 2023 at 02:10:19PM -0500, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Make things more readable and reliable by useing the built in boolean
> check instead of python's type casting. Drop the array indexing in favor
> of a more direct if else statememnt.

Heh, it's just a matter of personal preference :) Array indexing conditionals 
is how OE used to do things from the early days and I'm well used to that. But 
these days using Python if/else directly gained lots of traction, so why not?


> Also fix the virtual provider for login manager. There should only be 1
> login provider and it should be shadow-base for systemd *or* busybox for
> sysVinit systemd.
> 
> Also explicitly remove the sysvinit distro feature if ARAGO_SYSVINIT
> isn't set, because whatever arago inherits expects sysvinit for some
> reason. This should fix the duplicate init.d and systemd service files
> we've been seeing.

How much testing have you done with this change?

The reason it was done this way is because many packages only provided 
sysvinit rc scripts and not systemd unit files and we were relying on 
systemd-sysv-generator to handle those, which has dependency on "sysvinit" 
PACKAGECONFIG and DISTRO_FEATURES. There were fixes to handle duplications 
when both sysvinit rc script and systemd unit file are provided by a package 
and install only one of them. It was better than not having any startup script 
for a package at all.


> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 9164657c..6390a916 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -59,13 +59,14 @@ DISTRO_FEATURES_FILTER_NATIVESDK:append = " opencl opencv openmp"
>  
>  # Set global runtime providers for major components
>  ARAGO_SYSVINIT ?= "0"
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
>  # Distro-specific package configuration
>  PACKAGECONFIG:append:pn-systemd = " coredump"
> -- 
> 2.40.1

