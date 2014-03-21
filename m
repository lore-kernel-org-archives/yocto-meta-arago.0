Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 140825208C
	for <meta-arago@arago-project.org>;
	Fri, 21 Mar 2014 20:46:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2LKkWQC031135
	for <meta-arago@arago-project.org>; Fri, 21 Mar 2014 15:46:32 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2LKkWYx024681
	for <meta-arago@arago-project.org>; Fri, 21 Mar 2014 15:46:32 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Fri, 21 Mar 2014 15:46:32 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/4] tisdk-install: Add SDK_PATH_TARGET
	varaible
Thread-Index: AQHPOlAxPIixA78thE2uR2Grr6uun5rsZEaA//+0TUA=
Date: Fri, 21 Mar 2014 20:46:31 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C66BA8F@DFLE08.ent.ti.com>
References: <1394229426-12753-1-git-send-email-fcooper@ti.com>
	<20140321201711.GR12929@edge>
In-Reply-To: <20140321201711.GR12929@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/4] tisdk-install: Add SDK_PATH_TARGET varaible
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
X-List-Received-Date: Fri, 21 Mar 2014 20:46:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes please.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, March 21, 2014 3:17 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 1/4] tisdk-install: Add SDK_PATH_TARGET
> varaible
>=20
> Franklin,
>=20
> I pushed these 5 patches to dora now. Do you need them in dylan? But they
> didn't make the cut for the release, though.
>=20
> Denys
>=20
>=20
> On Fri, Mar 07, 2014 at 03:57:03PM -0600, Franklin S. Cooper Jr wrote:
> > * Some software like cryptodev-linux needs to know where to install hea=
der
> or
> >   library files that may be needed to cross compile.
> > * These files should go to the SDK_PATH_TARGET directory that is define=
d in
> >    environment-setup.
> > * Add that variable to Rules.make to enable proper cross compiling from
> the top
> >   level Makefile.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../tisdk-install/tisdk-install/sdk-install.sh     |    4 ++++
> >  .../tisdk-install/tisdk-install_1.0.bb             |    2 +-
> >  2 files changed, 5 insertions(+), 1 deletions(-)
> >
> > diff --git
> > a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-inst
> > all.sh
> > b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-inst
> > all.sh
> > index 86799c1..c0284c7 100644
> > ---
> > a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-inst
> > all.sh
> > +++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-
> > +++ install.sh
> > @@ -94,6 +94,10 @@ GCC_VERSION=3D`ls
> > $install_dir/linux-devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOOLCHA
> >  TOOLCHAIN_TARGET_INCLUDE_DIR=3D"linux-
> devkit/sysroots/$REAL_MULTIMACH_TARGET_SYS/usr/include"
> >  TOOLCHAIN_INCLUDE_DIR=3D"linux-
> devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOOLCHAIN_SYS/$GCC_VERSION/inclu
> de"
> >
> > +SDK_PATH_TARGET=3D"linux-
> devkit/sysroots/$REAL_MULTIMACH_TARGET_SYS/"
> > +
> > +sed -i -e s=3D__SDK_PATH_TARGET__=3D$SDK_PATH_TARGET=3D
> > +$install_dir/Rules.make
> > +
> >  # Update CCS project files using important paths to headers
> >
> >  find $install_dir/example-applications -type f -exec sed -i
> >
> "s|<TOOLCHAIN_TARGET_INCLUDE_DIR>|$TOOLCHAIN_TARGET_INCLUDE_DIR
> |g" {}
> > \; diff --git
> > a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
> > b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
> > index 9548ee5..98304b4 100644
> > ---
> > a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
> > +++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.
> > +++ bb
> > @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D
> > "file://../sdk-install.sh;beginline=3D3;endline=3D19;md5=3D4b899037
> >
> >  SRC_URI =3D "file://sdk-install.sh"
> >
> > -PR =3D "r2"
> > +PR =3D "r3"
> >
> >  do_install () {
> >      install -d ${D}/
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

