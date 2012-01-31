Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C351152A59
	for <meta-arago@arago-project.org>;
	Tue, 31 Jan 2012 20:32:59 +0000 (UTC)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0VKWwSt013655;
	Tue, 31 Jan 2012 14:32:58 -0600
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0VKWwAx013607;
	Tue, 31 Jan 2012 14:32:58 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE70.ent.ti.com ([fe80::db3:609a:aa62:e1ec%22]) with mapi id
	14.01.0323.003; Tue, 31 Jan 2012 14:32:58 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCH] arm-benchmarks: port benchmarks from old
	arago
Thread-Index: AQHM4FaOUbO8sUkx9ECUUman6+AcrpYm7ZHw
Date: Tue, 31 Jan 2012 20:32:57 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1010BFA3D5D@DLEE12.ent.ti.com>
References: <1328040232-28814-1-git-send-email-Chase.Maupin@ti.com>
	<20120131202558.GF5169@denix.org>
In-Reply-To: <20120131202558.GF5169@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] arm-benchmarks: port benchmarks from old arago
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
X-List-Received-Date: Tue, 31 Jan 2012 20:33:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denis@denix.org]
> Sent: Tuesday, January 31, 2012 2:26 PM
> To: Maupin, Chase
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] arm-benchmarks: port benchmarks
> from old arago
>=20
> On Tue, Jan 31, 2012 at 02:03:52PM -0600, Chase Maupin wrote:
> > * Port the am-benchmarks from the original arago overlay to
> >   meta-arago
> > * Change the name to arm-benchmarks
> > * Modify the recipe for oe-core changes
> > * Updated the SRCREV to pickup licensing file
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  .../arm-benchmarks/arm-benchmarks_1.3.bb           |   24
> ++++++++++++++++++++
> >  1 files changed, 24 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-arago-extras/recipes-core/arm-
> benchmarks/arm-benchmarks_1.3.bb
>=20
> There is a whole set of benchmarks in meta-oe/recipes-benchmark/,
> so should we
> use the same path instead of recipes-core?

I was intending recipes-core to be the recipes that the various SDKs will s=
hare.  Maybe my view was too SDK centric, so I'm OK with changing this.  I =
just didn't want to get to:

Recipes-benchmark/arm-benchmarks
Recipes-settigns/am-sysinfo
Recipes-matrix/matrix

Etc.  But since recipes-benchmark is already used somewhere else I'll make =
this change and resubmit.

>=20
> --
> Denys
>=20
> > diff --git a/meta-arago-extras/recipes-core/arm-benchmarks/arm-
> benchmarks_1.3.bb b/meta-arago-extras/recipes-core/arm-
> benchmarks/arm-benchmarks_1.3.bb
> > new file mode 100644
> > index 0000000..71f5eb8
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-core/arm-benchmarks/arm-
> benchmarks_1.3.bb
> > @@ -0,0 +1,24 @@
> > +DESCRIPTION =3D "ARM Benchmarks"
> > +HOMEPAGE =3D "https://gforge.ti.com/gf/project/am_benchmarks/"
> > +LICENSE =3D "BSD"
> > +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D7aefb5e1cffc7b6a3ef18b803f957922"
> > +SECTION =3D "system"
> > +
> > +SRCREV =3D "76"
> > +PR =3D "r0+svnr${SRCPV}"
> > +
> > +SRC_URI =3D
> "svn://gforge.ti.com/svn/am_benchmarks/;module=3Dtrunk;proto=3Dhttps;us
> er=3Danonymous;pswd=3D''"
> > +
> > +S =3D "${WORKDIR}/trunk"
> > +
> > +do_compile() {
> > +	export CROSS_COMPILE=3D${TARGET_PREFIX}
> > +	export ARCH=3D${TUNE_PKGARCH}
> > +	# build the release version
> > +	make release
> > +}
> > +
> > +do_install() {
> > +	export ARCH=3D${TUNE_PKGARCH}
> > +	make DESTDIR=3D${D} install
> > +}
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >

