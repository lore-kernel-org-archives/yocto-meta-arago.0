Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D785BC98304
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 20:28:06 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4800.1790195285261981034
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 13:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 21BED40CB4;
	Wed, 23 Sep 2026 20:28:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7pWD91ynT81N; Wed, 23 Sep 2026 20:28:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B6AA640CB0;
	Wed, 23 Sep 2026 20:27:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BB80717EA34; Wed, 23 Sep 2026 16:27:58 -0400 (EDT)
Date: Wed, 23 Sep 2026 16:27:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: t-lannynd@ti.com
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com, detheridge@ti.com,
	b-brnich@ti.com
Subject: Re: [meta-arago] [PATCH v3] meta-arago-disto: chromium: split
 force-h264-youtube extension into its own package
Message-ID: <20260923202758.GD4190@denix.org>
References: <20260923201126.1084567-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923201126.1084567-1-t-lannynd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 23 Sep 2026 20:28:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17705

On Wed, Sep 23, 2026 at 03:11:26PM -0500, Thorsten Lannynd via lists.yoctoproject.org wrote:
> Split force-h264-youtube into its own recipe, built only for boards with
> cnm-wave-fw. chromium-wrapper checks for the extension directory at runtime
> before adding --load-extension.
> 
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ---
> 
> v3:
> - Separate the extension into its own package and install on boards with
>   Wave5 firmware
> - Enable extension if extension directory exists

This looks much better, thank you.


> v2:
> - Shorten commit message title
> 
>  .../force_h264.js                             |  0
>  .../manifest.json                             |  0
>  ...mium-extension-force-h264-youtube_1.0.0.bb | 24 +++++++++++++++++++
>  .../chromium/chromium-ozone-wayland-arago.inc | 12 ++--------
>  4 files changed, 26 insertions(+), 10 deletions(-)
>  rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/{chromium/chromium-ozone-wayland/force-h264-youtube => chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube}/force_h264.js (100%)
>  rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/{chromium/chromium-ozone-wayland/force-h264-youtube => chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube}/manifest.json (100%)
>  create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb
> 
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/force_h264.js
> similarity index 100%
> rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js
> rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/force_h264.js
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/manifest.json
> similarity index 100%
> rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json
> rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/manifest.json
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb
> new file mode 100644
> index 00000000..16473415
> --- /dev/null
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "Chromium extension that forces YouTube to use H.264 codec"
> +LICENSE = "CLOSED"
> +
> +python () {
> +    if not bb.utils.contains("MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS", "cnm-wave-fw", True, False, d):
> +        raise bb.parse.SkipRecipe("cnm-wave-fw not in MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS")

It will all depend on how you plan to pull this in to your image. But just an 
FYI, if you simply try to add this as an RDEPENDS in a packagegroup or image, 
it will fail for platforms that don't have cnm-wave-fw. As RDEPENDS is a hard 
dependency and SkipRecipe() breaks it and results in a failure. You would 
probably need to have a similar conditional to check for cnm-wave-fw presence 
and only then add to RDEPENDS...


> +}
> +
> +RDEPENDS:${PN} = "chromium-ozone-wayland"
> +
> +SRC_URI = "file://force_h264.js \
> +           file://manifest.json \
> +           "
> +
> +EXTENSION_DIR = "${libdir}/chromium/extensions/force-h264-youtube"
> +
> +do_install() {
> +    install -d ${D}${EXTENSION_DIR}
> +    install -m 0644 ${WORKDIR}/force_h264.js \
> +                    ${WORKDIR}/manifest.json \
> +                    ${D}${EXTENSION_DIR}/
> +}
> +
> +FILES:${PN} = "${EXTENSION_DIR}"
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> index d8eb0204..93c802a6 100644
> --- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> @@ -1,7 +1,5 @@
>  PR:append = ".arago0"
>  
> -EXTENSION_DIR = "/usr/lib/chromium/extensions/force-h264-youtube"
> -
>  FILESEXTRAPATHS:prepend := "${THISDIR}/chromium-ozone-wayland:"
>  
>  PACKAGECONFIG:append = " proprietary-codecs"
> @@ -11,15 +9,9 @@ SRC_URI:append = " \
>                    file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch \
>                    file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch \
>                    file://0004-media-gpu-v4l2-Avoid-placing-incomplete-H264-access-.patch \
> -                  file://force-h264-youtube/force_h264.js \
> -                  file://force-h264-youtube/manifest.json \
>                    "
>  
>  do_install:append() {
> -    install -d ${D}${EXTENSION_DIR}
> -    install -m 0644 ${WORKDIR}/sources/force-h264-youtube/force_h264.js \
> -                    ${WORKDIR}/sources/force-h264-youtube/manifest.json \
> -                    ${D}${EXTENSION_DIR}/
> +    sed -i "/^CHROME_EXTRA_ARGS=/a [ -d \"${libdir}/chromium/extensions/force-h264-youtube\" ] && CHROME_EXTRA_ARGS=\"\$CHROME_EXTRA_ARGS --load-extension=${libdir}/chromium/extensions/force-h264-youtube\"" \
> +        ${D}${libdir}/chromium/chromium-wrapper
>  }
> -
> -FILES:${PN}:append = " ${EXTENSION_DIR}"
> -- 
> 2.34.1

