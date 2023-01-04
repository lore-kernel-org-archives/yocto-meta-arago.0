Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E272BC3DA7D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 02:33:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2541.1672799636907808970
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Jan 2023 18:33:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BDBB440AC9;
	Wed,  4 Jan 2023 02:33:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TZgc4AI7QyeX; Wed,  4 Jan 2023 02:33:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A2FB8409B0;
	Wed,  4 Jan 2023 02:33:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 72EE21636B7; Tue,  3 Jan 2023 21:33:38 -0500 (EST)
Date: Tue, 3 Jan 2023 21:33:38 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Bernd Sprenger <bernd@sprenger.org>
Cc: "meta-arago@lists.yoctoproject.org" <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago] Patch for enabling yocto populate_sdk
Message-ID: <20230104023338.GE22689@denix.org>
References: <GVAP278MB0117C3BBC581C7A3D59986B0DBF49@GVAP278MB0117.CHEP278.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GVAP278MB0117C3BBC581C7A3D59986B0DBF49@GVAP278MB0117.CHEP278.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Jan 2023 02:33:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14145

On Tue, Jan 03, 2023 at 01:54:23PM +0000, Bernd Sprenger wrote:
> Hello,
> 
> as a dumb yocto user I would appreciate if a working sdk for 
> cross-compilation could be created the yocto way by appending "-c 
> populate_sdk" to the bitbake command. Only the small patch below for tag 
> 08.04.00.005 would enable this. Maybe you could integrate this into the next 
> releases...

What's the issue? Is there an error message or some failure logs?

$ bitbake tisdk-base-image -c populate_sdk -e | grep "^TOOLCHAIN_HOST_TASK="
TOOLCHAIN_HOST_TASK=" nativesdk-buildtools-perl-dummy"

Everything seems in order.


> Thanks a lot,
> have a nice day,
> Bernd
> 
> 
> diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
> index e068287e..2029ccd0 100644
> --- a/meta-arago-distro/recipes-core/images/arago-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
> @@ -19,7 +19,7 @@ export IMAGE_BASENAME = "arago-image"
>  IMAGE_LINGUAS = ""
> -TOOLCHAIN_HOST_TASK += "nativesdk-buildtools-perl-dummy"
> +TOOLCHAIN_HOST_TASK_append += "nativesdk-buildtools-perl-dummy"

There are few issues with this change:
1. you shouldn't mix += with _append - use either one of them
2. when using _append, you need to provide a leading space


> SDK_PACKAGE_ARCHS += "buildtools-dummy-${SDKPKGSUFFIX}"
>  make_bootfiles_symlinks_relative() {

-- 
Denys

