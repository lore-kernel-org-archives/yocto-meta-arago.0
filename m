Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8D1F752A72
	for <meta-arago@arago-project.org>;
	Wed,  2 Jul 2014 20:36:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s62Kas4e029530;
	Wed, 2 Jul 2014 15:36:54 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s62KasM1023194;
	Wed, 2 Jul 2014 15:36:54 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Wed, 2 Jul 2014 15:36:54 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Ulf Samuelsson <meta-arago@emagii.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] Fwd: Fwd: Re: [meta-ti] Build of qtbase fails due
	to no OpenGL libraries, but completes after cleaning qtbase.
Thread-Index: AQHPliBF86a9v++FhkCRt/8LnTIgDZuNaiaAgAAQxQCAAAFWgIAAAVYA//+tjrCAAGQbAP//rHKA
Date: Wed, 2 Jul 2014 20:36:54 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6DAA36@DFLE08.ent.ti.com>
References: <53B44965.5050502@emagii.com> <53B449D5.30600@emagii.com>
	<20140702181315.GA15788@edge> <53B459CC.20805@emagii.com>
	<20140702191802.GB15788@edge> <53B45C0A.60805@emagii.com>
	<8F29D6B095ED194EA1980491A5E029710C6DA912@DFLE08.ent.ti.com>
	<53B46ADA.1070400@emagii.com>
