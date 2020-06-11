Return-Path: <Ankur.Tyagi@gallagher.com>
Received: from AUS01-SY3-obe.outbound.protection.outlook.com
	(mail-eopbgr1370090.outbound.protection.outlook.com [40.107.137.90])
	by arago-project.org (Postfix) with ESMTPS id 0D916529D1
	for <meta-arago@arago-project.org>;
	Thu, 11 Jun 2020 22:16:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=XrZG+U3H7GhQXCj46la5dS8ShrbEsTE3WnrDp1zQW5Dwj25Xx7HKh4tJJaMBEb0u9l3tEnrrtO0Rff2q4FxQdmfIp1rb1tS58Z84cVyFYAA5roDqbeGm32POOV4TSPl0V2L/+8BCX5iMSaz+m7391BcsfQ8bXE0CLWzcBI3hljHtdPH1B8Kf28PNBuszSpxlD8Z4WzItzarG4yidB5HysY7lpBknI8ODBroZZs28Kz9gLexi0EIoyQBaLdQWGLJdCxxfc7b+Q2bMO510cGvXu2+JbyfG+zsifNlFam1h/uIPINcFqyVV1esqlPT34wvcrQDE3aqeTmVybKOc4Vqb0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QBNjSXm/GTqQ3fFTJDvH/56gjAqFyFzXVXsViY169tE=;
	b=F/YuJS7TtvdxmZqQoo2DO4QkeQvj2oXoj2uF/rwin4xDsrdOlDapl0T/IbuViz17/KWuiJGp9EYsYoyprz81GyL/YgdcT44rGd1pIq2XnO4UDx7jsgYMLs/UfKpFLP4lV3MN2hkA47qNPVbrmx/2Pme0lb84hRM6nOhpG+Xt2Df4b50uEBKU1fBUF2Fob7L8euannoWnVlisHHiEBxM5ccov/JxghKjiFEV60cXvLsHY+BMjOjO9gPXqvpm/nk9NgaFvzW0G48eN2mKteC9UOIwu7Crzr7GoOuYRFMLCO32Jq4sXp1PtqITZyQ9CHkhkE3rokTNx3jmZaKOVVVLDMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=gallagher.com; dmarc=pass action=none
	header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QBNjSXm/GTqQ3fFTJDvH/56gjAqFyFzXVXsViY169tE=;
	b=ZOdWb98OWVj5vGvr4n8NLumbSkmBwi9BQF3+3Xq73K7C5fIcagKHA6ykGsZwDo7Y28LXK00fM2PY/ZsCOLGmeYBtuqRBcp8xcx6K5AeiwXeg3wiL0hCqXqY4dgPHY7kNIHT2VfVJqCfS91Mrf55pJk4B5nx38DH6gDpZNWmF5ck=
Received: from SYXPR01MB1088.ausprd01.prod.outlook.com (2603:10c6:0:9::17) by
	SYXPR01MB0845.ausprd01.prod.outlook.com (2603:10c6:0:c::9) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.3088.22; Thu, 11 Jun 2020 22:14:10 +0000
Received: from SYXPR01MB1088.ausprd01.prod.outlook.com
	([fe80::d4bf:2e94:579a:f482]) by
	SYXPR01MB1088.ausprd01.prod.outlook.com
	([fe80::d4bf:2e94:579a:f482%2]) with mapi id 15.20.3088.022;
	Thu, 11 Jun 2020 22:14:10 +0000
From: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago][dunfell/master PATCH] arago-source-ipk.inc: Use
	weak assignment to create source ipk file
Thread-Index: AQHWPhLLyTJpsJSeI0GDJQZQDyIq5KjT/xGA
Date: Thu, 11 Jun 2020 22:14:10 +0000
Message-ID: <SYXPR01MB1088337DA40FEE6F80B9246BE5800@SYXPR01MB1088.ausprd01.prod.outlook.com>
References: <20200609040222.47389-1-ankur.tyagi@gallagher.com>
In-Reply-To: <20200609040222.47389-1-ankur.tyagi@gallagher.com>
Accept-Language: en-NZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arago-project.org; dkim=none (message not signed)
	header.d=none;arago-project.org; dmarc=none action=none
	header.from=gallagher.com;
