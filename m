Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA1FCFC50F
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 22:29:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23164.1763764197052692906
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Nov 2025 14:29:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4AD5D40C81;
	Fri, 21 Nov 2025 22:29:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Y7Yq-lxz56p; Fri, 21 Nov 2025 22:29:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 165CB407DA;
	Fri, 21 Nov 2025 22:29:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9EE82175884; Fri, 21 Nov 2025 17:29:52 -0500 (EST)
Date: Fri, 21 Nov 2025 17:29:52 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH v2] nnstreamer: Update to 2.4.4
Message-ID: <20251121222952.GM3125@denix.org>
References: <20251121222650.540856-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121222650.540856-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Nov 2025 22:29:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16827

On Fri, Nov 21, 2025 at 04:26:50PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> Signed-off-by: Andrew Davis <afd@ti.com>

LGTM, Ack


> ---
> 
> Changes for v2:
>  - Remove extra path from commit subject
>  - Remove PV as it redundant and set in the filename
> 
>  .../nnstreamer/{nnstreamer_2.4.0.bb => nnstreamer_2.4.4.bb}    | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta-arago-extras/recipes-multimedia/nnstreamer/{nnstreamer_2.4.0.bb => nnstreamer_2.4.4.bb} (97%)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.4.bb
> similarity index 97%
> rename from meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
> rename to meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.4.bb
> index 63995d83..3419e5a3 100644
> --- a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
> +++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.4.bb
> @@ -4,8 +4,7 @@ LICENSE = "LGPL-2.1-only"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c25e5c1949624d71896127788f1ba590"
>  
>  SRC_URI = "git://github.com/nnstreamer/nnstreamer.git;branch=main;protocol=https"
> -PV = "2.4.0+git"
> -SRCREV = "7c57c288250578cad598f065b6fda6c0ff720cf9"
> +SRCREV = "3b32573bc104b4708af44837466b8b6c73f94869"
>  
>  # Only compatible with armv7a, armv7ve, and aarch64
>  COMPATIBLE_MACHINE = "(^$)"
> -- 
> 2.39.2

