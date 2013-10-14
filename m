Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 413695299B
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 19:21:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9EJL7GR016670
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 14:21:07 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EJL7NN027817
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 14:21:07 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 14 Oct 2013 14:21:07 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/3] arago-core-tisdk-image: Add AM437x
	DTB	filter
Thread-Index: AQHOyRCaTAcT/d60wU6U6OGW8DeO55n0ktjA
Date: Mon, 14 Oct 2013 19:21:06 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C575FF9@DFLE08.ent.ti.com>
References: <1381780588-15865-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1381780588-15865-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] arago-core-tisdk-image: Add AM437x DTB	filter
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
X-List-Received-Date: Mon, 14 Oct 2013 19:21:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Monday, October 14, 2013 2:56 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 1/3] arago-core-tisdk-image: Add AM437x DTB
> filter
>=20
> * Add the DTB_FILTER setting for am437x-evm devices
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../recipes-core/images/arago-core-tisdk-image.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image=
.inc
> b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> index 1d00117..368fa47 100644
> --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> @@ -20,6 +20,7 @@ DTB_FILTER =3D "unknown"
>  DTB_FILTER_ti33x =3D "am335x"
>  DTB_FILTER_omap5-evm =3D "omap5"
>  DTB_FILTER_dra7xx-evm =3D "dra7"
> +DTB_FILTER_ti43x =3D "am43x"
>=20
>  # List of target side images to build for the SDK  TARGET_IMAGES =3D "ar=
ago-
> base-tisdk-image tisdk-rootfs-image"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

