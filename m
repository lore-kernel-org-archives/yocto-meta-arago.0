Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 99556529C0
	for <meta-arago@arago-project.org>;
	Wed, 18 Dec 2019 21:04:35 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBIL2wqZ097480
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 15:02:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576702978;
	bh=ykm54mAzq3rDQefH1AnMFCB+an5+BC5y6kMDbUZdo0c=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=ZRH6pXv3wg8NayN2UJ6Z1GxO5T9kgVsnb2ci+7XBAdop82Dbml6VIoXod8cYOV4mD
	ZlrHnZWDAXlPyCLD6gHxMn79lvBpGvtUxc4joXDTkvbjE1wy9XKAzPiTbONutEsdKH
	5HobmppnxUhWokJF3cLxuUy6uzCca7uQCXF2bMbA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBIL2wmf058881
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 15:02:58 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 18 Dec 2019 15:02:56 -0600
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%17]) with mapi id
	15.01.1847.003; Wed, 18 Dec 2019 15:02:56 -0600
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [master/thud/ti2019.05][PATCH] ti-tisdk-makefile:
	update pru-icss target
Thread-Index: AQHVteX8B1do2jH7ak+uhQhux85B+6fAYQQA
Date: Wed, 18 Dec 2019 21:02:56 +0000
Message-ID: <62b4cdfb2b41461d9ab1fe69e5881260@ti.com>
References: <1576700507-10385-1-git-send-email-j-stiffler@ti.com>
	<8195ea9c-8a91-39a5-9df4-de8f9cad45ef@ti.com>
In-Reply-To: <8195ea9c-8a91-39a5-9df4-de8f9cad45ef@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.67.211]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "Saulnier, Nick" <nsaulnier@ti.com>
Subject: Re: [master/thud/ti2019.05][PATCH] ti-tisdk-makefile: update pru-icss target
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
X-List-Received-Date: Wed, 18 Dec 2019 21:04:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This should be doable - this won't affect the builds.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> Sent: Wednesday, December 18, 2019 3:59 PM
> To: meta-arago@arago-project.org
> Cc: Saulnier, Nick
> Subject: Re: [meta-arago] [master/thud/ti2019.05][PATCH] ti-tisdk-makefil=
e:
> update pru-icss target
>=20
> Denys,
>=20
> Can you fast-track this into the ti2019.05 branch?
>=20
>=20
> Thank you,
>=20
> Jake
>=20
> On 12/18/2019 3:21 PM, Jacob Stiffler wrote:
> > * Update for recent changes to the recipe in meta-ti
> >
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >   .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss            =
 | 4 ++--
> >   .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb         =
 | 2 +-
> >   2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk=
-
> makefile/Makefile_pru-icss b/meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_pru-icss
> > index 9431004..10e5bf3 100644
> > --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_pru-icss
> > +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_pru-icss
> > @@ -7,7 +7,7 @@ pru-icss:
> >   	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru=
-
> icss*"`; \
> >   	for dir in examples pru_cape/pru_fw lib/src labs; \
> >   	do \
> > -		make -C $$dir
> PRU_CGT=3D$(LINUX_DEVKIT_PATH)/sysroots/__SDKMACHINE__-arago-
> linux/usr/share/ti/cgt-pru; \
> > +		make -C $$dir PRU_SSP=3D$$PWD
> PRU_CGT=3D$(LINUX_DEVKIT_PATH)/sysroots/__SDKMACHINE__-arago-
> linux/usr/share/ti/cgt-pru; \
> >   	done
> >
> >   pru-icss_clean:
> > @@ -17,7 +17,7 @@ pru-icss_clean:
> >   	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru=
-
> icss*"`; \
> >   	for dir in examples pru_cape/pru_fw lib/src labs; \
> >   	do \
> > -		make -C $$dir clean
> PRU_CGT=3D$(LINUX_DEVKIT_PATH)/sysroots/__SDKMACHINE__-arago-
> linux/usr/share/ti/cgt-pru; \
> > +		make -C $$dir clean PRU_SSP=3D$$PWD
> PRU_CGT=3D$(LINUX_DEVKIT_PATH)/sysroots/__SDKMACHINE__-arago-
> linux/usr/share/ti/cgt-pru; \
> >   	done
> >
> >   pru-icss_install: __PRU_ICSS_INSTALL_TARGET__
> > diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk=
-
> makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-ti=
sdk-
> makefile_1.0.bb
> > index 2468bb4..89ac752 100644
> > --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile_1.0.bb
> > +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile_1.0.bb
> > @@ -56,7 +56,7 @@ SRC_URI =3D "\
> >       file://Makefile_jailhouse \
> >   "
> >
> > -PR =3D "r102"
> > +PR =3D "r103"
> >
> >   MAKEFILES_MATRIX_GUI =3D "matrix-gui-browser \
> >                           refresh-screen \
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

