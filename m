Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C5DC77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 23:27:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6972.1684798062396590679
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 May 2023 16:27:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9946F40C37;
	Mon, 22 May 2023 23:27:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BV17fLjAhzIx; Mon, 22 May 2023 23:27:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0EB0040429;
	Mon, 22 May 2023 23:27:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D3F931638FB; Mon, 22 May 2023 19:26:42 -0400 (EDT)
Date: Mon, 22 May 2023 19:26:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: r-ravikumar@ti.com, meta-arago@lists.yoctoproject.org,
	Ryan Eatmon <reatmon@ti.com>, j-choudhary@ti.com, a-bhatia1@ti.com,
	b-brnich@ti.com, "Nori, Sekhar" <nsekhar@ti.com>, g-gupta@ti.com,
	Andrew Davis <afd@ti.com>, Nishanth Menon <nm@ti.com>,
	"Bajjuri, Praneeth" <praneeth@ti.com>,
	Sai Sree Kartheek Adivi <s-adivi@ti.com>,
	"Raghavendra, Vignesh" <vigneshr@ti.com>
Subject: Re: [meta-arago][master/kirkstone][PATCH] conf: arago: Add flag to
 enable kmssink plugin
Message-ID: <20230522232642.GA9226@denix.org>
References: <20230518132636.17398-1-r-ravikumar@ti.com>
 <20230518180151.GS9226@denix.org>
 <eee47b3a-1431-1955-2f95-0c685816f2b3@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eee47b3a-1431-1955-2f95-0c685816f2b3@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 May 2023 23:27:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14442

https://patchwork.yoctoproject.org/project/arago/patch/20230522175821.510236-1-b-brnich@ti.com/

If you plan to make major changes to gstreamer or other upstream components, 
I'd recommend submitting them upstream to freedesktop. That's the best long 
term approach!

As meta-ti is a BSP layer, it must avoid heavily modifying generic upstream 
components. If there are HW-specific changes necessary, those must be done in 
a Yocto Project compliant way - see everything related to Mesa PVR changes 
done lately.


On Mon, May 22, 2023 at 11:39:31AM +0530, Devarsh Thakkar wrote:
> Hi Denys,
> 
> We have a query on location of gstreamer bbappends actually as below :
> 
> As I understand meta-ti is TI's BSP layer and meta-arago is arago distro
> layer, if someone want to use TI's BSP with some other distro in place of
> arago like poky, then I assume they should be able to take meta-ti and poky
> yocto layers. In that case to give them same base, shouldn't the gstreamer
> bbappends be present in meta-ti layer itself ?
> 
> Could you please share your opinion on this.
> 
> Regards
> Devarsh
> 
> On 18/05/23 23:31, Denys Dmytriyenko wrote:
> > On Thu, May 18, 2023 at 06:56:36PM +0530, Rahul T R via lists.yoctoproject.org wrote:
> >> Enable building kmssink plugin in gstreamer1.0-plugins-bad
> >>
> >> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> >> ---
> >>  meta-arago-distro/conf/distro/arago.conf | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> >> index 379b1d44..e32259a9 100644
> >> --- a/meta-arago-distro/conf/distro/arago.conf
> >> +++ b/meta-arago-distro/conf/distro/arago.conf
> >> @@ -113,6 +113,9 @@ PACKAGECONFIG:append:pn-openssl = " cryptodev-linux"
> >>  # Enable GST_TRACER logging in gstreamer
> >>  PACKAGECONFIG:append:pn-gstreamer1.0 = " tracer-hooks"
> >>  
> >> +# Enable kmssink in gstreamer
> >> +PACKAGECONFIG:append:pn-gstreamer1.0-plugins-bad = " kms"
> > 
> > FWIW, corresponding bbappend also sets this option, but it needs updating to 
> > the current gstreamer version:
> > 
> > https://git.yoctoproject.org/meta-arago/tree/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%25.bbappend#n3
> > 
> > 
> >>  # Disable pulseaudio routing in alsa by default
> >>  PACKAGECONFIG:remove:pn-alsa-plugins = "pulseaudio"
> >>  RDEPENDS:pulseaudio-server:remove = "alsa-plugins-pulseaudio-conf"
> >> -- 
> >> 2.17.1

