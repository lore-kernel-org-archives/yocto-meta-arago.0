Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id E72FE529D4
	for <meta-arago@arago-project.org>;
	Fri, 17 Nov 2017 22:26:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vAHMQ3Fh016774
	for <meta-arago@arago-project.org>; Fri, 17 Nov 2017 16:26:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1510957563;
	bh=KZlso4rmHOP3wcbuwOSo3emvwyTalOKxd7K5RcIPpuU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=RbtEZkbx+zLNe6oFXNJsUrjTWlKT+U0Eblf6/mNEfmBrQIjXJr2LeFHcNanpHWr3O
	ZRStS/eSMYd5x9tLRzQnYryA13EbIak9awBT5Gaje/QZhB4pq4gpq9Z9tXbjZdZuWo
	Rmelsx7VwnmBBWinyV6hm+AGjLTP2T1HLbcSsegQ=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vAHMQ3kr006590
	for <meta-arago@arago-project.org>; Fri, 17 Nov 2017 16:26:03 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 17 Nov 2017 16:26:02 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 17 Nov 2017 16:26:02 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vAHMQ2YG030492;
	Fri, 17 Nov 2017 16:26:02 -0600
Date: Fri, 17 Nov 2017 17:25:47 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Prasad, Ram" <x0038811@ti.com>
Message-ID: <20171117222547.GA1300@edge>
References: <1510824355-26185-1-git-send-email-x0038811@ti.com>
	<20171116210208.GC32707@edge>
	<0a1c3d421e7c4f6ba4ee837f4d250abe@ti.com>
MIME-Version: 1.0
In-Reply-To: <0a1c3d421e7c4f6ba4ee837f4d250abe@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty PATCH V5] gstreamer1.0*-good: Increase v4l2src minimum buffers by 4
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Nov 2017 22:26:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Nov 17, 2017 at 04:04:01AM -0500, Prasad, Ram wrote:
> Hi Denys,
> Yes, this patch is upstreamable.

Please don't forget to upstream it to gstreamer.


> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Friday, November 17, 2017 2:32 AM
> To: Prasad, Ram
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [morty PATCH V5] gstreamer1.0*-good: Increase v4l2src minimum buffers by 4
> 
> Is this patch upstreamable?
> 
> 
> On Thu, Nov 16, 2017 at 02:55:55PM +0530, Ramprasad N wrote:
> > Signed-off-by: Ramprasad N <x0038811@ti.com>
> > ---
> >  ...v4l2src-Increase-minimum-num-buffers-by-4.patch | 33 ++++++++++++++++++++++
> >  .../gstreamer1.0-plugins-good_1.8.3.bbappend       |  8 ++++++
> >  2 files changed, 41 insertions(+)
> >  create mode 100644 
> > meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go
> > od/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
> >  create mode 100644 
> > meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go
> > od_1.8.3.bbappend
> > 
> > diff --git 
> > a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> > good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch 
> > b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> > good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
> > new file mode 100644
> > index 0000000..1af90c1
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plug
> > +++ ins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
> > @@ -0,0 +1,33 @@
> > +From 73254df370fec6a2eb1ae6711955307a1d4bf173 Mon Sep 17 00:00:00 
> > +2001
> > +From: Ramprasad N <x0038811@ti.com>
> > +Date: Fri, 13 Oct 2017 15:48:06 +0530
> > +Subject: [PATCH] v4l2src: Increase minimum num buffers by 4
> > +
> > +v4l2src plugin allocates 4 buffers for the pipeline.
> > +To capture video in realtime the pipeline without frameloss, four 
> > +buffers are not sufficient. Increase the number of buffers by 4 more.
> > +
> > +Signed-off-by: Ramprasad N <x0038811@ti.com>
> > +---
> > + sys/v4l2/gstv4l2object.c | 4 +++-
> > + 1 file changed, 3 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c 
> > +index 549e06f..773f46d 100644
> > +--- a/sys/v4l2/gstv4l2object.c
> > ++++ b/sys/v4l2/gstv4l2object.c
> > +@@ -3939,7 +3939,9 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
> > +      * to fill the pipeline, the minimum required to decoder according to the
> > +      * driver and 1 more, so we don't endup up with everything downstream or
> > +      * held by the decoder. */
> > +-    own_min = min + obj->min_buffers + 1;
> > ++    /* Increase the number of buffers required by 4 more to capture video in
> > ++     * realtime. With default number of 4 buffers, frame loss is observed */
> > ++    own_min = min + obj->min_buffers + 5;
> > + 
> > +     /* If no allocation parameters where provided, allow for a little more
> > +      * buffers and enable copy threshold */
> > +--
> > +1.9.1
> > +
> > diff --git 
> > a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> > good_1.8.3.bbappend 
> > b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> > good_1.8.3.bbappend
> > new file mode 100644
> > index 0000000..29a07b2
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plug
> > +++ ins-good_1.8.3.bbappend
> > @@ -0,0 +1,8 @@
> > +PR_append = ".arago0"
> > +
> > +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> > +
> > +SRC_URI += " \
> > +      file://0001-v4l2src-Increase-minimum-num-buffers-by-4.patch \
> > +      "
> > +
> > --
> > 1.9.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

