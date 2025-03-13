Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDF0C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 18:12:32 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.21916.1741889542676372717
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 11:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0593A40C16;
	Thu, 13 Mar 2025 18:12:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IHo9F6qz6EMk; Thu, 13 Mar 2025 18:12:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C8FA740C06;
	Thu, 13 Mar 2025 18:12:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 84F27164302; Thu, 13 Mar 2025 14:12:18 -0400 (EDT)
Date: Thu, 13 Mar 2025 14:12:18 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH 10/13] libredblack: move and clean
 up
Message-ID: <20250313181218.GD23729@denix.org>
References: <20250313104029.14977-1-reatmon@ti.com>
 <20250313104029.14977-11-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313104029.14977-11-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Mar 2025 18:12:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16030

On Thu, Mar 13, 2025 at 05:40:26AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> * Move into recipes-extended
> * Clean unnecessary comments
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>

Huh, when I squashed the 2 commits into 1, I missed some extra text below...


> libredblack cleanup
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../sysrepo}/libredblack_git.bb                             | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>  rename meta-arago-extras/{recipes-sysrepo/libredblack => recipes-extended/sysrepo}/libredblack_git.bb (62%)
> 
> diff --git a/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb b/meta-arago-extras/recipes-extended/sysrepo/libredblack_git.bb
> similarity index 62%
> rename from meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
> rename to meta-arago-extras/recipes-extended/sysrepo/libredblack_git.bb
> index 412d08d8..80283c73 100644
> --- a/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
> +++ b/meta-arago-extras/recipes-extended/sysrepo/libredblack_git.bb
> @@ -10,12 +10,8 @@ SRCREV = "a399310d99b61eec4d3c0677573ab5dddcf9395d"
>  
>  S = "${WORKDIR}/git"
>  
> -# NOTE: if this software is not capable of being built in a separate build directory
> -# from the source, you should replace autotools with autotools-brokensep in the
> -# inherit line
>  inherit python3native autotools
>  
> -# Specify any options you want to pass to the configure script using EXTRA_OECONF:
> -EXTRA_OECONF = " --without-rbgen "
> +EXTRA_OECONF = "--without-rbgen"
>  
>  BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.17.1

