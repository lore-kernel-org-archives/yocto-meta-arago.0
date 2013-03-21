Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 57CD65203A
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2013 11:47:41 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2LBleBJ016628
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 06:47:40 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2LBlems028108
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 06:47:40 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Thu, 21 Mar 2013 06:47:40 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 02/17] wl12xx-firmware: Update recipe name.
Thread-Index: AQHOJRYnQjdhU6Mpt0aebmy/W3jBJ5iwCYLw
Date: Thu, 21 Mar 2013 11:47:39 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015948E906@DLEE11.ent.ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
	<1363745138-10288-2-git-send-email-fcooper@ti.com>
In-Reply-To: <1363745138-10288-2-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 02/17] wl12xx-firmware: Update recipe name.
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
X-List-Received-Date: Thu, 21 Mar 2013 11:47:41 -0000
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
> Subject: [meta-arago] [PATCH 02/17] wl12xx-firmware: Update
> recipe name.
>=20
> * Update recipe to have a distinct name.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../Makefile                                       |    0
>  ...irmware_git.bb =3D> wl12xx-firmware_r5.sp4.01.bb} |    0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta-arago-extras/recipes-bsp/wl12xx-firmware/{wl12xx-
> firmware =3D> wl12xx-firmware-r5.sp4.01}/Makefile (100%)
>  rename meta-arago-extras/recipes-bsp/wl12xx-firmware/{wl12xx-
> firmware_git.bb =3D> wl12xx-firmware_r5.sp4.01.bb} (100%)
>=20
> diff --git a/meta-arago-extras/recipes-bsp/wl12xx-
> firmware/wl12xx-firmware/Makefile b/meta-arago-extras/recipes-
> bsp/wl12xx-firmware/wl12xx-firmware-r5.sp4.01/Makefile
> similarity index 100%
> rename from meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-
> firmware/Makefile
> rename to meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-
> firmware-r5.sp4.01/Makefile
> diff --git a/meta-arago-extras/recipes-bsp/wl12xx-
> firmware/wl12xx-firmware_git.bb b/meta-arago-extras/recipes-
> bsp/wl12xx-firmware/wl12xx-firmware_r5.sp4.01.bb
> similarity index 100%
> rename from meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-
> firmware_git.bb
> rename to meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-
> firmware_r5.sp4.01.bb
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

