Return-Path: <xuj@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 02AE35208C
	for <meta-arago@arago-project.org>;
	Thu,  2 Jun 2016 16:01:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u52G0sTf014424
	for <meta-arago@arago-project.org>; Thu, 2 Jun 2016 11:00:55 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u52G10pW016844
	for <meta-arago@arago-project.org>; Thu, 2 Jun 2016 11:01:00 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Thu, 2 Jun 2016 11:01:00 -0500
From: "Xu, Jianzhong" <xuj@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [master][PATCH] LINALG: Corrected offload tables
	for small memory model.
Thread-Index: AQHRvN8fQ46svqFheUa640KJmS/grZ/WpiEA//+vZkA=
Date: Thu, 2 Jun 2016 16:01:00 +0000
Message-ID: <025FAFE323E47A42AFE6A51B24577A8A322E9AC7@DFLE12.ent.ti.com>
References: <1464879463-2583-1-git-send-email-xuj@ti.com>
	<20160602154711.GK6057@edge>
In-Reply-To: <20160602154711.GK6057@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [master][PATCH] LINALG: Corrected offload tables for small memory model.
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
X-List-Received-Date: Thu, 02 Jun 2016 16:01:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes. It should go to krogoth as well.=20

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, June 02, 2016 11:47 AM
To: Xu, Jianzhong
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [master][PATCH] LINALG: Corrected offload tables =
for small memory model.

Should this also go to krogoth?

On Thu, Jun 02, 2016 at 10:57:43AM -0400, Jianzhong Xu wrote:
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>  meta-arago-extras/recipes-ti/linalg/linalg.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-ti/linalg/linalg.inc b/meta-arago-=
extras/recipes-ti/linalg/linalg.inc
> index 4e058e6..bb132dc 100644
> --- a/meta-arago-extras/recipes-ti/linalg/linalg.inc
> +++ b/meta-arago-extras/recipes-ti/linalg/linalg.inc
> @@ -2,7 +2,7 @@ HOMEPAGE =3D "git://git.ti.com/dense-linear-algebra-libra=
ries/linalg.git"
>  LICENSE =3D "BSD-3-Clause"
> =20
>  PV =3D "1_2_0_0"
> -INC_PR =3D "r3"
> +INC_PR =3D "r4"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> @@ -12,7 +12,7 @@ require recipes-ti/includes/ti-staging.inc
>  BRANCH =3D "master"
>  SRC_URI =3D "git://git.ti.com/dense-linear-algebra-libraries/linalg.git;=
protocol=3Dgit;branch=3D${BRANCH}"
>  LIC_FILES_CHKSUM =3D "file://src/ti/linalg/docs/LINALG_1.2.0_manifest.ht=
ml;md5=3Df30895e41e5947c3439b1ad4cf4c8555"
> -SRCREV =3D "5e7adc2d187df1a41fae5c23d7f3fedbb0ae039c"
> +SRCREV =3D "19bc67da92b66acc99941183868ffb0dc234a0e9"
> =20
>  DEPENDS =3D "common-csl-ip \
>             libarch \
> --=20
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

