Return-Path: <Ankur.Tyagi@gallagher.com>
Received: from AUS01-SY3-obe.outbound.protection.outlook.com
	(mail-eopbgr1370130.outbound.protection.outlook.com [40.107.137.130])
	by arago-project.org (Postfix) with ESMTPS id 0B05BA8004
	for <meta-arago@arago-project.org>;
	Tue, 30 Jun 2020 05:09:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=TWBfR27BslAx2njC9UWUvxDXVFx2eNPDfte2WBzI+3LTo9XE7HaDrTvST8HxUgJ+Clf4x8h3WmdKU8cfCurF7WTh8LLnoewvPOHHmxetfPxd9Bph7Sy9nkelI5/ffI4bD3iMBZinBqJRTg3GgdyhB8eSBT+PF4mlKJfmwkegkwI+sUocxyNP7vPnayhRYU6JRemhhXMGb2wWkGhGqShx0psEeKbPM9Z/unyduRUNqo2y78OYCvwRelvJMFBLM1XBeGH+NcrQ1IqcGReQ9Wdh1tdXLvhVQF/l3hE6FZC56DOv4HWquolyosNL6YrcVjbjlFCLmbh7SZ2HwhaAItFihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5yVvvSnyKsi8K/7VS3kXnGhsFJ98dGOLEe4MqLGgFdw=;
	b=LyGaQNamRxELMDMPq8+xyPyHFxXf7r0cGsi5DmSc6Ab6C2OaGMH84DAAvfiu2YNGLAEI2CPfco0ngdDhIvjx4/EkuDciHpzFPTH7IafWU7M1tCYOSnl06aTkyh7NE3ZomiJFnVMANhW2E/dEIHSLzTtjMeakmU+3aNngTuvGkJmuu9K2yyUP/2dCIiI1JfWHUu/lPkTo63hheknqeegDzkmgO4yQRlJVHsI4XZJl3d1BGaBZ8aS8k0y4wLcH5ls+IXseC7ZnMeS2UVOsNT20WkXxo7WYGRXgMnU+sSN782ay0a/5/QNKWeGkAkKW1opj9czEYBJRb7Zd7e9EuM7yvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=gallagher.com; dmarc=pass action=none
	header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5yVvvSnyKsi8K/7VS3kXnGhsFJ98dGOLEe4MqLGgFdw=;
	b=mENXaFFlTnPsrcoegGEvuP6GsOS3zuyvXZbQOS29iinE2skKhMH+v45L7V1f77pUZoEi3t6F/aE+ez+2S0V4+q/SHHyvY3opWeUKQCeP5NHYkPxMdxcGjEGMGh65Am/ij3KSQwSrgthZ+8bkpcgPJ3FNfMpnXX2TUB5qhmfTEvk=
Received: from SY3PR01MB1931.ausprd01.prod.outlook.com (2603:10c6:0:20::22) by
	SY2PR01MB2764.ausprd01.prod.outlook.com (2603:10c6:1:1d::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.3131.26; Tue, 30 Jun 2020 05:07:02 +0000
Received: from SY3PR01MB1931.ausprd01.prod.outlook.com
	([fe80::835:455c:1cc5:2a48]) by SY3PR01MB1931.ausprd01.prod.outlook.com
	([fe80::835:455c:1cc5:2a48%5]) with mapi id 15.20.3131.028;
	Tue, 30 Jun 2020 05:07:02 +0000
From: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago][dunfell/master PATCH v2] arago-source-ipk.inc: Use
	weak assignment to create source ipk file
Thread-Index: AQHWTpvxXLCSrfgbDUqhrqjxXbgUn6jwmskA
Date: Tue, 30 Jun 2020 05:07:02 +0000
Message-ID: <SY3PR01MB193112F070978D1AC4B89C25E56F0@SY3PR01MB1931.ausprd01.prod.outlook.com>
References: <20200630050423.16163-1-ankur.tyagi@gallagher.com>
In-Reply-To: <20200630050423.16163-1-ankur.tyagi@gallagher.com>
Accept-Language: en-NZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arago-project.org; dkim=none (message not signed)
	header.d=none;arago-project.org; dmarc=none action=none
	header.from=gallagher.com;
