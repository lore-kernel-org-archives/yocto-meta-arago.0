Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D834CD8CB9
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 17:37:17 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1437.1781026628179577398
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 10:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1B4E840C8C;
	Tue,  9 Jun 2026 17:37:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3NQGFhybzvwt; Tue,  9 Jun 2026 17:37:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D0F6D40C81;
	Tue,  9 Jun 2026 17:37:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DCF3417EC7F; Tue,  9 Jun 2026 13:37:03 -0400 (EDT)
Date: Tue, 9 Jun 2026 13:37:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: t-lannynd@ti.com
Cc: "Hegde, Yogesh" <y-hegde@ti.com>,
	"meta-arago@lists.yoctoproject.org" <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master/wrynose][PATCH] meta-arago-distro:
 chromium: add force-h264-youtube extension
Message-ID: <20260609173703.GG23325@denix.org>
References: <20260608201827.3937832-1-t-lannynd@ti.com>
 <1139b2d2-097b-4ecc-9eb8-9824d5a5e983@ti.com>
 <3881571c2ada40aa93258bbc39896c43@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3881571c2ada40aa93258bbc39896c43@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 09 Jun 2026 17:37:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17559

On Tue, Jun 09, 2026 at 05:09:37PM +0000, Thorsten Lannynd via lists.yoctoproject.org wrote:
> On 6/9/26 1:22 AM, Yogesh Hedge via lists.yoctoproject.org wrote:
> > Hi Thorsten,
> > Thanks for the patch.
> > 
> > On 6/9/26 01:48, Thorsten Lannynd via lists.yoctoproject.org wrote:
> > > Install a lightweight Chrome extension that forces YouTube to serve
> > > H.264 (avc1) by blocking VP8, VP9, and AV1 via
> > MediaSource.isTypeSupported.
> > > This enables Wave5 hardware video decoding on YouTube, which only
> > > supports
> > > H.264 and HEVC, without requiring a third-party extension to be
> > > manually installed through the Chrome Web Store before use.
> > >
> > > Installed at /usr/lib/chromium/extensions/force-h264-youtube
> > > and --load-extension is appended to the chromium-wrapper launch script.
> > >
> > > Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> > 
> > Is Wave5 hardware video decoding supported on all SoCs?
> > If not, please limit the patches to SoCs/machines that support it.

This will make Chromium package machine-specific. So, the same binary and 
shared state can't be re-used across different platforms of the same 
architecture, e.g. aarch64. You'd end up re-building Chromium for each 
platform individually. Chromium is already a beast and is taking forever to 
build.


> Thank you for the review. I will make the extension not enabled by default.
> The only platform that does not support Wave5 but supports Chromium is
> AM62x.

Can the extension be made as a separate machine-specific package and marked 
as not compatible with AM62x. I wonder if Chromium will run just fine when 
started with --load-extension passed to not existing extenstion. Otherwise 
some run-time check for it's presence can be made in the wrapper script...


> > > ---
> > >  .../chromium/chromium-ozone-wayland-arago.inc | 15 +++++++++++++++
> > >  .../force-h264-youtube/force_h264.js          |  4 ++++
> > >  .../force-h264-youtube/manifest.json          | 19 +++++++++++++++++++
> > >  3 files changed, 38 insertions(+)
> > >  create mode 100644
> > > meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browse
> > > r/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js
> > >  create mode 100644
> > > meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browse
> > > r/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json
> > >
> > > diff --git
> > > a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brow
> > > ser/chromium/chromium-ozone-wayland-arago.inc
> > > b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brow
> > > ser/chromium/chromium-ozone-wayland-arago.inc
> > > index ab092fa1..14c12767 100644
> > > ---
> > > a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brow
> > > ser/chromium/chromium-ozone-wayland-arago.inc
> > > +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-
> > > +++ browser/chromium/chromium-ozone-wayland-arago.inc
> > > @@ -1,5 +1,7 @@
> > >  PR:append = ".arago0"
> > >
> > > +EXTENSION_DIR = "/usr/lib/chromium/extensions/force-h264-youtube"
> > > +
> > >  FILESEXTRAPATHS:prepend := "${THISDIR}/chromium-ozone-wayland:"
> > >
> > >  PACKAGECONFIG:append = " proprietary-codecs"
> > > @@ -9,4 +11,17 @@ SRC_URI:append = " \
> > >                    file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-
> > V4L.patch \
> > >                    file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-
> > V4L2.patch \
> > >
> > > file://0004-media-gpu-v4l2-Avoid-placing-incomplete-H264-access-.patch
> > > \
> > > +                  file://force-h264-youtube/force_h264.js \
> > > +                  file://force-h264-youtube/manifest.json \
> > >                    "
> > > +
> > > +do_install:append() {
> > > +    install -d ${D}${EXTENSION_DIR}
> > > +    install -m 0644 ${WORKDIR}/sources/force-h264-youtube/force_h264.js \
> > > +                    ${WORKDIR}/sources/force-h264-youtube/manifest.json \
> > > +                    ${D}${EXTENSION_DIR}/
> > > +    sed -i 's|--ozone-platform=wayland"|--ozone-platform=wayland --load-
> > extension=${EXTENSION_DIR}"|' \
> > > +            ${D}/usr/lib/chromium/chromium-wrapper
> > > +}
> > > +
> > > +FILES:${PN}:append = " ${EXTENSION_DIR}"
> > > diff --git
> > > a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brow
> > > ser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js
> > > b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brow
> > > ser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js
> > > new file mode 100644
> > > index 00000000..5e942321
> > > --- /dev/null
> > > +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-
> > > +++ browser/chromium/chromium-ozone-wayland/force-h264-
> > youtube/force_h
> > > +++ 264.js
> > > @@ -0,0 +1,4 @@
> > > +(function() {
> > > +    var orig = MediaSource.isTypeSupported.bind(MediaSource);
> > > +    MediaSource.isTypeSupported = function(t) { return
> > > +/vp8|vp09?|av01/i.test(t) ? false : orig(t); }; })();
> > > diff --git
> > > a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brow
> > > ser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json
> > > b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brow
> > > ser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json
> > > new file mode 100644
> > > index 00000000..fc69be22
> > > --- /dev/null
> > > +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-
> > > +++ browser/chromium/chromium-ozone-wayland/force-h264-
> > youtube/manifes
> > > +++ t.json
> > > @@ -0,0 +1,19 @@
> > > +{
> > > +  "manifest_version": 3,
> > > +  "name": "Force H.264",
> > > +  "version": "1.0.0",
> > > +  "description": "Lightweight extension that forces YouTube to play
> > > +H.264 (avc1) by blocking VP8, VP9, and AV1",
> > > +  "content_scripts": [
> > > +    {
> > > +      "matches": [
> > > +        "*://*.youtube.com/*",
> > > +        "*://*.youtube-nocookie.com/*",
> > > +        "*://*.youtu.be/*"
> > > +      ],
> > > +      "js": ["force_h264.js"],
> > > +      "run_at": "document_start",
> > > +      "world": "MAIN",
> > > +      "all_frames": true
> > > +    }
> > > +  ]
> > > +}
> > 
> > ---
> > -- Yogesh Hegde

