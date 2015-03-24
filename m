Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7902E529F1
	for <meta-arago@arago-project.org>;
	Tue, 24 Mar 2015 13:13:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2ODDKvu029922
	for <meta-arago@arago-project.org>; Tue, 24 Mar 2015 08:13:20 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2ODDJVZ027597
	for <meta-arago@arago-project.org>; Tue, 24 Mar 2015 08:13:19 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Tue, 24 Mar 2015 08:13:18 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-arago] [PATCH] qtbase: Add env script for ti33x w/o
	wayland	to rotate touchscreen.
Thread-Index: AQHQZio8AfpJjVc4iUaYFYhs6990up0rnEIi
Date: Tue, 24 Mar 2015 13:13:17 +0000
Message-ID: <63198F42-2FC4-4A51-A3CC-36DF22560F83@ti.com>
References: <1427198466-11676-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1427198466-11676-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] qtbase: Add env script for ti33x w/o wayland	to rotate touchscreen.
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
X-List-Received-Date: Tue, 24 Mar 2015 13:13:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

We should avoid creating more and more init scripts when possible.

Any reason you couldn't just add the parameter to the main init script and =
use a sed statement to include or not include the rotate command.

Also this seems like this is covering up another issue. Do you have any ide=
a why this is only happening for am335x? Have u verified that this issue is=
 seen for bbb hdmi, GP evm and sk board?

There is nothing special about 335x that should make it unique and for this=
 issue not to be seen on am437x


> On Mar 24, 2015, at 7:01 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> .../recipes-qt/qt5/qtbase/qt_env_ti33x.sh          |    5 +++++
> .../recipes-qt/qt5/qtbase_5.4.1.bbappend           |    9 ++++++---
> 2 files changed, 11 insertions(+), 3 deletions(-)
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/qt_env_ti33x.s=
h
>=20
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env_ti33x.sh b/me=
ta-arago-distro/recipes-qt/qt5/qtbase/qt_env_ti33x.sh
> new file mode 100644
> index 0000000..8f47083
> --- /dev/null
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env_ti33x.sh
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +
> +### QT Environment Variables ###
> +export QT_QPA_GENERIC_PLUGINS=3DAuto
> +export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS=3D"rotate=3D180"
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend b/met=
a-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
> index 210d23f..412bf67 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
> @@ -5,7 +5,7 @@ GLES_EXTRA_DEPS_omap-a15 =3D "libdrm wayland"
>=20
> PACKAGECONFIG[gles2] =3D "-opengl es2 -eglfs,,virtual/libgles2 virtual/eg=
l ${GLES_EXTRA_DEPS}"
>=20
> -PR_append =3D "-arago5"
> +PR_append =3D "-arago6"
>=20
> QT_CONFIG_FLAGS +=3D "-qpa ${@base_contains('DISTRO_FEATURES', 'wayland',=
 'wayland', 'eglfs', d)}"
>=20
> @@ -15,8 +15,11 @@ QT_EGLFS_PATCHES =3D "\
>     file://quit.png \
> "
>=20
> +QT_ENV =3D "qt_env.sh"
> +QT_ENV_ti33x =3D "${@base_contains('DISTRO_FEATURES', 'wayland', 'qt_env=
.sh', 'qt_env_ti33x.sh', d)}"
> +
> SRC_URI +=3D "\
> -    file://qt_env.sh \
> +    file://${QT_ENV} \
>     ${@base_contains('DISTRO_FEATURES', 'wayland', '', "${QT_EGLFS_PATCHE=
S}", d)}\
> "
>=20
> @@ -33,7 +36,7 @@ python do_patch_append() {
> # Add custom Arago Qt 5 Environment script file
> do_install_append () {
>     install -d ${D}${sysconfdir}/profile.d
> -    install -m 0644 ${WORKDIR}/qt_env.sh ${D}${sysconfdir}/profile.d/
> +    install -m 0644 ${WORKDIR}/${QT_ENV} ${D}${sysconfdir}/profile.d/qt_=
env.sh
> }
>=20
> PACKAGES =3D+ "${PN}-conf"
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

