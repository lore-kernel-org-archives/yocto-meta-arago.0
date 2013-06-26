Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 145E952A5D
	for <meta-arago@arago-project.org>;
	Wed, 26 Jun 2013 15:31:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5QFV2jg029896
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 10:31:02 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5QFV1Qw012204
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 10:31:01 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Wed, 26 Jun 2013 10:31:01 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Heroor, Siddharth" <heroor@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/2] glsdk: add the initial GLSDK branding
	policy
Thread-Index: AQHOclzLqxcUkxy4/U+TBBBUs/LnyplIGuYg
Date: Wed, 26 Jun 2013 15:31:01 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C4DE84B@DFLE08.ent.ti.com>
References: <1372244597-11600-1-git-send-email-heroor@ti.com>
	<1372244597-11600-3-git-send-email-heroor@ti.com>
In-Reply-To: <1372244597-11600-3-git-send-email-heroor@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] glsdk: add the initial GLSDK branding	policy
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
X-List-Received-Date: Wed, 26 Jun 2013 15:31:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Heroor, Siddharth
> Sent: Wednesday, June 26, 2013 6:03 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 2/2] glsdk: add the initial GLSDK branding p=
olicy
>=20
> * Choose ti-linux-glsdk as the preferred provider
>=20
> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> cc: Mrinmayee Hingolikar <mrinmayee@ti.com>
> ---
>  .../conf/distro/include/branding-glsdk.inc         |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)  create mode 100644 met=
a-
> arago-distro/conf/distro/include/branding-glsdk.inc
>=20
> diff --git a/meta-arago-distro/conf/distro/include/branding-glsdk.inc b/m=
eta-
> arago-distro/conf/distro/include/branding-glsdk.inc
> new file mode 100644
> index 0000000..d1c30f3
> --- /dev/null
> +++ b/meta-arago-distro/conf/distro/include/branding-glsdk.inc
> @@ -0,0 +1,4 @@
> +# GLSDK branding configuration
> +
> +# Use the SDK supported kernel and kernel version
> +PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-glsdk"

I am not familiar with the GLSDK but I am not sure why you need your own br=
anding include file. This patch shows you want to change the kernel but thi=
s really should be done in meta-ti within each of the machine configuration=
 files. I will let Denys comment but if you really can't put this within me=
ta-ti then you should at least make this statement machine or at least SOC =
specific.

Branding-amsdk.inc only exist due to the mainline effort for am335x. Curren=
tly the Sitara team supports am335x on the 3.2 kernel while the kernel team=
 is working on getting am335x in mainline. So satisfy both kernels the bran=
ding include file was created.

Unless your team's work falls in a similar situation there isn't a need to =
create this file. I personally don't like the branding include file and pla=
n on getting rid of the amsdk file once we release a mainline am335x SDK.

Also I don't see a recipe for linux-ti-glsdk within meta-ti.

> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

