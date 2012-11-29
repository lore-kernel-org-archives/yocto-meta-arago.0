Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 0699752A8E
	for <meta-arago@arago-project.org>;
	Thu, 29 Nov 2012 16:53:29 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id qATGrS0w016985
	for <meta-arago@arago-project.org>; Thu, 29 Nov 2012 10:53:28 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qATGrSRl032210
	for <meta-arago@arago-project.org>; Thu, 29 Nov 2012 10:53:28 -0600
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Thu, 29 Nov 2012 10:53:28 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [PATCH] ti-crypto-examples: update to latest sources
Thread-Index: AQHNzaYsGD23CVEn7UaNsA+F1g7K8ZgBCMPA
Date: Thu, 29 Nov 2012 16:53:28 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101592E2C97@DLEE12.ent.ti.com>
References: <1354134190-20883-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1354134190-20883-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] ti-crypto-examples: update to latest sources
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
X-List-Received-Date: Thu, 29 Nov 2012 16:53:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Ignore this patch.  I have an update coming

Sincerely,
Chase Maupin
Software Applications
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: Maupin, Chase
> Sent: Wednesday, November 28, 2012 2:23 PM
> To: meta-arago@arago-project.org
> Cc: Maupin, Chase
> Subject: [PATCH] ti-crypto-examples: update to latest sources
>=20
> * Update to the latest sources which use a different method to
>   access the HW accelerators.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../ti-crypto-examples/ti-crypto-examples_git.bb   |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/ti-crypto-
> examples/ti-crypto-examples_git.bb b/meta-arago-extras/recipes-
> core/ti-crypto-examples/ti-crypto-examples_git.bb
> index a35524f..f6d49a8 100644
> --- a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-
> crypto-examples_git.bb
> +++ b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-
> crypto-examples_git.bb
> @@ -4,10 +4,10 @@ LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D
> "file://AES/aes_256.c;beginline=3D9;endline=3D35;md5=3D8edbb4dee965d2f2
> eb5ca2822addcae5"
>  SECTION =3D "console"
>=20
> -PR =3D "r0"
> +PR =3D "r1"
>=20
>  BRANCH ?=3D "master"
> -SRCREV =3D "d3cc223206367a02097c7ad4e997cf2bef975277"
> +SRCREV =3D "7d7092f14005da15f556ef52cad73fb7fd038d7a"
>=20
>  SRC_URI =3D "git://arago-project.org/git/projects/crypto-example-
> apps.git;protocol=3Dgit;branch=3D${BRANCH}"
>=20
> --
> 1.7.0.4


