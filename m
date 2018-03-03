Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id EDF47529EE
	for <meta-arago@arago-project.org>;
	Sat,  3 Mar 2018 19:27:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w23JQem6020451
	for <meta-arago@arago-project.org>; Sat, 3 Mar 2018 13:26:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520105200;
	bh=LJSjr5oHZF/WBXCxXxHeItQGsfXmgeGPHJtlGDxZrs8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=BzLR4Z0jvRe3cL5wxKs1nro0818Keb3iRYKP2tPzugGZOV4+rOUdThjEBlHaTDdBZ
	GUL8jVdbNR1eMZ/M6TtfBfgXyMHz4vmWt9g4sk6aFg0+AWHo/Ovc19+qKGcCkHFSIH
	rJ0euryReuUVXKRh3LlNM7Ve7rz1PzBbVtWGuRO8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w23JQeaD031129
	for <meta-arago@arago-project.org>; Sat, 3 Mar 2018 13:26:40 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Sat, 3 Mar 2018 13:26:39 -0600
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
	DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
	15.01.1261.035; Sat, 3 Mar 2018 13:26:39 -0600
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [morty/rocko/master][PATCH v3 1/4] qt-tstat: pickup
	the latest version for both Qt4/Qt5 support
Thread-Index: AQHTsqI0r65k9OYKikaOUw/cIVzUL6O+5XcQ
Date: Sat, 3 Mar 2018 19:26:39 +0000
Message-ID: <082327bff9c545ec988b36e0b0f52f7f@ti.com>
References: <1519843260-55405-1-git-send-email-e-ruei1@ti.com>
	<1519843260-55405-2-git-send-email-e-ruei1@ti.com>
	<20180303034625.GA26586@edge>
In-Reply-To: <20180303034625.GA26586@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.103.39]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty/rocko/master][PATCH v3 1/4] qt-tstat: pickup the latest version for both Qt4/Qt5 support
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
X-List-Received-Date: Sat, 03 Mar 2018 19:27:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys:

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, March 02, 2018 10:46 PM
To: Ruei, Eric
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [morty/rocko/master][PATCH v3 1/4] qt-tstat: pick=
up the latest version for both Qt4/Qt5 support

On Wed, Feb 28, 2018 at 01:40:57PM -0500, Eric Ruei wrote:
> - update the git URL and SRCREV
> - select matrix desktop file based on QT vesion
>=20
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../recipes-apps/thermostat-demo/qt-tstat_2.0.bb      | 19 +++++++++----=
------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.=
bb b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
> index 494d582..43e35ab 100644
> --- a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
> +++ b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
> @@ -12,31 +12,30 @@ require recipes-core/matrix/matrix-gui-paths.inc
> =20
>  inherit qt-provider
> =20
> -PR =3D "r9"
> +PR =3D "r10"
> =20
>  DEPENDS +=3D "${QT_DEPENDS_SVG} ${QT_DEPENDS_SCRIPT}"
> =20
>  BRANCH ?=3D "master"
> -SRCREV =3D "2512773c2d9da989e6a42c1e90b2b34496713072"
> +SRCREV =3D "3429dfc4333f11b9022e3aa6fd2850c5093777f9"

^^^^^^^^^^^^^^^^^^^^^^^^^^^
Where is this commit ID?

It is a typo and it should be 665bff9a7bc0dbf82f9d6a58ff2778c03fe04fd1.
I shall verify and submit patch-v4 shortly.

Eric



> -SRC_URI =3D " \
> -	git://gitorious.org/thermostat-demo/thermostat-demo.git;protocol=3Dgit =
\
> -"
> -
> -SRC_URI +=3D "${@base_conditional('QT_PROVIDER', 'qt5', 'file://0002-Rep=
lace-QtGui-with-QtWidgets-per-Qt5-migration-guide.patch \
> -	file://0003-Replace-fromAscii-toAscii-with-fromLatin1-toLatin1-p.patch'=
, '', d)}"
> +SRC_URI =3D "git://git.ti.com/apps/thermostat-demo.git;protocol=3Dgit;br=
anch=3D${BRANCH}"
> =20
>  S =3D "${WORKDIR}/git/"
> =20
> +DESKTOP_FILE =3D "${@base_conditional('QT_PROVIDER', 'qt5', 'thermostat_=
demo_qt5.desktop', 'thermostat_demo.desktop', d)}"
> +
> +
>  do_install() {
>  	install -d ${D}/usr/bin
>  	install -m 0755 ${B}/ThermostatDemo ${D}/usr/bin/ThermostatDemo
>  	install -d ${D}${MATRIX_APP_DIR}/qt_tstat
> -	cp -rf ${S}/matrix-files/*  ${D}${MATRIX_APP_DIR}/qt_tstat
> +	install ${S}/matrix-files/desc_thermostat_demo.html  ${D}${MATRIX_APP_D=
IR}/qt_tstat
> +	install ${S}/matrix-files/${DESKTOP_FILE}  ${D}${MATRIX_APP_DIR}/qt_tst=
at/thermostat_demo.desktop
>  }
> =20
>  PACKAGES +=3D "matrix-gui-thermostat-demo"
> =20
> -RDEPENDS_matrix-gui-thermostat-demo +=3D "matrix-gui-apps-images matrix-=
gui-submenus-qt4"
> +RDEPENDS_matrix-gui-thermostat-demo +=3D "matrix-gui-apps-images ${@base=
_conditional('QT_PROVIDER', 'qt5', 'matrix-gui-submenus-qt5', 'matrix-gui-s=
ubmenus-qt4', d)}"
> =20
>  FILES_matrix-gui-thermostat-demo +=3D "${MATRIX_APP_DIR}/*"
> --=20
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

