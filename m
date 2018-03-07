Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 707D4529D5
	for <meta-arago@arago-project.org>;
	Wed,  7 Mar 2018 15:27:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w27FRAQB004559
	for <meta-arago@arago-project.org>; Wed, 7 Mar 2018 09:27:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520436430;
	bh=PYcPuIpLjMA8/KbB7lCEgd7lUT0A350YHoC6w5c/O3w=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=vrTevu8UdRVOPleIeQNPZ701N+Vkp4AXjYbmEd/MGK/XuziJi3sFVQes9WYQYohNP
	ootyKUMVY+uqD0qKqU184J7+7FqYTeSt6YapnBlPIGJpZAoZVlI9R9HycmS7prvtjv
	ORx0nJj9TGLSCbro+zKtV/dQ+AJkj/z0EitK8QUE=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w27FRAOp011153
	for <meta-arago@arago-project.org>; Wed, 7 Mar 2018 09:27:10 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 7 Mar 2018 09:27:10 -0600
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1261.035; Wed, 7 Mar 2018 09:27:10 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Molfetta, Stephen" <sjmolfetta@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [EXTERNAL] [meta-processor-sdk][master][PATCH]
	dra7xx: pdk: updating build install step
Thread-Index: AQHTtZ6ZOcvZF5toR0W946XdI0tpEqPFRn2A//+fm2A=
Date: Wed, 7 Mar 2018 15:27:10 +0000
Message-ID: <0d916cc0be634b2f97a0822ac7a384d8@ti.com>
References: <1520356764-17285-1-git-send-email-sjmolfetta@ti.com>
	<a16b7b7e-3f03-cc16-1d38-329d9e7e88cc@ti.com>
	<64637ec1c32842dfb7068ea6fe240e4a@ti.com>
	<6fd3c871bb8b4e919eb31f13db081540@ti.com>
	<8b50f265d4be42bdb9d462137d7fa983@ti.com>
In-Reply-To: <8b50f265d4be42bdb9d462137d7fa983@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.201]
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
X-List-Received-Date: Wed, 07 Mar 2018 15:27:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pushed.

> -----Original Message-----
> From: Molfetta, Stephen
> Sent: Wednesday, March 07, 2018 10:12 AM
> To: Stiffler, Jacob; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [EXTERNAL] [meta-processor-
> sdk][master][PATCH] dra7xx: pdk: updating build install step
>=20
> Can we expedite this review/merge, Jake?  This is a blocking item.
>=20
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Molfetta, Stephen
> Sent: Tuesday, March 06, 2018 4:58 PM
> To: Stiffler, Jacob; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [EXTERNAL] [meta-processor-
> sdk][master][PATCH] dra7xx: pdk: updating build install step
>=20
> Is there any chance this gets reviewed/merged today?  This is an urgent f=
ix
> needed.
>=20
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Molfetta, Stephen
> Sent: Tuesday, March 06, 2018 12:37 PM
> To: Stiffler, Jacob; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [EXTERNAL] [meta-processor-
> sdk][master][PATCH] dra7xx: pdk: updating build install step
>=20
> The files are already present in the current commit ID.  We just need the
> recipe update to pull in these files.  Only if we change the recipe to us=
e the
> 'make install' will we need to bump the commit ID.
>=20
> -----Original Message-----
> From: Stiffler, Jacob
> Sent: Tuesday, March 06, 2018 12:23 PM
> To: Molfetta, Stephen; meta-arago@arago-project.org
> Subject: Re: [EXTERNAL] [meta-arago] [meta-processor-
> sdk][master][PATCH] dra7xx: pdk: updating build install step
>=20
> Does this require a commit ID bump?
>=20
>=20
> On 3/6/2018 12:19 PM, Stephen Molfetta wrote:
> > DRA7xx PDK introduced a new build-related file and needs to install
> > this file into the package location
> > ---
> >   recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> > b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> > index b028e8c..3e8157d 100644
> > --- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> > +++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> > @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
> "file://makerules/env.mk;beginline=3D1;endline=3D31;md5=3D10503e8de
> >   require recipes-ti/includes/ti-paths.inc
> >
> >   PV =3D "01.00.00.08"
> > -PR =3D "r0"
> > +PR =3D "r1"
> >
> >   PDK_BUILD_GIT_URI =3D "git://git.ti.com/keystone-rtos/processor-pdk-
> build.git"
> >   PDK_BUILD_GIT_PROTOCOL =3D "git"
> > @@ -153,6 +153,7 @@ do_install_append_am57xx-hs-evm() {
> >   }
> >
> >   do_install_append_dra7xx() {
> > +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/dra7xx
> >       install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
> >       install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda3xx
> >       install -d
> > ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
> > @@ -165,6 +166,7 @@ do_install_append_dra7xx() {
> >       install -m 0755 makerules/rules_arp32.mk
> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
> >       install -m 0755 makerules/rules_ti_cgt_arm.mk
> > ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
> >
> > +    install -m 0755 dra7xx/linkcmd.xdt
> > + ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/dra7xx
> >       install -m 0755 tda2xx/config_tda2xx.bld
> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
> >       install -m 0755 tda2xx/config_tda2xx_a15.bld
> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
> >       install -m 0755 tda2xx/config_tda2xx_c66.bld
> > ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
> > @@ -175,7 +177,6 @@ do_install_append_dra7xx() {
> >       install -m 0755 tda2ex/config_tda2ex_a15.bld
> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
> >       install -m 0755 tda2ex/config_tda2ex_c66.bld
> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
> >       install -m 0755 tda2ex/mem_segment_definition_1024mb_bios.xs
> > ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
> > -
> >   }
> >
> >   do_install_append_keystone() {
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

