Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5EEECAC5B9
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 19:43:15 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.467.1758829386458047391
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 12:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AD90B40CAA;
	Thu, 25 Sep 2025 19:43:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w-oSb5uiWSTq; Thu, 25 Sep 2025 19:43:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 854C940A30;
	Thu, 25 Sep 2025 19:43:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3F64E163B0F; Thu, 25 Sep 2025 15:43:03 -0400 (EDT)
Date: Thu, 25 Sep 2025 15:43:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: meta-arago@lists.yoctoproject.org,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-arago] [master][PATCH v2] linux-firmware-arago: correct
 removal of overlapping FW
Message-ID: <20250925194303.GU3125@denix.org>
References: <20250925193019.2938469-1-denis@denix.org>
 <1d9dd520-df9c-4b7a-974d-27b8c0455bc6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d9dd520-df9c-4b7a-974d-27b8c0455bc6@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 25 Sep 2025 19:43:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16642

On Thu, Sep 25, 2025 at 02:38:29PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> On 9/25/25 2:30 PM, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@konsulko.com>
> >
> >Use the correct variable, instead of hard-coding /lib/firmware, when
> >removing firmware images that overlap with the ones from meta-ti-bsp.
> >This way it will work properly even when usrmerge is enabled.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >---
> >v2 - separate patches for master and scarthgap
> >
> >  .../recipes-kernel/linux-firmware/linux-firmware-arago.inc | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> >diff --git a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware-arago.inc b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware-arago.inc
> >index 43c54575..30bf399d 100644
> >--- a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware-arago.inc
> >+++ b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware-arago.inc
> >@@ -1,6 +1,7 @@
> >-PR:append = ".arago2"
> >+PR:append = ".arago3"
> >+# meta-ti-bsp packages newer versions on these
> >  do_install:append() {
> >-	rm -rf  ${D}/lib/firmware/ti-connectivity/
> >-	rm -rf  ${D}/lib/firmware/cadence/
> >+	rm -rf  ${D}${nonarch_base_libdir}/firmware//ti-connectivity/
> >+	rm -rf  ${D}${nonarch_base_libdir}/firmware//cadence/
> 
> "//" double slash, probably doesn't hurt but does look odd..

Oops, v3 is coming.

