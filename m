Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E6EC452976
	for <meta-arago@arago-project.org>;
	Fri, 26 Sep 2014 17:50:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8QHo4IU027777;
	Fri, 26 Sep 2014 12:50:04 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8QHo4kC003734;
	Fri, 26 Sep 2014 12:50:04 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Fri, 26 Sep 2014 12:50:04 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/7] libinput: update to 0.6.0
Thread-Index: AQHP2aBU3of6TWM2r0mFJ+dED74AdpwTsEyA
Date: Fri, 26 Sep 2014 17:50:03 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C73EA99@DFLE08.ent.ti.com>
References: <1411746038-21612-1-git-send-email-denis@denix.org>
In-Reply-To: <1411746038-21612-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] libinput: update to 0.6.0
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
X-List-Received-Date: Fri, 26 Sep 2014 17:50:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Any reason to update all these library versions? Or is it just to remove th=
e patches I've added since its upstream?

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Friday, September 26, 2014 10:41 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 1/7] libinput: update to 0.6.0
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../wayland/{libinput_git.bb =3D> libinput_0.6.0.bb}     | 18 ++++++----=
--------
>  1 file changed, 6 insertions(+), 12 deletions(-)  rename meta-arago-
> extras/recipes-graphics/wayland/{libinput_git.bb =3D> libinput_0.6.0.bb} =
(42%)
>=20
> diff --git a/meta-arago-extras/recipes-graphics/wayland/libinput_git.bb
> b/meta-arago-extras/recipes-graphics/wayland/libinput_0.6.0.bb
> similarity index 42%
> rename from meta-arago-extras/recipes-graphics/wayland/libinput_git.bb
> rename to meta-arago-extras/recipes-graphics/wayland/libinput_0.6.0.bb
> index 6635e7d..c3bbb7b 100644
> --- a/meta-arago-extras/recipes-graphics/wayland/libinput_git.bb
> +++ b/meta-arago-extras/recipes-graphics/wayland/libinput_0.6.0.bb
> @@ -1,20 +1,14 @@
> -DESCRIPTION =3D "libinput is a library to handle input devices in Waylan=
d
> compositors"
> +SUMMARY =3D "Library to handle input devices in Wayland compositors"
>  HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/libinput/"
> +SECTION =3D "libs"
>=20
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D673e626420c7f859fbe2be3a9c13632d"
>=20
> -inherit autotools pkgconfig
> -
>  DEPENDS =3D "libevdev udev mtdev"
>=20
> -PR =3D "r2"
> -
> -BRANCH =3D "master"
> -SRCREV =3D "0647574c46e5e930063ace7b35385213dca33dc1"
> +SRC_URI =3D "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
> +SRC_URI[md5sum] =3D "3afaf9f66d8796323a79edb879c10ba3"
> +SRC_URI[sha256sum] =3D
> "30b555771e7cb921ccb9430c4a86940aa3938d05506e81d2417c03e30451bf
> bc"
>=20
> -PV =3D "0.5.0"
> -
> -SRC_URI =3D
> "git://anongit.freedesktop.org/wayland/libinput;protocol=3Dgit;branch=3D$=
{BRA
> NCH}"
> -
> -S =3D "${WORKDIR}/git"
> +inherit autotools pkgconfig
> --
> 2.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

