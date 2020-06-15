Return-Path: <Ankur.Tyagi@gallagher.com>
Received: from AUS01-SY3-obe.outbound.protection.outlook.com
	(mail-eopbgr1370097.outbound.protection.outlook.com [40.107.137.97])
	by arago-project.org (Postfix) with ESMTPS id 225AB52A73
	for <meta-arago@arago-project.org>;
	Mon, 15 Jun 2020 19:50:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Rzj8zWEA0uj/mqREOF2rgbr9491zcRC4LeLafhvEzBwWezYzPPcGcnhlcmTNx2OiDgJVMLgXCS2xOfVGVXXwgJ5ly4SKSt+TtE34k8Nk3fLnl/d5uuIDrzYKWZRXMe28swPA24VyBF32AQ2pI8BYGESvb2Z8SGRCI79XdqsmITlZW7If9EwJ+F4UaN+ig+dHCfgC3keGSp0BUxWU8YN/c/vYwiQSm0J+N+mvQ8WKPyhGdY3/cBdJj+f2YKHijz5rSyXSAug4wcUPfTSnzvpNxcxbjSjEFUhSyVWD8bceDXE991SbuBxPjCna2JkHH1AtDWA3BNLYgb0mn3LoH/W4ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=UqiPly/CfcXUMtggPDwmrAKn3g5BsKWwHx2gbd+EyyQ=;
	b=id3NUR2j9LVGpvBXdQID9icGcLGenX1dQKZ/YSQPJajBbZRZ8Uuu4DqJL98KNg3eJspvVV7/2HT6dwVzraTGih6j9lWCvEY9dkHmL9blgS01NtMP262JE0rbM1HV5hl6i1nAIP9miTre9zYi0i2INWOI74rLn3GmVluywmxxyiZt4EME8vzdxB+hd72JO+hZ5roj4aExhEdizlupZALerlx2Y1wpqWXVaUGh6+gDbwJ7qzot++aKWRJ5cg8B7bgvZSx46/HN6qnTI0Ir/bkWLZJ4OxONzOPW3G5FHpDCgnoiX9ZW+bDVZVuJE70cg73QDtgVZksjFYhRlkakjxe4OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=gallagher.com; dmarc=pass action=none
	header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=UqiPly/CfcXUMtggPDwmrAKn3g5BsKWwHx2gbd+EyyQ=;
	b=pfcn+7xtmUMKfF93vXC77fMRxTsmfwzpxYyjogdm/lWxi17N+LAhsMklYopj9ePQuMR5//XOUFtAcgoUCx5V7W4V+IoN894Ab5Pz7W3zTH6X9keCAc2ISB0OUuud7jbzHz9vcmIOJ/tcJfc4v1MRyhn6A9cKhg/9P2QftB6nu9Y=
