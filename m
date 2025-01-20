Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63821C02181
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 21:16:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1533.1737407808919271001
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 20 Jan 2025 13:16:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5138A40C06;
	Mon, 20 Jan 2025 21:16:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zldMRULX9cw4; Mon, 20 Jan 2025 21:16:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 24AB040021;
	Mon, 20 Jan 2025 21:16:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E1BA416415A; Mon, 20 Jan 2025 16:16:44 -0500 (EST)
Date: Mon, 20 Jan 2025 16:16:44 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap/master][PATCH 5/5] ffmpeg: Remove
 bbappend to disable x264
Message-ID: <20250120211644.GL21836@denix.org>
References: <20250117211951.698377-1-afd@ti.com>
 <20250117211951.698377-5-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117211951.698377-5-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 20 Jan 2025 21:16:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15715

On Fri, Jan 17, 2025 at 03:19:51PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> The x264 codec is no longer enabled by default in oe-core, remove the
> extra disabling. The x264 codec is not the only codec that makes this
> package license flag commercial, so removing that flag after only
> disabling one codec is not correct. All potentially troublesome codecs
> should be evaluated before setting LICENSE_FLAGS_ACCEPTED to approve
> of the license flags.

From what I see in the changes below, they are not limited to x264 codec, 
yet, there's no explanation for other changes in the description.


> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf                 | 9 ++++-----
>  .../recipes-multimedia/ffmpeg/ffmpeg_%.bbappend          | 4 ----
>  2 files changed, 4 insertions(+), 9 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index baa526a9..85c7ddd1 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -164,11 +164,10 @@ require conf/distro/include/branding-${ARAGO_BRAND}.inc
>  # Disable meta-virtualization sanity check and warning
>  SKIP_META_VIRT_SANITY_CHECK = "1"
>  
> -# oe-core uses external libav instead of internal libav for gst-ffmpeg. We
> -# disable by default the codecs in libav that causes issues with shipping an
> -# Arago based SDK. No need to prevent gst-ffmpeg from being used since we
> -# disable troublesome software.
> -LICENSE_FLAGS_ACCEPTED = "commercial_gst-ffmpeg commercial_gstreamer1.0-libav commercial_faad2 non-commercial_netperf"
> +# Codecs in libav and ffmpeg with questionable patent statuses are not
> +# included by default. If you enable any of those codecs you should check
> +# if the below acceptance flags still work for your software distribution
> +LICENSE_FLAGS_ACCEPTED = "commercial_ffmpeg commercial_gstreamer1.0-libav"
>  
>  # Do not package own copy of perl into devkit, rely on host one
>  ASSUME_PROVIDED += "nativesdk-perl"
> diff --git a/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend b/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
> deleted file mode 100644
> index d2f22d8e..00000000
> --- a/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -PR:append = ".arago0"
> -
> -PACKAGECONFIG:remove = "x264"
> -LICENSE_FLAGS = ""
> -- 
> 2.39.2

