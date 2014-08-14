Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1A8ED52A63
	for <meta-arago@arago-project.org>;
	Thu, 14 Aug 2014 12:35:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7ECZRi3002831;
	Thu, 14 Aug 2014 07:35:27 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7ECZRWs026967;
	Thu, 14 Aug 2014 07:35:27 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Thu, 14 Aug 2014 07:35:27 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/2] ltp-ddt-legacy: remove special
	version meant for 3.2 kernels
Thread-Index: AQHPt13oCARlh+qvnECyl5g4KsF8f5vQCa8g
Date: Thu, 14 Aug 2014 12:35:26 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6FB529@DFLE08.ent.ti.com>
References: <1407979193-12037-1-git-send-email-denis@denix.org>
	<1407979193-12037-2-git-send-email-denis@denix.org>
In-Reply-To: <1407979193-12037-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ltp-ddt-legacy: remove special version meant for 3.2 kernels
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
X-List-Received-Date: Thu, 14 Aug 2014 12:35:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Wednesday, August 13, 2014 8:20 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 2/2] ltp-ddt-legacy: remove special version
> meant for 3.2 kernels
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> No longer supported in meta-ti/meta-arago
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../ltp-ddt/ltp-ddt-legacy_1.0.bbappend            | 32 ----------------=
------
>  .../recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb | 14 ----------
>  2 files changed, 46 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt-
> legacy_1.0.bbappend
>  delete mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-
> legacy_1.0.bb
>=20
> diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt-
> legacy_1.0.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt-
> legacy_1.0.bbappend
> deleted file mode 100644
> index 65a16f9..0000000
> --- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt-
> legacy_1.0.bbappend
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -PR_append =3D "-arago0+gitr${SRCPV}"
> -
> -# Auto rev so we pick up the latest changes -SRCREV =3D "${AUTOREV}"
> -
> -do_compile_kmodules() {
> -        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> -        oe_runmake modules
> -}
> -
> -addtask compile_kmodules after do_compile before do_install
> -
> -# Grab a portion of the module.bbclass to provide the needed kernel
> application -# scripts/basic/fixdep. This issue is discussed in the follo=
wing
> thread.
> -# http://lists.linuxtogo.org/pipermail/openembedded-core/2011-
> July/005536.html
> -
> -inherit module-base
> -
> -#
> -# Ensure the hostprogs are available for module compilation. Modules tha=
t -
> # inherit this recipe and override do_compile() should be sure to call -#
> do_make_scripts() or ensure the scripts are built independently.
> -#
> -do_make_scripts() {
> -	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> -	oe_runmake CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}"
> AR=3D"${KERNEL_AR}" \
> -	           -C ${STAGING_KERNEL_DIR} scripts
> -}
> -
> -addtask make_scripts before do_compile
> -do_make_scripts[lockfiles] =3D "${TMPDIR}/kernel-scripts.lock"
> -do_make_scripts[deptask] =3D "do_populate_sysroot"
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-
> legacy_1.0.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-
> legacy_1.0.bb
> deleted file mode 100644
> index af5aa1b..0000000
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -# The master branch is now 3.2+ kernels.
> -# This recipe is meant to use the v3.2 that supports 3.2 and older kerne=
ls.
> -
> -require recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
> -
> -PROVIDES +=3D "ltp-ddt"
> -RPROVIDES_${PN} +=3D "ltp-ddt"
> -RREPLACES_${PN} +=3D "ltp-ddt"
> -RCONFLICTS_${PN} +=3D "ltp-ddt"
> -
> -PR :=3D "${PR}.0"
> -
> -SRCREV =3D "1973c7e79f2ad1b595d5d1687db828f3f3998387"
> -BRANCH =3D "v3.2"
> --
> 2.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

