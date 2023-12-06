Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2DCC10DCE
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 22:38:41 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.51415.1701902316025113542
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 14:38:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C903440CB5;
	Wed,  6 Dec 2023 22:38:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JJOoNd0ZLqwD; Wed,  6 Dec 2023 22:38:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 625C140C2C;
	Wed,  6 Dec 2023 22:38:25 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A3AE7163D84; Wed,  6 Dec 2023 17:38:24 -0500 (EST)
Date: Wed, 6 Dec 2023 17:38:24 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: sinthu.raja@mistralsolutions.com, denys@konsulko.com, praneeth@ti.com,
	meta-arago@lists.yoctoproject.org, u-kumar1@ti.com,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: Re: [meta-arago][krikstone][PATCH RFC 2/4] gst-plugins-ti: Enable
 network task flag for do_configure
Message-ID: <20231206223824.GC11745@denix.org>
References: <20231206143618.27770-1-sinthu.raja@ti.com>
 <20231206143618.27770-3-sinthu.raja@ti.com>
 <8851630a-004c-4cfa-8ded-a96a07f8c72f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8851630a-004c-4cfa-8ded-a96a07f8c72f@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Dec 2023 22:38:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15047

On Wed, Dec 06, 2023 at 09:33:31AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 12/6/2023 8:36 AM, Sinthu Raja M via lists.yoctoproject.org wrote:
> >From: Sinthu Raja <sinthu.raja@ti.com>
> >
> >The Ducati and VPE gst plugins requires network during the do_configure task
> >so, enable the network task flag for the same.
> 
> Why does it require network?  Can you elaborate a little more?

Because sources in git didn't have common gstreamer-specific autotools 
files, scripts and supporting stuff, which were pulled and setup as a 
"common" git submodule from here:
git://anongit.freedesktop.org/gstreamer/common
https://cgit.freedesktop.org/gstreamer/common/

That is done by autogen.sh in do_configure():
https://git.yoctoproject.org/meta-arago/tree/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ti.inc
https://git.ti.com/cgit/glsdk/gst-plugin-ducati/tree/autogen.sh

That's also been the case for git versions of the upstream gstreamer and 
plugins years ago. So, autogen.sh had to be called after do_unpack() and 
before do_configure(), but the former is a python function.

Released versions of gstreamer and plugins never had this issue, as they 
come with all required pieces already packaged in a tarball.

All git-versioned recipes for gstreamer and plugins were removed from 
OE-Core almost 7 years ago:
https://git.openembedded.org/openembedded-core/commit/?id=2b15451e3f1b9fb9a7f44317f3f9cd22d8712ff5

Moreover, gstreamer builds have migrated from autotools to meson around the 
same time and this "common" submodule/tree hasn't been used or updated for 
quite some time. Unfortunaly, gst-plugins-ti haven't been touched for 5 years 
and still use the old (ancient) "common" submodule for autotools stuff...

So, proper, but most involved solution would be to migrate gst-plugins-ti to 
use meson.

Otherwise, you can add the "common" tree to SRC_URI and set the corresponding 
SRCREV. That should satisfy git submodule update, but may need extra tweaking.

SRC_URI += "git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common"
SRCREV_common = "011bcc8a0fc7f798ee874a7ba899123fb2470e22"

BTW, this commit ^^^ that is used for "common" submodule in gst-plugins-ti 
is 13 years old and dated 2010-10-27!!!


> >Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> >---
> >  .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb           | 2 ++
> >  .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb              | 2 ++
> >  2 files changed, 4 insertions(+)
> >
> >diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
> >index 1ff2dfb0..99a5615c 100644
> >--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
> >+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
> >@@ -18,4 +18,6 @@ SRC_URI = " \
> >      file://0001-gstducati-configure.ac-stop-using-export-symbols-reg.patch \
> >  "
> >+do_configure[network] = "1"
> >+
> >  FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> >diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
> >index 237031b1..25d4d9c2 100644
> >--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
> >+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
> >@@ -15,3 +15,5 @@ SRCREV = "b9dba5a8bc7d14d55125abdce04672e3dc30bbdf"
> >  SRC_URI = "git://git.ti.com/git/glsdk/gst-plugin-vpe.git;protocol=https \
> >             file://0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch \
> >  "
> >+
> >+do_configure[network] = "1"

