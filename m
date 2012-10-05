Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 01A3A529A1
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 13:14:39 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95DEdac016097;
	Fri, 5 Oct 2012 08:14:39 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95DEdEd009968;
	Fri, 5 Oct 2012 08:14:39 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 08:14:39 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] arago: Mask meta-oe lighttpd bbappend
Thread-Index: AQHNosI8GAPgkEDDtUqv3CImVxl15peqsRvQ
Date: Fri, 5 Oct 2012 13:14:37 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159248009@DLEE12.ent.ti.com>
References: <1349420004-21899-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349420004-21899-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] arago: Mask meta-oe lighttpd bbappend
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
X-List-Received-Date: Fri, 05 Oct 2012 13:14:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 05, 2012 1:53 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] arago: Mask meta-oe lighttpd
> bbappend
>=20
> * Meta-oe includes an append for lighttpd that adds systemd.
> * In master this is fixed since a new layer meta-systemd has been
> created
>   and the lighttpd bbappend that adds systemd has been moved
> there.

So this can be removed with the next stable branch update?

>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-
> arago-distro/conf/distro/arago.conf
> index 002f000..c5d826c 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -1,5 +1,5 @@
>  # Mask some broken recipes
> -BBMASK =3D "meta-ti/recipes-misc|meta-linaro/recipes-lamp"
> +BBMASK =3D "meta-ti/recipes-misc|meta-linaro/recipes-lamp|meta-
> oe/recipes-extended/lighttpd"
>=20
>  # Select external binary prebuilt Linaro toolchain
>  TCMODE =3D "external-arago"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

