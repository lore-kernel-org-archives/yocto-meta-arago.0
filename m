Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5F9BB52A78
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 13:58:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CDwdKK020260
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 08:58:39 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CDwc7L008716
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 08:58:38 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Thu, 12 Mar 2015 08:58:38 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 2/4] qtbase: Use DISTRO_FEATURES to set
	appropriate qpa.
Thread-Index: AQHQXMPlD3bSFzRS9ka5QXcnNEd2gZ0ZMs0A//+sy7A=
Date: Thu, 12 Mar 2015 13:58:38 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95814107DC6@DFLE09.ent.ti.com>
References: <1426164957-22030-1-git-send-email-j-stiffler@ti.com>
	<1426164957-22030-3-git-send-email-j-stiffler@ti.com>
	<20150312135554.GB24885@edge>
In-Reply-To: <20150312135554.GB24885@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/4] qtbase: Use DISTRO_FEATURES to set appropriate qpa.
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
X-List-Received-Date: Thu, 12 Mar 2015 13:58:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm not sure of the history, it just seemed more complete to only depend on=
 wayland if wayland is a feature.


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, March 12, 2015 9:56 AM
To: Stiffler, Jacob
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH 2/4] qtbase: Use DISTRO_FEATURES to set ap=
propriate qpa.

On Thu, Mar 12, 2015 at 08:55:55AM -0400, Jacob Stiffler wrote:
> * If wayland is in DISTRO_FEATURES, then configure '-qpa wayland'
> * Otherwise configure '-qpa eglfs'
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh  |    1 -
>  .../recipes-qt/qt5/qtbase_5.4.1.bbappend           |    9 ++++++---
>  2 files changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh=20
> b/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh
> index 1e8c196..f888d50 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh
> @@ -2,4 +2,3 @@
> =20
>  ### QT Environment Variables ###
>  export QT_QPA_GENERIC_PLUGINS=3DAuto
> -export QT_QPA_PLATFORM=3Dwayland
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend=20
> b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
> index a466581..5a00800 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
> @@ -1,13 +1,16 @@
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> =20
>  GLES_EXTRA_DEPS =3D ""
> -GLES_EXTRA_DEPS_omap-a15 =3D "libdrm wayland"
> +GLES_EXTRA_DEPS_omap-a15 =3D " \
> +    libdrm \
> +    ${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}=20
> +\ "

I meant to comment to the previous revision about this part above ^^^ I don=
't think it will work (not that it will be tested) - the way OMAP5 GFX is b=
uilt, it has hardcoded dependency on wayland libs, hence it's added above..=
.
That said, I'm not sure you can get eglfs on OMAP5 platforms working cleanl=
y w/o any wayland libs. But aren't you only doing it for AM3/4 anyway?


>  PACKAGECONFIG[gles2] =3D "-opengl es2 -eglfs,,virtual/libgles2 virtual/e=
gl ${GLES_EXTRA_DEPS}"
> =20
> -PR_append =3D "-arago3"
> +PR_append =3D "-arago4"
> =20
> -QT_CONFIG_FLAGS +=3D "-qpa wayland"
> +QT_CONFIG_FLAGS +=3D "-qpa ${@base_contains('DISTRO_FEATURES', 'wayland'=
, 'wayland', 'eglfs', d)}"
> =20
>  SRC_URI +=3D "file://qt_env.sh"
> =20
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

