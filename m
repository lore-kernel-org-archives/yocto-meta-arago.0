Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 611F4529A3
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2013 11:58:49 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2LBwmCs017503
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 06:58:48 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2LBwmCQ007574
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 06:58:48 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 21 Mar 2013 06:58:48 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Thu, 21 Mar 2013 06:58:48 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 05/17] ti-compat-wireless-wl12xx: Rename
	recipe
Thread-Index: AQHOJRamhH10Ln/dQ0+l5o783dmqPpiwDLDw
Date: Thu, 21 Mar 2013 11:58:47 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015948E9C5@DLEE11.ent.ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
	<1363745138-10288-5-git-send-email-fcooper@ti.com>
In-Reply-To: <1363745138-10288-5-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 05/17] ti-compat-wireless-wl12xx: Rename recipe
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
X-List-Received-Date: Thu, 21 Mar 2013 11:58:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> Sent: Tuesday, March 19, 2013 9:05 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH 05/17] ti-compat-wireless-wl12xx:
> Rename recipe
>=20
> * Rename recipe so that PV matches the release version of
>   compat-wireless-wl12xx.
> ---
>  ...wl12xx-Decrease-number-of-TX-transactions.patch |    0
>  ...5.bb =3D> ti-compat-wireless-wl12xx_r5.sp4.01.bb} |    2 --
>  2 files changed, 0 insertions(+), 2 deletions(-)
>  rename meta-arago-extras/recipes-bsp/ti-compat-wireless/{files
> =3D> ti-compat-wireless-wl12xx-r5.sp4.01}/0002-wl12xx-Decrease-
> number-of-TX-transactions.patch (100%)
>  rename meta-arago-extras/recipes-bsp/ti-compat-wireless/{ti-
> compat-wireless-wl12xx_r5.bb =3D> ti-compat-wireless-
> wl12xx_r5.sp4.01.bb} (99%)
>=20
> diff --git a/meta-arago-extras/recipes-bsp/ti-compat-
> wireless/files/0002-wl12xx-Decrease-number-of-TX-
> transactions.patch b/meta-arago-extras/recipes-bsp/ti-compat-
> wireless/ti-compat-wireless-wl12xx-r5.sp4.01/0002-wl12xx-
> Decrease-number-of-TX-transactions.patch
> similarity index 100%
> rename from meta-arago-extras/recipes-bsp/ti-compat-
> wireless/files/0002-wl12xx-Decrease-number-of-TX-
> transactions.patch
> rename to meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-
> compat-wireless-wl12xx-r5.sp4.01/0002-wl12xx-Decrease-number-of-
> TX-transactions.patch
> diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-
> compat-wireless-wl12xx_r5.bb b/meta-arago-extras/recipes-bsp/ti-
> compat-wireless/ti-compat-wireless-wl12xx_r5.sp4.01.bb
> similarity index 99%
> rename from meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-
> compat-wireless-wl12xx_r5.bb
> rename to meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-
> compat-wireless-wl12xx_r5.sp4.01.bb
> index 1886e00..afbfa9c 100644
> --- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-
> wireless-wl12xx_r5.bb
> +++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-
> wireless-wl12xx_r5.sp4.01.bb
> @@ -9,8 +9,6 @@ LIC_FILES_CHKSUM =3D
> "file://COPYRIGHT;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
>=20
>  RDEPENDS_${PN} =3D "wireless-tools"
>=20
> -PV =3D "r5.sp4.01"
> -
>  inherit module
>=20
>  PR =3D "${MACHINE_KERNEL_PR}"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

