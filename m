Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E2D4C001B0
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 18:11:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.114959.1692036660625247998
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 14 Aug 2023 11:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CBA2E40C98;
	Mon, 14 Aug 2023 18:10:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kvhz2GRIrsPN; Mon, 14 Aug 2023 18:10:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9CABC40C93;
	Mon, 14 Aug 2023 18:10:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 65C7E163C58; Mon, 14 Aug 2023 14:10:56 -0400 (EDT)
Date: Mon, 14 Aug 2023 14:10:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH] mstpd: Add FILES variable
Message-ID: <20230814181056.GG3359@denix.org>
References: <20230812131654.25185-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230812131654.25185-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 14 Aug 2023 18:11:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14839

On Sat, Aug 12, 2023 at 08:16:54AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Bring this recipe into compliance with the latest standards.  Add
> missing FILES and update hardcoded /sbin path to $base_sbindir.

Well, you don't have to touch FILES, as the defaults here seem to cover 
everything just fine. Plus, you are adding to the defaults, not replacing 
them, so that's a no-op.

Changing hardcoded /sbin to ${base_sbindir} is all you need here.


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb b/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
> index a410f584..be75b1c5 100644
> --- a/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
> +++ b/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
> @@ -17,7 +17,15 @@ RDEPENDS:${PN} = "python3-core"
>  
>  inherit autotools
>  
> -EXTRA_OECONF = "--sbindir=/sbin"
> +EXTRA_OECONF = "--sbindir=${base_sbindir}"
> +
> +FILES:${PN} += " \
> +    ${base_sbindir}/mstp* \
> +    ${base_sbindir}/bridge-stp \
> +    ${libexecdir}/mstpctl-utils/* \
> +    ${sysconfdir}/bridge-stp.conf \
> +    ${sysconfdir}/bash_completion.d/mstpctl \
> +"

So, the defaults already have ${base_sbindir}/* ${libexecdir}/* and 
${sysconfdir} and will scoop up everything the recipe installs in those 
directories.

https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.conf#n331


>  do_configure:prepend() {
>  	 sed -i -e "s,#!.*python.*,#!${USRBINPATH}/env python3," ${S}/utils/ifquery
> -- 
> 2.17.1

