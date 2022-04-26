Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA23CC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 22:01:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1077.1651010493638119491
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 15:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B0FAA40C24;
	Tue, 26 Apr 2022 22:01:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D3jsS0PhHcDo; Tue, 26 Apr 2022 22:01:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 96833406B7;
	Tue, 26 Apr 2022 22:01:30 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DE7821748ED; Tue, 26 Apr 2022 18:01:29 -0400 (EDT)
Date: Tue, 26 Apr 2022 18:01:29 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][oe-layersetup PATCH 1/6] Remove unused
 sample-file bblayers-zeus-browser.conf.sample
Message-ID: <20220426220129.GJ9834@denix.org>
References: <20220426200251.19417-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426200251.19417-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Apr 2022 22:01:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13815

On Tue, Apr 26, 2022 at 03:02:46PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
> Signed-off-by: Andrew Davis <afd@ti.com>

Yeah, all zeus configs were removed, no need for this snippet either:

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  sample-files/bblayers-zeus-browser.conf.sample | 12 ------------
>  1 file changed, 12 deletions(-)
>  delete mode 100644 sample-files/bblayers-zeus-browser.conf.sample
> 
> diff --git a/sample-files/bblayers-zeus-browser.conf.sample b/sample-files/bblayers-zeus-browser.conf.sample
> deleted file mode 100644
> index bb83fac..0000000
> --- a/sample-files/bblayers-zeus-browser.conf.sample
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -# This template file was created by taking the oe-core/meta/conf/bblayers.conf
> -# file and removing the BBLAYERS section at the end.
> -
> -# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
> -# changes incompatibly
> -LCONF_VERSION = "6"
> -
> -BBPATH = "${TOPDIR}"
> -BBFILES ?= ""
> -
> -OVERRIDES = "forcevariable"
> -LAYERSERIES_COMPAT_browser-layer_forcevariable = "zeus"
> -- 
> 2.17.1

