Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FB2C48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 16:45:10 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.11113.1707756300154341980
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 08:45:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1EF5F40C6C;
	Mon, 12 Feb 2024 16:44:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z72AOavc1yuW; Mon, 12 Feb 2024 16:44:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 61FB5406B9;
	Mon, 12 Feb 2024 16:44:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8712C163E30; Mon, 12 Feb 2024 11:44:54 -0500 (EST)
Date: Mon, 12 Feb 2024 11:44:54 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Sinthu Raja <sinthu.raja@mistralsolutions.com>
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: Re: [meta-arago][kirkstone][PATCH] graphics: kms++: Enable
 OmapCard support in pykms library
Message-ID: <20240212164454.GI15614@denix.org>
References: <20240212163122.20728-1-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212163122.20728-1-sinthu.raja@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 12 Feb 2024 16:45:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15166

On Mon, Feb 12, 2024 at 10:01:22PM +0530, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> AM57x platform supports OMAP DRM. By default the pykms library
> disabled the OmapCard support. Enable the same by defining the
> HAS_LIBDRM_OMAP as a compiler flags
> 
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
>  ...-Add-OMAP-Card-support-for-AM57x-DRM.patch | 26 +++++++++++++++++++
>  .../recipes-graphics/kms++/kms++_git.bb       |  2 ++
>  2 files changed, 28 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add-OMAP-Card-support-for-AM57x-DRM.patch
> 
> diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add-OMAP-Card-support-for-AM57x-DRM.patch b/meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add-OMAP-Card-support-for-AM57x-DRM.patch
> new file mode 100644
> index 00000000..48c9068d
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add-OMAP-Card-support-for-AM57x-DRM.patch
> @@ -0,0 +1,26 @@
> +From bc6e89ea8695c7e94eb6892755e47781682e28a7 Mon Sep 17 00:00:00 2001
> +From: Sinthu Raja <sinthu.raja@ti.com>
> +Date: Mon, 12 Feb 2024 21:47:52 +0530
> +Subject: [PATCH] Add OMAP Card support for AM57x DRM

Upstream-Status?
https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status


> +Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> +---
> + py/pykms/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/py/pykms/meson.build b/py/pykms/meson.build
> +index de05d12..ce6c013 100644
> +--- a/py/pykms/meson.build
> ++++ b/py/pykms/meson.build
> +@@ -49,7 +49,7 @@ if get_option('libutils')
> +     pykms_deps += [ libkmsxxutil_dep ]
> + endif
> + 
> +-pykms_args = [ '-fvisibility=hidden' ]
> ++pykms_args = [ '-fvisibility=hidden' , '-DHAS_LIBDRM_OMAP' ]
> + 
> + destdir = get_option('libdir') / 'python' + py3_dep.version() / 'site-packages/pykms'
> + 
> +-- 
> +2.36.1
> +
> diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
> index 2c0abaa7..010a1f0a 100644
> --- a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
> +++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
> @@ -28,3 +28,5 @@ inherit python3native meson pkgconfig update-alternatives
>  ALTERNATIVE_PRIORITY = "100"
>  ALTERNATIVE:${PN} = "kmstest"
>  ALTERNATIVE_LINK_NAME[kmstest] = "${bindir}/kmstest"
> +
> +SRC_URI:append:am57xx = "file://0001-Add-OMAP-Card-support-for-AM57x-DRM.patch"

Leading whitespace when using :append

-- 
Denys

