Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id D5EE95299B
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 19:20:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9EJKjmP022029
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 14:20:45 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EJKja6027250
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 14:20:45 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 14 Oct 2013 14:20:45 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 3/3] matrix-gui-apps-git: Update for AM437x
Thread-Index: AQHOyRCcQKEa3J3XCkOTn2qcQJdA55n0ksxA
Date: Mon, 14 Oct 2013 19:20:44 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C575FC4@DFLE08.ent.ti.com>
References: <1381780588-15865-1-git-send-email-Chase.Maupin@ti.com>
	<1381780588-15865-3-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1381780588-15865-3-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] matrix-gui-apps-git: Update for AM437x
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
X-List-Received-Date: Mon, 14 Oct 2013 19:20:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Monday, October 14, 2013 2:56 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 3/3] matrix-gui-apps-git: Update for AM437x
>=20
> * Pull in the latest script changes to get support for AM437x
>   multimedia example applications.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../recipes-core/matrix/matrix-gui-apps-git.inc    |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.in=
c
> b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index 0c639e9..c622faa 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,9 +4,9 @@ LICENSE_CHECKSUM =3D
> "LICENSE;md5=3D6e0ae7214f6c74c149cb25f373057fa9"
>  LIC_FILES_CHKSUM :=3D "file://../${LICENSE_CHECKSUM}"
>=20
>  SRC_URI =3D "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-
> apps.git;protocol=3Dgit;branch=3D${BRANCH}"
> -SRCREV =3D "e55b22aff35107d384c13322aa9f9cd637f543ca"
> +SRCREV =3D "dfd328c9e34aa3c01f39d76f8ae584d8bc8aacc1"
>  BRANCH =3D "master"
> -INC_PR =3D "r16"
> +INC_PR =3D "r17"
>=20
>  # Pull in the base package for installing matrix applications  require m=
atrix-gui-
> apps.inc
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

