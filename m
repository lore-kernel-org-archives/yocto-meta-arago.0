Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1447552090
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 15:07:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AF7ZnD030574
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:07:35 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AF7Zx8014698
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:07:35 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 10 Oct 2013 10:07:35 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Monk, Roger" <r-monk@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 05/11]
	ti-connectivity/wpa-supplicant-wl18xx:	Ensure version'd patch applied
	first
Thread-Index: AQHOxUuNU/pas8cZhUmcwP3yEM7sgJnuCkbg
Date: Thu, 10 Oct 2013 15:07:34 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5719EC@DFLE08.ent.ti.com>
References: <1381366658-13630-1-git-send-email-r-monk@ti.com>
	<1381366658-13630-6-git-send-email-r-monk@ti.com>
In-Reply-To: <1381366658-13630-6-git-send-email-r-monk@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 05/11] ti-connectivity/wpa-supplicant-wl18xx:	Ensure version'd patch applied first
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
X-List-Received-Date: Thu, 10 Oct 2013 15:07:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Monk, Roger
> Sent: Wednesday, October 09, 2013 7:58 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 05/11] ti-connectivity/wpa-supplicant-wl18xx=
:
> Ensure version'd patch applied first
>=20
> Signed-off-by: Roger Monk <r-monk@ti.com>
> ---
>  .../wpa-supplicant-wl18xx_r8.a7.02.bb              |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant-wl18xx_r8.a7.02.bb b/meta-arago-extras/recipes-connectivity/wp=
a-
> supplicant/wpa-supplicant-wl18xx_r8.a7.02.bb
> index 0ea9ff5..392bff3 100644
> --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplican=
t-
> wl18xx_r8.a7.02.bb
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplican=
t-
> wl18xx_r8.a7.02.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D
> "file://../COPYING;md5=3Dab87f20cd7e8c0d0a6539b34d3791d0e \
>                      file://../README;md5=3D5cb758942d25f6f61fd4ac388fd44=
6fa \
>=20
> file://wpa_supplicant.c;beginline=3D1;endline=3D17;md5=3D8835156c8ab8cad6=
356ec
> 7f39ebe3aba"
>=20
> -FILESEXTRAPATHS_append :=3D "${THISDIR}/wpa-supplicant:"
> +FILESEXTRAPATHS_append :=3D "${THISDIR}/wpa-supplicant-wl18xx-
> r8.a7.02:${THISDIR}/wpa-supplicant:"
>=20
>  COMPATIBLE_MACHINE =3D "(omap-a15)"
>=20
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

