Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A291B52AA9
	for <meta-arago@arago-project.org>;
	Tue,  2 Apr 2013 18:49:47 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r32Ink3s018434
	for <meta-arago@arago-project.org>; Tue, 2 Apr 2013 13:49:46 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r32InkCY029087
	for <meta-arago@arago-project.org>; Tue, 2 Apr 2013 13:49:46 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 2 Apr 2013 13:49:45 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Tue, 2 Apr 2013 13:49:46 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [PATCH] arago-test: make MACHINE specific architecture
Thread-Index: AQHOL8QPGrU6drovlEG50d0FIMPqlZjDRhTw
Date: Tue, 2 Apr 2013 18:49:44 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594B81CD@DLEE11.ent.ti.com>
References: <1364922228-2628-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1364922228-2628-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] arago-test: make MACHINE specific architecture
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
X-List-Received-Date: Tue, 02 Apr 2013 18:49:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Maupin, Chase
> Sent: Tuesday, April 02, 2013 12:04 PM
> To: meta-arago@arago-project.org
> Cc: Maupin, Chase
> Subject: [PATCH] arago-test: make MACHINE specific architecture
>=20
> * This packagegroup has MACHINE specific overrides so it should
>   have a machine specific architecture.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-test.bb       |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-test.bb b/meta-arago-
> distro/recipes-core/packagegroups/packagegroup-arago-test.bb
> index a7bfa09..ba98c17 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-test.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-test.bb
> @@ -1,9 +1,11 @@
>  DESCRIPTION =3D "Extended task to get System Test specific apps"
>  LICENSE =3D "MIT"
> -PR =3D "r3"
> +PR =3D "r4

Anyone else catch the typo :)

>=20
>  inherit packagegroup
>=20
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
>  ARAGO_TEST =3D "\
>      bonnie++ \
>      hdparm \
> --
> 1.7.0.4


