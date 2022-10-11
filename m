Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF467C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 19:23:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.11808.1665516229669672907
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 12:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 23F3A40D58;
	Tue, 11 Oct 2022 19:23:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lsTRUxRprlJi; Tue, 11 Oct 2022 19:23:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0728840D57;
	Tue, 11 Oct 2022 19:23:46 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id F0DCD174A1B; Tue, 11 Oct 2022 15:23:44 -0400 (EDT)
Date: Tue, 11 Oct 2022 15:23:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH]
 packagegroup-arago-tisdk-addons: Make ti-rtos-firmware available for k3
Message-ID: <20221011192344.GC22689@denix.org>
References: <20221011175533.27039-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011175533.27039-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Oct 2022 19:23:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14079

On Tue, Oct 11, 2022 at 12:55:33PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> The ti-rtos-firmware is common across all K3 devices, only the pru-icss
> component is variable. Make the appending logic match.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  .../packagegroups/packagegroup-arago-tisdk-addons.bb  | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 5b6f05c9..d1b48b57 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -63,13 +63,10 @@ UTILS:append:k3 = " mmc-utils \
>                      statcol \
>  "
>  
> -UTILS:append:am64xx = " ti-rtos-firmware pru-icss"
> -UTILS:append:am62xx = " ti-rtos-firmware"
> -#UTILS:append:am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
> -UTILS:append:am65xx = " ti-rtos-firmware pru-icss"
> -UTILS:append:j7 = " ti-rtos-firmware"
> -UTILS:append:j721e-evm = " pru-icss"
> -UTILS:append:j721e-hs-evm = " pru-icss"
> +UTILS:append:k3 = " ti-rtos-firmware"
> +UTILS:append:am64xx = " pru-icss"
> +UTILS:append:am65xx = " pru-icss"
> +UTILS:append:j721e = " pru-icss"
>  
>  UTILS:append:omapl138 = " ti-ipc-rtos-fw"

