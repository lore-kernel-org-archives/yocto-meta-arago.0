Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46577C61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 17:38:08 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.720.1787938684743697274
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 10:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AD6E140C56;
	Fri, 28 Aug 2026 17:38:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F8-t1ULSL9gb; Fri, 28 Aug 2026 17:38:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1973440BA8;
	Fri, 28 Aug 2026 17:37:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1C5B417C887; Fri, 28 Aug 2026 13:37:54 -0400 (EDT)
Date: Fri, 28 Aug 2026 13:37:54 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Hari Prasath Gujulan Elango <gehariprasath@ti.com>, reatmon@ti.com,
	praneeth@ti.com, denys@konsulko.com,
	meta-arago@lists.yoctoproject.org, s-kapoor@ti.com, p-gupta5@ti.com,
	u-kumar1@ti.com
Subject: Re: [meta-arago][scarthgap][PATCH] tisdk-default-image: add
 ti-vendor-kernel-headers-dev to DEVTOOLS
Message-ID: <20260828173754.GJ19759@denix.org>
References: <20260828080918.1161144-1-gehariprasath@ti.com>
 <e2ebea10-e5c3-42d4-b6c3-5675da4923a9@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2ebea10-e5c3-42d4-b6c3-5675da4923a9@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Aug 2026 17:38:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17622

On Fri, Aug 28, 2026 at 09:18:55AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> On 8/28/26 3:09 AM, Hari Prasath Gujulan Elango wrote:
> >TI vendor kernel uapi additions (e.g. DMA_HEAP_IOCTL_EXPORT) isn't
> >present in the standard header provided by the linux-libc-headers,
> >so on-target compilation against them needs the ti-vendor-kernel-headers-dev
> >package alongside linux-libc-headers-dev.
> >
> >Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
> >---
> >  meta-arago-distro/recipes-core/images/tisdk-default-image.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> >diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> >index 264d1b2d..cac6628e 100644
> >--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> >+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> >@@ -36,6 +36,7 @@ IMAGE_FSTYPES:remove:omapl138 = "ubifs ubi"
> >  DEVTOOLS = " \
> >      linux-libc-headers-dev \
> >+    ti-vendor-kernel-headers-dev \
> 
> What application(s) actually need this header file, shouldn't they
> add it to their DEPENDS line instead of unconditionally installing
> for this image? (and why only this image, we have other images
> folks build on)

tisdk-default-image is the only image that enables on-target development, 
hence it installs compiler, headers, debug tools, etc. into the rootfs to be 
used during runtime. For build time, the corresponding application should 
indeed list required headers in DEPENDS.


> >      build-essential \
> >      packagegroup-core-tools-debug \
> >      git \

