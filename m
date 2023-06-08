Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA39C7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 18:58:16 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2603.1686250691030981342
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 11:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F06C940C93;
	Thu,  8 Jun 2023 18:58:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ufSpYBPbAnqh; Thu,  8 Jun 2023 18:58:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C9DE840C90;
	Thu,  8 Jun 2023 18:58:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 848F116396E; Thu,  8 Jun 2023 14:57:19 -0400 (EDT)
Date: Thu, 8 Jun 2023 14:57:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] kms++: Restore pybind11 support
Message-ID: <20230608185719.GC9226@denix.org>
References: <20230608183641.30832-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608183641.30832-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Jun 2023 18:58:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14550

On Thu, Jun 08, 2023 at 01:36:41PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Having this turned off is causing build errors and the errors that
> disabling pybind11 solved do not appear to be in master any more.

Yeah, I already had this change in my local queue for master, but have been 
fighting other upstream issues...


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Tested-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-arago-extras/recipes-graphics/kms++/kms++_git.bb | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
> index eb39736c..56b83c7a 100644
> --- a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
> +++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
> @@ -12,9 +12,8 @@ SRCREV = "5afc8d918f2c084acd65027604868dfde43395cf"
>  
>  DEPENDS = "drm fmt"
>  
> -# New meson build system fails to find pybind11 in sysroot, disable for now
> -#DEPENDS += "python3-pybind11"
> -#EXTRA_OEMESON = "-Dsystem-pybind11=enabled"
> +DEPENDS += "python3-pybind11"
> +EXTRA_OEMESON = "-Dsystem-pybind11=enabled"
>  
>  PACKAGES =+ "${PN}-python"

