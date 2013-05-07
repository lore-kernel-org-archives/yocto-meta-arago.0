Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7D45652995
	for <meta-arago@arago-project.org>;
	Tue,  7 May 2013 00:09:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4709ps2023982
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 19:09:51 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4709pkY027108
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 19:09:51 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 6 May 2013 19:09:51 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Thread-Topic: [meta-arago] [PATCH 2/2] meta-arago conf files: Use updated
	recipes/recipes names
Thread-Index: Ac5KtzGoSFiajvlLRye0BUMxewZ+7Q==
Date: Tue, 7 May 2013 00:09:51 +0000
Message-ID: <7EA8ED11-EE8A-4DFF-9DD5-197B6122FDA1@ti.com>
References: <1367878495-17492-1-git-send-email-fcooper@ti.com>
	<1367878495-17492-2-git-send-email-fcooper@ti.com>
In-Reply-To: <1367878495-17492-2-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper
	Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH 2/2] meta-arago conf files: Use updated	recipes/recipes names
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
X-List-Received-Date: Tue, 07 May 2013 00:09:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2BAED923099CE045BC20CA123742D9EB@owa.mail.ti.com>
Content-Transfer-Encoding: quoted-printable

Why not split this into separate patches?
On May 6, 2013, at 5:15 PM, "Cooper Jr., Franklin" <fcooper@ti.com> wrote:

> * Recipes have been moved to meta-ti and are using the updated naming sch=
eme.
> * Mimic the name changes.
> * Use latest version of the Graphics SDK
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
> .../conf/distro/arago-source-ipk.conf              |    6 +++---
> .../conf/distro/include/branding-amsdk.inc         |   12 ++++++------
> 2 files changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-a=
rago-distro/conf/distro/arago-source-ipk.conf
> index f9bb5b7..912ec36 100644
> --- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
> +++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> @@ -147,9 +147,9 @@ CREATE_SRCIPK_pn-linux-omap-psp =3D "1"
> SRCIPK_INSTALL_DIR_pn-linux-omap-psp =3D "board-support/linux-${KVER}-psp=
${PSPREL}"
> SRCIPK_PACKAGE_ARCH_pn-linux-omap-psp =3D "${MACHINE_ARCH}"
>=20
> -CREATE_SRCIPK_pn-linux-am335x =3D "1"
> -SRCIPK_INSTALL_DIR_pn-linux-am335x =3D "board-support/linux-${KVER}"
> -SRCIPK_PACKAGE_ARCH_pn-linux-am335x =3D "${MACHINE_ARCH}"
> +CREATE_SRCIPK_pn-linux-am335x-psp =3D "1"
> +SRCIPK_INSTALL_DIR_pn-linux-am335x-psp =3D "board-support/linux-${KVER}"
> +SRCIPK_PACKAGE_ARCH_pn-linux-am335x-psp =3D "${MACHINE_ARCH}"
>=20
> CREATE_SRCIPK_pn-linux-omap =3D "1"
> SRCIPK_INSTALL_DIR_pn-linux-omap =3D "board-support/linux-${PV}-${PR}"
> diff --git a/meta-arago-distro/conf/distro/include/branding-amsdk.inc b/m=
eta-arago-distro/conf/distro/include/branding-amsdk.inc
> index dc3f448..8fdf93d 100644
> --- a/meta-arago-distro/conf/distro/include/branding-amsdk.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
> @@ -1,13 +1,13 @@
> # AM-SDK branding configuration
>=20
> # Use the SDK supported kernel and kernel version
> -PREFERRED_PROVIDER_virtual/kernel_am335x-evm =3D "linux-am335x"
> -PREFERRED_VERSION_linux-am335x =3D "3.2.0-psp05.06.00.00"
> +PREFERRED_PROVIDER_virtual/kernel_am335x-evm =3D "linux-am335x-psp"
> +PREFERRED_VERSION_linux-am335x-psp =3D "3.2"
> PREFERRED_PROVIDER_ltp-ddt_am335x-evm =3D "ltp-ddt-legacy"
> PREFERRED_PROVIDER_virtual/bootloader_am335x-evm =3D "u-boot-am33x"
> PREFERRED_PROVIDER_u-boot_am335x-evm =3D "u-boot-am33x"
> -PREFERRED_VERSION_u-boot-am33x =3D "2012.10"
> +PREFERRED_VERSION_u-boot-am33x =3D "2013.01.01"
>=20
> -# Use v4.08.00.02 of the Graphics SDK
> -PREFERRED_VERSION_omap3-sgx-modules =3D "4.08.00.02"
> -PREFERRED_VERSION_libgles-omap3 =3D "4.08.00.02"
> +# Use v4.09.00.01 of the Graphics SDK
> +PREFERRED_VERSION_omap3-sgx-modules =3D "4.09.00.01"
> +PREFERRED_VERSION_libgles-omap3 =3D "4.09.00.01"
> --=20
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

