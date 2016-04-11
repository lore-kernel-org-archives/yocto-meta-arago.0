Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C714652090
	for <meta-arago@arago-project.org>;
	Mon, 11 Apr 2016 20:50:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3BKo15U022907;
	Mon, 11 Apr 2016 15:50:01 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3BKo1bc004445;
	Mon, 11 Apr 2016 15:50:01 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Mon, 11 Apr 2016 15:50:01 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] HACK: packagegroup*: disable opencl and
	openmp for now due to llvm build issues
Thread-Index: AQHRkQPDDeT4l/5v2UuS+Sud+d8TIZ+E1RVggACP64D//6zpIIAAV+sA//+sXYCAACblQIAAVX6A//+ydyA=
Date: Mon, 11 Apr 2016 20:49:59 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95814262605@DFLE09.ent.ti.com>
References: <1460057326-25068-1-git-send-email-denis@denix.org>
	<4B26FB5A64EBA14C87266869E037F958142623F7@DFLE09.ent.ti.com>
	<20160411174307.GQ16135@denix.org>
	<4B26FB5A64EBA14C87266869E037F958142624DA@DFLE09.ent.ti.com>
	<20160411180024.GA10048@edge>
	<4B26FB5A64EBA14C87266869E037F9581426259E@DFLE09.ent.ti.com>
	<20160411202615.GB10048@edge>
In-Reply-To: <20160411202615.GB10048@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] HACK: packagegroup*: disable opencl and openmp for now due to llvm build issues
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
X-List-Received-Date: Mon, 11 Apr 2016 20:50:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, April 11, 2016 4:26 PM
> To: Stiffler, Jacob
> Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] HACK: packagegroup*: disable opencl
> and openmp for now due to llvm build issues
>=20
> On Mon, Apr 11, 2016 at 04:21:33PM -0400, Stiffler, Jacob wrote:
> >
> >
> > > -----Original Message-----
> > > From: Stiffler, Jacob
> > > Sent: Monday, April 11, 2016 2:04 PM
> > > To: Dmytriyenko, Denys
> > > Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> > > Subject: RE: [meta-arago] [PATCH] HACK: packagegroup*: disable
> > > opencl and openmp for now due to llvm build issues
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Dmytriyenko, Denys
> > > > Sent: Monday, April 11, 2016 2:00 PM
> > > > To: Stiffler, Jacob
> > > > Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> > > > Subject: Re: [meta-arago] [PATCH] HACK: packagegroup*: disable
> > > > opencl and openmp for now due to llvm build issues
> > > >
> > > > On Mon, Apr 11, 2016 at 05:51:25PM +0000, Stiffler, Jacob wrote:
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Denys Dmytriyenko [mailto:denis@denix.org]
> > > > > > Sent: Monday, April 11, 2016 1:43 PM
> > > > > > To: Stiffler, Jacob
> > > > > > Cc: meta-arago@arago-project.org
> > > > > > Subject: Re: [meta-arago] [PATCH] HACK: packagegroup*: disable
> > > > > > opencl and openmp for now due to llvm build issues
> > > > > >
> > > > > > Jake,
> > > > > >
> > > > > > I believe it is the same issue - none of the LLVM libraries can=
 be
> found.
> > > > > > Affects clocl native and nativesdk variants.
> > > > >
> > > > > I have found the cause of this issue, and I am currently testing
> > > > > a patch to upstream to meta-openembedded.
> > > > >
> > > > > There was a recent change to fix llvm_config for the hard-coded
> > > > > library path for the multilib case.
> > > > > http://cgit.openembedded.org/meta-
> > > > openembedded/commit/?id=3Daf7112d00f21
> > > > > f418a865abba04048a1fef104343
> > > > >
> > > > > Here, '/lib' is replaced with '${base_libdir}'. For native and
> > > > > nativesdk classes, 'base_libdir' includes the full path to the
> > > > > sysroot, and therefore the library search path is incorrect in
> llvm_config.
> > > > >
> > > > > It seems to me that the correct solution is to replace '/lib'
> > > > > with '/${baselib}'. Does this sound correct?
> > > >
> > > > Probably. Any testing?
> > >
> > > I was able to build clocl-native. I will be testing clocl and
> > > nativesdk-clocl shortly.
> > >
> >
> > Both the target and nativesdk classes build successfully. I have
> > submitted the patch the openembedded mailing list.
> >
> > Should I submit a temporary fix for meta-arago?
>=20
> Yes, please. meta-oe may take few days to get in.
>=20