x-originating-ip: [139.180.92.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c91d004f-174b-4505-440f-08d81cb36cfd
x-ms-traffictypediagnostic: SY2PR01MB2764:
x-microsoft-antispam-prvs: <SY2PR01MB27641169BBF1D7650143B272E56F0@SY2PR01MB2764.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0450A714CB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CjfVseBQCNzZFvwAvQmWJ/gS524wyNyYiy9/ETGuLchpkkel/bJjqJOzQ+2jHwpHNAoU8Bj9NorDdPpBJ22oQ3U2DvtAtL7rAnbu8V2qh1sMfmp44+l0ytsuWyjaeLeg5YRi1OIwm6RrFRgMn1ztUIRiPh3FehKZRZnT5I6pXnyb6gZZzyQIdLWmfOmbMRZ3ZFGJDM9aqD6dmW4XBwK6yMrtcLGp5vF6GTzM2u2YcU1L76M1SiyJx5VhqizCTvcOT+R8DOXi1xBRtE1SQayRlrI5JFTduFPAEXXQ0kuItvWPr2aDRIpgkmdcYuTmLfTv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SY3PR01MB1931.ausprd01.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(39850400004)(396003)(376002)(346002)(366004)(8676002)(5660300002)(66946007)(66476007)(66556008)(64756008)(66446008)(2906002)(52536014)(316002)(83380400001)(8936002)(71200400001)(478600001)(9686003)(33656002)(55016002)(7696005)(30864003)(6916009)(86362001)(26005)(186003)(66574015)(76116006)(6506007)(579004)(559001);
	DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: UppJx5tLq3CsveBR+khYDPWKkP09IxIqKLN+bxQgNKDE/ebSHDN9C+MEDt9O21Gm9zu+amWKpgu+xzDZVvPW7WjjFIv+W0v4GyhxOk2/TxrRAdUCUsnwfpihZvehbWvhfyr9eXkvYLLx9rhSym6HRGWGYyuaNnPmsOaT+DDW/wo11wYLkWJFHLfHtsB7cDDCUGhmm3ZUX+pnY+6u9XSoBiLjiaq/hQpS+wSR2dt1bfuSnkEVXFGzLhH3zxC7/ffN2TwXrPin287QQOx4xqHEoe90MHYG2zVTwCPQxWW/1/c8+2hGYbbf2sOav6883fvfO/V+G1wWwacTl0KC0eL9fURmvj1j6kOuJuoOWINT3vhOfk3FXEPrZVaGqS5SOCyyaSG253L/tFgjQ7QZQDbJG09DB+X/12v+M9owtkLW6atdvzV1GA/W0b7Xplivz02umAKgjumQP6ZnDpH501L1JNXvIMZ/nGk2Hji1AMb1sgZjcaWRtcLZ9h5n4m5hck1c
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY3PR01MB1931.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c91d004f-174b-4505-440f-08d81cb36cfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2020 05:07:02.5506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WCPO8vwP5+jmQ4l7/9l8zl7HfBozq1p9saaywQoPgDXdYU4IM4hm2DA+pgNI2uVD7qTtIkI8edURxffg6WjYIhUN26ALVf0meuUkDBDYteI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY2PR01MB2764
Subject: [dunfell/master PATCH v2] arago-source-ipk.inc: Use weak assignment to create source ipk file
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
X-List-Received-Date: Tue, 30 Jun 2020 05:09:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is to allow user to override(disable) them in their configuration.

Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
---

Changes from v1:
- Rebased against latest dunfell branch

 .../conf/distro/include/arago-source-ipk.inc  | 492 +++++++++---------
 1 file changed, 246 insertions(+), 246 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/m=
eta-arago-distro/conf/distro/include/arago-source-ipk.inc
index fabb6488..232cd4c3 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -40,363 +40,363 @@ INHERIT +=3D "sourceipk"
 SRCIPK_INCLUDE_EXTRAFILES =3D "0"

 # Set source ipk packages and install directories
-CREATE_SRCIPK_pn-ti-tisdk-licenses =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-tisdk-licenses =3D "docs/licenses"
+CREATE_SRCIPK_pn-ti-tisdk-licenses ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-tisdk-licenses ?=3D "docs/licenses"

-CREATE_SRCIPK_pn-matrix-gui =3D "1"
-SRCIPK_INSTALL_DIR_pn-matrix-gui =3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK_pn-matrix-gui ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-matrix-gui ?=3D "example-applications/${PN}-${PV}"

-CREATE_SRCIPK_pn-ti-crypto-examples =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-crypto-examples =3D "example-applications/${PN}-$=
{PV}"
+CREATE_SRCIPK_pn-ti-crypto-examples ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-crypto-examples ?=3D "example-applications/${PN}-=
${PV}"

-CREATE_SRCIPK_pn-qml-carinfo =3D "1"
-SRCIPK_INSTALL_DIR_pn-qml-carinfo =3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK_pn-qml-carinfo ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-qml-carinfo ?=3D "example-applications/${PN}-${PV}"

-CREATE_SRCIPK_pn-quick-playground =3D "1"
-SRCIPK_INSTALL_DIR_pn-quick-playground =3D "example-applications/${PN}-${P=
V}"
+CREATE_SRCIPK_pn-quick-playground ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-quick-playground ?=3D "example-applications/${PN}-${=
PV}"

-CREATE_SRCIPK_pn-qt-catalog =3D "1"
-SRCIPK_INSTALL_DIR_pn-qt-catalog =3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK_pn-qt-catalog ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-qt-catalog ?=3D "example-applications/${PN}-${PV}"

-CREATE_SRCIPK_pn-qt-patientcare =3D "1"
-SRCIPK_INSTALL_DIR_pn-qt-patientcare =3D "example-applications/${PN}-${PV}=
"
+CREATE_SRCIPK_pn-qt-patientcare ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-qt-patientcare ?=3D "example-applications/${PN}-${PV=
}"

-CREATE_SRCIPK_pn-qt-tstat =3D "1"
-SRCIPK_INSTALL_DIR_pn-qt-tstat =3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK_pn-qt-tstat ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-qt-tstat ?=3D "example-applications/${PN}-${PV}"

-CREATE_SRCIPK_pn-dual-camera-demo =3D "1"
-SRCIPK_INSTALL_DIR_pn-dual-camera-demo =3D "example-applications/${PN}-${P=
V}"
+CREATE_SRCIPK_pn-dual-camera-demo ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-dual-camera-demo ?=3D "example-applications/${PN}-${=
PV}"

-CREATE_SRCIPK_pn-evse-hmi =3D "1"
-SRCIPK_INSTALL_DIR_pn-evse-hmi =3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK_pn-evse-hmi ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-evse-hmi ?=3D "example-applications/${PN}-${PV}"

-CREATE_SRCIPK_pn-protection-relays-hmi =3D "1"
-SRCIPK_INSTALL_DIR_pn-protection-relays-hmi =3D "example-applications/${PN=
}-${PV}"
+CREATE_SRCIPK_pn-protection-relays-hmi ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-protection-relays-hmi ?=3D "example-applications/${P=
N}-${PV}"

