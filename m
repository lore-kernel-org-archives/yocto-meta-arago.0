Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BA4C88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 20:57:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.566.1789505848937476566
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 15 Sep 2026 13:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B818540C79;
	Tue, 15 Sep 2026 20:57:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IyQSQCWuJLbW; Tue, 15 Sep 2026 20:57:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5AB7940BA9;
	Tue, 15 Sep 2026 20:57:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9FD8917D36F; Tue, 15 Sep 2026 16:57:22 -0400 (EDT)
Date: Tue, 15 Sep 2026 16:57:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Thorsten Lannynd <t-lannynd@ti.com>, meta-arago@lists.yoctoproject.org,
	detheridge@ti.com, b-brnich@ti.com
Subject: Re: [meta-arago][master/wrynose][PATCH v2] chromium: restrict
 force-h264-youtube extension to supported boards
Message-ID: <20260915205722.GU19759@denix.org>
References: <20260911183900.631578-1-t-lannynd@ti.com>
 <e3a40718-caff-4063-8a8d-cb0aa08078f8@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3a40718-caff-4063-8a8d-cb0aa08078f8@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 15 Sep 2026 20:57:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17671

On Fri, Sep 11, 2026 at 05:13:15PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 9/11/2026 1:39 PM, Thorsten Lannynd wrote:
> >Split force-h264-youtube into its own package, enabled only on boards that support
> >H264 YouTube hardware accelerated playback.
> >
> >Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> >---
> >
> >v2:
> >- Shorten commit message title
> >
> >  .../chromium/chromium-ozone-wayland-arago.inc | 29 ++++++++++++++-----
> >  1 file changed, 22 insertions(+), 7 deletions(-)
> >
> >diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> >index d8eb0204..108f77c7 100644
> >--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> >+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> >@@ -1,6 +1,6 @@
> >  PR:append = ".arago0"
> >-EXTENSION_DIR = "/usr/lib/chromium/extensions/force-h264-youtube"
> >+EXTENSION_DIR = "${libdir}/chromium/extensions/force-h264-youtube"
> >  FILESEXTRAPATHS:prepend := "${THISDIR}/chromium-ozone-wayland:"
> >@@ -15,11 +15,26 @@ SRC_URI:append = " \
> >                    file://force-h264-youtube/manifest.json \
> >                    "
> >+PACKAGES:append = " ${PN}-force-h264-youtube"
> >+FILES:${PN}-force-h264-youtube = "${EXTENSION_DIR}"
> >+RDEPENDS:${PN}-force-h264-youtube = "${PN}"
> >+
> >+CHROMIUM_H264_EXT ?= ""
> >+CHROMIUM_H264_EXT:am62pxx-evm = "1"
> >+CHROMIUM_H264_EXT:j721s2-evm  = "1"
> >+CHROMIUM_H264_EXT:j722s-evm   = "1"
> >+CHROMIUM_H264_EXT:j742s2-evm  = "1"
> >+CHROMIUM_H264_EXT:j784s4-evm  = "1"
> 
> Would it be better to create a MACHINE_FEATURES for h264 and then
> have this just key off that.  Then you could send a second patch to
> meta-ti-bsp that adds that feature?
> 
> Denys, thoughts?

Yeah, MACHINE_FEATURES makes sense.

Looking over the corresponding data sheets, both H.264 and H.265 are handled 
by the Wave5 Codec IP in SoC. And for those SoCs we have "cnm-wave-fw" FW 
recipe in meta-ti that gets pulled by MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS 
list. So, another option would be to check if "cnm-wave-fw" exists in this 
list...

But, making this conditional on machine or its features inside chromium recipe 
will have ill effects - the resulting package will no longer can be re-used 
across machines of the same architecture. The entire chromium package will 
have to be marked as machine-specific and gets rebuilt for each machine, due 
to the next line below:


> >+RRECOMMENDS:${PN}:append = " ${@bb.utils.contains('CHROMIUM_H264_EXT', '1', '${PN}-force-h264-youtube', '', d)}"
> >+
> >  do_install:append() {
> >-    install -d ${D}${EXTENSION_DIR}
> >-    install -m 0644 ${WORKDIR}/sources/force-h264-youtube/force_h264.js \
> >-                    ${WORKDIR}/sources/force-h264-youtube/manifest.json \
> >-                    ${D}${EXTENSION_DIR}/
> >+    if [ -n "${CHROMIUM_H264_EXT}" ]; then
> >+        install -d ${D}${EXTENSION_DIR}
> >+        install -m 0644 ${WORKDIR}/sources/force-h264-youtube/force_h264.js \
> >+                        ${WORKDIR}/sources/force-h264-youtube/manifest.json \
> >+                        ${D}${EXTENSION_DIR}/
> >+        sed -i "s|CHROME_EXTRA_ARGS=\"\(.*\)\"|CHROME_EXTRA_ARGS=\"\1 --load-extension=${EXTENSION_DIR}\"|" \
> >+            ${D}${libdir}/chromium/chromium-wrapper
> >+    fi
> >  }
> >-
> >-FILES:${PN}:append = " ${EXTENSION_DIR}"

