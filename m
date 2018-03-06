Return-Path: <sjmolfetta@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id CCAF452975
	for <meta-arago@arago-project.org>;
	Tue,  6 Mar 2018 22:58:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w26MwAKX024253
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 16:58:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520377090;
	bh=H8+4oJZRa+CLRHN8QJ8gyunmlB79AZ676PQouwHPcQo=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=qZv3IZ05KJIbenqB0kiQxaMUwxsAwtDmkcsY2crTnTFzJSjNJXsklr8jD7z/QQqMY
	pbCx5MULldOh9Wz1A7EKPJh86+J9jwul3OlIW52gh95/nQZ3i69UcSO9RrmUDOFeNR
	xg3NQNUWriwnL4axttqxPMlNxLQSo50FxLD+XW/4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26MwAir028061
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 16:58:10 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 6 Mar 2018 16:58:10 -0600
Received: from DLEE104.ent.ti.com ([fe80::1b8:1a58:6ede:b6f0]) by
	DLEE104.ent.ti.com ([fe80::1b8:1a58:6ede:b6f0%17]) with mapi id
	15.01.1261.035; Tue, 6 Mar 2018 16:58:10 -0600
From: "Molfetta, Stephen" <sjmolfetta@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [EXTERNAL] [meta-processor-sdk][master][PATCH]
	dra7xx: pdk: updating build install step
Thread-Index: AQHTtZ6YjYRkvLIf7E+0+Zv+iLe95Q==
Date: Tue, 6 Mar 2018 22:58:09 +0000
Message-ID: <6fd3c871bb8b4e919eb31f13db081540@ti.com>
References: <1520356764-17285-1-git-send-email-sjmolfetta@ti.com>
	<a16b7b7e-3f03-cc16-1d38-329d9e7e88cc@ti.com>
	<64637ec1c32842dfb7068ea6fe240e4a@ti.com>
In-Reply-To: <64637ec1c32842dfb7068ea6fe240e4a@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.135.85]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk][master][PATCH] dra7xx: pdk: updating build install step
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
X-List-Received-Date: Tue, 06 Mar 2018 22:58:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Is there any chance this gets reviewed/merged today?  This is an urgent fix=
 needed.

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Molfetta, Stephen
Sent: Tuesday, March 06, 2018 12:37 PM
To: Stiffler, Jacob; meta-arago@arago-project.org
Subject: Re: [meta-arago] [EXTERNAL] [meta-processor-sdk][master][PATCH] dr=
a7xx: pdk: updating build install step

The files are already present in the current commit ID.  We just need the r=
ecipe update to pull in these files.  Only if we change the recipe to use t=
he 'make install' will we need to bump the commit ID.

-----Original Message-----
From: Stiffler, Jacob
Sent: Tuesday, March 06, 2018 12:23 PM
To: Molfetta, Stephen; meta-arago@arago-project.org
Subject: Re: [EXTERNAL] [meta-arago] [meta-processor-sdk][master][PATCH] dr=
a7xx: pdk: updating build install step

Does this require a commit ID bump?


On 3/6/2018 12:19 PM, Stephen Molfetta wrote:
> DRA7xx PDK introduced a new build-related file and needs to install=20
> this file into the package location
> ---
>   recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> index b028e8c..3e8157d 100644
> --- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> +++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://makerules/env.mk;beginline=
=3D1;endline=3D31;md5=3D10503e8de
>   require recipes-ti/includes/ti-paths.inc
>  =20
>   PV =3D "01.00.00.08"
> -PR =3D "r0"
> +PR =3D "r1"
>  =20
>   PDK_BUILD_GIT_URI =3D "git://git.ti.com/keystone-rtos/processor-pdk-bui=
ld.git"
>   PDK_BUILD_GIT_PROTOCOL =3D "git"
> @@ -153,6 +153,7 @@ do_install_append_am57xx-hs-evm() {
>   }
>  =20
>   do_install_append_dra7xx() {
> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/dra7xx
>       install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
>       install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda3xx
>       install -d
> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
> @@ -165,6 +166,7 @@ do_install_append_dra7xx() {
>       install -m 0755 makerules/rules_arp32.mk ${D}${PDK_INSTALL_DIR_RECI=
PE}/packages/ti/build/makerules
>       install -m 0755 makerules/rules_ti_cgt_arm.mk=20
> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
>  =20
> +    install -m 0755 dra7xx/linkcmd.xdt=20
> + ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/dra7xx
>       install -m 0755 tda2xx/config_tda2xx.bld ${D}${PDK_INSTALL_DIR_RECI=
PE}/packages/ti/build/tda2xx
>       install -m 0755 tda2xx/config_tda2xx_a15.bld ${D}${PDK_INSTALL_DIR_=
RECIPE}/packages/ti/build/tda2xx
>       install -m 0755 tda2xx/config_tda2xx_c66.bld=20
> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
> @@ -175,7 +177,6 @@ do_install_append_dra7xx() {
>       install -m 0755 tda2ex/config_tda2ex_a15.bld ${D}${PDK_INSTALL_DIR_=
RECIPE}/packages/ti/build/tda2ex
>       install -m 0755 tda2ex/config_tda2ex_c66.bld ${D}${PDK_INSTALL_DIR_=
RECIPE}/packages/ti/build/tda2ex
>       install -m 0755 tda2ex/mem_segment_definition_1024mb_bios.xs
> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
> -
>   }
>  =20
>   do_install_append_keystone() {

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

