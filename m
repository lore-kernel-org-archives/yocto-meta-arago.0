Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7587AE77187
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 21:42:08 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.116540.1734558125393809560
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 13:42:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 962E540CB0;
	Wed, 18 Dec 2024 21:42:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h1bJFFYFXWqg; Wed, 18 Dec 2024 21:42:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6D03C40BD4;
	Wed, 18 Dec 2024 21:42:02 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2FD4D164135; Wed, 18 Dec 2024 16:42:02 -0500 (EST)
Date: Wed, 18 Dec 2024 16:42:02 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap/master][PATCH 1/3] ti-demos: Add
 pdm-anomaly-detection for all platforms
Message-ID: <20241218214202.GJ23825@denix.org>
References: <20241217210206.47052-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217210206.47052-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Dec 2024 21:42:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15670

On Tue, Dec 17, 2024 at 03:02:04PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> There is nothing in this demo that makes it specific to any board.
> Enable this for all devices.

Why fix up ti-demos.bb here and completely remove it in the next patch of the 
series?


> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../recipes-core/packagegroups/ti-demos.bb             | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
> index 7bccb4de..91e469e7 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
> @@ -1,17 +1,9 @@
>  SUMMARY = "TI World packagegroup"
>  LICENSE = "MIT"
>  
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
>  inherit packagegroup
>  
> -PDM_ANOMALY_PKG = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'pdm-anomaly-detection', '', d)}"
> -
> -PDM_ANOMALY = ""
> -PDM_ANOMALY:ti33x = "${PDM_ANOMALY_PKG}"
> -PDM_ANOMALY:ti43x = "${PDM_ANOMALY_PKG}"
> -PDM_ANOMALY:omap-a15 = "${PDM_ANOMALY_PKG}"
> -PDM_ANOMALY:am65xx = "${PDM_ANOMALY_PKG}"
> +PDM_ANOMALY = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'pdm-anomaly-detection', '', d)}"
>  
>  RDEPENDS:${PN} = "\
>      ${PDM_ANOMALY} \
> -- 
> 2.39.2

