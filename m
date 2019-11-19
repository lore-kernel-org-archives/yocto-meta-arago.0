Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 49E8A529C0
	for <meta-arago@arago-project.org>;
	Tue, 19 Nov 2019 21:00:49 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJKxMfT129516
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2019 14:59:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574197162;
	bh=6XwNkHuMvwH8bsTAWnFu5BeTkpFL9aewxuCfu2XL6Z8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=CArUeeIhxHmaO4f9le7Qq8dt9ItnIlIDHUveZcLOh+I4WItsnNQYLCr0PyFzjrLhT
	RDBbCAFuXYbvEDnKRtrRRk0XRVh8m1cuha5nYjuZy5CF36vzZVVZLyOcoDXjQAn6fV
	y6AP6n0SYoVSmx7eoSr/FAPCA8qb6P5nPbeT1DUw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAJKxM4c103446
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2019 14:59:22 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 19 Nov 2019 14:59:21 -0600
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
	DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
	15.01.1847.003; Tue, 19 Nov 2019 14:59:21 -0600
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [thud/master][PATCH] packagegroup-arago-*-qte-*:
	re-enable qtwebengine/webbrowser for AM6/J7
Thread-Index: AQHVnxtNzxFmqGDFkkW8TaRuPNaRZKeS+PMw
Date: Tue, 19 Nov 2019 20:59:21 +0000
Message-ID: <24b757f08cae4cfb90eaff15ff05c66e@ti.com>
References: <20191119203808.8050-1-e-ruei1@ti.com>
	<20191119205248.GI27719@beryl>
In-Reply-To: <20191119205248.GI27719@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.148]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [thud/master][PATCH] packagegroup-arago-*-qte-*: re-enable qtwebengine/webbrowser for AM6/J7
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
X-List-Received-Date: Tue, 19 Nov 2019 21:00:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Denys:

We do not force 4K page size. The qtwebengine will be included at the targe=
t file system and the  users need to reconfigure and rebuild kernel in orde=
r to use it.
This qtwebengine issue will be documented as known issue with  workaround. =
I shall spend some time to figure out whether there is a simple solution fo=
r 64K page size.

Best regards,

Eric
=20

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, November 19, 2019 3:53 PM
To: Ruei, Eric
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [thud/master][PATCH] packagegroup-arago-*-qte-*: =
re-enable qtwebengine/webbrowser for AM6/J7

So, how are you forcing 4K pages, when 64K is default on Aarch64?


On Tue, Nov 19, 2019 at 03:38:08PM -0500, Eric Ruei wrote:
> qtwebengine 5.11.3 and qtwebbrowser works on AM6/J7 when the page size
> is set to 4K instead of 64K.
>=20
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-qte.bb  | 6 +++---
>  .../packagegroups/packagegroup-arago-tisdk-qte.bb         | 6 +++---
>  .../packagegroup-arago-qte-toolchain-target.bb            | 8 ++++----
>  3 files changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-qte.bb
> index b48b8c9f..5984fee7 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte=
.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte=
.bb
> @@ -50,9 +50,9 @@ QT5_ESSENTIALS =3D "\
>  #QT5_ESSENTIALS_append_k3 =3D "\
>  #    qtwebkit-qmlplugins \
>  #"
> -QT5_ESSENTIALS_remove_k3 =3D "\
> -    qtwebengine-qmlplugins \
> -"
> +#QT5_ESSENTIALS_remove_k3 =3D "\
> +#    qtwebengine-qmlplugins \
> +#"
> =20
>  RDEPENDS_${PN} =3D "\
>      ${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_ESSENTIALS}", "=
${QT4_ESSENTIALS}", d)} \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegrou=
p-arago-tisdk-qte.bb
> index 09516693..f742c0f7 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-qte.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-qte.bb
> @@ -24,15 +24,15 @@ QT5_DEMOS =3D "\
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-exampl=
es', '', d)} \
>      qtwebkit-examples-examples \
>      qtwebengine-examples \
> +    qtwebbrowser \
> +    qtwebbrowser-examples \
>      qtserialport-examples \
>      qtcharts-examples \
>  "
> =20
>  #QT5_DEMOS_append_k3 =3D " qtwebkit-examples-examples"
>  #
> -QT5_DEMOS_remove_k3 =3D "\
> -    qtwebengine-examples \
> -"
> +#QT5_DEMOS_remove_k3 =3D "\
>  #    qtwebbrowser \
>  #    qtwebbrowser-examples \
>  #    qtwebengine-examples \
> diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-ar=
ago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/=
packagegroup-arago-qte-toolchain-target.bb
> index a90f56c0..ac3c6b13 100644
> --- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte=
-toolchain-target.bb
> +++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte=
-toolchain-target.bb
> @@ -76,10 +76,10 @@ QT5_DEV =3D " \
>  #        qtwebkit-dev \
>  #"
>  #
> -QT5_DEV_remove_k3 =3D " \
> -        qtwebengine-mkspecs \
> -        qtwebengine-dev \
> -"
> +#QT5_DEV_remove_k3 =3D " \
> +#        qtwebengine-mkspecs \
> +#        qtwebengine-dev \
> +#"
> =20
>  RDEPENDS_${PN} +=3D " \
>          ${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_DEV}", "${Q=
T4_DEV}", d)} \
> --=20
> 2.17.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