-CREATE_SRCIPK_pn-mmwavegesture-hmi =3D "1"
-SRCIPK_INSTALL_DIR_pn-mmwavegesture-hmi =3D "example-applications/${PN}-${=
PV}"
+CREATE_SRCIPK_pn-mmwavegesture-hmi ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-mmwavegesture-hmi ?=3D "example-applications/${PN}-$=
{PV}"

-CREATE_SRCIPK_pn-pdm-anomaly-detection =3D "1"
-SRCIPK_INSTALL_DIR_pn-pdm-anomaly-detection =3D "example-applications/${PN=
}-${PV}"
+CREATE_SRCIPK_pn-pdm-anomaly-detection ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-pdm-anomaly-detection ?=3D "example-applications/${P=
N}-${PV}"

-CREATE_SRCIPK_pn-tiovx-app-host =3D "1"
-SRCIPK_INSTALL_DIR_pn-tiovx-app-host =3D "example-applications/${PN}-${PV}=
"
+CREATE_SRCIPK_pn-tiovx-app-host ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-tiovx-app-host ?=3D "example-applications/${PN}-${PV=
}"

-CREATE_SRCIPK_pn-image-gallery =3D "1"
-SRCIPK_INSTALL_DIR_pn-image-gallery =3D "example-applications/${PN}"
+CREATE_SRCIPK_pn-image-gallery ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-image-gallery ?=3D "example-applications/${PN}"

-CREATE_SRCIPK_pn-matrix-gui-browser =3D "1"
-SRCIPK_INSTALL_DIR_pn-matrix-gui-browser =3D "example-applications/${PN}-$=
{PV}"
+CREATE_SRCIPK_pn-matrix-gui-browser ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-matrix-gui-browser ?=3D "example-applications/${PN}-=
${PV}"

-CREATE_SRCIPK_pn-refresh-screen =3D "1"
-SRCIPK_INSTALL_DIR_pn-refresh-screen =3D "example-applications/${PN}-${PV}=
"
+CREATE_SRCIPK_pn-refresh-screen ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-refresh-screen ?=3D "example-applications/${PN}-${PV=
}"

-CREATE_SRCIPK_pn-am-sysinfo =3D "1"
-SRCIPK_INSTALL_DIR_pn-am-sysinfo =3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK_pn-am-sysinfo ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-am-sysinfo ?=3D "example-applications/${PN}-${PV}"

-CREATE_SRCIPK_pn-oprofile-example =3D "1"
-SRCIPK_INSTALL_DIR_pn-oprofile-example =3D "example-applications/${PN}"
+CREATE_SRCIPK_pn-oprofile-example ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-oprofile-example ?=3D "example-applications/${PN}"

-CREATE_SRCIPK_pn-arm-benchmarks =3D "1"
-SRCIPK_INSTALL_DIR_pn-arm-benchmarks =3D "example-applications/${PN}-${PV}=
"
+CREATE_SRCIPK_pn-arm-benchmarks ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-arm-benchmarks ?=3D "example-applications/${PN}-${PV=
}"

-CREATE_SRCIPK_pn-omapconf =3D "1"
-SRCIPK_INSTALL_DIR_pn-omapconf =3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK_pn-omapconf ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-omapconf ?=3D "example-applications/${PN}-${PV}"

-CREATE_SRCIPK_pn-ti-pru-sw-examples =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-pru-sw-examples =3D "example-applications/pru-${P=
V}"
+CREATE_SRCIPK_pn-ti-pru-sw-examples ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-pru-sw-examples ?=3D "example-applications/pru-${=
PV}"

-CREATE_SRCIPK_pn-ti-ocf-crypto-module =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-ocf-crypto-module =3D "board-support/extra-driver=
s/${PN}-${PV}"
+CREATE_SRCIPK_pn-ti-ocf-crypto-module ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-ocf-crypto-module ?=3D "board-support/extra-drive=
rs/${PN}-${PV}"

-CREATE_SRCIPK_pn-omap3-sgx-modules =3D "1"
-SRCIPK_INSTALL_DIR_pn-omap3-sgx-modules =3D "board-support/extra-drivers/s=
gx-modules-${PV}"
+CREATE_SRCIPK_pn-omap3-sgx-modules ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-omap3-sgx-modules ?=3D "board-support/extra-drivers/=
sgx-modules-${PV}"

-CREATE_SRCIPK_pn-ti-compat-wireless-wl18xx =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-compat-wireless-wl18xx =3D "board-support/extra-d=
rivers/${PN}-${PV}"
+CREATE_SRCIPK_pn-ti-compat-wireless-wl18xx ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-compat-wireless-wl18xx ?=3D "board-support/extra-=
drivers/${PN}-${PV}"

-CREATE_SRCIPK_pn-wl18xx-fw =3D "1"
-SRCIPK_INSTALL_DIR_pn-wl18xx-fw =3D "board-support/extra-drivers/${PN}-${P=
V}"
+CREATE_SRCIPK_pn-wl18xx-fw ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-wl18xx-fw ?=3D "board-support/extra-drivers/${PN}-${=
PV}"

-CREATE_SRCIPK_pn-wl1271-wlan-cli =3D "1"
-SRCIPK_INSTALL_DIR_pn-wl1271-wlan-cli =3D "example-applications/wlan"
+CREATE_SRCIPK_pn-wl1271-wlan-cli ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-wl1271-wlan-cli ?=3D "example-applications/wlan"

