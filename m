Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D472752A2F
	for <meta-arago@arago-project.org>;
	Wed, 16 Jul 2014 14:30:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6GEUvG8009297
	for <meta-arago@arago-project.org>; Wed, 16 Jul 2014 09:30:57 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6GEUvW1003317
	for <meta-arago@arago-project.org>; Wed, 16 Jul 2014 09:30:57 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Wed, 16 Jul 2014 09:30:57 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 4/4] linux-ti-staging: update bbappend for
	3.14	version
Thread-Index: AQHPoB/2Y5IKaeU/e0OicvI5DRJBMpuiwdQg
Date: Wed, 16 Jul 2014 14:30:56 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6E34D4@DFLE08.ent.ti.com>
References: <1405423715-21885-1-git-send-email-Chase.Maupin@ti.com>
	<1405423715-21885-5-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1405423715-21885-5-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] linux-ti-staging: update bbappend for 3.14	version
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
X-List-Received-Date: Wed, 16 Jul 2014 14:30:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Tuesday, July 15, 2014 6:29 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 4/4] linux-ti-staging: update bbappend for 3=
.14
> version
>=20
> * Update the bbappend for the linux-ti-staging to work with the
>   3.14 kernel version.
> * Set the kernel to AUTOREV while developing the latest 3.14 kernel
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  ....12.bbappend =3D> linux-ti-staging_3.14.bbappend} |    2 ++
>  1 file changed, 2 insertions(+)
>  copy meta-arago-distro/recipes-kernel/linux/{linux-ti-staging_3.12.bbapp=
end
> =3D> linux-ti-staging_3.14.bbappend} (94%)
>=20
> diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-
> staging_3.12.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-
> staging_3.14.bbappend
> similarity index 94%
> copy from meta-arago-distro/recipes-kernel/linux/linux-ti-
> staging_3.12.bbappend
> copy to meta-arago-distro/recipes-kernel/linux/linux-ti-
> staging_3.14.bbappend
> index 2a6f090..b178b5e 100644
> --- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappe=
nd
> +++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.14.bbappe=
nd
> @@ -6,6 +6,8 @@ require copy-defconfig.inc
>=20
>  KERNEL_LOCALVERSION =3D "-g${@d.getVar('SRCPV', True).partition('+')[2][=
0:7]}"
>=20
[Franklin] PR bump missing.
> +SRCREV =3D "${AUTOREV}"
> +
>  kernel_do_configure_prepend() {
>      if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
>      then
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

