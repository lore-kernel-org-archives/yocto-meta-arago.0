Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 83EB852A51
	for <meta-arago@arago-project.org>;
	Wed,  6 Aug 2014 23:30:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s76NUDtq012201;
	Wed, 6 Aug 2014 18:30:13 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s76NUDsH002283;
	Wed, 6 Aug 2014 18:30:13 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Wed, 6 Aug 2014 18:30:13 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/4] qtbase: add additional dependencies
	for GLES check on omap-a15 platforms
Thread-Index: AQHPsclcsYMMi1XWlUO6wMckPRhSG5vEOF9Q
Date: Wed, 6 Aug 2014 23:30:12 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6F5E80@DFLE08.ent.ti.com>
References: <1407365627-29059-1-git-send-email-denis@denix.org>
	<1407365627-29059-2-git-send-email-denis@denix.org>
In-Reply-To: <1407365627-29059-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] qtbase: add additional dependencies for GLES check on omap-a15 platforms
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
X-List-Received-Date: Wed, 06 Aug 2014 23:30:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

If the graphics SDK provides libdrm and libwayland libraries why isn't the =
dependency on virtual/libgles2 and  virtual/egl enough? I see that omap5-sg=
x-ddk-um-linux already provides libgles2 and egl.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Wednesday, August 06, 2014 5:54 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 2/4] qtbase: add additional dependencies for
> GLES check on omap-a15 platforms
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> GLES libraries for omap-a15 platforms come in binary form and are pre-bui=
lt
> against libdrm and libwayland libraries. When qtbase tries to do a check =
for
> GLES support, it fails to link the test app, when libdrm and libwayland a=
re not
> yet available in sysroots:
>=20
> | OpenGL ES 2.x auto-detection... ()
> | ...-g++ ... -o opengles2.o
> | .../qtbase-opensource-src-5.2.1/config.tests/unix/opengles2/opengles2.
> | cpp ...-g++ ... -o opengles2 opengles2.o -lsrv_um -lGLESv2
> | .../bin/ld: warning: libdrm.so.2, needed by .../usr/lib/libsrv_um.so,
> | not found (try using -rpath or -rpath-link)
> | .../bin/ld: warning: libwayland-server.so.0, needed by
> | .../usr/lib/libIMGegl.so, not found (try using -rpath or -rpath-link)
> | .../bin/ld: warning: libdrm_omap.so.1, needed by
> | .../usr/lib/libIMGegl.so, not found (try using -rpath or -rpath-link) .=
..
> | collect2: error: ld returned 1 exit status
> | Makefile:103: recipe for target 'opengles2' failed
> | make: *** [opengles2] Error 1
> | OpenGL ES 2.x disabled.
> | The OpenGL ES 2.0 functionality test failed!
>=20
> Add libdrm and wayland as extra dependencies for qtbase when building on
> omap-a15 with gles flag enabled.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-
> qt/qt5/qtbase_5.2.1.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend b/met=
a-
> arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
> new file mode 100644
> index 0000000..c879313
> --- /dev/null
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
> @@ -0,0 +1,6 @@
> +GLES_EXTRA_DEPS =3D ""
> +GLES_EXTRA_DEPS_omap-a15 =3D "libdrm wayland"
> +
> +PACKAGECONFIG[gles2] =3D "-opengl es2 -eglfs,,virtual/libgles2 virtual/e=
gl
> ${GLES_EXTRA_DEPS}"
> +
> +PR_append =3D "-arago0"
> --
> 2.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

