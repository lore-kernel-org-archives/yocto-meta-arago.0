Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B076C52981
	for <meta-arago@arago-project.org>;
	Fri, 19 Apr 2013 16:10:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3JGAd0o025766
	for <meta-arago@arago-project.org>; Fri, 19 Apr 2013 11:10:39 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3JGAdOU028458
	for <meta-arago@arago-project.org>; Fri, 19 Apr 2013 11:10:39 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Fri, 19 Apr 2013 11:10:39 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 19 Apr 2013 11:10:39 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] am33x-cm3: remove the SRC_URI setting
Thread-Index: AQHOPFu7CzJ7JZ4Ab0GCBHOjC5l1QJjctQMAgAEOToD///NVkA==
Date: Fri, 19 Apr 2013 16:10:38 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C42A726@DFLE08.ent.ti.com>
References: <1366306781-17062-1-git-send-email-Chase.Maupin@ti.com>
	<20130418194310.GC21029@denix.org>
	<7D46E86EC0A8354091174257B2FED101594FFCBD@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED101594FFCBD@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] am33x-cm3: remove the SRC_URI setting
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
X-List-Received-Date: Fri, 19 Apr 2013 16:10:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Friday, April 19, 2013 6:51 AM
> To: Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] am33x-cm3: remove the SRC_URI setting
>=20
> Looking at this further I see that the current bbappend is to line up wit=
h the
> 05.06.00.00 version of the kernel, which has not been pushed to meta-ti.
>=20
> My assumption is that we are only wanting to keep one version of linux-
> am335x kernel at a time.  So for this I would like Franklin's input:
>=20
> 1. Does he have a new version of the kernel for 05.07.00.00 pending?
Yes
> 2. Can we update the version in meta-ti along with the corresponding
> firmware recipe and remove these from meta-arago?
I plan on submitting patches soon that moves kernel and u-boot recipes from=
 meta-arago to meta-ti. These recipes will replace the u-boot and kernel us=
ed in SDK 05.06.

>=20
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Thursday, April 18, 2013 2:43 PM
> > To: Maupin, Chase
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH] am33x-cm3: remove the SRC_URI
> > setting
> >
> > On Thu, Apr 18, 2013 at 12:39:41PM -0500, Chase Maupin wrote:
> > > * The base recipe SRC_URI has been updated so remove the
> > setting
> > >   that overwrites this.  This was preventing picking up the
> > >   init script required to load the firmware
> > >
> > > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > > ---
> > >  .../recipes-bsp/am335x-cm3/am33x-cm3_git.bbappend  |    4 +---
> > >  1 files changed, 1 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/meta-arago-distro/recipes-bsp/am335x-cm3/am33x-
> > cm3_git.bbappend b/meta-arago-distro/recipes-bsp/am335x-
> > cm3/am33x-cm3_git.bbappend
> > > index 61547e3..826f250 100644
> > > --- a/meta-arago-distro/recipes-bsp/am335x-cm3/am33x-
> > cm3_git.bbappend
> > > +++ b/meta-arago-distro/recipes-bsp/am335x-cm3/am33x-
> > cm3_git.bbappend
> > > @@ -1,4 +1,4 @@
> > > -PR_append =3D "-arago0"
> > > +PR_append =3D "-arago1"
> > >
> > >  PV =3D "05.06.00.00"
> > >
> > > @@ -6,5 +6,3 @@ BRANCH =3D "master"
> > >
> > >  #This SRCREV corresponds to tag AM335xPSP_04.06.00.09-rc  SRCREV =3D
> > > "7c6075f28d9fdd633175cdbd8dc287613ce92e5d"
> >
> > Not a part of your patch, but can we sync up on the commit ID or
> > release version? meta-ti uses once commit ID and sets PV as
> > 04.06.00.07 and meta-arago changes it to 04.06.00.09-rc.
> > Can we update those - git has tags for 04.06.00.08 and
> > 04.06.00.10-rc1 besides
> > the other two mentioned.
> >
> > > -
> > > -SRC_URI =3D "git://arago-project.org/git/projects/am33x-
> > cm3.git;protocol=3Dgit;branch=3D${BRANCH}"
> > > --
> > > 1.7.0.4
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

