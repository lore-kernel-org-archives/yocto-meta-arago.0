Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8BC7252A72
	for <meta-arago@arago-project.org>;
	Thu, 24 Jul 2014 18:37:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6OIaxTF021046;
	Thu, 24 Jul 2014 13:36:59 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6OIax9D011069;
	Thu, 24 Jul 2014 13:36:59 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Thu, 24 Jul 2014 13:36:59 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 07/11] arago.conf: enable Qt5 by default,
	disable DRM for Weston
Thread-Index: AQHPorlz/KUHPyJUPUyWIxFATBeMnZuvlhCg
Date: Thu, 24 Jul 2014 18:36:58 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6E9C2E@DFLE08.ent.ti.com>
References: <1405709522-404-1-git-send-email-denis@denix.org>
	<1405709522-404-7-git-send-email-denis@denix.org>
In-Reply-To: <1405709522-404-7-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 07/11] arago.conf: enable Qt5 by default, disable DRM for Weston
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
X-List-Received-Date: Thu, 24 Jul 2014 18:37:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I don't know too much details about Weston but is there a reason to disable=
 DRM Weston for all machines when some may be able to use DRM?

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Friday, July 18, 2014 2:52 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 07/11] arago.conf: enable Qt5 by default,
> disable DRM for Weston
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-
> distro/conf/distro/arago.conf
> index def7a42..2686264 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -1,3 +1,5 @@
> +QT_PROVIDER =3D "qt5"
> +
>  # Name and version of the distribution
>  DISTRO_NAME =3D "Arago"
>  DISTRO_VERSION =3D "2014.06"
> @@ -20,8 +22,8 @@ NO32LIBS =3D "0"
>  DISTRO_FEATURES =3D "alsa argp bluetooth ext2 irda largefile pcmcia usbg=
adget
> usbhost wifi xattr nfs zeroconf pci 3g ipv4 ipv6 pulseaudio
> ${DISTRO_FEATURES_LIBC}"
>=20
>  # Set additional distro features to enable Wayland and Weston -
> DISTRO_FEATURES +=3D "opengl"
> -PACKAGECONFIG_pn-weston =3D "kms fbdev"
> +DISTRO_FEATURES +=3D "opengl pam"
> +PACKAGECONFIG_pn-weston =3D "fbdev launch"
>=20
>  # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwe=
bkit)
> PACKAGECONFIG_GL_pn-qtbase =3D "gles2 linuxfb"
> --
> 2.0.0
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

