Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id BC22752974
	for <meta-arago@arago-project.org>;
	Thu,  3 Jan 2013 20:08:16 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r03K8FHQ011124;
	Thu, 3 Jan 2013 14:08:15 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r03K8FDc012845;
	Thu, 3 Jan 2013 14:08:15 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Thu, 3 Jan 2013 14:08:15 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH] arago-source-ipk: Remove libgles-omap3
Thread-Index: AQHNvIVl4E+ot/BGoUKof65/UJ/sEJg4YupA
Date: Thu, 3 Jan 2013 20:08:14 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3598F6@DFLE09.ent.ti.com>
References: <1352250925-12259-1-git-send-email-fcooper@ti.com>
	<1352250925-12259-2-git-send-email-fcooper@ti.com>
In-Reply-To: <1352250925-12259-2-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] arago-source-ipk: Remove libgles-omap3
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
X-List-Received-Date: Thu, 03 Jan 2013 20:08:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

> -----Original Message-----
> From: Franklin S. Cooper Jr [mailto:fcooperjr27@gmail.com]
> Sent: Tuesday, November 06, 2012 7:15 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [PATCH] arago-source-ipk: Remove libgles-omap3
>=20
> * do_create_srcipk was causing build failures for libgles-omap3.
> * Remove libgles-omap3 from the list of packages that have sourceipk enab=
led
>   since it wasn't suppose to be enabled in the first place.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../conf/distro/arago-source-ipk.conf              |    3 ---
>  1 files changed, 0 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-a=
rago-
> distro/conf/distro/arago-source-ipk.conf
> index 7a36f1f..312f629 100644
> --- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
> +++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> @@ -262,9 +262,6 @@ CREATE_SRCIPK_pn-ti-audio-soc-example =3D "1"
>  SRCIPK_INSTALL_DIR_pn-ti-audio-soc-example =3D "audio-soc-example_${PV}"
>  SRCIPK_PACKAGE_ARCH_pn-ti-audio-soc-example =3D "${MACHINE_ARCH}"
>=20
> -CREATE_SRCIPK_pn-libgles-omap3 =3D "1"
> -SRCIPK_INSTALL_DIR_pn-libgles-omap3 =3D "component-sources/graphics-
> sdk_${PV}"
> -
>  CREATE_SRCIPK_pn-ti-c6run =3D "1"
>  SRCIPK_INSTALL_DIR_pn-ti-c6run =3D "component-sources/c6run_${PV}"
>  SRCIPK_PACKAGE_ARCH_pn-ti-c6run =3D "${MACHINE_ARCH}"
> --
> 1.7.0.4