x-originating-ip: [139.180.92.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31d417f4-d3ac-4ecb-7af8-08d80e54c453
x-ms-traffictypediagnostic: SYXPR01MB0845:
x-microsoft-antispam-prvs: <SYXPR01MB0845B9B431AF2255BCDEA2C6E5800@SYXPR01MB0845.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0431F981D8
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: miUIyu8TGiWXfxrIWhhZil7D1S92iuJEbazNmXJGRWKLYMjCxPA9Stz5O7YbhSjvNbxHGkxSW+hX1ZfHNnSiYaW1OVT4zMpiyLvkHlMOeYMbHLDfwfJ5jv3EByf0RWYTJutP4Oy6DiZQEBaCdGnpJsbdPhNUZ4M9+yk/kFdJdyfdSFicBC7VULh78R0Wx7KkOg1adtMQxMEcaTDnY6A9fj86Jjm+3CXUWvEEgom7GXi4+YsZTUz7RHH4nK3Rfw/f0ifnp4//QepGFM1UV/jQxwJF4oQIBQMr5cdaHU5PmpwLG3dg+tHrY4KGm8nwshne
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SYXPR01MB1088.ausprd01.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(376002)(396003)(39850400004)(346002)(366004)(316002)(71200400001)(478600001)(52536014)(8936002)(8676002)(66946007)(66574014)(9686003)(66476007)(6916009)(66556008)(83380400001)(66446008)(6506007)(186003)(53546011)(26005)(64756008)(86362001)(76116006)(7696005)(2906002)(5660300002)(55016002)(33656002)(30864003)(559001)(579004);
	DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: eFM9+eA/xSIEV2Yg6QA11+MTSU2tgY5n0ZIE3rGMFtfYDewUigNzC6LY2Rj0AjAW570wdEg1wifn/VJjtSzuAJUn4V00DFufHOs4O1VJ00GaHNJRynLM6FXTy9/ABOSKedrzAKKrmwwajCh7FIhwdMntOZbRe3a7K5/pLWoCetLzp+CpbbZLQdVHLtwAwFsjLKm0GQw53Nld/cdO1n4Bi+MNVlzOY6GUCeTjcdIrhaCBU5RY8qiElmaBibzxzH2i3yobFO/o6E3E/yHhDXMtLPVfRF+EfjnGokHhh1nFf+Gu/C1VW4A6AovB1vlIZG/xdj5XjFePSEleo+bd6J5PeA++Qv3+vxy5uJmzrlbsqiLe2j2ImOCfTtBS24VVoyHb/81xYrOX0mK8pgLrbv2h9r7KC5fzzvdacL4NEwmn4uyxkzw2KO1UWOFLm6z3K2a7aPrk/JW1s8YoplUJM8WFIPJCgLgWS/mrgMujyJDchYm0TG9dkY84wfnwmXb5pSU/
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31d417f4-d3ac-4ecb-7af8-08d80e54c453
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2020 22:14:10.5412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /yzGDMu0XbcvRWP8TSKkw2UrmTL4FsuusS5RQbp8a8WHJ0cjwIjHW27zmGCSKMRoeQE0AvOS8YxsTLrW32FROAKwhZNv5wynMGjyyQWNoCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYXPR01MB0845
Subject: Re: [dunfell/master PATCH] arago-source-ipk.inc: Use weak assignment to create source ipk file
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
X-List-Received-Date: Thu, 11 Jun 2020 22:16:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

-----Original Message-----
From: Ankur Tyagi <ankur.tyagi@gallagher.com>=20
Sent: Tuesday, 9 June 2020 4:02 PM
To: meta-arago@arago-project.org
Cc: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
Subject: [meta-arago][dunfell/master PATCH] arago-source-ipk.inc: Use weak =
assignment to create source ipk file

This is to allow user to override(disable) them in their configuration.

Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
---
 .../conf/distro/include/arago-source-ipk.inc  | 504 +++++++++---------
 1 file changed, 252 insertions(+), 252 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/m=
eta-arago-distro/conf/distro/include/arago-source-ipk.inc
index c479a8c8..5ffdc982 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -40,371 +40,371 @@ INHERIT +=3D "sourceipk"
 SRCIPK_INCLUDE_EXTRAFILES =3D "0"
=20
 # Set source ipk packages and install directories
-CREATE_SRCIPK_pn-ti-tisdk-licenses =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-tisdk-licenses =3D "docs/licenses"
+CREATE_SRCIPK_pn-ti-tisdk-licenses ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-tisdk-licenses ?=3D "docs/licenses"
=20
-CREATE_SRCIPK_pn-matrix-gui =3D "1"
-SRCIPK_INSTALL_DIR_pn-matrix-gui =3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK_pn-matrix-gui ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-matrix-gui ?=3D "example-applications/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-ti-crypto-examples =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-crypto-examples =3D "example-applications/${PN}-$=
{PV}"
+CREATE_SRCIPK_pn-ti-crypto-examples ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-crypto-examples ?=3D "example-applications/${PN}-=
${PV}"
=20
-CREATE_SRCIPK_pn-qml-carinfo =3D "1"
-SRCIPK_INSTALL_DIR_pn-qml-carinfo =3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK_pn-qml-carinfo ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-qml-carinfo ?=3D "example-applications/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-quick-playground =3D "1"
-SRCIPK_INSTALL_DIR_pn-quick-playground =3D "example-applications/${PN}-${P=
V}"
+CREATE_SRCIPK_pn-quick-playground ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-quick-playground ?=3D "example-applications/${PN}-${=
PV}"
=20
-CREATE_SRCIPK_pn-qt-catalog =3D "1"
-SRCIPK_INSTALL_DIR_pn-qt-catalog =3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK_pn-qt-catalog ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-qt-catalog ?=3D "example-applications/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-qt-patientcare =3D "1"
-SRCIPK_INSTALL_DIR_pn-qt-patientcare =3D "example-applications/${PN}-${PV}=
"
+CREATE_SRCIPK_pn-qt-patientcare ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-qt-patientcare ?=3D "example-applications/${PN}-${PV=
}"
=20
-CREATE_SRCIPK_pn-qt-tstat =3D "1"
-SRCIPK_INSTALL_DIR_pn-qt-tstat =3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK_pn-qt-tstat ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-qt-tstat ?=3D "example-applications/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-dual-camera-demo =3D "1"
-SRCIPK_INSTALL_DIR_pn-dual-camera-demo =3D "example-applications/${PN}-${P=
V}"
+CREATE_SRCIPK_pn-dual-camera-demo ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-dual-camera-demo ?=3D "example-applications/${PN}-${=
PV}"
=20
-CREATE_SRCIPK_pn-evse-hmi =3D "1"
-SRCIPK_INSTALL_DIR_pn-evse-hmi =3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK_pn-evse-hmi ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-evse-hmi ?=3D "example-applications/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-protection-relays-hmi =3D "1"
-SRCIPK_INSTALL_DIR_pn-protection-relays-hmi =3D "example-applications/${PN=
}-${PV}"
+CREATE_SRCIPK_pn-protection-relays-hmi ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-protection-relays-hmi ?=3D "example-applications/${P=
N}-${PV}"
=20
-CREATE_SRCIPK_pn-mmwavegesture-hmi =3D "1"
-SRCIPK_INSTALL_DIR_pn-mmwavegesture-hmi =3D "example-applications/${PN}-${=
PV}"
+CREATE_SRCIPK_pn-mmwavegesture-hmi ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-mmwavegesture-hmi ?=3D "example-applications/${PN}-$=
{PV}"
=20
-CREATE_SRCIPK_pn-pdm-anomaly-detection =3D "1"
-SRCIPK_INSTALL_DIR_pn-pdm-anomaly-detection =3D "example-applications/${PN=
}-${PV}"
+CREATE_SRCIPK_pn-pdm-anomaly-detection ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-pdm-anomaly-detection ?=3D "example-applications/${P=
N}-${PV}"
=20
-CREATE_SRCIPK_pn-tiovx-app-host =3D "1"
-SRCIPK_INSTALL_DIR_pn-tiovx-app-host =3D "example-applications/${PN}-${PV}=
"
+CREATE_SRCIPK_pn-tiovx-app-host ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-tiovx-app-host ?=3D "example-applications/${PN}-${PV=
}"
=20
-CREATE_SRCIPK_pn-image-gallery =3D "1"
-SRCIPK_INSTALL_DIR_pn-image-gallery =3D "example-applications/${PN}"
+CREATE_SRCIPK_pn-image-gallery ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-image-gallery ?=3D "example-applications/${PN}"
=20
-CREATE_SRCIPK_pn-matrix-gui-browser =3D "1"
-SRCIPK_INSTALL_DIR_pn-matrix-gui-browser =3D "example-applications/${PN}-$=
{PV}"
+CREATE_SRCIPK_pn-matrix-gui-browser ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-matrix-gui-browser ?=3D "example-applications/${PN}-=
${PV}"
=20
-CREATE_SRCIPK_pn-refresh-screen =3D "1"
-SRCIPK_INSTALL_DIR_pn-refresh-screen =3D "example-applications/${PN}-${PV}=
"
+CREATE_SRCIPK_pn-refresh-screen ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-refresh-screen ?=3D "example-applications/${PN}-${PV=
}"
=20
-CREATE_SRCIPK_pn-am-sysinfo =3D "1"
-SRCIPK_INSTALL_DIR_pn-am-sysinfo =3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK_pn-am-sysinfo ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-am-sysinfo ?=3D "example-applications/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-oprofile-example =3D "1"
-SRCIPK_INSTALL_DIR_pn-oprofile-example =3D "example-applications/${PN}"
+CREATE_SRCIPK_pn-oprofile-example ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-oprofile-example ?=3D "example-applications/${PN}"
=20
-CREATE_SRCIPK_pn-arm-benchmarks =3D "1"
-SRCIPK_INSTALL_DIR_pn-arm-benchmarks =3D "example-applications/${PN}-${PV}=
"
+CREATE_SRCIPK_pn-arm-benchmarks ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-arm-benchmarks ?=3D "example-applications/${PN}-${PV=
}"
=20
-CREATE_SRCIPK_pn-omapconf =3D "1"
-SRCIPK_INSTALL_DIR_pn-omapconf =3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK_pn-omapconf ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-omapconf ?=3D "example-applications/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-ti-pru-sw-examples =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-pru-sw-examples =3D "example-applications/pru-${P=
V}"
+CREATE_SRCIPK_pn-ti-pru-sw-examples ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-pru-sw-examples ?=3D "example-applications/pru-${=
PV}"
=20
-CREATE_SRCIPK_pn-ti-ocf-crypto-module =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-ocf-crypto-module =3D "board-support/extra-driver=
s/${PN}-${PV}"
+CREATE_SRCIPK_pn-ti-ocf-crypto-module ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-ocf-crypto-module ?=3D "board-support/extra-drive=
rs/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-omap3-sgx-modules =3D "1"
-SRCIPK_INSTALL_DIR_pn-omap3-sgx-modules =3D "board-support/extra-drivers/s=
gx-modules-${PV}"
+CREATE_SRCIPK_pn-omap3-sgx-modules ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-omap3-sgx-modules ?=3D "board-support/extra-drivers/=
sgx-modules-${PV}"
=20
-CREATE_SRCIPK_pn-ti-compat-wireless-wl18xx =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-compat-wireless-wl18xx =3D "board-support/extra-d=
rivers/${PN}-${PV}"
+CREATE_SRCIPK_pn-ti-compat-wireless-wl18xx ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-compat-wireless-wl18xx ?=3D "board-support/extra-=
drivers/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-wl18xx-fw =3D "1"
-SRCIPK_INSTALL_DIR_pn-wl18xx-fw =3D "board-support/extra-drivers/${PN}-${P=
V}"
+CREATE_SRCIPK_pn-wl18xx-fw ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-wl18xx-fw ?=3D "board-support/extra-drivers/${PN}-${=
PV}"
=20
-CREATE_SRCIPK_pn-wl1271-wlan-cli =3D "1"
-SRCIPK_INSTALL_DIR_pn-wl1271-wlan-cli =3D "example-applications/wlan"
+CREATE_SRCIPK_pn-wl1271-wlan-cli ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-wl1271-wlan-cli ?=3D "example-applications/wlan"
=20
-CREATE_SRCIPK_pn-av-examples =3D "1"
-SRCIPK_INSTALL_DIR_pn-av-examples =3D "example-applications/av-examples-${=
PV}"
+CREATE_SRCIPK_pn-av-examples ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-av-examples ?=3D "example-applications/av-examples-$=
{PV}"
=20
-CREATE_SRCIPK_pn-u-boot =3D "1"
-SRCIPK_INSTALL_DIR_pn-u-boot =3D "board-support/u-boot-${PV}"
+CREATE_SRCIPK_pn-u-boot ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-u-boot ?=3D "board-support/u-boot-${PV}"
 # For beagleboard we use the git version which doesn't define UVER