Which list for meta-openembedded is preferred: openembdedded-devel, or open=
embedded-core?

I am testing the fix for meta-arago.

>=20
> > > > > > On Mon, Apr 11, 2016 at 02:10:26PM +0000, Stiffler, Jacob wrote=
:
> > > > > > > Denys,
> > > > > > >
> > > > > > > What issue do you see with building llvm? I am able to build
> > > > > > > ti-llvm3.6, however, the "llvm-config" is broken for the
> > > > > > > native
> > > variant.
> > > > > > >
> > > > > > > Is this the issue that you see?
> > > > > > >
> > > > > > > Thank you,
> > > > > > > Jake
> > > > > > >
> > > > > > > > -----Original Message-----
> > > > > > > > From: meta-arago-bounces@arago-project.org
> > > > > > > > [mailto:meta-arago- bounces@arago-project.org] On Behalf
> > > > > > > > Of Denys Dmytriyenko
> > > > > > > > Sent: Thursday, April 07, 2016 3:29 PM
> > > > > > > > To: meta-arago@arago-project.org
> > > > > > > > Subject: [meta-arago] [PATCH] HACK: packagegroup*: disable
> > > > > > > > opencl
> > > > and
> > > > > > > > openmp for now due to llvm build issues
> > > > > > > >
> > > > > > > > From: Denys Dmytriyenko <denys@ti.com>
> > > > > > > >
> > > > > > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > > > > > ---
> > > > > > > >  .../packagegroup-arago-tisdk-addons-sdk-host.bb    | 18 ++=
++++--
> ----
> > > > > > > >  .../packagegroup-arago-tisdk-addons-sdk-target.bb  | 21
> > > > > > > > +++++++-----
> > > > -
> > > > > > > >  .../packagegroup-arago-tisdk-addons.bb             | 34 ++=
+++++++++-
> ----
> > > --
> > > > ----
> > > > > > > >  .../packagegroup-arago-tisdk-matrix.bb             | 20 ++=
++++-------
> > > > > > > >  ...packagegroup-arago-tisdk-multimedia-sdk-host.bb |  4
> > > > > > > > +--
> > > > > > ...ckagegroup-
> > > > > > > > arago-tisdk-multimedia-sdk-target.bb |  4 +--
> > > > > > > >  .../packagegroup-arago-tisdk-multimedia.bb         |  4 +-=
-
> > > > > > > >  7 files changed, 54 insertions(+), 51 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/meta-arago-distro/recipes-
> > > > > > core/packagegroups/packagegroup-
> > > > > > > > arago-tisdk-addons-sdk-host.bb
> > > > > > > > b/meta-arago-distro/recipes-
> > > > > > > > core/packagegroups/packagegroup-arago-tisdk-addons-sdk-hos
> > > > > > > > t.bb index 0306c1b..46e9271 100644
> > > > > > > > ---
> > > > > > > > a/meta-arago-distro/recipes-core/packagegroups/packagegrou
> > > > > > > > p-
> > > > > > arago-
> > > > > > > > tisdk-addons-sdk-host.bb
> > > > > > > > +++ b/meta-arago-distro/recipes-core/packagegroups/package
> > > > > > > > +++ grou
> > > > > > > > +++ p-
> > > > > > arago-
> > > > > > > > ti
> > > > > > > > +++ sdk-addons-sdk-host.bb
> > > > > > > > @@ -1,6 +1,6 @@
> > > > > > > >  DESCRIPTION =3D "Task to install sources for additional
> > > > > > > > utilities/demos
> > > > for
> > > > > > > > SDKs"
> > > > > > > >  LICENSE =3D "MIT"
> > > > > > > > -PR =3D "r20"
> > > > > > > > +PR =3D "r21"
> > > > > > > >
> > > > > > > >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > > > > > >
> > > > > > > > @@ -31,25 +31,25 @@ UTILS_append_ti43x =3D " \
> > > > > > > >      pru-icss-src \
> > > > > > > >  "
> > > > > > > >
> > > > > > > > +#    opencl-examples-src
> > > > > > > > +#    openmpacc-examples-src
> > > > > > > >  UTILS_append_dra7xx =3D " \
> > > > > > > > -    opencl-examples-src \
> > > > > > > > -    openmpacc-examples-src \
> > > > > > > >  "
> > > > > > > >
> > > > > > > > +#    opencl-examples-src
> > > > > > > > +#    openmpacc-examples-src
> > > > > > > >  UTILS_append_k2hk-evm =3D " \
> > > > > > > > -    opencl-examples-src \
> > > > > > > > -    openmpacc-examples-src \
> > > > > > > >      linalg-examples-src \  "
> > > > > > > >
> > > > > > > > +#    opencl-examples-src
> > > > > > > > +#    openmpacc-examples-src
> > > > > > > >  UTILS_append_k2l-evm =3D " \
> > > > > > > > -    opencl-examples-src \
> > > > > > > > -    openmpacc-examples-src \
> > > > > > > >  "
> > > > > > > >
> > > > > > > > +#    opencl-examples-src
> > > > > > > > +#    openmpacc-examples-src
> > > > > > > >  UTILS_append_k2e-evm =3D " \
> > > > > > > > -    opencl-examples-src \
> > > > > > > > -    openmpacc-examples-src \
> > > > > > > >  "
> > > > > > > >
> > > > > > > >  EXTRA_LIBS =3D ""
> > > > > > > > diff --git a/meta-arago-distro/recipes-
> > > > > > core/packagegroups/packagegroup-
> > > > > > > > arago-tisdk-addons-sdk-target.bb
> > > > > > > > b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.
> > > > > > > > bb
> > > > > > > > index 062e8ce..a5b4828 100644
> > > > > > > > ---
> > > > > > > > a/meta-arago-distro/recipes-core/packagegroups/packagegrou
> > > > > > > > p-
> > > > > > arago-
> > > > > > > > tisdk-addons-sdk-target.bb
> > > > > > > > +++ b/meta-arago-distro/recipes-core/packagegroups/package
> > > > > > > > +++ grou
> > > > > > > > +++ p-
> > > > > > arago-
> > > > > > > > ti
> > > > > > > > +++ sdk-addons-sdk-target.bb
> > > > > > > > @@ -1,6 +1,6 @@
> > > > > > > >  DESCRIPTION =3D "Task to install headers and libraries
> > > > > > > > related to
> > > > addons
> > > > > > into
> > > > > > > > the SDK"
> > > > > > > >  LICENSE =3D "MIT"
> > > > > > > > -PR =3D "r25"
> > > > > > > > +PR =3D "r26"
> > > > > > > >
> > > > > > > >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > > > > > >
> > > > > > > > @@ -119,21 +119,24 @@ EXTRA_LIBS_append_k2e-evm =3D "\
> > > > > > > >  UTILS_append_omap3 =3D " canutils-dev"
> > > > > > > >  UTILS_append_ti33x =3D " canutils-dev"
> > > > > > > >  UTILS_append_ti43x =3D " canutils-dev"
> > > > > > > > +#                        opencl-staticdev
> > > > > > > > +#                        openmpacc-dev
> > > > > > > >  UTILS_append_dra7xx =3D " canutils-dev \
> > > > > > > > -                        opencl-staticdev \
> > > > > > > >                          elfutils-dev \
> > > > > > > >                          elfutils-staticdev \
> > > > > > > > -                        openmpacc-dev \
> > > > > > > >  "
> > > > > > > > -UTILS_append_k2hk-evm =3D " opencl-staticdev \
> > > > > > > > -                          openmpacc-dev \
> > > > > > > > +#opencl-staticdev
> > > > > > > > +#                          openmpacc-dev
> > > > > > > > +UTILS_append_k2hk-evm =3D " \
> > > > > > > >                            linalg-dev \  "
> > > > > > > > -UTILS_append_k2l-evm =3D " opencl-staticdev \
> > > > > > > > -                         openmpacc-dev \
> > > > > > > > +#opencl-staticdev
> > > > > > > > +#                         openmpacc-dev
> > > > > > > > +UTILS_append_k2l-evm =3D " \
> > > > > > > >  "
> > > > > > > > -UTILS_append_k2e-evm =3D " opencl-staticdev \
> > > > > > > > -                         openmpacc-dev \
> > > > > > > > +#opencl-staticdev
> > > > > > > > +#                         openmpacc-dev
> > > > > > > > +UTILS_append_k2e-evm =3D " \
> > > > > > > >  "
> > > > > > > >  UTILS_append_k2g-evm =3D " canutils-dev"
> > > > > > > >
> > > > > > > > diff --git a/meta-arago-distro/recipes-
> > > > > > core/packagegroups/packagegroup-
> > > > > > > > arago-tisdk-addons.bb b/meta-arago-distro/recipes-
> > > > > > > > core/packagegroups/packagegroup-arago-tisdk-addons.bb
> > > > > > > > index 2894f74..517f6a6 100644
> > > > > > > > ---
> > > > > > > > a/meta-arago-distro/recipes-core/packagegroups/packagegrou
> > > > > > > > p-
> > > > > > arago-
> > > > > > > > tisdk-addons.bb
> > > > > > > > +++ b/meta-arago-distro/recipes-core/packagegroups/package
> > > > > > > > +++ grou
> > > > > > > > +++ p-
> > > > > > arago-
> > > > > > > > ti
> > > > > > > > +++ sdk-addons.bb
> > > > > > > > @@ -1,6 +1,6 @@
> > > > > > > >  DESCRIPTION =3D "Task to install additional utilities/demo=
s for
> SDKs"
> > > > > > > >  LICENSE =3D "MIT"
> > > > > > > > -PR =3D "r44"
> > > > > > > > +PR =3D "r45"
> > > > > > > >
> > > > > > > >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > > > > > >
> > > > > > > > @@ -58,31 +58,31 @@ UTILS_append_am180x-evm =3D " ti-pru-sw=
-
> > > > > > examples"
> > > > > > > >
> > > > > > > >  UTILS_append_omap3 =3D " canutils"
> > > > > > > >
> > > > > > > > +#                        opencl-examples
> > > > > > > >  UTILS_append_dra7xx =3D " canutils \
> > > > > > > >                          dsptop \
> > > > > > > >                          gdbc6x \
> > > > > > > >                          glsdk-example-apps \
> > > > > > > > -                        opencl-examples \
> > > > > > > >  "
> > > > > > > >
> > > > > > > >  UTILS_append_keystone =3D " \
> > > > > > > >      ti-ipc-rtos-fw \
> > > > > > > >  "
> > > > > > > >
> > > > > > > > +#    opencl-examples
> > > > > > > >  UTILS_append_k2hk-evm =3D " \
> > > > > > > > -    opencl-examples \
> > > > > > > >      gdbc6x \
> > > > > > > >      dsptop \
> > > > > > > >  "
> > > > > > > >
> > > > > > > > +#    opencl-examples
> > > > > > > >  UTILS_append_k2l-evm =3D " \
> > > > > > > > -    opencl-examples \
> > > > > > > >      gdbc6x \
> > > > > > > >      dsptop \
> > > > > > > >  "
> > > > > > > >
> > > > > > > > +#    opencl-examples
> > > > > > > >  UTILS_append_k2e-evm =3D " \
> > > > > > > > -    opencl-examples \
> > > > > > > >      gdbc6x \
> > > > > > > >      dsptop \
> > > > > > > >  "
> > > > > > > > @@ -103,26 +103,26 @@ EXTRA_PACKAGES =3D " \
> > > > > > > >      nodejs-npm \
> > > > > > > >      protobuf \
> > > > > > > >  "
> > > > > > > > +#    opencl-staticdev
> > > > > > > > +#    opencl-examples-dev
> > > > > > > > +#    openmpacc-examples-dev
> > > > > > > >  EXTRA_PACKAGES_append_dra7xx =3D " \
> > > > > > > > -    opencl-staticdev \
> > > > > > > > -    opencl-examples-dev \
> > > > > > > > -    openmpacc-examples-dev \
> > > > > > > >  "
> > > > > > > > +#    opencl-staticdev
> > > > > > > > +#    opencl-examples-dev
> > > > > > > > +#    openmpacc-examples-dev
> > > > > > > >  EXTRA_PACKAGES_append_k2hk-evm =3D " \
> > > > > > > > -    opencl-staticdev \
> > > > > > > > -    opencl-examples-dev \
> > > > > > > > -    openmpacc-examples-dev \
> > > > > > > >      linalg-examples \
> > > > > > > >  "
> > > > > > > > +#    opencl-staticdev
> > > > > > > > +#    opencl-examples-dev
> > > > > > > > +#    openmpacc-examples-dev
> > > > > > > >  EXTRA_PACKAGES_append_k2l-evm =3D " \
> > > > > > > > -    opencl-staticdev \
> > > > > > > > -    opencl-examples-dev \
> > > > > > > > -    openmpacc-examples-dev \
> > > > > > > >  "
> > > > > > > > +#    opencl-staticdev
> > > > > > > > +#    opencl-examples-dev
> > > > > > > > +#    openmpacc-examples-dev
> > > > > > > >  EXTRA_PACKAGES_append_k2e-evm =3D " \
> > > > > > > > -    opencl-staticdev \
> > > > > > > > -    opencl-examples-dev \
> > > > > > > > -    openmpacc-examples-dev \
> > > > > > > >  "
> > > > > > > >
> > > > > > > >  RDEPENDS_${PN} =3D "\
> > > > > > > > diff --git a/meta-arago-distro/recipes-
> > > > > > core/packagegroups/packagegroup-
> > > > > > > > arago-tisdk-matrix.bb b/meta-arago-distro/recipes-
> > > > > > > > core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> > > > > > > > index 11ff899..9bb68f4 100644
> > > > > > > > ---
> > > > > > > > a/meta-arago-distro/recipes-core/packagegroups/packagegrou
> > > > > > > > p-
> > > > > > arago-
> > > > > > > > tisdk-matrix.bb
> > > > > > > > +++ b/meta-arago-distro/recipes-core/packagegroups/package
> > > > > > > > +++ grou
> > > > > > > > +++ p-
> > > > > > arago-
> > > > > > > > ti
> > > > > > > > +++ sdk-matrix.bb
> > > > > > > > @@ -1,6 +1,6 @@
> > > > > > > >  DESCRIPTION =3D "Task to include Matrix v2"
> > > > > > > >  LICENSE =3D "MIT"
> > > > > > > > -PR =3D "r51"
> > > > > > > > +PR =3D "r52"
> > > > > > > >
> > > > > > > >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > > > > > >
> > > > > > > > @@ -129,10 +129,10 @@ MATRIX_APPS_append_omap-a15 =3D "
> \
> > > > > > > >      matrix-gui-pm-demos-governor    \
> > > > > > > >  "
> > > > > > > >
> > > > > > > > +#    matrix-opencl-demo-floatcompute
> > > > > > > > +#    matrix-opencl-demo-vecadd
> > > > > > > > +#    matrix-video-analytics-opencv-opencl-opengl-demo
> > > > > > > >  MATRIX_APPS_append_dra7xx =3D "        \
> > > > > > > > -    matrix-opencl-demo-floatcompute  \
> > > > > > > > -    matrix-opencl-demo-vecadd        \
> > > > > > > > -    matrix-video-analytics-opencv-opencl-opengl-demo \
> > > > > > > >  "
> > > > > > > >
> > > > > > > >  MATRIX_APPS_append_beagleboard =3D "  \ @@ -171,19 +171,19
> > > > > > > > @@ MATRIX_APPS_append_keystone =3D " \
> > > > > > > >      matrix-mc-demo-ipc          \
> > > > > > > >  "
> > > > > > > >
> > > > > > > > +#    matrix-opencl-demo-floatcompute
> > > > > > > > +#    matrix-opencl-demo-vecadd
> > > > > > > >  MATRIX_APPS_append_k2hk-evm =3D "      \
> > > > > > > > -    matrix-opencl-demo-floatcompute  \
> > > > > > > > -    matrix-opencl-demo-vecadd        \
> > > > > > > >  "
> > > > > > > >
> > > > > > > > +#    matrix-opencl-demo-floatcompute
> > > > > > > > +#    matrix-opencl-demo-vecadd
> > > > > > > >  MATRIX_APPS_append_k2l-evm =3D "       \
> > > > > > > > -    matrix-opencl-demo-floatcompute  \
> > > > > > > > -    matrix-opencl-demo-vecadd        \
> > > > > > > >  "
> > > > > > > >
> > > > > > > > +#    matrix-opencl-demo-floatcompute
> > > > > > > > +#    matrix-opencl-demo-vecadd
> > > > > > > >  MATRIX_APPS_append_k2e-evm =3D "       \
> > > > > > > > -    matrix-opencl-demo-floatcompute  \
> > > > > > > > -    matrix-opencl-demo-vecadd        \
> > > > > > > >  "
> > > > > > > >
> > > > > > > >  RDEPENDS_${PN} =3D "        \
> > > > > > > > diff --git a/meta-arago-distro/recipes-
> > > > > > core/packagegroups/packagegroup-
> > > > > > > > arago-tisdk-multimedia-sdk-host.bb
> > > > > > > > b/meta-arago-distro/recipes-
> > > > > > > > core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk
> > > > > > > > -
> > > > host.bb
> > > > > > > > index e83a01c..ddf1148 100644
> > > > > > > > ---
> > > > > > > > a/meta-arago-distro/recipes-core/packagegroups/packagegrou
> > > > > > > > p-
> > > > > > arago-
> > > > > > > > tisdk-multimedia-sdk-host.bb
> > > > > > > > +++ b/meta-arago-distro/recipes-core/packagegroups/package
> > > > > > > > +++ grou
> > > > > > > > +++ p-
> > > > > > arago-
> > > > > > > > ti
> > > > > > > > +++ sdk-multimedia-sdk-host.bb
> > > > > > > > @@ -1,6 +1,6 @@
> > > > > > > >  DESCRIPTION =3D "Task to add multimedia related sources
> > > > > > > > into the
> > > > SDK"
> > > > > > > >  LICENSE =3D "MIT"
> > > > > > > > -PR =3D "r9"
> > > > > > > > +PR =3D "r10"
> > > > > > > >
> > > > > > > >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > > > > > >
> > > > > > > > @@ -21,8 +21,8 @@ MULTIMEDIA_append_ti43x =3D " \
> > > > > > > >      image-gallery-src \
> > > > > > > >  "
> > > > > > > >
> > > > > > > > +#    qt-opencv-opencl-opengl-multithreaded-src
> > > > > > > >  MULTIMEDIA_append_dra7xx =3D " \
> > > > > > > > -    qt-opencv-opencl-opengl-multithreaded-src \
> > > > > > > >  "
> > > > > > > >
> > > > > > > >  #Demo doesn't work on 3.14 diff --git
> > > > > > > > a/meta-arago-distro/recipes-
> > > > > > core/packagegroups/packagegroup-
> > > > > > > > arago-tisdk-multimedia-sdk-target.bb
> > > > > > > > b/meta-arago-distro/recipes-
> > > > > > > > core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk
> > > > > > > > -
> > > > > > target.bb
> > > > > > > > index 93b6664..991d29f 100644
> > > > > > > > ---
> > > > > > > > a/meta-arago-distro/recipes-core/packagegroups/packagegrou
> > > > > > > > p-
> > > > > > arago-
> > > > > > > > tisdk-multimedia-sdk-target.bb
> > > > > > > > +++ b/meta-arago-distro/recipes-core/packagegroups/package
> > > > > > > > +++ grou
> > > > > > > > +++ p-
> > > > > > arago-
> > > > > > > > ti
> > > > > > > > +++ sdk-multimedia-sdk-target.bb
> > > > > > > > @@ -1,6 +1,6 @@
> > > > > > > >  DESCRIPTION =3D "Task to build and install header and libs=
 into
