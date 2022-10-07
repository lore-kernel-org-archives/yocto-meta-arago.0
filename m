Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B934CC433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 20:47:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.698.1665175655268004707
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 07 Oct 2022 13:47:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5846840DC0;
	Fri,  7 Oct 2022 20:10:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P00j0aKLHVG9; Fri,  7 Oct 2022 20:10:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2EC7840DBF;
	Fri,  7 Oct 2022 20:10:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CD3C1174A18; Fri,  7 Oct 2022 16:10:14 -0400 (EDT)
Date: Fri, 7 Oct 2022 16:10:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH 7/7] meta-arago: Use new
 J7 SoC names over specific board names
Message-ID: <20221007201014.GA30861@denix.org>
References: <20221006150628.17044-1-afd@ti.com>
 <20221006150628.17044-7-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006150628.17044-7-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 07 Oct 2022 20:47:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14060

On Thu, Oct 06, 2022 at 10:06:28AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> Now that we have SoC names, we can avoid adding features based on the
> board name. We expect folks to create their own boards based on these
> SoCs, and so using the TI made EVM board name everywhere adds extra churn
> when adding a new board. Plus it is more correct for most of these
> features as they depend on the SoC, not on the EVM board.
> 
> One other thing we do here is to not use the generic "j7" name,
> the current and future J7 devices are far to feature diverse
> to group at this level. Grouping like that will lead to the wrong
> things getting enabled as new J7 SoCs are added.

Hmm, this second part is rather backwards (IMO) in some places, see below.


> diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> index 3c31ba18..296eef7a 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> +++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> @@ -24,7 +24,9 @@ DTB_FILTER:am57xx-hs-evm = "${DTB_FILTER:am57xx-evm}"
>  DTB_FILTER:ti43x = "am43"
>  DTB_FILTER:omapl138 = "da850"
>  DTB_FILTER:am65xx = "am65"
> -DTB_FILTER:j7 = "j721e"
> +DTB_FILTER:j721e = "j721e"
> +DTB_FILTER:j7200 = "j7200"
> +DTB_FILTER:j721s2 = "j721s2"

Yes, here it does make perfect sense.


> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index f4e72a89..c01e9497 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -61,9 +61,9 @@ UTILS:append:am64xx = " ti-rtos-firmware pru-icss"
>  UTILS:append:am62xx = " ti-rtos-firmware"
>  #UTILS:append:am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
>  UTILS:append:am65xx = " ti-rtos-firmware pru-icss"
> -UTILS:append:j7 = " ti-rtos-firmware"
> -UTILS:append:j721e-evm = " pru-icss"
> -UTILS:append:j721e-hs-evm = " pru-icss"
> +UTILS:append:j721e = " ti-rtos-firmware pru-icss"
> +UTILS:append:j7200 = " ti-rtos-firmware"
> +UTILS:append:j721s2 = " ti-rtos-firmware"

Here - not so much. ti-rtos-firmware is applicable to all j7. So, I'd leave 
that line alone and only replace adding pru-icss to specific EVMs to adding it 
to j721e SoC family.

Or go even further - ti-rtos-firmware is common to all k3 platforms, so all 
the individual am65xx, am64xx and am62xx, along with j7, could be replaced 
with one line:

UTILS:append:k3 = " ti-rtos-firmware"

And then add pri-icss or other extra FW to specific SoC families only.


> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
> index e16e4d51..e6e0b915 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
> @@ -19,7 +19,9 @@ ANALYTICS = ""
>  #    ${@['','qt-opencv-opencl-opengl-multithreaded'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
>  #    ${@['','barcode-roi'][oe.utils.all_distro_features(d, 'opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
>  #"
> -ANALYTICS:j7 = ""
> +ANALYTICS:j721e = ""
> +ANALYTICS:j7200 = ""
> +ANALYTICS:j721s2 = ""

Well, this is probably completely wrong by now, anyway.


>  ANALYTICS:omapl138 = ""
>  
>  RDEPENDS:${PN} = "\
> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> index 99a6cc82..5f56f8be 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> @@ -78,7 +78,15 @@ ARAGO_TI_TEST:append:k3 = " \
>      k3conf \
>  "
>  
> -ARAGO_TI_TEST:append:j7 = " \
> +ARAGO_TI_TEST:append:j721e = " \
> +    ufs-utils \
> +"
> +
> +ARAGO_TI_TEST:append:j7200 = " \
> +    ufs-utils \
> +"
> +
> +ARAGO_TI_TEST:append:j721s2 = " \
>      ufs-utils \
>  "

ufs-utils is quite generic and should probably be added to k3 or maybe even 
all platforms...

-- 
Denys

