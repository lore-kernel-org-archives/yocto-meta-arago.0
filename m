Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0A12452974
	for <meta-arago@arago-project.org>;
	Thu,  3 Jan 2013 20:49:18 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r03KnFjc015039;
	Thu, 3 Jan 2013 14:49:15 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r03KnFmr023294;
	Thu, 3 Jan 2013 14:49:15 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Thu, 3 Jan 2013 14:49:15 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH] qt4-embedded-gles: Correct linux.conf
Thread-Index: AQHNwSX7bPEYhJWKbEG/xo/zQqV8oJg4ZP1g
Date: Thu, 3 Jan 2013 20:49:14 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3599A4@DFLE09.ent.ti.com>
References: <1352759707-5369-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1352759707-5369-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] qt4-embedded-gles: Correct linux.conf
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
X-List-Received-Date: Thu, 03 Jan 2013 20:49:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

> -----Original Message-----
> From: Franklin S. Cooper Jr [mailto:fcooperjr27@gmail.com]
> Sent: Monday, November 12, 2012 4:35 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [PATCH] qt4-embedded-gles: Correct linux.conf
>=20
> * Remove ${STAGING_INCDIR} and ${STAGING_LIBDIR} from linux.conf. These
>   variables were improperly set in the first place and caused build issue=
s
>   when building quick-playground.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-qt/qt4/qt4-embedded-gles/linux.conf    |   23 +++++++++++---=
-----
>  .../recipes-qt/qt4/qt4-embedded-gles_4.8.0.bb      |    2 +-
>  2 files changed, 14 insertions(+), 11 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles/linux.con=
f
> b/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles/linux.conf
> index 7a96715..b26b7ea 100644
> --- a/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles/linux.conf
> +++ b/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles/linux.conf
> @@ -11,16 +11,19 @@ QMAKE_INCDIR_X11      =3D
>  QMAKE_LIBDIR_X11      =3D
>  QMAKE_INCDIR_QT       =3D $(OE_QMAKE_INCDIR_QT)
>  QMAKE_LIBDIR_QT       =3D $(OE_QMAKE_LIBDIR_QT)
> -QMAKE_INCDIR_OPENGL   =3D ${STAGING_INCDIR}/GLES
> -QMAKE_LIBDIR_OPENGL   =3D ${STAGING_LIBDIR}
> -QMAKE_INCDIR_OPENGL_ES1 =3D ${STAGING_INCDIR}/GLES
> -QMAKE_LIBDIR_OPENGL_ES1 =3D ${STAGING_LIBDIR}
> -QMAKE_INCDIR_OPENGL_ES2 =3D ${STAGING_INCDIR}/GLES2
> -QMAKE_LIBDIR_OPENGL_ES2 =3D ${STAGING_LIBDIR}
> -QMAKE_INCDIR_EGL      =3D ${STAGING_INCDIR}/GLES2
> -QMAKE_LIBDIR_EGL      =3D ${STAGING_LIBDIR}
> +QMAKE_INCDIR_OPENGL   =3D
> +QMAKE_LIBDIR_OPENGL   =3D
> +QMAKE_INCDIR_OPENGL_ES1 =3D $$QMAKE_INCDIR_OPENGL
> +QMAKE_LIBDIR_OPENGL_ES1 =3D $$QMAKE_LIBDIR_OPENGL
> +QMAKE_INCDIR_OPENGL_ES2 =3D $$QMAKE_INCDIR_OPENGL
> +QMAKE_LIBDIR_OPENGL_ES2 =3D $$QMAKE_LIBDIR_OPENGL
> +QMAKE_INCDIR_EGL      =3D
> +QMAKE_LIBDIR_EGL      =3D
> +QMAKE_INCDIR_OPENVG   =3D
> +QMAKE_LIBDIR_OPENVG   =3D
>=20
> -QMAKE_LIBS            =3D -Wl,-rpath-link,SEDME/lib -lglib-2.0
> +
> +QMAKE_LIBS            =3D
>  QMAKE_LIBS_DYNLOAD    =3D -ldl
>  QMAKE_LIBS_X11        =3D $(OE_QMAKE_LIBS_X11)
>  QMAKE_LIBS_X11SM      =3D $(OE_QMAKE_LIBS_X11SM)
> @@ -40,7 +43,7 @@ QMAKE_QDBUSCPP2XML    =3D
> $(OE_QMAKE_QDBUSCPP2XML)
>  QMAKE_QDBUSXML2CPP    =3D $(OE_QMAKE_QDBUSXML2CPP)
>=20
>  QMAKE_AR              =3D $(OE_QMAKE_AR) cqs
> -QMAKE_OBJCOPY         =3D ${OBJCOPY}
> +QMAKE_OBJCOPY         =3D objcopy
>  QMAKE_RANLIB          =3D
>=20
>  QMAKE_TAR             =3D tar -cf
> diff --git a/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.0.bb
> b/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.0.bb
> index c26cc2c..be8f12f 100644
> --- a/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.0.bb
> +++ b/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.0.bb
> @@ -1,7 +1,7 @@
>  require ${COREBASE}/meta/recipes-qt/qt4/qt-${PV}.inc
>  require ${COREBASE}/meta/recipes-qt/qt4/qt4-embedded.inc
>=20
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
>=20
>  FILESEXTRAPATHS_append :=3D "${THISDIR}/${PN}:${COREBASE}/meta/recipes-
> qt/qt4/qt-4.8.0:${COREBASE}/meta/recipes-qt/qt4/files:"
>=20
> --
> 1.7.0.4


