Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACEFC282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 16:26:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.14140.1741710378345675795
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 09:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A445C40CAA;
	Tue, 11 Mar 2025 16:26:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hinfcIt0eBX5; Tue, 11 Mar 2025 16:26:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 69F5240A20;
	Tue, 11 Mar 2025 16:26:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2869A1642E8; Tue, 11 Mar 2025 12:26:13 -0400 (EDT)
Date: Tue, 11 Mar 2025 12:26:13 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: c-shilwant@ti.com
Cc: meta-arago@lists.yoctoproject.org,
	Denys Dmytriyenko <denys@konsulko.com>,
	Ryan Eatmon <reatmon@ti.com>, afd@ti.com
Subject: Re: [meta-arago][master/scarthgap][PATCH] meta-arago-extras: Add
 recipe for NNShark
Message-ID: <20250311162613.GB23729@denix.org>
References: <20250311143744.102671-1-afd@ti.com>
 <9a646c15-22bd-4a12-a1c8-6a0e86e77f13@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a646c15-22bd-4a12-a1c8-6a0e86e77f13@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Mar 2025 16:26:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15972

On Tue, Mar 11, 2025 at 09:28:44PM +0530, Chirag Shilwant via lists.yoctoproject.org wrote:
> Hello Andrew,
> 
> On 11/03/25 20:07, Andrew Davis via lists.yoctoproject.org wrote:
> >Signed-off-by: Andrew Davis <afd@ti.com>
> >---
> >  .../recipes-multimedia/nnshark/nnshark_git.bb | 38 +++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >  create mode 100644 meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
> >
> >diff --git a/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb b/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
> >new file mode 100644
> >index 00000000..1a3d8ad5
> >--- /dev/null
> >+++ b/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
> >@@ -0,0 +1,38 @@
> >+SUMMARY = "A GStreamer NNstreamer pipelines real-time profiling plugin"
> 
> 
> nitpick, the below sounds much better?
> 
> SUMMARY = "A GStreamer plugin to support real-time performance
> profiling of NNStreamer pipelines."

This is 86+ characters long, which is too long for the SUMMARY (72 max). Also, 
no dots at the end of the SUMMARY, only in the DESCRIPTION, which happens 
automatically if not set explicitly.


> >+HOMEPAGE = "https://github.com/nnstreamer/nnshark"
> >+
> >+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
> >+LIC_FILES_CHKSUM = "file://COPYING;md5=e1caa368743492879002ad032445fa97 \
> >+                    file://COPYING.LESSER;md5=66c40c88533cd228b5b85936709801c8"
> >+
> >+SRC_URI = "git://github.com/nnstreamer/nnshark.git;protocol=https;branch=master;name=nnshark \
> >+           git://github.com/GStreamer/common.git;protocol=https;branch=master;name=common;subdir=${S}/common \
> >+"
> 
> any specific reasons to not go with something like below,
> 
> SRC_URI = "gitsm://github.com/nnstreamer/nnshark.git;protocol=https;branch=master
> \
> "
> 
> SRCREV = "bcee91b23a98c981b87051fe1b2ad545991c4aa2"

Unless you want to control each SRCREV separately.


> >+SRCREV_FORMAT="default"
> >+SRCREV_nnshark="bcee91b23a98c981b87051fe1b2ad545991c4aa2"
> >+SRCREV_common="b64f03f6090245624608beb5d2fff335e23a01c0"
> >+
> >+S = "${WORKDIR}/git"
> 
> probably master might need a separate patch for UNPACKDIR stuff?

No changes for git based recipes needed.


> >+
> >+DEPENDS = "\
> >+    gtk-doc-native \
> >+    gstreamer1.0 \
> >+    gstreamer1.0-plugins-base \
> >+"
> >+
> >+inherit pkgconfig autotools-brokensep
> >+
> >+EXTRA_OECONF = " \
> >+        --disable-graphviz \
> >+        --disable-gtk-doc \
> >+"
> >+
> >+do_configure:prepend() {
> >+    sh autogen.sh --noconfigure
> >+}
> >+
> >+FILES:${PN} += "\
> >+       ${libdir}/gstreamer-1.0/libgstsharktracers.so \
> >+       ${libdir}/gstreamer-1.0/libgstsharktracers.la \
> >+"

