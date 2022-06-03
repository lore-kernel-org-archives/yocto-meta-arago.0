Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C5EC433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 21:01:15 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.3486.1654290066460968441
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 03 Jun 2022 14:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 184CE40D25;
	Fri,  3 Jun 2022 21:01:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vhIG1hee0kHR; Fri,  3 Jun 2022 21:01:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EACC240D22;
	Fri,  3 Jun 2022 21:01:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4F17717495D; Fri,  3 Jun 2022 17:01:00 -0400 (EDT)
Date: Fri, 3 Jun 2022 17:01:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][dunfell/master][PATCH] tiusdk-uenv: remove
 uEnv.txt for k3
Message-ID: <20220603210100.GM9834@denix.org>
References: <20220603160300.28387-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603160300.28387-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 03 Jun 2022 21:01:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13886

There's a typo in the subject - tiusdk-uenv


On Fri, Jun 03, 2022 at 11:03:00AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> This fixup should have been done in u-boot and not in a uEnv.txt
> file. It is not correct for all K3 anymore either. Remove it.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../tisdk-uenv/tisdk-uenv/k3/uEnv.txt         | 19 -------------------
>  1 file changed, 19 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt
> 
> diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt
> deleted file mode 100644
> index 80ea34f5..00000000
> --- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -# This uEnv.txt file can contain additional environment settings that you
> -# want to set in U-Boot at boot time.  This can be simple variables such
> -# as the serverip or custom variables.  The format of this file is:
> -#    variable=value
> -# NOTE: This file will be evaluated after the bootcmd is run and the
> -#       bootcmd must be set to load this file if it exists (this is the
> -#       default on all newer U-Boot images.  This also means that some
> -#       variables such as bootdelay cannot be changed by this file since
> -#       it is not evaluated until the bootcmd is run.
> -
> -# The specific board is not able to be automatically detected. The below is a
> -# workaround to set a sane default incase the user has not manually configured
> -# a specific board.
> -def_board_name="am65x"
> -
> -# Check if using default board_name when name_overlays is not set
> -check_for_board=if test $name_overlays; then echo "Using board_name = $board_name"; else setenv board_name $def_board_name; fi
> -
> -uenvcmd=run check_for_board; run findfdt
> -- 
> 2.36.1

