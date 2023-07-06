Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC99EB64DC
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 12:52:10 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
 by mx.groups.io with SMTP id smtpd.web10.17268.1688633834198390285
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 01:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ideasonboard.com header.s=mail header.b=E+FMKlUh;
 spf=pass (domain: ideasonboard.com, ip: 213.167.242.64, mailfrom: laurent.pinchart@ideasonboard.com)
Received: from pendragon.ideasonboard.com (85-160-25-222.reb.o2.cz [85.160.25.222])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D27BD7F3;
	Thu,  6 Jul 2023 10:56:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1688633786;
	bh=1bmo8zrsfLJkU1RgyMOBQ4kw1MTj2TzKzG0lXQv6wFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E+FMKlUho0C9in5XA3OSC+1v0bh5ZMpKkYojRt9eaGrCsXXrt3edJfGJTlLFhl96A
	 onUeRa0MoiSTLt5XIc40swsDsvelpSHZZrTQ1VxzklLzxDEwJdjE7l3C0+stUBGz71
	 XxEmy6IqEppryRxmFOskuHAZXnXlK+i/CHnxOGfk=
Date: Thu, 6 Jul 2023 11:57:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Jai Luthra <j-luthra@ti.com>, meta-arago@lists.yoctoproject.org,
	Devarsh Thakkar <devarsht@ti.com>, Gyan Gupta <g-gupta@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	Chirag Shilwant <c-shilwant@ti.com>,
	libcamera-devel@lists.libcamera.org,
	Sai Sree Kartheek Adivi <s-adivi@ti.com>,
	Ryan Eatmon <reatmon@ti.com>
Subject: Re: [libcamera-devel] [master/kirkstone][PATCH v3 2/3] libcamera: Add support for TI CSI-RX
Message-ID: <20230706085710.GA24758@pendragon.ideasonboard.com>
References: <20230706041652.1843102-1-j-luthra@ti.com>
 <20230706041652.1843102-2-j-luthra@ti.com>
 <168863257579.780480.1385426120296814998@Monstersaurus>
MIME-Version: 1.0
In-Reply-To: <168863257579.780480.1385426120296814998@Monstersaurus>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 12:52:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14767

On Thu, Jul 06, 2023 at 09:36:15AM +0100, Kieran Bingham via libcamera-devel wrote:
> Hi Jai,
> 
> Quoting Jai Luthra (2023-07-06 05:16:51)
> > TI's CSI-RX driver is not yet upstream, so the libcamera simple pipeline
> > does not recognize it.
> 
> Has this driver been posted to the linux-media mailing list?
> 
> > Apply a patch to the simple pipeline so that it can recognize the media
> > entity for TI's CSI-RX driver.
> > 
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > ---
> > 
> > v3: Add Upstream-Status tag
> > Link to v2: https://lore.kernel.org/all/20230706035522.1817402-2-j-luthra@ti.com/
> > 
> >  .../0001-simple-Support-TI-CSI-RX.patch       | 33 +++++++++++++++++++
> >  .../libcamera/libcamera_0.0.5.bb              |  1 +
> >  2 files changed, 34 insertions(+)
> >  create mode 100644 meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch
> > 
> > diff --git a/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch b/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch
> > new file mode 100644
> > index 00000000..82b02200
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch
> > @@ -0,0 +1,33 @@
> > +From d0e4f4f224671e9fc992d39e7beb9c486303ede1 Mon Sep 17 00:00:00 2001
> > +From: Jai Luthra <j-luthra@ti.com>
> > +Date: Thu, 23 Mar 2023 11:38:46 +0530
> > +Subject: [PATCH] simple: Support TI CSI-RX
> > +
> > +Add support for TI's CSI-RX pixel grabber device for the simple
> > +pipeline.
> > +
> > +The driver is not yet merged, but v7 is posted [1] upstream.
> > +
> > +Link: https://lore.kernel.org/all/20230314115516.667-1-vaishnav.a@ti.com/ [1]
> 
> I'll take that as a yes!
> 
> > +Upstream-Status: Pending
> > +Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > +---
> > + src/libcamera/pipeline/simple/simple.cpp | 2 ++
> > + 1 file changed, 2 insertions(+)
> > +
> > +diff --git a/src/libcamera/pipeline/simple/simple.cpp b/src/libcamera/pipeline/simple/simple.cpp
> > +index e1f8b989..520405a1 100644
> > +--- a/src/libcamera/pipeline/simple/simple.cpp
> > ++++ b/src/libcamera/pipeline/simple/simple.cpp
> > +@@ -194,6 +194,8 @@ static const SimplePipelineInfo supportedDevices[] = {
> > +       { "mxc-isi", {} },
> > +       { "qcom-camss", {} },
> > +       { "sun6i-csi", {} },
> > ++      { "j721e-csi2rx", {} },
> 
> So this line could already be merged to libcamera directly.
> 
> Could you post this patch to the libcamera mailing list please?
> (libcamera-devel@lists.libcamera.org).

Please insert the new entry in alphabetical order when doing so.

> I'm planning the next release of libcamera in the next week - and I
> believe we could get this in quite quickly.
> 
> > ++
> > + };
> > + 
> > + } /* namespace */
> > +-- 
> > +2.41.0
> > +
> > diff --git a/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb b/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> > index 6ad376f2..b2eb5fac 100644
> > --- a/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> > +++ b/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> > @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "\
> >  
> >  SRC_URI = " \
> >          git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
> > +        file://0001-simple-Support-TI-CSI-RX.patch \
> >  "
> >  
> >  SRCREV = "fb44403f1c5571549ac128c21daee9761eb9249c"

-- 
Regards,

Laurent Pinchart