-CREATE_SRCIPK_pn-av-examples =3D "1"
-SRCIPK_INSTALL_DIR_pn-av-examples =3D "example-applications/av-examples-${=
PV}"
+CREATE_SRCIPK_pn-av-examples ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-av-examples ?=3D "example-applications/av-examples-$=
{PV}"

-CREATE_SRCIPK_pn-u-boot =3D "1"
-SRCIPK_INSTALL_DIR_pn-u-boot =3D "board-support/u-boot-${PV}"
+CREATE_SRCIPK_pn-u-boot ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-u-boot ?=3D "board-support/u-boot-${PV}"
 # For beagleboard we use the git version which doesn't define UVER
-SRCIPK_INSTALL_DIR_pn-u-boot_beagleboard =3D "board-support/${P}"
+SRCIPK_INSTALL_DIR_pn-u-boot_beagleboard ?=3D "board-support/${P}"

-CREATE_SRCIPK_pn-x-load =3D "1"
-SRCIPK_INSTALL_DIR_pn-x-load =3D "board-support/x-load-${XVER}-psp${PSPREL=
}"
+CREATE_SRCIPK_pn-x-load ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-x-load ?=3D "board-support/x-load-${XVER}-psp${PSPRE=
L}"
 # For beagleboard we use the git version which doesn't define XVER
-SRCIPK_INSTALL_DIR_pn-x-load_beagleboard =3D "board-support/${P}"
+SRCIPK_INSTALL_DIR_pn-x-load_beagleboard ?=3D "board-support/${P}"

-CREATE_SRCIPK_pn-u-boot-ti-staging =3D "1"
-SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging =3D "board-support/u-boot-${PV}${U=
BOOT_LOCALVERSION}"
-SRCIPK_PRESERVE_GIT_pn-u-boot-ti-staging =3D "true"
+CREATE_SRCIPK_pn-u-boot-ti-staging ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging ?=3D "board-support/u-boot-${PV}${=
UBOOT_LOCALVERSION}"
+SRCIPK_PRESERVE_GIT_pn-u-boot-ti-staging ?=3D "true"

-CREATE_SRCIPK_pn-u-boot-keystone =3D "1"
-SRCIPK_INSTALL_DIR_pn-u-boot-keystone =3D "board-support/u-boot-${PV}"
-SRCIPK_PRESERVE_GIT_pn-u-boot-keystone =3D "true"
+CREATE_SRCIPK_pn-u-boot-keystone ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-u-boot-keystone ?=3D "board-support/u-boot-${PV}"
+SRCIPK_PRESERVE_GIT_pn-u-boot-keystone ?=3D "true"

-CREATE_SRCIPK_pn-u-boot-dra7xx =3D "1"
-SRCIPK_INSTALL_DIR_pn-u-boot-dra7xx =3D "board-support/u-boot-${PV}-${PR}"
+CREATE_SRCIPK_pn-u-boot-dra7xx ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-u-boot-dra7xx ?=3D "board-support/u-boot-${PV}-${PR}=
"

-CREATE_SRCIPK_pn-trusted-firmware-a =3D "1"
-SRCIPK_INSTALL_DIR_pn-trusted-firmware-a =3D "board-support/${PN}-${PV}"
-SRCIPK_PRESERVE_GIT_pn-trusted-firmware-a =3D "true"
+CREATE_SRCIPK_pn-trusted-firmware-a ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-trusted-firmware-a ?=3D "board-support/${PN}-${PV}"
+SRCIPK_PRESERVE_GIT_pn-trusted-firmware-a ?=3D "true"

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

-CREATE_SRCIPK_pn-linux-keystone =3D "1"
-SRCIPK_INSTALL_DIR_pn-linux-keystone =3D "board-support/linux-${PV}"
-SRCIPK_PRESERVE_GIT_pn-linux-keystone =3D "true"
+CREATE_SRCIPK_pn-linux-keystone ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-linux-keystone ?=3D "board-support/linux-${PV}"
+SRCIPK_PRESERVE_GIT_pn-linux-keystone ?=3D "true"

-CREATE_SRCIPK_pn-linux-am335x-psp =3D "1"
-SRCIPK_INSTALL_DIR_pn-linux-am335x-psp =3D "board-support/linux-${KVER}"
+CREATE_SRCIPK_pn-linux-am335x-psp ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-linux-am335x-psp ?=3D "board-support/linux-${KVER}"

-CREATE_SRCIPK_pn-linux-omap =3D "1"
-SRCIPK_INSTALL_DIR_pn-linux-omap =3D "board-support/linux-${PV}-${PR}"
+CREATE_SRCIPK_pn-linux-omap ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-linux-omap ?=3D "board-support/linux-${PV}-${PR}"

-CREATE_SRCIPK_pn-linux =3D "1"
-SRCIPK_INSTALL_DIR_pn-linux =3D "board-support/linux-${PV}"
+CREATE_SRCIPK_pn-linux ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-linux ?=3D "board-support/linux-${PV}"

-CREATE_SRCIPK_pn-linux-omap4 =3D "1"
-SRCIPK_INSTALL_DIR_pn-linux-omap4 =3D "board-support/linux-${PV}"
+CREATE_SRCIPK_pn-linux-omap4 ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-linux-omap4 ?=3D "board-support/linux-${PV}"

-CREATE_SRCIPK_pn-cryptodev-module =3D "1"
-SRCIPK_INSTALL_DIR_pn-cryptodev-module =3D "board-support/extra-drivers/cr=
yptodev-module-${PV}"
-SRCIPK_PRESERVE_GIT_pn-cryptodev-module =3D "true"
+CREATE_SRCIPK_pn-cryptodev-module ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-cryptodev-module ?=3D "board-support/extra-drivers/c=
ryptodev-module-${PV}"
+SRCIPK_PRESERVE_GIT_pn-cryptodev-module ?=3D "true"

