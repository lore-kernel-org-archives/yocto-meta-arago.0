Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 449CF52079
	for <meta-arago@arago-project.org>;
	Mon, 15 Dec 2014 21:43:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id sBFLhpWt015188;
	Mon, 15 Dec 2014 15:43:51 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBFLhpmD025299;
	Mon, 15 Dec 2014 15:43:51 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Mon, 15 Dec 2014 15:43:51 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/2] matrix-gui-browser: patch
	Makefile.build	to work with Qt5
Thread-Index: AQHQGK1ksl98S9czCUW+4m9FnM0ogJyRLwuw
Date: Mon, 15 Dec 2014 21:43:50 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7B6F0A@DFLE08.ent.ti.com>
References: <1418678579-22938-1-git-send-email-denis@denix.org>
	<1418678579-22938-2-git-send-email-denis@denix.org>
In-Reply-To: <1418678579-22938-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] matrix-gui-browser: patch Makefile.build	to work with Qt5
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
X-List-Received-Date: Mon, 15 Dec 2014 21:43:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, December 15, 2014 3:23 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 2/2] matrix-gui-browser: patch Makefile.buil=
d
> to work with Qt5
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
>  .../recipes-core/matrix/matrix-gui-browser_2.0.bb  |   10 +++++--
>  2 files changed, 39 insertions(+), 2 deletions(-)  create mode 100644 me=
ta-
> arago-extras/recipes-core/matrix/matrix-gui-browser/0001-Makefile.build-
> with-Qt5-use-qmake-available-in-PATH.patch
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
> browser/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch
> b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/0001-
> Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch
> new file mode 100644
> index 0000000..42cfc23
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/0001-
> Make
> +++ file.build-with-Qt5-use-qmake-available-in-PATH.patch
> @@ -0,0 +1,31 @@
> +From 155da553d7a5d4d84babb94fb0ecac073680c1cd Mon Sep 17 00:00:00
> 2001
> +From: Denys Dmytriyenko <denys@ti.com>
> +Date: Mon, 15 Dec 2014 15:51:59 -0500
> +Subject: [PATCH] Makefile.build: with Qt5 use qmake available in PATH
> +
> +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> +---
> + Makefile.build |    4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile.build b/Makefile.build index 192c6f6..79b55f5
> +100644
> +--- a/Makefile.build
> ++++ b/Makefile.build
> +@@ -8,11 +8,11 @@ all: release
> + .PHONY: qmake
> + qmake : matrix_browser.pro
> + 	@. ${ENV_SETUP}; \
> +-	qmake2 CONFIG+=3Drelease matrix_browser.pro
> ++	qmake CONFIG+=3Drelease matrix_browser.pro
> +
> + qmake_debug : matrix_browser.pro
> + 	@. ${ENV_SETUP}; \
> +-	qmake2 CONFIG+=3Ddebug matrix_browser.pro
> ++	qmake CONFIG+=3Ddebug matrix_browser.pro
> +
> + debug : qmake_debug
> + 	@. ${ENV_SETUP}; \
> +--
> +1.7.9.5
> +
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
> browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-
> browser_2.0.bb
> index afd5aa3..cc73456 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> @@ -11,14 +11,20 @@ RDEPENDS_${PN} +=3D "${QT_RDEPENDS_FONTS}"
>=20
>  DEPENDS +=3D "${QT_DEPENDS_WEBKIT}"
>=20
> -PR =3D "r7"
> +PR =3D "r8"
>=20
>  SRCREV =3D "7f5dccfb5b1b68a3f9162f6ee072eef0e0ba06fe"
>  BRANCH ?=3D "master"
>=20
>  SRC_URI =3D "git://gitorious.org/matrix-gui-
> v2/matrix_browser.git;protocol=3Dgit;branch=3D${BRANCH}"
>=20
> -SRC_URI +=3D "${@base_conditional('QT_PROVIDER', 'qt5', 'file://qt5-
> webkit.patch file://qt5-gui-widgets-move.patch', '', d)}"
> +QT5_DIFF =3D " \
> +	file://qt5-webkit.patch \
> +	file://qt5-gui-widgets-move.patch \
> +	file://0001-Makefile.build-with-Qt5-use-qmake-available-in-
> PATH.patch
> +\ "
> +
> +SRC_URI +=3D "${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_DIFF}", '=
',
> d)}"
>=20
>  S =3D "${WORKDIR}/git"
>=20
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

