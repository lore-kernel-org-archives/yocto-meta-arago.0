Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3356FF6E97
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 22:41:32 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1860.1773787284126674099
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 15:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9936440C2A;
	Tue, 17 Mar 2026 22:41:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QkgyzPA5f1zX; Tue, 17 Mar 2026 22:41:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6247440A20;
	Tue, 17 Mar 2026 22:41:20 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2CC0317A474; Tue, 17 Mar 2026 18:41:20 -0400 (EDT)
Date: Tue, 17 Mar 2026 18:41:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] layer.conf: Update the layers to
 support wrynose
Message-ID: <20260317224120.GJ11121@denix.org>
References: <20260317223557.1973923-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317223557.1973923-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 22:41:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17393

Ack

On Tue, Mar 17, 2026 at 05:35:57PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-arago-distro/conf/layer.conf | 2 +-
>  meta-arago-extras/conf/layer.conf | 2 +-
>  meta-arago-test/conf/layer.conf   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
> index e16eedd6..2ad036f5 100644
> --- a/meta-arago-distro/conf/layer.conf
> +++ b/meta-arago-distro/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-distro"
>  BBFILE_PATTERN_meta-arago-distro := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arago-distro = "10"
>  
> -LAYERSERIES_COMPAT_meta-arago-distro = "walnascar whinlatter"
> +LAYERSERIES_COMPAT_meta-arago-distro = "whinlatter wrynose"
>  
>  LAYERDEPENDS_meta-arago-distro = " \
>      core \
> diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
> index 1a4a5bdd..29107f12 100644
> --- a/meta-arago-extras/conf/layer.conf
> +++ b/meta-arago-extras/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-extras"
>  BBFILE_PATTERN_meta-arago-extras := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arago-extras = "10"
>  
> -LAYERSERIES_COMPAT_meta-arago-extras = "walnascar whinlatter"
> +LAYERSERIES_COMPAT_meta-arago-extras = "whinlatter wrynose"
>  
>  # Set a variable to get to the top of the metadata location
>  ARAGOBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
> diff --git a/meta-arago-test/conf/layer.conf b/meta-arago-test/conf/layer.conf
> index 3a5ed925..3084974b 100644
> --- a/meta-arago-test/conf/layer.conf
> +++ b/meta-arago-test/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-test"
>  BBFILE_PATTERN_meta-arago-test := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arago-test = "10"
>  
> -LAYERSERIES_COMPAT_meta-arago-test = "walnascar whinlatter"
> +LAYERSERIES_COMPAT_meta-arago-test = "whinlatter wrynose"
>  
>  # Set a variable to get to the top of the metadata location
>  TITESTBASE := '${@os.path.normpath("${LAYERDIR}/")}'
> -- 
> 2.43.0

