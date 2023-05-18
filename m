Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33311C77B7A
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 18:02:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2610.1684432962777990908
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 18 May 2023 11:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C5A7740C5D;
	Thu, 18 May 2023 18:02:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9eiQueFHCR4T; Thu, 18 May 2023 18:02:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7222440C21;
	Thu, 18 May 2023 18:02:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 785171638E4; Thu, 18 May 2023 14:01:51 -0400 (EDT)
Date: Thu, 18 May 2023 14:01:51 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: r-ravikumar@ti.com
Cc: meta-arago@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
	j-choudhary@ti.com, a-bhatia1@ti.com, b-brnich@ti.com,
	devarsht@ti.com
Subject: Re: [meta-arago][master/kirkstone][PATCH] conf: arago: Add flag to
 enable kmssink plugin
Message-ID: <20230518180151.GS9226@denix.org>
References: <20230518132636.17398-1-r-ravikumar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230518132636.17398-1-r-ravikumar@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 18 May 2023 18:02:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14420

On Thu, May 18, 2023 at 06:56:36PM +0530, Rahul T R via lists.yoctoproject.org wrote:
> Enable building kmssink plugin in gstreamer1.0-plugins-bad
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 379b1d44..e32259a9 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -113,6 +113,9 @@ PACKAGECONFIG:append:pn-openssl = " cryptodev-linux"
>  # Enable GST_TRACER logging in gstreamer
>  PACKAGECONFIG:append:pn-gstreamer1.0 = " tracer-hooks"
>  
> +# Enable kmssink in gstreamer
> +PACKAGECONFIG:append:pn-gstreamer1.0-plugins-bad = " kms"

FWIW, corresponding bbappend also sets this option, but it needs updating to 
the current gstreamer version:

https://git.yoctoproject.org/meta-arago/tree/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%25.bbappend#n3


>  # Disable pulseaudio routing in alsa by default
>  PACKAGECONFIG:remove:pn-alsa-plugins = "pulseaudio"
>  RDEPENDS:pulseaudio-server:remove = "alsa-plugins-pulseaudio-conf"
> -- 
> 2.17.1

