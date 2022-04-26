Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A872FC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 16:03:20 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8864.1650988998968823930
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 09:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BF9ED40C24;
	Tue, 26 Apr 2022 16:03:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7euGGNSLKxhD; Tue, 26 Apr 2022 16:03:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A9C90406B7;
	Tue, 26 Apr 2022 16:03:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E21371748DC; Tue, 26 Apr 2022 12:03:15 -0400 (EDT)
Date: Tue, 26 Apr 2022 12:03:15 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: a0393906@ti.com
Cc: meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][dunfell][PATCH] statcol: Update to latest for VTM
 driver scripts
Message-ID: <20220426160315.GA9834@denix.org>
References: <20220422164104.20009-1-a0393906@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422164104.20009-1-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Apr 2022 16:03:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13790

On Fri, Apr 22, 2022 at 10:11:04PM +0530, Karthik Ramanan via lists.yoctoproject.org wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  meta-arago-extras/recipes-devtools/statcol/statcol.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
> index ee2b12d2..bda532eb 100644
> --- a/meta-arago-extras/recipes-devtools/statcol/statcol.bb
> +++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"
>  
>  PROTOCOL = "git"
>  BRANCH = "master"
> -SRCREV = "dd0131eadf3633e8f9d06cb390d3c6c1b074d873"
> +SRCREV = "2dac74a233dd489d9bb48a50153c4a1360361b62"
>  SRC_URI = "git://git.ti.com/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"
>  
>  DEPENDS = "ti-rpmsg-char websocketd"
> @@ -19,6 +19,6 @@ do_install() {
>  	DESTDIR=${D} make install
>  }
>  
> -PR:append = "_3"
> +PR:append = "_4"

Again, the patch doesn't seem to be against dunfell, but is against master 
instead, unlike what the subject says.


>  INSANE_SKIP:${PN} = "ldflags"
> -- 
> 2.17.1

