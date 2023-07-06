Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9886EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 03:57:27 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.14163.1688615840261577728
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 20:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D735240C16;
	Thu,  6 Jul 2023 03:57:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bfzqq4bNvO9S; Thu,  6 Jul 2023 03:57:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7E74140C13;
	Thu,  6 Jul 2023 03:57:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8D809163BD2; Wed,  5 Jul 2023 23:57:10 -0400 (EDT)
Date: Wed, 5 Jul 2023 23:57:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jai Luthra <j-luthra@ti.com>
Cc: meta-arago@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>, Gyan Gupta <g-gupta@ti.com>,
	Sai Sree Kartheek Adivi <s-adivi@ti.com>,
	Chirag Shilwant <c-shilwant@ti.com>,
	Devarsh Thakkar <devarsht@ti.com>
Subject: Re: [meta-arago] [master/kirkstone][PATCH 3/3] meta-arago-distro:
 Package libcamera in tisdk
Message-ID: <20230706035710.GC1518@denix.org>
References: <20230705130928.1201894-1-j-luthra@ti.com>
 <20230705130928.1201894-3-j-luthra@ti.com>
 <20230705231634.GB1518@denix.org>
 <zhdzg4xrynbfkrpjuf5mqm7ikn4n3bnozgaokhhknmkmlsno4l@d72cuqfqabwa>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zhdzg4xrynbfkrpjuf5mqm7ikn4n3bnozgaokhhknmkmlsno4l@d72cuqfqabwa>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 03:57:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14761

On Thu, Jul 06, 2023 at 09:13:43AM +0530, Jai Luthra wrote:
> Hi Denys,
> 
> On Jul 05, 2023 at 19:16:34 -0400, Denys Dmytriyenko wrote:
> > On Wed, Jul 05, 2023 at 06:39:28PM +0530, Jai Luthra via lists.yoctoproject.org wrote:
> > > Libcamera is useful for testing simple camera pipelines, without
> > > requiring manual configuration of media graph for all v4l2-subdevs.
> > > 
> > > Enable it for TISDK images, along with the optional libcamerasrc
> > 
> > typo - libcamersrc?
> > 
> 
> The gstreamer element is called "libcamerasrc" 
> https://github.com/libcamera-org/libcamera/blob/master/src/gstreamer/gstlibcamerasrc.cpp

Thanks. Got confused as the gstreamer plugin package is called libcamera-gst.


> > > gstreamer plugin package.
> > > 
> > > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > > ---
> > >  meta-arago-distro/conf/distro/arago.conf                       | 3 +++
> > >  .../packagegroups/packagegroup-arago-tisdk-multimedia.bb       | 2 ++
> > >  2 files changed, 5 insertions(+)
> > > 
> > > diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> > > index e0087ab7..bb074478 100644
> > > --- a/meta-arago-distro/conf/distro/arago.conf
> > > +++ b/meta-arago-distro/conf/distro/arago.conf
> > > @@ -128,6 +128,9 @@ PACKAGECONFIG:append:pn-gstreamer1.0 = " tracer-hooks"
> > >  # Enable kmssink in gstreamer
> > >  PACKAGECONFIG:append:pn-gstreamer1.0-plugins-bad = " kms"
> > >  
> > > +# Enable gstreamer plugin for libcamera
> > > +PACKAGECONFIG:append:pn-libcamera = " gst"
> > > +
> > >  # Disable pulseaudio routing in alsa by default
> > >  PACKAGECONFIG:remove:pn-alsa-plugins = "pulseaudio"
> > >  RDEPENDS:pulseaudio-server:remove = "alsa-plugins-pulseaudio-conf"
> > > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> > > index d06fbb6f..b4148882 100644
> > > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> > > @@ -8,6 +8,8 @@ inherit packagegroup
> > >  
> > >  MULTIMEDIA = " \
> > >      amsdk-av-files \
> > > +    libcamera \
> > > +    libcamera-gst \
> > >  "
> > >  
> > >  MULTIMEDIA:omapl138 = ""
> > > -- 
> > > 2.41.0

