Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2784C61D97
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 23:07:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8026.1700608057424244385
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Nov 2023 15:07:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1694840CB3;
	Tue, 21 Nov 2023 23:07:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lPGpc5i-dihm; Tue, 21 Nov 2023 23:07:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CD29640CB2;
	Tue, 21 Nov 2023 23:07:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A6422163D64; Tue, 21 Nov 2023 18:07:25 -0500 (EST)
Date: Tue, 21 Nov 2023 18:07:25 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: p-bhagat@ti.com
Cc: meta-arago@lists.yoctoproject.org, praneeth@ti.com, reatmon@ti.com,
	khasim@ti.com, c-shilwant@ti.com, s-adivi@ti.com, g-gupta@ti.com
Subject: Re: [meta-arago] [kirkstone][PATCH] Add am62pxx as compatible
 machine for jailhouse image
Message-ID: <20231121230725.GD26739@denix.org>
References: <20231121105511.3628347-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121105511.3628347-1-p-bhagat@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Nov 2023 23:07:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15019

On Tue, Nov 21, 2023 at 04:25:11PM +0530, Paresh Bhagat via lists.yoctoproject.org wrote:
> Add am62pxx as compatible machine for jailhouse image. Also since
> this image is primarily for jailhouse remove the machine in
> IMAGE_INSTALL:append.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  .../recipes-core/images/tisdk-jailhouse-image.bb              | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
> index 267fcc2d..b7ee1757 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
> @@ -2,9 +2,9 @@
>  
>  require recipes-core/images/tisdk-default-image.bb
>  
> -COMPATIBLE_MACHINE = "am62xx"
> +COMPATIBLE_MACHINE = "am62xx|am62pxx"
>  
> -IMAGE_INSTALL:append:am62xx = " jailhouse"
> +IMAGE_INSTALL:append = " jailhouse"

Use += instead


>  export IMAGE_BASENAME = "tisdk-jailhouse-image"
>  
> -- 
> 2.34.1

