Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4498BF364CB
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 22:27:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.144124.1775773663115106563
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 09 Apr 2026 15:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3C55540C86;
	Thu,  9 Apr 2026 22:27:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LL1GRaQNAkw9; Thu,  9 Apr 2026 22:27:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E4D0140AC9;
	Thu,  9 Apr 2026 22:27:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1A5FD17BB8D; Thu,  9 Apr 2026 18:27:37 -0400 (EDT)
Date: Thu, 9 Apr 2026 18:27:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: a-christidis@ti.com
Cc: reatmon@ti.com, denys@konsulko.com, b-brnich@ti.com,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] gstreamer1.0-plugins-good: oe-core
 v126->128 migrate bbappends
Message-ID: <20260409222737.GC11121@denix.org>
References: <20260409213918.1020996-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409213918.1020996-1-a-christidis@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 09 Apr 2026 22:27:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17460

On Thu, Apr 09, 2026 at 04:39:18PM -0500, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> Fix bbappend files to apply onto the new recipe from oe-core now
> versioned at 128 instead of 126.

https://git.yoctoproject.org/meta-arago/commit/?h=master-wip&id=c923bf7b5b67b7261583f330dbe9ba22a2076b6f


> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend       | 4 ----
>  ....26-arago.inc => gstreamer1.0-plugins-good_1.28-arago.inc} | 0
>  .../gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend       | 4 ++++
>  .../gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend       | 4 ----
>  ....26-arago.inc => gstreamer1.0-plugins-good_1.28-arago.inc} | 0
>  .../gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend       | 4 ++++
>  6 files changed, 8 insertions(+), 8 deletions(-)
>  delete mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend
>  rename meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26-arago.inc => gstreamer1.0-plugins-good_1.28-arago.inc} (100%)
>  create mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend
>  rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26-arago.inc => gstreamer1.0-plugins-good_1.28-arago.inc} (100%)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend
> 
> diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend
> deleted file mode 100644
> index 0ceb558c..00000000
> --- a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO = ""
> -GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO:arago = "gstreamer1.0-plugins-good_1.26-arago.inc"
> -
> -require ${GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO}
> diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26-arago.inc b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
> similarity index 100%
> rename from meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26-arago.inc
> rename to meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
> diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend
> new file mode 100644
> index 00000000..e8392833
> --- /dev/null
> +++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend
> @@ -0,0 +1,4 @@
> +GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO = ""
> +GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO:arago = "gstreamer1.0-plugins-good_1.28-arago.inc"
> +
> +require ${GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO}
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend
> deleted file mode 100644
> index 0ceb558c..00000000
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO = ""
> -GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO:arago = "gstreamer1.0-plugins-good_1.26-arago.inc"
> -
> -require ${GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO}
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26-arago.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
> similarity index 100%
> rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26-arago.inc
> rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend
> new file mode 100644
> index 00000000..e8392833
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend
> @@ -0,0 +1,4 @@
> +GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO = ""
> +GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO:arago = "gstreamer1.0-plugins-good_1.28-arago.inc"
> +
> +require ${GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO}
> -- 
> 2.34.1

