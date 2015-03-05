Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 24D985299E
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 13:59:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t25Dxmi3016390
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 07:59:48 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25Dxl2i021526
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 07:59:47 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Thu, 5 Mar 2015 07:59:47 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-arago] [RFC 2/4] packagegroups: Add wayland/weston based
	on	ARAGO_QT_PLATFORM.
Thread-Index: AQHQV0kJpKZeiBNzGkyXYRahZjG0yZ0N6rS4
Date: Thu, 5 Mar 2015 13:59:46 +0000
Message-ID: <EDDF6E74-489D-42DF-8A56-23F723D387E4@ti.com>
References: <1425562410-19688-1-git-send-email-j-stiffler@ti.com>,
	<1425562410-19688-3-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1425562410-19688-3-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [RFC 2/4] packagegroups: Add wayland/weston based on	ARAGO_QT_PLATFORM.
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
X-List-Received-Date: Thu, 05 Mar 2015 13:59:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable




> On Mar 5, 2015, at 7:33 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
>=20
> * If ARAGO_QT_PLATFORM =3D wayland, include wayland and weston.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> .../packagegroups/packagegroup-arago-qte.bb        |    4 ++--
> .../packagegroup-arago-tisdk-graphics.bb           |    4 ++--
> .../packagegroups/packagegroup-arago-tisdk-qte.bb  |    4 ++--
> .../packagegroups/packagegroup-linaro-tc-test.bb   |    5 +++--
> 4 files changed, 9 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-qte.bb
> index 9618de5..3007836 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte=
.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte=
.bb
> @@ -1,6 +1,6 @@
> DESCRIPTION =3D "Task to add Qt embedded related packages"
> LICENSE =3D "MIT"
> -PR =3D "r8"
> +PR =3D "r9"
>=20
> inherit packagegroup
>=20
> @@ -34,7 +34,7 @@ QT5_ESSENTIALS =3D "\
>     qtlocation-qmlplugins \
>     qtmultimedia-plugins \
>     qtmultimedia-qmlplugins \
> -    qtwayland-plugins \
> +    ${@base_conditional('ARAGO_QT_PLATFORM', 'wayland', 'qtwayland-plugi=
ns', '', d)} \
>     qt3d-qmlplugins \
>     qtwebkit-qmlplugins \
>     qtquick1-plugins \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-graphics.bb
> index f854596..c17f5c4 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-graphics.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-graphics.bb
> @@ -1,6 +1,6 @@
> DESCRIPTION =3D "Task to install graphics binaries"
> LICENSE =3D "MIT"
> -PR =3D "r7"
> +PR =3D "r8"
>=20
> inherit packagegroup
>=20
> @@ -48,7 +48,7 @@ GRAPHICS_BLTSVILLE_omap-a15 =3D " \
>     "
>=20
> RDEPENDS_${PN} =3D "\
> -    ${@base_conditional('QT_PROVIDER', 'qt4e', "", "${GRAPHICS_WESTON}",=
 d)} \
> +    ${@base_conditional('QT_PROVIDER', 'qt4e', "", base_conditional('ARA=
GO_QT_PLATFORM', 'wayland', "${GRAPHICS_WESTON}", '', d), d)} \
>     ${GRAPHICS_RDEPENDS} \
>     ${GRAPHICS_BLTSVILLE} \
> "
By using my suggestion in the first patch you wouldn't need to nest conditi=
onal statement.
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegrou=
p-arago-tisdk-qte.bb
> index eeb32fb..ac8eaa0 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-qte.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-qte.bb
> @@ -1,6 +1,6 @@
> DESCRIPTION =3D "Task to add Qt embedded related packages"
> LICENSE =3D "MIT"
> -PR =3D "r11"
> +PR =3D "r12"
>=20
> inherit packagegroup
>=20
> @@ -22,7 +22,7 @@ QT5_DEMOS =3D "\
>     qtlocation-examples \
>     qtmultimedia-examples \
>     qtscript-examples \
> -    qtwayland-examples \
> +    ${@base_conditional('ARAGO_QT_PLATFORM', 'wayland', 'qtwayland-examp=
les', '', d)} \
>     qtwebkit-examples-examples \
>     qtquick1-examples \
> "
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-li=
naro-tc-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup=
-linaro-tc-test.bb
> index 8fd863e..d813c8a 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-linaro-tc=
-test.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-linaro-tc=
-test.bb
> @@ -1,6 +1,8 @@
> DESCRIPTION =3D "Group of packages to build with Linaro toolchain for tes=
ting"
> LICENSE =3D "MIT"
>=20
> +PR =3D "r1"
> +
> inherit packagegroup
>=20
> RDEPENDS_${PN} =3D "\
> @@ -10,8 +12,7 @@ RDEPENDS_${PN} =3D "\
>     bash \
>     coreutils \
>     apache \
> -    wayland \
> -    weston \
> +    ${@base_conditional('ARAGO_QT_PLATFORM', 'wayland', 'wayland weston'=
, '', d)} \
>     gstreamer \
>     openssl \
>     openssh \
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

