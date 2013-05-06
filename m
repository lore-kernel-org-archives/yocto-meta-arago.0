Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 213EA52A2E
	for <meta-arago@arago-project.org>;
	Mon,  6 May 2013 21:56:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r46Lu62j011911
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 16:56:06 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r46Lu6wt004412
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 16:56:06 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 6 May 2013 16:56:06 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] arago.conf: Correct TOOLCHAIN_BRAND for
	ARM9 SOCs
Thread-Index: AQHOSqDlrS8xwFKeikOiajL6dYOow5j5AM2A//+ty+A=
Date: Mon, 6 May 2013 21:56:05 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C44AC4E@DFLE08.ent.ti.com>
References: <1367875806-8694-1-git-send-email-fcooper@ti.com>
	<20130506213151.GB10607@edge>
In-Reply-To: <20130506213151.GB10607@edge>
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
X-List-Received-Date: Mon, 06 May 2013 21:56:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, May 06, 2013 4:32 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] arago.conf: Correct TOOLCHAIN_BRAND for
> ARM9 SOCs
>=20
> On Mon, May 06, 2013 at 04:30:06PM -0500, Franklin S. Cooper Jr wrote:
> > * Linaro toolchain does not support ARM9 architecture.
> > * Use Arago toolchain if a ARM9 based SOC_FAMILY is being built.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  meta-arago-distro/conf/distro/arago.conf |    4 +++-
> >  1 files changed, 3 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta-arago-distro/conf/distro/arago.conf
> > b/meta-arago-distro/conf/distro/arago.conf
> > index 3954360..048c480 100644
> > --- a/meta-arago-distro/conf/distro/arago.conf
> > +++ b/meta-arago-distro/conf/distro/arago.conf
> > @@ -21,7 +21,9 @@ DISTRO_FEATURES =3D "alsa argp bluetooth ext2 irda
> > largefile pcmcia usbgadget usbh
> >
> >  # Toolchain should be selected by setting TOOLCHAIN_BRAND in
> > local.conf  # Set some sane defaults, in case someone forgets to set
> > them in local.conf -TOOLCHAIN_BRAND ?=3D "linaro"
> > +# ARM9 is not supported by the Linaro toolchain so default back to
> > +the Arago # toolchain for ARM9 based SOCs.
> > +TOOLCHAIN_BRAND ?=3D
> "${@bb.utils.contains('SOC_FAMILY','omapl138','arago','linaro',d)}"
>=20
> I don't feel this belongs in the arago.conf - as the comment above says, =
this is
> supposed to be set in the local.conf anyways, here it just offers a defau=
lt fall
> back...

I don't see what harm is done by tweaking the variable to insure an optimal=
 and safe default fall back is provided for all platforms we support. This =
patch changes nothing except fixes a broken use case.

>=20
> --
> Denys
>=20
>=20
> >  TOOLCHAIN_TYPE ?=3D "external"
> >
> >  require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}-
> ${TOOLCHAIN_BRAND}.inc
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

