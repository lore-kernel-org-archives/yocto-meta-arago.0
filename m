Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8300252A5D
	for <meta-arago@arago-project.org>;
	Fri, 29 Aug 2014 22:05:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7TM5k7O028996
	for <meta-arago@arago-project.org>; Fri, 29 Aug 2014 17:05:46 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7TM5kIJ029424
	for <meta-arago@arago-project.org>; Fri, 29 Aug 2014 17:05:46 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Fri, 29 Aug 2014 17:05:46 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH 1/3] arago.conf: Disable TSLIB in Qt 5
Thread-Index: AQHPw9Q+PzbnJHHQAUGhPYg3PAqm+5voIqKw
Date: Fri, 29 Aug 2014 22:05:45 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7220EF@DFLE08.ent.ti.com>
References: <1409349440-20871-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1409349440-20871-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] arago.conf: Disable TSLIB in Qt 5
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
X-List-Received-Date: Fri, 29 Aug 2014 22:05:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Nak these patches. I noticed that I used conditional instead of contains in=
 the next two patches. Plus I see that wayland is already a "standard" in t=
erms of a distro feature. However, it seems that it typically pulls in some=
 additional things that we don't necessarily want. So some additional thing=
s need to be fixed.

> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Friday, August 29, 2014 4:57 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [PATCH 1/3] arago.conf: Disable TSLIB in Qt 5
>=20
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
>=20
> * When using Qt 5 w/Wayland Weston should be providing the touch input.
> * Disable tslib.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-
> distro/conf/distro/arago.conf
> index 57e6646..50c8c6b 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -31,7 +31,7 @@ PACKAGECONFIG_pn-weston =3D "fbdev launch"
>=20
>  # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwe=
bkit)
> PACKAGECONFIG_GL_pn-qtbase =3D "gles2 linuxfb"
> -PACKAGECONFIG_DISTRO_pn-qtbase =3D "icu examples tslib"
> +PACKAGECONFIG_DISTRO_pn-qtbase =3D "icu examples
> ${@bb.utils.contains('DISTRO_FEATURES','weston','','tslib',d)}"
>=20
>  # ARM9 is not supported by the Linaro toolchain so default back to the
> Arago  # toolchain for ARM9 based SOCs.
> --
> 1.7.9.5


