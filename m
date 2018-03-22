Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 79949529A2
	for <meta-arago@arago-project.org>;
	Thu, 22 Mar 2018 20:47:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2MKlMZj005659
	for <meta-arago@arago-project.org>; Thu, 22 Mar 2018 15:47:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521751643;
	bh=D4xMWonOPN7h3/247klTh2W71OmjR9z3HKAkTvFXs+0=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=bbW+ZOGK+Ir4IOIvLhyDUIWnZBC9wXWuNToGXz6yUwyQo/qXX1P8+1H2uu9cGFb+3
	+byvGEghJh63GfM7NGPkvkjBavtl1gAqtyFZrjODEi5a52pBPcVrIfYVByUGdcZPuW
	hiWXrhiLWA3TJScYW0A3VbHagv6iqapMzmStpP6I=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2MKlMSs011514
	for <meta-arago@arago-project.org>; Thu, 22 Mar 2018 15:47:22 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 22 Mar 2018 15:47:22 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1261.035; Thu, 22 Mar 2018 15:47:22 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH]
	ti-pdk-build-rtos: SRCREV bump to 01.00.00.08E
Thread-Index: AQHTwhFLCPMmRXEAHEOoy84rX7m16KPcuc0A
Date: Thu, 22 Mar 2018 20:47:22 +0000
Message-ID: <ca0ba63b1fa9412787a249e85b28141c@ti.com>
References: <1521745757-12789-1-git-send-email-m-radhakrishnan2@ti.com>
In-Reply-To: <1521745757-12789-1-git-send-email-m-radhakrishnan2@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.201]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] ti-pdk-build-rtos: SRCREV bump to 01.00.00.08E
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
X-List-Received-Date: Thu, 22 Mar 2018 20:47:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pushed. Thank you.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Radhakrishnan, Mahesh
> Sent: Thursday, March 22, 2018 3:09 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH] ti-
> pdk-build-rtos: SRCREV bump to 01.00.00.08E
>=20
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-t=
i/ti-
> pdk-build/ti-pdk-build-rtos_git.bb
> index 3914429..eeb32b6 100644
> --- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> +++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> @@ -4,15 +4,15 @@ LIC_FILES_CHKSUM =3D
> "file://makerules/env.mk;beginline=3D1;endline=3D31;md5=3D10503e8de
>=20
>  require recipes-ti/includes/ti-paths.inc
>=20
> -PV =3D "01.00.00.08D"
> +PV =3D "01.00.00.08E"
>  PR =3D "r0"
>=20
>  PDK_BUILD_GIT_URI =3D "git://git.ti.com/keystone-rtos/processor-pdk-
> build.git"
>  PDK_BUILD_GIT_PROTOCOL =3D "git"
>  PDK_BUILD_GIT_BRANCH =3D "master"
>=20
> -# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.08D"
> -PDK_BUILD_SRCREV =3D "6edbf0e85915230711124dbbc3b972495bf856a9"
> +# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.08E"
> +PDK_BUILD_SRCREV =3D "9622a097c143188cab74b8827461eafdf54f8ed9"
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

