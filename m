Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 156F7529CB
	for <meta-arago@arago-project.org>;
	Mon,  9 Dec 2013 17:03:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB9H3IDk000379;
	Mon, 9 Dec 2013 11:03:18 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB9H3Hqs025869;
	Mon, 9 Dec 2013 11:03:17 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 9 Dec 2013 11:03:17 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Eyal Reizer <eyalreizer@gmail.com>
Thread-Topic: [meta-arago] [PATCHv2] ti-compat-wireless-wl18xx: build from
	ol_r8.a8.08
Thread-Index: AQHO9OJRsvY3lm0a7Uqn/b2lmjRLIJpMF1cY
Date: Mon, 9 Dec 2013 17:03:17 +0000
Message-ID: <7A764F1B-E644-4364-A9BB-F7FCBFAB00BD@ti.com>
References: <1386595593-8175-1-git-send-email-eyalr@ti.com>
In-Reply-To: <1386595593-8175-1-git-send-email-eyalr@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCHv2] ti-compat-wireless-wl18xx: build from	ol_r8.a8.08
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
X-List-Received-Date: Mon, 09 Dec 2013 17:03:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> On Dec 9, 2013, at 9:26 PM, "Eyal Reizer" <eyalreizer@gmail.com> wrote:
>=20
> * Add a new recipe fetching and building the Wilink8 drivers from=20
> TI-Openlink based on release ol_r8.a8.08.
>=20
> * This recipe is used for building with kernels older then the 3.12 kerne=
l=20
> where the drivers are now in-tree.
> For 3.12 and newer, this recipe is not needed as the wl18xx wlan drivers
> are now in-tree.
>=20
> * Remove previous vrsion of the recipe building ol_r8.a6.01
>=20
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
> Changes from previous submission:
> Combined the 2 patches that add a new version and removed the previous
> version into one patch that does both
>=20
> ...01.bb =3D> ti-compat-wireless-wl18xx_r8.a8.08.bb} |   34 +++++++++++--=
-------
> 1 files changed, 19 insertions(+), 15 deletions(-)
> copy meta-arago-extras/recipes-bsp/ti-compat-wireless/{ti-compat-wireless=
-wl18xx_r8.a6.01.bb =3D> ti-compat-wireless-wl18xx_r8.a8.08.bb} (70%)
>=20
> diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-w=
ireless-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-bsp/ti-compat-wirele=
ss/ti-compat-wireless-wl18xx_r8.a8.08.bb
> similarity index 70%
> copy from meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wire=
less-wl18xx_r8.a6.01.bb
> copy to meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wirele=
ss-wl18xx_r8.a8.08.bb
> index a69b7d6..9baf628 100644
> --- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless=
-wl18xx_r8.a6.01.bb
> +++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless=
-wl18xx_r8.a8.08.bb
> @@ -5,7 +5,7 @@ DESCRIPTION =3D "ti compat-wireless drivers for wl18xx"
> HOMEPAGE =3D "https://gforge.ti.com/gf/project/ecs_nlcp/"
> SECTION =3D "kernel/modules"
> LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dd7810fab7487fb0aad327b76f1b=
e7cd7"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7=
cd7"
>=20
> RDEPENDS_${PN} =3D "wireless-tools"
>=20
> @@ -14,16 +14,18 @@ RPROVIDES_${PN} +=3D "ti-compat-wireless-wl12xx"
> RREPLACES_${PN} +=3D "ti-compat-wireless-wl12xx"
> RCONFLICTS_${PN} +=3D "ti-compat-wireless-wl12xx"
>=20
> -PV =3D "r8.a6.01"
> +COMPATIBLE_MACHINE =3D "(omap-a15)"
> +
> +PV =3D "r8.a8.08"
> inherit module
>=20
> PR =3D "${MACHINE_KERNEL_PR}"
> -PR_append =3D "c"
> +PR_append =3D "a"
>=20
> -# Tags: ol_r8.a6.01
> -SRCREV_wl18xx =3D "f076cdad1988daf207ad560db2fe96caaa7c596e"
> -SRCREV_compat =3D "c37c46c4ab5085ba50f650d15854404983b8d09b"
> -SRCREV_compat-wireless =3D "3ec9ecca2cb07584e115ba53117f0084fc8faa25"
> +# Tags: ol_r8.a8.08
> +SRCREV_wl18xx =3D "eaa1820c02dc076e6ad9254e9cb7a3bb0c17471b"
> +SRCREV_compat =3D "5d80865281795f962e1400a95202bbd07dd763c0"
> +SRCREV_compat-wireless =3D "23a0d62ea1a57327709a77f08d6265ec807a909f"
>=20
> SRCREV_FORMAT =3D "compat-wireless"
>=20
> @@ -32,27 +34,24 @@ S =3D "${WORKDIR}/compat-wireless"
> SRC_URI =3D "git://github.com/TI-OpenLink/compat-wireless.git;destsuffix=
=3Dcompat-wireless;name=3Dcompat-wireless \
>            git://github.com/TI-OpenLink/compat.git;destsuffix=3Dcompat;na=
me=3Dcompat \
>            git://github.com/TI-OpenLink/wl18xx.git;destsuffix=3Dwl18xx;na=
me=3Dwl18xx \
> -           file://0001-git-version-wl18xx-use-compat-base-tree.patch;pat=
chdir=3D../wl18xx \
> -           file://0001-wl12xx-additional-two-members-for-wl12xx_platform=
_da.patch;patchdir=3D../wl18xx \
> -          "
> -
> +"
>=20
> EXTRA_OEMAKE =3D "KLIB_BUILD=3D${STAGING_KERNEL_DIR} KLIB=3D${D}"
>=20
> -# Prevent sourceipk adjust_git function from running.
> +# Prevent sourceipk clear_git function from running.
> # This preserves the git repo until driver-select is ran.
>=20
> -adjust_git() {
> +clear_git() {
>     :
> }
You shouldn't need to do this anymore.=20
>=20
> do_configure() {
>     cd ${S}
> -    GIT_TREE=3D"${WORKDIR}/wl18xx" GIT_COMPAT_TREE=3D"${WORKDIR}/compat"=
 ./scripts/admin-refresh.sh
> +    GIT_TREE=3D"${WORKDIR}/wl18xx" GIT_COMPAT_TREE=3D"${WORKDIR}/compat"=
 ./scripts/admin-refresh.sh network
>     ./scripts/driver-select wl18xx
>=20
>     # Delete the .git repository since it should no longer be needed.
> -    rm -rf ${S}/.git ${S}/.gitignore
> +    #rm -rf ${S}/.git ${S}/.gitignore
>=20
Shouldn't leave any code that is commented out
>     # Now generate the sourceipk with the properly configured sources
>     sourceipk_do_create_srcipk
> @@ -63,5 +62,10 @@ do_configure_append() {
> }
>=20
> do_install() {
> +    # Remove hardcoded references to host depmod
> +    sed -i "s#@/sbin/depmod -a## " Makefile
> +    sed -i "s#@/sbin/depmod -ae## " Makefile
> +
> +    # Install modules
>     oe_runmake DEPMOD=3Decho DESTDIR=3D"${D}" INSTALL_MOD_PATH=3D"${D}" L=
DFLAGS=3D"" install-modules
> }
> --=20
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

