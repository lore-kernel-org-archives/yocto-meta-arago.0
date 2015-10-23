Return-Path: <h-gou@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id D412D52A3A
	for <meta-arago@arago-project.org>;
	Fri, 23 Oct 2015 16:05:41 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9NG5euK026930
	for <meta-arago@arago-project.org>; Fri, 23 Oct 2015 11:05:40 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9NG5eAo023809
	for <meta-arago@arago-project.org>; Fri, 23 Oct 2015 11:05:40 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Fri, 23 Oct 2015 11:05:41 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] packagegroup-arago-tisdk-multimedia: add
	dspdce-fw
Thread-Index: AQHQ8mHk2kOasiZmGE6VIMFlsCBphZ55c+kQ
Date: Fri, 23 Oct 2015 16:05:40 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926ADC8C9@DLEE08.ent.ti.com>
References: <1442615538-28141-1-git-send-email-h-gou@ti.com>
In-Reply-To: <1442615538-28141-1-git-send-email-h-gou@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] packagegroup-arago-tisdk-multimedia: add dspdce-fw
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
X-List-Received-Date: Fri, 23 Oct 2015 16:05:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping. The patch for updating the recipe for dspdce-fw is now up-streamed: h=
ttp://arago-project.org/git/?p=3Dmeta-ti.git;a=3Dcommit;h=3D5f12d9f826344a8=
a27d9d77a4d1cb614ad4b8f2c.

> -----Original Message-----
> From: Gou, Hongmei
> Sent: Friday, September 18, 2015 6:32 PM
> To: meta-arago@arago-project.org
> Cc: Gou, Hongmei
> Subject: [meta-arago] [PATCH] packagegroup-arago-tisdk-multimedia: add
> dspdce-fw
>=20
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-tisdk-multimedia.bb          | 8 ++=
++---
> -
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> index 7f9cb90..2a78d0e 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-multimedia.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-multimedia.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to add multimedia related packages"
>  LICENSE =3D "MIT"
> -PR =3D "r13"
> +PR =3D "r14"
>=20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> @@ -44,15 +44,15 @@ MULTIMEDIA_append_am3517-evm =3D " \
>=20
>  ACCEL_FW =3D ""
>  ACCEL_FW_append_am57xx-evm =3D " \
> -    ${@base_contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
> +    ${@base_contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw dspdce-
> fw', '', d)} \
>      "
>=20
>  ACCEL_FW_append_omap5-evm =3D " \
> -    ${@base_contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
> +    ${@base_contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw dspdce-
> fw', '', d)} \
>      "
>=20
>  ACCEL_FW_append_dra7xx-evm =3D " \
> -    ${@base_contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
> +    ${@base_contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw dspdce-
> fw', '', d)} \
>      vis \
>      "
>=20
> --
> 1.9.1