-SRCIPK_INSTALL_DIR_pn-u-boot_beagleboard =3D "board-support/${P}"
+SRCIPK_INSTALL_DIR_pn-u-boot_beagleboard ?=3D "board-support/${P}"
=20
-CREATE_SRCIPK_pn-x-load =3D "1"
-SRCIPK_INSTALL_DIR_pn-x-load =3D "board-support/x-load-${XVER}-psp${PSPREL=
}"
+CREATE_SRCIPK_pn-x-load ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-x-load ?=3D "board-support/x-load-${XVER}-psp${PSPRE=
L}"
 # For beagleboard we use the git version which doesn't define XVER
-SRCIPK_INSTALL_DIR_pn-x-load_beagleboard =3D "board-support/${P}"
+SRCIPK_INSTALL_DIR_pn-x-load_beagleboard ?=3D "board-support/${P}"
=20
-CREATE_SRCIPK_pn-u-boot-ti-staging =3D "1"
-SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging =3D "board-support/u-boot-${PV}${U=
BOOT_LOCALVERSION}"
-SRCIPK_PRESERVE_GIT_pn-u-boot-ti-staging =3D "true"
+CREATE_SRCIPK_pn-u-boot-ti-staging ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging ?=3D "board-support/u-boot-${PV}${=
UBOOT_LOCALVERSION}"
+SRCIPK_PRESERVE_GIT_pn-u-boot-ti-staging ?=3D "true"
=20
-CREATE_SRCIPK_pn-u-boot-keystone =3D "1"
-SRCIPK_INSTALL_DIR_pn-u-boot-keystone =3D "board-support/u-boot-${PV}"
-SRCIPK_PRESERVE_GIT_pn-u-boot-keystone =3D "true"
+CREATE_SRCIPK_pn-u-boot-keystone ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-u-boot-keystone ?=3D "board-support/u-boot-${PV}"
+SRCIPK_PRESERVE_GIT_pn-u-boot-keystone ?=3D "true"
=20
-CREATE_SRCIPK_pn-u-boot-dra7xx =3D "1"
-SRCIPK_INSTALL_DIR_pn-u-boot-dra7xx =3D "board-support/u-boot-${PV}-${PR}"
+CREATE_SRCIPK_pn-u-boot-dra7xx ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-u-boot-dra7xx ?=3D "board-support/u-boot-${PV}-${PR}=
"
=20
-CREATE_SRCIPK_pn-arm-trusted-firmware =3D "1"
-SRCIPK_INSTALL_DIR_pn-arm-trusted-firmware =3D "board-support/${PN}-${PV}"
-SRCIPK_PRESERVE_GIT_pn-arm-trusted-firmware =3D "true"
+CREATE_SRCIPK_pn-arm-trusted-firmware ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-arm-trusted-firmware ?=3D "board-support/${PN}-${PV}=
"
+SRCIPK_PRESERVE_GIT_pn-arm-trusted-firmware ?=3D "true"
=20
-CREATE_SRCIPK_pn-linux-ti-staging =3D "1"
-SRCIPK_INSTALL_DIR_pn-linux-ti-staging =3D "board-support/linux-${PV}${KER=
NEL_LOCALVERSION}"
-SRCIPK_PRESERVE_GIT_pn-linux-ti-staging =3D "true"
-SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging =3D "true"
+CREATE_SRCIPK_pn-linux-ti-staging ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-linux-ti-staging ?=3D "board-support/linux-${PV}${KE=
RNEL_LOCALVERSION}"
+SRCIPK_PRESERVE_GIT_pn-linux-ti-staging ?=3D "true"
+SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging ?=3D "true"
=20
-CREATE_SRCIPK_pn-linux-ti-staging-rt =3D "1"
-SRCIPK_INSTALL_DIR_pn-linux-ti-staging-rt =3D "board-support/linux-rt-${PV=
}${KERNEL_LOCALVERSION}"
-SRCIPK_PRESERVE_GIT_pn-linux-ti-staging-rt =3D "true"
-SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging-rt =3D "true"
+CREATE_SRCIPK_pn-linux-ti-staging-rt ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-linux-ti-staging-rt ?=3D "board-support/linux-rt-${P=
V}${KERNEL_LOCALVERSION}"
+SRCIPK_PRESERVE_GIT_pn-linux-ti-staging-rt ?=3D "true"
+SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging-rt ?=3D "true"
=20
-CREATE_SRCIPK_pn-linux-ti-staging-systest =3D "1"
-SRCIPK_INSTALL_DIR_pn-linux-ti-staging-systest =3D "board-support/linux-sy=
stest-${PV}${KERNEL_LOCALVERSION}"
-SRCIPK_PRESERVE_GIT_pn-linux-ti-staging-systest =3D "true"
-SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging-systest =3D "true"
+CREATE_SRCIPK_pn-linux-ti-staging-systest ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-linux-ti-staging-systest ?=3D "board-support/linux-s=
ystest-${PV}${KERNEL_LOCALVERSION}"
+SRCIPK_PRESERVE_GIT_pn-linux-ti-staging-systest ?=3D "true"
+SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging-systest ?=3D "true"
=20
-CREATE_SRCIPK_pn-sitara-linux-ti-staging =3D "1"
-SRCIPK_INSTALL_DIR_pn-sitara-linux-ti-staging =3D "board-support/linux-${P=
V}${KERNEL_LOCALVERSION}"
-SRCIPK_PRESERVE_GIT_pn-sitara-linux-ti-staging =3D "true"
-SRCIPK_SHALLOW_CLONE_pn-sitara-linux-ti-staging =3D "true"
-SRCIPK_SHALLOW_DEPTH_pn-sitara-linux-ti-staging =3D "400"
+CREATE_SRCIPK_pn-sitara-linux-ti-staging ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-sitara-linux-ti-staging ?=3D "board-support/linux-${=
PV}${KERNEL_LOCALVERSION}"
+SRCIPK_PRESERVE_GIT_pn-sitara-linux-ti-staging ?=3D "true"
+SRCIPK_SHALLOW_CLONE_pn-sitara-linux-ti-staging ?=3D "true"
+SRCIPK_SHALLOW_DEPTH_pn-sitara-linux-ti-staging ?=3D "400"
=20
-CREATE_SRCIPK_pn-linux-keystone =3D "1"
-SRCIPK_INSTALL_DIR_pn-linux-keystone =3D "board-support/linux-${PV}"
-SRCIPK_PRESERVE_GIT_pn-linux-keystone =3D "true"
+CREATE_SRCIPK_pn-linux-keystone ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-linux-keystone ?=3D "board-support/linux-${PV}"
+SRCIPK_PRESERVE_GIT_pn-linux-keystone ?=3D "true"
=20
-CREATE_SRCIPK_pn-linux-am335x-psp =3D "1"
-SRCIPK_INSTALL_DIR_pn-linux-am335x-psp =3D "board-support/linux-${KVER}"
+CREATE_SRCIPK_pn-linux-am335x-psp ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-linux-am335x-psp ?=3D "board-support/linux-${KVER}"
=20
-CREATE_SRCIPK_pn-linux-omap =3D "1"
-SRCIPK_INSTALL_DIR_pn-linux-omap =3D "board-support/linux-${PV}-${PR}"
+CREATE_SRCIPK_pn-linux-omap ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-linux-omap ?=3D "board-support/linux-${PV}-${PR}"
=20
-CREATE_SRCIPK_pn-linux =3D "1"
-SRCIPK_INSTALL_DIR_pn-linux =3D "board-support/linux-${PV}"
+CREATE_SRCIPK_pn-linux ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-linux ?=3D "board-support/linux-${PV}"
=20
-CREATE_SRCIPK_pn-linux-omap4 =3D "1"
-SRCIPK_INSTALL_DIR_pn-linux-omap4 =3D "board-support/linux-${PV}"
+CREATE_SRCIPK_pn-linux-omap4 ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-linux-omap4 ?=3D "board-support/linux-${PV}"
=20
-CREATE_SRCIPK_pn-cryptodev-module =3D "1"
-SRCIPK_INSTALL_DIR_pn-cryptodev-module =3D "board-support/extra-drivers/cr=
yptodev-module-${PV}"
-SRCIPK_PRESERVE_GIT_pn-cryptodev-module =3D "true"
+CREATE_SRCIPK_pn-cryptodev-module ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-cryptodev-module ?=3D "board-support/extra-drivers/c=
ryptodev-module-${PV}"
+SRCIPK_PRESERVE_GIT_pn-cryptodev-module ?=3D "true"
=20
-CREATE_SRCIPK_pn-cmem-mod =3D "1"
-SRCIPK_INSTALL_DIR_pn-cmem-mod =3D "board-support/extra-drivers/${PN}-${PV=
}"
+CREATE_SRCIPK_pn-cmem-mod ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-cmem-mod ?=3D "board-support/extra-drivers/${PN}-${P=
V}"
=20
-CREATE_SRCIPK_pn-debugss-module-drv =3D "1"
-SRCIPK_INSTALL_DIR_pn-debugss-module-drv =3D "board-support/extra-drivers/=
${PN}-${PV}"
+CREATE_SRCIPK_pn-debugss-module-drv ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-debugss-module-drv ?=3D "board-support/extra-drivers=
/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-gdbserverproxy-module-drv =3D "1"
-SRCIPK_INSTALL_DIR_pn-gdbserverproxy-module-drv =3D "board-support/extra-d=
rivers/${PN}-${PV}"
+CREATE_SRCIPK_pn-gdbserverproxy-module-drv ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-gdbserverproxy-module-drv ?=3D "board-support/extra-=
drivers/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-ti-sgx-ddk-km =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-sgx-ddk-km =3D "board-support/extra-drivers/${PN}=
-${PV}"
+CREATE_SRCIPK_pn-ti-sgx-ddk-km ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-sgx-ddk-km ?=3D "board-support/extra-drivers/${PN=
}-${PV}"
=20
-CREATE_SRCIPK_pn-ti-img-rogue-driver =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-img-rogue-driver =3D "board-support/extra-drivers=
/${PN}-${PV}"
-SRCIPK_PRESERVE_GIT_pn-ti-img-rogue-driver =3D "true"
+CREATE_SRCIPK_pn-ti-img-rogue-driver ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-img-rogue-driver ?=3D "board-support/extra-driver=
s/${PN}-${PV}"
+SRCIPK_PRESERVE_GIT_pn-ti-img-rogue-driver ?=3D "true"
=20
-CREATE_SRCIPK_pn-ti-img-encode-decode =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-img-encode-decode =3D "board-support/extra-driver=
s/${PN}-${PV}"
-SRCIPK_PRESERVE_GIT_pn-ti-img-encode-decode =3D "true"
+CREATE_SRCIPK_pn-ti-img-encode-decode ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-img-encode-decode ?=3D "board-support/extra-drive=
rs/${PN}-${PV}"
+SRCIPK_PRESERVE_GIT_pn-ti-img-encode-decode ?=3D "true"
=20
-CREATE_SRCIPK_pn-ti-gc320-driver =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-gc320-driver =3D "board-support/extra-drivers/${P=
N}-${PV}"
+CREATE_SRCIPK_pn-ti-gc320-driver ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-gc320-driver ?=3D "board-support/extra-drivers/${=
PN}-${PV}"
=20
-CREATE_SRCIPK_pn-ti-linux-driver-examples =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples =3D "example-applications/l=
inux-driver-examples-${PV}"
+CREATE_SRCIPK_pn-ti-linux-driver-examples ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples ?=3D "example-applications/=
linux-driver-examples-${PV}"
=20
-CREATE_SRCIPK_pn-ti-linux-driver-examples-omapl =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omapl =3D "example-applicat=
ions/linux-driver-examples-${PV}"
+CREATE_SRCIPK_pn-ti-linux-driver-examples-omapl ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omapl ?=3D "example-applica=
tions/linux-driver-examples-${PV}"
=20
-CREATE_SRCIPK_pn-ti-linux-driver-examples-omap3 =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omap3 =3D "example-applicat=
ions/linux-driver-examples-${PV}"
+CREATE_SRCIPK_pn-ti-linux-driver-examples-omap3 ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omap3 ?=3D "example-applica=
tions/linux-driver-examples-${PV}"
=20
-CREATE_SRCIPK_pn-ti-framework-components =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-framework-components =3D "component-sources/frame=
work_components_${PV}"
+CREATE_SRCIPK_pn-ti-framework-components ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-framework-components ?=3D "component-sources/fram=
ework_components_${PV}"
=20
-CREATE_SRCIPK_pn-ti-codec-engine =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codec-engine =3D "component-sources/codec_engine_=
${PV}"
+CREATE_SRCIPK_pn-ti-codec-engine ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-codec-engine ?=3D "component-sources/codec_engine=
_${PV}"
=20
-CREATE_SRCIPK_pn-ti-codecs-omap3530 =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codecs-omap3530 =3D "codecs-omap3530_${PV}"
+CREATE_SRCIPK_pn-ti-codecs-omap3530 ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-codecs-omap3530 ?=3D "codecs-omap3530_${PV}"
=20
-CREATE_SRCIPK_pn-ti-linuxutils =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-linuxutils =3D "component-sources/linuxutils_${PV=
}"
+CREATE_SRCIPK_pn-ti-linuxutils ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-linuxutils ?=3D "component-sources/linuxutils_${P=
V}"
=20
-CREATE_SRCIPK_pn-ti-xdctools =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-xdctools =3D "component-sources/xdctools_${PV}"
+CREATE_SRCIPK_pn-ti-xdctools ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-xdctools ?=3D "component-sources/xdctools_${PV}"
=20
-CREATE_SRCIPK_pn-ti-dmai =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-dmai =3D "dmai_${PV}"
+CREATE_SRCIPK_pn-ti-dmai ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-dmai ?=3D "dmai_${PV}"
=20
-CREATE_SRCIPK_pn-ti-xdais =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-xdais =3D "component-sources/xdais_${PV}"
+CREATE_SRCIPK_pn-ti-xdais ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-xdais ?=3D "component-sources/xdais_${PV}"
=20
-CREATE_SRCIPK_pn-ti-local-power-manager =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-local-power-manager =3D "local-power-manager_${PV=
}"
+CREATE_SRCIPK_pn-ti-local-power-manager ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-local-power-manager ?=3D "local-power-manager_${P=
V}"
=20
-CREATE_SRCIPK_pn-ti-codecs-dm355 =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codecs-dm355 =3D "codecs-dm355_${PV}"
+CREATE_SRCIPK_pn-ti-codecs-dm355 ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-codecs-dm355 ?=3D "codecs-dm355_${PV}"
=20
-CREATE_SRCIPK_pn-ti-dvsdk-demos =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-dvsdk-demos =3D "dvsdk-demos_${PV}"
+CREATE_SRCIPK_pn-ti-dvsdk-demos ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-dvsdk-demos ?=3D "dvsdk-demos_${PV}"
=20
-CREATE_SRCIPK_pn-ti-dvtb =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-dvtb =3D "dvtb_${PV}"
+CREATE_SRCIPK_pn-ti-dvtb ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-dvtb ?=3D "dvtb_${PV}"
=20
-CREATE_SRCIPK_pn-ti-codecs-dm365 =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codecs-dm365 =3D "codecs-dm365_${PV}"
+CREATE_SRCIPK_pn-ti-codecs-dm365 ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-codecs-dm365 ?=3D "codecs-dm365_${PV}"
=20
-CREATE_SRCIPK_pn-ti-dm365mm-module =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-dm365mm-module =3D "dm365mm-module_${PV}"
+CREATE_SRCIPK_pn-ti-dm365mm-module ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-dm365mm-module ?=3D "dm365mm-module_${PV}"
=20
-CREATE_SRCIPK_pn-ti-codecs-dm6446 =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6446 =3D "codecs-dm6446_${PV}"
+CREATE_SRCIPK_pn-ti-codecs-dm6446 ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6446 ?=3D "codecs-dm6446_${PV}"
=20
-CREATE_SRCIPK_pn-ti-codecs-dm6467 =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6467 =3D "codecs-dm6467_${PV}"
+CREATE_SRCIPK_pn-ti-codecs-dm6467 ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6467 ?=3D "codecs-dm6467_${PV}"
=20
-CREATE_SRCIPK_pn-ti-codecs-omapl137 =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl137 =3D "codecs-omapl137_${PV}"
+CREATE_SRCIPK_pn-ti-codecs-omapl137 ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl137 ?=3D "codecs-omapl137_${PV}"
=20
-CREATE_SRCIPK_pn-ti-codecs-omapl138 =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl138 =3D "codecs-omapl138_${PV}"
+CREATE_SRCIPK_pn-ti-codecs-omapl138 ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl138 ?=3D "codecs-omapl138_${PV}"
=20
-CREATE_SRCIPK_pn-ti-cgt6x =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-cgt6x =3D "dsp-devkit/cgt6x_${PV}"
+CREATE_SRCIPK_pn-ti-cgt6x ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-cgt6x ?=3D "dsp-devkit/cgt6x_${PV}"
=20
-CREATE_SRCIPK_pn-ti-cgt470 =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-cgt470 =3D "media-controller-devkit/cgt470_${PV}"
+CREATE_SRCIPK_pn-ti-cgt470 ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-cgt470 ?=3D "media-controller-devkit/cgt470_${PV}=
"
=20
-CREATE_SRCIPK_pn-ti-dspbios =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-dspbios =3D "dspbios_${PV}"
+CREATE_SRCIPK_pn-ti-dspbios ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-dspbios ?=3D "dspbios_${PV}"
=20
-CREATE_SRCIPK_pn-ti-sysbios =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-sysbios =3D "component-sources/bios_${PV}"
+CREATE_SRCIPK_pn-ti-sysbios ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-sysbios ?=3D "component-sources/bios_${PV}"
=20
-CREATE_SRCIPK_pn-ti-biosutils =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-biosutils =3D "biosutils_${PV}"
+CREATE_SRCIPK_pn-ti-biosutils ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-biosutils ?=3D "biosutils_${PV}"
=20
-CREATE_SRCIPK_pn-ti-dsplink =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-dsplink =3D "dsplink_${PV}"
+CREATE_SRCIPK_pn-ti-dsplink ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-dsplink ?=3D "dsplink_${PV}"
=20
-CREATE_SRCIPK_pn-ti-syslink =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-syslink =3D "component-sources/syslink_${PV}"
+CREATE_SRCIPK_pn-ti-syslink ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-syslink ?=3D "component-sources/syslink_${PV}"
=20
-CREATE_SRCIPK_pn-ti-edma3lld =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-edma3lld =3D "component-sources/edma3lld_${PV}"
+CREATE_SRCIPK_pn-ti-edma3lld ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-edma3lld ?=3D "component-sources/edma3lld_${PV}"
=20
-CREATE_SRCIPK_pn-ti-c6accel =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-c6accel =3D "component-sources/c6accel_${PV}"
+CREATE_SRCIPK_pn-ti-c6accel ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-c6accel ?=3D "component-sources/c6accel_${PV}"
=20
-CREATE_SRCIPK_pn-ti-biospsp =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-biospsp =3D "biospsp_${PV}"
+CREATE_SRCIPK_pn-ti-biospsp ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-biospsp ?=3D "biospsp_${PV}"
=20
-CREATE_SRCIPK_pn-ti-audio-soc-example =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-audio-soc-example =3D "audio-soc-example_${PV}"
+CREATE_SRCIPK_pn-ti-audio-soc-example ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-audio-soc-example ?=3D "audio-soc-example_${PV}"
=20
-CREATE_SRCIPK_pn-ti-c6run =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-c6run =3D "component-sources/c6run_${PV}"
+CREATE_SRCIPK_pn-ti-c6run ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-c6run ?=3D "component-sources/c6run_${PV}"
=20
-CREATE_SRCIPK_pn-ti-osal =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-osal =3D "component-sources/osal_${PV}"
+CREATE_SRCIPK_pn-ti-osal ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-osal ?=3D "component-sources/osal_${PV}"
=20
-CREATE_SRCIPK_pn-ti-ipc =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-ipc =3D "component-sources/ipc_${PV}"
+CREATE_SRCIPK_pn-ti-ipc ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-ipc ?=3D "component-sources/ipc_${PV}"
=20
-CREATE_SRCIPK_pn-ti-dsp-benchmark =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-dsp-benchmark =3D "example-applications/dsp-bench=
mark_${PV}"
+CREATE_SRCIPK_pn-ti-dsp-benchmark ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-dsp-benchmark ?=3D "example-applications/dsp-benc=
hmark_${PV}"
=20
-CREATE_SRCIPK_pn-gstreamer-ti =3D "1"
-SRCIPK_INSTALL_DIR_pn-gstreamer-ti =3D "gstreamer-ti_${PV}"
+CREATE_SRCIPK_pn-gstreamer-ti ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-gstreamer-ti ?=3D "gstreamer-ti_${PV}"
=20
-CREATE_SRCIPK_pn-ti-omx =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-omx =3D "component-sources/omx_${PV}"
+CREATE_SRCIPK_pn-ti-omx ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-omx ?=3D "component-sources/omx_${PV}"
=20
-CREATE_SRCIPK_pn-ti-uia =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-uia =3D "component-sources/uia_${PV}"
+CREATE_SRCIPK_pn-ti-uia ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-uia ?=3D "component-sources/uia_${PV}"
=20
-CREATE_SRCIPK_pn-ti-media-controller-utils =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-media-controller-utils =3D "board-support/media-c=
ontroller-utils_${PV}"
+CREATE_SRCIPK_pn-ti-media-controller-utils ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-media-controller-utils ?=3D "board-support/media-=
controller-utils_${PV}"
=20
-CREATE_SRCIPK_pn-ti-firmware-dm816x =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-firmware-dm816x =3D "board-support/prebuilt-image=
s/dm816x-firmware_${PV}"
+CREATE_SRCIPK_pn-ti-firmware-dm816x ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-firmware-dm816x ?=3D "board-support/prebuilt-imag=
es/dm816x-firmware_${PV}"
=20
-CREATE_SRCIPK_pn-ti-firmware-dm814x =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-firmware-dm814x =3D "board-support/prebuilt-image=
s/dm814x-firmware_${PV}"
+CREATE_SRCIPK_pn-ti-firmware-dm814x ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-firmware-dm814x ?=3D "board-support/prebuilt-imag=
es/dm814x-firmware_${PV}"
=20
-CREATE_SRCIPK_pn-ti-slog =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-slog =3D "component-sources/slog_${PV}"
+CREATE_SRCIPK_pn-ti-slog ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-slog ?=3D "component-sources/slog_${PV}"
=20
-CREATE_SRCIPK_pn-ti-c674x-aaclcdec =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-c674x-aaclcdec =3D "component-sources/c674x-aaclc=
dec_${PV}"
+CREATE_SRCIPK_pn-ti-c674x-aaclcdec ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-c674x-aaclcdec ?=3D "component-sources/c674x-aacl=
cdec_${PV}"
=20
-CREATE_SRCIPK_pn-oe-layersetup =3D "1"
-SRCIPK_INSTALL_DIR_pn-oe-layersetup =3D "bin/oe-layersetup"
+CREATE_SRCIPK_pn-oe-layersetup ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-oe-layersetup ?=3D "bin/oe-layersetup"
=20
-CREATE_SRCIPK_pn-opencl-examples =3D "1"
-SRCIPK_INSTALL_DIR_pn-opencl-examples =3D "example-applications/${PN}-${PV=
}"
+CREATE_SRCIPK_pn-opencl-examples ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-opencl-examples ?=3D "example-applications/${PN}-${P=
V}"
=20
-CREATE_SRCIPK_pn-openmpacc-examples =3D "1"
-SRCIPK_INSTALL_DIR_pn-openmpacc-examples =3D "example-applications/${PN}-$=
{PV}"
+CREATE_SRCIPK_pn-openmpacc-examples ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-openmpacc-examples ?=3D "example-applications/${PN}-=
${PV}"
=20
-CREATE_SRCIPK_pn-tidl-examples =3D "1"
-SRCIPK_INSTALL_DIR_pn-tidl-examples =3D "example-applications/${PN}-${PV}"
-SRCIPK_SRC_DIR_pn-tidl-examples =3D "${S}/examples"
+CREATE_SRCIPK_pn-tidl-examples ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-tidl-examples ?=3D "example-applications/${PN}-${PV}=
"
+SRCIPK_SRC_DIR_pn-tidl-examples ?=3D "${S}/examples"
=20
-CREATE_SRCIPK_pn-qt-opencv-opencl-opengl-multithreaded =3D "1"
-SRCIPK_INSTALL_DIR_pn-qt-opencv-opencl-opengl-multithreaded =3D "example-a=
pplications/${PN}-${PV}"
+CREATE_SRCIPK_pn-qt-opencv-opencl-opengl-multithreaded ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-qt-opencv-opencl-opengl-multithreaded ?=3D "example-=
applications/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-libarch-examples =3D "1"
-SRCIPK_INSTALL_DIR_pn-libarch-examples =3D "example-applications/${PN}-${P=
V}"
+CREATE_SRCIPK_pn-libarch-examples ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-libarch-examples ?=3D "example-applications/${PN}-${=
PV}"
=20
-CREATE_SRCIPK_pn-linalg-examples =3D "1"
-SRCIPK_INSTALL_DIR_pn-linalg-examples =3D "example-applications/${PN}-${PV=
}"
-SRCIPK_SRC_DIR_pn-linalg-examples =3D "${EXAMPLES_ROOT}"
+CREATE_SRCIPK_pn-linalg-examples ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-linalg-examples ?=3D "example-applications/${PN}-${P=
V}"
+SRCIPK_SRC_DIR_pn-linalg-examples ?=3D "${EXAMPLES_ROOT}"
=20
-CREATE_SRCIPK_pn-barcode-roi =3D "1"
-SRCIPK_INSTALL_DIR_pn-barcode-roi =3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK_pn-barcode-roi ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-barcode-roi ?=3D "example-applications/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-boot-monitor =3D "1"
-SRCIPK_INSTALL_DIR_pn-boot-monitor =3D "board-support/${PN}-${PV}"
+CREATE_SRCIPK_pn-boot-monitor ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-boot-monitor ?=3D "board-support/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-hplib-mod =3D "1"
-SRCIPK_INSTALL_DIR_pn-hplib-mod =3D "board-support/extra-drivers/${PN}-${P=
V}"
+CREATE_SRCIPK_pn-hplib-mod ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-hplib-mod ?=3D "board-support/extra-drivers/${PN}-${=
PV}"
=20
-CREATE_SRCIPK_pn-uio-module-drv =3D "1"
-SRCIPK_INSTALL_DIR_pn-uio-module-drv =3D "board-support/extra-drivers/${PN=
}-${PV}"
+CREATE_SRCIPK_pn-uio-module-drv ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-uio-module-drv ?=3D "board-support/extra-drivers/${P=
N}-${PV}"
=20
-CREATE_SRCIPK_pn-ivshmem-uio-driver =3D "1"
-SRCIPK_INSTALL_DIR_pn-ivshmem-uio-driver =3D "board-support/extra-drivers/=
${PN}-${PV}"
-SRCIPK_PRESERVE_GIT_pn-ivshmem-uio-driver =3D "true"
+CREATE_SRCIPK_pn-ivshmem-uio-driver ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ivshmem-uio-driver ?=3D "board-support/extra-drivers=
/${PN}-${PV}"
+SRCIPK_PRESERVE_GIT_pn-ivshmem-uio-driver ?=3D "true"
=20
-CREATE_SRCIPK_pn-ipsecmgr-mod =3D "1"
-SRCIPK_INSTALL_DIR_pn-ipsecmgr-mod =3D "board-support/extra-drivers/${PN}-=
${PV}"
+CREATE_SRCIPK_pn-ipsecmgr-mod ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ipsecmgr-mod ?=3D "board-support/extra-drivers/${PN}=
-${PV}"
=20
-CREATE_SRCIPK_pn-pru-icss =3D "1"
-SRCIPK_INSTALL_DIR_pn-pru-icss =3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK_pn-pru-icss ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-pru-icss ?=3D "example-applications/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-dsplib-c66x =3D "1"
-SRCIPK_INSTALL_DIR_pn-dsplib-c66x =3D "component-sources/dsplib_c66x_${PV}=
"
+CREATE_SRCIPK_pn-dsplib-c66x ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-dsplib-c66x ?=3D "component-sources/dsplib_c66x_${PV=
}"
=20
-CREATE_SRCIPK_pn-mathlib-c66x =3D "1"
-SRCIPK_INSTALL_DIR_pn-mathlib-c66x =3D "component-sources/mathlib_c66x_${P=
V}"
+CREATE_SRCIPK_pn-mathlib-c66x ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-mathlib-c66x ?=3D "component-sources/mathlib_c66x_${=
PV}"
=20
-CREATE_SRCIPK_pn-imglib-c66x =3D "1"
-SRCIPK_INSTALL_DIR_pn-imglib-c66x =3D "component-sources/imglib_c66x_${PV}=
"
+CREATE_SRCIPK_pn-imglib-c66x ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-imglib-c66x ?=3D "component-sources/imglib_c66x_${PV=
}"
=20
-CREATE_SRCIPK_pn-vlib-c66x =3D "1"
-SRCIPK_INSTALL_DIR_pn-vlib-c66x =3D "component-sources/vlib_c66x_${PV}"
+CREATE_SRCIPK_pn-vlib-c66x ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-vlib-c66x ?=3D "component-sources/vlib_c66x_${PV}"
=20
-CREATE_SRCIPK_pn-big-data-ipc-demo-linux =3D "1"
-SRCIPK_INSTALL_DIR_pn-big-data-ipc-demo-linux =3D "example-applications/${=
PN}-${PV}"
+CREATE_SRCIPK_pn-big-data-ipc-demo-linux ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-big-data-ipc-demo-linux ?=3D "example-applications/$=
{PN}-${PV}"
=20
-CREATE_SRCIPK_pn-ti-sci-fw_k3 =3D "1"
-SRCIPK_SRC_DIR_pn-ti-sci-fw_k3 =3D "${WORKDIR}/imggen"
-SRCIPK_INSTALL_DIR_pn-ti-sci-fw_k3 =3D "board-support/system-firmware-imag=
e-gen-${PV}"
+CREATE_SRCIPK_pn-ti-sci-fw_k3 ?=3D "1"
+SRCIPK_SRC_DIR_pn-ti-sci-fw_k3 ?=3D "${WORKDIR}/imggen"
+SRCIPK_INSTALL_DIR_pn-ti-sci-fw_k3 ?=3D "board-support/system-firmware-ima=
ge-gen-${PV}"
=20
-CREATE_SRCIPK_pn-jailhouse =3D "1"
-SRCIPK_INSTALL_DIR_pn-jailhouse =3D "board-support/extra-drivers/${PN}-${P=
V}"
+CREATE_SRCIPK_pn-jailhouse ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-jailhouse ?=3D "board-support/extra-drivers/${PN}-${=
PV}"
--=20
2.17.1


