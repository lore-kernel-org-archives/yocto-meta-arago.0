Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 324B752978
	for <meta-arago@arago-project.org>;
	Fri, 13 Jul 2018 18:10:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6DIA6m3002606
	for <meta-arago@arago-project.org>; Fri, 13 Jul 2018 13:10:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531505406;
	bh=SZrtSYNPIygM8G4FKoGlc8pOPRGdLaeiIvJs/ajEkfg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Qqt2z1gME2Ipv9SgASFClcLGdDQfZfYSnV6g4zS5INNSjQN73xNJpuupm7etB5Ch7
	WRMB2OqeguSOy7zW7QopuY4QuIAwUoq2ZYtjphSOzNuKwMdAPv+DA7tF4eox4mR2a0
	6OuZfjCaDxwSVoC5V6FXjt9C42VidtO8NMmpt3Do=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DIA6UN013879
	for <meta-arago@arago-project.org>; Fri, 13 Jul 2018 13:10:06 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 13 Jul 2018 13:10:06 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1466.003; Fri, 13 Jul 2018 13:10:06 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [ti2018.01/rocko/master] [PATCH 1/4]
	matrix-gui-apps-git.inc: bump SRCREV to get tidl submenu and apps
Thread-Index: AQHUGhSuXe09NhY4V0KwjNcLpTmvk6SNdS/A
Date: Fri, 13 Jul 2018 18:10:06 +0000
Message-ID: <0ea71103760644a5aab9a6815740750a@ti.com>
References: <1531422891-23069-1-git-send-email-a0271529@ti.com>
In-Reply-To: <1531422891-23069-1-git-send-email-a0271529@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.191]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "Senicic, Djordje" <d-senicic1@ti.com>
Subject: Re: [EXTERNAL] [ti2018.01/rocko/master] [PATCH 1/4] matrix-gui-apps-git.inc: bump SRCREV to get tidl submenu and apps
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
X-List-Received-Date: Fri, 13 Jul 2018 18:10:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Can you please apply this set to the ti2018.01 branch?

Thank you,
Jake

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Gou, Hongmei
> Sent: Thursday, July 12, 2018 3:15 PM
> To: meta-arago@arago-project.org
> Cc: Gou, Hongmei; Senicic, Djordje
> Subject: [EXTERNAL] [meta-arago] [ti2018.01/rocko/master] [PATCH 1/4]
> matrix-gui-apps-git.inc: bump SRCREV to get tidl submenu and apps
>=20
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.in=
c
> b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index 210be27..1484299 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,9 +4,9 @@ LICENSE_CHECKSUM =3D
> "LICENSE;md5=3D6e0ae7214f6c74c149cb25f373057fa9"
>  LIC_FILES_CHKSUM :=3D "file://../${LICENSE_CHECKSUM}"
>=20
>  SRC_URI =3D "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-
> apps.git;protocol=3Dgit;branch=3D${BRANCH}"
> -SRCREV =3D "65fee8957447ae4e403ad324acf735d811b2c412"
> +SRCREV =3D "5a048c929e11465a261a9c483b7719754b1c917e"
>  BRANCH =3D "master"
> -INC_PR =3D "r52"
> +INC_PR =3D "r53"
>=20
>  # Pull in the base package for installing matrix applications
>  require matrix-gui-apps.inc
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

