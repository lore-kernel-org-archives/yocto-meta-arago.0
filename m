Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 18AB652A50
	for <meta-arago@arago-project.org>;
	Fri, 15 Feb 2013 03:46:42 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1F3kfxv015574;
	Thu, 14 Feb 2013 21:46:41 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1F3kfrj016042;
	Thu, 14 Feb 2013 21:46:41 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Thu, 14 Feb 2013 21:46:41 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "fcooperjr27@gmail.com"
	<fcooperjr27@gmail.com>
Thread-Topic: [meta-arago] [PATCH 07/18] arago.conf: Add SUPPORTS_SGX variable
Thread-Index: AQHOCLpsMGflxzqAp0WHcPg8Stwd3Jh6rzEA//+dX9A=
Date: Fri, 15 Feb 2013 03:46:40 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3918C7@DFLE09.ent.ti.com>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
	<1360629979-24789-7-git-send-email-fcooper@ti.com>
	<20130215033918.GE9154@denix.org>
In-Reply-To: <20130215033918.GE9154@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 07/18] arago.conf: Add SUPPORTS_SGX variable
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
X-List-Received-Date: Fri, 15 Feb 2013 03:46:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I definitely agree :)

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, February 14, 2013 9:39 PM
> To: fcooperjr27@gmail.com
> Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
> Subject: Re: [meta-arago] [PATCH 07/18] arago.conf: Add SUPPORTS_SGX
> variable
>=20
> On Mon, Feb 11, 2013 at 06:46:08PM -0600, fcooperjr27@gmail.com wrote:
> > From: Franklin S. Cooper Jr <fcooper@ti.com>
> >
> > * Add SUPPORTS_SGX variable to arago.conf.
>=20
> I was thinking about this lately and I think we shold add a new "sgx" fla=
g in
> MACHINE_FEATURES to some of our machine configs (those that support it)
> and then base the logic around it - it's easily checked with base_contain=
s().
>=20
> --
> Denys
>=20
>=20
> > * Create a variable that specifies if a board or device has SGX support=
.
> > * This will determine which tasks are pulled in to various filesystem a=
nd SDK
> >   images.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  meta-arago-distro/conf/distro/arago.conf |    9 ++++++---
> >  1 files changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-
> distro/conf/distro/arago.conf
> > index 8330115..691c5b8 100644
> > --- a/meta-arago-distro/conf/distro/arago.conf
> > +++ b/meta-arago-distro/conf/distro/arago.conf
> > @@ -45,9 +45,12 @@ PREFERRED_VERSION_hostap-daemon =3D "2.0-devel-ti"
> >  PREFERRED_VERSION_omap3-sgx-modules =3D "4.08.00.01"
> >  PREFERRED_VERSION_libgles-omap3 =3D "4.08.00.01"
> >
> > -ARAGO_QT_PROVIDER =3D "qt4-embedded"
> > -# Enable Qt+GLES for ARM v7a devices
> > -ARAGO_QT_PROVIDER_armv7a =3D "qt4-embedded-gles"
> > +SUPPORTS_SGX =3D "YES"
> > +
> > +# No omapl138 variant includes SGX
> > +SUPPORTS_SGX_omapl138 =3D "NO"
> > +
> > +ARAGO_QT_PROVIDER =3D "${@base_conditional('SUPPORTS_SGX', 'YES',
> 'qt4-embedded-gles', 'qt4-embedded', d)}"
> >
> >  PREFERRED_PROVIDER_qt4-embedded =3D "${ARAGO_QT_PROVIDER}"
> >
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >

