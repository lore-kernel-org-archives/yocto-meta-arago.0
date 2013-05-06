Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1C2AD52A9C
	for <meta-arago@arago-project.org>;
	Mon,  6 May 2013 23:03:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r46N3GYU000671
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 18:03:16 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r46N3GFZ017289
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 18:03:16 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 6 May 2013 18:03:16 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Mon, 6 May 2013 18:03:17 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] arago.conf: Correct TOOLCHAIN_BRAND for
	ARM9 SOCs
Thread-Index: AQHOSqDlrS8xwFKeikOiajL6dYOow5j5AM2A//+ty+CAAGK3AP//rOJQ
Date: Mon, 6 May 2013 23:03:15 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C44AF05@DFLE08.ent.ti.com>
References: <1367875806-8694-1-git-send-email-fcooper@ti.com>
	<20130506213151.GB10607@edge>
	<8F29D6B095ED194EA1980491A5E029710C44AC4E@DFLE08.ent.ti.com>
	<20130506223056.GE10607@edge>
In-Reply-To: <20130506223056.GE10607@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] arago.conf: Correct TOOLCHAIN_BRAND for ARM9 SOCs
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
X-List-Received-Date: Mon, 06 May 2013 23:03:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, May 06, 2013 5:31 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] arago.conf: Correct TOOLCHAIN_BRAND for
> ARM9 SOCs
>=20
> On Mon, May 06, 2013 at 05:56:05PM -0400, Cooper Jr., Franklin wrote:
> >
> >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Monday, May 06, 2013 4:32 PM
> > > To: Cooper Jr., Franklin
> > > Cc: meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [PATCH] arago.conf: Correct
> > > TOOLCHAIN_BRAND for
> > > ARM9 SOCs
> > >
> > > On Mon, May 06, 2013 at 04:30:06PM -0500, Franklin S. Cooper Jr wrote=
:
> > > > * Linaro toolchain does not support ARM9 architecture.
> > > > * Use Arago toolchain if a ARM9 based SOC_FAMILY is being built.
> > > >
> > > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > > ---
> > > >  meta-arago-distro/conf/distro/arago.conf |    4 +++-
> > > >  1 files changed, 3 insertions(+), 1 deletions(-)
> > > >
> > > > diff --git a/meta-arago-distro/conf/distro/arago.conf
> > > > b/meta-arago-distro/conf/distro/arago.conf
> > > > index 3954360..048c480 100644
> > > > --- a/meta-arago-distro/conf/distro/arago.conf
> > > > +++ b/meta-arago-distro/conf/distro/arago.conf
> > > > @@ -21,7 +21,9 @@ DISTRO_FEATURES =3D "alsa argp bluetooth ext2 ird=
a
> > > > largefile pcmcia usbgadget usbh
> > > >
> > > >  # Toolchain should be selected by setting TOOLCHAIN_BRAND in
> > > > local.conf  # Set some sane defaults, in case someone forgets to
> > > > set them in local.conf -TOOLCHAIN_BRAND ?=3D "linaro"
> > > > +# ARM9 is not supported by the Linaro toolchain so default back
> > > > +to the Arago # toolchain for ARM9 based SOCs.
> > > > +TOOLCHAIN_BRAND ?=3D
> > > "${@bb.utils.contains('SOC_FAMILY','omapl138','arago','linaro',d)}"
> > >
> > > I don't feel this belongs in the arago.conf - as the comment above
> > > says, this is supposed to be set in the local.conf anyways, here it
> > > just offers a default fall back...
> >
> > I don't see what harm is done by tweaking the variable to insure an
> > optimal and safe default fall back is provided for all platforms we
> > support. This patch changes nothing except fixes a broken use case.
>=20
> Overhead - it calls that Python function every time you evaluate
> TOOLCHAIN_BRAND variable...
>=20
> I might be more lenient with something like this though:
>=20
> TC_SANEDEFAULT :=3D "${@...}"
> TOOLCHAIN_BRAND ?=3D "${TC_SANEDEFAULT}"
>=20
> Although, that would no longer work in local.conf, only arago.conf...

If you have no objection with me putting my suggested change to TOOLCHAIN_B=
RAND in oe-layersetup local.conf.sample then I am fine with dropping this p=
atch.

>=20
> --
> Denys

