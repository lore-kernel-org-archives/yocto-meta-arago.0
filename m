Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id BC9B952A51
	for <meta-arago@arago-project.org>;
	Wed,  6 Aug 2014 23:26:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s76NQiDv029677;
	Wed, 6 Aug 2014 18:26:44 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s76NQimr031901;
	Wed, 6 Aug 2014 18:26:44 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Wed, 6 Aug 2014 18:26:44 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 4/4] arago.conf: cleanup and document
	additional package configuration
Thread-Index: AQHPsclbgzj36mb410ycmu0qzqzBVZvEOCzA
Date: Wed, 6 Aug 2014 23:26:43 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6F5E38@DFLE08.ent.ti.com>
References: <1407365627-29059-1-git-send-email-denis@denix.org>
	<1407365627-29059-4-git-send-email-denis@denix.org>
In-Reply-To: <1407365627-29059-4-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] arago.conf: cleanup and document additional package configuration
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
X-List-Received-Date: Wed, 06 Aug 2014 23:26:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Wednesday, August 06, 2014 5:54 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 4/4] arago.conf: cleanup and document
> additional package configuration
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-
> distro/conf/distro/arago.conf
> index 4927fe9..0074b8b 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -19,17 +19,20 @@ NO32LIBS =3D "0"
>  # Set our distro features, don't forget all the standard libc ones
> DISTRO_FEATURES =3D "alsa argp bluetooth ext2 irda largefile pcmcia usbga=
dget
> usbhost wifi xattr nfs zeroconf pci 3g ipv4 ipv6 pulseaudio
> ${DISTRO_FEATURES_LIBC}"
>=20
> -# Set additional distro features to enable Wayland and Weston
> +# Set additional distro features
>  DISTRO_FEATURES +=3D "opengl pam"
> +
> +# Set preferred Qt version
> +QT_PROVIDER =3D "qt5"
> +
> +# Distro-specific package configuration # Weston - use fbdev compositor
> +and provide launcher
>  PACKAGECONFIG_pn-weston =3D "fbdev launch"
>=20
>  # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwe=
bkit)
> PACKAGECONFIG_GL_pn-qtbase =3D "gles2 linuxfb"
>  PACKAGECONFIG_DISTRO_pn-qtbase =3D "icu"
>=20
> -# Set preferred Qt version
> -QT_PROVIDER =3D "qt5"
> -
>  # ARM9 is not supported by the Linaro toolchain so default back to the A=
rago
> # toolchain for ARM9 based SOCs.
>  TC_SANE_DEFAULT :=3D
> "${@bb.utils.contains('SOC_FAMILY','omapl138','arago','linaro',d)}"
> --
> 2.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

