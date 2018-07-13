Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 41C7452978
	for <meta-arago@arago-project.org>;
	Fri, 13 Jul 2018 18:11:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6DIBXSa045347
	for <meta-arago@arago-project.org>; Fri, 13 Jul 2018 13:11:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531505493;
	bh=RGbXpjmncc28olILeLRnhcd1QVfHAINlIQCKwHT56yc=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=PC7NqlhFCrqwrpLeVmS+//7crxeW5ok5X5vZk0LyV8j4wz/QEeIN2eMI2wtYnfo4w
	c0MkplBgz3b0JV/ykk2w+kPlg9khSII/SBE2hiAJ/2E9yj4AzdM0qrxP35pvE42/4J
	Mw1cubr5Tzi56SazQxsCpezQ2L8uOU2Aua3mXHE0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DIBXUW016026
	for <meta-arago@arago-project.org>; Fri, 13 Jul 2018 13:11:33 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 13 Jul 2018 13:11:33 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1466.003; Fri, 13 Jul 2018 13:11:33 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Zhao, Yuan" <yuanzhao@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [PATCH] ocl: update version to
	01.01.15.03
Thread-Index: AQHUGi6rMF8ahGp+8Eu9i80imCIHP6SNdXNg
Date: Fri, 13 Jul 2018 18:11:33 +0000
Message-ID: <f695310eb9b74331903f8f956e795f07@ti.com>
References: <20180712222110.144900-1-yuanzhao@ti.com>
In-Reply-To: <20180712222110.144900-1-yuanzhao@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.191]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [PATCH] ocl: update version to 01.01.15.03
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
X-List-Received-Date: Fri, 13 Jul 2018 18:11:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Can you please apply this set to the ti2018.01 branch?

Thank you,
Jake

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Zhao, Yuan
> Sent: Thursday, July 12, 2018 6:21 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [PATCH] ocl: update version to
> 01.01.15.03
>=20
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>  meta-arago-extras/recipes-ti/ocl/ocl.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-
> extras/recipes-ti/ocl/ocl.inc
> index 1fd705da..87a3e862 100644
> --- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
> +++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> @@ -1,4 +1,4 @@
> -PV =3D "1.1.15.2"
> +PV =3D "1.1.15.3"
>  INC_PR =3D "r0"
>=20
>  LIC_FILES_CHKSUM =3D
> "file://../debian/copyright;md5=3D2e3965a73a8a49c23836467266120dff"
> @@ -9,7 +9,7 @@ OCL_GIT_URI =3D "git://git.ti.com/opencl/ti-opencl.git"
>  OCL_GIT_PROTOCOL =3D "git"
>  OCL_GIT_BRANCH =3D "master"
>=20
> -OCL_SRCREV =3D "84f2e36f38eca46c6c376bacd757d45f2e5733f1"
> +OCL_SRCREV =3D "84da661abc3f9398bca9497aa13ec42604f7efd8"
>=20
>  BRANCH =3D "${OCL_GIT_BRANCH}"
>  SRC_URI =3D
> "${OCL_GIT_URI};protocol=3D${OCL_GIT_PROTOCOL};branch=3D${BRANCH}"
> --
> 2.14.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

