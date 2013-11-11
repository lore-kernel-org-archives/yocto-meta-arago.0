Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 54A2552A16
	for <meta-arago@arago-project.org>;
	Mon, 11 Nov 2013 18:53:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rABIrmNC013361
	for <meta-arago@arago-project.org>; Mon, 11 Nov 2013 12:53:48 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rABIrm7T016008
	for <meta-arago@arago-project.org>; Mon, 11 Nov 2013 12:53:48 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 11 Nov 2013 12:53:48 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 4/4] arago-test: add linaro-pm-qa-utils to
	test	packages
Thread-Index: AQHO3vh7SZr1wTzVrU6bhsRMtI0sPpogYEFQ
Date: Mon, 11 Nov 2013 18:53:47 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C59CF0B@DFLE08.ent.ti.com>
References: <1384189628-21944-1-git-send-email-Chase.Maupin@ti.com>
	<1384189628-21944-4-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1384189628-21944-4-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] arago-test: add linaro-pm-qa-utils to test	packages
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
X-List-Received-Date: Mon, 11 Nov 2013 18:53:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The current patch is fine as is but should there be another patch that make=
s ltp-ddt RDEPENDS on linaro-pm-qa-utils?

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Monday, November 11, 2013 11:07 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 4/4] arago-test: add linaro-pm-qa-utils to t=
est
> packages
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-test.bb       |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup=
-
> arago-test.bb
> index 35fa627..58ecd83 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> test.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> test.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Extended task to get System Test specific apps"
>  LICENSE =3D "MIT"
> -PR =3D "r9"
> +PR =3D "r10"
>=20
>  inherit packagegroup
>=20
> @@ -21,6 +21,7 @@ ARAGO_TEST =3D "\
>  ARAGO_TI_TEST =3D "\
>      ltp-ddt \
>      input-utils \
> +    linaro-pm-qa-utils \
>      "
>=20
>  ARAGO_TI_TEST_append_omap-a15 =3D " \
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

