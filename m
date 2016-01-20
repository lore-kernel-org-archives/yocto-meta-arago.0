Return-Path: <h-gou@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A3523529C9
	for <meta-arago@arago-project.org>;
	Wed, 20 Jan 2016 15:12:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0KFC1kX006544
	for <meta-arago@arago-project.org>; Wed, 20 Jan 2016 09:12:01 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0KFC11u006740
	for <meta-arago@arago-project.org>; Wed, 20 Jan 2016 09:12:01 -0600
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Wed, 20 Jan 2016 09:12:01 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] arago-source-ipk: update install dir for
	hplib-mod and uio-module-drv
Thread-Index: AQHRUtXf7TykX+VKjEGc2jw7rD/8eJ8EhBoA
Date: Wed, 20 Jan 2016 15:12:01 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926B4E39A@DLEE08.ent.ti.com>
References: <1453220667-28798-1-git-send-email-h-gou@ti.com>
In-Reply-To: <1453220667-28798-1-git-send-email-h-gou@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] arago-source-ipk: update install dir for hplib-mod and uio-module-drv
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
X-List-Received-Date: Wed, 20 Jan 2016 15:12:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping

> -----Original Message-----
> From: Gou, Hongmei
> Sent: Tuesday, January 19, 2016 11:24 AM
> To: meta-arago@arago-project.org
> Cc: Gou, Hongmei
> Subject: [meta-arago] [PATCH] arago-source-ipk: update install dir for hp=
lib-
> mod and uio-module-drv
>=20
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago-source-ipk.conf | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-
> arago-distro/conf/distro/arago-source-ipk.conf
> index 6a61292..122ea2d 100644
> --- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
> +++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> @@ -340,10 +340,10 @@ CREATE_SRCIPK_pn-boot-monitor =3D "1"
>  SRCIPK_INSTALL_DIR_pn-boot-monitor =3D "board-support/${PN}-${PV}"
>=20
>  CREATE_SRCIPK_pn-hplib-mod =3D "1"
> -SRCIPK_INSTALL_DIR_pn-hplib-mod =3D "board-support/${PN}-${PV}"
> +SRCIPK_INSTALL_DIR_pn-hplib-mod =3D "board-support/extra-drivers/${PN}-
> ${PV}"
>=20
>  CREATE_SRCIPK_pn-uio-module-drv =3D "1"
> -SRCIPK_INSTALL_DIR_pn-uio-module-drv =3D "board-support/${PN}-${PV}"
> +SRCIPK_INSTALL_DIR_pn-uio-module-drv =3D "board-support/extra-
> drivers/${PN}-${PV}"
>=20
>  CREATE_SRCIPK_pn-pru-icss =3D "1"
>  SRCIPK_INSTALL_DIR_pn-pru-icss =3D "example-applications/${PN}-${PV}"
> --
> 1.9.1


