Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A5AAA52998
	for <meta-arago@arago-project.org>;
	Mon, 11 Nov 2013 14:35:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rABEZcWM007508
	for <meta-arago@arago-project.org>; Mon, 11 Nov 2013 08:35:38 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rABEZckG028581
	for <meta-arago@arago-project.org>; Mon, 11 Nov 2013 08:35:38 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Mon, 11 Nov 2013 08:35:38 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "Dmytriyenko, Denys"
	<denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 0/5] GStreamer multimedia framework and
	plugins recipes
Thread-Index: AQHO0W3XXinV2t0EDUm/fcY9A/MZypoFBESAgAALvQCACE3XAIASO2JwgACZhGA=
Date: Mon, 11 Nov 2013 14:35:37 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015980ADA9@DLEE11.ent.ti.com>
References: <20131025093335.GA20172@ti.com> <20131025103440.GB13772@edge>
	<8F29D6B095ED194EA1980491A5E029710C58765A@DFLE08.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED101597DC30B@DLEE11.ent.ti.com>
	<20131030225728.GA24696@edge>
	<CF956B779D819D41BBC043B7082161D545CFC7@DBDE04.ent.ti.com>
In-Reply-To: <CF956B779D819D41BBC043B7082161D545CFC7@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
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
X-List-Received-Date: Mon, 11 Nov 2013 14:35:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Mrinmayee,

Some things that would help would be if you could give us an idea about the=
 following:

1. What are these patches adding?  Are they adding new components?
2. If new components are being added why not create a separate project for =
them so that it is easier to work on moving them along with different relea=
ses of gstreamer?  Basically split out the "base" gstreamer and the new ele=
ments.  This way if another group wants to look at supporting a different g=
streamer version your changes are isolated from the gstreamer base.
3. For patches against gstreamer elements what is the plan/schedule for pus=
hing those patches up to the gstreamer mainline to minimize what is being c=
arried?

This basically boils down to what is the roadmap tomorrow to being ready to=
 adapt to new gstreamer releases and reduce this patchset?  What is the pla=
n for handling migrations and is a consolidated code base the easiest way t=
o do this?

Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


