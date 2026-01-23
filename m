Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166FAD77883
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 17:01:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.82.1769187682733293457
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 09:01:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0222840CC4;
	Fri, 23 Jan 2026 17:01:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3tIG5G5VKESI; Fri, 23 Jan 2026 17:01:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 809D240C2E;
	Fri, 23 Jan 2026 17:01:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D08FE177D8A; Fri, 23 Jan 2026 12:01:12 -0500 (EST)
Date: Fri, 23 Jan 2026 12:01:12 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Paresh Bhagat <p-bhagat@ti.com>, meta-arago@lists.yoctoproject.org,
	praneeth@ti.com, v-singh1@ti.com, c-shilwant@ti.com, khasim@ti.com,
	afd@ti.com, devarsht@ti.com
Subject: Re: [scarthgap][RFC PATCH 3/3] tisdk-default-image: Add audio
 server support for am62dxx
Message-ID: <20260123170112.GC11121@denix.org>
References: <20260123060348.2493115-1-p-bhagat@ti.com>
 <20260123060348.2493115-4-p-bhagat@ti.com>
 <446b4187-af51-4af9-b97f-97058399cdb6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <446b4187-af51-4af9-b97f-97058399cdb6@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 17:01:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17031

On Fri, Jan 23, 2026 at 10:11:06AM -0600, Ryan Eatmon wrote:
> 
> 
> On 1/23/2026 12:03 AM, Paresh Bhagat wrote:
> >Add pipewire and wireplumber audio stack support for am62dxx:
> >- Include pipewire core components and tools
> >- Add ALSA and PulseAudio compatibility layers
> >- Include wireplumber session manager
> >- Add GStreamer pipewire plugin
> >- Configure pipewire with proper modules and plugins
> >
> >Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> >---
> >  .../recipes-core/images/tisdk-default-image.bb  | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> >diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> >index 264d1b2d..d5db6fd4 100644
> >--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> >+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> >@@ -47,3 +47,20 @@ IMAGE_INSTALL += "\
> >      ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
> >      docker \
> >  "
> >+
> >+IMAGE_INSTALL:append:am62dxx = " \
> >+    pipewire \
> >+    pipewire-tools \
> >+    pipewire-alsa \
> >+    pipewire-pulse \
> >+    wireplumber \
> >+    speexdsp \
> >+    libpipewire \
> >+    pipewire-spa-plugins-meta \
> >+    pipewire-spa-tools \
> >+    pipewire-modules-meta \
> >+    pipewire-alsa-card-profile \
> >+    gstreamer1.0-pipewire \
> >+"
> 
> I'm sure at some point we will want to push the "more modern"
> pipewire to other boards as well.  What is the reasoning for only
> doing this on am62d?
> 
> Please create a PIPEWIRE variable that contains the above list and then:
> 
> IMAGE_INSTALL:append:am62dxx = " ${PIPEWIRE}"
> 
> Also, for ease of looking up packages, please sort the list alphabetically.
> 
> 
> >+PACKAGECONFIG:append:am62dxx:pn-pipewire = " pipewire-jack pipewire-modules pipewire-spa-plugins"

Huh? pipewire-modules and pipewire-spa-plugins are not PACKAGECONFIGs, but 
packages...


> >+PACKAGECONFIG:remove:am62dxx:pn-pipewire = " jack"

No leading space is needed here.


> Agree with Yogesh.  This is not appropriate in this file.  This
> should be in a pipewire bbappend.

Or rather generically in the distro config, as I suggested last week.

-- 
Denys

