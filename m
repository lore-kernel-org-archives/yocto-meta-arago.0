Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id AE1A1520EA
	for <meta-arago@arago-project.org>;
	Wed, 13 Mar 2019 11:51:38 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2DBpTZ5103082
	for <meta-arago@arago-project.org>; Wed, 13 Mar 2019 06:51:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552477889;
	bh=k104ABXWSEMMrERYjxHNZA5LKP9asJ0AjxmHSJOcYqg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=CmnKS3CvtclNB2sz3PWqMdPHftcHlfs8BiJ/ye8xZdQBz8XHp8TG279n3M/tLn0RZ
	qw8rE9LTSdJd3vAR3rtAMqKX+QifAkJjUhww9JvVc4gBwFgDjqT2fvs4U4Nfq2gZhX
	54WDR6EPB2Umtcsbh8F8v/7ENtAAVhK7PDp7ul6U=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2DBpS08007242
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 13 Mar 2019 06:51:29 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 13 Mar 2019 06:51:28 -0500
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
	DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
	15.01.1591.008; Wed, 13 Mar 2019 06:51:28 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [rocko/master][PATCH]
	packagegroup-arago-tisdk-target: include gtk sdk only if sgx is
	included
Thread-Index: AQHU2TOY5N32jL4DJkuutFzKeynZIqYJcwFA
Date: Wed, 13 Mar 2019 11:51:28 +0000
Message-ID: <4a6834a7750043c49b3334063739da14@ti.com>
References: <1552344407-4932-1-git-send-email-e-ruei1@ti.com>
	<20190313002750.GK28041@beryl>
In-Reply-To: <20190313002750.GK28041@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.148]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [rocko/master][PATCH] packagegroup-arago-tisdk-target: include gtk sdk only if sgx is included
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
X-List-Received-Date: Wed, 13 Mar 2019 11:51:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Denys:

It is for rocko  immediately.  The same patch is required for thud as well.=
 I thought that everything goes to master will go to thud as well.

Best regards,

Eric


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, March 12, 2019 8:28 PM
To: Ruei, Eric
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [rocko/master][PATCH] packagegroup-arago-tisdk-ta=
rget: include gtk sdk only if sgx is included

Now I need to verify - is it meant for rocko or thud?

On Mon, Mar 11, 2019 at 06:46:47PM -0400, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-toolchain-tisdk-target.bb | 10 ++--=
------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroup=
s/packagegroup-arago-toolchain-tisdk-target.bb
> index 75c190d..a3c9377 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-too=
lchain-tisdk-target.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-too=
lchain-tisdk-target.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to build and install header and libs into the sdk"
>  LICENSE =3D "MIT"
> -PR =3D "r13"
> +PR =3D "r14"
> =20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
> @@ -12,12 +12,6 @@ QT_TOOLCHAIN_TARGET =3D "\
>  QT_TOOLCHAIN_TARGET_keystone =3D ""
>  QT_TOOLCHAIN_TARGET_omapl138 =3D ""
> =20
> -GTK_TOOLCHAIN_TARGET =3D "\
> -    packagegroup-arago-gtk-sdk-target \
> -"
> -GTK_TOOLCHAIN_TARGET_keystone =3D ""
> -GTK_TOOLCHAIN_TARGET_omapl138 =3D ""
> -
>  TISDK_TOOLCHAIN_BASE_TARGET =3D "\
>      packagegroup-arago-standalone-sdk-target \
>      packagegroup-arago-tisdk-multimedia-sdk-target \
> @@ -32,7 +26,7 @@ TISDK_TOOLCHAIN_EXTRA_TARGET_omapl138 =3D ""
> =20
>  RDEPENDS_${PN} =3D "\
>      ${QT_TOOLCHAIN_TARGET} \
> -    ${GTK_TOOLCHAIN_TARGET} \
> +    ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-gt=
k-sdk-target','',d)} \
>      ${TISDK_TOOLCHAIN_BASE_TARGET} \
>      ${TISDK_TOOLCHAIN_EXTRA_TARGET} \
>      ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-ti=
sdk-graphics-sdk-target','',d)} \
> --=20
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

