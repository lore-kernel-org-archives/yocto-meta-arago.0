Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 93FBB52987
	for <meta-arago@arago-project.org>;
	Thu, 19 Jul 2018 17:36:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHaNXu002310
	for <meta-arago@arago-project.org>; Thu, 19 Jul 2018 12:36:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021783;
	bh=8+u8Zi3+C2N0gqStODAyYrbM9klbNc8W1VxOqBR01vI=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=wxMs6lLHg/S3MMknFshzd01n+KwWiDoQuqv15Iy1fHUewG6oXNJ+gESoreqYihooU
	S3jcbVFfeZsOifAQK7CeMO6tTjCsxA5WiqUMaZyrnMYP1N5qMjtoLuu8rV2eybP2Ce
	CT08yqy0qxGqznYAC2jTIoDIi4S+Ks962BOD3kA8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHaNov003260
	for <meta-arago@arago-project.org>; Thu, 19 Jul 2018 12:36:23 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:36:23 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1466.003; Thu, 19 Jul 2018 12:36:23 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [master][meta-processor-sdk][PATCH 3/4]
	jailhouse: SRCREV bump
Thread-Index: AQHUH4X91xS/UGA1bkOZRBmdpGDguqSWzozg
Date: Thu, 19 Jul 2018 17:36:23 +0000
Message-ID: <7b10b517c55b4e20b794bee5aa6ee41e@ti.com>
References: <1532021329-48972-1-git-send-email-m-radhakrishnan2@ti.com>
	<1532021329-48972-4-git-send-email-m-radhakrishnan2@ti.com>
In-Reply-To: <1532021329-48972-4-git-send-email-m-radhakrishnan2@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.191]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [master][meta-processor-sdk][PATCH 3/4] jailhouse: SRCREV bump
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
X-List-Received-Date: Thu, 19 Jul 2018 17:36:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This change was already made  [1]. Please rebase you patches against the la=
test.

- Jake

[1] http://arago-project.org/git/projects/?p=3Dmeta-processor-sdk.git;a=3Dc=
ommitdiff;h=3D78d25dcb555ccdf64e131f0b35a0b31111ba3f4d

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Radhakrishnan, Mahesh
> Sent: Thursday, July 19, 2018 1:29 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [master][meta-processor-sdk][PATCH
> 3/4] jailhouse: SRCREV bump
>=20
> ---
>  recipes-support/jailhouse/jailhouse_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes-support/jailhouse/jailhouse_git.bb b/recipes-
> support/jailhouse/jailhouse_git.bb
> index b1c88bd..6c5cd14 100644
> --- a/recipes-support/jailhouse/jailhouse_git.bb
> +++ b/recipes-support/jailhouse/jailhouse_git.bb
> @@ -7,10 +7,10 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D9fa7f895f96bde2d47fd5b7d95b6ba4d"
>  BRANCH =3D "plsdk_am57xx"
>  SRC_URI =3D "git://git.ti.com/processor-sdk/jailhouse.git;branch=3D${BRA=
NCH}"
>=20
> -SRCREV =3D "238433e3f4203b23dc4bba9d09118a3608be1931"
> +SRCREV =3D "2ad429b04f30a082f206e0083c398f018467ef1c"
>=20
> -PV =3D "0.7"
> -PR =3D "r1"
> +PV =3D "0.8"
> +PR =3D "r0"
>=20
>  PACKAGES =3D+ "${PN}-drivers ${PN}-firmware ${PN}-examples"
>  RDEPENDS_${PN} +=3D "${PN}-drivers ${PN}-firmware"
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

