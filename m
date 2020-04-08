Return-Path: <Ankur.Tyagi@gallagher.com>
Received: from AUS01-ME1-obe.outbound.protection.outlook.com
	(mail-eopbgr1360128.outbound.protection.outlook.com [40.107.136.128])
	by arago-project.org (Postfix) with ESMTPS id 341C152A29
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2020 10:34:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=jch1VOCy2f8Su7nD0apWwqnflGtwK7rxxENuuhUDXZ+jxpeY/tvGDzY+N5L5dkCubSTKB9kl7RFkoN+1ii4YsNLxAKSw4WE0BG+dwGL/wxCKlqXHP2M3zNfNWYwiwJphBoO0Ab94KJ6mYzf908WR4SCe25udwiz2fS7UP6hz/AD4KbKYTkmzX1Z/ct4ryumIkS5SZNn8ULioKsX/UsMb2BTK3F0mqoxglCbMgKfou0m3JDrr8KSTMxh3BggAbf7XRkLWLuJSxJ1bs3nEuvgyWUkLBPb56scmpgSdMCPdyb9SpZvsgPJzq+/vZODkJS/97KjgIhGnpZhMBNqIgHBUQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jcID8iF3BNrceOo3hJ2JgWoWFaXhnqyAd6NCBmNmBJo=;
	b=MNngKYMM51mGQVg8vXOvtYn9p15w6MXzaMliD8ADDfXZQhgqmNHP/E3mXITsze1DNVDPhdXVG7Jk7T39xPXggrD3z2+BZOekWoXga8fKCe4c8zADxANudRme0CupmF5YCf9Ko3n+cQ5zrRP+bVxbKVHUanRC0kkjHIo/iBv3mbECfKGO8tz9fhujrfdNcdKP3ViyLLPL48NNAfGnyeBI1ykJlvql98VF+fQP7I0zHnCFLz45ykOajmH81kG3mB76UBBXCU25X69iPG+vjEz/S6aRbCeAomronN6D5YgPCYHLLCLOt5UEXy3vsXi7qp+SpnWVG+0O0RXtSt7Po7GlTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=gallagher.com; dmarc=pass action=none
	header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jcID8iF3BNrceOo3hJ2JgWoWFaXhnqyAd6NCBmNmBJo=;
	b=BAuS0cL8maEh+XvX+uzdB+H6hk5pt561Nyiz5eibUxPXSYsNSWBOGGhdupZxFFWuPyJp6BrzLxHA2XehcUoJA+AJDDmtzG1P1Z7MoO9akoWofSCBfy6Gcv1vLhWmzfnACVbCkWOht7W4TOlF4RMkC9Yl+276FMs4SSzKuE6hnOU=
Received: from SY2PR01MB2426.ausprd01.prod.outlook.com (52.134.169.12) by
	SY2PR01MB2763.ausprd01.prod.outlook.com (52.134.170.146) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2878.17; Wed, 8 Apr 2020 10:32:38 +0000
Received: from SY2PR01MB2426.ausprd01.prod.outlook.com
	([fe80::3407:62c6:60f2:878]) by SY2PR01MB2426.ausprd01.prod.outlook.com
	([fe80::3407:62c6:60f2:878%5]) with mapi id 15.20.2878.021;
	Wed, 8 Apr 2020 10:32:38 +0000
From: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
To: Denys Dmytriyenko <denys@ti.com>
Thread-Topic: [meta-arago] [master][PATCH] arago.conf,
	packagegroup-arago-tisdk-qte: enable examples PACKAGECONFIG for qt5
	modules
Thread-Index: AQHWDXdyx7yVHeg8XU+sSrlOTQUYHahvBo6w
Date: Wed, 8 Apr 2020 10:32:38 +0000
Message-ID: <SY2PR01MB2426CC13E6445DE22C94B3C9E5C00@SY2PR01MB2426.ausprd01.prod.outlook.com>
References: <1586307071-8916-1-git-send-email-denis@denix.org>
	<SY2PR01MB2426FA52445FE2AB9C08818FE5C00@SY2PR01MB2426.ausprd01.prod.outlook.com>
	<20200408072911.GT24070@beryl>