-CREATE_SRCIPK_pn-cmem-mod =3D "1"
-SRCIPK_INSTALL_DIR_pn-cmem-mod =3D "board-support/extra-drivers/${PN}-${PV=
}"
+CREATE_SRCIPK_pn-cmem-mod ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-cmem-mod ?=3D "board-support/extra-drivers/${PN}-${P=
V}"

-CREATE_SRCIPK_pn-debugss-module-drv =3D "1"
-SRCIPK_INSTALL_DIR_pn-debugss-module-drv =3D "board-support/extra-drivers/=
${PN}-${PV}"
+CREATE_SRCIPK_pn-debugss-module-drv ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-debugss-module-drv ?=3D "board-support/extra-drivers=
/${PN}-${PV}"

-CREATE_SRCIPK_pn-gdbserverproxy-module-drv =3D "1"
-SRCIPK_INSTALL_DIR_pn-gdbserverproxy-module-drv =3D "board-support/extra-d=
rivers/${PN}-${PV}"
+CREATE_SRCIPK_pn-gdbserverproxy-module-drv ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-gdbserverproxy-module-drv ?=3D "board-support/extra-=
drivers/${PN}-${PV}"

-CREATE_SRCIPK_pn-ti-sgx-ddk-km =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-sgx-ddk-km =3D "board-support/extra-drivers/${PN}=
-${PV}"
+CREATE_SRCIPK_pn-ti-sgx-ddk-km ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-sgx-ddk-km ?=3D "board-support/extra-drivers/${PN=
}-${PV}"

-CREATE_SRCIPK_pn-ti-img-rogue-driver =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-img-rogue-driver =3D "board-support/extra-drivers=
/${PN}-${PV}"
-SRCIPK_PRESERVE_GIT_pn-ti-img-rogue-driver =3D "true"
+CREATE_SRCIPK_pn-ti-img-rogue-driver ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-img-rogue-driver ?=3D "board-support/extra-driver=
s/${PN}-${PV}"
+SRCIPK_PRESERVE_GIT_pn-ti-img-rogue-driver ?=3D "true"

-CREATE_SRCIPK_pn-ti-gc320-driver =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-gc320-driver =3D "board-support/extra-drivers/${P=
N}-${PV}"
+CREATE_SRCIPK_pn-ti-gc320-driver ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-gc320-driver ?=3D "board-support/extra-drivers/${=
PN}-${PV}"

-CREATE_SRCIPK_pn-ti-linux-driver-examples =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples =3D "example-applications/l=
inux-driver-examples-${PV}"
+CREATE_SRCIPK_pn-ti-linux-driver-examples ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples ?=3D "example-applications/=
linux-driver-examples-${PV}"

-CREATE_SRCIPK_pn-ti-linux-driver-examples-omapl =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omapl =3D "example-applicat=
ions/linux-driver-examples-${PV}"
+CREATE_SRCIPK_pn-ti-linux-driver-examples-omapl ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omapl ?=3D "example-applica=
tions/linux-driver-examples-${PV}"

-CREATE_SRCIPK_pn-ti-linux-driver-examples-omap3 =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omap3 =3D "example-applicat=
ions/linux-driver-examples-${PV}"
+CREATE_SRCIPK_pn-ti-linux-driver-examples-omap3 ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omap3 ?=3D "example-applica=
tions/linux-driver-examples-${PV}"

-CREATE_SRCIPK_pn-ti-framework-components =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-framework-components =3D "component-sources/frame=
work_components_${PV}"
+CREATE_SRCIPK_pn-ti-framework-components ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-framework-components ?=3D "component-sources/fram=
ework_components_${PV}"

-CREATE_SRCIPK_pn-ti-codec-engine =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codec-engine =3D "component-sources/codec_engine_=
${PV}"
+CREATE_SRCIPK_pn-ti-codec-engine ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-codec-engine ?=3D "component-sources/codec_engine=
_${PV}"

-CREATE_SRCIPK_pn-ti-codecs-omap3530 =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codecs-omap3530 =3D "codecs-omap3530_${PV}"
+CREATE_SRCIPK_pn-ti-codecs-omap3530 ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-codecs-omap3530 ?=3D "codecs-omap3530_${PV}"

-CREATE_SRCIPK_pn-ti-linuxutils =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-linuxutils =3D "component-sources/linuxutils_${PV=
}"
+CREATE_SRCIPK_pn-ti-linuxutils ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-linuxutils ?=3D "component-sources/linuxutils_${P=
V}"

-CREATE_SRCIPK_pn-ti-xdctools =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-xdctools =3D "component-sources/xdctools_${PV}"
+CREATE_SRCIPK_pn-ti-xdctools ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-xdctools ?=3D "component-sources/xdctools_${PV}"

-CREATE_SRCIPK_pn-ti-dmai =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-dmai =3D "dmai_${PV}"
+CREATE_SRCIPK_pn-ti-dmai ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-dmai ?=3D "dmai_${PV}"

-CREATE_SRCIPK_pn-ti-xdais =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-xdais =3D "component-sources/xdais_${PV}"
+CREATE_SRCIPK_pn-ti-xdais ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-xdais ?=3D "component-sources/xdais_${PV}"

-CREATE_SRCIPK_pn-ti-local-power-manager =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-local-power-manager =3D "local-power-manager_${PV=
}"
+CREATE_SRCIPK_pn-ti-local-power-manager ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-local-power-manager ?=3D "local-power-manager_${P=
V}"

