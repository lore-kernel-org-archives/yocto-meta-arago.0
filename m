Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B125DC05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 18:30:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1834.1676053794883619734
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 10:29:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CD20C40C1E;
	Fri, 10 Feb 2023 18:29:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qfvg6hoeM2ql; Fri, 10 Feb 2023 18:29:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A64ED40A0B;
	Fri, 10 Feb 2023 18:29:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2120216374D; Fri, 10 Feb 2023 13:29:28 -0500 (EST)
Date: Fri, 10 Feb 2023 13:29:28 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][kirkstone/master][PATCH] arago-image: Remove
 unneeded make_bootfiles_symlinks_relative
Message-ID: <20230210182928.GV22689@denix.org>
References: <20230208233302.19587-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208233302.19587-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 10 Feb 2023 18:30:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14216

On Wed, Feb 08, 2023 at 05:33:02PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> This post process step is not currently used and will not be needed
> as non-relative symlinks are no longer created in the boot files.

FWIW, this was already removed in dunfell and was pending porting to kirkstone 
by the next sync up patchset:
https://git.yoctoproject.org/meta-arago/commit/?h=dunfell&id=f683ed96f90fcfea01f03a7f7ea1f285181af03e


> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../recipes-core/images/arago-image.inc       | 19 -------------------
>  1 file changed, 19 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
> index 0bb3634b..923bc84f 100644
> --- a/meta-arago-distro/recipes-core/images/arago-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
> @@ -22,25 +22,6 @@ IMAGE_LINGUAS = ""
>  TOOLCHAIN_HOST_TASK += "nativesdk-buildtools-perl-dummy"
>  SDK_PACKAGE_ARCHS += "buildtools-dummy-${SDKPKGSUFFIX}"
>  
> -# FIXME: remove bashisms from this function (currently disabled)
> -make_bootfiles_symlinks_relative() {
> -    for f in "${IMAGE_ROOTFS}/boot"/*
> -    do
> -        [ -L "$f" ] || continue
> -
> -        l=$(readlink "$f")
> -        if [ "${l:0:6}" == "/boot/" ]
> -        then
> -            ln -sf "${l##/boot/}" "$f"
> -        elif ["${l:0:1}" == "/" ]
> -        then
> -            ln -sf "..$l" "$f"
> -        fi
> -    done
> -}
> -
> -#ROOTFS_POSTPROCESS_COMMAND += "make_bootfiles_symlinks_relative;"
> -
>  BAD_RECOMMENDATIONS += " \
>      ti-llvm3.6-dev \
>      opencl-monitor-dev \
> -- 
> 2.39.1

