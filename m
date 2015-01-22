Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 05A8552099
	for <meta-arago@arago-project.org>;
	Thu, 22 Jan 2015 14:40:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0MEeLU3022946
	for <meta-arago@arago-project.org>; Thu, 22 Jan 2015 08:40:21 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0MEeJju019273
	for <meta-arago@arago-project.org>; Thu, 22 Jan 2015 08:40:19 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Thu, 22 Jan 2015 08:40:19 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/2] libnl: Update recipe from 3.2.22 to
	3.2.24
Thread-Index: AQHQNgFoLfuCtSP2t0eZZ09os+IrFJzMNSSA
Date: Thu, 22 Jan 2015 14:40:19 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7D54B6@DFLE08.ent.ti.com>
References: <1421903270-9115-1-git-send-email-sam.nelson@ti.com>
	<1421903270-9115-2-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1421903270-9115-2-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] libnl: Update recipe from 3.2.22 to 3.2.24
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
X-List-Received-Date: Thu, 22 Jan 2015 14:40:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

A couple of things.

Just to confirm. Are the old patches something that has been merged into th=
is updated version of libnl or do they simply not apply anymore? Also I don=
't understand the "Updated autotools comment".

Also just a heads up. Libnl is only used currently by the wilink drivers. I=
 thought I remember in the past that sometimes the wireless packages break/=
need to be fixed when the packages they depend on has been updated or chang=
ed. So if you plan on setting the PREFERRED_VERSION to use this updated ver=
sion of libnl please hold off on setting it globally until the AMSDK releas=
e at the end of this month is completed. Or feel free to set it globally an=
d simply insure that am335x and am437x still uses 3.2.22.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Nelson, Sam
> Sent: Wednesday, January 21, 2015 11:08 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 2/2] libnl: Update recipe from 3.2.22 to 3.2=
.24
>=20
> - removed old patches
> - Updated autotools
> - Added some private files to be installed to allow libnl extensions.
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>=20
> ---
> Planning to  send as similar patch to oe-core  as well.
> Once accepted can be removed here
> ---
> ---
>  .../libnl/{libnl_3.2.22.bb =3D> libnl_3.2.24.bb}     |   23 ++++++++++--=
--------
>  1 file changed, 12 insertions(+), 11 deletions(-)  rename meta-arago-
> extras/recipes-support/libnl/{libnl_3.2.22.bb =3D> libnl_3.2.24.bb} (72%)
>=20
> diff --git a/meta-arago-extras/recipes-support/libnl/libnl_3.2.22.bb b/me=
ta-
> arago-extras/recipes-support/libnl/libnl_3.2.24.bb
> similarity index 72%
> rename from meta-arago-extras/recipes-support/libnl/libnl_3.2.22.bb
> rename to meta-arago-extras/recipes-support/libnl/libnl_3.2.24.bb
> index a299bfb..50a9cd9 100644
> --- a/meta-arago-extras/recipes-support/libnl/libnl_3.2.22.bb
> +++ b/meta-arago-extras/recipes-support/libnl/libnl_3.2.24.bb
> @@ -9,17 +9,18 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D4fbd65380cdd255951079008b364516c"
>=20
>  DEPENDS =3D "flex-native bison-native"
>=20
> -SRC_URI =3D "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
> -           file://fix-pktloc_syntax_h-race.patch \
> -           file://fix-pc-file.patch \
> -           file://fix-lib-cache_mngr.c-two-parentheses-bugs.patch \
> -           file://0001-fix-double-free-caused-by-freeing-link-af_data-in=
-rt.patch
> \
> -          "
> -
> -SRC_URI[md5sum] =3D "2e1c889494d274aca24ce5f6a748e66e"
> -SRC_URI[sha256sum] =3D
> "c7c5f267dfeae0c1a530bf96b71fb7c8dbbb07d54beef49b6712d8d6166f629b
> "
> -
> -inherit autotools-brokensep pkgconfig
> +SRC_URI[md5sum] =3D "6e0e7bad0674749d930dd9f285343d55"
> +SRC_URI[sha256sum] =3D
> "fb8d6e5dc8af5b85bc6d00a71582a68a01e6a3f7d1664d4a646e289a99dd681
> 6"
> +SRC_URI =3D "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz"
> +
> +inherit autotools pkgconfig
> +
> +do_install_append() {
> +#   Install private files to allow libnl extensions
> +    install -d ${D}${includedir}/netlink-private
> +    cp -r ${S}/include/netlink-private/cache-api.h ${D}${includedir}/net=
link-
> private/
> +    cp -r ${S}/include/netlink-private/object-api.h
> +${D}${includedir}/netlink-private/
> +}
>=20
>  FILES_${PN} =3D "${libdir}/libnl-3.so.* \
>                 ${libdir}/libnl.so.* \
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