> sdk"
> > > > > > > >  LICENSE =3D "MIT"
> > > > > > > > -PR =3D "r6"
> > > > > > > > +PR =3D "r7"
> > > > > > > >
> > > > > > > >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > > > > > >
> > > > > > > > @@ -8,10 +8,10 @@ inherit packagegroup
> > > > > > > >
> > > > > > > >  MULTIMEDIA =3D ""
> > > > > > > >
> > > > > > > > +#    qt-opencv-opencl-opengl-multithreaded-dev
> > > > > > > >  MULTIMEDIA_append_dra7xx =3D " \
> > > > > > > >      hevc-arm-decoder-dev \
> > > > > > > >      hevc-arm-decoder-staticdev \
> > > > > > > > -    qt-opencv-opencl-opengl-multithreaded-dev \
> > > > > > > >  "
> > > > > > > >
> > > > > > > >  RDEPENDS_${PN} =3D "\
> > > > > > > > diff --git a/meta-arago-distro/recipes-
> > > > > > core/packagegroups/packagegroup-
> > > > > > > > arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-
> > > > > > > > core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> > > > > > > > index f5f2a25..4423827 100644
> > > > > > > > ---
> > > > > > > > a/meta-arago-distro/recipes-core/packagegroups/packagegrou
> > > > > > > > p-
> > > > > > arago-
> > > > > > > > tisdk-multimedia.bb
> > > > > > > > +++ b/meta-arago-distro/recipes-core/packagegroups/package
> > > > > > > > +++ grou
> > > > > > > > +++ p-
> > > > > > arago-
> > > > > > > > ti
> > > > > > > > +++ sdk-multimedia.bb
> > > > > > > > @@ -1,6 +1,6 @@
> > > > > > > >  DESCRIPTION =3D "Task to add multimedia related packages"
> > > > > > > >  LICENSE =3D "MIT"
> > > > > > > > -PR =3D "r16"
> > > > > > > > +PR =3D "r17"
> > > > > > > >
> > > > > > > >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > > > > > >
> > > > > > > > @@ -26,9 +26,9 @@ MULTIMEDIA_append_omap-a15 =3D " \
> > > > > > > >      amsdk-av-files \
> > > > > > > >  "
> > > > > > > >
> > > > > > > > +#    qt-opencv-opencl-opengl-multithreaded-dev
> > > > > > > >  MULTIMEDIA_append_dra7xx =3D " \
> > > > > > > >      hevc-arm-decoder \
> > > > > > > > -    qt-opencv-opencl-opengl-multithreaded-dev \
> > > > > > > >  "
> > > > > > > >
> > > > > > > >  MULTIMEDIA_append_am37x-evm =3D " \
> > > > > > > > --
> > > > > > > > 2.2.0
> > > > > > > >
> > > > > > > > _______________________________________________
> > > > > > > > meta-arago mailing list
> > > > > > > > meta-arago@arago-project.org
> > > > > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-ara
> > > > > > > > go
> > > > > > >
> > > > > _______________________________________________
> > > > > meta-arago mailing list
> > > > > meta-arago@arago-project.org
> > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

