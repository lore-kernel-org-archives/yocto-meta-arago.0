Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E91C54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 14:57:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.23211.1748530671129760505
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 29 May 2025 07:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7EE3740CB3;
	Thu, 29 May 2025 14:57:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C18qcfiF0rMR; Thu, 29 May 2025 14:57:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 21A1B40C2C;
	Thu, 29 May 2025 14:57:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CFAE716952A; Thu, 29 May 2025 10:57:42 -0400 (EDT)
Date: Thu, 29 May 2025 10:57:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: p-bhagat@ti.com, meta-arago@lists.yoctoproject.org, praneeth@ti.com,
	reatmon@ti.com, v-singh1@ti.com, c-shilwant@ti.com, khasim@ti.com
Subject: Re: [meta-arago] [scarthgap][PATCH] meta-arago-distro:
 packagegroups: Add additional libraries for audio
Message-ID: <20250529145742.GS18383@denix.org>
References: <20250528102948.327229-1-p-bhagat@ti.com>
 <6fed1700-8ad2-454c-b3d8-48e5e0d76bed@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fed1700-8ad2-454c-b3d8-48e5e0d76bed@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 29 May 2025 14:57:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16241

On Thu, May 29, 2025 at 09:27:19AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> On 5/28/25 5:29 AM, Paresh Bhagat via lists.yoctoproject.org wrote:
> >Add fftw and libsndfile1 libraries in multimedia package group, which are
> >used for signal processing and audio manipulation. Update corresponding
> >sdk target file to package header files and libraries for development.
> >
> >Also add rpmsg DMA library for all k3 platforms and DSP offload example
> >for am62dxx-evm.
> >
> >Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> >---
> >  .../packagegroups/packagegroup-arago-tisdk-addons.bb        | 2 ++
> >  .../packagegroup-arago-tisdk-multimedia-sdk-target.bb       | 6 ++++++
> >  .../packagegroups/packagegroup-arago-tisdk-multimedia.bb    | 6 ++++++
> >  3 files changed, 14 insertions(+)
> >
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> >index 0d39907a..84ae1303 100644
> >--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> >+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> >@@ -53,6 +53,7 @@ UTILS:append:omap-a15 = " mmc-utils \
> >  UTILS:append:k3 = " mmc-utils \
> >                      switch-config \
> >                      irqbalance \
> >+                    ti-librpmsg-dma \
> >                      ti-rpmsg-char \
> >                      ti-rpmsg-char-examples \
> >                      statcol \
> >@@ -61,6 +62,7 @@ UTILS:append:k3 = " mmc-utils \
> >  UTILS:append:k3 = " ti-rtos-echo-test-fw"
> >  UTILS:append:am64xx = " pru-icss"
> >  UTILS:append:am62xx = " pru-icss"
> >+UTILS:append:am62dxx = " ti-librpmsg-dma-example"
> >  ARAGO_JAILHOUSE_ENABLE ?= "0"
> >  UTILS:append:am62xx = " ${@oe.utils.conditional("ARAGO_JAILHOUSE_ENABLE", "1", "jailhouse", "", d)}"
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
> >index 95939c09..73dc48e6 100644
> >--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
> >+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
> >@@ -13,7 +13,13 @@ MULTIMEDIA:append:dra7xx = " \
> >      hevc-arm-decoder-staticdev \
> >  "
> >+AUDIO = " \
> >+    fftw-dev \
> >+    libsndfile1-dev \
> 
> The -dev packages are not needed unless one wants to compile
> programs on the target, which we usually do not do by default.
> 
> The libraries themselves will be pulled in by programs that
> use them, so in this case adding `ti-librpmsg-dma-example`
> should do that.

No, the change is correct, as it is for the -sdk-target packagegroup.

This is specifically targeting the linux-devkit (host side SDK) in order to 
install the headers and other development pieces for cross-compiling on the 
host. This is also mentioned in the commit message above.

The corresponding rootfs side of the change is down below w/o -dev packages.


> Andrew
> 
> >+"
> >+
> >  RDEPENDS:${PN} = "\
> >+    ${AUDIO} \
> >      ${MULTIMEDIA} \
> >      packagegroup-arago-gst-sdk-target \
> >  "
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> >index 3aa1a051..6b0397b3 100644
> >--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> >+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> >@@ -11,6 +11,11 @@ MULTIMEDIA = " \
> >      libcamera-gst \
> >  "
> >+AUDIO = " \
> >+    fftw \
> >+    libsndfile1 \
> >+"
> >+
> >  MULTIMEDIA:append:arago = " ffmpeg mpv"
> >  MULTIMEDIA:omapl138 = ""
> >@@ -31,6 +36,7 @@ ACCEL_MM:append:omap-a15 = " \
> >  "
> >  RDEPENDS:${PN} = "\
> >+    ${AUDIO} \
> >      packagegroup-arago-gst \
> >      ${MULTIMEDIA} \
> >      ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', '${ACCEL_MM}', '', d)} \

