Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id DF9EF52090
	for <meta-arago@arago-project.org>;
	Mon, 11 Apr 2016 14:10:27 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3BEAR8B006298;
	Mon, 11 Apr 2016 09:10:27 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3BEARDV006064;
	Mon, 11 Apr 2016 09:10:27 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Mon, 11 Apr 2016 09:10:27 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] HACK: packagegroup*: disable opencl and
	openmp for now due to llvm build issues
Thread-Index: AQHRkQPDDeT4l/5v2UuS+Sud+d8TIZ+E1RVg
Date: Mon, 11 Apr 2016 14:10:26 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958142623F7@DFLE09.ent.ti.com>
References: <1460057326-25068-1-git-send-email-denis@denix.org>
In-Reply-To: <1460057326-25068-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 11 Apr 2016 14:10:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

What issue do you see with building llvm? I am able to build ti-llvm3.6, ho=
wever, the "llvm-config" is broken for the native variant.=20

Is this the issue that you see?=20

Thank you,
Jake

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Thursday, April 07, 2016 3:29 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] HACK: packagegroup*: disable opencl and
> openmp for now due to llvm build issues
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../packagegroup-arago-tisdk-addons-sdk-host.bb    | 18 ++++++------
>  .../packagegroup-arago-tisdk-addons-sdk-target.bb  | 21 +++++++------
>  .../packagegroup-arago-tisdk-addons.bb             | 34 +++++++++++-----=
------
>  .../packagegroup-arago-tisdk-matrix.bb             | 20 ++++++-------
>  ...packagegroup-arago-tisdk-multimedia-sdk-host.bb |  4 +--  ...ckagegro=
up-
> arago-tisdk-multimedia-sdk-target.bb |  4 +--
>  .../packagegroup-arago-tisdk-multimedia.bb         |  4 +--
>  7 files changed, 54 insertions(+), 51 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> index 0306c1b..46e9271 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-addons-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> ti
> +++ sdk-addons-sdk-host.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to install sources for additional utilities/demos =
for
> SDKs"
>  LICENSE =3D "MIT"
> -PR =3D "r20"
> +PR =3D "r21"
>=20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> @@ -31,25 +31,25 @@ UTILS_append_ti43x =3D " \
>      pru-icss-src \
>  "
>=20
> +#    opencl-examples-src
> +#    openmpacc-examples-src
>  UTILS_append_dra7xx =3D " \
> -    opencl-examples-src \
> -    openmpacc-examples-src \
>  "
>=20
> +#    opencl-examples-src
> +#    openmpacc-examples-src
>  UTILS_append_k2hk-evm =3D " \
> -    opencl-examples-src \
> -    openmpacc-examples-src \
>      linalg-examples-src \
>  "
>=20
> +#    opencl-examples-src
> +#    openmpacc-examples-src
>  UTILS_append_k2l-evm =3D " \
> -    opencl-examples-src \
> -    openmpacc-examples-src \
>  "
>=20
> +#    opencl-examples-src
> +#    openmpacc-examples-src
>  UTILS_append_k2e-evm =3D " \
> -    opencl-examples-src \
> -    openmpacc-examples-src \
>  "
>=20
>  EXTRA_LIBS =3D ""
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> index 062e8ce..a5b4828 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-addons-sdk-target.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> ti
> +++ sdk-addons-sdk-target.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to install headers and libraries related to addons=
 into
