Return-Path: <hzhang@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6811052976
	for <meta-arago@arago-project.org>;
	Wed, 15 May 2013 18:41:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4FIfid7027167
	for <meta-arago@arago-project.org>; Wed, 15 May 2013 13:41:44 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4FIfiO0031928
	for <meta-arago@arago-project.org>; Wed, 15 May 2013 13:41:44 -0500
Received: from DLEE09.ent.ti.com ([fe80::d03e:3cf4:73ad:d589]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 15 May 2013 13:41:44 -0500
From: "Zhang, Hao" <hzhang@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] packagegroup-arago-tisdk-matrix: remove
	ethernet menu from common apps
Thread-Index: AQHOUZqPB/xmk8h/aUybCUwqnq5DH5kG5yOA//+sQdA=
Date: Wed, 15 May 2013 18:41:43 +0000
Message-ID: <ECA334CFBA16F74DB2C66A2F1181F4D63C2B6743@DLEE09.ent.ti.com>
References: <1368642748-30517-1-git-send-email-hzhang@ti.com>
	<20130515183733.GB20048@edge>
In-Reply-To: <20130515183733.GB20048@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] packagegroup-arago-tisdk-matrix: remove ethernet menu from common apps
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
X-List-Received-Date: Wed, 15 May 2013 18:41:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, we do, but the Ethernet demo description says it's ti33x specific demo=
, I tried it on KS2 evm and it's not working.=20

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Wednesday, May 15, 2013 2:38 PM
To: Zhang, Hao
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] packagegroup-arago-tisdk-matrix: remove e=
thernet menu from common apps

Don't you have ethernet on Keystone?

On Wed, May 15, 2013 at 02:32:28PM -0400, hzhang@ti.com wrote:
> From: Hao Zhang <hzhang@ti.com>
>=20
> ---
>  .../packagegroup-arago-tisdk-matrix.bb             |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-matrix.bb
> index dda72af..2b40f98 100755
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-matrix.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-matrix.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to include Matrix v2"
>  LICENSE =3D "MIT"
> -PR =3D "r15"
> +PR =3D "r16"
> =20
>  inherit packagegroup
> =20
> @@ -22,7 +22,6 @@ MATRIX_COMMON_APPS =3D "              \
>      matrix-gui-oprofile-demos       \
>      matrix-gui-settings-demos       \
>      matrix-gui-usb-demos            \
> -    matrix-gui-submenus-ethernet    \
>  "
> =20
>  MATRIX_QT_APPS =3D "                  \
> @@ -47,6 +46,7 @@ MATRIX_APPS_append_omap3 =3D "        \
>  "
> =20
>  MATRIX_APPS_append_ti33x =3D "        \
> +    matrix-gui-submenus-ethernet    \

So, what about other machines besides ti33x?


>      matrix-gui-ethernet-demos       \
>      ${@base_contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d=
)} \
>      matrix-gui-multimedia-demos     \
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

