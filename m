Return-Path: <Ankur.Tyagi@gallagher.com>
Received: from AUS01-ME1-obe.outbound.protection.outlook.com
	(mail-eopbgr1360100.outbound.protection.outlook.com [40.107.136.100])
	by arago-project.org (Postfix) with ESMTPS id 7257252A35
	for <meta-arago@arago-project.org>;
	Mon, 15 Jun 2020 19:44:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Z6PKYCtX8Lenaxy3nhV/zkqWkSEdBcJqiryu9RBAmPdQ1OP8TGV8aanw3vcWqJNaI0ySxEV0cBGMRTlve2nHil+jzaKBNOtM9ooogzcio7J4rfo/wOC0rDVwDppQneWhmU6lKTLN0l8LajC8ZjDAExefoj1lE0y3O5eBgelmEBf9IadtmV74+AeSjQc4UdLsDvaHBXs2YzN8U5uS4H1rT6RU65Bj7PStqSa9vxUmS4GQyWOv74BOYBi9ZDlmTqMS4j3+IOs7LiMSc2fH5eOWeqtKyP84E0Ar6Opmlxy6WZKNxQ89SJS8eBv/uC2A65wLtHf9gXy8yGuqOJBEqI3MyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Ic6SES5NjMlxbqUupgl+e7DrQd8B/+YEDy7MnOUOjGs=;
	b=Jrie6K5kLBu7CEsKWnK1+6t3yX7MJWXHbkUZ9wgZ3ervPTNf/ewpsSR2ZDW4qXVnp3DMZBcQOYVsrTkPO2KB6IfRNDV3qbYMs8yw/lFQ3Fz9nx3GkSJfKYHTbijD9zRyCDP31/YIgh3tGrO1A4rjG9neangscI9k8V0YYMjh5BFIdvTNFZZuEsG4eYR8hRL0Kj7/jJbMjysQgPQMmWufCDhz5ZplXe6SOzodmd4lPLHlrFsh9NgqIj9xmmsCLlad6N3eI1bhbQn7HjN8VGYeuw16Bw6RD18tqFwMfgNtA2TXMH5CL4ujGrx0JEEfz7MwoEzkqxlM54oQ/pvVrIWt9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=gallagher.com; dmarc=pass action=none
	header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Ic6SES5NjMlxbqUupgl+e7DrQd8B/+YEDy7MnOUOjGs=;
	b=U5Pbse56V3vH7POXb7ThUSm5GpqagriJyXN1d2U2SoalBZqclyQNPGkEWohGC0Z4ULPyAw3WlEncQqvJh1mF7Vz1BD2UqzS9XDs111g2IVHTgCIvwwIq3QVKhTVXBi3dQQnS+7vBefjHEl/aNslLEvY8YeKNMwrob3EWqKc6c08=
