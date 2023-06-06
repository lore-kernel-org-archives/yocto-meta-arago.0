Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC77FC7EE2F
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 23:21:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1541.1686093708119978825
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 16:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6248340C37;
	Tue,  6 Jun 2023 23:21:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S_MXGxUbhX0u; Tue,  6 Jun 2023 23:21:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2042840AE9;
	Tue,  6 Jun 2023 23:21:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7CE5316395F; Tue,  6 Jun 2023 19:20:55 -0400 (EDT)
Date: Tue, 6 Jun 2023 19:20:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, afd@ti.com, detheridge@ti.com,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH] arago-image.inc: fix the
 default systemd target
Message-ID: <20230606232055.GY9226@denix.org>
References: <20230606230320.2678321-1-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606230320.2678321-1-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jun 2023 23:21:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14512

On Tue, Jun 06, 2023 at 06:03:20PM -0500, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> SYSTEMD_DEFAULT_TARGET is dynamically set based on the contents of
> IMAGE_FEATURES. Would you like to know what doesn't get updated when we
> use a bunch of package groups to dictate what is present in the image?
> 
> This makes systemd actually start graphical applications if the opengl
> distro feature is set. It assumes the distro is using weston though. I'm

Why check for "opengl" and not "wayland" in DISTRO_FEATURES?


> sure that will eventually be invalid when the package group contents
> drift.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta-arago-distro/recipes-core/images/arago-image.inc | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
> index d00c1f70..7104d87c 100644
> --- a/meta-arago-distro/recipes-core/images/arago-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
> @@ -6,6 +6,11 @@ COMPATIBLE_MACHINE = "ti-soc"
>  
>  IMAGE_FEATURES += "package-management splash"
>  
> +# this is required to make sure the proper systemd default target gets set
> +IMAGE_FEATURES += " \
> +	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'weston', '',d)} \
> +"
> +
>  # 4KB per 1 inode should be enough
>  EXTRA_IMAGECMD:ext2.gz += "-i 4096"
>  
> -- 
> 2.40.1

