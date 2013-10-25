Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 91A54529B0
	for <meta-arago@arago-project.org>;
	Fri, 25 Oct 2013 15:26:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9PFQmco024516
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 10:26:48 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9PFQmYm030790
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 10:26:48 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Fri, 25 Oct 2013 10:26:48 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Hingolikar, Mrinmayee"
	<mrinmayee@ti.com>
Thread-Topic: [meta-arago] [PATCH 0/5] GStreamer multimedia framework and
	plugins recipes
Thread-Index: AQHO0W3XXinV2t0EDUm/fcY9A/MZypoFh+uA
Date: Fri, 25 Oct 2013 15:26:47 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C58765A@DFLE08.ent.ti.com>
References: <20131025093335.GA20172@ti.com> <20131025103440.GB13772@edge>
In-Reply-To: <20131025103440.GB13772@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 0/5] GStreamer multimedia framework and plugins recipes
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
X-List-Received-Date: Fri, 25 Oct 2013 15:26:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

All of your appends are currently blocking all of the gstreamer plugins for=
 all machines other than omap-a15. There is no way to only apply a bbappend=
 for a specific machine and have all other machines ignore the bbappend.

Depending on your patch set on top of the standard gstreamer sources it pro=
bably would be better to break out the patches from your git repo and add i=
t to the SRC_URI for only the omap machine.

Another approach would be to create a "new "recipe called omap-<base recipe=
 name> that "requires/includes" the base gstreamer recipe and then you can =
override whatever you want. Take a look at the qt4-embedded-gles_4.8.4.bb r=
ecipe.
http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dblob;f=3Dmeta-arago-ex=
tras/recipes-qt/qt4/qt4-embedded-gles_4.8.4.bb

Or=20
Create new recipes with some unique identifier to indicate this isn't the s=
tandard gstreamer.

Others may have other approaches that they recommend.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Friday, October 25, 2013 5:35 AM
> To: Hingolikar, Mrinmayee
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 0/5] GStreamer multimedia framework and
> plugins recipes
>=20
> On Fri, Oct 25, 2013 at 03:03:35PM +0530, Mrinmayee Hingolikar wrote:
> > This patch-set adds GStreamer framework and its plugins:
> > base, good, bad and ugly.
> >
> > The development trees for all of these components are mainitained at
> > git.ti.com and they are based on top of the Freedesktop releases.
>=20
> Why? How large is the patchset on top of upstream?
>=20
>=20
> > Mrinmayee Hingolikar (5):
> >   multimedia: Add GStreamer multimedia framework.
> >   multimedia: GStreamer base plugins
> >   multimedia: GStreamer good plugins
> >   multimedia: GStreamer bad plugins
> >   multimedia: GStreamer ugly plugins.
> >
> >  .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |   25
> ++++++++++++++++++++
> >  .../gstreamer/gst-plugins-base_0.10.36.bbappend    |   22
> +++++++++++++++++
> >  .../gstreamer/gst-plugins-good_0.10.31.bbappend    |   20
> ++++++++++++++++
> >  .../gstreamer/gst-plugins-ugly_0.10.18.bb          |   23 ++++++++++++=
++++++
> >  .../gstreamer/gstreamer_0.10.36.bbappend           |   16 ++++++++++++=
+
> >  5 files changed, 106 insertions(+)
> >  create mode 100644
> > meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23
> > .bbappend  create mode 100644
> > meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base_0.10.3
> > 6.bbappend  create mode 100644
> > meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good_0.10.3
> > 1.bbappend  create mode 100644
> > meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.1
> > 8.bb  create mode 100644
> > meta-arago-extras/recipes-multimedia/gstreamer/gstreamer_0.10.36.bbapp
> > end
> >
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

