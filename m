Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AF3FF8869
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 15:35:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48274.1777304144444333652
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 08:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9175340B66;
	Mon, 27 Apr 2026 15:35:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ksYAYxuoEMyE; Mon, 27 Apr 2026 15:35:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 354BA40A20;
	Mon, 27 Apr 2026 15:35:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9168117C892; Mon, 27 Apr 2026 11:35:37 -0400 (EDT)
Date: Mon, 27 Apr 2026 11:35:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: p-deshmukh@ti.com
Cc: meta-arago@lists.yoctoproject.org, afd@ti.com, c-shilwant@ti.com,
	denys@ti.com, v-singh1@ti.com
Subject: Re: [meta-arago][master][PATCH v 1/1] tensorflow-lite: Fix file
 packaging for headers and symlinks
Message-ID: <20260427153537.GG4186@denix.org>
References: <20260423075408.1886225-1-p-deshmukh@ti.com>
 <20260423075408.1886225-2-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423075408.1886225-2-p-deshmukh@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 27 Apr 2026 15:35:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17493

On Thu, Apr 23, 2026 at 01:24:08PM +0530, Pratham Deshmukh via lists.yoctoproject.org wrote:
> The TensorFlow Lite recipe was missing proper packaging directives for
> development files, causing two issues:
> 
> 1. Headers installed to ${includedir} were not being packaged into any
>    specific package, resulting in missing headers in the final rootfs
>    despite being built and installed correctly.
> 
> 2. Unversioned .so symlinks (libtensorflow-lite.so, libtensorflowlite.so)
>    were incorrectly placed in the main runtime package instead of the
>    development package, triggering QA error [dev-so].
> 
> Add FILES:${PN}-dev to properly assign development files:
>    - ${includedir}/* for TensorFlow Lite headers
>    - libdir}/lib*.so for unversioned shared library symlinks
> 
> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
> ---
>  .../tensorflow-lite/tensorflow-lite_2.20.0.bb                | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb
> index 559ec5ef..75889b7e 100644
> --- a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb
> +++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb
> @@ -229,6 +229,11 @@ FILES:${PN}-tools = " \
>      /opt/* \
>  "
>  
> +FILES:${PN}-dev += " \
> +    ${includedir}/* \
> +    ${libdir}/lib*.so \

These are part of the defaults:
https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.conf#n356

I'm not sure your change even does anything here...


> +"
> +
>  FILES:python3-${PN} = " \
>      ${PYTHON_SITEPACKAGES_DIR}/tflite_runtime \
>      ${PYTHON_SITEPACKAGES_DIR}/tflite_runtime.egg-info \
> -- 
> 2.34.1

