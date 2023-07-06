Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB12DEB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 03:43:57 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.14017.1688615029502914676
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 20:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Sb3Mn1Fp;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: j-luthra@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3663hj4S061713;
	Wed, 5 Jul 2023 22:43:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688615025;
	bh=E+Wydnp0snGjaxIS/QXqLvJUMZrnbcWyeCz7egpTRkk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Sb3Mn1Fp2WlwAKp11eIx3lzcZ8rXbBrn96fXeXKQSzca3BidlLEKsCPjHXG7DscWd
	 7oDKo/w+OhQ3BIdhGVJXWpcp6YUwuMdHSAEBejT56zsmdRPhcO2wdVzTgamHeLR8az
	 m66kSMcDRMokxfyNescfw11tqTq8/9t7QsszLbvQ=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3663hj2a082888
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Jul 2023 22:43:45 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jul 2023 22:43:45 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jul 2023 22:43:45 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3663hi7r046094;
	Wed, 5 Jul 2023 22:43:45 -0500
Date: Thu, 6 Jul 2023 09:13:43 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>, Gyan Gupta <g-gupta@ti.com>,
        Sai Sree
 Kartheek Adivi <s-adivi@ti.com>,
        Chirag Shilwant <c-shilwant@ti.com>,
        Devarsh
 Thakkar <devarsht@ti.com>
Subject: Re: [meta-arago] [master/kirkstone][PATCH 3/3] meta-arago-distro:
 Package libcamera in tisdk
Message-ID: <zhdzg4xrynbfkrpjuf5mqm7ikn4n3bnozgaokhhknmkmlsno4l@d72cuqfqabwa>
References: <20230705130928.1201894-1-j-luthra@ti.com>
 <20230705130928.1201894-3-j-luthra@ti.com>
 <20230705231634.GB1518@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230705231634.GB1518@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 03:43:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14757

Hi Denys,

On Jul 05, 2023 at 19:16:34 -0400, Denys Dmytriyenko wrote:
> On Wed, Jul 05, 2023 at 06:39:28PM +0530, Jai Luthra via lists.yoctoproject.org wrote:
> > Libcamera is useful for testing simple camera pipelines, without
> > requiring manual configuration of media graph for all v4l2-subdevs.
> > 
> > Enable it for TISDK images, along with the optional libcamerasrc
> 
> typo - libcamersrc?
> 

The gstreamer element is called "libcamerasrc" 
https://github.com/libcamera-org/libcamera/blob/master/src/gstreamer/gstlibcamerasrc.cpp

> 
> > gstreamer plugin package.
> > 
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > ---
> >  meta-arago-distro/conf/distro/arago.conf                       | 3 +++
> >  .../packagegroups/packagegroup-arago-tisdk-multimedia.bb       | 2 ++
> >  2 files changed, 5 insertions(+)
> > 
> > diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> > index e0087ab7..bb074478 100644
> > --- a/meta-arago-distro/conf/distro/arago.conf
> > +++ b/meta-arago-distro/conf/distro/arago.conf
> > @@ -128,6 +128,9 @@ PACKAGECONFIG:append:pn-gstreamer1.0 = " tracer-hooks"
> >  # Enable kmssink in gstreamer
> >  PACKAGECONFIG:append:pn-gstreamer1.0-plugins-bad = " kms"
> >  
> > +# Enable gstreamer plugin for libcamera
> > +PACKAGECONFIG:append:pn-libcamera = " gst"
> > +
> >  # Disable pulseaudio routing in alsa by default
> >  PACKAGECONFIG:remove:pn-alsa-plugins = "pulseaudio"
> >  RDEPENDS:pulseaudio-server:remove = "alsa-plugins-pulseaudio-conf"
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> > index d06fbb6f..b4148882 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> > @@ -8,6 +8,8 @@ inherit packagegroup
> >  
> >  MULTIMEDIA = " \
> >      amsdk-av-files \
> > +    libcamera \
> > +    libcamera-gst \
> >  "
> >  
> >  MULTIMEDIA:omapl138 = ""
> > -- 
> > 2.41.0

-- 
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

