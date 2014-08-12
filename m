Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5EB9E52976
	for <meta-arago@arago-project.org>;
	Tue, 12 Aug 2014 23:00:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7CN08MG028056
	for <meta-arago@arago-project.org>; Tue, 12 Aug 2014 18:00:08 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7CN08GK017288
	for <meta-arago@arago-project.org>; Tue, 12 Aug 2014 18:00:08 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Tue, 12 Aug 2014 18:00:08 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH] qtbase: Add touchscreen support and set wayland as the
	default display plugin
Thread-Index: AQHPtoDs0LdUueGv9kKzBlhorjCdDpvNlSag
Date: Tue, 12 Aug 2014 23:00:07 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6FA29A@DFLE08.ent.ti.com>
References: <1407884299-15652-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1407884299-15652-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] qtbase: Add touchscreen support and set wayland as the default display plugin
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
X-List-Received-Date: Tue, 12 Aug 2014 23:00:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Wait ignore this. I forgot about the new suggested approach for package con=
figs

> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Tuesday, August 12, 2014 5:58 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [PATCH] qtbase: Add touchscreen support and set wayland as the
> default display plugin
>=20
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
>=20
> * Enable touchscreen
> * Set wayland as the default display plugin for Qt apps.
> * Its already the default now used by Arago but this eliminates the need =
to
> pass
>   additional arguments for all the different Qt applications.
> ---
>  .../recipes-qt/qt5/qtbase_5.2.1.bbappend           |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
> b/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
> index c879313..5fb65bb 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
> @@ -3,4 +3,8 @@ GLES_EXTRA_DEPS_omap-a15 =3D "libdrm wayland"
>=20
>  PACKAGECONFIG[gles2] =3D "-opengl es2 -eglfs,,virtual/libgles2 virtual/e=
gl
> ${GLES_EXTRA_DEPS}"
>=20
> -PR_append =3D "-arago0"
> +PR_append =3D "-arago1"
> +
> +QT_CONFIG_FLAGS +=3D "-qpa wayland"
> +
> +PACKAGECONFIG +=3D "tslib"
> --
> 1.7.9.5


