Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 8BDCC52BDC
	for <meta-arago@arago-project.org>;
	Wed, 19 May 2021 23:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3B94540C79;
	Wed, 19 May 2021 23:06:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id VJkcn7iEhVQe; Wed, 19 May 2021 23:06:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EF213400CF;
	Wed, 19 May 2021 23:06:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B042B1745E4; Wed, 19 May 2021 19:06:43 -0400 (EDT)
Date: Wed, 19 May 2021 19:06:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Message-ID: <20210519230643.GY1528@denix.org>
References: <20210519124642.21701-1-roopangkumar.patel@ti.com>
	<20210519223929.n3oidsaag5wikia6@chamber>
MIME-Version: 1.0
In-Reply-To: <20210519223929.n3oidsaag5wikia6@chamber>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, prashanth.amai@ti.com,
	sidraya.bj@pathpartnertech.com, praveen.ap@pathpartnertech.com,
	roopangkumar.patel@ti.com
Subject: Re: [PATCH] v4l2 H264 encoder plugin changes
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
X-List-Received-Date: Wed, 19 May 2021 23:06:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 19, 2021 at 05:39:29PM -0500, Nishanth Menon wrote:
> On 18:16-20210519, roopangkumar.patel@ti.com wrote:
> > From: Roopang Patel <roopangkumar.patel@ti.com>
> > 
> > Changes:
> > 1) Given support of v4l2 extra controls such as
> > bitrate,gopsize and iperiod for H264 encoding and
> > also added as v4l2 H264 plugin properties to set and
> > get for dynamic value change.
> > 
> > 2) We need to set these extra controls before the gstreamer
> > pipeline set format API invoke.so, we are setting extra
> > controls when the pipeline change the state
> > GST_STATE_CHANGE_READY_TO_PAUSED.
> 
> I'd suggest you might want to study how to write a proper commit message
> https://www.kernel.org/doc/html/v4.10/process/submitting-patches.html#describe-your-changes
> 
> is a good reference, so is a bunch of internet articles..
> 
> > ---
> >  sys/v4l2/gstv4l2h264enc.c | 135 +++++++++++++++++++++++++++++++++++++-
> >  sys/v4l2/gstv4l2h264enc.h |   9 +++
> >  2 files changed, 142 insertions(+), 2 deletions(-)
> 
> 	Ummm.... -ECONFUSED.
> 
> How does this patch apply to [1]
> 
> [1] http://arago-project.org/git/?p=meta-arago.git;a=tree
> > 
> > diff --git a/sys/v4l2/gstv4l2h264enc.c b/sys/v4l2/gstv4l2h264enc.c
> > index ee160b3a0..169e6ae69 100644
> > --- a/sys/v4l2/gstv4l2h264enc.c
> > +++ b/sys/v4l2/gstv4l2h264enc.c
> > @@ -47,6 +47,9 @@ enum
> >  {
> >    PROP_0,
> >    V4L2_STD_OBJECT_PROPS,
> > +  PROP_BITRATE,
> > +  PROP_GOPSIZE,
> > +  PROP_I_PERIOD,
> >  /* TODO add H264 controls
> >   * PROP_I_FRAME_QP,
> >   * PROP_P_FRAME_QP,
> > @@ -78,14 +81,46 @@ static void
> >  gst_v4l2_h264_enc_set_property (GObject * object,
> >      guint prop_id, const GValue * value, GParamSpec * pspec)
> >  {
> > -  /* TODO */
> > +  GstV4l2H264Enc *self = GST_V4L2_H264_ENC (object);
> > +
> > +  switch(prop_id)
> > +  {
> > +    case PROP_BITRATE:{
> > +     self->bitrate = g_value_get_uint (value);
> > +    }break;
> > +    case PROP_GOPSIZE:{
> > +     self->gopsize = g_value_get_uint (value);
> > +    }break;
> > +    case PROP_I_PERIOD:{
> > +     self->iperiod = g_value_get_uint (value);
> > +    }break;
> > +    default:{
> > +     G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> > +    }break;
> > +  }
> 
> If this is a kernel patch, please don't post it in public kernel list
> with ti.com ID - this is wrong in so many kernel coding style ways.

I believe this patch is for gstreamer-plugins-good:
https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/blob/master/sys/v4l2/gstv4l2h264enc.c

Still, not directly applicable to meta-araqgo...

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

