Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id EC3D4529E3
	for <meta-arago@arago-project.org>;
	Thu,  2 Aug 2018 22:48:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w72MlwLM120538
	for <meta-arago@arago-project.org>; Thu, 2 Aug 2018 17:47:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1533250078;
	bh=UBzC8b2rAzwa96eQzZuwO/aDylsLjFyFI/rB9eND6HM=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=mHH/KIZ3+8gSdKTXuxjS7QY1m67dHwt+DbxMZIikfKdYqRHPAdL/Uki1Gq1T0IdR1
	vPIaPNbZH2MNZtguXwD5VGbs1koiyofyIGCo3EhgBwpxlROvtIH2CwF4jXsmMcvEHZ
	icifeiio9kPfbFGHv0xwb21rvca4AXqB2ak8yoz0=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w72MlwLG028485
	for <meta-arago@arago-project.org>; Thu, 2 Aug 2018 17:47:58 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 2 Aug 2018 17:47:58 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1466.003; Thu, 2 Aug 2018 17:47:58 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Murphy, Dan" <dmurphy@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [PATCH] optee: Update OPTEE tag to 3.2.0 and apply ti2018.03-rc1
	tag
Thread-Index: AQHUKpMEkicEvKLLq0SW2bfm4sTlBaStEHIA
Date: Thu, 2 Aug 2018 22:47:58 +0000
Message-ID: <29767ab9fcb44c3cbd9db74a4a41ac36@ti.com>
References: <20180802185959.24811-1-dmurphy@ti.com>
In-Reply-To: <20180802185959.24811-1-dmurphy@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.172.231]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [PATCH] optee: Update OPTEE tag to 3.2.0 and apply ti2018.03-rc1 tag
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
X-List-Received-Date: Thu, 02 Aug 2018 22:48:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ERROR: optee-os-3.2.0+gitAUTOINC+48952f9f76-r0.arago0 do_fetch: Fetcher fai=
lure: Unable to find revision 48952f9f76d885df4cb65f8479a4cf7dedf0ee54 in b=
ranch master even from upstream


> -----Original Message-----
> From: Murphy, Dan
> Sent: Thursday, August 2, 2018 3:00 PM
> To: meta-arago@arago-project.org
> Cc: Dmytriyenko, Denys; Murphy, Dan
> Subject: [PATCH] optee: Update OPTEE tag to 3.2.0 and apply ti2018.03-rc1=
 tag
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../recipes-security/optee/optee-client.bbappend              | 4 ++--
>  .../recipes-security/optee/optee-os_git.bbappend              | 4 ++--
>  .../recipes-security/optee/optee-test_git.bbappend            | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-security/optee/optee-client.bbappe=
nd
> b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
> index bb1f631d..52a6f588 100644
> --- a/meta-arago-distro/recipes-security/optee/optee-client.bbappend
> +++ b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
> @@ -5,7 +5,7 @@ SRC_URI =3D "git://git.ti.com/optee/ti-optee-
> client.git;branch=3D${BRANCH} \
>=20
>  LIC_FILES_CHKSUM =3D
> "file://${S}/LICENSE;md5=3D69663ab153298557a59c67a60a743e5b"
>=20
> -PV =3D "3.0.0+git${SRCPV}"
> +PV =3D "3.2.0+git${SRCPV}"
>=20
>  BRANCH =3D "ti_optee_client"
> -SRCREV =3D "09b69afa5e9e74aac39e383d74f14b4d61c90476"
> +SRCREV =3D "2d542f2074223fde918e68efa4a9ff37f927e604"
> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappe=
nd
> b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> index 655bd02e..ffbf0aeb 100644
> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> @@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>=20
>  PR_append =3D ".arago0"
>=20
> -PV =3D "3.1.0+git${SRCPV}"
> +PV =3D "3.2.0+git${SRCPV}"
>=20
>  is_armv7 =3D "1"
>  is_armv7_aarch64 =3D "0"
> @@ -11,7 +11,7 @@ SRC_URI =3D "git://git.ti.com/optee/ti-optee-
> os.git;branch=3D${BRANCH} \
>             file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>  "
>  BRANCH =3D "master"
> -SRCREV =3D "940a24375ba5357d34fea7196dba48eadaee9abd"
> +SRCREV =3D "48952f9f76d885df4cb65f8479a4cf7dedf0ee54"
>=20
>  ARMCORE =3D "CFG_ARM32_core=3Dy ta-targets=3Dta_arm32"
>  ARMCORE_aarch64 =3D "CFG_ARM64_core=3Dy ta-targets=3Dta_arm64"
> diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbap=
pend
> b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
> index e6d10735..f85c719b 100644
> --- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
> +++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
> @@ -6,7 +6,7 @@ SRC_URI =3D "git://git.ti.com/optee/ti-optee-
> test.git;branch=3D${BRANCH}"
>=20
>  SRC_URI +=3D "file://0001-host-xtest-Makefile-fix-COMPILE_NS_USER-not-be=
ing-
> se.patch"
>=20
> -PV =3D "3.1.0+git${SRCPV}"
> +PV =3D "3.2.0+git${SRCPV}"
>=20
>  BRANCH =3D "ti_optee_test"
>  SRCREV =3D "b284eedf4fa20c21403ececfe0a47af55fbaa5d8"
> --
> 2.17.0.582.gccdcbd54c


