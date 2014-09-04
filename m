Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 33AB852992
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 20:13:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84KDkVQ021487;
	Thu, 4 Sep 2014 15:13:46 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84KDjDT027714;
	Thu, 4 Sep 2014 15:13:45 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Thu, 4 Sep 2014 15:13:45 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] recipes: HACK: disable parallel make for
	out-of-tree modules due to fixdep race
Thread-Index: AQHPyHvWOvfGw5NmbkWec8BjKdCVTpvxZ0rw
Date: Thu, 4 Sep 2014 20:13:44 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C728F0B@DFLE08.ent.ti.com>
References: <1409861210-28560-1-git-send-email-denis@denix.org>
In-Reply-To: <1409861210-28560-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] recipes: HACK: disable parallel make for out-of-tree modules due to fixdep race
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
X-List-Received-Date: Thu, 04 Sep 2014 20:13:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is a bit unfortunate but yeah builds dying is a problem. Will you also=
 be sending one for the graphics portion in meta-ti?

We never seen this issue before on 3.12 or older so I wonder what changed a=
nd why it's not a bigger issue for a lot more people.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Thursday, September 04, 2014 3:07 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] recipes: HACK: disable parallel make for ou=
t-
> of-tree modules due to fixdep race
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> * The fixdep race happens in the kernel tree when building out-of-tree
> modules
> * It is intermittent and doesn't happen allways, but depend on high # of
> threads
> * Need to investigate it further, but currently it's blocking release bui=
lds
> * There's a previous report on LKML:
> https://groups.google.com/forum/#!msg/linux.kernel/j4DdW77nM60/QhgP
> F1jhKe4J
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Cc: Carlos Hernandez <ceh@ti.com>
> ---
>  .../recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend              | 4 +++=
-
>  .../recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend       | 4 +++=
-
>  .../ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb     | 9 +++=
++--
> --
>  3 files changed, 11 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-
> ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-
> ddt_0.0.4.bbappend
> index 8915917..8acb67a 100644
> --- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
> +++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
> @@ -1,4 +1,6 @@
> -PR_append =3D "-arago4+gitr${SRCPV}"
> +PR_append =3D "-arago5+gitr${SRCPV}"
> +
> +PARALLEL_MAKE =3D ""
>=20
>  RDEPENDS_${PN} +=3D "linaro-pm-qa-utils"
>=20
> diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-
> module_1.6.bbappend b/meta-arago-distro/recipes-
> kernel/cryptodev/cryptodev-module_1.6.bbappend
> index 7be7536..52bb6db 100644
> --- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-
> module_1.6.bbappend
> +++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-
> module_1.6.bbappend
> @@ -1,4 +1,6 @@
> -PR_append =3D "-arago2"
> +PR_append =3D "-arago3"
> +
> +PARALLEL_MAKE =3D ""
>=20
>  module_autoload_cryptodev =3D "cryptodev-module"
>=20
> diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-
> wireless-wl18xx_r8.a9.14.bb b/meta-arago-extras/recipes-bsp/ti-compat-
> wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb
> index dca2edb..fe75284 100644
> --- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless=
-
> wl18xx_r8.a9.14.bb
> +++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-
> wireless-wl18xx_r8.a9.14.bb
> @@ -12,7 +12,9 @@ RDEPENDS_${PN} =3D "wireless-tools"
>  PV =3D "r8.a9.14"
>  inherit module
>=20
> -PR =3D "${MACHINE_KERNEL_PR}+a+gitr${SRCPV}"
> +PR =3D "${MACHINE_KERNEL_PR}+b+gitr${SRCPV}"
> +
> +PARALLEL_MAKE =3D ""
>=20
>  # Tags: ol_r8.a9.14
>  SRCREV_wl18xx =3D "0e48c4b55cfa0d557a098cbe92b1f092f1a9ad67"
> @@ -26,7 +28,7 @@ S =3D "${WORKDIR}/compat-wireless"
>=20
>  SRC_URI =3D "git://git.ti.com/wilink8-
> wlan/wl18xx.git;branch=3D${BRANCH_wl18xx};destsuffix=3Dwl18xx;name=3Dwl18=
x
> x \
>             git://git.ti.com/wilink8-
> wlan/backports.git;branch=3D${BRANCH_backports};destsuffix=3Dbackports;na=
m
> e=3Dbackports \
> - "
> +"
>=20
>  export KLIB_BUILD=3D"${STAGING_KERNEL_DIR}"
>  export KLIB=3D"${D}"
> @@ -41,11 +43,10 @@ do_configure() {
>      make defconfig-wl18xx
>=20
>      # Now generate the sourceipk with the properly configured sources
> -	sourceipk_do_create_srcipk
> +    sourceipk_do_create_srcipk
>  }
>=20
>  do_install() {
>      # Install modules
>      oe_runmake modules_install
>  }
> -
> --
> 2.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

