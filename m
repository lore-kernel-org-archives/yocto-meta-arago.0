Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id BFCCD52987
	for <meta-arago@arago-project.org>;
	Wed, 25 Jul 2018 20:41:35 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6PKfS1G038589
	for <meta-arago@arago-project.org>; Wed, 25 Jul 2018 15:41:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532551288;
	bh=EM3GUnJnHP/ERapPLri7GUyiKwggyopeVaYgpuTZvjs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=DW+/mKxa7F1RwjC09B/kWIGJ6/gHfuLZOKwL0SAq7OJxRLQMbAuf2Yn45lThYKDtm
	fmIttjq4mDZskqhjz2f57/6JpzNx9+dwfMIN+4pyEv7GYgSEfkLb6V40l2LvTmpxMk
	ywBdyolH4PECF70ps7boPkZ4XXGLS49FkaHHT2fQ=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6PKfSVG001734
	for <meta-arago@arago-project.org>; Wed, 25 Jul 2018 15:41:28 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 25 Jul 2018 15:41:28 -0500
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1466.003; Wed, 25 Jul 2018 15:41:28 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [meta-processor-sdk][PATCH 3/3]
	packagegroup-arago-tisdk-opencl: add tidl-utils
Thread-Index: AQHUJA+/IUTTL7h9zkWeIlMudxH1r6SgeAkA//+s8TCAAEJuMA==
Date: Wed, 25 Jul 2018 20:41:28 +0000
Message-ID: <1bab806be9db4ebb8aca9cef73082bd5@ti.com>
References: <1532519588-17585-1-git-send-email-j-stiffler@ti.com>
	<1532519588-17585-3-git-send-email-j-stiffler@ti.com>
	<20180725164017.GG2269@beryl> <a285a8e27896486e9c0f6b2bf34950e5@ti.com>
In-Reply-To: <a285a8e27896486e9c0f6b2bf34950e5@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.79]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Senicic,
	Djordje" <d-senicic1@ti.com>
Subject: Re: [meta-processor-sdk][PATCH 3/3] packagegroup-arago-tisdk-opencl: add tidl-utils
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
X-List-Received-Date: Wed, 25 Jul 2018 20:41:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Jake. The patch for adding pruss-lld-apps is now submitted.

> -----Original Message-----
> From: Stiffler, Jacob
> Sent: Wednesday, July 25, 2018 12:44 PM
> To: Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org; Senicic, Djordje; Gou, Hongmei
> Subject: RE: [meta-arago] [meta-processor-sdk][PATCH 3/3] packagegroup-
> arago-tisdk-opencl: add tidl-utils
>=20
> Hongmei, Djordje,
>=20
> Can you handle upstreaming these?
>=20
> - Jake
>=20
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Wednesday, July 25, 2018 12:40 PM
> > To: Stiffler, Jacob
> > Cc: meta-arago@arago-project.org; Senicic, Djordje
> > Subject: Re: [meta-arago] [meta-processor-sdk][PATCH 3/3]
> packagegroup-
> > arago-tisdk-opencl: add tidl-utils
> >
> > Will any of these 3 be upstreamed?
> >
> >
> > On Wed, Jul 25, 2018 at 07:53:08AM -0400, Jacob Stiffler wrote:
> > > Cc: Djordje Senicic <x0157990@ti.com>
> > > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > > ---
> > >  recipes-core/packagegroups/packagegroup-arago-tisdk-
> opencl.bbappend
> > | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-
> > opencl.bbappend b/recipes-core/packagegroups/packagegroup-arago-
> > tisdk-opencl.bbappend
> > > index 782affe..b1b74a9 100644
> > > --- a/recipes-core/packagegroups/packagegroup-arago-tisdk-
> > opencl.bbappend
> > > +++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-
> > opencl.bbappend
> > > @@ -1,6 +1,6 @@
> > > -PR_append =3D ".tisdk0"
> > > +PR_append =3D ".tisdk1"
> > >
> > > -TIDL_PKGS =3D "tidl-examples-dev tidl-viewer"
> > > +TIDL_PKGS =3D "tidl-examples-dev tidl-viewer tidl-utils"
> > >
> > >  EXTRA_PKGS_append_am57xx-evm =3D " ${TIDL_PKGS}"
> > >  EXTRA_PKGS_append_am57xx-hs-evm =3D " ${TIDL_PKGS}"
> > > --
> > > 2.7.4
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

