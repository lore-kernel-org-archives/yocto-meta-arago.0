Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABB9C36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 17:38:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.45867.1742837900460943308
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 24 Mar 2025 10:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E4EAE40C79;
	Mon, 24 Mar 2025 17:38:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 75egUM84MQv7; Mon, 24 Mar 2025 17:38:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BD33F40A46;
	Mon, 24 Mar 2025 17:38:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 84EE41643B6; Mon, 24 Mar 2025 13:38:16 -0400 (EDT)
Date: Mon, 24 Mar 2025 13:38:16 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH 7/8] packagegroup-arago-gst: Wrap
 various packages in a compliant manner
Message-ID: <20250324173816.GV23729@denix.org>
References: <20250320182041.2349-1-reatmon@ti.com>
 <20250320182041.2349-8-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320182041.2349-8-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 24 Mar 2025 17:38:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16150

On Thu, Mar 20, 2025 at 01:20:40PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
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
>  .../recipes-core/packagegroups/packagegroup-arago-gst.bb       | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
> index 0aee4773..f5832109 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
> @@ -14,9 +14,10 @@ GSTREAMER_DEPS = " \
>      gstreamer1.0-plugins-base-meta \
>      gstreamer1.0-plugins-good-meta \
>      gstreamer1.0-plugins-bad-meta \
> -    gstreamer1.0-libav \
>  "
>  
> +GSTREAMER_DEPS:arago += "gstreamer1.0-libav"

It's not recommended to mix overrides (:arago) and appending operands (+=)

GSTREAMER_DEPS:append:arago = " gstreamer1.0-libav"


>  #    gstreamer1.0-plugins-hevc 
>  GSTREAMER_DEPS:append:dra7xx = " \
>  "
> -- 
> 2.17.1

