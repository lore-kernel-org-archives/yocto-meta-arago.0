Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 23702529A4
	for <meta-arago@arago-project.org>;
	Sat,  7 Feb 2015 01:40:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t171eL5E011581
	for <meta-arago@arago-project.org>; Fri, 6 Feb 2015 19:40:21 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t171eKD4022668
	for <meta-arago@arago-project.org>; Fri, 6 Feb 2015 19:40:20 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Fri, 6 Feb 2015 19:40:19 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH 1/3] matrix-gui-apps: Update latest commit to pull in
	Matrix apps description changes
Thread-Index: AQHQQOHbViY+6vji6kGpK9I5itNJFpzkbGVw
Date: Sat, 7 Feb 2015 01:40:19 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7FB6D7@DFLE08.ent.ti.com>
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
X-List-Received-Date: Sat, 07 Feb 2015 01:40:22 -0000
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


