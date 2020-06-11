Return-Path: <Ankur.Tyagi@gallagher.com>
Received: from AUS01-ME1-obe.outbound.protection.outlook.com
	(mail-eopbgr1360118.outbound.protection.outlook.com [40.107.136.118])
	by arago-project.org (Postfix) with ESMTPS id DC59A529D1
	for <meta-arago@arago-project.org>;
	Thu, 11 Jun 2020 22:52:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=UxZZ5dPOCXA0c1OnJuxspVZuL+Qp7Qirk/A5kTJSghh7oGMdwkACGcG6pgVY006y6GTD1JsiwEeaO9Ip4NOiw//vYk3KIAxABjdfO+diD9MDziCk1dw6+miTZQ0QxAeEuIU8cwjC3D8J0fch5ph2H5FYHhNG60q5FtF/f3sqFNKKoJm+MnDgFDMxbOnQv6fjrB5wYrHZyOdgAy9EYtxCQXLv5rtjJp6Cb97c6LDPaVN/bpzWaMcii68TEFNoGWrt17yp18sWvX6Nk0zmKvktI8XwTs3+VMqXTN/Ws+w+qRWy6IW4adDzygdPmZRzwsgaaaTkWr9izXfzpSwgPHg5kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6B/iaj2KfqXNLktKPKX7amrFybWKIVozt9886LdmVm0=;
	b=nNw5TiEcY7WwgOaB0Aj1RIvrVQNmq2nh3NdX851ZXWXZcJIigcC0tIiq36glDYyBNu8XJNJEvEj7fzi3EPOkD7vJf/7HAoPfMcrdMS2vaLlFtgIsaKqcKub4c4z2KPP8XsKGeHhAYmVUd91rXowWO/KVVwheFWCdwGKuv54/8l2ynpBhIl6SM7tKXLp3uPF2PnxrXGZ7N4eKxguEXW2EC7dbLqgKnxOtFDv0KerP1JKGq3JmGcpz/MPSQsGF5E/iGi9ofvuzEd8ONes3ed5YlwqHEAOa9Br5KpViMu1aX1owiSTMvxdOnqbk/csbAqm0HhloDTrR1ySHTVQXxLyD5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=gallagher.com; dmarc=pass action=none
	header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6B/iaj2KfqXNLktKPKX7amrFybWKIVozt9886LdmVm0=;
	b=GqLNqGhOCGA8Hhm6SlsomxcZT/suKVijfUze+jRwKrU0LKibPzsW6QT475IIMqEnb6a8z7Sj3dMcBP6QuJoQ8TucTHjz0M/9vwQ6PTM0XcQlt21wL2MdsPUFQXnagk3Wvb6mHZV67l1hEYRtnyrrBs9xFkPt/R6lSz3SyE1ZCuQ=
Received: from SYXPR01MB1088.ausprd01.prod.outlook.com (2603:10c6:0:9::17) by
	SYXPR01MB1775.ausprd01.prod.outlook.com (2603:10c6:0:26::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.3088.24; Thu, 11 Jun 2020 22:50:03 +0000
Received: from SYXPR01MB1088.ausprd01.prod.outlook.com
	([fe80::d4bf:2e94:579a:f482]) by
	SYXPR01MB1088.ausprd01.prod.outlook.com
	([fe80::d4bf:2e94:579a:f482%2]) with mapi id 15.20.3088.022;
	Thu, 11 Jun 2020 22:50:03 +0000
From: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago][dunfell/master PATCH] arago-source-ipk.inc: Use
	weak assignment to create source ipk file
Thread-Index: AQHWQEATsu0KkuE8CU6so/AVB24pwKjUBI0g
Date: Thu, 11 Jun 2020 22:50:03 +0000
Message-ID: <SYXPR01MB1088B788FE7E2A6BC89E11F1E5800@SYXPR01MB1088.ausprd01.prod.outlook.com>
References: <20200611223129.58314-1-ankur.tyagi@gallagher.com>
In-Reply-To: <20200611223129.58314-1-ankur.tyagi@gallagher.com>
Accept-Language: en-NZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arago-project.org; dkim=none (message not signed)
	header.d=none;arago-project.org; dmarc=none action=none
	header.from=gallagher.com;
x-originating-ip: [139.180.92.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efe4dcbc-af45-4f79-c28f-08d80e59c79e
x-ms-traffictypediagnostic: SYXPR01MB1775:
x-microsoft-antispam-prvs: <SYXPR01MB17759EB6A7A02594CDB6EDBDE5800@SYXPR01MB1775.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0431F981D8
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GWp4DXcsCAfpk/wETSU2xJTVxRDLqYrgGurItO/SWN1sFNx/RWEqL2vBoqF3s0byjDENgagQN0DzszHFul26m5zchDmiyKtS67jbW2tlnWJ3m47pHkPmkwqRsV5h5s13cp4+Z0gFuL7q98JRjInAalII8VIIYk0vekZmfsm5l1vKFHpwVx1RudLuOv+yHrjoCsjB9ikgUJYcrgy4GcLiI57Y3GWhh+T0LNgu1dBzOqgh8pqVceLV2Pd8hWMEE0VmRU2nHLKLltNMEPFo55CKueb10SHGSCrSWjz+QSTtNeA/vQmcddRV18gYWvSbehxp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SYXPR01MB1088.ausprd01.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(376002)(346002)(136003)(39850400004)(396003)(366004)(55016002)(6506007)(186003)(66574014)(71200400001)(8936002)(26005)(83380400001)(316002)(6916009)(9686003)(86362001)(478600001)(52536014)(8676002)(66476007)(66556008)(66946007)(66446008)(64756008)(76116006)(33656002)(5660300002)(2906002)(30864003)(7696005)(579004)(559001);
	DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: mHNYksJbEvU2yOs04vwc3FuotU5aMI42qBR6Xdm3C/TT/H4jdMbG6JX3zi/psBFqdrAzLtpEMfQGg/20Y3lwpzaR+w5TP3o6woB6cO3pWEdRH5gmIFX+RfzvecG2qCqtynFkXKMOMo1ZfYYH3mVOjie+dK/YFMoSUk6mfwpzY5seNIW149l5uA8TwkdPYQmCw9RdSa3xjiyMXZ5lxDt06dAVf75HQ10TTnpVT4XJ+N++h9jkfKCYOg1Mx7GplhHatUlagRxDmcSGUDUVGYlGKpQDEiIYrceiwm9jGU90dvSexadPF8++quBqpH9Ymrozr/qG3To3qCYJ13ryMpRSUt3GxPJtMrlR5V/KSwBoOadC/CnMaxT+jHapS503eyrzAkYJu7+0ZCYGcxFK+adI984fs1Jk1DlVVSrg7LY2fw0aAUJEBqcTYV9F4i+nntKL+Ed2Aub3NW0ppz40zJXsnnptlMNVm+b32zg+CL0Tug42+s3d7ED0Ht70nFbIOoYi
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efe4dcbc-af45-4f79-c28f-08d80e59c79e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2020 22:50:03.6014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jBp8jtg/CFpGl6M8Mdu6voEZ7bNPM+1qAa7+yd6Wm76wS1OQeAdguFeCE5uqXYc8RFfPS0qfDKffIPFXs0oAulJlzIKIc/uVTfgzYvAkYvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYXPR01MB1775
Subject: [dunfell/master PATCH] arago-source-ipk.inc: Use weak assignment to create source ipk file
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
X-List-Received-Date: Thu, 11 Jun 2020 22:52:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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