-CREATE_SRCIPK_pn-ti-codecs-dm355 =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codecs-dm355 =3D "codecs-dm355_${PV}"
+CREATE_SRCIPK_pn-ti-codecs-dm355 ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-codecs-dm355 ?=3D "codecs-dm355_${PV}"

-CREATE_SRCIPK_pn-ti-dvsdk-demos =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-dvsdk-demos =3D "dvsdk-demos_${PV}"
+CREATE_SRCIPK_pn-ti-dvsdk-demos ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-dvsdk-demos ?=3D "dvsdk-demos_${PV}"

-CREATE_SRCIPK_pn-ti-dvtb =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-dvtb =3D "dvtb_${PV}"
+CREATE_SRCIPK_pn-ti-dvtb ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-dvtb ?=3D "dvtb_${PV}"

-CREATE_SRCIPK_pn-ti-codecs-dm365 =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codecs-dm365 =3D "codecs-dm365_${PV}"
+CREATE_SRCIPK_pn-ti-codecs-dm365 ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-codecs-dm365 ?=3D "codecs-dm365_${PV}"

-CREATE_SRCIPK_pn-ti-dm365mm-module =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-dm365mm-module =3D "dm365mm-module_${PV}"
+CREATE_SRCIPK_pn-ti-dm365mm-module ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-dm365mm-module ?=3D "dm365mm-module_${PV}"

-CREATE_SRCIPK_pn-ti-codecs-dm6446 =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6446 =3D "codecs-dm6446_${PV}"
+CREATE_SRCIPK_pn-ti-codecs-dm6446 ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6446 ?=3D "codecs-dm6446_${PV}"

-CREATE_SRCIPK_pn-ti-codecs-dm6467 =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6467 =3D "codecs-dm6467_${PV}"
+CREATE_SRCIPK_pn-ti-codecs-dm6467 ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6467 ?=3D "codecs-dm6467_${PV}"

-CREATE_SRCIPK_pn-ti-codecs-omapl137 =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl137 =3D "codecs-omapl137_${PV}"
+CREATE_SRCIPK_pn-ti-codecs-omapl137 ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl137 ?=3D "codecs-omapl137_${PV}"

-CREATE_SRCIPK_pn-ti-codecs-omapl138 =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl138 =3D "codecs-omapl138_${PV}"
+CREATE_SRCIPK_pn-ti-codecs-omapl138 ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl138 ?=3D "codecs-omapl138_${PV}"

-CREATE_SRCIPK_pn-ti-cgt6x =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-cgt6x =3D "dsp-devkit/cgt6x_${PV}"
+CREATE_SRCIPK_pn-ti-cgt6x ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-cgt6x ?=3D "dsp-devkit/cgt6x_${PV}"

-CREATE_SRCIPK_pn-ti-cgt470 =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-cgt470 =3D "media-controller-devkit/cgt470_${PV}"
+CREATE_SRCIPK_pn-ti-cgt470 ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-cgt470 ?=3D "media-controller-devkit/cgt470_${PV}=
"

-CREATE_SRCIPK_pn-ti-dspbios =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-dspbios =3D "dspbios_${PV}"
+CREATE_SRCIPK_pn-ti-dspbios ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-dspbios ?=3D "dspbios_${PV}"

-CREATE_SRCIPK_pn-ti-sysbios =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-sysbios =3D "component-sources/bios_${PV}"
+CREATE_SRCIPK_pn-ti-sysbios ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-sysbios ?=3D "component-sources/bios_${PV}"

-CREATE_SRCIPK_pn-ti-biosutils =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-biosutils =3D "biosutils_${PV}"
+CREATE_SRCIPK_pn-ti-biosutils ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-biosutils ?=3D "biosutils_${PV}"

-CREATE_SRCIPK_pn-ti-dsplink =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-dsplink =3D "dsplink_${PV}"
+CREATE_SRCIPK_pn-ti-dsplink ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-dsplink ?=3D "dsplink_${PV}"

-CREATE_SRCIPK_pn-ti-syslink =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-syslink =3D "component-sources/syslink_${PV}"
+CREATE_SRCIPK_pn-ti-syslink ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-syslink ?=3D "component-sources/syslink_${PV}"

-CREATE_SRCIPK_pn-ti-edma3lld =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-edma3lld =3D "component-sources/edma3lld_${PV}"
+CREATE_SRCIPK_pn-ti-edma3lld ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-edma3lld ?=3D "component-sources/edma3lld_${PV}"

-CREATE_SRCIPK_pn-ti-c6accel =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-c6accel =3D "component-sources/c6accel_${PV}"
+CREATE_SRCIPK_pn-ti-c6accel ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-c6accel ?=3D "component-sources/c6accel_${PV}"

-CREATE_SRCIPK_pn-ti-biospsp =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-biospsp =3D "biospsp_${PV}"
+CREATE_SRCIPK_pn-ti-biospsp ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-biospsp ?=3D "biospsp_${PV}"

-CREATE_SRCIPK_pn-ti-audio-soc-example =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-audio-soc-example =3D "audio-soc-example_${PV}"
+CREATE_SRCIPK_pn-ti-audio-soc-example ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-audio-soc-example ?=3D "audio-soc-example_${PV}"

-CREATE_SRCIPK_pn-ti-c6run =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-c6run =3D "component-sources/c6run_${PV}"
+CREATE_SRCIPK_pn-ti-c6run ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-c6run ?=3D "component-sources/c6run_${PV}"

-CREATE_SRCIPK_pn-ti-osal =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-osal =3D "component-sources/osal_${PV}"
+CREATE_SRCIPK_pn-ti-osal ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-osal ?=3D "component-sources/osal_${PV}"