> the SDK"
>  LICENSE =3D "MIT"
> -PR =3D "r25"
> +PR =3D "r26"
>=20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> @@ -119,21 +119,24 @@ EXTRA_LIBS_append_k2e-evm =3D "\
>  UTILS_append_omap3 =3D " canutils-dev"
>  UTILS_append_ti33x =3D " canutils-dev"
>  UTILS_append_ti43x =3D " canutils-dev"
> +#                        opencl-staticdev
> +#                        openmpacc-dev
>  UTILS_append_dra7xx =3D " canutils-dev \
> -                        opencl-staticdev \
>                          elfutils-dev \
>                          elfutils-staticdev \
> -                        openmpacc-dev \
>  "
> -UTILS_append_k2hk-evm =3D " opencl-staticdev \
> -                          openmpacc-dev \
> +#opencl-staticdev
> +#                          openmpacc-dev
> +UTILS_append_k2hk-evm =3D " \
>                            linalg-dev \
>  "
> -UTILS_append_k2l-evm =3D " opencl-staticdev \
> -                         openmpacc-dev \
> +#opencl-staticdev
> +#                         openmpacc-dev
> +UTILS_append_k2l-evm =3D " \
>  "
> -UTILS_append_k2e-evm =3D " opencl-staticdev \
> -                         openmpacc-dev \
> +#opencl-staticdev
> +#                         openmpacc-dev
> +UTILS_append_k2e-evm =3D " \
>  "
>  UTILS_append_k2g-evm =3D " canutils-dev"
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-addons.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 2894f74..517f6a6 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> ti
> +++ sdk-addons.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to install additional utilities/demos for SDKs"
>  LICENSE =3D "MIT"
> -PR =3D "r44"
> +PR =3D "r45"
>=20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> @@ -58,31 +58,31 @@ UTILS_append_am180x-evm =3D " ti-pru-sw-examples"
>=20
>  UTILS_append_omap3 =3D " canutils"
>=20
> +#                        opencl-examples
>  UTILS_append_dra7xx =3D " canutils \
>                          dsptop \
>                          gdbc6x \
>                          glsdk-example-apps \
> -                        opencl-examples \
>  "
>=20
>  UTILS_append_keystone =3D " \
>      ti-ipc-rtos-fw \
>  "
>=20
> +#    opencl-examples
>  UTILS_append_k2hk-evm =3D " \
> -    opencl-examples \
>      gdbc6x \
>      dsptop \
>  "
>=20
> +#    opencl-examples
>  UTILS_append_k2l-evm =3D " \
> -    opencl-examples \
>      gdbc6x \
>      dsptop \
>  "
>=20
> +#    opencl-examples
>  UTILS_append_k2e-evm =3D " \
> -    opencl-examples \
>      gdbc6x \
>      dsptop \
>  "
> @@ -103,26 +103,26 @@ EXTRA_PACKAGES =3D " \
>      nodejs-npm \
>      protobuf \
>  "
> +#    opencl-staticdev
> +#    opencl-examples-dev
> +#    openmpacc-examples-dev
>  EXTRA_PACKAGES_append_dra7xx =3D " \
> -    opencl-staticdev \
> -    opencl-examples-dev \
> -    openmpacc-examples-dev \
>  "
> +#    opencl-staticdev
> +#    opencl-examples-dev
> +#    openmpacc-examples-dev
>  EXTRA_PACKAGES_append_k2hk-evm =3D " \
> -    opencl-staticdev \
> -    opencl-examples-dev \
> -    openmpacc-examples-dev \
>      linalg-examples \
>  "
> +#    opencl-staticdev
> +#    opencl-examples-dev
> +#    openmpacc-examples-dev
>  EXTRA_PACKAGES_append_k2l-evm =3D " \
> -    opencl-staticdev \
> -    opencl-examples-dev \
> -    openmpacc-examples-dev \
>  "
> +#    opencl-staticdev
> +#    opencl-examples-dev
> +#    openmpacc-examples-dev
>  EXTRA_PACKAGES_append_k2e-evm =3D " \
> -    opencl-staticdev \
> -    opencl-examples-dev \
> -    openmpacc-examples-dev \
>  "
>=20
>  RDEPENDS_${PN} =3D "\
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-matrix.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> index 11ff899..9bb68f4 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-matrix.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> ti
> +++ sdk-matrix.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to include Matrix v2"
>  LICENSE =3D "MIT"
> -PR =3D "r51"
> +PR =3D "r52"
>=20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> @@ -129,10 +129,10 @@ MATRIX_APPS_append_omap-a15 =3D "     \
>      matrix-gui-pm-demos-governor    \
>  "
>=20
> +#    matrix-opencl-demo-floatcompute
> +#    matrix-opencl-demo-vecadd
> +#    matrix-video-analytics-opencv-opencl-opengl-demo
>  MATRIX_APPS_append_dra7xx =3D "        \
> -    matrix-opencl-demo-floatcompute  \
> -    matrix-opencl-demo-vecadd        \
> -    matrix-video-analytics-opencv-opencl-opengl-demo \
>  "
>=20
>  MATRIX_APPS_append_beagleboard =3D "  \
> @@ -171,19 +171,19 @@ MATRIX_APPS_append_keystone =3D " \
>      matrix-mc-demo-ipc          \
>  "
>=20
> +#    matrix-opencl-demo-floatcompute
> +#    matrix-opencl-demo-vecadd
>  MATRIX_APPS_append_k2hk-evm =3D "      \
> -    matrix-opencl-demo-floatcompute  \
> -    matrix-opencl-demo-vecadd        \
>  "
>=20
> +#    matrix-opencl-demo-floatcompute
> +#    matrix-opencl-demo-vecadd
>  MATRIX_APPS_append_k2l-evm =3D "       \
> -    matrix-opencl-demo-floatcompute  \
> -    matrix-opencl-demo-vecadd        \
>  "
>=20
> +#    matrix-opencl-demo-floatcompute
> +#    matrix-opencl-demo-vecadd
>  MATRIX_APPS_append_k2e-evm =3D "       \
> -    matrix-opencl-demo-floatcompute  \
> -    matrix-opencl-demo-vecadd        \
>  "
>=20
>  RDEPENDS_${PN} =3D "        \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
> index e83a01c..ddf1148 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-multimedia-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> ti
> +++ sdk-multimedia-sdk-host.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to add multimedia related sources into the SDK"
>  LICENSE =3D "MIT"
> -PR =3D "r9"
> +PR =3D "r10"
>=20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> @@ -21,8 +21,8 @@ MULTIMEDIA_append_ti43x =3D " \
>      image-gallery-src \
>  "
>=20
> +#    qt-opencv-opencl-opengl-multithreaded-src
>  MULTIMEDIA_append_dra7xx =3D " \
> -    qt-opencv-opencl-opengl-multithreaded-src \
>  "
>=20
>  #Demo doesn't work on 3.14
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
> index 93b6664..991d29f 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-multimedia-sdk-target.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> ti
> +++ sdk-multimedia-sdk-target.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to build and install header and libs into sdk"
>  LICENSE =3D "MIT"
> -PR =3D "r6"
> +PR =3D "r7"
>=20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> @@ -8,10 +8,10 @@ inherit packagegroup
>=20
>  MULTIMEDIA =3D ""
>=20
> +#    qt-opencv-opencl-opengl-multithreaded-dev
>  MULTIMEDIA_append_dra7xx =3D " \
>      hevc-arm-decoder-dev \
>      hevc-arm-decoder-staticdev \
> -    qt-opencv-opencl-opengl-multithreaded-dev \
>  "
>=20
>  RDEPENDS_${PN} =3D "\
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> index f5f2a25..4423827 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-multimedia.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> ti
> +++ sdk-multimedia.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to add multimedia related packages"
>  LICENSE =3D "MIT"
> -PR =3D "r16"
> +PR =3D "r17"
>=20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> @@ -26,9 +26,9 @@ MULTIMEDIA_append_omap-a15 =3D " \
>      amsdk-av-files \
>  "
>=20
> +#    qt-opencv-opencl-opengl-multithreaded-dev
>  MULTIMEDIA_append_dra7xx =3D " \
>      hevc-arm-decoder \
> -    qt-opencv-opencl-opengl-multithreaded-dev \
>  "
>=20
>  MULTIMEDIA_append_am37x-evm =3D " \
> --
> 2.2.0
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

