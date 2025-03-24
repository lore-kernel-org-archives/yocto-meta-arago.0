Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD6FC36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 17:35:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.45773.1742837694209621628
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 24 Mar 2025 10:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8218B40C79;
	Mon, 24 Mar 2025 17:34:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yZ_-H5LCo2n4; Mon, 24 Mar 2025 17:34:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4FB2B40A46;
	Mon, 24 Mar 2025 17:34:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B571B1643B6; Mon, 24 Mar 2025 13:34:49 -0400 (EDT)
Date: Mon, 24 Mar 2025 13:34:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH 6/8]
 packagegroup-arago-gst-sdk-target: Wrap various packages in a compliant
 manner
Message-ID: <20250324173449.GT23729@denix.org>
References: <20250320182041.2349-1-reatmon@ti.com>
 <20250320182041.2349-7-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320182041.2349-7-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 24 Mar 2025 17:35:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16148

On Thu, Mar 20, 2025 at 01:20:39PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> yocto-check-layer does not load the conf/distro/arago.conf file during
> its execution.  This means that the LICENSE_FLAGS_ACCEPTED variable is not
> set according to what we are willing to accept.
> 
> If a packagegroup is trying to include a recipe that is marked as being
> "commercial" and the LICENSE_FLAGS_ACCEPTED is not set, then yocto-check-layer
> fails.
> 
> The solution is to wrap the inclusion of these recipes in the packagegroup
> in a complaint manner.  Only if the DISTRO_OVERRIDE says that this is an
> "arago" build, should the package be included and this under the direction
> of the LICENSE_FLAGS_ACCEPTED variable.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-gst-sdk-target.bb         | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
> index fd749711..ad25f4dd 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
> @@ -11,9 +11,10 @@ GSTREAMER_DEPS = " \
>      gstreamer1.0-plugins-base-dev \
>      gstreamer1.0-plugins-good-dev \
>      gstreamer1.0-plugins-bad-dev \
> -    gstreamer1.0-libav-dev \
>  "
>  
> +GSTREAMER_DEPS:arago += "gstreamer1.0-libav-dev"

It's not recommended to mix overrides (:arago) and appending operands (+=)

GSTREAMER_DEPS:append:arago = " gstreamer1.0-libav-dev"


> +
>  #    gstreamer1.0-plugins-hevc-dev 
>  GSTREAMER_DEPS:append:dra7xx = " \
>  "
> -- 
> 2.17.1

