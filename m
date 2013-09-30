Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id AEFDC52099
	for <meta-arago@arago-project.org>;
	Mon, 30 Sep 2013 22:42:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8UMgFvK030107
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2013 17:42:15 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8UMgFdZ018453
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2013 17:42:15 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 30 Sep 2013 17:42:15 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH] arago-source-ipk: Preserve latest kernel and u-boot
	git repository
Thread-Index: AQHOvi3OqcfNRl3VI0a4F6zhlZcLmZne36Uw
Date: Mon, 30 Sep 2013 22:42:14 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C56578B@DFLE08.ent.ti.com>
References: <1380583400-8907-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1380583400-8907-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] arago-source-ipk: Preserve latest kernel and u-boot git repository
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
X-List-Received-Date: Mon, 30 Sep 2013 22:42:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I accidently left this patch out of the patch set I just sent. One of the p=
atches in the patchset I just sent out depends on this patch.

> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Monday, September 30, 2013 6:23 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [PATCH] arago-source-ipk: Preserve latest kernel and u-boot git
> repository
>=20
> * Preserve the git repository when the sources are packaged up.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../conf/distro/arago-source-ipk.conf              |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-a=
rago-
> distro/conf/distro/arago-source-ipk.conf
> index 63cad0d..a321271 100644
> --- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
> +++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> @@ -121,6 +121,7 @@ SRCIPK_PACKAGE_ARCH_pn-x-load =3D
> "${MACHINE_ARCH}"
>  CREATE_SRCIPK_pn-u-boot-ti-staging =3D "1"
>  SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging =3D "board-support/u-boot-${PV}-
> ${PR}"
>  SRCIPK_PACKAGE_ARCH_pn-u-boot-ti-staging =3D "${MACHINE_ARCH}"
> +SRCIPK_PRESERVE_GIT_pn-u-boot-ti-staging =3D "true"
>=20
>  CREATE_SRCIPK_pn-u-boot-dra7xx =3D "1"
>  SRCIPK_INSTALL_DIR_pn-u-boot-dra7xx =3D "board-support/u-boot-${PV}-
> ${PR}"
> @@ -145,6 +146,7 @@ SRCIPK_PACKAGE_ARCH_pn-u-boot-am3517 =3D
> "${MACHINE_ARCH}"
>  CREATE_SRCIPK_pn-linux-ti-staging =3D "1"
>  SRCIPK_INSTALL_DIR_pn-linux-ti-staging =3D "board-support/linux-${PV}"
>  SRCIPK_PACKAGE_ARCH_pn-linux-ti-staging =3D "${MACHINE_ARCH}"
> +SRCIPK_PRESERVE_GIT_pn-linux-ti-staging =3D "true"
>=20
>  CREATE_SRCIPK_pn-linux-omapl138-psp =3D "1"
>  SRCIPK_INSTALL_DIR_pn-linux-omapl138-psp =3D "board-support/linux-${KVER=
}-
> psp${PSPREL}"
> --
> 1.7.0.4


