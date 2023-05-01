Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9630C77B73
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 16:56:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.100111.1682960197461283380
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 May 2023 09:56:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 87C3B40C1C;
	Mon,  1 May 2023 16:56:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GUYij1fT2a0A; Mon,  1 May 2023 16:56:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 526B940ACD;
	Mon,  1 May 2023 16:56:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8C09616387C; Mon,  1 May 2023 12:55:51 -0400 (EDT)
Date: Mon, 1 May 2023 12:55:51 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH] packagegroup-arago-gst:
 Disable vpe and ducati plugins
Message-ID: <20230501165551.GV9226@denix.org>
References: <20230501163915.10612-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230501163915.10612-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 May 2023 16:56:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14381

On Mon, May 01, 2023 at 11:39:15AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> The code for the plugins uses dma allocation code that we add in with a
> patch.  Theoretically we no longer need that code and can use some
> upstreamed dma buffer allocation code.  The work to rewrite these
> plugins to support the newer gstreamer versions needs to be scheduled.

I'm guessing you are missing this in "ltsprep" and other brandings:
https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/conf/distro/include/branding-core.inc#n15

But it is a more broader approach, so maybe surgically disabling individual 
components and re-enabling "mmip" machine feature in "core" is better...


> In the meantime, disable using these plugins that cause build errors.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-gst.bb      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
> index e8a639bd..2184ab58 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
> @@ -27,8 +27,8 @@ GSTREAMER_DEPS:append:dra7xx = " \
>  "
>  
>  GSTREAMER_ACCEL_MM = ""
> -GSTREAMER_ACCEL_MM:omap-a15 = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', "gstreamer1.0-plugins-ducati", '', d)}"
> -GSTREAMER_ACCEL_MM:append:dra7xx = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
> +#GSTREAMER_ACCEL_MM:omap-a15 = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', "gstreamer1.0-plugins-ducati", '', d)}"
> +#GSTREAMER_ACCEL_MM:append:dra7xx = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
>  
>  RDEPENDS:${PN} = "\
>      ${GSTREAMER_DEPS} \
> -- 
> 2.17.1

