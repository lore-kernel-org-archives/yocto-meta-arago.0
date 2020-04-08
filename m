Return-Path: <Ankur.Tyagi@gallagher.com>
Received: from AUS01-ME1-obe.outbound.protection.outlook.com
	(mail-eopbgr1360119.outbound.protection.outlook.com [40.107.136.119])
	by arago-project.org (Postfix) with ESMTPS id E2CB0529AD
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2020 01:08:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=oHK+OGGyYc646srR66QCo+PkdAKza1dhDB+iJBHkmJIUkGd/xhgWNiHgn7z6q3/nzYMIWcuI9KM379H5ahjQCxCBr90OQyTLC1VT5scjkWfa1TgOUFsxZeSFM84diYxu1MCxgzRL8LHUDZHIEpJI4d9RHiM9egRvEmSEdM+nSc62qreLGFFhzad/Byg5kFAVV9Bs2fyqxfP6Ge2ubobaDg4quzhGAG9kQ9/40SFc5qhRuGHr5lKypoFVIzB7PdRzyoXS5Knvq6Kjcsr7oqfcJMURC9Bytve4JXJIa+saOP4Q0ldYqAeh4S7uuokmrOAa6tys1O7XiTJGkclmIEkXIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=PR9guo3vFN35iG80d7vWzjd6FvgccbRPoQf7dy5U8Ts=;
	b=kYB0eXiTCR9kFEGSEIveMG7YK25w260ds5fOigvzpoZEiA2ycIN3CCXBlwK5lDMg3zyd+iNiVX0zEgsPCDV9fVNBGik/14IzWaqWiY6mAEAf5e1XV/h8T/8xv3QgutcgwnOuw00ALDs1DG2l9Y6+Bdwp+evumPRXp02OgWn5MDZsXLL0/ziju6sA/W9ZbKrcjFzNTVgz6JHED+RsKcPyPsIoTmbI0g8Ho+/9gc2ne3nQ2X+3fwK9FHu2Es6qcXJstmSgapYh1/HgXTeTYDhFzZXYHG7Kw6BbBaqEasWe/mVsbdSxNBqBcfxcRJntlxpUntARR2qVj3Qe4G6u7D+cpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=gallagher.com; dmarc=pass action=none
	header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=PR9guo3vFN35iG80d7vWzjd6FvgccbRPoQf7dy5U8Ts=;
	b=mQdDD97EZLRkW008cx9bsxI2C88EEsdMaAU4grfh+m4ipo7rqgbMXQ+B672kgpWzinLVu8I6oKBHyBpzRv6TwN/lChzVfQZm9nt9p+xFpC284fUJ8OXcppwWCsUBPk0IAHLm3KlGDyTYVXvPGO68ivNXLKBsJkXv5EIWgoONXfA=
Received: from SY2PR01MB2426.ausprd01.prod.outlook.com (52.134.169.12) by
	SY2PR01MB3018.ausprd01.prod.outlook.com (52.134.188.147) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2878.17; Wed, 8 Apr 2020 01:05:46 +0000
Received: from SY2PR01MB2426.ausprd01.prod.outlook.com
	([fe80::3407:62c6:60f2:878]) by SY2PR01MB2426.ausprd01.prod.outlook.com
	([fe80::3407:62c6:60f2:878%5]) with mapi id 15.20.2878.021;
	Wed, 8 Apr 2020 01:05:46 +0000
From: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [master][PATCH] arago.conf,
	packagegroup-arago-tisdk-qte: enable examples PACKAGECONFIG for
	qt5	modules
