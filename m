Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4AAE352A31
	for <meta-arago@arago-project.org>;
	Thu, 24 Jul 2014 18:30:41 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6OIUe2u020480;
	Thu, 24 Jul 2014 13:30:40 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6OIUe1W006584;
	Thu, 24 Jul 2014 13:30:40 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Thu, 24 Jul 2014 13:30:40 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v2 05/11] packagegroup-*-connectivity:
	conditionally disable wpa-gui for not supporting Qt5
Thread-Index: AQHPor9Kt8bZHKEBnkWUXOuuB8NKJJuvlTSA
Date: Thu, 24 Jul 2014 18:30:39 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6E9C0B@DFLE08.ent.ti.com>
References: <1405709522-404-5-git-send-email-denis@denix.org>
	<1405712036-14671-1-git-send-email-denis@denix.org>
In-Reply-To: <1405712036-14671-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH v2 05/11] packagegroup-*-connectivity: conditionally disable wpa-gui for not supporting Qt5
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
X-List-Received-Date: Thu, 24 Jul 2014 18:30:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Friday, July 18, 2014 3:34 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH v2 05/11] packagegroup-*-connectivity:
> conditionally disable wpa-gui for not supporting Qt5
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> v2 - make logic conditional based on Qt version
>=20
>  .../packagegroups/packagegroup-arago-tisdk-connectivity.bb            | =
4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> index 7b3480c..458a2f9 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
> +++ sdk-connectivity.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to install wireless packages into the target FS"
>  LICENSE =3D "MIT"
> -PR =3D "r24"
> +PR =3D "r25"
>=20
>  inherit packagegroup
>=20
> @@ -34,7 +34,7 @@ FIRMWARE_AND_DRIVERS =3D "\  "
>=20
>  DEMO_APPS =3D "\
> -    wpa-gui-e \
> +    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'wpa-gui-e', d)} \
>  "
>=20
>  BLUETOOTH_STACK =3D "\
> --
> 2.0.0
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

