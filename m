Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F782CA101B
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 21:56:36 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.35541.1693950994024300879
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 05 Sep 2023 14:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AAACB40ACD;
	Tue,  5 Sep 2023 21:56:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id edZERcOFSoUU; Tue,  5 Sep 2023 21:56:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 79DB640AC9;
	Tue,  5 Sep 2023 21:56:29 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A2F8C163C9F; Tue,  5 Sep 2023 17:56:28 -0400 (EDT)
Date: Tue, 5 Sep 2023 17:56:28 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, meta-arago@lists.yoctoproject.org, k-bhargav@ti.com
Subject: Re: [meta-arago][kirkstone][PATCH v2] meta-arago-distro: add
 meta-clang dependency and llvmpipe
Message-ID: <20230905215628.GX3359@denix.org>
References: <20230905201852.4056578-2-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905201852.4056578-2-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 05 Sep 2023 21:56:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14885

On Tue, Sep 05, 2023 at 03:18:53PM -0500, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Devices that must use software rendering should use llvmpipe over the
> default softpipe. There are significant performance improvements
> associated with this change for devices like AM62A which lack a GPU.
> 
> This, unfortunately is only available on armv6+ devices so we'll
> conditionally drop this for the omapl138 device. (I'd switch this
> directly based on platform architecture but this doesn't appear to work
> correctly for PACKAGECONFIG strings in the distro.conf)
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf | 7 +++++++
>  meta-arago-distro/conf/layer.conf        | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 48f053bb..b029360b 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -102,6 +102,13 @@ PACKAGECONFIG:append:pn-piglit = " \
>  PACKAGECONFIG:pn-opengl-es-cts = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "surfaceless", d)}"
>  PACKAGECONFIG:pn-vulkan-cts = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "surfaceless", d)}"
>  
> +# Use llvmpipe for better performance with software rendering
> +# Only available for armv6+ devices
> +PACKAGECONFIG:append:pn-mesa = " gallium-llvm"
> +PACKAGECONFIG:remove:pn-mesa:omapl138 = " gallium-llvm"
> +PACKAGECONFIG:append:pn-mesa-pvr = " gallium-llvm"
> +PACKAGECONFIG:remove:pn-mesa-pvr:omapl138 = " gallium-llvm"

While :remove happens last, it's not recommended to rely on it, especially 
when you have nested overrides - there's no guaranteed order of processing 
overrides. A better option would be:

GALLIUM_LLVM = " gallium-llvm"
GALLIUM_LLVM:omapl138 = ""
PACKAGECONFIG:append:pn-mesa = "${GALLIUM_LLVM}"
PACKAGECONFIG:append:pn-mesa-pvr = "${GALLIUM_LLVM}"


>  # Enable encryption support in open62541
>  PACKAGECONFIG:append:pn-open62541 = " encrypt"
>  
> diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
> index 5de46fc9..02d5beaa 100644
> --- a/meta-arago-distro/conf/layer.conf
> +++ b/meta-arago-distro/conf/layer.conf
> @@ -19,6 +19,7 @@ LAYERDEPENDS_meta-arago-distro = " \
>      meta-python \
>      qt5-layer \
>      meta-arago-extras \
> +    clang-layer \
>  "
>  
>  LAYERRECOMMENDS_meta-arago-distro = " \
> -- 
> 2.41.0