-CREATE_SRCIPK_pn-ti-ipc =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-ipc =3D "component-sources/ipc_${PV}"
+CREATE_SRCIPK_pn-ti-ipc ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-ipc ?=3D "component-sources/ipc_${PV}"

-CREATE_SRCIPK_pn-ti-dsp-benchmark =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-dsp-benchmark =3D "example-applications/dsp-bench=
mark_${PV}"
+CREATE_SRCIPK_pn-ti-dsp-benchmark ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-dsp-benchmark ?=3D "example-applications/dsp-benc=
hmark_${PV}"

-CREATE_SRCIPK_pn-gstreamer-ti =3D "1"
-SRCIPK_INSTALL_DIR_pn-gstreamer-ti =3D "gstreamer-ti_${PV}"
+CREATE_SRCIPK_pn-gstreamer-ti ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-gstreamer-ti ?=3D "gstreamer-ti_${PV}"

-CREATE_SRCIPK_pn-ti-omx =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-omx =3D "component-sources/omx_${PV}"
+CREATE_SRCIPK_pn-ti-omx ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-omx ?=3D "component-sources/omx_${PV}"

-CREATE_SRCIPK_pn-ti-uia =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-uia =3D "component-sources/uia_${PV}"
+CREATE_SRCIPK_pn-ti-uia ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-uia ?=3D "component-sources/uia_${PV}"

-CREATE_SRCIPK_pn-ti-media-controller-utils =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-media-controller-utils =3D "board-support/media-c=
ontroller-utils_${PV}"
+CREATE_SRCIPK_pn-ti-media-controller-utils ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-media-controller-utils ?=3D "board-support/media-=
controller-utils_${PV}"

-CREATE_SRCIPK_pn-ti-firmware-dm816x =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-firmware-dm816x =3D "board-support/prebuilt-image=
s/dm816x-firmware_${PV}"
+CREATE_SRCIPK_pn-ti-firmware-dm816x ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-firmware-dm816x ?=3D "board-support/prebuilt-imag=
es/dm816x-firmware_${PV}"

-CREATE_SRCIPK_pn-ti-firmware-dm814x =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-firmware-dm814x =3D "board-support/prebuilt-image=
s/dm814x-firmware_${PV}"
+CREATE_SRCIPK_pn-ti-firmware-dm814x ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-firmware-dm814x ?=3D "board-support/prebuilt-imag=
es/dm814x-firmware_${PV}"

-CREATE_SRCIPK_pn-ti-slog =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-slog =3D "component-sources/slog_${PV}"
+CREATE_SRCIPK_pn-ti-slog ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-slog ?=3D "component-sources/slog_${PV}"

-CREATE_SRCIPK_pn-ti-c674x-aaclcdec =3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-c674x-aaclcdec =3D "component-sources/c674x-aaclc=
dec_${PV}"
+CREATE_SRCIPK_pn-ti-c674x-aaclcdec ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ti-c674x-aaclcdec ?=3D "component-sources/c674x-aacl=
cdec_${PV}"

-CREATE_SRCIPK_pn-oe-layersetup =3D "1"
-SRCIPK_INSTALL_DIR_pn-oe-layersetup =3D "bin/oe-layersetup"
+CREATE_SRCIPK_pn-oe-layersetup ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-oe-layersetup ?=3D "bin/oe-layersetup"

-CREATE_SRCIPK_pn-opencl-examples =3D "1"
-SRCIPK_INSTALL_DIR_pn-opencl-examples =3D "example-applications/${PN}-${PV=
}"
+CREATE_SRCIPK_pn-opencl-examples ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-opencl-examples ?=3D "example-applications/${PN}-${P=
V}"

-CREATE_SRCIPK_pn-openmpacc-examples =3D "1"
-SRCIPK_INSTALL_DIR_pn-openmpacc-examples =3D "example-applications/${PN}-$=
{PV}"
+CREATE_SRCIPK_pn-openmpacc-examples ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-openmpacc-examples ?=3D "example-applications/${PN}-=
${PV}"

-CREATE_SRCIPK_pn-tidl-examples =3D "1"
-SRCIPK_INSTALL_DIR_pn-tidl-examples =3D "example-applications/${PN}-${PV}"
-SRCIPK_SRC_DIR_pn-tidl-examples =3D "${S}/examples"
+CREATE_SRCIPK_pn-tidl-examples ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-tidl-examples ?=3D "example-applications/${PN}-${PV}=
"
+SRCIPK_SRC_DIR_pn-tidl-examples ?=3D "${S}/examples"

-CREATE_SRCIPK_pn-qt-opencv-opencl-opengl-multithreaded =3D "1"
-SRCIPK_INSTALL_DIR_pn-qt-opencv-opencl-opengl-multithreaded =3D "example-a=
pplications/${PN}-${PV}"
+CREATE_SRCIPK_pn-qt-opencv-opencl-opengl-multithreaded ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-qt-opencv-opencl-opengl-multithreaded ?=3D "example-=
applications/${PN}-${PV}"

-CREATE_SRCIPK_pn-libarch-examples =3D "1"
-SRCIPK_INSTALL_DIR_pn-libarch-examples =3D "example-applications/${PN}-${P=
V}"
+CREATE_SRCIPK_pn-libarch-examples ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-libarch-examples ?=3D "example-applications/${PN}-${=
PV}"

