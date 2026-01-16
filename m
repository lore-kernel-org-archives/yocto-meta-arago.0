Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC03C982E4
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 17:56:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3256.1768586211109947893
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 09:56:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 304DC40CBB;
	Fri, 16 Jan 2026 17:56:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N4BbM65XpJDU; Fri, 16 Jan 2026 17:56:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EC205406B9;
	Fri, 16 Jan 2026 17:56:46 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 11C5D1779A3; Fri, 16 Jan 2026 12:56:46 -0500 (EST)
Date: Fri, 16 Jan 2026 12:56:46 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH v4] packagegroup-arago-console: Fix
 package names for alsa-utils-*
Message-ID: <20260116175646.GT11121@denix.org>
References: <20260116173605.1565859-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116173605.1565859-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jan 2026 17:56:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16973

On Fri, Jan 16, 2026 at 11:36:05AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> A recent change in oe-core [1] reworked how the recipe chose to name the
> subpackages.  The name of alsa-utils-midi changed to alsa-utils-amidi,
> and alsa-util-scripts was removed in favor of separate packages for the
> three scripts.
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=26a28ee7935091250a8c52f223a7a954d9e29d34
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v4: More pacakge name changes after more testing.
> v3: Fix commit subject.
> v2: Added three more packages in place of alsa-utils-scripts.
> 
>  .../packagegroups/packagegroup-arago-console.bb            | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
> index f6ec0a05..e13cb3c4 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
> @@ -13,13 +13,14 @@ ARAGO_ALSA_EXTRA = "\
>      alsa-server \
>      alsa-utils \

Doesn't alsa-utils meta-package automatically RDEPENDS on all individual 
alsa-utils-* sub-packages?


>      alsa-utils-aconnect \
> -    alsa-utils-scripts \
> +    alsa-utils-alsaconf \
> +    alsa-utils-alsa-info \
>      alsa-utils-alsactl \
>      alsa-utils-alsamixer \
>      alsa-utils-amixer \
>      alsa-utils-iecset \
> -    alsa-utils-midi \
> -    alsa-utils-speakertest \
> +    alsa-utils-amidi \
> +    alsa-utils-speaker-test \
>      alsa-state \
>      "
>  
> -- 
> 2.43.0

