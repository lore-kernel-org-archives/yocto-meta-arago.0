Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7697352A91
	for <meta-arago@arago-project.org>;
	Fri, 19 Apr 2013 11:50:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3JBocsk031516
	for <meta-arago@arago-project.org>; Fri, 19 Apr 2013 06:50:38 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3JBocEL006355
	for <meta-arago@arago-project.org>; Fri, 19 Apr 2013 06:50:38 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Fri, 19 Apr 2013 06:50:37 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] am33x-cm3: remove the SRC_URI setting
Thread-Index: AQHOPG0BZZfCWviOAUiguOQmhpfDqpjdbpXQ
Date: Fri, 19 Apr 2013 11:50:37 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594FFCBD@DLEE11.ent.ti.com>
References: <1366306781-17062-1-git-send-email-Chase.Maupin@ti.com>
	<20130418194310.GC21029@denix.org>
In-Reply-To: <20130418194310.GC21029@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
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
X-List-Received-Date: Fri, 19 Apr 2013 11:50:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Looking at this further I see that the current bbappend is to line up with =
the 05.06.00.00 version of the kernel, which has not been pushed to meta-ti=
.

My assumption is that we are only wanting to keep one version of linux-am33=
5x kernel at a time.  So for this I would like Franklin's input:

1. Does he have a new version of the kernel for 05.07.00.00 pending?
2. Can we update the version in meta-ti along with the corresponding firmwa=
re recipe and remove these from meta-arago?

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, April 18, 2013 2:43 PM
> To: Maupin, Chase
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] am33x-cm3: remove the SRC_URI
> setting
>=20
> On Thu, Apr 18, 2013 at 12:39:41PM -0500, Chase Maupin wrote:
> > * The base recipe SRC_URI has been updated so remove the
> setting
> >   that overwrites this.  This was preventing picking up the
> >   init script required to load the firmware
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  .../recipes-bsp/am335x-cm3/am33x-cm3_git.bbappend  |    4 +---
> >  1 files changed, 1 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-arago-distro/recipes-bsp/am335x-cm3/am33x-
> cm3_git.bbappend b/meta-arago-distro/recipes-bsp/am335x-
> cm3/am33x-cm3_git.bbappend
> > index 61547e3..826f250 100644
> > --- a/meta-arago-distro/recipes-bsp/am335x-cm3/am33x-
> cm3_git.bbappend
> > +++ b/meta-arago-distro/recipes-bsp/am335x-cm3/am33x-
> cm3_git.bbappend
> > @@ -1,4 +1,4 @@
> > -PR_append =3D "-arago0"
> > +PR_append =3D "-arago1"
> >
> >  PV =3D "05.06.00.00"
> >
> > @@ -6,5 +6,3 @@ BRANCH =3D "master"
> >
> >  #This SRCREV corresponds to tag AM335xPSP_04.06.00.09-rc
> >  SRCREV =3D "7c6075f28d9fdd633175cdbd8dc287613ce92e5d"
>=20
> Not a part of your patch, but can we sync up on the commit ID or
> release
> version? meta-ti uses once commit ID and sets PV as 04.06.00.07
> and meta-arago
> changes it to 04.06.00.09-rc.
> Can we update those - git has tags for 04.06.00.08 and
> 04.06.00.10-rc1 besides
> the other two mentioned.
>=20
> > -
> > -SRC_URI =3D "git://arago-project.org/git/projects/am33x-
> cm3.git;protocol=3Dgit;branch=3D${BRANCH}"
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >

