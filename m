Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 182B652079
	for <meta-arago@arago-project.org>;
	Mon, 15 Dec 2014 21:43:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id sBFLhg8C003227;
	Mon, 15 Dec 2014 15:43:42 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBFLhgsX025251;
	Mon, 15 Dec 2014 15:43:42 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Mon, 15 Dec 2014 15:43:42 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/2] refresh-screen: patch Makefile.build
	to	work with Qt5
Thread-Index: AQHQGK1d6iK4lKdxP0GsO0aoQP1/eJyRLsxg
Date: Mon, 15 Dec 2014 21:43:41 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7B6F00@DFLE08.ent.ti.com>
References: <1418678579-22938-1-git-send-email-denis@denix.org>
In-Reply-To: <1418678579-22938-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] refresh-screen: patch Makefile.build to	work with Qt5
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
X-List-Received-Date: Mon, 15 Dec 2014 21:43:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I was simply going to do a sed replace instead of creating a new makefile b=
ut either way is fine.

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, December 15, 2014 3:23 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 1/2] refresh-screen: patch Makefile.build to
> work with Qt5
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Makefile.build is only used when building from within SDK through a top-l=
evel
> SDK Makefile.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  ...uild-with-Qt5-use-qmake-available-in-PATH.patch |   31
> ++++++++++++++++++++
>  .../recipes-core/matrix/refresh-screen_2.0.bb      |    3 +-
>  2 files changed, 33 insertions(+), 1 deletion(-)  create mode 100644 met=
a-
> arago-extras/recipes-core/matrix/refresh-screen/0001-Makefile.build-with-
> Qt5-use-qmake-available-in-PATH.patch
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-
> Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch b/meta-arago-
> extras/recipes-core/matrix/refresh-screen/0001-Makefile.build-with-Qt5-
> use-qmake-available-in-PATH.patch
> new file mode 100644
> index 0000000..726b9ea
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-Makefile
> +++ .build-with-Qt5-use-qmake-available-in-PATH.patch
> @@ -0,0 +1,31 @@
> +From 394eacf80efaacc719e69179c7c709016d21b707 Mon Sep 17 00:00:00
> 2001
> +From: Denys Dmytriyenko <denys@ti.com>
> +Date: Mon, 15 Dec 2014 15:46:08 -0500
> +Subject: [PATCH] Makefile.build: with Qt5 use qmake available in PATH
> +
> +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> +---
> + Makefile.build |    4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile.build b/Makefile.build index a0ceaad..e6cb010
> +100644
> +--- a/Makefile.build
> ++++ b/Makefile.build
> +@@ -8,11 +8,11 @@ all: release
> + .PHONY: qmake
> + qmake : refresh_screen.pro
> + 	@. ${ENV_SETUP}; \
> +-	qmake2 CONFIG+=3Drelease refresh_screen.pro
> ++	qmake CONFIG+=3Drelease refresh_screen.pro
> +
> + qmake_debug : refresh_screen.pro
> + 	@. ${ENV_SETUP}; \
> +-	qmake2 CONFIG+=3Ddebug refresh_screen.pro
> ++	qmake CONFIG+=3Ddebug refresh_screen.pro
> +
> + debug : qmake_debug
> + 	@. ${ENV_SETUP}; \
> +--
> +1.7.9.5
> +
> diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> index 50d95fc..6c2c72e 100644
> --- a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> @@ -9,7 +9,7 @@ inherit qt-provider
>  # Make sure that QT font libraries have been installed  RDEPENDS_${PN} +=
=3D
> "${QT_RDEPENDS_FONTS}"
>=20
> -PR =3D "r6"
> +PR =3D "r7"
>=20
>  SRCREV =3D "ad3835b250c8b2b55ae65ffa19c2b85e412826b0"
>  BRANCH ?=3D "master"
> @@ -19,6 +19,7 @@ SRC_URI =3D "git://gitorious.org/matrix-gui-v2/refresh-
> screen.git;protocol=3Dgit;bra
>  QT5_DIFF =3D " \
>  file://0001-refresh-screen.pro-add-widgets-module-to-the-project.patch \
> file://0002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch \
> +file://0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch \
>  "
>=20
>  SRC_URI +=3D "${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_DIFF}", '=
',
> d)}"
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

