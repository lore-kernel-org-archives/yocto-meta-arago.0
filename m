Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id A0B8352975
	for <meta-arago@arago-project.org>;
	Wed,  7 Mar 2018 19:39:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w27JcNOG011979
	for <meta-arago@arago-project.org>; Wed, 7 Mar 2018 13:38:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520451504;
	bh=6+1lJbCquH3M0mdOJHeXzqfEh9Dh/OB/9z6fVPyimBQ=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=YSkEJg4lBU0GSfRo2+mY+aD29I7BiZB37UDrXQ0GSyYEH9kagRpzCOinSFiOV4J5d
	ltbK914xRbLRl4NzIQJgfYVgoGiEqimvqIEAxD9JhJWjNhdO2Ku8KrYJY3xqrY0DpP
	T/5c71hOcHHIAgMiUlU1VXM5+0PrRMueXTTMvJK8=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w27JcNFt024542
	for <meta-arago@arago-project.org>; Wed, 7 Mar 2018 13:38:23 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 7 Mar 2018 13:38:23 -0600
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1261.035; Wed, 7 Mar 2018 13:38:23 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH]
	ti-pdk-build-rtos: Updating the version to include fix for K2G-HS
Thread-Index: AQHTtkM8+dM4VGUxRUOTT6yyFReqJqPFKxmw
Date: Wed, 7 Mar 2018 19:38:23 +0000
Message-ID: <efa447695eb448658d41d06c8e223128@ti.com>
References: <1520447792-23191-1-git-send-email-m-radhakrishnan2@ti.com>
In-Reply-To: <1520447792-23191-1-git-send-email-m-radhakrishnan2@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.201]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] ti-pdk-build-rtos: Updating the version to include fix for K2G-HS
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
X-List-Received-Date: Wed, 07 Mar 2018 19:39:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pushed.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Radhakrishnan, Mahesh
> Sent: Wednesday, March 07, 2018 1:37 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH] ti-
> pdk-build-rtos: Updating the version to include fix for K2G-HS
>=20
> ---
>  recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-t=
i/ti-
> pdk-build/ti-pdk-build-rtos_git.bb
> index 3e8157d..4b2936f 100644
> --- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> +++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> @@ -5,14 +5,14 @@ LIC_FILES_CHKSUM =3D
> "file://makerules/env.mk;beginline=3D1;endline=3D31;md5=3D10503e8de
>  require recipes-ti/includes/ti-paths.inc
>=20
>  PV =3D "01.00.00.08"
> -PR =3D "r1"
> +PR =3D "r2"
>=20
>  PDK_BUILD_GIT_URI =3D "git://git.ti.com/keystone-rtos/processor-pdk-
> build.git"
>  PDK_BUILD_GIT_PROTOCOL =3D "git"
>  PDK_BUILD_GIT_BRANCH =3D "master"
>=20
>  # Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.08"
> -PDK_BUILD_SRCREV =3D "f68931ff82eb051fc026ae28b2555f3c581eb6b9"
> +PDK_BUILD_SRCREV =3D "beb1161f0d346fd0c079860c4aa543a033e74d0d"
>=20
>  BRANCH =3D "${PDK_BUILD_GIT_BRANCH}"
>  SRC_URI =3D
> "${PDK_BUILD_GIT_URI};protocol=3D${PDK_BUILD_GIT_PROTOCOL};branch=3D${B
> RANCH}"
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

