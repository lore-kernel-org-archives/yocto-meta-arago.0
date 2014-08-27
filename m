Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D4E5752972
	for <meta-arago@arago-project.org>;
	Wed, 27 Aug 2014 21:42:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7RLgZWo000845;
	Wed, 27 Aug 2014 16:42:35 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7RLgZGq031783;
	Wed, 27 Aug 2014 16:42:35 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Wed, 27 Aug 2014 16:42:35 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] cryptodev-module: fix autoloading issue
	with	dashed module name
Thread-Index: AQHPwjp0fOrdK7RIl0eb9rImYcUvf5vk+uNQ
Date: Wed, 27 Aug 2014 21:42:34 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C71101D@DLEE08.ent.ti.com>
References: <1409173360-3221-1-git-send-email-denis@denix.org>
In-Reply-To: <1409173360-3221-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] cryptodev-module: fix autoloading issue with	dashed module name
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
X-List-Received-Date: Wed, 27 Aug 2014 21:42:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

I never noticed that you could use "module_autoload". A lot better than the=
 approach I was thinking of :)


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Wednesday, August 27, 2014 4:03 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] cryptodev-module: fix autoloading issue wit=
h
> dashed module name
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend            | =
4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-
> module_1.6.bbappend b/meta-arago-distro/recipes-
> kernel/cryptodev/cryptodev-module_1.6.bbappend
> index 00d7919..7be7536 100644
> --- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-
> module_1.6.bbappend
> +++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-
> module_1.6.bbappend
> @@ -1,6 +1,6 @@
> -PR_append =3D "-arago1"
> +PR_append =3D "-arago2"
>=20
> -module_autoload_cryptodev-module =3D "cryptodev-module"
> +module_autoload_cryptodev =3D "cryptodev-module"
>=20
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>=20
> --
> 2.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

