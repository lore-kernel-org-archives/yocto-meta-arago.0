Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8471652093
	for <meta-arago@arago-project.org>;
	Sat,  7 Feb 2015 23:53:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t17NrklT004394
	for <meta-arago@arago-project.org>; Sat, 7 Feb 2015 17:53:46 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t17NrjUP029656
	for <meta-arago@arago-project.org>; Sat, 7 Feb 2015 17:53:45 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Sat, 7 Feb 2015 17:53:45 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH] ti-tisdk-setup: Update commit to pull in create sd
	card script bug fix
Thread-Index: AQHQP9Eit/YrZJjX4kaddWKm9BSKhZzl4wiw
Date: Sat, 7 Feb 2015 23:53:45 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7FBC57@DFLE08.ent.ti.com>
References: <1422982059-8319-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1422982059-8319-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] ti-tisdk-setup: Update commit to pull in create sd card script bug fix
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
X-List-Received-Date: Sat, 07 Feb 2015 23:53:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ignore this patch.

> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Tuesday, February 03, 2015 10:48 AM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [PATCH] ti-tisdk-setup: Update commit to pull in create sd card =
script
> bug fix
>=20
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setu=
p.bb
> b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> index cc69e14..c9181ae 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> @@ -2,10 +2,10 @@ DESCRIPTION =3D "Package containing scripts to setup th=
e
> development host and targ  LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D
> "file://setup.sh;beginline=3D3;endline=3D31;md5=3Dfc4b04a33df6d892c9f4d4a=
9d92b9
> 45e"
>=20
> -PR =3D "r21"
> +PR =3D "r22"
>=20
>  BRANCH ?=3D "master"
> -SRCREV =3D "e1ed2178043e097b7a8b2ea073473db732494845"
> +SRCREV =3D "6123d91f076e2fd5bb523032908cc92dca49b0c1"
>  SRC_URI =3D "git://arago-project.org/git/projects/tisdk-setup-
> scripts.git;protocol=3Dgit;branch=3D${BRANCH}"
>=20
>  S =3D "${WORKDIR}/git/"
> --
> 1.7.9.5


