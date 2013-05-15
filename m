Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id D36AA52A5D
	for <meta-arago@arago-project.org>;
	Wed, 15 May 2013 18:38:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4FIcWjT006131
	for <meta-arago@arago-project.org>; Wed, 15 May 2013 13:38:32 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4FIcWPA028047
	for <meta-arago@arago-project.org>; Wed, 15 May 2013 13:38:32 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Wed, 15 May 2013 13:38:31 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCHv3] arago-console: Adding pciutils package
Thread-Index: Ac5Q9Y2MWQrkiXv5SN6eVDVS5BdoSwAVCRgAABRq63A=
Date: Wed, 15 May 2013 18:38:31 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905491FBA4@DLEE11.ent.ti.com>
References: <4F9216F96E5DF9428610502835A9F4905491F83E@DLEE11.ent.ti.com>
	<20130515035340.GA5021@denix.org>
In-Reply-To: <20130515035340.GA5021@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCHv3] arago-console: Adding pciutils package
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
X-List-Received-Date: Wed, 15 May 2013 18:38:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Denys. I will pay attention to this .

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, May 14, 2013 11:54 PM
To: Nelson, Sam
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCHv3] arago-console: Adding pciutils package

So, it only looked perfect, but there were still some issues and I had to m=
assage the patch in, only because I already promised I'll take it...

1. You should submit patches against the mainline meta-arago, not against y=
our forked and work-in-progress personal tree. I.e. your PR was at r5 alrea=
dy, while the one in meta-arago is at r4, and you appear to have removed lt=
race from the list of ARAGO_UTILS.

2. The recipe in your tree has 755 permissions, which is wrong and happens =
when you edit files mounted from Windows. I see it quite a lot in your team=
 and you should probably stop doing it...

--
Denys


On Tue, May 14, 2013 at 10:52:06PM +0000, Nelson, Sam wrote:
>    pciutils provides very basic utilities for
>    querying the devices on the pci bus, when pci
>    interface is supported in the platform and
>    useful to be part of the console package
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-console.bb    |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-=
arago-console.bb
> index 5a80064..537f050 100755
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-con=
sole.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-con=
sole.bb
> @@ -1,6 +1,8 @@
>  DESCRIPTION =3D "Extended task to get more basic and console apps"
>  LICENSE =3D "MIT"
> -PR =3D "r5"
> +PR =3D "r6"
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
>  inherit packagegroup
> =20
> @@ -25,6 +27,7 @@ ARAGO_UTILS =3D "\
>      i2c-tools \
>      iproute2 \
>      strace \
> +    ${@base_contains('MACHINE_FEATURES', 'pci', 'pciutils', '',d)} \
>      "
> =20
>  ARAGO_SDK_PREREQ =3D "\
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20

