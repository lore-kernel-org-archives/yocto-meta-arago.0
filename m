Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 84632529F8
	for <meta-arago@arago-project.org>;
	Fri, 25 Oct 2013 16:08:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9PG8mbw031598
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 11:08:48 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9PG8mTn026431
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 11:08:48 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Fri, 25 Oct 2013 11:08:48 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "Dmytriyenko, Denys"
	<denys@ti.com>, "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
Thread-Topic: [meta-arago] [PATCH 0/5] GStreamer multimedia framework and
	plugins recipes
Thread-Index: AQHO0W3XXinV2t0EDUm/fcY9A/MZypoFh+uAgAANibA=
Date: Fri, 25 Oct 2013 16:08:48 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597DC30B@DLEE11.ent.ti.com>
References: <20131025093335.GA20172@ti.com> <20131025103440.GB13772@edge>
	<8F29D6B095ED194EA1980491A5E029710C58765A@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C58765A@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
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
X-List-Received-Date: Fri, 25 Oct 2013 16:08:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Friday, October 25, 2013 10:27 AM
>To: Dmytriyenko, Denys; Hingolikar, Mrinmayee
>Cc: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH 0/5] GStreamer multimedia
>framework and plugins recipes
>
>All of your appends are currently blocking all of the gstreamer
>plugins for all machines other than omap-a15. There is no way to
>only apply a bbappend for a specific machine and have all other
>machines ignore the bbappend.
>
>Depending on your patch set on top of the standard gstreamer
>sources it probably would be better to break out the patches from
>your git repo and add it to the SRC_URI for only the omap machine.

This may be preferred just to help keep from getting locked to particular g=
streamer version and make clear the changeds on top.  But number of patches=
 is something that would weigh in here.

>
>Another approach would be to create a "new "recipe called omap-
><base recipe name> that "requires/includes" the base gstreamer
>recipe and then you can override whatever you want. Take a look at
>the qt4-embedded-gles_4.8.4.bb recipe.
>http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dblob;f=3Dmeta-
>arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.4.bb
>
>Or
>Create new recipes with some unique identifier to indicate this
>isn't the standard gstreamer.

If not patches one of the above seems right.

>
>Others may have other approaches that they recommend.
>
>> -----Original Message-----
>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
>> Sent: Friday, October 25, 2013 5:35 AM
>> To: Hingolikar, Mrinmayee
>> Cc: meta-arago@arago-project.org
>> Subject: Re: [meta-arago] [PATCH 0/5] GStreamer multimedia
>framework and
>> plugins recipes
>>
>> On Fri, Oct 25, 2013 at 03:03:35PM +0530, Mrinmayee Hingolikar
>wrote:
>> > This patch-set adds GStreamer framework and its plugins:
>> > base, good, bad and ugly.
>> >
>> > The development trees for all of these components are
>mainitained at
>> > git.ti.com and they are based on top of the Freedesktop
>releases.
>>
>> Why? How large is the patchset on top of upstream?
>>
>>
>> > Mrinmayee Hingolikar (5):
>> >   multimedia: Add GStreamer multimedia framework.
>> >   multimedia: GStreamer base plugins
>> >   multimedia: GStreamer good plugins
>> >   multimedia: GStreamer bad plugins
>> >   multimedia: GStreamer ugly plugins.
>> >
>> >  .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |   25
>> ++++++++++++++++++++
>> >  .../gstreamer/gst-plugins-base_0.10.36.bbappend    |   22
>> +++++++++++++++++
>> >  .../gstreamer/gst-plugins-good_0.10.31.bbappend    |   20
>> ++++++++++++++++
>> >  .../gstreamer/gst-plugins-ugly_0.10.18.bb          |   23
>++++++++++++++++++
>> >  .../gstreamer/gstreamer_0.10.36.bbappend           |   16
>+++++++++++++
>> >  5 files changed, 106 insertions(+)
>> >  create mode 100644
>> > meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-
>bad_0.10.23
>> > .bbappend  create mode 100644
>> > meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-
>base_0.10.3
>> > 6.bbappend  create mode 100644
>> > meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-
>good_0.10.3
>> > 1.bbappend  create mode 100644
>> > meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-
>ugly_0.10.1
>> > 8.bb  create mode 100644
>> > meta-arago-extras/recipes-
>multimedia/gstreamer/gstreamer_0.10.36.bbapp
>> > end
>> >
>> > --
>> > 1.7.9.5
>> >
>> > _______________________________________________
>> > meta-arago mailing list
>> > meta-arago@arago-project.org
>> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

