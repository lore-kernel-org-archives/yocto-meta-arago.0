Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 779C4FD9E1B
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 22:23:14 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.82406.1772144583459621317
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 14:23:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A929440C76;
	Thu, 26 Feb 2026 22:23:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VXkCwttQzc_T; Thu, 26 Feb 2026 22:23:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6B7A940A20;
	Thu, 26 Feb 2026 22:22:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 776DB17931A; Thu, 26 Feb 2026 17:22:58 -0500 (EST)
Date: Thu, 26 Feb 2026 17:22:58 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Brandon Brnich <b-brnich@ti.com>, meta-arago@lists.yoctoproject.org,
	Darren Etheridge <detheridge@ti.com>
Subject: Re: [meta-arago][master][PATCH] ti-test: Add Required Multimedia
 Packages to ti-test
Message-ID: <20260226222258.GE11121@denix.org>
References: <20260225190339.3295692-1-b-brnich@ti.com>
 <60f134bd-9981-4c2d-ae95-e35c9a5bd5d0@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60f134bd-9981-4c2d-ae95-e35c9a5bd5d0@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 26 Feb 2026 22:23:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17159

On Wed, Feb 25, 2026 at 02:04:30PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 2/25/2026 1:03 PM, Brandon Brnich wrote:
> >FFMPEG and MPV are required during automated testing. Explicitly add
> >these to ti-test.
> >
> >Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> >---
> >  meta-arago-test/recipes-core/packagegroups/ti-test.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> >diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >index f2ae1aef..c694545d 100644
> >--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >@@ -16,6 +16,7 @@ TI_TEST_BASE = "\
> >      dosfstools \
> >      ethtool \
> >      evtest \
> >+    ffmpeg \
> 
> This might be a problem... there are licensing issues related to
> ffmpeg that we address in meta-arago-distro, but moving this to
> meta-arago-test (a layer that *should* be able to be stand alone) is
> going to cause issues.
> 
> Denys,
> 
> Any ideas on how to address this?

So, we already explicitly include ffmpeg and mpv in the multimedia 
packagegroup in meta-arago-distro. Since ffmpeg and libav may include some 
codecs with questionable patent statuses, they are marked as "commercial" 
and need to be allowed explicitly, which we do in arago.conf with the 
corresponding LICENSE_FLAGS_ACCEPTED. That simply allows building those 
packages, but whether the corresponding codecs are enabled or not is 
determined by their PACKAGECONFIGs.

https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/conf/distro/arago.conf#n149
https://docs.yoctoproject.org/dev-manual/licenses.html#enabling-commercially-licensed-recipes

And I'd think for meta-arago-test layer it would be even easier, as it is not 
expected to be used for production. And we can set LICENSE_FLAGS_ACCEPTED in 
its layer.conf to make it work with other Distros besides Arago.


> >      fio \
> >      git \
> >      gst-devtools \
> >@@ -36,6 +37,7 @@ TI_TEST_BASE = "\
> >      lsof \
> >      media-ctl \
> >      memtester \
> >+    mpv \
> >      mstpd \
> >      mtd-utils \
> >      mtd-utils-ubifs \
> >@@ -145,7 +147,7 @@ TI_TEST_TI_TOOLS:append:am65xx   = " \
> >  "
> >  # Disable due to breakage
> >-#    viddec-test-app
> >+#    viddec-test-app
> >  TI_TEST_TI_TOOLS:append:j721e = " \
> >      pru-icss \
> >      ufs-utils \

