Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FD3C4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 15:07:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.23079.1713280038109739352
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 Apr 2024 08:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 75C0040C82;
	Tue, 16 Apr 2024 15:07:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xqLnLfd2GbjT; Tue, 16 Apr 2024 15:07:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B7A6440C2A;
	Tue, 16 Apr 2024 15:07:12 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 811B2163F16; Tue, 16 Apr 2024 11:07:12 -0400 (EDT)
Date: Tue, 16 Apr 2024 11:07:12 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org,
	Gyan Gupta <g-gupta@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH] meta-arago-extras:
 packagegroups: Fix QA Issue
Message-ID: <20240416150712.GI28791@denix.org>
References: <20240416062317.223194-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416062317.223194-1-c-shilwant@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 Apr 2024 15:07:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15291

On Tue, Apr 16, 2024 at 11:53:17AM +0530, Chirag Shilwant wrote:
> - Since packagegroup.bbclass is using inherit_defer in oe-core, some classes are
> now appearing after nativesdk resulting in following QA errors.
> 
>  ```
>   QA Issue: nativesdk-packagegroup-arago-tisdk-host: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: allarch.bbclass [native-last]
>   QA Issue: nativesdk-packagegroup-arago-qte-toolchain-host: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: allarch.bbclass [native-last]
> 
>  ```
> 
> - To fix this issue, use inherit_defer that was added in bitbake recently [1].
> 
> [1]: https://github.com/openembedded/bitbake/commit/5c2e840eafeba1f0f754c226b87bfb674f7bea29

Please also merge this to master, not just scarthgap.


> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>  .../nativesdk-packagegroup-arago-qte-toolchain-host.bb         | 3 ++-
>  .../packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb   | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
> index 4d2a98ad..23c45abf 100644
> --- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
> +++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
> @@ -2,7 +2,8 @@ DESCRIPTION = "Host packages for Qt Embedded SDK"
>  PR = "r10"
>  LICENSE = "MIT"
>  
> -inherit packagegroup nativesdk
> +inherit packagegroup
> +inherit_defer nativesdk
>  
>  RDEPENDS:${PN} = "\
>      nativesdk-packagegroup-arago-tisdk-host \
> diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
> index 7e77d12f..92a80b6b 100644
> --- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
> +++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
> @@ -2,7 +2,8 @@ SUMMARY = "Host packages for a standalone Arago SDK with TI tools"
>  PR = "r2"
>  LICENSE = "MIT"
>  
> -inherit packagegroup nativesdk
> +inherit packagegroup
> +inherit_defer nativesdk
>  
>  PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
>  
> -- 
> 2.34.1
> 

