Return-Path: <xuj@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2F9FB529CA
	for <meta-arago@arago-project.org>;
	Fri, 10 Jun 2016 16:22:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5AGM2i5022050
	for <meta-arago@arago-project.org>; Fri, 10 Jun 2016 11:22:02 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5AGMJAc015842
	for <meta-arago@arago-project.org>; Fri, 10 Jun 2016 11:22:19 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Fri, 10 Jun 2016 11:22:19 -0500
From: "Xu, Jianzhong" <xuj@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] LINALG: removed 'mmv' from makefile.
Thread-Index: AQHRwcI9N29fMXtIn0W3vDa6YIphrJ/jOF2A//+scnA=
Date: Fri, 10 Jun 2016 16:22:19 +0000
Message-ID: <025FAFE323E47A42AFE6A51B24577A8A322EC784@DFLE12.ent.ti.com>
References: <1465416813-20165-1-git-send-email-xuj@ti.com>
	<20160610162041.GI2466@edge>
In-Reply-To: <20160610162041.GI2466@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] LINALG: removed 'mmv' from makefile.
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
X-List-Received-Date: Fri, 10 Jun 2016 16:22:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

LINALG's makefile uses non-standard utility 'mmv'. This commit removes it f=
rom the makefile.=20

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, June 10, 2016 12:21 PM
To: Xu, Jianzhong
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] LINALG: removed 'mmv' from makefile.

What does your subject mean?


On Wed, Jun 08, 2016 at 04:13:33PM -0400, Jianzhong Xu wrote:
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>  meta-arago-extras/recipes-ti/linalg/linalg.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-ti/linalg/linalg.inc b/meta-arago-=
extras/recipes-ti/linalg/linalg.inc
> index bb132dc..aa33923 100644
> --- a/meta-arago-extras/recipes-ti/linalg/linalg.inc
> +++ b/meta-arago-extras/recipes-ti/linalg/linalg.inc
> @@ -2,7 +2,7 @@ HOMEPAGE =3D "git://git.ti.com/dense-linear-algebra-libra=
ries/linalg.git"
>  LICENSE =3D "BSD-3-Clause"
> =20
>  PV =3D "1_2_0_0"
> -INC_PR =3D "r4"
> +INC_PR =3D "r5"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> @@ -12,7 +12,7 @@ require recipes-ti/includes/ti-staging.inc
>  BRANCH =3D "master"
>  SRC_URI =3D "git://git.ti.com/dense-linear-algebra-libraries/linalg.git;=
protocol=3Dgit;branch=3D${BRANCH}"
>  LIC_FILES_CHKSUM =3D "file://src/ti/linalg/docs/LINALG_1.2.0_manifest.ht=
ml;md5=3Df30895e41e5947c3439b1ad4cf4c8555"
> -SRCREV =3D "19bc67da92b66acc99941183868ffb0dc234a0e9"
> +SRCREV =3D "0833183162a47876a8f24532264da51010d80623"
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

