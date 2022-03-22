Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BF9C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 04:56:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.6174.1647924966200610405
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Mar 2022 21:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3CEA440C2A;
	Tue, 22 Mar 2022 04:56:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nw21LQ1ofVwp; Tue, 22 Mar 2022 04:56:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E314240BA7;
	Tue, 22 Mar 2022 04:55:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id ACE38174836; Tue, 22 Mar 2022 00:55:55 -0400 (EDT)
Date: Tue, 22 Mar 2022 00:55:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: reatmon@ti.com, d-gerlach@ti.com, j-humphreys@ti.com, khilman@ti.com,
	meta-arago@lists.yoctoproject.org, minas@ti.com, nikhil.nd@ti.com,
	praneeth@ti.com, spatton@ti.com
Subject: Re: [master/dunfell PATCH V4 12/12] images: Build
 tisdk-bootstrap-image with tisdk-core-bundle
Message-ID: <20220322045555.GI23554@denix.org>
References: <20220319123310.8546-1-nm@ti.com>
 <20220319123310.8546-13-nm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220319123310.8546-13-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Mar 2022 04:56:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13692

On Sat, Mar 19, 2022 at 07:33:10AM -0500, Nishanth Menon wrote:
> Add tisdk-bootstrap-image to the list of TARGET_IMAGES for
> tisdk-core-bundle.

I just realized - this won't work (and the patch hasn't been tested).

As you can see, there was no tiny image in this list. The reason is that tiny 
image has package management disabled for additional size savings, but that 
also breaks the way SDK installer bundle gets processed for the SW manifest. 
That means any other images that are based on tiny or that disable package 
management, cannot be listed in TARGET_IMAGES of the SDK installer bundle.


> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> Changes Since V3: None.
> 
> V3: https://lore.kernel.org/all/20220318184045.11246-13-nm@ti.com/
> 
>  meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> index 5ce688ef24b7..db73abd27fc2 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> +++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> @@ -32,7 +32,7 @@ DTB_FILTER_am65xx = "am65"
>  DTB_FILTER_j7 = "j721e"
>  
>  # List of target side images to build for the SDK
> -TARGET_IMAGES = "tisdk-base-image tisdk-default-image tisdk-thinlinux-image"
> +TARGET_IMAGES = "tisdk-base-image tisdk-default-image tisdk-thinlinux-image tisdk-bootstrap-image"
>  
>  # dra71 lcard requires an initramfs with modules for NFS boot
>  TARGET_IMAGES_append_dra7xx-evm = " netboot-initrd"
> -- 
> 2.31.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

