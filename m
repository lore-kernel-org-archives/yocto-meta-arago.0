Return-Path: <Ankur.Tyagi@gallagher.com>
Received: from AUS01-ME1-obe.outbound.protection.outlook.com
	(mail-eopbgr1360103.outbound.protection.outlook.com [40.107.136.103])
	by arago-project.org (Postfix) with ESMTPS id 8813CA8003
	for <meta-arago@arago-project.org>;
	Tue, 30 Jun 2020 04:04:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=jZxFp/IA1DfT1fAVV1YOClifk5sjrXqlcgvY42TuIkfyQAkKOI/wZE3tEqDxgsKNrjaBhqT7C+F+a4D7khIs/kcHusBhPAf1uQjDsD1AcAKT4A4gMljhqyRm54i6MnsueL94hHa7zysaVsjlN88D1ccZ09QG42qO89hIlwi0+rv1W5xcnb327uRidZLakX56FRq9L7NYwfFQVaLD4KZYu8ioOd/gQue+qYoiwKQMU0c3bb0I6PDOa90TA2DEEpuH5hGEkEcVtnXQEglKnktUQFw3SQI5+5YSDZYd4cecZMcMco27tMPnf5/UbPHgqyfO4vK3S5d+BAAGYo7VL9xbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=MmQvVvHGrXjJ0kPVs8ejC+V+CjgHjSnpnEqkZ6sm+Q0=;
	b=PJWvHQ8DAQTTdKjyTmKUhIBwpljVlUVC99iNYeus04TZjeB6mmYrTgaGWYTkFjg8wy8wEmaP1M/tffbDdrnbHjJiu2unEJFyKRkpz4FNz23xO2iiF67zHRcP9DxbY32DVIGnWqLvlDIDUGp/zPR/HS1HdSoWGuGeI+13g9gXamVS7BrBlIbO1KmDjWIglnWZ/OubvYH0au7dlFBNrvFH85P9+k8DzjmWX0+j71mkwgDD7NOUnxr00PGURuloo65sxX40znUqRapDBSKGhzNltkbAYh/HAqfQgTGe1VuJfIsPLmCwBDtG7Vzv2CDaITmKlKUJuJOtOyWsYORKD9YNWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=gallagher.com; dmarc=pass action=none
	header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=MmQvVvHGrXjJ0kPVs8ejC+V+CjgHjSnpnEqkZ6sm+Q0=;
	b=DoZ57pbVtCoZsZCVDy4/+wH4StP/uQXGf41XzOqiQ5KtLtFMKWk2Z2aHCrc8/drS1AVUbtGx5OqQTevlHh2IfW4n6w8hmNxkz07F8QwROKRD88czJmOe/gOWd36UDRPM+4C1VTPcL6C9hrlXTlmUqj2+nEJvmOH6dMMWVQ1XWWQ=
Received: from SY3PR01MB1931.ausprd01.prod.outlook.com (2603:10c6:0:20::22) by
	SY3PR01MB1929.ausprd01.prod.outlook.com (2603:10c6:0:11::23) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.3131.26; Tue, 30 Jun 2020 04:02:09 +0000
Received: from SY3PR01MB1931.ausprd01.prod.outlook.com
	([fe80::835:455c:1cc5:2a48]) by SY3PR01MB1931.ausprd01.prod.outlook.com
	([fe80::835:455c:1cc5:2a48%5]) with mapi id 15.20.3131.028;
	Tue, 30 Jun 2020 04:02:09 +0000
From: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
To: Denys Dmytriyenko <denys@ti.com>
Thread-Topic: [meta-arago] [dunfell/master PATCH] arago-source-ipk.inc: Use
	weak assignment to create source ipk file
Thread-Index: AQHWQ0z7X9zmWVw4l06C5l8oHVc3XKjaE7WAgAAAvxCAFcNpIIAAk9LggAAD7oCAABAFgIAAH/KQ
Date: Tue, 30 Jun 2020 04:02:08 +0000
Message-ID: <SY3PR01MB193105140ADBC168ADE35F4EE56F0@SY3PR01MB1931.ausprd01.prod.outlook.com>
References: <20200611223129.58314-1-ankur.tyagi@gallagher.com>
	<SYXPR01MB1088B788FE7E2A6BC89E11F1E5800@SYXPR01MB1088.ausprd01.prod.outlook.com>
	<SY3PR01MB08094675F22049EFC5885294E59C0@SY3PR01MB0809.ausprd01.prod.outlook.com>
	<20200615194251.GC10991@beryl>
	<SY3PR01MB0809BD21F26C827689B854E5E59C0@SY3PR01MB0809.ausprd01.prod.outlook.com>
	<SY3PR01MB1931146DE8BE3A3EEF47502EE56E0@SY3PR01MB1931.ausprd01.prod.outlook.com>
	<SY3PR01MB1931311C2B9F0860DFC841E0E56F0@SY3PR01MB1931.ausprd01.prod.outlook.com>
	<20200630010931.GB7211@beryl> <20200630020650.GE7211@beryl>
In-Reply-To: <20200630020650.GE7211@beryl>
Accept-Language: en-NZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
	header.d=none; ti.com; dmarc=none action=none header.from=gallagher.com;