Thread-Index: AQHWDT/X29s0xnKZ40mM4HA7f1LIT6huZ65w
Date: Wed, 8 Apr 2020 01:05:46 +0000
Message-ID: <SY2PR01MB2426FA52445FE2AB9C08818FE5C00@SY2PR01MB2426.ausprd01.prod.outlook.com>
References: <1586307071-8916-1-git-send-email-denis@denix.org>
In-Reply-To: <1586307071-8916-1-git-send-email-denis@denix.org>
Accept-Language: en-NZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Ankur.Tyagi@gallagher.com; 
x-originating-ip: [139.180.103.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf7e118f-454e-4c33-3dcc-08d7db58f86a
x-ms-traffictypediagnostic: SY2PR01MB3018:
x-microsoft-antispam-prvs: <SY2PR01MB3018DDC9FF7721204388B453E5C00@SY2PR01MB3018.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0367A50BB1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SY2PR01MB2426.ausprd01.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(366004)(9686003)(55016002)(66556008)(64756008)(66476007)(33656002)(76116006)(66946007)(81166006)(66446008)(8936002)(5660300002)(81156014)(52536014)(498600001)(966005)(71200400001)(110136005)(53546011)(2906002)(26005)(6506007)(186003)(7696005)(86362001);
	DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: gallagher.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CG5b6hPAISuz022e/ui2PMYEo/4yasyU+LyZy72oRBAvftrGQ1NBh9pLb+RagbJXEwDYu/KAuQlCnbnl5K5LyTEt/7leG17SaRtF/IMHnrNYiGOvGh8WztV9KlnHfdvF7wi9U7KFdyphNQIsfCcaMW5k/wUeKBDukvMtP+FfASXYKquxLo1g4zuERv/031iWBxnfRytDzaJGdN01ThWIbPFIId6LOvBuJuJMYV9qnqTqMxbkRJsVs7ntfDEuZofUDa5jqxe7jZHOmkmcCW9G0YnIexmHgrJAH2iMNOiJTqXpugd8YuuXCSp5lsChpCpAuEsdokgF67e0euhxrHRiL2i2Ht9bKcwHrjb1JUkeZ+3ufotEp5dgzS8RBXOm2bilFlnnYG1Ha7lNlhm/Zvhcdrjo+9lnBr6puHo5BaE/WKkLE/8VPoMj/Q/gASSpS11TaC4DeBBRtUWC4azFiVY6Qed6j0QM6F9ZJeY1vzJzpI/Nha8uZWPKb9UjWXZP8zh09TSxp1xft7gmpmDpt1/Zdw==
x-ms-exchange-antispam-messagedata: zfKCm/kRuiV5UEM3/6OJ64w7Slv5aD4ly4T8Swm8hcoOt7W3vNSu1dzABgMI7laDvfGIaUUlpusJ5EDoMn38Ui6V8LEyRyUEQtsKjr9+AqUkhLXa71fnmr3Fv27gnUYH6A1WrPlhbo074jJRCgHaew==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7e118f-454e-4c33-3dcc-08d7db58f86a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2020 01:05:46.6892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wWnavfTbdX1kA7nTedGIj3gw+klLiIjt2vixbbiCx9ILBaaHX8CPRcsV2OM3Hs431IMh3NHWixR85Y6JGzGe8yz+E0a44d4QEGQvLB5yLO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY2PR01MB3018
Subject: Re: [master][PATCH] arago.conf, packagegroup-arago-tisdk-qte: enable examples PACKAGECONFIG for qt5	modules
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
X-List-Received-Date: Wed, 08 Apr 2020 01:08:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org <meta-arago-bounces@arago-
> project.org> On Behalf Of Denys Dmytriyenko
> Sent: Wednesday, 8 April 2020 12:51 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [master][PATCH] arago.conf, packagegroup-arago-tisd=
k-
> qte: enable examples PACKAGECONFIG for qt5 modules
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> qtdeclarative-examples is broken for now.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf                     | 12 ++++++=
+++++-
>  .../packagegroups/packagegroup-arago-tisdk-qte.bb            |  2 +-
>  2 files changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-
> distro/conf/distro/arago.conf
> index 3215fe7..05201f3 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -103,7 +103,17 @@ PACKAGECONFIG_DISTRO_pn-qtbase =3D "icu examples
> accessibility gif gbm kms libinpu  PACKAGECONFIG_FONTS_pn-qtbase =3D
> "fontconfig"
>=20
>  # Add gstreamer in package configuration to enable video -
> PACKAGECONFIG_append_pn-qtmultimedia  =3D " gstreamer"
> +PACKAGECONFIG_append_pn-qtmultimedia =3D " gstreamer"
> +
> +# Add examples in Qt5 package configurations
> +PACKAGECONFIG_append_pn-qtcharts =3D " examples"
> +#PACKAGECONFIG_append_pn-qtdeclarative =3D " examples"
> +PACKAGECONFIG_append_pn-qtlocation =3D " examples"
> +PACKAGECONFIG_append_pn-qtmultimedia =3D " examples"
> +PACKAGECONFIG_append_pn-qtscript =3D " examples"
> +PACKAGECONFIG_append_pn-qtserialport =3D " examples"
> +PACKAGECONFIG_append_pn-qtsvg =3D " examples"
> +PACKAGECONFIG_append_pn-qtwayland =3D " examples"

That means every image including Qt5 based on arago now have to override th=
ese
PACKAGECONFIG in bbappends as I don't expect anyone to include examples in =
their
production image.
Could this inclusion of examples in PACKAGECONFIG be handled in a better wa=
y that doesn't
impact other arago users? Somewhere inside packagegroup-arago-tisdk-qte?

Regards
Ankur

>  # Prefer OpenSSL over GnuTLS for curl due to TSU exemptions
> PACKAGECONFIG_pn-curl =3D "${@bb.utils.contains("DISTRO_FEATURES", "ipv6"=
,
> "ipv6", "", d)} ssl zlib"
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-qte.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-qte.bb
> index f83ac52..a2e3794 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-qte.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
> +++ sdk-qte.bb
> @@ -12,9 +12,9 @@ QT4_DEMOS =3D "\
>      ${@oe.utils.conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles',
> 'quick-playground', '', d)} \  "
>=20
> +#    qtdeclarative-examples
>  QT5_DEMOS =3D "\
>      qtbase-examples \
> -    qtdeclarative-examples \
>      qtdeclarative-tools \
>      qtlocation-examples \
>      qtmultimedia-examples \
> --
> 2.7.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

