Return-Path: <mrinmayee@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4CB4452990
	for <meta-arago@arago-project.org>;
	Mon, 11 Nov 2013 06:15:53 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAB6FpUf006283
	for <meta-arago@arago-project.org>; Mon, 11 Nov 2013 00:15:51 -0600
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAB6Fmvj001909
	for <meta-arago@arago-project.org>; Mon, 11 Nov 2013 00:15:49 -0600
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.02.0342.003; Mon, 11 Nov 2013 14:15:48 +0800
From: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-arago] [PATCH 0/5] GStreamer multimedia framework and
	plugins recipes
Thread-Index: AQHO0W3RrQjjHDgCt0eDZXhoKScMrZoFBESAgAALvQCACE3XAIASO2Jw
Date: Mon, 11 Nov 2013 06:15:47 +0000
Message-ID: <CF956B779D819D41BBC043B7082161D545CFC7@DBDE04.ent.ti.com>
References: <20131025093335.GA20172@ti.com> <20131025103440.GB13772@edge>
	<8F29D6B095ED194EA1980491A5E029710C58765A@DFLE08.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED101597DC30B@DLEE11.ent.ti.com>
	<20131030225728.GA24696@edge>
In-Reply-To: <20131030225728.GA24696@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
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
X-List-Received-Date: Mon, 11 Nov 2013 06:15:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I was on a long vacation, so I apologize for the delay in response.
Here are the no. of patches on top of standard GStreamer.

Gstreamer - 15
Gstreamer base plugins - 56
Gstreamer good plugins - 11
Gstreamer bad plugins - 195

Based on Franklin's suggestions and discussions with Sid, we have decided t=
o create new recipes with unique identifiers, for eg. gstreamer-glsdk.
Kindly let me know if this approach is fine with you.

Regards,
Mrinmayee =20

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, October 31, 2013 4:27 AM
> To: Maupin, Chase
> Cc: Cooper Jr., Franklin; Hingolikar, Mrinmayee; meta-arago@arago-
> project.org
> Subject: Re: [meta-arago] [PATCH 0/5] GStreamer multimedia framework
> and plugins recipes
>=20
> Mrinmayee,
>=20
> Myself, Franklin and Chase have asked you to estimate the amount and
> size of the patches that you have in your gstreamer trees. And you
> still have not answered that.
>=20
> The reason we are asking this simple question is because the changes
> you are making to the recipes will affect others and cannot be accepted
> as is. You would need to use machine override VAR_omap-a15 instead of
> COMPATIBLE_MACHINE and depending on the amount and size of the patches,
> you either simply apply them just for your machine, or change the
> SRC_URI completely for your machine.
>=20
> Either way, I would like to encourage you to participate in the
> discussion and not just disappear. Thank you.
>=20
> --
> Denys
>=20
>=20
> On Fri, Oct 25, 2013 at 12:08:48PM -0400, Maupin, Chase wrote:
> > >-----Original Message-----
> > >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > >bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> > >Sent: Friday, October 25, 2013 10:27 AM
> > >To: Dmytriyenko, Denys; Hingolikar, Mrinmayee
> > >Cc: meta-arago@arago-project.org
> > >Subject: Re: [meta-arago] [PATCH 0/5] GStreamer multimedia
> > >framework and plugins recipes
> > >
> > >All of your appends are currently blocking all of the gstreamer
> > >plugins for all machines other than omap-a15. There is no way to
> > >only apply a bbappend for a specific machine and have all other
> > >machines ignore the bbappend.
> > >
> > >Depending on your patch set on top of the standard gstreamer
> > >sources it probably would be better to break out the patches from
> > >your git repo and add it to the SRC_URI for only the omap machine.
> >
> > This may be preferred just to help keep from getting locked to
> particular
> > gstreamer version and make clear the changeds on top.  But number of
> patches
> > is something that would weigh in here.
> >
> > >
> > >Another approach would be to create a "new "recipe called omap-
> > ><base recipe name> that "requires/includes" the base gstreamer
> > >recipe and then you can override whatever you want. Take a look at
> > >the qt4-embedded-gles_4.8.4.bb recipe.
> > >http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dblob;f=3Dmeta-
> > >arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.4.bb
> > >
> > >Or
> > >Create new recipes with some unique identifier to indicate this
> > >isn't the standard gstreamer.
> >
> > If not patches one of the above seems right.
> >
> > >
> > >Others may have other approaches that they recommend.
> > >
> > >> -----Original Message-----
> > >> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > >> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> > >> Sent: Friday, October 25, 2013 5:35 AM
> > >> To: Hingolikar, Mrinmayee
> > >> Cc: meta-arago@arago-project.org
> > >> Subject: Re: [meta-arago] [PATCH 0/5] GStreamer multimedia
> > >framework and
> > >> plugins recipes
> > >>
> > >> On Fri, Oct 25, 2013 at 03:03:35PM +0530, Mrinmayee Hingolikar
> > >wrote:
> > >> > This patch-set adds GStreamer framework and its plugins:
> > >> > base, good, bad and ugly.
> > >> >
> > >> > The development trees for all of these components are
> > >mainitained at
> > >> > git.ti.com and they are based on top of the Freedesktop
> > >releases.
> > >>
> > >> Why? How large is the patchset on top of upstream?
> > >>
> > >>
> > >> > Mrinmayee Hingolikar (5):
> > >> >   multimedia: Add GStreamer multimedia framework.
> > >> >   multimedia: GStreamer base plugins
> > >> >   multimedia: GStreamer good plugins
> > >> >   multimedia: GStreamer bad plugins
> > >> >   multimedia: GStreamer ugly plugins.
> > >> >
> > >> >  .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |   25
> > >> ++++++++++++++++++++
> > >> >  .../gstreamer/gst-plugins-base_0.10.36.bbappend    |   22
> > >> +++++++++++++++++
> > >> >  .../gstreamer/gst-plugins-good_0.10.31.bbappend    |   20
> > >> ++++++++++++++++
> > >> >  .../gstreamer/gst-plugins-ugly_0.10.18.bb          |   23
> > >++++++++++++++++++
> > >> >  .../gstreamer/gstreamer_0.10.36.bbappend           |   16
> > >+++++++++++++
> > >> >  5 files changed, 106 insertions(+)
> > >> >  create mode 100644
> > >> > meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-
> > >bad_0.10.23
> > >> > .bbappend  create mode 100644
> > >> > meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-
> > >base_0.10.3
> > >> > 6.bbappend  create mode 100644
> > >> > meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-
> > >good_0.10.3
> > >> > 1.bbappend  create mode 100644
> > >> > meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-
> > >ugly_0.10.1
> > >> > 8.bb  create mode 100644
> > >> > meta-arago-extras/recipes-
> > >multimedia/gstreamer/gstreamer_0.10.36.bbapp
> > >> > end
> > >> >
> > >> > --
> > >> > 1.7.9.5
> > >> >
> > >> > _______________________________________________
> > >> > meta-arago mailing list
> > >> > meta-arago@arago-project.org
> > >> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >> _______________________________________________
> > >> meta-arago mailing list
> > >> meta-arago@arago-project.org
> > >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >_______________________________________________
> > >meta-arago mailing list
> > >meta-arago@arago-project.org
> > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

