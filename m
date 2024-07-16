Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F55C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 19:23:26 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.5238.1721157801275283703
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 Jul 2024 12:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 76C3140B66
	for <meta-arago@lists.yoctoproject.org>; Tue, 16 Jul 2024 19:23:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RsJ2JoCPPO1g for <meta-arago@lists.yoctoproject.org>;
	Tue, 16 Jul 2024 19:23:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6349640031
	for <meta-arago@lists.yoctoproject.org>; Tue, 16 Jul 2024 19:23:20 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 40FD0163FF6; Tue, 16 Jul 2024 15:23:19 -0400 (EDT)
Date: Tue, 16 Jul 2024 15:23:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [master][PATCH] gnutls: drop unused bbappend
Message-ID: <20240716192319.GB17572@denix.org>
References: <17E2C48A897A48DA.25492@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17E2C48A897A48DA.25492@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 Jul 2024 19:23:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15450

Can probably go to scarthgap as well.


On Tue, Jul 16, 2024 at 02:21:41PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Upstream gnutls recipe in oe-core used to check INCOMPATIBLE_LICENSE for
> presence of GPLv3 in order to link to a specific version of gettext.
> That logic is long since gone and this bbappend is not needed.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend | 5 -----
>  1 file changed, 5 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend b/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
> deleted file mode 100644
> index 4ad4f70a..00000000
> --- a/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -PR:append = ".arago0"
> -
> -# Set INCOMPATIBLE_LICENSE to GPLv3 to allow gnutls to use the non GPLv2
> -# version of gettext.
> -INCOMPATIBLE_LICENSE = "GPL-3.0*"
> -- 
> 2.25.1