Received: from SY3PR01MB0809.ausprd01.prod.outlook.com (2603:10c6:0:6::12) by
	SY3PR01MB2012.ausprd01.prod.outlook.com (2603:10c6:0:20::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.3088.26; Mon, 15 Jun 2020 19:41:37 +0000
Received: from SY3PR01MB0809.ausprd01.prod.outlook.com
	([fe80::7d3b:74f3:fc8:6fb7]) by SY3PR01MB0809.ausprd01.prod.outlook.com
	([fe80::7d3b:74f3:fc8:6fb7%9]) with mapi id 15.20.3088.029;
	Mon, 15 Jun 2020 19:41:37 +0000
From: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [dunfell/master PATCH] arago-source-ipk.inc: Use
	weak assignment to create source ipk file
Thread-Index: AQHWQ0z7X9zmWVw4l06C5l8oHVc3XA==
Date: Mon, 15 Jun 2020 19:41:37 +0000
Message-ID: <SY3PR01MB08094675F22049EFC5885294E59C0@SY3PR01MB0809.ausprd01.prod.outlook.com>
References: <20200611223129.58314-1-ankur.tyagi@gallagher.com>
	<SYXPR01MB1088B788FE7E2A6BC89E11F1E5800@SYXPR01MB1088.ausprd01.prod.outlook.com>
In-Reply-To: <SYXPR01MB1088B788FE7E2A6BC89E11F1E5800@SYXPR01MB1088.ausprd01.prod.outlook.com>
Accept-Language: en-NZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arago-project.org; dkim=none (message not signed)
	header.d=none;arago-project.org; dmarc=none action=none
	header.from=gallagher.com;
x-originating-ip: [139.180.92.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 636d884f-b743-4dd1-6bd6-08d811641e2e
x-ms-traffictypediagnostic: SY3PR01MB2012:
x-microsoft-antispam-prvs: <SY3PR01MB2012C122E7647826680BA3A4E59C0@SY3PR01MB2012.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 04359FAD81
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sgLD5FsLhOHju2LFMACrMdPgpKlB/J//z6wsbOkEshVw+7qyAYg7bvX2u+HwVkuoHMTWBhf5rWKxAP8AlNheNaLD0m7/TCWBvZnmlaYljmqlqQPOjxCfh7hv3QwUk7ml8zmNskQG2a1JYCRMF9iApvLKem+HfcDpq1KTMdxBF74AS/VmgJIQ//us7E4VcNDFoRd/K/fDVtWRA5qbYHDZ2FySTbOtP2woaEbbsxR/ZyiVilpX2IgT/jyWnnbEF1nMnYX34xg7ti/wCqL0TwRf0Hm2lQIpwrWKaW0fu1tqtuwma3oxy6/AgbuWkqn8jxzjQUDdzWKQ6vv8BzeWkhVkl+P5irehqs+ENCsMUni9OkKg0MveGKjBF4RiJ8Kj8es3wjims2H8ZPEAbK3GbLM7cQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SY3PR01MB0809.ausprd01.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(366004)(39850400004)(346002)(136003)(376002)(478600001)(5660300002)(2906002)(66946007)(110136005)(66446008)(52536014)(7696005)(76116006)(66556008)(66476007)(316002)(64756008)(83380400001)(8676002)(8936002)(26005)(53546011)(6506007)(71200400001)(30864003)(186003)(966005)(9686003)(66574014)(33656002)(55016002)(86362001)(559001)(579004);
	DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Da4LMIrixE3tN+EpQ3jZ3NMTPeChlPDyHKjubPOv1g7e8BkOtMj1J7lK0/IzBTRiVkE60DLM5pwL3SEU01I9O0N8iJwKoo8WQwgb3DmpINotfDjfJLfZB4FMePBsWXrqvckWSHALfDLWIHzXp1BiROV/ZxG+RLdaqZSqlMWXtDIpfI/VALP3ogiGEv7X+wSbRr2sT6DOyqK1FBhmtJzzZTdvsXGU4VlnaLqJZOR0STA4fBi7TGskJPysg0UdicXY/ExDcVJmtzK9fKCgZ/iDMqEZUI65+ggKZ9XW4eIy3raCPFpsaRFD2Gyok3xorW+p9sUGcyMu3SxczxVAxIeZLr2WwLAXjMHZprmCRPfrR9qzK/JjhCntSC9/JecZouivQwZ0nCQScYSWIzvsEVvc+ymWU4YBQnYKA6/e74pRNkM0t4+3t8GovQ1G3E+kPR/AxMqPiCPwHndXMDEIjr7SO+mKePDYCt/VKZ/aAD3LvSN6N2XeEqiwd/0vMR4o3XwP
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 636d884f-b743-4dd1-6bd6-08d811641e2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2020 19:41:37.2606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IkBczgpDKXm0FCby/JSF8y78GgN1tkUtPtqIuC07e5lLjj6duP2O4+cYbDRtb54owTR+i6JWUpDoq2Vk+Df1VpgX6k4Dhtqkq0EP0SExQAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY3PR01MB2012
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
X-List-Received-Date: Mon, 15 Jun 2020 19:44:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

Gentle reminder as this patch has been in mailing list for some time now (h=
ttp://arago-project.org/pipermail/meta-arago/2020-June/012694.html)
And I haven't heard anything back.

Regards
Ankur

-----Original Message-----
From: meta-arago-bounces@arago-project.org <meta-arago-bounces@arago-projec=
t.org> On Behalf Of Ankur Tyagi
Sent: Friday, 12 June 2020 10:50 AM
To: meta-arago@arago-project.org
Subject: [meta-arago] [dunfell/master PATCH] arago-source-ipk.inc: Use weak=
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

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

