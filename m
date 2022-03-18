Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1ACC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 17:11:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.12581.1647623510723157183
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 10:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A3A5540C62;
	Fri, 18 Mar 2022 17:11:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m180xD0LrIDq; Fri, 18 Mar 2022 17:11:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 79B44406B5;
	Fri, 18 Mar 2022 17:11:44 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A8E4A1747CE; Fri, 18 Mar 2022 13:11:43 -0400 (EDT)
Date: Fri, 18 Mar 2022 13:11:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: nm@ti.com
Cc: reatmon@ti.com, Yogesh Siraswar <yogeshs@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/dunfell][PATCH] images: Build
 tisdk-thinklinux-image with tisdk-core-bundle
Message-ID: <20220318171143.GA23554@denix.org>
References: <20220314202840.18904-1-reatmon@ti.com>
 <20220318134823.7rzaq2wqcfnkxgv2@animate>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318134823.7rzaq2wqcfnkxgv2@animate>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 17:11:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13655

On Fri, Mar 18, 2022 at 08:48:23AM -0500, Nishanth Menon via lists.yoctoproject.org wrote:
> On 15:28-20220314, Ryan Eatmon via lists.yoctoproject.org wrote:
> > Add tisdk-thinklinux-image to the list of TARGET_IMAGES for

think linux? :)


> > tisdk-core-bundle.
> > 
> > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > ---
> >  meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> > index 9f0e65db..5ce688ef 100644
> > --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> > +++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> > @@ -32,7 +32,7 @@ DTB_FILTER_am65xx = "am65"
> >  DTB_FILTER_j7 = "j721e"
> >  
> >  # List of target side images to build for the SDK
> > -TARGET_IMAGES = "tisdk-base-image tisdk-default-image"
> > +TARGET_IMAGES = "tisdk-base-image tisdk-default-image tisdk-thinlinux-image"
> >  
> >  # dra71 lcard requires an initramfs with modules for NFS boot
> >  TARGET_IMAGES_append_dra7xx-evm = " netboot-initrd"
> 
> Reviewed-by: Nishanth Menon <nm@ti.com>

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

