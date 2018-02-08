Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 5FF145298F
	for <meta-arago@arago-project.org>;
	Thu,  8 Feb 2018 14:28:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w18ESCGt016370
	for <meta-arago@arago-project.org>; Thu, 8 Feb 2018 08:28:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1518100092;
	bh=O5uOdmrTn5HjAi/zmAHWDKxHiQHc/GDGgOPdFLRLnFw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=AcpXgnb1JjrI3TeLV+hz4Po1m4Y5repccFDcDQ3xkROpk+9dMDfVaVBmVeJeP7sGW
	Q76YijCg2mEfJ81nWosvXQfonirQcJIp2ToZOlV7V3DCu/+roLggIO6sBxIewf7M/B
	6hCNlDDUOPgbeYIUR2NyxjGpKH8YmXqc22vq1uaw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w18ESCxR025827
	for <meta-arago@arago-project.org>; Thu, 8 Feb 2018 08:28:12 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 8 Feb 2018 08:28:11 -0600
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
	DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
	15.01.1261.035; Thu, 8 Feb 2018 08:28:11 -0600
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [morty/master][PATCH 4/4] qt-tstat: pickup the
	latest version for both Qt4/Qt5 support
Thread-Index: AQHToDk2wadUP1L4J0iNAKez1o9cOaOakVwA
Date: Thu, 8 Feb 2018 14:28:11 +0000
Message-ID: <f761805633a4422c8d677e33eede19c7@ti.com>
References: <1517948150-41783-1-git-send-email-e-ruei1@ti.com>
	<1517948150-41783-5-git-send-email-e-ruei1@ti.com>
	<20180207172929.GB27609@edge>
In-Reply-To: <20180207172929.GB27609@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.103.39]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty/master][PATCH 4/4] qt-tstat: pickup the latest version for both Qt4/Qt5 support
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
X-List-Received-Date: Thu, 08 Feb 2018 14:28:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Denys:

Should I resubmit those patches in right order to rocko/master?

Best regards,

Eric


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Wednesday, February 07, 2018 12:29 PM
To: Ruei, Eric
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [morty/master][PATCH 4/4] qt-tstat: pickup the la=
test version for both Qt4/Qt5 support

This should be the first patch in the series, not last.

Also, morty is pretty much done.


On Tue, Feb 06, 2018 at 03:15:50PM -0500, Eric Ruei wrote:
> - update the git URL and SRCREV
> - select matrix desktop file based on QT vesion
> - add qt-tstat.sh to force the QT5 demo to run as eglfs full-screen=20
> app

Why is it eglfs-forced?


> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../thermostat-demo/qt-tstat/qt_tstat.sh            | 13 +++++++++++++
>  .../recipes-apps/thermostat-demo/qt-tstat_2.0.bb    | 21 +++++++++++----=
------
>  2 files changed, 24 insertions(+), 10 deletions(-)  create mode=20
> 100755=20
> meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat/qt_tstat.sh
>=20
> diff --git=20
> a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat/qt_tstat.sh=20
> b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat/qt_tstat.sh
> new file mode 100755
> index 0000000..01ca4f9
> --- /dev/null
> +++ b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat/qt_tstat
> +++ .sh
> @@ -0,0 +1,13 @@
> +#!/bin/bash
> +
> +/etc/init.d/weston stop
> +sleep 1
> +
> +echo 0 > /sys/class/graphics/fbcon/cursor_blink
> +
> +ThermostatDemo -platform eglfs
> +
> +echo 1 > /sys/class/graphics/fbcon/cursor_blink
> +
> +/etc/init.d/weston start
> +sleep 1
> diff --git=20
> a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb=20
> b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
> index 494d582..acb0720 100644
> --- a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
> +++ b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
> @@ -12,31 +12,32 @@ require recipes-core/matrix/matrix-gui-paths.inc
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
> +SRCREV =3D "db7959b200e0ecbe59ff1c867251b1a8b17bd567"
> =20
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
anch=3D${BRANCH} \
> +	   file://qt_tstat.sh"
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
> +	install ${WORKDIR}/qt_tstat.sh ${D}/usr/bin/qt_tstat.sh
>  	install -d ${D}${MATRIX_APP_DIR}/qt_tstat
> -	cp -rf ${S}/matrix-files/*  ${D}${MATRIX_APP_DIR}/qt_tstat
> +	install ${S}/matrix-files/desc_thermostat_demo.html  ${D}${MATRIX_APP_D=
IR}/qt_tstat
> +	install ${S}/matrix-files/${DESKTOP_FILE} =20
> +${D}${MATRIX_APP_DIR}/qt_tstat/thermostat_demo.desktop
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
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