>-----Original Message-----
>From: Hingolikar, Mrinmayee
>Sent: Monday, November 11, 2013 12:16 AM
>To: Dmytriyenko, Denys; Maupin, Chase
>Cc: Cooper Jr., Franklin; meta-arago@arago-project.org
>Subject: RE: [meta-arago] [PATCH 0/5] GStreamer multimedia
>framework and plugins recipes
>
>I was on a long vacation, so I apologize for the delay in
>response.
>Here are the no. of patches on top of standard GStreamer.
>
>Gstreamer - 15
>Gstreamer base plugins - 56
>Gstreamer good plugins - 11
>Gstreamer bad plugins - 195
>
>Based on Franklin's suggestions and discussions with Sid, we have
>decided to create new recipes with unique identifiers, for eg.
>gstreamer-glsdk.
>Kindly let me know if this approach is fine with you.
>
>Regards,
>Mrinmayee
>
>> -----Original Message-----
>> From: Dmytriyenko, Denys
>> Sent: Thursday, October 31, 2013 4:27 AM
>> To: Maupin, Chase
>> Cc: Cooper Jr., Franklin; Hingolikar, Mrinmayee; meta-
>arago@arago-
>> project.org
>> Subject: Re: [meta-arago] [PATCH 0/5] GStreamer multimedia
>framework
>> and plugins recipes
>>
>> Mrinmayee,
>>
>> Myself, Franklin and Chase have asked you to estimate the amount
>and
>> size of the patches that you have in your gstreamer trees. And
>you
>> still have not answered that.
>>
>> The reason we are asking this simple question is because the
>changes
>> you are making to the recipes will affect others and cannot be
>accepted
>> as is. You would need to use machine override VAR_omap-a15
>instead of
>> COMPATIBLE_MACHINE and depending on the amount and size of the
>patches,
>> you either simply apply them just for your machine, or change
>the
>> SRC_URI completely for your machine.
>>
>> Either way, I would like to encourage you to participate in the
>> discussion and not just disappear. Thank you.
>>
>> --
>> Denys
>>
>>
>> On Fri, Oct 25, 2013 at 12:08:48PM -0400, Maupin, Chase wrote:
>> > >-----Original Message-----
>> > >From: meta-arago-bounces@arago-project.org [mailto:meta-
>arago-
>> > >bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>> > >Sent: Friday, October 25, 2013 10:27 AM
>> > >To: Dmytriyenko, Denys; Hingolikar, Mrinmayee
>> > >Cc: meta-arago@arago-project.org
>> > >Subject: Re: [meta-arago] [PATCH 0/5] GStreamer multimedia
>> > >framework and plugins recipes
>> > >
>> > >All of your appends are currently blocking all of the
>gstreamer
>> > >plugins for all machines other than omap-a15. There is no way
>to
>> > >only apply a bbappend for a specific machine and have all
>other
>> > >machines ignore the bbappend.
>> > >
>> > >Depending on your patch set on top of the standard gstreamer
>> > >sources it probably would be better to break out the patches
>from
>> > >your git repo and add it to the SRC_URI for only the omap
>machine.
>> >
>> > This may be preferred just to help keep from getting locked to
>> particular
>> > gstreamer version and make clear the changeds on top.  But
>number of
>> patches
>> > is something that would weigh in here.
>> >
>> > >
>> > >Another approach would be to create a "new "recipe called
>omap-
>> > ><base recipe name> that "requires/includes" the base
>gstreamer
>> > >recipe and then you can override whatever you want. Take a
>look at
>> > >the qt4-embedded-gles_4.8.4.bb recipe.
>> > >http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dblob;f=3Dmeta-
>> > >arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.4.bb
>> > >
>> > >Or
>> > >Create new recipes with some unique identifier to indicate
>this
>> > >isn't the standard gstreamer.
>> >
>> > If not patches one of the above seems right.
>> >
>> > >
>> > >Others may have other approaches that they recommend.
>> > >
>> > >> -----Original Message-----
>> > >> From: meta-arago-bounces@arago-project.org [mailto:meta-
>arago-
>> > >> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
>> > >> Sent: Friday, October 25, 2013 5:35 AM
>> > >> To: Hingolikar, Mrinmayee
>> > >> Cc: meta-arago@arago-project.org
>> > >> Subject: Re: [meta-arago] [PATCH 0/5] GStreamer multimedia
>> > >framework and
>> > >> plugins recipes
>> > >>
>> > >> On Fri, Oct 25, 2013 at 03:03:35PM +0530, Mrinmayee
>Hingolikar
>> > >wrote:
>> > >> > This patch-set adds GStreamer framework and its plugins:
>> > >> > base, good, bad and ugly.
>> > >> >
>> > >> > The development trees for all of these components are
>> > >mainitained at
>> > >> > git.ti.com and they are based on top of the Freedesktop
>> > >releases.
>> > >>
>> > >> Why? How large is the patchset on top of upstream?
>> > >>
>> > >>
>> > >> > Mrinmayee Hingolikar (5):
>> > >> >   multimedia: Add GStreamer multimedia framework.
>> > >> >   multimedia: GStreamer base plugins
>> > >> >   multimedia: GStreamer good plugins
>> > >> >   multimedia: GStreamer bad plugins
>> > >> >   multimedia: GStreamer ugly plugins.
>> > >> >
>> > >> >  .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |
>25
>> > >> ++++++++++++++++++++
>> > >> >  .../gstreamer/gst-plugins-base_0.10.36.bbappend    |
>22
>> > >> +++++++++++++++++
>> > >> >  .../gstreamer/gst-plugins-good_0.10.31.bbappend    |
>20
>> > >> ++++++++++++++++
>> > >> >  .../gstreamer/gst-plugins-ugly_0.10.18.bb          |
>23
>> > >++++++++++++++++++
>> > >> >  .../gstreamer/gstreamer_0.10.36.bbappend           |
>16
>> > >+++++++++++++
>> > >> >  5 files changed, 106 insertions(+)
>> > >> >  create mode 100644
>> > >> > meta-arago-extras/recipes-multimedia/gstreamer/gst-
>plugins-
>> > >bad_0.10.23
>> > >> > .bbappend  create mode 100644
>> > >> > meta-arago-extras/recipes-multimedia/gstreamer/gst-
>plugins-
>> > >base_0.10.3
>> > >> > 6.bbappend  create mode 100644
>> > >> > meta-arago-extras/recipes-multimedia/gstreamer/gst-
>plugins-
>> > >good_0.10.3
>> > >> > 1.bbappend  create mode 100644
>> > >> > meta-arago-extras/recipes-multimedia/gstreamer/gst-
>plugins-
>> > >ugly_0.10.1
>> > >> > 8.bb  create mode 100644
>> > >> > meta-arago-extras/recipes-
>> > >multimedia/gstreamer/gstreamer_0.10.36.bbapp
>> > >> > end
>> > >> >
>> > >> > --
>> > >> > 1.7.9.5
>> > >> >
>> > >> > _______________________________________________
>> > >> > meta-arago mailing list
>> > >> > meta-arago@arago-project.org
>> > >> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-
>arago
>> > >> _______________________________________________
>> > >> meta-arago mailing list
>> > >> meta-arago@arago-project.org
>> > >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-
>arago
>> > >_______________________________________________
>> > >meta-arago mailing list
>> > >meta-arago@arago-project.org
>> > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

