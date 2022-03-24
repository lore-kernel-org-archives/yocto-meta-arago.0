Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA50C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 20:39:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.154.1648154394807045732
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 13:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B546340C3A;
	Thu, 24 Mar 2022 20:39:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FKEI7Zkc_zk8; Thu, 24 Mar 2022 20:39:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 67CAD40B13;
	Thu, 24 Mar 2022 20:39:44 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 287D0174865; Thu, 24 Mar 2022 16:39:44 -0400 (EDT)
Date: Thu, 24 Mar 2022 16:39:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: reatmon@ti.com, d-gerlach@ti.com, j-humphreys@ti.com, khilman@ti.com,
	meta-arago@lists.yoctoproject.org, minas@ti.com, nikhil.nd@ti.com,
	praneeth@ti.com, spatton@ti.com
Subject: Re: [master/dunfell PATCH V6 00/12] recipes-core: Add a bootstrap
 Linux image
Message-ID: <20220324203944.GA23554@denix.org>
References: <20220324132526.26497-1-nm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324132526.26497-1-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 24 Mar 2022 20:39:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13753

On Thu, Mar 24, 2022 at 08:25:14AM -0500, Nishanth Menon wrote:
> Board bringups are typically painful. however, over the years, folks
> know of minimal debug tools that are pretty effective in helping debug
> basic peripherals. Lets create a reusable packagegroup balancing the
> tools from wisdom from various folks vs the size of the resultant
> package.
> 
> We would like to base such a system on more simplistic sysvinit (no
> offence systemd, you are still our fav), as it has a much smaller
> footprint.
> 
> The board startup is best done with a minimal u-boot and kernel device
> tree configurations.
> 
> Dependency (for patch #12, depends on https://lore.kernel.org/all/20220314202840.18904-1-reatmon@ti.com/ )
> 
> Changes since V5:
> * Patch #10 - switch from GPLv2 to MIT to stick with standard licensing.

Thanks for addressing all the comments! The series looks good to me:

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> V5: https://lore.kernel.org/all/20220322174808.16341-1-nm@ti.com/
> V4: https://lore.kernel.org/all/20220319123310.8546-1-nm@ti.com/
> V3: https://lore.kernel.org/all/20220318184045.11246-1-nm@ti.com/
> V2: https://lore.kernel.org/all/20220318143735.17642-1-nm@ti.com/
> V1: https://lore.kernel.org/all/20220309021316.28370-1-nm@ti.com/
> 
> 
> Nishanth Menon (12):
>   Revert "tisdk-tiny-image: remove packagedata task breaking initramfs
>     packaging"
>   tisdk-tiny-image: Split common components into include file
>   tisdk-tiny-image: Add some usability notes
>   tisdk-base-image: Reformat documentation and clarify usage
>   tisdk-default-image: Reformat documentation and clarify usage
>   tisdk-thinlinux-image: Reformat documentation
>   tisdk-core-bundle: Add documentation to clarify usage
>   packagegroups: Add a new bootstrap package group
>   recipes-core: images: Add a basic bootstrap base image
>   recipes-bsp: Create a bootstrap-initrd package
>   recipes-core: images: Introduce tisdk-bootstrap-image
>   images: Build tisdk-bootstrap-image with tisdk-core-bundle
> 
>  .../bootstrap-initrd/bootstrap-initrd_1.0.bb  | 22 ++++++++
>  .../recipes-core/images/arago-tiny-image.inc  |  9 ++++
>  .../recipes-core/images/tisdk-base-image.bb   |  6 ++-
>  .../images/tisdk-bootstrap-base-image.bb      | 22 ++++++++
>  .../images/tisdk-bootstrap-image.bb           | 22 ++++++++
>  .../recipes-core/images/tisdk-core-bundle.bb  |  7 +++
>  .../recipes-core/images/tisdk-core-bundle.inc |  2 +-
>  .../images/tisdk-default-image.bb             |  5 +-
>  .../images/tisdk-thinlinux-image.bb           |  6 ++-
>  .../recipes-core/images/tisdk-tiny-image.bb   | 23 ++++----
>  .../packagegroup-arago-bootstrap.bb           | 53 +++++++++++++++++++
>  11 files changed, 162 insertions(+), 15 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
>  create mode 100644 meta-arago-distro/recipes-core/images/arago-tiny-image.inc
>  create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
>  create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
>  create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
> 
> -- 
> 2.31.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

