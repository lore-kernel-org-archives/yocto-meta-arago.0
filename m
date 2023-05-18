Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249E2C7EE23
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 17:56:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2429.1684432559224061877
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 18 May 2023 10:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7AB2D40C5D;
	Thu, 18 May 2023 17:55:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id baVjY79vy0hM; Thu, 18 May 2023 17:55:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3C2B140C21;
	Thu, 18 May 2023 17:55:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 411EA1638E4; Thu, 18 May 2023 13:55:10 -0400 (EDT)
Date: Thu, 18 May 2023 13:55:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: r-ravikumar@ti.com
Cc: meta-arago@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
	vigneshr@ti.com, praneeth@ti.com
Subject: Re: [meta-arago][master/kirkstone][PATCH] meta-arago-extras:
 recipes-devtools: statcol: Bump SRCREV to fix rpmsg_char APIs
Message-ID: <20230518175510.GR9226@denix.org>
References: <20230518132044.17273-1-r-ravikumar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230518132044.17273-1-r-ravikumar@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 18 May 2023 17:56:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14419

On Thu, May 18, 2023 at 06:50:44PM +0530, Rahul T R via lists.yoctoproject.org wrote:
> There has been some update in ti-rpmsg-char library APIs, New commits aligns
> with this update
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> ---
>  Requires: https://lists.yoctoproject.org/g/meta-ti/message/16556
> 
>  meta-arago-extras/recipes-devtools/statcol/statcol.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
> index 5cae05d7..2968ac83 100644
> --- a/meta-arago-extras/recipes-devtools/statcol/statcol.bb
> +++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"
>  
>  PROTOCOL = "https"
>  BRANCH = "master"
> -SRCREV = "dd0131eadf3633e8f9d06cb390d3c6c1b074d873"
> +SRCREV = "279bf455bc3dec69f374d46a8225687935f4323a"
>  SRC_URI = "git://git.ti.com/git/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"
>  
>  DEPENDS = "ti-rpmsg-char websocketd"
> @@ -19,6 +19,6 @@ do_install() {
>  	DESTDIR=${D} make install
>  }
>  
> -PR:append = "_3"
> +PR:append = "_4"

This is a standalone recipe, should set PV instead.


>  INSANE_SKIP:${PN} = "ldflags"
> -- 
> 2.17.1

