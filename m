Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DCAFC43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 17:26:02 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.28283.1656609961575649387
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 10:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D92D140D01;
	Thu, 30 Jun 2022 17:26:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C-Nd2FSMPKAU; Thu, 30 Jun 2022 17:26:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9388240D00;
	Thu, 30 Jun 2022 17:25:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2982E17498D; Thu, 30 Jun 2022 13:25:53 -0400 (EDT)
Date: Thu, 30 Jun 2022 13:25:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: a-limaye@ti.com
Cc: "Bajjuri, Praneeth" <praneeth@ti.com>,
	"meta-arago@lists.yoctoproject.org" <meta-arago@lists.yoctoproject.org>,
	"Mantena, Prasanth" <p-mantena@ti.com>,
	"prashanth.ka@pathpartnertech.com" <prashanth.ka@pathpartnertech.com>,
	"R, Karthik" <karthik.ramanan@ti.com>,
	"Eatmon, Ryan" <reatmon@ti.com>, "Weaver, Lucas" <l-weaver@ti.com>
Subject: Re: [meta-arago][dunfell][PATCH] gstreamer: Adding tracer-hooks
 build flag to enable GST_TRACERS
Message-ID: <20220630172553.GX18692@denix.org>
References: <20220629105304.15355-1-a-limaye@ti.com>
 <2ff910d2-0865-4418-3d66-6bcf8a2efb12@ti.com>
 <3188ef5fecbe458d8d04c4b2348147c2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3188ef5fecbe458d8d04c4b2348147c2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 30 Jun 2022 17:26:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13928

This is distro-specific configuration and should not be done in distro-agnostic meta-arago-extras layer.


On Thu, Jun 30, 2022 at 11:58:09AM +0000, Aniket Limaye via lists.yoctoproject.org wrote:
> +Karthik
> 
> Praneeth,
> 
> This is not specific to codec. This can be used for profiling latencies and such for any GStreamer elements.
> It should not impact performance either. It just prints latency logs if an environment variable is set, similar to GST_DEBUG.
> 
> 
> -----Original Message-----
> From: Bajjuri, Praneeth <praneeth@ti.com> 
> Sent: Thursday, June 30, 2022 3:29 PM
> To: Limaye, Aniket <a-limaye@ti.com>; meta-arago@lists.yoctoproject.org; Mantena, Prasanth <p-mantena@ti.com>; prashanth.ka@pathpartnertech.com
> Cc: Eatmon, Ryan <reatmon@ti.com>; Weaver, Lucas <l-weaver@ti.com>
> Subject: Re: [meta-arago][dunfell][PATCH] gstreamer: Adding tracer-hooks build flag to enable GST_TRACERS
> 
> Prashanth,Prasanth,
> 
> Please review.
> 
> On 6/29/2022 4:23 PM, Aniket Limaye wrote:
> > Enables GST_TRACERS : an optional utility for profiling gstreamer applications
> 
> Aniket,
> 
> 1. What is the impact of this with codec performance?
> 2. Why is this optional utility need to enabled?
> 
> 
> > 
> > Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> > ---
> >   .../gstreamer/gstreamer1.0_1.16.%.bbappend                   | 5 +++++
> >   1 file changed, 5 insertions(+)
> >   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.16.%.bbappend
> > 
> > diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.16.%.bbappend
> > new file mode 100644
> > index 00000000..d7bdaa04
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.16.%.bbappend
> > @@ -0,0 +1,5 @@
> > +
> > +PACKAGECONFIG_append = " tracer-hooks"
> > +
> > +PR_append = ".arago0"
> > +