-CREATE_SRCIPK_pn-linalg-examples =3D "1"
-SRCIPK_INSTALL_DIR_pn-linalg-examples =3D "example-applications/${PN}-${PV=
}"
-SRCIPK_SRC_DIR_pn-linalg-examples =3D "${EXAMPLES_ROOT}"
+CREATE_SRCIPK_pn-linalg-examples ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-linalg-examples ?=3D "example-applications/${PN}-${P=
V}"
+SRCIPK_SRC_DIR_pn-linalg-examples ?=3D "${EXAMPLES_ROOT}"

-CREATE_SRCIPK_pn-barcode-roi =3D "1"
-SRCIPK_INSTALL_DIR_pn-barcode-roi =3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK_pn-barcode-roi ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-barcode-roi ?=3D "example-applications/${PN}-${PV}"

-CREATE_SRCIPK_pn-boot-monitor =3D "1"
-SRCIPK_INSTALL_DIR_pn-boot-monitor =3D "board-support/${PN}-${PV}"
+CREATE_SRCIPK_pn-boot-monitor ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-boot-monitor ?=3D "board-support/${PN}-${PV}"

-CREATE_SRCIPK_pn-hplib-mod =3D "1"
-SRCIPK_INSTALL_DIR_pn-hplib-mod =3D "board-support/extra-drivers/${PN}-${P=
V}"
+CREATE_SRCIPK_pn-hplib-mod ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-hplib-mod ?=3D "board-support/extra-drivers/${PN}-${=
PV}"

-CREATE_SRCIPK_pn-uio-module-drv =3D "1"
-SRCIPK_INSTALL_DIR_pn-uio-module-drv =3D "board-support/extra-drivers/${PN=
}-${PV}"
+CREATE_SRCIPK_pn-uio-module-drv ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-uio-module-drv ?=3D "board-support/extra-drivers/${P=
N}-${PV}"

-CREATE_SRCIPK_pn-ivshmem-uio-driver =3D "1"
-SRCIPK_INSTALL_DIR_pn-ivshmem-uio-driver =3D "board-support/extra-drivers/=
${PN}-${PV}"
-SRCIPK_PRESERVE_GIT_pn-ivshmem-uio-driver =3D "true"
+CREATE_SRCIPK_pn-ivshmem-uio-driver ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ivshmem-uio-driver ?=3D "board-support/extra-drivers=
/${PN}-${PV}"
+SRCIPK_PRESERVE_GIT_pn-ivshmem-uio-driver ?=3D "true"

-CREATE_SRCIPK_pn-ipsecmgr-mod =3D "1"
-SRCIPK_INSTALL_DIR_pn-ipsecmgr-mod =3D "board-support/extra-drivers/${PN}-=
${PV}"
+CREATE_SRCIPK_pn-ipsecmgr-mod ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-ipsecmgr-mod ?=3D "board-support/extra-drivers/${PN}=
-${PV}"

-CREATE_SRCIPK_pn-pru-icss =3D "1"
-SRCIPK_INSTALL_DIR_pn-pru-icss =3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK_pn-pru-icss ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-pru-icss ?=3D "example-applications/${PN}-${PV}"

-CREATE_SRCIPK_pn-dsplib-c66x =3D "1"
-SRCIPK_INSTALL_DIR_pn-dsplib-c66x =3D "component-sources/dsplib_c66x_${PV}=
"
+CREATE_SRCIPK_pn-dsplib-c66x ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-dsplib-c66x ?=3D "component-sources/dsplib_c66x_${PV=
}"

-CREATE_SRCIPK_pn-mathlib-c66x =3D "1"
-SRCIPK_INSTALL_DIR_pn-mathlib-c66x =3D "component-sources/mathlib_c66x_${P=
V}"
+CREATE_SRCIPK_pn-mathlib-c66x ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-mathlib-c66x ?=3D "component-sources/mathlib_c66x_${=
PV}"

-CREATE_SRCIPK_pn-imglib-c66x =3D "1"
-SRCIPK_INSTALL_DIR_pn-imglib-c66x =3D "component-sources/imglib_c66x_${PV}=
"
+CREATE_SRCIPK_pn-imglib-c66x ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-imglib-c66x ?=3D "component-sources/imglib_c66x_${PV=
}"

-CREATE_SRCIPK_pn-vlib-c66x =3D "1"
-SRCIPK_INSTALL_DIR_pn-vlib-c66x =3D "component-sources/vlib_c66x_${PV}"
+CREATE_SRCIPK_pn-vlib-c66x ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-vlib-c66x ?=3D "component-sources/vlib_c66x_${PV}"

-CREATE_SRCIPK_pn-big-data-ipc-demo-linux =3D "1"
-SRCIPK_INSTALL_DIR_pn-big-data-ipc-demo-linux =3D "example-applications/${=
PN}-${PV}"
+CREATE_SRCIPK_pn-big-data-ipc-demo-linux ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-big-data-ipc-demo-linux ?=3D "example-applications/$=
{PN}-${PV}"

-CREATE_SRCIPK_pn-jailhouse =3D "1"
-SRCIPK_INSTALL_DIR_pn-jailhouse =3D "board-support/extra-drivers/${PN}-${P=
V}"
+CREATE_SRCIPK_pn-jailhouse ?=3D "1"
+SRCIPK_INSTALL_DIR_pn-jailhouse ?=3D "board-support/extra-drivers/${PN}-${=
PV}"
--
2.17.1

________________________________
 This email is confidential and may contain information subject to legal pr=
ivilege. If you are not the intended recipient please advise us of our erro=
r by return e-mail then delete this email and any attached files. You may n=
ot copy, disclose or use the contents in any way. The views expressed in th=
is email may not be those of Gallagher Group Ltd or subsidiary companies th=
ereof.
________________________________

