Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7AA9F52A3F
	for <meta-arago@arago-project.org>;
	Fri, 27 Feb 2015 16:38:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1RGceZw024659
	for <meta-arago@arago-project.org>; Fri, 27 Feb 2015 10:38:40 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1RGcdNG021098
	for <meta-arago@arago-project.org>; Fri, 27 Feb 2015 10:38:39 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Fri, 27 Feb 2015 10:38:38 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] image-gallery: Fix installation of matrix
	files.
Thread-Index: AQHQUpssLCCBYFZuWkyd4aZJngZ3yZ0EslYg
Date: Fri, 27 Feb 2015 16:38:37 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C830141@DFLE08.ent.ti.com>
References: <1425047950-12638-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1425047950-12638-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] image-gallery: Fix installation of matrix	files.
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
X-List-Received-Date: Fri, 27 Feb 2015 16:38:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> Sent: Friday, February 27, 2015 8:39 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] image-gallery: Fix installation of matrix f=
iles.
>=20
> * matrix-files directory is not present in the build directory,
>   so prefix with ${S}.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../recipes-qt/qt-apps/image-gallery_git.bb        |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb
> b/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb
> index 6514df4..72c9389 100644
> --- a/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb
> +++ b/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb
> @@ -8,7 +8,7 @@ require recipes-core/matrix/matrix-gui-paths.inc
>=20
>  inherit qt-provider
>=20
> -PR =3D "r1"
> +PR =3D "r2"
>=20
>  BRANCH =3D "master"
>  SRCREV =3D "1f89d5e6c160e87e73a9c06933e50c3981bbf41d"
> @@ -21,7 +21,7 @@ do_install() {
>  	install -d ${D}/${bindir}
>  	install -m 0755 ${B}/image-gallery ${D}/${bindir}/image-gallery
>  	install -d ${D}${MATRIX_APP_DIR}/qt-image-gallery
> -	cp -rf matrix-files/*  ${D}${MATRIX_APP_DIR}/qt-image-gallery
> +	cp -rf ${S}/matrix-files/*  ${D}${MATRIX_APP_DIR}/qt-image-gallery
>  }
>=20
>  PACKAGES +=3D "matrix-gui-apps-image-gallery"
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

