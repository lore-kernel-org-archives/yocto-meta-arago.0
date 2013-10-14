Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id CF1E4529BD
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 14:28:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9EESjAB017784;
	Mon, 14 Oct 2013 09:28:45 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EESi34032458;
	Mon, 14 Oct 2013 09:28:44 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 14 Oct 2013 09:28:44 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 9/9] README: update dependency information
	for	dylan base
Thread-Index: AQHOyHVcbsaxaK+d7UCvDyaOMxwkcJn0QRlA
Date: Mon, 14 Oct 2013 14:28:43 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5754FC@DFLE08.ent.ti.com>
References: <1381710923-22471-1-git-send-email-denis@denix.org>
	<1381710923-22471-10-git-send-email-denis@denix.org>
In-Reply-To: <1381710923-22471-10-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 9/9] README: update dependency information for	dylan base
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
X-List-Received-Date: Mon, 14 Oct 2013 14:28:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>


Should we also list the particular version of bitbake that should be used w=
ith these layers? I remember sometimes newer versions of bitbake that may w=
ork with meta-oe, meta-ti and oe-core master branch may not work on older b=
ranches.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Sunday, October 13, 2013 7:35 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 9/9] README: update dependency information
> for dylan base
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/README | 17 +++++++++++------  meta-arago-
> extras/README | 17 +++++++++++------
>  2 files changed, 22 insertions(+), 12 deletions(-)
>=20
> diff --git a/meta-arago-distro/README b/meta-arago-distro/README index
> f966cea..c7f505e 100644
> --- a/meta-arago-distro/README
> +++ b/meta-arago-distro/README
> @@ -1,22 +1,27 @@
>  meta-arago-distro provides Arago distribution configuration for TI SDK
> products
>=20
> -This layer works with the latest Yocto Project release (currently 1.3) a=
nd tracks
> -the stable/maintenance branches (currently "danny") of the corresponding
> layers:
> +This layer works with the latest Yocto Project release (currently 1.4)
> +and tracks the stable/maintenance branches (currently "dylan") of the
> corresponding layers:
>=20
>  URI: git://git.openembedded.org/openembedded-core
> -branch: danny
> +branch: dylan
>  revision: HEAD
>  layers: meta
>=20
>  URI: git://git.openembedded.org/meta-openembedded
> -branch: danny
> +branch: dylan
>  revision: HEAD
> -layers: meta-oe, toolchain-layer
> +layers: meta-oe, toolchain-layer, meta-networking
>=20
>  URI: git://arago-project.org/git/meta-ti
> -branch: danny
> +branch: dylan
>  revision: HEAD
>=20
> +URI: git://git.linaro.org/openembedded/meta-linaro
> +branch: dylan
> +revision: HEAD
> +layers: meta-linaro-toolchain
> +
>  Send pull requests to meta-arago@arago-project.org
>=20
>  Layer maintainers: Chase Maupin <chase.maupin@ti.com> diff --git a/meta-
> arago-extras/README b/meta-arago-extras/README index 52eaed4..3ec39da
> 100644
> --- a/meta-arago-extras/README
> +++ b/meta-arago-extras/README
> @@ -1,22 +1,27 @@
>  meta-arago-extras provides additional TI SDK applications that are distr=
o-
> agnostic
>=20
> -This layer works with the latest Yocto Project release (currently 1.3) a=
nd tracks
> -the stable/maintenance branches (currently "danny") of the corresponding
> layers:
> +This layer works with the latest Yocto Project release (currently 1.4)
> +and tracks the stable/maintenance branches (currently "dylan") of the
> corresponding layers:
>=20
>  URI: git://git.openembedded.org/openembedded-core
> -branch: danny
> +branch: dylan
>  revision: HEAD
>  layers: meta
>=20
>  URI: git://git.openembedded.org/meta-openembedded
> -branch: danny
> +branch: dylan
>  revision: HEAD
> -layers: meta-oe, toolchain-layers
> +layers: meta-oe, toolchain-layers, meta-networking
>=20
>  URI: git://arago-project.org/git/meta-ti
> -branch: danny
> +branch: dylan
>  revision: HEAD
>=20
> +URI: git://git.linaro.org/openembedded/meta-linaro
> +branch: dylan
> +revision: HEAD
> +layers: meta-linaro-toolchain
> +
>  Send pull requests to meta-arago@arago-project.org
>=20
>  Layer maintainers: Chase Maupin <chase.maupin@ti.com>
> --
> 1.8.3.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

