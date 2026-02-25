Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF580FD45EF
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 20:24:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54575.1772051091398836951
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 12:24:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B844440BA7;
	Wed, 25 Feb 2026 20:24:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rdDOPSBU0GSQ; Wed, 25 Feb 2026 20:24:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7AF0C40AE9;
	Wed, 25 Feb 2026 20:24:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2A6051791AD; Wed, 25 Feb 2026 15:24:47 -0500 (EST)
Date: Wed, 25 Feb 2026 15:24:47 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] arago.conf: Tweak a couple of
 settings following oe-core changes
Message-ID: <20260225202447.GW11121@denix.org>
References: <20260225021057.2555571-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225021057.2555571-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Feb 2026 20:24:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17150

On Tue, Feb 24, 2026 at 08:10:57PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> oe-core has made some changes to default values for all distros [1] [2].
> Target a few specific packages at the Arago level to back out those
> defaults and allow packages to build.  The changes fall into two types:
> 
> - Disable static libraries
> [1] https://git.openembedded.org/openembedded-core/commit/?id=03fc931bfe9ea3fa9f33553e6020cbc067b24291
> 
> - Enable tighter compile time security
> [2] https://git.openembedded.org/openembedded-core/commit/?id=4c2d64c10a5b0437ab1ea04df22386f0f95124d1
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 17c6fed8..691f9068 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -153,3 +153,13 @@ LICENSE_FLAGS_ACCEPTED = "commercial_ffmpeg commercial_gstreamer1.0-libav"
>  # We are working to reproduce this error and submit bug reports for this
>  # issue.
>  DEFAULTTUNE:armv7a = "armv7athf"

BTW, slightly unrelated, but ^^^ this was a temporary workaround and it ended 
up staying here for quite some time. Is it sill needed?


> +# Some packages ship static libraries which are disabled by default.
> +# Add support back in for these packages.
> +DISABLE_STATIC:pn-ti-ipc = ""
> +DISABLE_STATIC:pn-ti-rpmsg-char = ""
> +
> +# oe-core enabled tighter security checks at the distro level by default,
> +# but a couple of packages in meta-ti cannot compile with those.
> +SECURITY_STRINGFORMAT:pn-dsptop = ""
> +lcl_maybe_fortify:pn-gdbc6x = ""
> -- 
> 2.43.0

