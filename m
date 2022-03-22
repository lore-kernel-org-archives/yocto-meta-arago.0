Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0162C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 17:36:06 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.13305.1647970565363319001
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 10:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 639ED40C3E;
	Tue, 22 Mar 2022 17:36:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cDcMSZlKm-sV; Tue, 22 Mar 2022 17:36:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1EE5340951;
	Tue, 22 Mar 2022 17:35:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D3C7F174837; Tue, 22 Mar 2022 13:35:54 -0400 (EDT)
Date: Tue, 22 Mar 2022 13:35:54 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: reatmon@ti.com, d-gerlach@ti.com, j-humphreys@ti.com, khilman@ti.com,
	meta-arago@lists.yoctoproject.org, minas@ti.com, nikhil.nd@ti.com,
	praneeth@ti.com, spatton@ti.com
Subject: Re: [meta-arago] [master/dunfell PATCH V4 12/12] images: Build
 tisdk-bootstrap-image with tisdk-core-bundle
Message-ID: <20220322173554.GK23554@denix.org>
References: <20220319123310.8546-1-nm@ti.com>
 <20220319123310.8546-13-nm@ti.com>
 <20220322045555.GI23554@denix.org>
 <16DEB49A300B0672.26416@lists.yoctoproject.org>
 <20220322134750.4tragiw5vpxdxko7@outrank>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220322134750.4tragiw5vpxdxko7@outrank>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Mar 2022 17:36:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13696

On Tue, Mar 22, 2022 at 08:47:50AM -0500, Nishanth Menon wrote:
> On 07:44-20220322, Nishanth Menon via lists.yoctoproject.org wrote:
> > On 00:55-20220322, Denys Dmytriyenko wrote:
> > > On Sat, Mar 19, 2022 at 07:33:10AM -0500, Nishanth Menon wrote:
> > > > Add tisdk-bootstrap-image to the list of TARGET_IMAGES for
> > > > tisdk-core-bundle.
> > > 
> > > I just realized - this won't work (and the patch hasn't been tested).
> > > 
> > > As you can see, there was no tiny image in this list. The reason is that tiny 
> > > image has package management disabled for additional size savings, but that 
> > > also breaks the way SDK installer bundle gets processed for the SW manifest. 
> > > That means any other images that are based on tiny or that disable package 
> > > management, cannot be listed in TARGET_IMAGES of the SDK installer bundle.
> > 
> > 
> > I think you mean IMAGE_FEATURES_remove = "package-management" in
> > tiny-image.inc
> > 
> > I did do MACHINE=xxx bitbake tisdk-core-bundle, but I did'nt wait for it
> > to complete (got to 99%).
> > 
> > I also do see ipks in build/arago-tmp-external-arm-glibc/deploy/ipk/all
> > and in build/arago-tmp-external-arm-glibc/deploy/ipk/aarch64/
> > 
> > During the build, I did notice:
> > WARNING: bootstrap-initrd-1.0-r0 do_package: Manifest /workdir/pub-sdk/oe-layersetup/build/arago-tmp-external-arm-glibc/sstate-control/manifest-x86_64_x86_64-nativesdk-tisdk-bootstrap-base-image.packagedata not found in j7_evm aarch64 allarch x86_64_x86_64-nativesdk (variant '')?
> > 
> > And once I waited for the complete build, I got this:
> > https://gist.github.com/nmenon/3ef33a14df77d9c7869f4c87fcfbc990
> > 
> > I guess I have to see how to introduce packagemanagement back in for
> > bootstrap image?
> > 
> 
> Denys: This seems to resolve the build error..  Thoughts?
> 
> diff --git a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
> index 79c8f6075911..958dd8bb9399 100644
> --- a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
> @@ -2,7 +2,7 @@ ARAGO_SYSVINIT = "1"
>  
>  require arago-image.inc
>  
> -IMAGE_FEATURES_remove = "package-management splash"
> +IMAGE_FEATURES_remove = "splash"
>  
>  IMAGE_INSTALL = " \
>  	packagegroup-arago-sysvinit-boot \
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
> index 210bc32444f9..528efa2746b4 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
> @@ -12,6 +12,8 @@ ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= ""
>  
>  require arago-tiny-image.inc
>  
> +IMAGE_FEATURES_remove += "package-management"

s/+=/=/


> +
>  IMAGE_FSTYPES += "cpio cpio.xz"
>  
>  IMAGE_INSTALL += " \

Yeah, this should work.


-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

