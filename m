Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id C248452A63
	for <meta-arago@arago-project.org>;
	Thu, 14 Aug 2014 12:35:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7ECZHWa007300;
	Thu, 14 Aug 2014 07:35:17 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7ECZHA0029344;
	Thu, 14 Aug 2014 07:35:17 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 14 Aug 2014 07:35:16 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/2] ltp-ddt: update with latest changes
	in Makefile to pass kernel dir
Thread-Index: AQHPt13nD3LUSlZDRk685n9IK480IZvQCZFQ
Date: Thu, 14 Aug 2014 12:35:16 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6FB51F@DFLE08.ent.ti.com>
References: <1407979193-12037-1-git-send-email-denis@denix.org>
In-Reply-To: <1407979193-12037-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ltp-ddt: update with latest changes in Makefile to pass kernel dir
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
X-List-Received-Date: Thu, 14 Aug 2014 12:35:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Wednesday, August 13, 2014 8:20 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 1/2] ltp-ddt: update with latest changes in
> Makefile to pass kernel dir
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Lots of other local updates were upstreamed, so can be removed from
> bbappend
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../ltp-ddt/ltp-ddt_0.0.4.bbappend                 | 34 ++++------------=
------
>  1 file changed, 5 insertions(+), 29 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-
> ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-
> ddt_0.0.4.bbappend
> index 9fcc92f..8915917 100644
> --- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
> +++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
> @@ -1,38 +1,14 @@
> -PR_append =3D "-arago3+gitr${SRCPV}"
> +PR_append =3D "-arago4+gitr${SRCPV}"
>=20
>  RDEPENDS_${PN} +=3D "linaro-pm-qa-utils"
>=20
>  # Auto rev so we pick up the latest changes  SRCREV =3D "${AUTOREV}"
>=20
> -FILES_${PN}-dbg +=3D " \
> -	${LTPROOT}/testcases/realtime/*/*/.debug \
> -"
> +SRC_URI_remove =3D "file://0001-KERNEL_INC-in-modern-kernel-should-
> point-at-toplevel.patch"
>=20
> -do_compile_kmodules() {
> -	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> -	oe_runmake modules
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
> +EXTRA_OEMAKE +=3D "KERNEL_PATH=3D"${STAGING_KERNEL_DIR}""
>=20
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
> +do_compile_prepend () {
> +    do_make_scripts
>  }
> -
> -addtask make_scripts before do_compile
> -do_make_scripts[lockfiles] =3D "${TMPDIR}/kernel-scripts.lock"
> -do_make_scripts[deptask] =3D "do_populate_sysroot"
> --
> 2.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

