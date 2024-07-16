Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE8EC3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 18:23:26 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3950.1721154197788184280
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 Jul 2024 11:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2E1EE40B66;
	Tue, 16 Jul 2024 18:23:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WW385_KhyUgh; Tue, 16 Jul 2024 18:23:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6D22140301;
	Tue, 16 Jul 2024 18:23:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 35584163FF6; Tue, 16 Jul 2024 14:23:14 -0400 (EDT)
Date: Tue, 16 Jul 2024 14:23:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH v2] gnutls: Add INSANE_SKIP for
 incompatible-license
Message-ID: <20240716182314.GA17572@denix.org>
References: <20240715193729.28404-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715193729.28404-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 Jul 2024 18:23:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15449

Actually, this is not needed - see my patch.


On Mon, Jul 15, 2024 at 02:37:29PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> A recent change in master has promoted a lot more warnings into errors.
> Set the INSANE_SKIP variable since we are using INCOMPATIBLE_LICENSE.
> 
> This patch is dependent on a patch in oe-core:
> 
> https://lists.openembedded.org/g/openembedded-core/message/201943
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2: Added the oe-core patch reference.
> 
>  meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend b/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
> index 4ad4f70a..44d1e3fa 100644
> --- a/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
> +++ b/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
> @@ -3,3 +3,5 @@ PR:append = ".arago0"
>  # Set INCOMPATIBLE_LICENSE to GPLv3 to allow gnutls to use the non GPLv2
>  # version of gettext.
>  INCOMPATIBLE_LICENSE = "GPL-3.0*"
> +
> +INSANE_SKIP:${PN} += "incompatible-license"
> -- 
> 2.17.1

