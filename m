Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id AA3A5529DD
	for <meta-arago@arago-project.org>;
	Tue,  3 Jun 2014 14:33:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s53EX9YX007053;
	Tue, 3 Jun 2014 09:33:09 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s53EX96q002535;
	Tue, 3 Jun 2014 09:33:09 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Tue, 3 Jun 2014 09:33:09 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/5] qt-tstat: fix install with Qt5,
	broken by latest change
Thread-Index: AQHPftPI44c9HK+oiEef42LCozi+5Jtfc8Nw
Date: Tue, 3 Jun 2014 14:33:09 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6C226B@DFLE08.ent.ti.com>
References: <1401762581-31370-1-git-send-email-denis@denix.org>
	<1401762581-31370-2-git-send-email-denis@denix.org>
In-Reply-To: <1401762581-31370-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] qt-tstat: fix install with Qt5, broken by latest change
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
X-List-Received-Date: Tue, 03 Jun 2014 14:33:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, June 02, 2014 9:30 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 1/5] qt-tstat: fix install with Qt5, broken =
by
> latest change
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Last change broke Qt5 install, which uses B!=3DS unlike Qt4.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb b/meta-
> arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> index d0a9f7a..1b15f2f 100644
> --- a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> +++ b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> @@ -12,7 +12,7 @@ require recipes-core/matrix/matrix-gui-paths.inc
>=20
>  inherit qt-provider
>=20
> -PR =3D "r7"
> +PR =3D "r8"
>=20
>  DEPENDS +=3D "${QT_DEPENDS_SVG} ${QT_DEPENDS_SCRIPT}"
>=20
> @@ -28,13 +28,11 @@ SRC_URI +=3D "${@base_conditional('QT_PROVIDER',
> 'qt5', 'file://0002-Replace-QtGui
>=20
>  S =3D "${WORKDIR}/git/"
>=20
> -BUILDDIR ?=3D "."
> -
>  do_install() {
>  	install -d ${D}/usr/bin
> -	install -m 0755 ${BUILDDIR}/ThermostatDemo
> ${D}/usr/bin/ThermostatDemo
> +	install -m 0755 ${B}/ThermostatDemo ${D}/usr/bin/ThermostatDemo
>  	install -d ${D}${MATRIX_APP_DIR}/qt_tstat
> -	cp -rf matrix-files/*  ${D}${MATRIX_APP_DIR}/qt_tstat
> +	cp -rf ${S}/matrix-files/*  ${D}${MATRIX_APP_DIR}/qt_tstat
>  }
>=20
>  PACKAGES +=3D "matrix-gui-thermostat-demo"
> --
> 1.9.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

