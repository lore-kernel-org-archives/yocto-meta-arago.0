Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B776452A62
	for <meta-arago@arago-project.org>;
	Tue,  3 Mar 2015 15:07:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t23F7txa001849;
	Tue, 3 Mar 2015 09:07:55 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t23F7sct029884;
	Tue, 3 Mar 2015 09:07:54 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Tue, 3 Mar 2015 09:07:54 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCH 2/2] packagegroup-*-qte: update to include
	remaining qt5 modules and dependencies
Thread-Index: AQHQVYrMRqEMBMt7U0qT4i8JGAJPKp0K3JCA
Date: Tue, 3 Mar 2015 15:07:53 +0000
Message-ID: <E5C7A8C9-4F73-48AD-8918-20A21CCC71AE@ti.com>
References: <1425370754-22484-1-git-send-email-denis@denix.org>,
	<1425370754-22484-2-git-send-email-denis@denix.org>
In-Reply-To: <1425370754-22484-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/2] packagegroup-*-qte: update to include remaining qt5 modules and dependencies
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
X-List-Received-Date: Tue, 03 Mar 2015 15:07:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Are there any dev packages for these packages that you added that should al=
so be added to Linux-devkit?


> On Mar 3, 2015, at 2:19 AM, Denys Dmytriyenko <denis@denix.org> wrote:
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> .../recipes-core/packagegroups/packagegroup-arago-qte.bb     | 11 +++++++=
+---
> .../packagegroups/packagegroup-arago-tisdk-qte.bb            | 12 +++++++=
-----
> 2 files changed, 15 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-qte.bb
> index 48fdb01..9618de5 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte=
.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte=
.bb
> @@ -1,6 +1,6 @@
> DESCRIPTION =3D "Task to add Qt embedded related packages"
> LICENSE =3D "MIT"
> -PR =3D "r7"
> +PR =3D "r8"
>=20
> inherit packagegroup
>=20
> @@ -29,11 +29,16 @@ QT4_ESSENTIALS =3D "\
> QT5_ESSENTIALS =3D "\
>     qtbase-plugins \
>     qtdeclarative-plugins \
> +    qtdeclarative-qmlplugins \
>     qtlocation-plugins \
> +    qtlocation-qmlplugins \
>     qtmultimedia-plugins \
> +    qtmultimedia-qmlplugins \
>     qtwayland-plugins \
> -    qt3d \
> -    qtquick1 \
> +    qt3d-qmlplugins \
> +    qtwebkit-qmlplugins \
> +    qtquick1-plugins \
> +    qtquick1-qmlplugins \
> "
>=20
> RDEPENDS_${PN} =3D "\
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegrou=
p-arago-tisdk-qte.bb
> index a95a9cd..495247e 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-qte.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-qte.bb
> @@ -1,6 +1,6 @@
> DESCRIPTION =3D "Task to add Qt embedded related packages"
> LICENSE =3D "MIT"
> -PR =3D "r9"
> +PR =3D "r10"
>=20
> inherit packagegroup
>=20
> @@ -14,12 +14,14 @@ QT4_DEMOS =3D "\
> "
>=20
> QT5_DEMOS =3D "\
> -    qtwayland-examples \
> -    qtwebkit-examples-examples \
> +    qt3d-examples \
> +    qtbase-examples \
>     qtdeclarative-examples \
> +    qtlocation-examples \
>     qtmultimedia-examples \
> -    qtbase-examples \
> -    qt3d-examples \
> +    qtscript-examples \
> +    qtwayland-examples \
> +    qtwebkit-examples-examples \
>     qtquick1-examples \
> "
>=20
> --=20
> 2.2.0
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