In-Reply-To: <53B46ADA.1070400@emagii.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [meta-ti] Build of qtbase fails due to no OpenGL libraries, but completes after cleaning qtbase.
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
X-List-Received-Date: Wed, 02 Jul 2014 20:36:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Ulf Samuelsson [mailto:meta-arago@emagii.com]
> Sent: Wednesday, July 02, 2014 3:26 PM
> To: Cooper Jr., Franklin; Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] Fwd: Fwd: Re: [meta-ti] Build of qtbase fails d=
ue to
> no OpenGL libraries, but completes after cleaning qtbase.
>=20
> 2014-07-02 21:34, Cooper Jr., Franklin skrev:
> >
> >> -----Original Message-----
> >> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >> bounces@arago-project.org] On Behalf Of Ulf Samuelsson
> >> Sent: Wednesday, July 02, 2014 2:23 PM
> >> To: Dmytriyenko, Denys
> >> Cc: meta-arago@arago-project.org
> >> Subject: Re: [meta-arago] Fwd: Fwd: Re: [meta-ti] Build of qtbase
> >> fails due to no OpenGL libraries, but completes after cleaning qtbase.
> >>
> >> 2014-07-02 21:18, Denys Dmytriyenko skrev:
> >>> On Wed, Jul 02, 2014 at 09:13:16PM +0200, Ulf Samuelsson wrote:
> >>>> 2014-07-02 20:13, Denys Dmytriyenko skrev:
> >>>>> On Wed, Jul 02, 2014 at 08:05:09PM +0200, Ulf Samuelsson wrote:
> >>>>>
> >>>>>
> >>>>> On Wed, Jul 02, 2014 at 07:21:24AM +0200, Ulf Samuelsson wrote:
> >>>>>>> When I build an image with QT5 using meta-arago, qtbase fails
> >>>>>>> with a lot of error messages.
> >>>>>>> This is the wrong mailing list - meta-ti has nothing to do with q=
tbase.
> >>>>>>> Moreover, why are you still using 5.1.1? There were many fixes
> >>>>>>> in
> >>>>>>> Qt5 5.2.x and 5.3.x. Also, it depends on your setup and what
> >>>>>>> layers and features you configure. Either way, it's a discussion
> >>>>>>> for a distro layer, you can use meta-arago mailing list for that.=
..
> >>>>>> I looked through meta-arago and meta-qt5 about a month ago for
> >> compatability.
> >>>>>> I checked again today:
> >>>>>>
> >>>>>> meta-qt5/master	=3D 5.3.0
> >>>>>> meta-qt5/daisy	=3D 5.2.1
> >>>>>> meta-qt5/dora	=3D 5.1.1
> >>>>>>
> >>>>>> meta-arago/master =3D 5.2.0
> >>>>>> meta-arago/dora   =3D 5.2.0 (used to be 5.1.1)
> >>>>>> There is no meta-arago/daisy branch.
> >>>>>>
> >>>>>> The only revision I could find which was available in both was 5.1=
.1.
> >>>>>> and that is why I used it.
> >>>>>>
> >>>>>> It would make sense if the qt5 related recipes in meta-arago
> >>>>>> matched
> >> those in meta-qt5.
> >>>>>> Now meta-arago is using 5.2.0 which is not present in any branch
> >>>>>> of
> >>>>>> meta-qt5 (did not check old branches, only dora and daisy).
> >>>>>>
> >>>>>> I dont understand why the meta-arago:dora recipes for qt5 has
> >>>>>> been updated from 5.1.1 to 5.2.0, thus making it incompatible
> >>>>>> with meta-
> >> qt5:dora. Isn't this a mistake.
> >>>>> meta-qt5 for long time only had master, moreover, due to some
> >>>>> requirements, we needed latest 5.2 version of qt5, which was only
> >>>>> available from master and not from Dora, while meta-arago was
> >>>>> generally Dora based. Since then meta-qt5 was updated to 5.2.1,
> >>>>> and meta-arago has recently switched to Daisy - some cleanup is
> >>>>> still going
> >> on...
> >>>> I think in order to clean up:
> >>>> 1) meta-arago:dora should switch back to 5.1.1
> >>>> 2) a daisy branch should be added to meta-arago (or daisy-devel)
> >>>> using 5.2.1
> >>>> 3) meta-arago:master should be 5.3.0
> >>>>
> >>>> 5.2.0 recipes should be deleted, or moved to an intermediate branch
> >>>> (daisy-rc1?)
> >>> No.
> >> So whats the plan?
> >> Does it make sense to have different version numbers in meta-arago,
> >> than in meta-qt5?
> >>
> >> Is there a time schedule to have 5.2.1/5,3,0 support?
> > [Franklin] The way meta-qt5 and meta-arago works is indeed different
> compared to other layers. Meta-arago master tracks meta-qt5 master. Meta-
> arago dora tracks meta-arago daisy. I think we need to properly document
> this and even include it in the README file but of course work on daisy i=
s still
> being done so it might just be on someone's short term todo list.
> >
> > Ulf,
> > Are you still having issues with Qt5 support when you use meta-qt5 mast=
er?
> I have Beaglebone Black + LCD4 (from 4D systems) running
>=20
> meta-arago:dora (1 month old checkout using Qt-5.1.1) meta-qt5:dora
> linux_ti_staging-3.12.20
>=20
> Customer is currently developing on both AM335x and iMX6, and will make
> final selection later this year.
>=20
> Customer wants to be Yocto-1.6 compatible and is using QT 5.2.1 for the
> iMX6 development.
> Would like to use the same or later for the Beaglebone Black.
>=20
> Mixing dora and daisy branches, if true is not intuitive.
[Franklin] Ignore what I said look at Denys latest response.
>=20
> One issue which I need to investigate, is the colours.
> At boot, the Penguin appears with Blue feet, and not Yellow/Orange and th=
e
> customer splash screen and applications also have the wrong colour.
>=20
[Franklin] I believe that color issue has to-do with the am335x errata http=
://www.ti.com/lit/er/sprz360f/sprz360f.pdf (page 8). The BBB is hooked up t=
o display correctly in 16bpp mode but if you use 24bpp then your colors wil=
l look messed up.
I recommend posting this question to e2e.ti.com and the right people can he=
lp you with this.

> I disabled the meta-arago psplash by
>=20
> BBMASK =3D "meta-arago-distro/recipes-core/psplash/"
>=20
> in 'local.conf' and there is no longer an '-arago' addition to the versio=
n name.
>=20
> Have not had the time to study the issue further, but would appreciate id=
eas.
>=20
>=20
> >> BR
> >> Ulf Samuelsson
> >>
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


