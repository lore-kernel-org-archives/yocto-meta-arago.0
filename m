Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28057EB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 22:24:32 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.75.1686954265397446648
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jun 2023 15:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 48B3B40C3A;
	Fri, 16 Jun 2023 22:24:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mtWZdJXD33HN; Fri, 16 Jun 2023 22:24:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 12CF140AE9;
	Fri, 16 Jun 2023 22:24:21 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1628A163AFC; Fri, 16 Jun 2023 18:24:20 -0400 (EDT)
Date: Fri, 16 Jun 2023 18:24:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][kirkstone][PATCH 2/2] kms++: Renable kms++-python
Message-ID: <20230616222420.GH1518@denix.org>
References: <20230616221010.18458-1-reatmon@ti.com>
 <20230616221010.18458-2-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616221010.18458-2-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jun 2023 22:24:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14649

Renable?

Otherwise LGTM


On Fri, Jun 16, 2023 at 05:10:10PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> With the pybind11 backport, the kms++ package builds correctly.  Turn it
> back on.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-base.bb    | 3 +--
>  meta-arago-extras/recipes-graphics/kms++/kms++_git.bb        | 5 ++---
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> index 31d9ad5b..ff32112a 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> @@ -26,8 +26,6 @@ ARAGO_BASE = "\
>      libgpiod-tools \
>  "
>  
> -# these require meta-openembedded/meta-oe layer
> -#    kms++-python is not provided yet
>  ARAGO_EXTRA = "\
>      devmem2 \
>      tcpdump \
> @@ -35,6 +33,7 @@ ARAGO_EXTRA = "\
>      dropbear \
>      openssh-sftp-server \
>      kms++ \
> +    kms++-python \
>      can-utils \
>      docker \
>  "
> diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
> index eb39736c..2c0abaa7 100644
> --- a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
> +++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
> @@ -12,9 +12,8 @@ SRCREV = "5afc8d918f2c084acd65027604868dfde43395cf"
>  
>  DEPENDS = "drm fmt"
>  
> -# New meson build system fails to find pybind11 in sysroot, disable for now
> -#DEPENDS += "python3-pybind11"
> -#EXTRA_OEMESON = "-Dsystem-pybind11=enabled"
> +DEPENDS += "libevdev python3-pybind11"
> +EXTRA_OEMESON = "-Dsystem-pybind11=enabled"
>  
>  PACKAGES =+ "${PN}-python"

