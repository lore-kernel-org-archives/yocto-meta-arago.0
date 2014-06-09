Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2367152A88
	for <meta-arago@arago-project.org>;
	Mon,  9 Jun 2014 17:02:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s59H22ER013701
	for <meta-arago@arago-project.org>; Mon, 9 Jun 2014 12:02:02 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s59H22OI002636
	for <meta-arago@arago-project.org>; Mon, 9 Jun 2014 12:02:02 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Mon, 9 Jun 2014 12:02:01 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH 02/11] qt example apps: Use Makefile.build instead of
	Makefile for the SDK makefile
Thread-Index: AQHPe20ra4UM+503F06cukx/tPeDyZtpEiIg
Date: Mon, 9 Jun 2014 17:02:00 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6C84E2@DFLE08.ent.ti.com>
References: <1401388695-30526-1-git-send-email-fcooper@ti.com>
	<1401388695-30526-2-git-send-email-fcooper@ti.com>
In-Reply-To: <1401388695-30526-2-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 02/11] qt example apps: Use Makefile.build instead of Makefile for the SDK makefile
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
X-List-Received-Date: Mon, 09 Jun 2014 17:02:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Will do

> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Thursday, May 29, 2014 1:38 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [PATCH 02/11] qt example apps: Use Makefile.build instead of
> Makefile for the SDK makefile
>=20
> * This insures that Qt users will have qmake generate "Makefile" instead =
of
>   App-Makefile which is the expected/default behavior.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-core/matrix/matrix-gui-browser_2.0.bb  |    4 ++--
>  .../recipes-core/matrix/refresh-screen_2.0.bb      |    4 ++--
>  .../recipes-qt/qt-apps/qt-tstat_2.0.bb             |    4 ++--
>  .../recipes-qt/qt-apps/quick-playground_1.0.bb     |    4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0=
.bb
> b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> index 7d47e5b..afd5aa3 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> @@ -11,9 +11,9 @@ RDEPENDS_${PN} +=3D "${QT_RDEPENDS_FONTS}"
>=20
>  DEPENDS +=3D "${QT_DEPENDS_WEBKIT}"
>=20
> -PR =3D "r6"
> +PR =3D "r7"
>=20
> -SRCREV =3D "8517ac2338295ccb4c6c2ffa58b5ad48659a5430"
> +SRCREV =3D "7f5dccfb5b1b68a3f9162f6ee072eef0e0ba06fe"
>  BRANCH ?=3D "master"
>=20
>  SRC_URI =3D "git://gitorious.org/matrix-gui-
> v2/matrix_browser.git;protocol=3Dgit;branch=3D${BRANCH}"
> diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> index 2696978..e3d59e2 100644
> --- a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> @@ -7,9 +7,9 @@ SECTION =3D "multimedia"
>  # Make sure that QT font libraries have been installed  RDEPENDS_${PN} +=
=3D
> "qt4-embedded-fonts"
>=20
> -PR =3D "r4"
> +PR =3D "r5"
>=20
> -SRCREV =3D "4dfdf85f17033f950e01f25341665f979edde6c3"
> +SRCREV =3D "ad3835b250c8b2b55ae65ffa19c2b85e412826b0"
>  BRANCH ?=3D "master"
>=20
>  SRC_URI =3D "git://gitorious.org/matrix-gui-v2/refresh-
> screen.git;protocol=3Dgit;branch=3D${BRANCH}"
> diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb b/meta-
> arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> index d0a9f7a..0e3fc01 100644
> --- a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> +++ b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> @@ -12,12 +12,12 @@ require recipes-core/matrix/matrix-gui-paths.inc
>=20
>  inherit qt-provider
>=20
> -PR =3D "r7"
> +PR =3D "r8"
>=20
>  DEPENDS +=3D "${QT_DEPENDS_SVG} ${QT_DEPENDS_SCRIPT}"
>=20
>  BRANCH ?=3D "master"
> -SRCREV =3D "2960431fd38239cc089c8738776f3ff9dcfe7f1c"
> +SRCREV =3D "2512773c2d9da989e6a42c1e90b2b34496713072"
>=20
>  SRC_URI =3D " \
>  	git://gitorious.org/thermostat-demo/thermostat-
> demo.git;protocol=3Dgit \ diff --git a/meta-arago-extras/recipes-qt/qt-
> apps/quick-playground_1.0.bb b/meta-arago-extras/recipes-qt/qt-apps/quick=
-
> playground_1.0.bb
> index 5f493d3..2da5a36 100644
> --- a/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb
> +++ b/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb
> @@ -6,10 +6,10 @@ LIC_FILES_CHKSUM =3D
> "file://Licence.txt;md5=3D7cc88160b55ec5db6c6c5bb8e3238c0b"
>=20
>  require recipes-core/matrix/matrix-gui-paths.inc
>=20
> -PR =3D "r1"
> +PR =3D "r2"
>=20
>  BRANCH =3D "master"
> -SRCREV =3D "0be45ce805147798c98b2dee65e41de67bfcea5d"
> +SRCREV =3D "4bcf4e7f5aa68dcd28f54bf921c6cc3985ce4305"
>=20
>  SRC_URI =3D "git://arago-project.org/git/projects/qt4-
> demos.git;protocol=3Dgit;branch=3D${BRANCH}"
>=20
> --
> 1.7.0.4


