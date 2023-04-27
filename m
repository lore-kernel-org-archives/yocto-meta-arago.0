Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4D7C77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 18:46:33 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.74.1682621186717178112
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 11:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9612440C76;
	Thu, 27 Apr 2023 18:46:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5rxeOG_lsdNM; Thu, 27 Apr 2023 18:46:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4279D409B0;
	Thu, 27 Apr 2023 18:46:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E4544163842; Thu, 27 Apr 2023 14:45:36 -0400 (EDT)
Date: Thu, 27 Apr 2023 14:45:36 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: p-bhagat@ti.com
Cc: meta-arago@lists.yoctoproject.org, praneeth@ti.com, reatmon@ti.com,
	c-shilwant@ti.com, s-adivi@ti.com, g-gupta@ti.com,
	dannenberg@ti.com
Subject: Re: [meta-arago] [kirkstone][PATCH v3] meta-arago-distro: Add
 Jailhouse support for am62xx
Message-ID: <20230427184536.GL9226@denix.org>
References: <20230427095536.5959-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230427095536.5959-1-p-bhagat@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 27 Apr 2023 18:46:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14369

On Thu, Apr 27, 2023 at 03:25:36PM +0530, Paresh Bhagat via lists.yoctoproject.org wrote:
> Update arago conf to add support for jailhouse in am62xx.
> Update package group to add support for jailhouse for am62xx.
> 
> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf                       | 3 +++
>  meta-arago-distro/conf/distro/include/arago-prefs.inc          | 3 +++
>  .../packagegroups/packagegroup-arago-tisdk-addons.bb           | 1 +
>  3 files changed, 7 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 094e67da..3e4c4644 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -121,6 +121,9 @@ PACKAGECONFIG:append:pn-cairo = " egl glesv2"
>  PACKAGECONFIG:remove:pn-alsa-plugins = "pulseaudio"
>  RDEPENDS:pulseaudio-server:remove = "alsa-plugins-pulseaudio-conf"
>  
> +# Configure RAMFS for jailhouse linux-demo
> +JH_RAMFS_IMAGE = "tisdk-tiny-image"
> +
>  # Enable UI and scripting for perf
>  PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
>  
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index 34c3c539..c632e111 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -19,3 +19,6 @@ PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
>  #PREFERRED_PROVIDER_wpa-supplicant:ti33x = "wpa-supplicant-wl18xx"
>  #PREFERRED_PROVIDER_wpa-supplicant:ti43x = "wpa-supplicant-wl18xx"
>  #PREFERRED_PROVIDER_wpa-supplicant:omap-a15 = "wpa-supplicant-wl18xx"
> +
> +CREATE_SRCIPK:pn-jailhouse ?= "1"
> +SRCIPK_INSTALL_DIR:pn-jailhouse ?= "board-support/extra-drivers/${PN}-${PV}"

There's no SRCIPK any longer. Also, this was never in arago-prefs.inc


> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 8d8a36f6..66fa6451 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -59,6 +59,7 @@ UTILS:append:k3 = " mmc-utils \
>  
>  UTILS:append:k3 = " ti-rtos-firmware"
>  UTILS:append:am64xx = " pru-icss"
> +UTILS:append:am62xx = " pru-icss jailhouse"
>  UTILS:append:am65xx = " pru-icss"
>  UTILS:append:j721e = " pru-icss"
>  
> -- 
> 2.17.1

