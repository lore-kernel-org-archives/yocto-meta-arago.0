Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D0AC02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 22:24:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6909.1737584645867951903
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 14:24:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 32E9B40C83;
	Wed, 22 Jan 2025 22:24:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RjH9s5x2JZ34; Wed, 22 Jan 2025 22:24:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 052DF40A46;
	Wed, 22 Jan 2025 22:24:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C005D16415C; Wed, 22 Jan 2025 17:24:01 -0500 (EST)
Date: Wed, 22 Jan 2025 17:24:01 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap/master][PATCH v2 6/7] arago.conf:
 Remove unneeded LICENSE_FLAGS_ACCEPTED items
Message-ID: <20250122222401.GS21836@denix.org>
References: <20250121175231.27183-1-afd@ti.com>
 <20250121175231.27183-6-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121175231.27183-6-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 22 Jan 2025 22:24:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15736

On Tue, Jan 21, 2025 at 11:52:30AM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> netperf is no longer marked as non-commercial (587fe5877 in meta-oe).
> 
> faad2 is still marked commercial and AAC is still covered under several
> patents that may require royalties. Not sure why we decided to whitelist
> this, the commit adding it has no message. So, what can be added without
> explanation can be removed without explanation :)

Heh... IIRC, there was an unconditional build dependency back then, probably a 
mistake. If removing it doesn't break anything, then it should be removed.


> gst-ffmpeg is no longer a package, remove this too.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
> 
> Changes for v2:
>  - Explain each change better in commit message
> 
>  meta-arago-distro/conf/distro/arago.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 9f51ac26..033b8fcd 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -167,7 +167,7 @@ SKIP_META_VIRT_SANITY_CHECK = "1"
>  # disable by default the codecs in libav that causes issues with shipping an
>  # Arago based SDK. No need to prevent gst-ffmpeg from being used since we
>  # disable troublesome software.
> -LICENSE_FLAGS_ACCEPTED = "commercial_gst-ffmpeg commercial_gstreamer1.0-libav commercial_faad2 non-commercial_netperf"
> +LICENSE_FLAGS_ACCEPTED = "commercial_gstreamer1.0-libav"
>  
>  # Do not package own copy of perl into devkit, rely on host one
>  ASSUME_PROVIDED += "nativesdk-perl"
> -- 
> 2.39.2