x-originating-ip: [139.180.92.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6078a0a-07c1-4c8c-9384-08d81caa5c3a
x-ms-traffictypediagnostic: SY3PR01MB1929:
x-microsoft-antispam-prvs: <SY3PR01MB1929C9CD9A00356CD9B6A4BBE56F0@SY3PR01MB1929.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0450A714CB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yq77Z5a752e5RUo2/7KB6e2B4E3UP+ZAWPsl1NUdk0HDRgNhqBTAoWgAqux9cAX//jbbrtP6xMTPewQUDtcthFKb+WJ1nKknUCFK7013esHTuS7WdNR9pE/R7U8ZC5bi/5GQg0ahFz4PWGawVQu+xTASRuErJXrY/9lN6fen9XU23iwuTei9FszAINWNt3o3Wrc7kvRyAh5+2W1Ic+S0Tfc0u2w8k3kCh/vchDiF/Pc7O6qsDfmY2UJaLI30sy06CeiM6wHJaByJUhz79iVnY6pLJTaUpUGB7Qth9XgPRI4q1nrMrt5QPZa10tqFRtD1Ral0ZMgf4MR+0Fexjf3oBlvEtYZEu/F1HeQMC9cVk+ImEuMkW2YZQg1QS3e00t3AVTejmAQjeg4KtRdxkcoaNg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SY3PR01MB1931.ausprd01.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39850400004)(366004)(136003)(346002)(376002)(396003)(7696005)(33656002)(86362001)(316002)(8676002)(5660300002)(71200400001)(66946007)(66476007)(66556008)(66446008)(64756008)(76116006)(6916009)(30864003)(2906002)(26005)(186003)(55016002)(6506007)(8936002)(9686003)(53546011)(52536014)(4326008)(966005)(83380400001)(478600001)(66574015)(579004)(559001);
	DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: qiyu3iYGMv/2M1licV8YZFDeIjmaz0stf6atFZeITLCFxRz2xSc1qMDmK9MRoDBnTpSkQIjdHuzd5aQoeYl2KQdwtErHZwJgELUwGvHVv85fWPl62kq6psGqVc8t3BownkHY0zFyA93Lme1SwBHPCKdH3haB1iwk4kOKVa249hp2jTwyeRBsRTSr03Ya9QuJmXq8ibLe4LmgSw0PxUFK0vY86zxGTArtRwYDxX9ajrzVpDjW92Abr3Cj+SNWdqYi8xwcpILMbZVtz+cLjb/9W+n5l2obrdr/08I3X/+I5AV9IZd+eeimGsEiiydveZNCDnJT6bwfpp1meftgCGGpk/3i7rDSFzDqcKzushSBhkAX3TiA+hCobguYn67LOAiZdLDUXcFMeH/NSokIKfZktNYbx3UreENpXg2IbA3nHEmqB2mZ0aSdB3VRNN7xIr4Dq4VyRoeIjIQRi17cqiycaVAJV3VmRzyEhMJkVuAkQBP4jb25HcT5pv3ppMjhemOb
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY3PR01MB1931.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6078a0a-07c1-4c8c-9384-08d81caa5c3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2020 04:02:08.8796 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7CTHxJd/CvRB1XXhX4NJN35fqk8F0xd0sIY5b2nTVLdJWq6R7AuCoFkLR8C1prGj8C8p1Q+TjGcL3hiEtdpEUNO5k5syPOv8T1Zw9uHrkgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY3PR01MB1929
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
X-List-Received-Date: Tue, 30 Jun 2020 04:04:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I will send fresh patch based upon latest dunfell branch.
Should I keep the same subject?

Regards
Ankur

-----Original Message-----
From: Denys Dmytriyenko <denys@ti.com>=20
Sent: Tuesday, 30 June 2020 2:07 PM
To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [dunfell/master PATCH] arago-source-ipk.inc: Use =
weak assignment to create source ipk file

Unfortunately, the patch is not against dunfell/master - seems it is outdat=
ed, maybe it was made against thud?

Denys


On Mon, Jun 29, 2020 at 09:09:31PM -0400, Denys Dmytriyenko wrote:
> I guess this can be merged.
>=20
>=20
> On Tue, Jun 30, 2020 at 01:08:14AM +0000, Ankur Tyagi wrote:
> > Hi Denys,
> >=20
> > And any thoughts/suggestions about this patch?
> >=20
> > Because if I try to use custom board conf instead of meta-ti=20
> > machines, then reusing sstate-cache causes weird errors in=20
> > do_create_src_ipk task if u-boot or linux-kernel are built again.
> >=20
> > https://www.mail-archive.com/meta-arago@arago-project.org/msg11015.h
> > tml
> >=20
> > Regards
> > Ankur
> >=20
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org=20
> > <meta-arago-bounces@arago-project.org> On Behalf Of Ankur Tyagi
> > Sent: Tuesday, 30 June 2020 4:09 AM
> > To: Denys Dmytriyenko <denys@ti.com>
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [dunfell/master PATCH]=20
> > arago-source-ipk.inc: Use weak assignment to create source ipk file
> >=20
> > Hi Denys,
> >=20
> > > Are you trying to disable them all, or enable only few?
> >=20
> > I am trying to disable few, mainly u-boot and kernel.
> >=20
> > Regards
> > Ankur
> >=20
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org=20
> > <meta-arago-bounces@arago-project.org> On Behalf Of Ankur Tyagi
> > Sent: Tuesday, 16 June 2020 7:48 AM
> > To: Denys Dmytriyenko <denys@ti.com>
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [dunfell/master PATCH]=20
> > arago-source-ipk.inc: Use weak assignment to create source ipk file
> >=20
> > Hi Denys,
> >=20
> > Yes, received your response and then I resent the patch.
> > Something went wrong with the first patch but second patch did made it =
to the mailing list.
> >=20
> > Regards
> > Ankur
> >=20
> > -----Original Message-----
> > From: Denys Dmytriyenko <denys@ti.com>
> > Sent: Tuesday, 16 June 2020 7:43 AM
> > To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [dunfell/master PATCH]=20
> > arago-source-ipk.inc: Use weak assignment to create source ipk file
> >=20
> > On Mon, Jun 15, 2020 at 07:41:37PM +0000, Ankur Tyagi wrote:
> > > Hi Denys,
> > >
> > > Gentle reminder as this patch has been in mailing list for some=20
> > > time now
> > > (http://arago-project.org/pipermail/meta-arago/2020-June/012694.ht
> > > ml) And I haven't heard anything back.
> >=20
> > And here:
> > http://arago-project.org/pipermail/meta-arago/2020-June/012693.html
> >=20
> >=20
> > > Regards
> > > Ankur
> > >
> > > -----Original Message-----
> > > From: meta-arago-bounces@arago-project.org
> > > <meta-arago-bounces@arago-project.org> On Behalf Of Ankur Tyagi
> > > Sent: Friday, 12 June 2020 10:50 AM
> > > To: meta-arago@arago-project.org
> > > Subject: [meta-arago] [dunfell/master PATCH] arago-source-ipk.inc:=20
> > > Use weak assignment to create source ipk file
> > >
> > > This is to allow user to override(disable) them in their configuratio=
n.
> > >
> > > Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
> > > ---
> > >  .../conf/distro/include/arago-source-ipk.inc  | 504
> > > +++++++++---------
> > >  1 file changed, 252 insertions(+), 252 deletions(-)
> > >
> > > diff --git
> > > a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> > > b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> > > index c479a8c8..5ffdc982 100644
> > > --- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> > > +++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> > > @@ -40,371 +40,371 @@ INHERIT +=3D "sourceipk"
> > >  SRCIPK_INCLUDE_EXTRAFILES =3D "0"
> > >
> > >  # Set source ipk packages and install directories=20
> > > -CREATE_SRCIPK_pn-ti-tisdk-licenses =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-tisdk-licenses =3D "docs/licenses"
> > > +CREATE_SRCIPK_pn-ti-tisdk-licenses ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-tisdk-licenses ?=3D "docs/licenses"
> > >
> > > -CREATE_SRCIPK_pn-matrix-gui =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-matrix-gui =3D "example-applications/${PN}-${P=
V}"
> > > +CREATE_SRCIPK_pn-matrix-gui ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-matrix-gui ?=3D "example-applications/${PN}-${=
PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-crypto-examples =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-crypto-examples =3D "example-applications/$=
{PN}-${PV}"
> > > +CREATE_SRCIPK_pn-ti-crypto-examples ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-crypto-examples ?=3D "example-applications/=
${PN}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-qml-carinfo =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-qml-carinfo =3D "example-applications/${PN}-${=
PV}"
> > > +CREATE_SRCIPK_pn-qml-carinfo ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-qml-carinfo ?=3D "example-applications/${PN}-$=
{PV}"
> > >
> > > -CREATE_SRCIPK_pn-quick-playground =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-quick-playground =3D "example-applications/${P=
N}-${PV}"
> > > +CREATE_SRCIPK_pn-quick-playground ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-quick-playground ?=3D "example-applications/${=
PN}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-qt-catalog =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-qt-catalog =3D "example-applications/${PN}-${P=
V}"
> > > +CREATE_SRCIPK_pn-qt-catalog ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-qt-catalog ?=3D "example-applications/${PN}-${=
PV}"
> > >
> > > -CREATE_SRCIPK_pn-qt-patientcare =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-qt-patientcare =3D "example-applications/${PN}=
-${PV}"
> > > +CREATE_SRCIPK_pn-qt-patientcare ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-qt-patientcare ?=3D "example-applications/${PN=
}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-qt-tstat =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-qt-tstat =3D "example-applications/${PN}-${PV}=
"
> > > +CREATE_SRCIPK_pn-qt-tstat ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-qt-tstat ?=3D "example-applications/${PN}-${PV=
}"
> > >
> > > -CREATE_SRCIPK_pn-dual-camera-demo =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-dual-camera-demo =3D "example-applications/${P=
N}-${PV}"
> > > +CREATE_SRCIPK_pn-dual-camera-demo ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-dual-camera-demo ?=3D "example-applications/${=
PN}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-evse-hmi =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-evse-hmi =3D "example-applications/${PN}-${PV}=
"
> > > +CREATE_SRCIPK_pn-evse-hmi ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-evse-hmi ?=3D "example-applications/${PN}-${PV=
}"
> > >
> > > -CREATE_SRCIPK_pn-protection-relays-hmi =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-protection-relays-hmi =3D "example-application=
s/${PN}-${PV}"
> > > +CREATE_SRCIPK_pn-protection-relays-hmi ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-protection-relays-hmi ?=3D "example-applicatio=
ns/${PN}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-mmwavegesture-hmi =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-mmwavegesture-hmi =3D "example-applications/${=
PN}-${PV}"
> > > +CREATE_SRCIPK_pn-mmwavegesture-hmi ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-mmwavegesture-hmi ?=3D "example-applications/$=
{PN}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-pdm-anomaly-detection =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-pdm-anomaly-detection =3D "example-application=
s/${PN}-${PV}"
> > > +CREATE_SRCIPK_pn-pdm-anomaly-detection ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-pdm-anomaly-detection ?=3D "example-applicatio=
ns/${PN}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-tiovx-app-host =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-tiovx-app-host =3D "example-applications/${PN}=
-${PV}"
> > > +CREATE_SRCIPK_pn-tiovx-app-host ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-tiovx-app-host ?=3D "example-applications/${PN=
}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-image-gallery =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-image-gallery =3D "example-applications/${PN}"
> > > +CREATE_SRCIPK_pn-image-gallery ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-image-gallery ?=3D "example-applications/${PN}=
"
> > >
> > > -CREATE_SRCIPK_pn-matrix-gui-browser =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-matrix-gui-browser =3D "example-applications/$=
{PN}-${PV}"
> > > +CREATE_SRCIPK_pn-matrix-gui-browser ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-matrix-gui-browser ?=3D "example-applications/=
${PN}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-refresh-screen =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-refresh-screen =3D "example-applications/${PN}=
-${PV}"
> > > +CREATE_SRCIPK_pn-refresh-screen ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-refresh-screen ?=3D "example-applications/${PN=
}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-am-sysinfo =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-am-sysinfo =3D "example-applications/${PN}-${P=
V}"
> > > +CREATE_SRCIPK_pn-am-sysinfo ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-am-sysinfo ?=3D "example-applications/${PN}-${=
PV}"
> > >
> > > -CREATE_SRCIPK_pn-oprofile-example =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-oprofile-example =3D "example-applications/${P=
N}"
> > > +CREATE_SRCIPK_pn-oprofile-example ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-oprofile-example ?=3D "example-applications/${=
PN}"
> > >
> > > -CREATE_SRCIPK_pn-arm-benchmarks =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-arm-benchmarks =3D "example-applications/${PN}=
-${PV}"
> > > +CREATE_SRCIPK_pn-arm-benchmarks ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-arm-benchmarks ?=3D "example-applications/${PN=
}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-omapconf =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-omapconf =3D "example-applications/${PN}-${PV}=
"
> > > +CREATE_SRCIPK_pn-omapconf ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-omapconf ?=3D "example-applications/${PN}-${PV=
}"
> > >
> > > -CREATE_SRCIPK_pn-ti-pru-sw-examples =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-pru-sw-examples =3D "example-applications/p=
ru-${PV}"
> > > +CREATE_SRCIPK_pn-ti-pru-sw-examples ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-pru-sw-examples ?=3D "example-applications/=
pru-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-ocf-crypto-module =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-ocf-crypto-module =3D "board-support/extra-=
drivers/${PN}-${PV}"
> > > +CREATE_SRCIPK_pn-ti-ocf-crypto-module ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-ocf-crypto-module ?=3D "board-support/extra=
-drivers/${PN}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-omap3-sgx-modules =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-omap3-sgx-modules =3D "board-support/extra-dri=
vers/sgx-modules-${PV}"
> > > +CREATE_SRCIPK_pn-omap3-sgx-modules ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-omap3-sgx-modules ?=3D "board-support/extra-dr=
ivers/sgx-modules-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-compat-wireless-wl18xx =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-compat-wireless-wl18xx =3D "board-support/e=
xtra-drivers/${PN}-${PV}"
> > > +CREATE_SRCIPK_pn-ti-compat-wireless-wl18xx ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-compat-wireless-wl18xx ?=3D "board-support/=
extra-drivers/${PN}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-wl18xx-fw =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-wl18xx-fw =3D "board-support/extra-drivers/${P=
N}-${PV}"
> > > +CREATE_SRCIPK_pn-wl18xx-fw ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-wl18xx-fw ?=3D "board-support/extra-drivers/${=
PN}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-wl1271-wlan-cli =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-wl1271-wlan-cli =3D "example-applications/wlan=
"
> > > +CREATE_SRCIPK_pn-wl1271-wlan-cli ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-wl1271-wlan-cli ?=3D "example-applications/wla=
n"
> > >
> > > -CREATE_SRCIPK_pn-av-examples =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-av-examples =3D "example-applications/av-examp=
les-${PV}"
> > > +CREATE_SRCIPK_pn-av-examples ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-av-examples ?=3D "example-applications/av-exam=
ples-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-u-boot =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-u-boot =3D "board-support/u-boot-${PV}"
> > > +CREATE_SRCIPK_pn-u-boot ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-u-boot ?=3D "board-support/u-boot-${PV}"
> > >  # For beagleboard we use the git version which doesn't define=20
> > > UVER -SRCIPK_INSTALL_DIR_pn-u-boot_beagleboard =3D "board-support/${P=
}"
> > > +SRCIPK_INSTALL_DIR_pn-u-boot_beagleboard ?=3D "board-support/${P}"
> > >
> > > -CREATE_SRCIPK_pn-x-load =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-x-load =3D "board-support/x-load-${XVER}-psp${=
PSPREL}"
> > > +CREATE_SRCIPK_pn-x-load ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-x-load ?=3D "board-support/x-load-${XVER}-psp$=
{PSPREL}"
> > >  # For beagleboard we use the git version which doesn't define=20
> > > XVER -SRCIPK_INSTALL_DIR_pn-x-load_beagleboard =3D "board-support/${P=
}"
> > > +SRCIPK_INSTALL_DIR_pn-x-load_beagleboard ?=3D "board-support/${P}"
> > >
> > > -CREATE_SRCIPK_pn-u-boot-ti-staging =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging =3D "board-support/u-boot-${=
PV}${UBOOT_LOCALVERSION}"
> > > -SRCIPK_PRESERVE_GIT_pn-u-boot-ti-staging =3D "true"
> > > +CREATE_SRCIPK_pn-u-boot-ti-staging ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging ?=3D "board-support/u-boot-$=
{PV}${UBOOT_LOCALVERSION}"
> > > +SRCIPK_PRESERVE_GIT_pn-u-boot-ti-staging ?=3D "true"
> > >
> > > -CREATE_SRCIPK_pn-u-boot-keystone =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-u-boot-keystone =3D "board-support/u-boot-${PV=
}"
> > > -SRCIPK_PRESERVE_GIT_pn-u-boot-keystone =3D "true"
> > > +CREATE_SRCIPK_pn-u-boot-keystone ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-u-boot-keystone ?=3D "board-support/u-boot-${P=
V}"
> > > +SRCIPK_PRESERVE_GIT_pn-u-boot-keystone ?=3D "true"
> > >
> > > -CREATE_SRCIPK_pn-u-boot-dra7xx =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-u-boot-dra7xx =3D "board-support/u-boot-${PV}-=
${PR}"
> > > +CREATE_SRCIPK_pn-u-boot-dra7xx ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-u-boot-dra7xx ?=3D "board-support/u-boot-${PV}=
-${PR}"
> > >
> > > -CREATE_SRCIPK_pn-arm-trusted-firmware =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-arm-trusted-firmware =3D "board-support/${PN}-=
${PV}"
> > > -SRCIPK_PRESERVE_GIT_pn-arm-trusted-firmware =3D "true"
> > > +CREATE_SRCIPK_pn-arm-trusted-firmware ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-arm-trusted-firmware ?=3D "board-support/${PN}=
-${PV}"
> > > +SRCIPK_PRESERVE_GIT_pn-arm-trusted-firmware ?=3D "true"
> > >
> > > -CREATE_SRCIPK_pn-linux-ti-staging =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-linux-ti-staging =3D "board-support/linux-${PV=
}${KERNEL_LOCALVERSION}"
> > > -SRCIPK_PRESERVE_GIT_pn-linux-ti-staging =3D "true"
> > > -SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging =3D "true"
> > > +CREATE_SRCIPK_pn-linux-ti-staging ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-linux-ti-staging ?=3D "board-support/linux-${P=
V}${KERNEL_LOCALVERSION}"
> > > +SRCIPK_PRESERVE_GIT_pn-linux-ti-staging ?=3D "true"
> > > +SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging ?=3D "true"
> > >
> > > -CREATE_SRCIPK_pn-linux-ti-staging-rt =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-linux-ti-staging-rt =3D "board-support/linux-r=
t-${PV}${KERNEL_LOCALVERSION}"
> > > -SRCIPK_PRESERVE_GIT_pn-linux-ti-staging-rt =3D "true"
> > > -SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging-rt =3D "true"
> > > +CREATE_SRCIPK_pn-linux-ti-staging-rt ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-linux-ti-staging-rt ?=3D "board-support/linux-=
rt-${PV}${KERNEL_LOCALVERSION}"
> > > +SRCIPK_PRESERVE_GIT_pn-linux-ti-staging-rt ?=3D "true"
> > > +SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging-rt ?=3D "true"
> > >
> > > -CREATE_SRCIPK_pn-linux-ti-staging-systest =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-linux-ti-staging-systest =3D "board-support/li=
nux-systest-${PV}${KERNEL_LOCALVERSION}"
> > > -SRCIPK_PRESERVE_GIT_pn-linux-ti-staging-systest =3D "true"
> > > -SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging-systest =3D "true"
> > > +CREATE_SRCIPK_pn-linux-ti-staging-systest ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-linux-ti-staging-systest ?=3D "board-support/l=
inux-systest-${PV}${KERNEL_LOCALVERSION}"
> > > +SRCIPK_PRESERVE_GIT_pn-linux-ti-staging-systest ?=3D "true"
> > > +SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging-systest ?=3D "true"
> > >
> > > -CREATE_SRCIPK_pn-sitara-linux-ti-staging =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-sitara-linux-ti-staging =3D "board-support/lin=
ux-${PV}${KERNEL_LOCALVERSION}"
> > > -SRCIPK_PRESERVE_GIT_pn-sitara-linux-ti-staging =3D "true"
> > > -SRCIPK_SHALLOW_CLONE_pn-sitara-linux-ti-staging =3D "true"
> > > -SRCIPK_SHALLOW_DEPTH_pn-sitara-linux-ti-staging =3D "400"
> > > +CREATE_SRCIPK_pn-sitara-linux-ti-staging ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-sitara-linux-ti-staging ?=3D "board-support/li=
nux-${PV}${KERNEL_LOCALVERSION}"
> > > +SRCIPK_PRESERVE_GIT_pn-sitara-linux-ti-staging ?=3D "true"
> > > +SRCIPK_SHALLOW_CLONE_pn-sitara-linux-ti-staging ?=3D "true"
> > > +SRCIPK_SHALLOW_DEPTH_pn-sitara-linux-ti-staging ?=3D "400"
> > >
> > > -CREATE_SRCIPK_pn-linux-keystone =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-linux-keystone =3D "board-support/linux-${PV}"
> > > -SRCIPK_PRESERVE_GIT_pn-linux-keystone =3D "true"
> > > +CREATE_SRCIPK_pn-linux-keystone ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-linux-keystone ?=3D "board-support/linux-${PV}=
"
> > > +SRCIPK_PRESERVE_GIT_pn-linux-keystone ?=3D "true"
> > >
> > > -CREATE_SRCIPK_pn-linux-am335x-psp =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-linux-am335x-psp =3D "board-support/linux-${KV=
ER}"
> > > +CREATE_SRCIPK_pn-linux-am335x-psp ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-linux-am335x-psp ?=3D "board-support/linux-${K=
VER}"
> > >
> > > -CREATE_SRCIPK_pn-linux-omap =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-linux-omap =3D "board-support/linux-${PV}-${PR=
}"
> > > +CREATE_SRCIPK_pn-linux-omap ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-linux-omap ?=3D "board-support/linux-${PV}-${P=
R}"
> > >
> > > -CREATE_SRCIPK_pn-linux =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-linux =3D "board-support/linux-${PV}"
> > > +CREATE_SRCIPK_pn-linux ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-linux ?=3D "board-support/linux-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-linux-omap4 =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-linux-omap4 =3D "board-support/linux-${PV}"
> > > +CREATE_SRCIPK_pn-linux-omap4 ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-linux-omap4 ?=3D "board-support/linux-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-cryptodev-module =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-cryptodev-module =3D "board-support/extra-driv=
ers/cryptodev-module-${PV}"
> > > -SRCIPK_PRESERVE_GIT_pn-cryptodev-module =3D "true"
> > > +CREATE_SRCIPK_pn-cryptodev-module ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-cryptodev-module ?=3D "board-support/extra-dri=
vers/cryptodev-module-${PV}"
> > > +SRCIPK_PRESERVE_GIT_pn-cryptodev-module ?=3D "true"
> > >
> > > -CREATE_SRCIPK_pn-cmem-mod =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-cmem-mod =3D "board-support/extra-drivers/${PN=
}-${PV}"
> > > +CREATE_SRCIPK_pn-cmem-mod ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-cmem-mod ?=3D "board-support/extra-drivers/${P=
N}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-debugss-module-drv =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-debugss-module-drv =3D "board-support/extra-dr=
ivers/${PN}-${PV}"
> > > +CREATE_SRCIPK_pn-debugss-module-drv ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-debugss-module-drv ?=3D "board-support/extra-d=
rivers/${PN}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-gdbserverproxy-module-drv =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-gdbserverproxy-module-drv =3D "board-support/e=
xtra-drivers/${PN}-${PV}"
> > > +CREATE_SRCIPK_pn-gdbserverproxy-module-drv ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-gdbserverproxy-module-drv ?=3D "board-support/=
extra-drivers/${PN}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-sgx-ddk-km =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-sgx-ddk-km =3D "board-support/extra-drivers=
/${PN}-${PV}"
> > > +CREATE_SRCIPK_pn-ti-sgx-ddk-km ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-sgx-ddk-km ?=3D "board-support/extra-driver=
s/${PN}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-img-rogue-driver =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-img-rogue-driver =3D "board-support/extra-d=
rivers/${PN}-${PV}"
> > > -SRCIPK_PRESERVE_GIT_pn-ti-img-rogue-driver =3D "true"
> > > +CREATE_SRCIPK_pn-ti-img-rogue-driver ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-img-rogue-driver ?=3D "board-support/extra-=
drivers/${PN}-${PV}"
> > > +SRCIPK_PRESERVE_GIT_pn-ti-img-rogue-driver ?=3D "true"
> > >
> > > -CREATE_SRCIPK_pn-ti-img-encode-decode =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-img-encode-decode =3D "board-support/extra-=
drivers/${PN}-${PV}"
> > > -SRCIPK_PRESERVE_GIT_pn-ti-img-encode-decode =3D "true"
> > > +CREATE_SRCIPK_pn-ti-img-encode-decode ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-img-encode-decode ?=3D "board-support/extra=
-drivers/${PN}-${PV}"
> > > +SRCIPK_PRESERVE_GIT_pn-ti-img-encode-decode ?=3D "true"
> > >
> > > -CREATE_SRCIPK_pn-ti-gc320-driver =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-gc320-driver =3D "board-support/extra-drive=
rs/${PN}-${PV}"
> > > +CREATE_SRCIPK_pn-ti-gc320-driver ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-gc320-driver ?=3D "board-support/extra-driv=
ers/${PN}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-linux-driver-examples =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples =3D "example-applicat=
ions/linux-driver-examples-${PV}"
> > > +CREATE_SRCIPK_pn-ti-linux-driver-examples ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples ?=3D "example-applica=
tions/linux-driver-examples-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-linux-driver-examples-omapl =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omapl =3D "example-ap=
plications/linux-driver-examples-${PV}"
> > > +CREATE_SRCIPK_pn-ti-linux-driver-examples-omapl ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omapl ?=3D "example-a=
pplications/linux-driver-examples-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-linux-driver-examples-omap3 =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omap3 =3D "example-ap=
plications/linux-driver-examples-${PV}"
> > > +CREATE_SRCIPK_pn-ti-linux-driver-examples-omap3 ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omap3 ?=3D "example-a=
pplications/linux-driver-examples-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-framework-components =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-framework-components =3D "component-sources=
/framework_components_${PV}"
> > > +CREATE_SRCIPK_pn-ti-framework-components ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-framework-components ?=3D "component-source=
s/framework_components_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-codec-engine =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-codec-engine =3D "component-sources/codec_e=
ngine_${PV}"
> > > +CREATE_SRCIPK_pn-ti-codec-engine ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-codec-engine ?=3D "component-sources/codec_=
engine_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-codecs-omap3530 =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-codecs-omap3530 =3D "codecs-omap3530_${PV}"
> > > +CREATE_SRCIPK_pn-ti-codecs-omap3530 ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-codecs-omap3530 ?=3D "codecs-omap3530_${PV}=
"
> > >
> > > -CREATE_SRCIPK_pn-ti-linuxutils =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-linuxutils =3D "component-sources/linuxutil=
s_${PV}"
> > > +CREATE_SRCIPK_pn-ti-linuxutils ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-linuxutils ?=3D "component-sources/linuxuti=
ls_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-xdctools =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-xdctools =3D "component-sources/xdctools_${=
PV}"
> > > +CREATE_SRCIPK_pn-ti-xdctools ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-xdctools ?=3D "component-sources/xdctools_$=
{PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-dmai =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-dmai =3D "dmai_${PV}"
> > > +CREATE_SRCIPK_pn-ti-dmai ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-dmai ?=3D "dmai_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-xdais =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-xdais =3D "component-sources/xdais_${PV}"
> > > +CREATE_SRCIPK_pn-ti-xdais ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-xdais ?=3D "component-sources/xdais_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-local-power-manager =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-local-power-manager =3D "local-power-manage=
r_${PV}"
> > > +CREATE_SRCIPK_pn-ti-local-power-manager ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-local-power-manager ?=3D "local-power-manag=
er_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-codecs-dm355 =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-codecs-dm355 =3D "codecs-dm355_${PV}"
> > > +CREATE_SRCIPK_pn-ti-codecs-dm355 ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-codecs-dm355 ?=3D "codecs-dm355_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-dvsdk-demos =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-dvsdk-demos =3D "dvsdk-demos_${PV}"
> > > +CREATE_SRCIPK_pn-ti-dvsdk-demos ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-dvsdk-demos ?=3D "dvsdk-demos_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-dvtb =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-dvtb =3D "dvtb_${PV}"
> > > +CREATE_SRCIPK_pn-ti-dvtb ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-dvtb ?=3D "dvtb_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-codecs-dm365 =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-codecs-dm365 =3D "codecs-dm365_${PV}"
> > > +CREATE_SRCIPK_pn-ti-codecs-dm365 ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-codecs-dm365 ?=3D "codecs-dm365_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-dm365mm-module =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-dm365mm-module =3D "dm365mm-module_${PV}"
> > > +CREATE_SRCIPK_pn-ti-dm365mm-module ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-dm365mm-module ?=3D "dm365mm-module_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-codecs-dm6446 =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6446 =3D "codecs-dm6446_${PV}"
> > > +CREATE_SRCIPK_pn-ti-codecs-dm6446 ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6446 ?=3D "codecs-dm6446_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-codecs-dm6467 =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6467 =3D "codecs-dm6467_${PV}"
> > > +CREATE_SRCIPK_pn-ti-codecs-dm6467 ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6467 ?=3D "codecs-dm6467_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-codecs-omapl137 =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl137 =3D "codecs-omapl137_${PV}"
> > > +CREATE_SRCIPK_pn-ti-codecs-omapl137 ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl137 ?=3D "codecs-omapl137_${PV}=
"
> > >
> > > -CREATE_SRCIPK_pn-ti-codecs-omapl138 =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl138 =3D "codecs-omapl138_${PV}"
> > > +CREATE_SRCIPK_pn-ti-codecs-omapl138 ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl138 ?=3D "codecs-omapl138_${PV}=
"
> > >
> > > -CREATE_SRCIPK_pn-ti-cgt6x =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-cgt6x =3D "dsp-devkit/cgt6x_${PV}"
> > > +CREATE_SRCIPK_pn-ti-cgt6x ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-cgt6x ?=3D "dsp-devkit/cgt6x_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-cgt470 =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-cgt470 =3D "media-controller-devkit/cgt470_=
${PV}"
> > > +CREATE_SRCIPK_pn-ti-cgt470 ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-cgt470 ?=3D "media-controller-devkit/cgt470=
_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-dspbios =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-dspbios =3D "dspbios_${PV}"
> > > +CREATE_SRCIPK_pn-ti-dspbios ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-dspbios ?=3D "dspbios_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-sysbios =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-sysbios =3D "component-sources/bios_${PV}"
> > > +CREATE_SRCIPK_pn-ti-sysbios ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-sysbios ?=3D "component-sources/bios_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-biosutils =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-biosutils =3D "biosutils_${PV}"
> > > +CREATE_SRCIPK_pn-ti-biosutils ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-biosutils ?=3D "biosutils_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-dsplink =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-dsplink =3D "dsplink_${PV}"
> > > +CREATE_SRCIPK_pn-ti-dsplink ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-dsplink ?=3D "dsplink_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-syslink =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-syslink =3D "component-sources/syslink_${PV=
}"
> > > +CREATE_SRCIPK_pn-ti-syslink ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-syslink ?=3D "component-sources/syslink_${P=
V}"
> > >
> > > -CREATE_SRCIPK_pn-ti-edma3lld =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-edma3lld =3D "component-sources/edma3lld_${=
PV}"
> > > +CREATE_SRCIPK_pn-ti-edma3lld ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-edma3lld ?=3D "component-sources/edma3lld_$=
{PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-c6accel =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-c6accel =3D "component-sources/c6accel_${PV=
}"
> > > +CREATE_SRCIPK_pn-ti-c6accel ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-c6accel ?=3D "component-sources/c6accel_${P=
V}"
> > >
> > > -CREATE_SRCIPK_pn-ti-biospsp =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-biospsp =3D "biospsp_${PV}"
> > > +CREATE_SRCIPK_pn-ti-biospsp ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-biospsp ?=3D "biospsp_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-audio-soc-example =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-audio-soc-example =3D "audio-soc-example_${=
PV}"
> > > +CREATE_SRCIPK_pn-ti-audio-soc-example ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-audio-soc-example ?=3D "audio-soc-example_$=
{PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-c6run =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-c6run =3D "component-sources/c6run_${PV}"
> > > +CREATE_SRCIPK_pn-ti-c6run ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-c6run ?=3D "component-sources/c6run_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-osal =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-osal =3D "component-sources/osal_${PV}"
> > > +CREATE_SRCIPK_pn-ti-osal ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-osal ?=3D "component-sources/osal_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-ipc =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-ipc =3D "component-sources/ipc_${PV}"
> > > +CREATE_SRCIPK_pn-ti-ipc ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-ipc ?=3D "component-sources/ipc_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-dsp-benchmark =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-dsp-benchmark =3D "example-applications/dsp=
-benchmark_${PV}"
> > > +CREATE_SRCIPK_pn-ti-dsp-benchmark ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-dsp-benchmark ?=3D "example-applications/ds=
p-benchmark_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-gstreamer-ti =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-gstreamer-ti =3D "gstreamer-ti_${PV}"
> > > +CREATE_SRCIPK_pn-gstreamer-ti ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-gstreamer-ti ?=3D "gstreamer-ti_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-omx =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-omx =3D "component-sources/omx_${PV}"
> > > +CREATE_SRCIPK_pn-ti-omx ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-omx ?=3D "component-sources/omx_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-uia =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-uia =3D "component-sources/uia_${PV}"
> > > +CREATE_SRCIPK_pn-ti-uia ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-uia ?=3D "component-sources/uia_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-media-controller-utils =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-media-controller-utils =3D "board-support/m=
edia-controller-utils_${PV}"
> > > +CREATE_SRCIPK_pn-ti-media-controller-utils ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-media-controller-utils ?=3D "board-support/=
media-controller-utils_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-firmware-dm816x =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-firmware-dm816x =3D "board-support/prebuilt=
-images/dm816x-firmware_${PV}"
> > > +CREATE_SRCIPK_pn-ti-firmware-dm816x ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-firmware-dm816x ?=3D "board-support/prebuil=
t-images/dm816x-firmware_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-firmware-dm814x =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-firmware-dm814x =3D "board-support/prebuilt=
-images/dm814x-firmware_${PV}"
> > > +CREATE_SRCIPK_pn-ti-firmware-dm814x ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-firmware-dm814x ?=3D "board-support/prebuil=
t-images/dm814x-firmware_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-slog =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-slog =3D "component-sources/slog_${PV}"
> > > +CREATE_SRCIPK_pn-ti-slog ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-slog ?=3D "component-sources/slog_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-c674x-aaclcdec =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ti-c674x-aaclcdec =3D "component-sources/c674x=
-aaclcdec_${PV}"
> > > +CREATE_SRCIPK_pn-ti-c674x-aaclcdec ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ti-c674x-aaclcdec ?=3D "component-sources/c674=
x-aaclcdec_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-oe-layersetup =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-oe-layersetup =3D "bin/oe-layersetup"
> > > +CREATE_SRCIPK_pn-oe-layersetup ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-oe-layersetup ?=3D "bin/oe-layersetup"
> > >
> > > -CREATE_SRCIPK_pn-opencl-examples =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-opencl-examples =3D "example-applications/${PN=
}-${PV}"
> > > +CREATE_SRCIPK_pn-opencl-examples ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-opencl-examples ?=3D "example-applications/${P=
N}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-openmpacc-examples =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-openmpacc-examples =3D "example-applications/$=
{PN}-${PV}"
> > > +CREATE_SRCIPK_pn-openmpacc-examples ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-openmpacc-examples ?=3D "example-applications/=
${PN}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-tidl-examples =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-tidl-examples =3D "example-applications/${PN}-=
${PV}"
> > > -SRCIPK_SRC_DIR_pn-tidl-examples =3D "${S}/examples"
> > > +CREATE_SRCIPK_pn-tidl-examples ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-tidl-examples ?=3D "example-applications/${PN}=
-${PV}"
> > > +SRCIPK_SRC_DIR_pn-tidl-examples ?=3D "${S}/examples"
> > >
> > > -CREATE_SRCIPK_pn-qt-opencv-opencl-opengl-multithreaded =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-qt-opencv-opencl-opengl-multithreaded =3D "exa=
mple-applications/${PN}-${PV}"
> > > +CREATE_SRCIPK_pn-qt-opencv-opencl-opengl-multithreaded ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-qt-opencv-opencl-opengl-multithreaded ?=3D "ex=
ample-applications/${PN}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-libarch-examples =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-libarch-examples =3D "example-applications/${P=
N}-${PV}"
> > > +CREATE_SRCIPK_pn-libarch-examples ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-libarch-examples ?=3D "example-applications/${=
PN}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-linalg-examples =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-linalg-examples =3D "example-applications/${PN=
}-${PV}"
> > > -SRCIPK_SRC_DIR_pn-linalg-examples =3D "${EXAMPLES_ROOT}"
> > > +CREATE_SRCIPK_pn-linalg-examples ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-linalg-examples ?=3D "example-applications/${P=
N}-${PV}"
> > > +SRCIPK_SRC_DIR_pn-linalg-examples ?=3D "${EXAMPLES_ROOT}"
> > >
> > > -CREATE_SRCIPK_pn-barcode-roi =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-barcode-roi =3D "example-applications/${PN}-${=
PV}"
> > > +CREATE_SRCIPK_pn-barcode-roi ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-barcode-roi ?=3D "example-applications/${PN}-$=
{PV}"
> > >
> > > -CREATE_SRCIPK_pn-boot-monitor =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-boot-monitor =3D "board-support/${PN}-${PV}"
> > > +CREATE_SRCIPK_pn-boot-monitor ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-boot-monitor ?=3D "board-support/${PN}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-hplib-mod =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-hplib-mod =3D "board-support/extra-drivers/${P=
N}-${PV}"
> > > +CREATE_SRCIPK_pn-hplib-mod ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-hplib-mod ?=3D "board-support/extra-drivers/${=
PN}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-uio-module-drv =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-uio-module-drv =3D "board-support/extra-driver=
s/${PN}-${PV}"
> > > +CREATE_SRCIPK_pn-uio-module-drv ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-uio-module-drv ?=3D "board-support/extra-drive=
rs/${PN}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ivshmem-uio-driver =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ivshmem-uio-driver =3D "board-support/extra-dr=
ivers/${PN}-${PV}"
> > > -SRCIPK_PRESERVE_GIT_pn-ivshmem-uio-driver =3D "true"
> > > +CREATE_SRCIPK_pn-ivshmem-uio-driver ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ivshmem-uio-driver ?=3D "board-support/extra-d=
rivers/${PN}-${PV}"
> > > +SRCIPK_PRESERVE_GIT_pn-ivshmem-uio-driver ?=3D "true"
> > >
> > > -CREATE_SRCIPK_pn-ipsecmgr-mod =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-ipsecmgr-mod =3D "board-support/extra-drivers/=
${PN}-${PV}"
> > > +CREATE_SRCIPK_pn-ipsecmgr-mod ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-ipsecmgr-mod ?=3D "board-support/extra-drivers=
/${PN}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-pru-icss =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-pru-icss =3D "example-applications/${PN}-${PV}=
"
> > > +CREATE_SRCIPK_pn-pru-icss ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-pru-icss ?=3D "example-applications/${PN}-${PV=
}"
> > >
> > > -CREATE_SRCIPK_pn-dsplib-c66x =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-dsplib-c66x =3D "component-sources/dsplib_c66x=
_${PV}"
> > > +CREATE_SRCIPK_pn-dsplib-c66x ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-dsplib-c66x ?=3D "component-sources/dsplib_c66=
x_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-mathlib-c66x =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-mathlib-c66x =3D "component-sources/mathlib_c6=
6x_${PV}"
> > > +CREATE_SRCIPK_pn-mathlib-c66x ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-mathlib-c66x ?=3D "component-sources/mathlib_c=
66x_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-imglib-c66x =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-imglib-c66x =3D "component-sources/imglib_c66x=
_${PV}"
> > > +CREATE_SRCIPK_pn-imglib-c66x ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-imglib-c66x ?=3D "component-sources/imglib_c66=
x_${PV}"
> > >
> > > -CREATE_SRCIPK_pn-vlib-c66x =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-vlib-c66x =3D "component-sources/vlib_c66x_${P=
V}"
> > > +CREATE_SRCIPK_pn-vlib-c66x ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-vlib-c66x ?=3D "component-sources/vlib_c66x_${=
PV}"
> > >
> > > -CREATE_SRCIPK_pn-big-data-ipc-demo-linux =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-big-data-ipc-demo-linux =3D "example-applicati=
ons/${PN}-${PV}"
> > > +CREATE_SRCIPK_pn-big-data-ipc-demo-linux ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-big-data-ipc-demo-linux ?=3D "example-applicat=
ions/${PN}-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-ti-sci-fw_k3 =3D "1"
> > > -SRCIPK_SRC_DIR_pn-ti-sci-fw_k3 =3D "${WORKDIR}/imggen"
> > > -SRCIPK_INSTALL_DIR_pn-ti-sci-fw_k3 =3D "board-support/system-firmwar=
e-image-gen-${PV}"
> > > +CREATE_SRCIPK_pn-ti-sci-fw_k3 ?=3D "1"
> > > +SRCIPK_SRC_DIR_pn-ti-sci-fw_k3 ?=3D "${WORKDIR}/imggen"
> > > +SRCIPK_INSTALL_DIR_pn-ti-sci-fw_k3 ?=3D "board-support/system-firmwa=
re-image-gen-${PV}"
> > >
> > > -CREATE_SRCIPK_pn-jailhouse =3D "1"
> > > -SRCIPK_INSTALL_DIR_pn-jailhouse =3D "board-support/extra-drivers/${P=
N}-${PV}"
> > > +CREATE_SRCIPK_pn-jailhouse ?=3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-jailhouse ?=3D "board-support/extra-drivers/${=
PN}-${PV}"
> > > --
> > > 2.17.1
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > ________________________________
> >  This email is confidential and may contain information subject to lega=
l privilege. If you are not the intended recipient please advise us of our =
error by return e-mail then delete this email and any attached files. You m=
ay not copy, disclose or use the contents in any way. The views expressed i=
n this email may not be those of Gallagher Group Ltd or subsidiary companie=
s thereof.
> > ________________________________
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

