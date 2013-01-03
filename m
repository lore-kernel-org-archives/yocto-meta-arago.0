Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1A168529AA
	for <meta-arago@arago-project.org>;
	Thu,  3 Jan 2013 20:13:07 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r03KD6OP011536;
	Thu, 3 Jan 2013 14:13:06 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r03KD6fu017503;
	Thu, 3 Jan 2013 14:13:06 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Thu, 3 Jan 2013 14:13:06 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH] matrix-gui-apps: Add audio capture demo
Thread-Index: AQHNwSXXVXCW1GHpqUKFL6gZiTJ465g4WwdQ
Date: Thu, 3 Jan 2013 20:13:05 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C35991A@DFLE09.ent.ti.com>
References: <1352759648-5276-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1352759648-5276-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] matrix-gui-apps: Add audio capture demo
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
X-List-Received-Date: Thu, 03 Jan 2013 20:13:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

> -----Original Message-----
> From: Franklin S. Cooper Jr [mailto:fcooperjr27@gmail.com]
> Sent: Monday, November 12, 2012 4:34 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [PATCH] matrix-gui-apps: Add audio capture demo
>=20
> * Update to the latest Matrix v2 apps commit.
> * This updated commit brings in a new audio capture demo.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-core/matrix/matrix-gui-apps-git.inc    |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.in=
c
> b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index ddbc7a7..63e73f2 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,9 +4,9 @@ LICENSE_CHECKSUM =3D
> "LICENSE;md5=3D6e0ae7214f6c74c149cb25f373057fa9"
>  LIC_FILES_CHKSUM :=3D "file://../${LICENSE_CHECKSUM}"
>=20
>  SRC_URI =3D "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-
> apps.git;protocol=3Dgit;branch=3D${BRANCH}"
> -SRCREV =3D "6a0c9776adfef03463535de6c7059d8525a336aa"
> +SRCREV =3D "df5b70b2f7cd97148855fe4d0508789c710bcc4e"
>  BRANCH =3D "master"
> -INC_PR =3D "r5"
> +INC_PR =3D "r6"
>=20
>  # Pull in the base package for installing matrix applications  require m=
atrix-
> gui-apps.inc
> --
> 1.7.0.4


