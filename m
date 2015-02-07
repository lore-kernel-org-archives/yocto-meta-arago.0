Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2C2A3529A4
	for <meta-arago@arago-project.org>;
	Sat,  7 Feb 2015 01:40:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t171eFTq004106
	for <meta-arago@arago-project.org>; Fri, 6 Feb 2015 19:40:15 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t171eEen022642
	for <meta-arago@arago-project.org>; Fri, 6 Feb 2015 19:40:14 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Fri, 6 Feb 2015 19:40:14 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH 1/3] matrix-gui-apps: Update latest commit to pull in
	Matrix apps description changes
Thread-Index: AQHQQOHbViY+6vji6kGpK9I5itNJFpzkbB5w
Date: Sat, 7 Feb 2015 01:40:14 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7FB6D0@DFLE08.ent.ti.com>
References: <1423099193-20065-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1423099193-20065-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] matrix-gui-apps: Update latest commit to pull in Matrix apps description changes
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
X-List-Received-Date: Sat, 07 Feb 2015 01:40:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this patchset. I'll send update versions. I need to bump comm=
it ids.

> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Wednesday, February 04, 2015 7:20 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [PATCH 1/3] matrix-gui-apps: Update latest commit to pull in Mat=
rix
> apps description changes
>=20
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-core/matrix/matrix-gui-apps-git.inc    |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.in=
c
> b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index 62db9aa..f39865f 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,9 +4,9 @@ LICENSE_CHECKSUM =3D
> "LICENSE;md5=3D6e0ae7214f6c74c149cb25f373057fa9"
>  LIC_FILES_CHKSUM :=3D "file://../${LICENSE_CHECKSUM}"
>=20
>  SRC_URI =3D "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-
> apps.git;protocol=3Dgit;branch=3D${BRANCH}"
> -SRCREV =3D "eb781aa9b59c2fc5e976c74e3d7398dc245b0912"
> +SRCREV =3D "400fddfd2f51e07b9832674c89a94c7aa3926af5"
>  BRANCH =3D "master"
> -INC_PR =3D "r25"
> +INC_PR =3D "r26"
>=20
>  # Pull in the base package for installing matrix applications  require m=
atrix-
> gui-apps.inc
> --
> 1.7.9.5