In-Reply-To: <20200408072911.GT24070@beryl>
Accept-Language: en-NZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Ankur.Tyagi@gallagher.com; 
x-originating-ip: [139.180.103.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2059443c-2335-4b50-d424-08d7dba82915
x-ms-traffictypediagnostic: SY2PR01MB2763:
x-microsoft-antispam-prvs: <SY2PR01MB2763CA047D6CDC10ECC1B9AAE5C00@SY2PR01MB2763.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0367A50BB1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SY2PR01MB2426.ausprd01.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(346002)(376002)(366004)(39850400004)(396003)(136003)(66946007)(76116006)(9686003)(186003)(71200400001)(81156014)(66446008)(55016002)(54906003)(316002)(52536014)(8676002)(66556008)(4326008)(26005)(64756008)(2906002)(66476007)(86362001)(53546011)(966005)(5660300002)(7696005)(6506007)(81166007)(6916009)(33656002)(478600001)(8936002);
	DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: gallagher.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6mVyM+LAPDT3PUrePgHW0nm3XIIxnp+WbEUWRd5+ykdxMEoHTEelhJ0q3DmZZ4tCYhhsrZnvrecrzWKLdG0whXhCbpIem7Sc2Fgl7ttVMxJfZ+LlaIHVLXz1VJ7+h5MHT/h3EueC6jmCiCA5R2N8WtKO3U1eED5f3bc4EgV7n/n6KiJSNtn6j32Zcd7emeDfLU5j8eqvqvLDad+y3Bp5Xxkl/bu6XIinD9HaCeuxuHzycjkqiS3s+oXUWvE4L6Q3I2YlkudvOJMF3IBjBpYUxF6+k7KTkPUYWO/cPYv99sCcgbBo9MUfNJioV31IqAo6xw5rgyvqh5Gs3qAbbZFupbbSsebxBQv9zPM16nGsIuveb1zpOssYeYytfWMlHlgFlN/JwzQiNwtfSi+eBi65kZcrNOjQWvsZLClR5G6uaYhgMx0KPI4OkIeCaeiYXUscDANUFDVqAgisN22wz2CtDzjyrLKcJlnwrnIxP7WgATAIPsbFy1zIH5jmlFjCrjboyyluAnn4I2igAvOru12gYw==
x-ms-exchange-antispam-messagedata: FtzZrNOyIkwWy9AP10yExqZqyLIzjitjo4WY9oyG+rsLFosmv8bH0EzWSbByiUg6JitCy5jNwjz0OKHKayqcFSxt9XSDCjcb3xPAxHaz6xipR+XVKxiz8Qqk4PGuLJGhShP+vRjBdzKVfxaYCnOUhQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2059443c-2335-4b50-d424-08d7dba82915
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2020 10:32:38.5270 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +rU7rXsbUpxkKhAJTeEHI2xPiC4qawnWJbMHnGHTeMQMF8+XVRYNf+douhFPragga5T3bgJhTaGAIYWjBcV4LqHoUBLOUZdh+GHc1LANa+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY2PR01MB2763
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [master][PATCH] arago.conf, packagegroup-arago-tisdk-qte: enable examples PACKAGECONFIG for qt5 modules
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
X-List-Received-Date: Wed, 08 Apr 2020 10:34:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Denys Dmytriyenko <denys@ti.com>
> Sent: Wednesday, 8 April 2020 7:29 PM
> To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
> Cc: Denys Dmytriyenko <denis@denix.org>; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [master][PATCH] arago.conf, packagegroup-arago-
> tisdk-qte: enable examples PACKAGECONFIG for qt5 modules
>=20
> On Wed, Apr 08, 2020 at 01:05:46AM +0000, Ankur Tyagi wrote:
> > Hi Denys
> >
> > > -----Original Message-----
> > > From: meta-arago-bounces@arago-project.org <meta-arago-
> bounces@arago-
> > > project.org> On Behalf Of Denys Dmytriyenko
> > > Sent: Wednesday, 8 April 2020 12:51 PM
> > > To: meta-arago@arago-project.org
> > > Subject: [meta-arago] [master][PATCH] arago.conf, packagegroup-arago-
> tisdk-
> > > qte: enable examples PACKAGECONFIG for qt5 modules
> > >
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > qtdeclarative-examples is broken for now.
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  meta-arago-distro/conf/distro/arago.conf                     | 12 ++=
+++++++++-
> > >  .../packagegroups/packagegroup-arago-tisdk-qte.bb            |  2 +-
> > >  2 files changed, 12 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-
> > > distro/conf/distro/arago.conf
> > > index 3215fe7..05201f3 100644
> > > --- a/meta-arago-distro/conf/distro/arago.conf
> > > +++ b/meta-arago-distro/conf/distro/arago.conf
> > > @@ -103,7 +103,17 @@ PACKAGECONFIG_DISTRO_pn-qtbase =3D "icu
> examples
> > > accessibility gif gbm kms libinpu  PACKAGECONFIG_FONTS_pn-qtbase =3D
> > > "fontconfig"
> > >
> > >  # Add gstreamer in package configuration to enable video -
> > > PACKAGECONFIG_append_pn-qtmultimedia  =3D " gstreamer"
> > > +PACKAGECONFIG_append_pn-qtmultimedia =3D " gstreamer"
> > > +
> > > +# Add examples in Qt5 package configurations
> > > +PACKAGECONFIG_append_pn-qtcharts =3D " examples"
> > > +#PACKAGECONFIG_append_pn-qtdeclarative =3D " examples"
> > > +PACKAGECONFIG_append_pn-qtlocation =3D " examples"
> > > +PACKAGECONFIG_append_pn-qtmultimedia =3D " examples"
> > > +PACKAGECONFIG_append_pn-qtscript =3D " examples"
> > > +PACKAGECONFIG_append_pn-qtserialport =3D " examples"
> > > +PACKAGECONFIG_append_pn-qtsvg =3D " examples"
> > > +PACKAGECONFIG_append_pn-qtwayland =3D " examples"
> >
> > That means every image including Qt5 based on arago now have to overrid=
e
> these
> > PACKAGECONFIG in bbappends as I don't expect anyone to include examples=
 in
> their
> > production image.
> > Could this inclusion of examples in PACKAGECONFIG be handled in a bette=
r
> way that doesn't
> > impact other arago users? Somewhere inside packagegroup-arago-tisdk-qte=
?
>=20
> That's not how it works. PACKAGECONFIG controls what gets built, and not =
what
> gets included into the images.
>=20
> This patch actually restores existing behavior - meta-qt5 used to enable
> examples for all qt5 modules, based on qtbase PACKAGECONFIG, which is
> already
> set above. Now meta-qt5 requires "examples" PACKAGECONFIG for each
> individual
> qt5 module.
>=20
> And packagegroup-arago-tisdk-qte below already had all corresponding
> examples
> packages listed to be added into our default image. But you are free not =
to
> include such packages into your production image - it's as simple as not
> listing them in corresponding RDEPENDS on IMAGE_INSTALL...
>=20

Ahh, thanks for explanation. So it will only add to build time which isn't =
of much
concern.

> --
> Denys
>=20
>=20
> > >  # Prefer OpenSSL over GnuTLS for curl due to TSU exemptions
> > > PACKAGECONFIG_pn-curl =3D "${@bb.utils.contains("DISTRO_FEATURES",
> "ipv6",
> > > "ipv6", "", d)} ssl zlib"
> > > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegrou=
p-
> > > arago-tisdk-qte.bb b/meta-arago-distro/recipes-
> > > core/packagegroups/packagegroup-arago-tisdk-qte.bb
> > > index f83ac52..a2e3794 100644
> > > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-
> > > tisdk-qte.bb
> > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-ti
> > > +++ sdk-qte.bb
> > > @@ -12,9 +12,9 @@ QT4_DEMOS =3D "\
> > >      ${@oe.utils.conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles'=
,
> > > 'quick-playground', '', d)} \  "
> > >
> > > +#    qtdeclarative-examples
> > >  QT5_DEMOS =3D "\
> > >      qtbase-examples \
> > > -    qtdeclarative-examples \
> > >      qtdeclarative-tools \
> > >      qtlocation-examples \
> > >      qtmultimedia-examples \
> > > --
> > > 2.7.4
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

