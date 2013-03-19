Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D7A7752A51
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 21:46:18 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2JLkHDU032685;
	Tue, 19 Mar 2013 16:46:17 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JLkHKX007892;
	Tue, 19 Mar 2013 16:46:17 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 19 Mar 2013 16:46:17 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Tue, 19 Mar 2013 16:46:17 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [arago-devel] [arago-commits] Denys Dmytriyenko :
	ltp-ddt: use special branch for	platforms with older <= 3.2 kernel
Thread-Index: AQHOJEJoiZ6tlzt9tE2RGzpewqscwZis47KAgADbBAD//8uVcA==
Date: Tue, 19 Mar 2013 21:46:17 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3EAE19@DFLE09.ent.ti.com>
References: <20130319013754.03D0152A56@arago-project.org>
	<8F29D6B095ED194EA1980491A5E029710C3E9EE5@DFLE09.ent.ti.com>
	<20130319194110.GK14761@denix.org>
In-Reply-To: <20130319194110.GK14761@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [arago-devel] [arago-commits] Denys Dmytriyenko : ltp-ddt: use special branch for	platforms with older <= 3.2 kernel
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
X-List-Received-Date: Tue, 19 Mar 2013 21:46:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Tuesday, March 19, 2013 2:41 PM
> To: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [arago-devel] [arago-commits] Denys
> Dmytriyenko : ltp-ddt: use special branch for platforms with older <=3D 3=
.2
> kernel
>=20
> Ah, I'd need to update the Reply-to: used in arago-commits to point to th=
e
> new list instead of the old one...
>=20
>=20
> On Tue, Mar 19, 2013 at 11:47:05AM +0000, Cooper Jr., Franklin wrote:
> > Until the mainline kernel for am335x is official released we should add
> > am335x to this list since the default kernel in meta-arago until that t=
ime
> > will be the 3.2 kernel.
>=20
> Sure, while meta-arago uses 3.2 kernel for am335x by default, we can also
> switch it to using the corresponding branch of ltp-ddt. It's not failing =
for
> now with ltp-ddt master though...

The nightly target side test does not use those ltp-ddt script/files. So un=
less you're doing something different it might explain why you're not runni=
ng into the issue. I don't know what changes Carlos's team have made to tha=
t branch.

>=20
>=20
> > I also have 3 patches that creates a brand new ltp-ddt recipe that is m=
eant
> > for the <=3D 3.2 kernels. So I have a 3.8+ recipe and a <=3D 3.2 recipe=
. It
> > might be easier to have two so you can have the <=3D 3.2 recipe as the
> default
> > but then you can easily override it.
>=20
> I haven't seen the patches, but would it be too much code duplication jus=
t to
> exclude 3 platforms and point them to a separate branch? Moreover, am335
> will
> eventually switch to 3.8, while am180 and am37 are stuck with 2.6.37. So,=
 I
> thought having 2 BRANCH_mach overrides was very isolated, self-contained
> and
> easy to maintain. Creating multiple providers w/o real need should be
> avoided,
> due to maintenance overhead...

Yeah I like your approach better :) If we add the 3.2 branch override for a=
m335x and am3517-evm (currently missing) I will be happy.


>=20
> --
> Denys
>=20
>=20
> > > -----Original Message-----
> > > From: arago-commits-bounces@arago-project.org [mailto:arago-
> commits-
> > > bounces@arago-project.org] On Behalf Of Arago Project git
> > > Sent: Monday, March 18, 2013 8:38 PM
> > > To: arago-commits@arago-project.org
> > > Subject: [arago-commits] Denys Dmytriyenko : ltp-ddt: use special bra=
nch
> for
> > > platforms with older <=3D 3.2 kernel
> > >
> > > Module: meta-arago
> > > Branch: master
> > > Commit: 7566753d23207b8b3a5d6387639341a68b8a18f2
> > > URL:    http://arago-project.org/git/meta-
> > > arago.git?a=3Dcommit;h=3D7566753d23207b8b3a5d6387639341a68b8a18f2
> > >
> > > Author: Denys Dmytriyenko <denys@ti.com>
> > > Date:   Mon Mar 18 16:30:32 2013 -0400
> > >
> > > ltp-ddt: use special branch for platforms with older <=3D3.2 kernel
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > >
> > > ---
> > >
> > >  .../ltp-ddt/ltp-ddt_0.0.4.bbappend                 |    4 ++++
> > >  1 files changed, 4 insertions(+), 0 deletions(-)
> > >
> > > diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-
> ddt_0.0.4.bbappend
> > > b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
> > > index 65a16f9..f8c99d8 100644
> > > --- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappe=
nd
> > > +++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-
> ddt_0.0.4.bbappend
> > > @@ -3,6 +3,10 @@ PR_append =3D "-arago0+gitr${SRCPV}"
> > >  # Auto rev so we pick up the latest changes  SRCREV =3D "${AUTOREV}"
> > >
> > > +# Use special branch for platforms with older <=3D3.2 kernel
> > > +BRANCH_am37x-evm =3D "v3.2"
> > > +BRANCH_am180x-evm =3D "v3.2"
> > > +
> > >  do_compile_kmodules() {
> > >          unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> > >          oe_runmake modules
> > >
> > > _______________________________________________
> > > arago-commits mailing list
> > > arago-commits@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/arago-commits
> >
> > _______________________________________________
> > arago-devel mailing list
> > arago-devel@gforge.ti.com
> > https://gforge.ti.com/mailman/listinfo/arago-devel
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

