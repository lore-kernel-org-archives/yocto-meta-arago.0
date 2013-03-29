Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 65E49529B3
	for <meta-arago@arago-project.org>;
	Fri, 29 Mar 2013 15:05:58 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2TF5v8f025209
	for <meta-arago@arago-project.org>; Fri, 29 Mar 2013 10:05:57 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2TF5vGH003373
	for <meta-arago@arago-project.org>; Fri, 29 Mar 2013 10:05:57 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Fri, 29 Mar 2013 10:05:57 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [PATCH 1/2] linux: remove setup-defconfig includes
Thread-Index: AQHOLIsqshsAYKm6w0WV+bnDA/ovHZi8xKBA
Date: Fri, 29 Mar 2013 15:05:55 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594AFD25@DLEE11.ent.ti.com>
References: <1364567938-26710-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1364567938-26710-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] linux: remove setup-defconfig includes
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
X-List-Received-Date: Fri, 29 Mar 2013 15:05:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

BTW this patch depends on the patch to add this functionality in the base r=
ecipes submitted to meta-ti

> -----Original Message-----
> From: Maupin, Chase
> Sent: Friday, March 29, 2013 9:39 AM
> To: meta-arago@arago-project.org
> Cc: Maupin, Chase
> Subject: [PATCH 1/2] linux: remove setup-defconfig includes
>=20
> * Since the setup-defconfig.inc file has been moved to the
>   meta-ti layer the base recipes in meta-ti can be updated
>   to use that .inc file.  This means the bbappend files no
>   longer need to include this file.
> * Patch has already been submitted to use setup-defconfig.inc
>   in the base kernel recipes in meta-ti
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../linux-am335x_3.2.0-psp04.06.00.08.bbappend     |    3 +--
>  .../linux/linux-omap-psp_2.6.37.bbappend           |    3 +--
>  .../linux/linux-omapl138-psp_2.6.37.bbappend       |    3 +--
>  .../recipes-kernel/linux/linux_3.3.7.bbappend      |    3 +--
>  4 files changed, 4 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-kernel/linux/linux-
> am335x_3.2.0-psp04.06.00.08.bbappend b/meta-arago-distro/recipes-
> kernel/linux/linux-am335x_3.2.0-psp04.06.00.08.bbappend
> index c100597..431edcd 100644
> --- a/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-
> psp04.06.00.08.bbappend
> +++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-
> psp04.06.00.08.bbappend
> @@ -1,4 +1,4 @@
> -PR_append =3D "-arago1"
> +PR_append =3D "-arago2"
>=20
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${P}:"
>=20
> @@ -6,4 +6,3 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${P}:"
>  KVER =3D "${PV}"
>=20
>  require copy-defconfig.inc
> -require setup-defconfig.inc
> diff --git a/meta-arago-distro/recipes-kernel/linux/linux-omap-
> psp_2.6.37.bbappend b/meta-arago-distro/recipes-
> kernel/linux/linux-omap-psp_2.6.37.bbappend
> index c4daac1..8948157 100644
> --- a/meta-arago-distro/recipes-kernel/linux/linux-omap-
> psp_2.6.37.bbappend
> +++ b/meta-arago-distro/recipes-kernel/linux/linux-omap-
> psp_2.6.37.bbappend
> @@ -1,8 +1,7 @@
> -MACHINE_KERNEL_PR_append =3D "-arago0"
> +MACHINE_KERNEL_PR_append =3D "-arago1"
>=20
>  # KVER is used by arago-source-ipk.conf
>  KVER =3D "2.6.37"
>  PSPREL =3D "04.02.00.07"
>=20
>  require copy-defconfig.inc
> -require setup-defconfig.inc
> diff --git a/meta-arago-distro/recipes-kernel/linux/linux-
> omapl138-psp_2.6.37.bbappend b/meta-arago-distro/recipes-
> kernel/linux/linux-omapl138-psp_2.6.37.bbappend
> index e8b0606..5d3c3f7 100644
> --- a/meta-arago-distro/recipes-kernel/linux/linux-omapl138-
> psp_2.6.37.bbappend
> +++ b/meta-arago-distro/recipes-kernel/linux/linux-omapl138-
> psp_2.6.37.bbappend
> @@ -1,4 +1,4 @@
> -MACHINE_KERNEL_PR_append =3D "-arago0"
> +MACHINE_KERNEL_PR_append =3D "-arago3"
>=20
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${P}:"
>=20
> @@ -7,4 +7,3 @@ KVER =3D "2.6.37"
>  PSPREL =3D "03.21.00.04.sdk"
>=20
>  require copy-defconfig.inc
> -require setup-defconfig.inc
> diff --git a/meta-arago-distro/recipes-
> kernel/linux/linux_3.3.7.bbappend b/meta-arago-distro/recipes-
> kernel/linux/linux_3.3.7.bbappend
> index 6e1c92c..5d130ba 100644
> --- a/meta-arago-distro/recipes-kernel/linux/linux_3.3.7.bbappend
> +++ b/meta-arago-distro/recipes-kernel/linux/linux_3.3.7.bbappend
> @@ -1,4 +1,3 @@
> -PR_append =3D "-arago0"
> +PR_append =3D "-arago1"
>=20
>  require copy-defconfig.inc
> -require setup-defconfig.inc
> --
> 1.7.0.4


