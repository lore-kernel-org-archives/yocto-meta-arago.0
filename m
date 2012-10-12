Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id F057B529AA
	for <meta-arago@arago-project.org>;
	Fri, 12 Oct 2012 13:46:32 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9CDkWOw027366;
	Fri, 12 Oct 2012 08:46:32 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9CDkWDN014227;
	Fri, 12 Oct 2012 08:46:32 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 12 Oct 2012 08:46:31 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] arago.conf: Set preferred kernel version
	for	am335x
Thread-Index: AQHNqDf8eSLDn/R0z0ChhM5ugIybtJe1r3Yg
Date: Fri, 12 Oct 2012 13:46:30 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015925C385@DLEE12.ent.ti.com>
References: <1350020515-11721-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1350020515-11721-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH] arago.conf: Set preferred kernel version for	am335x
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
X-List-Received-Date: Fri, 12 Oct 2012 13:46:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 12, 2012 12:42 AM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH] arago.conf: Set preferred kernel
> version for am335x
>=20
> * For now linux-am335x_3.2.0-psp04.06.00.08 is not the default
> kernel for
>   am335x. Therefore, a PREFERRED_PROVIDER and PREFERRED_VERSION
> needs to
>   be set to make sure the Arago SDK picks up the right kernel.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-
> arago-distro/conf/distro/arago.conf
> index 48629f1..2188fde 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -36,6 +36,10 @@ ARAGO_QT_PROVIDER_armv7a =3D "qt4-embedded-gles"
>=20
>  PREFERRED_PROVIDER_qt4-embedded =3D "${ARAGO_QT_PROVIDER}"
>=20
> +# Use the SDK supported kernel and kernel version
> +PREFERRED_PROVIDER_virtual/kernel_am335x-evm =3D "linux-am335x"
> +PREFERRED_VERSION_virtual/kernel_am335x-evm =3D "3.2.0-
> psp04.06.00.08"
> +
>  # Use the SDK supported u-boot version
>  PREFERRED_VERSION_u-boot_am335x-evm =3D "2011.09-psp04.06.00.08"
>=20
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

