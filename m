Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02A9C43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 21:20:23 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.30789.1656624009704284360
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 14:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0700240D1D;
	Thu, 30 Jun 2022 21:20:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fLpt0AXVu0ja; Thu, 30 Jun 2022 21:20:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C493840D0C;
	Thu, 30 Jun 2022 21:20:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D2A07174992; Thu, 30 Jun 2022 17:20:01 -0400 (EDT)
Date: Thu, 30 Jun 2022 17:20:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: a-limaye@ti.com, "Bajjuri, Praneeth" <praneeth@ti.com>,
	"meta-arago@lists.yoctoproject.org" <meta-arago@lists.yoctoproject.org>,
	"Mantena, Prasanth" <p-mantena@ti.com>,
	"prashanth.ka@pathpartnertech.com" <prashanth.ka@pathpartnertech.com>,
	"R, Karthik" <karthik.ramanan@ti.com>,
	"Weaver, Lucas" <l-weaver@ti.com>
Subject: Re: [meta-arago][dunfell][PATCH] gstreamer: Adding tracer-hooks
 build flag to enable GST_TRACERS
Message-ID: <20220630212001.GZ18692@denix.org>
References: <20220629105304.15355-1-a-limaye@ti.com>
 <2ff910d2-0865-4418-3d66-6bcf8a2efb12@ti.com>
 <3188ef5fecbe458d8d04c4b2348147c2@ti.com>
 <20220630172553.GX18692@denix.org>
 <faf3ba53-a4ca-1826-bac7-eac13540a81e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <faf3ba53-a4ca-1826-bac7-eac13540a81e@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 30 Jun 2022 21:20:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13932

Correct. It could be a bbappend in meta-arago-distro, like the original patch, 
or it could be just added into meta-arago-distro/conf/distro/arago.conf like 
existing PACKAGECONFIG modifications there in lines 107-150:
https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/conf/distro/arago.conf#n107


On Thu, Jun 30, 2022 at 04:15:02PM -0500, Ryan Eatmon wrote:
> 
> So you're saying it should be in meta-arago-distro?
> 
> 
> 
> On 6/30/2022 12:25, Denys Dmytriyenko wrote:
> >This is distro-specific configuration and should not be done in distro-agnostic meta-arago-extras layer.
> >
> >
> >On Thu, Jun 30, 2022 at 11:58:09AM +0000, Aniket Limaye via lists.yoctoproject.org wrote:
> >>+Karthik
> >>
> >>Praneeth,
> >>
> >>This is not specific to codec. This can be used for profiling latencies and such for any GStreamer elements.
> >>It should not impact performance either. It just prints latency logs if an environment variable is set, similar to GST_DEBUG.
> >>
> >>
> >>-----Original Message-----
> >>From: Bajjuri, Praneeth <praneeth@ti.com>
> >>Sent: Thursday, June 30, 2022 3:29 PM
> >>To: Limaye, Aniket <a-limaye@ti.com>; meta-arago@lists.yoctoproject.org; Mantena, Prasanth <p-mantena@ti.com>; prashanth.ka@pathpartnertech.com
> >>Cc: Eatmon, Ryan <reatmon@ti.com>; Weaver, Lucas <l-weaver@ti.com>
> >>Subject: Re: [meta-arago][dunfell][PATCH] gstreamer: Adding tracer-hooks build flag to enable GST_TRACERS
> >>
> >>Prashanth,Prasanth,
> >>
> >>Please review.
> >>
> >>On 6/29/2022 4:23 PM, Aniket Limaye wrote:
> >>>Enables GST_TRACERS : an optional utility for profiling gstreamer applications
> >>
> >>Aniket,
> >>
> >>1. What is the impact of this with codec performance?
> >>2. Why is this optional utility need to enabled?
> >>
> >>
> >>>
> >>>Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> >>>---
> >>>   .../gstreamer/gstreamer1.0_1.16.%.bbappend                   | 5 +++++
> >>>   1 file changed, 5 insertions(+)
> >>>   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.16.%.bbappend
> >>>
> >>>diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.16.%.bbappend
> >>>new file mode 100644
> >>>index 00000000..d7bdaa04
> >>>--- /dev/null
> >>>+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.16.%.bbappend
> >>>@@ -0,0 +1,5 @@
> >>>+
> >>>+PACKAGECONFIG_append = " tracer-hooks"
> >>>+
> >>>+PR_append = ".arago0"
> >>>+