Received: from SY3PR01MB0809.ausprd01.prod.outlook.com (2603:10c6:0:6::12) by
	SY3PR01MB0924.ausprd01.prod.outlook.com (2603:10c6:0:7::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.3088.18; Mon, 15 Jun 2020 19:48:09 +0000
Received: from SY3PR01MB0809.ausprd01.prod.outlook.com
	([fe80::7d3b:74f3:fc8:6fb7]) by SY3PR01MB0809.ausprd01.prod.outlook.com
	([fe80::7d3b:74f3:fc8:6fb7%9]) with mapi id 15.20.3088.029;
	Mon, 15 Jun 2020 19:48:09 +0000
From: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
To: Denys Dmytriyenko <denys@ti.com>
Thread-Topic: [meta-arago] [dunfell/master PATCH] arago-source-ipk.inc: Use
	weak assignment to create source ipk file
Thread-Index: AQHWQ0z7X9zmWVw4l06C5l8oHVc3XKjaE7WAgAAAvxA=
Date: Mon, 15 Jun 2020 19:48:09 +0000
Message-ID: <SY3PR01MB0809BD21F26C827689B854E5E59C0@SY3PR01MB0809.ausprd01.prod.outlook.com>
References: <20200611223129.58314-1-ankur.tyagi@gallagher.com>
	<SYXPR01MB1088B788FE7E2A6BC89E11F1E5800@SYXPR01MB1088.ausprd01.prod.outlook.com>
	<SY3PR01MB08094675F22049EFC5885294E59C0@SY3PR01MB0809.ausprd01.prod.outlook.com>
	<20200615194251.GC10991@beryl>
In-Reply-To: <20200615194251.GC10991@beryl>
Accept-Language: en-NZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
	header.d=none; ti.com; dmarc=none action=none header.from=gallagher.com;
x-originating-ip: [139.180.92.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d19d20f-207a-4510-9f12-08d8116507f0
x-ms-traffictypediagnostic: SY3PR01MB0924:
x-microsoft-antispam-prvs: <SY3PR01MB0924DC882A740F036CA2B497E59C0@SY3PR01MB0924.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 04359FAD81
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JFOAMN03bohWkplGfiezLen7E+DcbQ7Z3XYjAJhgC1C1+erhyEXgPlQuRZP0VMJPe9II4f1oExruM1D45ePQZPY+nsLS7EN77Z/oH8ZYd1ORd2XfIK/hp8oIcZsaODOmQSMIROJX0kRs0n12afQgbKNoHCvXX6VKy/wjZ7Rl7PMX6lZtVI9dp72IlLdD09weyGjfHMmQo1HzeQL6sASQdFRhZXNAzz+NIX0AFqRF7rcWj8dTO4ev/guA7WVRopUjoCBgDSaMe6JnsTevdhCv54yxYxLOFqFi1FXc3DKBtc6xX/iA2JJBkPYn22kV9OZNEy7P7gkrVa5QapLBSC9PHEjpyKNKJy2LNmRyRG7y43o/ZpiJjoavFF8+/XdnoebYDnEk6SkjS5ObJ/VXUUQDjA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SY3PR01MB0809.ausprd01.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(136003)(366004)(39850400004)(376002)(346002)(8676002)(52536014)(186003)(316002)(26005)(64756008)(66446008)(66556008)(7696005)(66946007)(6506007)(66476007)(53546011)(76116006)(71200400001)(8936002)(86362001)(55016002)(9686003)(966005)(30864003)(33656002)(66574014)(2906002)(5660300002)(4326008)(6916009)(83380400001)(478600001)(559001)(579004);
	DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: lqL9DFwQbDVT6cg0bTt0V8iecHgmTxA5YESrTbJXsoTgzJjCQ23/bWY9e+RXbxlBqVkMNlPcFab+9a2PxbiO3QxSyp9w9M2csNLYWGTxxecRqJJ1Hg4Jj3Tu8Ii6nMwtA/Q6F+acyWJvTsZS6AzGeZxg/u9SHY25ZR3daVt6dAXZvbtUvJmb6r9pRIw7kbB9eqLbQWXMOSPdLrvdkrUlaIFDFlk5E59GXvPkCtHkDiUhDg9KbpMfyrHLX//+C/bFwuzP3cdkif64QxmqegtNGlpAS02itDltn4UmrIx2Fn6SlSHH0d/6dTSTZ/INg0Mk0R0LJsWHmMxW1JBJ3d+gwhA0FpvySGrRxgk0tQt/lVh/A708veNWF+YL4Z2pSYmqYy8UCLB1A3L4oCR92dvLeIk5CmcwX/bY2IvFxJpWtapdsQCHP8zpZjlpwRv8WclbKXkmvhoU06rC2BbA0+onKxx57ElOQI5xKoQkWkpsU/dOyrmtGUR1v2KhM9Xu1s+o
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d19d20f-207a-4510-9f12-08d8116507f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2020 19:48:09.4124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2NPTanRfbWdzjGQ1Cx5axFaDXn7gfGWImBQ/UX7zJYmEnxySh3c3IvO7Iqk9lovDlTZZt4oq/ZMCzyhpsUU7nE0jFCb40EWzusnLmmJSdW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY3PR01MB0924
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Mon, 15 Jun 2020 19:50:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

Yes, received your response and then I resent the patch.
Something went wrong with the first patch but second patch did made it to t=
he mailing list.

Regards
Ankur

-----Original Message-----
From: Denys Dmytriyenko <denys@ti.com>=20
Sent: Tuesday, 16 June 2020 7:43 AM
To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [dunfell/master PATCH] arago-source-ipk.inc: Use =
weak assignment to create source ipk file

On Mon, Jun 15, 2020 at 07:41:37PM +0000, Ankur Tyagi wrote:
> Hi Denys,
>=20
> Gentle reminder as this patch has been in mailing list for some time now=
=20
> (http://arago-project.org/pipermail/meta-arago/2020-June/012694.html)
> And I haven't heard anything back.

And here:
http://arago-project.org/pipermail/meta-arago/2020-June/012693.html


> Regards
> Ankur
>=20
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org <meta-arago-bounces@arago-proj=
ect.org> On Behalf Of Ankur Tyagi
> Sent: Friday, 12 June 2020 10:50 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [dunfell/master PATCH] arago-source-ipk.inc: Use we=
ak assignment to create source ipk file
>=20
> This is to allow user to override(disable) them in their configuration.
>=20
> Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
> ---
>  .../conf/distro/include/arago-source-ipk.inc  | 504 +++++++++---------
>  1 file changed, 252 insertions(+), 252 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b=
/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> index c479a8c8..5ffdc982 100644
> --- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> @@ -40,371 +40,371 @@ INHERIT +=3D "sourceipk"
>  SRCIPK_INCLUDE_EXTRAFILES =3D "0"
> =20
>  # Set source ipk packages and install directories
> -CREATE_SRCIPK_pn-ti-tisdk-licenses =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-tisdk-licenses =3D "docs/licenses"
> +CREATE_SRCIPK_pn-ti-tisdk-licenses ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-tisdk-licenses ?=3D "docs/licenses"
> =20
> -CREATE_SRCIPK_pn-matrix-gui =3D "1"
> -SRCIPK_INSTALL_DIR_pn-matrix-gui =3D "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-matrix-gui ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-matrix-gui ?=3D "example-applications/${PN}-${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-crypto-examples =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-crypto-examples =3D "example-applications/${PN}=
-${PV}"
> +CREATE_SRCIPK_pn-ti-crypto-examples ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-crypto-examples ?=3D "example-applications/${PN=
}-${PV}"
> =20
> -CREATE_SRCIPK_pn-qml-carinfo =3D "1"
> -SRCIPK_INSTALL_DIR_pn-qml-carinfo =3D "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-qml-carinfo ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-qml-carinfo ?=3D "example-applications/${PN}-${PV}=
"
> =20
> -CREATE_SRCIPK_pn-quick-playground =3D "1"
> -SRCIPK_INSTALL_DIR_pn-quick-playground =3D "example-applications/${PN}-$=
{PV}"
> +CREATE_SRCIPK_pn-quick-playground ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-quick-playground ?=3D "example-applications/${PN}-=
${PV}"
> =20
> -CREATE_SRCIPK_pn-qt-catalog =3D "1"
> -SRCIPK_INSTALL_DIR_pn-qt-catalog =3D "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-qt-catalog ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-qt-catalog ?=3D "example-applications/${PN}-${PV}"
> =20
> -CREATE_SRCIPK_pn-qt-patientcare =3D "1"
> -SRCIPK_INSTALL_DIR_pn-qt-patientcare =3D "example-applications/${PN}-${P=
V}"
> +CREATE_SRCIPK_pn-qt-patientcare ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-qt-patientcare ?=3D "example-applications/${PN}-${=
PV}"
> =20
> -CREATE_SRCIPK_pn-qt-tstat =3D "1"
> -SRCIPK_INSTALL_DIR_pn-qt-tstat =3D "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-qt-tstat ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-qt-tstat ?=3D "example-applications/${PN}-${PV}"
> =20
> -CREATE_SRCIPK_pn-dual-camera-demo =3D "1"
> -SRCIPK_INSTALL_DIR_pn-dual-camera-demo =3D "example-applications/${PN}-$=
{PV}"
> +CREATE_SRCIPK_pn-dual-camera-demo ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-dual-camera-demo ?=3D "example-applications/${PN}-=
${PV}"
> =20
> -CREATE_SRCIPK_pn-evse-hmi =3D "1"
> -SRCIPK_INSTALL_DIR_pn-evse-hmi =3D "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-evse-hmi ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-evse-hmi ?=3D "example-applications/${PN}-${PV}"
> =20
> -CREATE_SRCIPK_pn-protection-relays-hmi =3D "1"
> -SRCIPK_INSTALL_DIR_pn-protection-relays-hmi =3D "example-applications/${=
PN}-${PV}"
> +CREATE_SRCIPK_pn-protection-relays-hmi ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-protection-relays-hmi ?=3D "example-applications/$=
{PN}-${PV}"
> =20
> -CREATE_SRCIPK_pn-mmwavegesture-hmi =3D "1"
> -SRCIPK_INSTALL_DIR_pn-mmwavegesture-hmi =3D "example-applications/${PN}-=
${PV}"
> +CREATE_SRCIPK_pn-mmwavegesture-hmi ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-mmwavegesture-hmi ?=3D "example-applications/${PN}=
-${PV}"
> =20
> -CREATE_SRCIPK_pn-pdm-anomaly-detection =3D "1"
> -SRCIPK_INSTALL_DIR_pn-pdm-anomaly-detection =3D "example-applications/${=
PN}-${PV}"
> +CREATE_SRCIPK_pn-pdm-anomaly-detection ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-pdm-anomaly-detection ?=3D "example-applications/$=
{PN}-${PV}"
> =20
> -CREATE_SRCIPK_pn-tiovx-app-host =3D "1"
> -SRCIPK_INSTALL_DIR_pn-tiovx-app-host =3D "example-applications/${PN}-${P=
V}"
> +CREATE_SRCIPK_pn-tiovx-app-host ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-tiovx-app-host ?=3D "example-applications/${PN}-${=
PV}"
> =20
> -CREATE_SRCIPK_pn-image-gallery =3D "1"
> -SRCIPK_INSTALL_DIR_pn-image-gallery =3D "example-applications/${PN}"
> +CREATE_SRCIPK_pn-image-gallery ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-image-gallery ?=3D "example-applications/${PN}"
> =20
> -CREATE_SRCIPK_pn-matrix-gui-browser =3D "1"
> -SRCIPK_INSTALL_DIR_pn-matrix-gui-browser =3D "example-applications/${PN}=
-${PV}"
> +CREATE_SRCIPK_pn-matrix-gui-browser ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-matrix-gui-browser ?=3D "example-applications/${PN=
}-${PV}"
> =20
> -CREATE_SRCIPK_pn-refresh-screen =3D "1"
> -SRCIPK_INSTALL_DIR_pn-refresh-screen =3D "example-applications/${PN}-${P=
V}"
> +CREATE_SRCIPK_pn-refresh-screen ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-refresh-screen ?=3D "example-applications/${PN}-${=
PV}"
> =20
> -CREATE_SRCIPK_pn-am-sysinfo =3D "1"
> -SRCIPK_INSTALL_DIR_pn-am-sysinfo =3D "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-am-sysinfo ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-am-sysinfo ?=3D "example-applications/${PN}-${PV}"
> =20
> -CREATE_SRCIPK_pn-oprofile-example =3D "1"
> -SRCIPK_INSTALL_DIR_pn-oprofile-example =3D "example-applications/${PN}"
> +CREATE_SRCIPK_pn-oprofile-example ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-oprofile-example ?=3D "example-applications/${PN}"
> =20
> -CREATE_SRCIPK_pn-arm-benchmarks =3D "1"
> -SRCIPK_INSTALL_DIR_pn-arm-benchmarks =3D "example-applications/${PN}-${P=
V}"
> +CREATE_SRCIPK_pn-arm-benchmarks ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-arm-benchmarks ?=3D "example-applications/${PN}-${=
PV}"
> =20
> -CREATE_SRCIPK_pn-omapconf =3D "1"
> -SRCIPK_INSTALL_DIR_pn-omapconf =3D "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-omapconf ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-omapconf ?=3D "example-applications/${PN}-${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-pru-sw-examples =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-pru-sw-examples =3D "example-applications/pru-$=
{PV}"
> +CREATE_SRCIPK_pn-ti-pru-sw-examples ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-pru-sw-examples ?=3D "example-applications/pru-=
${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-ocf-crypto-module =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-ocf-crypto-module =3D "board-support/extra-driv=
ers/${PN}-${PV}"
> +CREATE_SRCIPK_pn-ti-ocf-crypto-module ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-ocf-crypto-module ?=3D "board-support/extra-dri=
vers/${PN}-${PV}"
> =20
> -CREATE_SRCIPK_pn-omap3-sgx-modules =3D "1"
> -SRCIPK_INSTALL_DIR_pn-omap3-sgx-modules =3D "board-support/extra-drivers=
/sgx-modules-${PV}"
> +CREATE_SRCIPK_pn-omap3-sgx-modules ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-omap3-sgx-modules ?=3D "board-support/extra-driver=
s/sgx-modules-${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-compat-wireless-wl18xx =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-compat-wireless-wl18xx =3D "board-support/extra=
-drivers/${PN}-${PV}"
> +CREATE_SRCIPK_pn-ti-compat-wireless-wl18xx ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-compat-wireless-wl18xx ?=3D "board-support/extr=
a-drivers/${PN}-${PV}"
> =20
> -CREATE_SRCIPK_pn-wl18xx-fw =3D "1"
> -SRCIPK_INSTALL_DIR_pn-wl18xx-fw =3D "board-support/extra-drivers/${PN}-$=
{PV}"
> +CREATE_SRCIPK_pn-wl18xx-fw ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-wl18xx-fw ?=3D "board-support/extra-drivers/${PN}-=
${PV}"
> =20
> -CREATE_SRCIPK_pn-wl1271-wlan-cli =3D "1"
> -SRCIPK_INSTALL_DIR_pn-wl1271-wlan-cli =3D "example-applications/wlan"
> +CREATE_SRCIPK_pn-wl1271-wlan-cli ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-wl1271-wlan-cli ?=3D "example-applications/wlan"
> =20
> -CREATE_SRCIPK_pn-av-examples =3D "1"
> -SRCIPK_INSTALL_DIR_pn-av-examples =3D "example-applications/av-examples-=
${PV}"
> +CREATE_SRCIPK_pn-av-examples ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-av-examples ?=3D "example-applications/av-examples=
-${PV}"
> =20
> -CREATE_SRCIPK_pn-u-boot =3D "1"
> -SRCIPK_INSTALL_DIR_pn-u-boot =3D "board-support/u-boot-${PV}"
> +CREATE_SRCIPK_pn-u-boot ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-u-boot ?=3D "board-support/u-boot-${PV}"
>  # For beagleboard we use the git version which doesn't define UVER
> -SRCIPK_INSTALL_DIR_pn-u-boot_beagleboard =3D "board-support/${P}"
> +SRCIPK_INSTALL_DIR_pn-u-boot_beagleboard ?=3D "board-support/${P}"
> =20
> -CREATE_SRCIPK_pn-x-load =3D "1"
> -SRCIPK_INSTALL_DIR_pn-x-load =3D "board-support/x-load-${XVER}-psp${PSPR=
EL}"
> +CREATE_SRCIPK_pn-x-load ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-x-load ?=3D "board-support/x-load-${XVER}-psp${PSP=
REL}"
>  # For beagleboard we use the git version which doesn't define XVER
> -SRCIPK_INSTALL_DIR_pn-x-load_beagleboard =3D "board-support/${P}"
> +SRCIPK_INSTALL_DIR_pn-x-load_beagleboard ?=3D "board-support/${P}"
> =20
> -CREATE_SRCIPK_pn-u-boot-ti-staging =3D "1"
> -SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging =3D "board-support/u-boot-${PV}$=
{UBOOT_LOCALVERSION}"
> -SRCIPK_PRESERVE_GIT_pn-u-boot-ti-staging =3D "true"
> +CREATE_SRCIPK_pn-u-boot-ti-staging ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging ?=3D "board-support/u-boot-${PV}=
${UBOOT_LOCALVERSION}"
> +SRCIPK_PRESERVE_GIT_pn-u-boot-ti-staging ?=3D "true"
> =20
> -CREATE_SRCIPK_pn-u-boot-keystone =3D "1"
> -SRCIPK_INSTALL_DIR_pn-u-boot-keystone =3D "board-support/u-boot-${PV}"
> -SRCIPK_PRESERVE_GIT_pn-u-boot-keystone =3D "true"
> +CREATE_SRCIPK_pn-u-boot-keystone ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-u-boot-keystone ?=3D "board-support/u-boot-${PV}"
> +SRCIPK_PRESERVE_GIT_pn-u-boot-keystone ?=3D "true"
> =20
> -CREATE_SRCIPK_pn-u-boot-dra7xx =3D "1"
> -SRCIPK_INSTALL_DIR_pn-u-boot-dra7xx =3D "board-support/u-boot-${PV}-${PR=
}"
> +CREATE_SRCIPK_pn-u-boot-dra7xx ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-u-boot-dra7xx ?=3D "board-support/u-boot-${PV}-${P=
R}"
> =20
> -CREATE_SRCIPK_pn-arm-trusted-firmware =3D "1"
> -SRCIPK_INSTALL_DIR_pn-arm-trusted-firmware =3D "board-support/${PN}-${PV=
}"
> -SRCIPK_PRESERVE_GIT_pn-arm-trusted-firmware =3D "true"
> +CREATE_SRCIPK_pn-arm-trusted-firmware ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-arm-trusted-firmware ?=3D "board-support/${PN}-${P=
V}"
> +SRCIPK_PRESERVE_GIT_pn-arm-trusted-firmware ?=3D "true"
> =20
> -CREATE_SRCIPK_pn-linux-ti-staging =3D "1"
> -SRCIPK_INSTALL_DIR_pn-linux-ti-staging =3D "board-support/linux-${PV}${K=
ERNEL_LOCALVERSION}"
> -SRCIPK_PRESERVE_GIT_pn-linux-ti-staging =3D "true"
> -SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging =3D "true"
> +CREATE_SRCIPK_pn-linux-ti-staging ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-linux-ti-staging ?=3D "board-support/linux-${PV}${=
KERNEL_LOCALVERSION}"
> +SRCIPK_PRESERVE_GIT_pn-linux-ti-staging ?=3D "true"
> +SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging ?=3D "true"
> =20
> -CREATE_SRCIPK_pn-linux-ti-staging-rt =3D "1"
> -SRCIPK_INSTALL_DIR_pn-linux-ti-staging-rt =3D "board-support/linux-rt-${=
PV}${KERNEL_LOCALVERSION}"
> -SRCIPK_PRESERVE_GIT_pn-linux-ti-staging-rt =3D "true"
> -SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging-rt =3D "true"
> +CREATE_SRCIPK_pn-linux-ti-staging-rt ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-linux-ti-staging-rt ?=3D "board-support/linux-rt-$=
{PV}${KERNEL_LOCALVERSION}"
> +SRCIPK_PRESERVE_GIT_pn-linux-ti-staging-rt ?=3D "true"
> +SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging-rt ?=3D "true"
> =20
> -CREATE_SRCIPK_pn-linux-ti-staging-systest =3D "1"
> -SRCIPK_INSTALL_DIR_pn-linux-ti-staging-systest =3D "board-support/linux-=
systest-${PV}${KERNEL_LOCALVERSION}"
> -SRCIPK_PRESERVE_GIT_pn-linux-ti-staging-systest =3D "true"
> -SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging-systest =3D "true"
> +CREATE_SRCIPK_pn-linux-ti-staging-systest ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-linux-ti-staging-systest ?=3D "board-support/linux=
-systest-${PV}${KERNEL_LOCALVERSION}"
> +SRCIPK_PRESERVE_GIT_pn-linux-ti-staging-systest ?=3D "true"
> +SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging-systest ?=3D "true"
> =20
> -CREATE_SRCIPK_pn-sitara-linux-ti-staging =3D "1"
> -SRCIPK_INSTALL_DIR_pn-sitara-linux-ti-staging =3D "board-support/linux-$=
{PV}${KERNEL_LOCALVERSION}"
> -SRCIPK_PRESERVE_GIT_pn-sitara-linux-ti-staging =3D "true"
> -SRCIPK_SHALLOW_CLONE_pn-sitara-linux-ti-staging =3D "true"
> -SRCIPK_SHALLOW_DEPTH_pn-sitara-linux-ti-staging =3D "400"
> +CREATE_SRCIPK_pn-sitara-linux-ti-staging ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-sitara-linux-ti-staging ?=3D "board-support/linux-=
${PV}${KERNEL_LOCALVERSION}"
> +SRCIPK_PRESERVE_GIT_pn-sitara-linux-ti-staging ?=3D "true"
> +SRCIPK_SHALLOW_CLONE_pn-sitara-linux-ti-staging ?=3D "true"
> +SRCIPK_SHALLOW_DEPTH_pn-sitara-linux-ti-staging ?=3D "400"
> =20
> -CREATE_SRCIPK_pn-linux-keystone =3D "1"
> -SRCIPK_INSTALL_DIR_pn-linux-keystone =3D "board-support/linux-${PV}"
> -SRCIPK_PRESERVE_GIT_pn-linux-keystone =3D "true"
> +CREATE_SRCIPK_pn-linux-keystone ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-linux-keystone ?=3D "board-support/linux-${PV}"
> +SRCIPK_PRESERVE_GIT_pn-linux-keystone ?=3D "true"
> =20
> -CREATE_SRCIPK_pn-linux-am335x-psp =3D "1"
> -SRCIPK_INSTALL_DIR_pn-linux-am335x-psp =3D "board-support/linux-${KVER}"
> +CREATE_SRCIPK_pn-linux-am335x-psp ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-linux-am335x-psp ?=3D "board-support/linux-${KVER}=
"
> =20
> -CREATE_SRCIPK_pn-linux-omap =3D "1"
> -SRCIPK_INSTALL_DIR_pn-linux-omap =3D "board-support/linux-${PV}-${PR}"
> +CREATE_SRCIPK_pn-linux-omap ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-linux-omap ?=3D "board-support/linux-${PV}-${PR}"
> =20
> -CREATE_SRCIPK_pn-linux =3D "1"
> -SRCIPK_INSTALL_DIR_pn-linux =3D "board-support/linux-${PV}"
> +CREATE_SRCIPK_pn-linux ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-linux ?=3D "board-support/linux-${PV}"
> =20
> -CREATE_SRCIPK_pn-linux-omap4 =3D "1"
> -SRCIPK_INSTALL_DIR_pn-linux-omap4 =3D "board-support/linux-${PV}"
> +CREATE_SRCIPK_pn-linux-omap4 ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-linux-omap4 ?=3D "board-support/linux-${PV}"
> =20
> -CREATE_SRCIPK_pn-cryptodev-module =3D "1"
> -SRCIPK_INSTALL_DIR_pn-cryptodev-module =3D "board-support/extra-drivers/=
cryptodev-module-${PV}"
> -SRCIPK_PRESERVE_GIT_pn-cryptodev-module =3D "true"
> +CREATE_SRCIPK_pn-cryptodev-module ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-cryptodev-module ?=3D "board-support/extra-drivers=
/cryptodev-module-${PV}"
> +SRCIPK_PRESERVE_GIT_pn-cryptodev-module ?=3D "true"
> =20
> -CREATE_SRCIPK_pn-cmem-mod =3D "1"
> -SRCIPK_INSTALL_DIR_pn-cmem-mod =3D "board-support/extra-drivers/${PN}-${=
PV}"
> +CREATE_SRCIPK_pn-cmem-mod ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-cmem-mod ?=3D "board-support/extra-drivers/${PN}-$=
{PV}"
> =20
> -CREATE_SRCIPK_pn-debugss-module-drv =3D "1"
> -SRCIPK_INSTALL_DIR_pn-debugss-module-drv =3D "board-support/extra-driver=
s/${PN}-${PV}"
> +CREATE_SRCIPK_pn-debugss-module-drv ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-debugss-module-drv ?=3D "board-support/extra-drive=
rs/${PN}-${PV}"
> =20
> -CREATE_SRCIPK_pn-gdbserverproxy-module-drv =3D "1"
> -SRCIPK_INSTALL_DIR_pn-gdbserverproxy-module-drv =3D "board-support/extra=
-drivers/${PN}-${PV}"
> +CREATE_SRCIPK_pn-gdbserverproxy-module-drv ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-gdbserverproxy-module-drv ?=3D "board-support/extr=
a-drivers/${PN}-${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-sgx-ddk-km =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-sgx-ddk-km =3D "board-support/extra-drivers/${P=
N}-${PV}"
> +CREATE_SRCIPK_pn-ti-sgx-ddk-km ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-sgx-ddk-km ?=3D "board-support/extra-drivers/${=
PN}-${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-img-rogue-driver =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-img-rogue-driver =3D "board-support/extra-drive=
rs/${PN}-${PV}"
> -SRCIPK_PRESERVE_GIT_pn-ti-img-rogue-driver =3D "true"
> +CREATE_SRCIPK_pn-ti-img-rogue-driver ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-img-rogue-driver ?=3D "board-support/extra-driv=
ers/${PN}-${PV}"
> +SRCIPK_PRESERVE_GIT_pn-ti-img-rogue-driver ?=3D "true"
> =20
> -CREATE_SRCIPK_pn-ti-img-encode-decode =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-img-encode-decode =3D "board-support/extra-driv=
ers/${PN}-${PV}"
> -SRCIPK_PRESERVE_GIT_pn-ti-img-encode-decode =3D "true"
> +CREATE_SRCIPK_pn-ti-img-encode-decode ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-img-encode-decode ?=3D "board-support/extra-dri=
vers/${PN}-${PV}"
> +SRCIPK_PRESERVE_GIT_pn-ti-img-encode-decode ?=3D "true"
> =20
> -CREATE_SRCIPK_pn-ti-gc320-driver =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-gc320-driver =3D "board-support/extra-drivers/$=
{PN}-${PV}"
> +CREATE_SRCIPK_pn-ti-gc320-driver ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-gc320-driver ?=3D "board-support/extra-drivers/=
${PN}-${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-linux-driver-examples =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples =3D "example-applications=
/linux-driver-examples-${PV}"
> +CREATE_SRCIPK_pn-ti-linux-driver-examples ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples ?=3D "example-application=
s/linux-driver-examples-${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-linux-driver-examples-omapl =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omapl =3D "example-applic=
ations/linux-driver-examples-${PV}"
> +CREATE_SRCIPK_pn-ti-linux-driver-examples-omapl ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omapl ?=3D "example-appli=
cations/linux-driver-examples-${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-linux-driver-examples-omap3 =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omap3 =3D "example-applic=
ations/linux-driver-examples-${PV}"
> +CREATE_SRCIPK_pn-ti-linux-driver-examples-omap3 ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omap3 ?=3D "example-appli=
cations/linux-driver-examples-${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-framework-components =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-framework-components =3D "component-sources/fra=
mework_components_${PV}"
> +CREATE_SRCIPK_pn-ti-framework-components ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-framework-components ?=3D "component-sources/fr=
amework_components_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-codec-engine =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-codec-engine =3D "component-sources/codec_engin=
e_${PV}"
> +CREATE_SRCIPK_pn-ti-codec-engine ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-codec-engine ?=3D "component-sources/codec_engi=
ne_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-codecs-omap3530 =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-codecs-omap3530 =3D "codecs-omap3530_${PV}"
> +CREATE_SRCIPK_pn-ti-codecs-omap3530 ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-codecs-omap3530 ?=3D "codecs-omap3530_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-linuxutils =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-linuxutils =3D "component-sources/linuxutils_${=
PV}"
> +CREATE_SRCIPK_pn-ti-linuxutils ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-linuxutils ?=3D "component-sources/linuxutils_$=
{PV}"
> =20
> -CREATE_SRCIPK_pn-ti-xdctools =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-xdctools =3D "component-sources/xdctools_${PV}"
> +CREATE_SRCIPK_pn-ti-xdctools ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-xdctools ?=3D "component-sources/xdctools_${PV}=
"
> =20
> -CREATE_SRCIPK_pn-ti-dmai =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-dmai =3D "dmai_${PV}"
> +CREATE_SRCIPK_pn-ti-dmai ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-dmai ?=3D "dmai_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-xdais =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-xdais =3D "component-sources/xdais_${PV}"
> +CREATE_SRCIPK_pn-ti-xdais ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-xdais ?=3D "component-sources/xdais_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-local-power-manager =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-local-power-manager =3D "local-power-manager_${=
PV}"
> +CREATE_SRCIPK_pn-ti-local-power-manager ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-local-power-manager ?=3D "local-power-manager_$=
{PV}"
> =20
> -CREATE_SRCIPK_pn-ti-codecs-dm355 =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-codecs-dm355 =3D "codecs-dm355_${PV}"
> +CREATE_SRCIPK_pn-ti-codecs-dm355 ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-codecs-dm355 ?=3D "codecs-dm355_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-dvsdk-demos =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-dvsdk-demos =3D "dvsdk-demos_${PV}"
> +CREATE_SRCIPK_pn-ti-dvsdk-demos ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-dvsdk-demos ?=3D "dvsdk-demos_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-dvtb =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-dvtb =3D "dvtb_${PV}"
> +CREATE_SRCIPK_pn-ti-dvtb ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-dvtb ?=3D "dvtb_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-codecs-dm365 =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-codecs-dm365 =3D "codecs-dm365_${PV}"
> +CREATE_SRCIPK_pn-ti-codecs-dm365 ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-codecs-dm365 ?=3D "codecs-dm365_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-dm365mm-module =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-dm365mm-module =3D "dm365mm-module_${PV}"
> +CREATE_SRCIPK_pn-ti-dm365mm-module ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-dm365mm-module ?=3D "dm365mm-module_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-codecs-dm6446 =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6446 =3D "codecs-dm6446_${PV}"
> +CREATE_SRCIPK_pn-ti-codecs-dm6446 ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6446 ?=3D "codecs-dm6446_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-codecs-dm6467 =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6467 =3D "codecs-dm6467_${PV}"
> +CREATE_SRCIPK_pn-ti-codecs-dm6467 ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6467 ?=3D "codecs-dm6467_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-codecs-omapl137 =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl137 =3D "codecs-omapl137_${PV}"
> +CREATE_SRCIPK_pn-ti-codecs-omapl137 ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl137 ?=3D "codecs-omapl137_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-codecs-omapl138 =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl138 =3D "codecs-omapl138_${PV}"
> +CREATE_SRCIPK_pn-ti-codecs-omapl138 ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl138 ?=3D "codecs-omapl138_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-cgt6x =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-cgt6x =3D "dsp-devkit/cgt6x_${PV}"
> +CREATE_SRCIPK_pn-ti-cgt6x ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-cgt6x ?=3D "dsp-devkit/cgt6x_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-cgt470 =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-cgt470 =3D "media-controller-devkit/cgt470_${PV=
}"
> +CREATE_SRCIPK_pn-ti-cgt470 ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-cgt470 ?=3D "media-controller-devkit/cgt470_${P=
V}"
> =20
> -CREATE_SRCIPK_pn-ti-dspbios =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-dspbios =3D "dspbios_${PV}"
> +CREATE_SRCIPK_pn-ti-dspbios ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-dspbios ?=3D "dspbios_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-sysbios =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-sysbios =3D "component-sources/bios_${PV}"
> +CREATE_SRCIPK_pn-ti-sysbios ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-sysbios ?=3D "component-sources/bios_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-biosutils =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-biosutils =3D "biosutils_${PV}"
> +CREATE_SRCIPK_pn-ti-biosutils ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-biosutils ?=3D "biosutils_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-dsplink =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-dsplink =3D "dsplink_${PV}"
> +CREATE_SRCIPK_pn-ti-dsplink ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-dsplink ?=3D "dsplink_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-syslink =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-syslink =3D "component-sources/syslink_${PV}"
> +CREATE_SRCIPK_pn-ti-syslink ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-syslink ?=3D "component-sources/syslink_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-edma3lld =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-edma3lld =3D "component-sources/edma3lld_${PV}"
> +CREATE_SRCIPK_pn-ti-edma3lld ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-edma3lld ?=3D "component-sources/edma3lld_${PV}=
"
> =20
> -CREATE_SRCIPK_pn-ti-c6accel =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-c6accel =3D "component-sources/c6accel_${PV}"
> +CREATE_SRCIPK_pn-ti-c6accel ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-c6accel ?=3D "component-sources/c6accel_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-biospsp =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-biospsp =3D "biospsp_${PV}"
> +CREATE_SRCIPK_pn-ti-biospsp ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-biospsp ?=3D "biospsp_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-audio-soc-example =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-audio-soc-example =3D "audio-soc-example_${PV}"
> +CREATE_SRCIPK_pn-ti-audio-soc-example ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-audio-soc-example ?=3D "audio-soc-example_${PV}=
"
> =20
> -CREATE_SRCIPK_pn-ti-c6run =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-c6run =3D "component-sources/c6run_${PV}"
> +CREATE_SRCIPK_pn-ti-c6run ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-c6run ?=3D "component-sources/c6run_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-osal =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-osal =3D "component-sources/osal_${PV}"
> +CREATE_SRCIPK_pn-ti-osal ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-osal ?=3D "component-sources/osal_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-ipc =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-ipc =3D "component-sources/ipc_${PV}"
> +CREATE_SRCIPK_pn-ti-ipc ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-ipc ?=3D "component-sources/ipc_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-dsp-benchmark =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-dsp-benchmark =3D "example-applications/dsp-ben=
chmark_${PV}"
> +CREATE_SRCIPK_pn-ti-dsp-benchmark ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-dsp-benchmark ?=3D "example-applications/dsp-be=
nchmark_${PV}"
> =20
> -CREATE_SRCIPK_pn-gstreamer-ti =3D "1"
> -SRCIPK_INSTALL_DIR_pn-gstreamer-ti =3D "gstreamer-ti_${PV}"
> +CREATE_SRCIPK_pn-gstreamer-ti ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-gstreamer-ti ?=3D "gstreamer-ti_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-omx =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-omx =3D "component-sources/omx_${PV}"
> +CREATE_SRCIPK_pn-ti-omx ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-omx ?=3D "component-sources/omx_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-uia =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-uia =3D "component-sources/uia_${PV}"
> +CREATE_SRCIPK_pn-ti-uia ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-uia ?=3D "component-sources/uia_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-media-controller-utils =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-media-controller-utils =3D "board-support/media=
-controller-utils_${PV}"
> +CREATE_SRCIPK_pn-ti-media-controller-utils ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-media-controller-utils ?=3D "board-support/medi=
a-controller-utils_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-firmware-dm816x =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-firmware-dm816x =3D "board-support/prebuilt-ima=
ges/dm816x-firmware_${PV}"
> +CREATE_SRCIPK_pn-ti-firmware-dm816x ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-firmware-dm816x ?=3D "board-support/prebuilt-im=
ages/dm816x-firmware_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-firmware-dm814x =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-firmware-dm814x =3D "board-support/prebuilt-ima=
ges/dm814x-firmware_${PV}"
> +CREATE_SRCIPK_pn-ti-firmware-dm814x ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-firmware-dm814x ?=3D "board-support/prebuilt-im=
ages/dm814x-firmware_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-slog =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-slog =3D "component-sources/slog_${PV}"
> +CREATE_SRCIPK_pn-ti-slog ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-slog ?=3D "component-sources/slog_${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-c674x-aaclcdec =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ti-c674x-aaclcdec =3D "component-sources/c674x-aac=
lcdec_${PV}"
> +CREATE_SRCIPK_pn-ti-c674x-aaclcdec ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ti-c674x-aaclcdec ?=3D "component-sources/c674x-aa=
clcdec_${PV}"
> =20
> -CREATE_SRCIPK_pn-oe-layersetup =3D "1"
> -SRCIPK_INSTALL_DIR_pn-oe-layersetup =3D "bin/oe-layersetup"
> +CREATE_SRCIPK_pn-oe-layersetup ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-oe-layersetup ?=3D "bin/oe-layersetup"
> =20
> -CREATE_SRCIPK_pn-opencl-examples =3D "1"
> -SRCIPK_INSTALL_DIR_pn-opencl-examples =3D "example-applications/${PN}-${=
PV}"
> +CREATE_SRCIPK_pn-opencl-examples ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-opencl-examples ?=3D "example-applications/${PN}-$=
{PV}"
> =20
> -CREATE_SRCIPK_pn-openmpacc-examples =3D "1"
> -SRCIPK_INSTALL_DIR_pn-openmpacc-examples =3D "example-applications/${PN}=
-${PV}"
> +CREATE_SRCIPK_pn-openmpacc-examples ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-openmpacc-examples ?=3D "example-applications/${PN=
}-${PV}"
> =20
> -CREATE_SRCIPK_pn-tidl-examples =3D "1"
> -SRCIPK_INSTALL_DIR_pn-tidl-examples =3D "example-applications/${PN}-${PV=
}"
> -SRCIPK_SRC_DIR_pn-tidl-examples =3D "${S}/examples"
> +CREATE_SRCIPK_pn-tidl-examples ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-tidl-examples ?=3D "example-applications/${PN}-${P=
V}"
> +SRCIPK_SRC_DIR_pn-tidl-examples ?=3D "${S}/examples"
> =20
> -CREATE_SRCIPK_pn-qt-opencv-opencl-opengl-multithreaded =3D "1"
> -SRCIPK_INSTALL_DIR_pn-qt-opencv-opencl-opengl-multithreaded =3D "example=
-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-qt-opencv-opencl-opengl-multithreaded ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-qt-opencv-opencl-opengl-multithreaded ?=3D "exampl=
e-applications/${PN}-${PV}"
> =20
> -CREATE_SRCIPK_pn-libarch-examples =3D "1"
> -SRCIPK_INSTALL_DIR_pn-libarch-examples =3D "example-applications/${PN}-$=
{PV}"
> +CREATE_SRCIPK_pn-libarch-examples ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-libarch-examples ?=3D "example-applications/${PN}-=
${PV}"
> =20
> -CREATE_SRCIPK_pn-linalg-examples =3D "1"
> -SRCIPK_INSTALL_DIR_pn-linalg-examples =3D "example-applications/${PN}-${=
PV}"
> -SRCIPK_SRC_DIR_pn-linalg-examples =3D "${EXAMPLES_ROOT}"
> +CREATE_SRCIPK_pn-linalg-examples ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-linalg-examples ?=3D "example-applications/${PN}-$=
{PV}"
> +SRCIPK_SRC_DIR_pn-linalg-examples ?=3D "${EXAMPLES_ROOT}"
> =20
> -CREATE_SRCIPK_pn-barcode-roi =3D "1"
> -SRCIPK_INSTALL_DIR_pn-barcode-roi =3D "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-barcode-roi ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-barcode-roi ?=3D "example-applications/${PN}-${PV}=
"
> =20
> -CREATE_SRCIPK_pn-boot-monitor =3D "1"
> -SRCIPK_INSTALL_DIR_pn-boot-monitor =3D "board-support/${PN}-${PV}"
> +CREATE_SRCIPK_pn-boot-monitor ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-boot-monitor ?=3D "board-support/${PN}-${PV}"
> =20
> -CREATE_SRCIPK_pn-hplib-mod =3D "1"
> -SRCIPK_INSTALL_DIR_pn-hplib-mod =3D "board-support/extra-drivers/${PN}-$=
{PV}"
> +CREATE_SRCIPK_pn-hplib-mod ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-hplib-mod ?=3D "board-support/extra-drivers/${PN}-=
${PV}"
> =20
> -CREATE_SRCIPK_pn-uio-module-drv =3D "1"
> -SRCIPK_INSTALL_DIR_pn-uio-module-drv =3D "board-support/extra-drivers/${=
PN}-${PV}"
> +CREATE_SRCIPK_pn-uio-module-drv ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-uio-module-drv ?=3D "board-support/extra-drivers/$=
{PN}-${PV}"
> =20
> -CREATE_SRCIPK_pn-ivshmem-uio-driver =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ivshmem-uio-driver =3D "board-support/extra-driver=
s/${PN}-${PV}"
> -SRCIPK_PRESERVE_GIT_pn-ivshmem-uio-driver =3D "true"
> +CREATE_SRCIPK_pn-ivshmem-uio-driver ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ivshmem-uio-driver ?=3D "board-support/extra-drive=
rs/${PN}-${PV}"
> +SRCIPK_PRESERVE_GIT_pn-ivshmem-uio-driver ?=3D "true"
> =20
> -CREATE_SRCIPK_pn-ipsecmgr-mod =3D "1"
> -SRCIPK_INSTALL_DIR_pn-ipsecmgr-mod =3D "board-support/extra-drivers/${PN=
}-${PV}"
> +CREATE_SRCIPK_pn-ipsecmgr-mod ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-ipsecmgr-mod ?=3D "board-support/extra-drivers/${P=
N}-${PV}"
> =20
> -CREATE_SRCIPK_pn-pru-icss =3D "1"
> -SRCIPK_INSTALL_DIR_pn-pru-icss =3D "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-pru-icss ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-pru-icss ?=3D "example-applications/${PN}-${PV}"
> =20
> -CREATE_SRCIPK_pn-dsplib-c66x =3D "1"
> -SRCIPK_INSTALL_DIR_pn-dsplib-c66x =3D "component-sources/dsplib_c66x_${P=
V}"
> +CREATE_SRCIPK_pn-dsplib-c66x ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-dsplib-c66x ?=3D "component-sources/dsplib_c66x_${=
PV}"
> =20
> -CREATE_SRCIPK_pn-mathlib-c66x =3D "1"
> -SRCIPK_INSTALL_DIR_pn-mathlib-c66x =3D "component-sources/mathlib_c66x_$=
{PV}"
> +CREATE_SRCIPK_pn-mathlib-c66x ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-mathlib-c66x ?=3D "component-sources/mathlib_c66x_=
${PV}"
> =20
> -CREATE_SRCIPK_pn-imglib-c66x =3D "1"
> -SRCIPK_INSTALL_DIR_pn-imglib-c66x =3D "component-sources/imglib_c66x_${P=
V}"
> +CREATE_SRCIPK_pn-imglib-c66x ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-imglib-c66x ?=3D "component-sources/imglib_c66x_${=
PV}"
> =20
> -CREATE_SRCIPK_pn-vlib-c66x =3D "1"
> -SRCIPK_INSTALL_DIR_pn-vlib-c66x =3D "component-sources/vlib_c66x_${PV}"
> +CREATE_SRCIPK_pn-vlib-c66x ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-vlib-c66x ?=3D "component-sources/vlib_c66x_${PV}"
> =20
> -CREATE_SRCIPK_pn-big-data-ipc-demo-linux =3D "1"
> -SRCIPK_INSTALL_DIR_pn-big-data-ipc-demo-linux =3D "example-applications/=
${PN}-${PV}"
> +CREATE_SRCIPK_pn-big-data-ipc-demo-linux ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-big-data-ipc-demo-linux ?=3D "example-applications=
/${PN}-${PV}"
> =20
> -CREATE_SRCIPK_pn-ti-sci-fw_k3 =3D "1"
> -SRCIPK_SRC_DIR_pn-ti-sci-fw_k3 =3D "${WORKDIR}/imggen"
> -SRCIPK_INSTALL_DIR_pn-ti-sci-fw_k3 =3D "board-support/system-firmware-im=
age-gen-${PV}"
> +CREATE_SRCIPK_pn-ti-sci-fw_k3 ?=3D "1"
> +SRCIPK_SRC_DIR_pn-ti-sci-fw_k3 ?=3D "${WORKDIR}/imggen"
> +SRCIPK_INSTALL_DIR_pn-ti-sci-fw_k3 ?=3D "board-support/system-firmware-i=
mage-gen-${PV}"
> =20
> -CREATE_SRCIPK_pn-jailhouse =3D "1"
> -SRCIPK_INSTALL_DIR_pn-jailhouse =3D "board-support/extra-drivers/${PN}-$=
{PV}"
> +CREATE_SRCIPK_pn-jailhouse ?=3D "1"
> +SRCIPK_INSTALL_DIR_pn-jailhouse ?=3D "board-support/extra-drivers/${PN}-=
${PV}"
> --=20
> 2.17.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

