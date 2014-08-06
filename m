Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 9F7BC52A51
	for <meta-arago@arago-project.org>;
	Wed,  6 Aug 2014 23:30:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s76NUsud014379;
	Wed, 6 Aug 2014 18:30:54 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s76NUruK002754;
	Wed, 6 Aug 2014 18:30:54 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Wed, 6 Aug 2014 18:30:53 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/4] packagegroups: conditionally disable
	dual-camera and image-gallery for Qt5 builds
Thread-Index: AQHPsclbc0NFSGQGnEu45z+hiP25JpvEOVKg
Date: Wed, 6 Aug 2014 23:30:52 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6F5E93@DFLE08.ent.ti.com>
References: <1407365627-29059-1-git-send-email-denis@denix.org>
In-Reply-To: <1407365627-29059-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] packagegroups: conditionally disable dual-camera and image-gallery for Qt5 builds
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
X-List-Received-Date: Wed, 06 Aug 2014 23:30:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Wednesday, August 06, 2014 5:54 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 1/4] packagegroups: conditionally disable
> dual-camera and image-gallery for Qt5 builds
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb    | 5
> ++---
>  .../packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb    | 5
> ++---
>  .../packagegroups/packagegroup-arago-tisdk-multimedia.bb             | 5=
 ++---
>  3 files changed, 6 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-matrix.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> index ae502f1..109e1ad 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-matrix.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-ti
> +++ sdk-matrix.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to include Matrix v2"
>  LICENSE =3D "MIT"
> -PR =3D "r29"
> +PR =3D "r30"
>=20
>  inherit packagegroup
>=20
> @@ -77,8 +77,7 @@ MATRIX_APPS_append_ti43x =3D "        \
>      matrix-multimedia-demo-mpeg4aacdec \
>      matrix-multimedia-demo-mpeg4dec \
>                                      \
> -    matrix-gui-apps-dual-camera     \
> -    matrix-gui-apps-image-gallery   \
> +    ${@base_conditional('QT_PROVIDER', 'qt5', '',
> + 'matrix-gui-apps-dual-camera matrix-gui-apps-image-gallery', d)} \
>                                      \
>      matrix-gui-generic-pm           \
>      matrix-gui-pm-demos-suspend     \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
> index 307e712..40aa486 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-multimedia-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-ti
> +++ sdk-multimedia-sdk-host.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to add multimedia related sources into the SDK"
>  LICENSE =3D "MIT"
> -PR =3D "r4"
> +PR =3D "r5"
>=20
>  inherit packagegroup
>=20
> @@ -17,8 +17,7 @@ MULTIMEDIA_append_am3517-evm =3D " \  "
>=20
>  MULTIMEDIA_append_ti43x =3D " \
> -    dual-camera-demo-src \
> -    image-gallery-src \
> +    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo-src
> + image-gallery-src', d)} \
>  "
>=20
>  RDEPENDS_${PN} =3D "\
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> index 417b0a8..7016ec0 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-multimedia.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-ti
> +++ sdk-multimedia.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to add multimedia related packages"
>  LICENSE =3D "MIT"
> -PR =3D "r8"
> +PR =3D "r9"
>=20
>  inherit packagegroup
>=20
> @@ -18,8 +18,7 @@ MULTIMEDIA_append_ti33x =3D " \
>=20
>  MULTIMEDIA_append_ti43x =3D " \
>      amsdk-av-files \
> -    dual-camera-demo \
> -    image-gallery \
> +    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo
> + image-gallery', d)} \
>  "
>=20
>  MULTIMEDIA_append_omap-a15 =3D " \
> --
> 2.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

