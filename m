Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id B4FB9529AE
	for <meta-arago@arago-project.org>;
	Wed, 25 Jul 2018 16:43:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6PGhWlc127060
	for <meta-arago@arago-project.org>; Wed, 25 Jul 2018 11:43:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532537012;
	bh=/1+5qqcxcCMX8Q+uIXGL3+KlMVX1AMQadsrPO0lSaGY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=fVIAtcZitSYi2P700Fojxax4A3CXz4c8EBHTetnMjgVoLIZ5kdukC6bFF3j/mbGvR
	XAaQzepaAP3EzFLXraWmnU53HEhScFgQtm/eoI7G5PoUOOje7PC8+FexJ0F/Jy8Kst
	5ex1eymtsz9FGDugmoxcfU8iKqYjX23b/rTxLMdU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6PGhW3V004714
	for <meta-arago@arago-project.org>; Wed, 25 Jul 2018 11:43:32 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 25 Jul 2018 11:43:32 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1466.003; Wed, 25 Jul 2018 11:43:32 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [meta-processor-sdk][PATCH 3/3]
	packagegroup-arago-tisdk-opencl: add tidl-utils
Thread-Index: AQHUJA+/Cs2Hta7vwUyfSW351bO5/6SgeAkA//+s8TA=
Date: Wed, 25 Jul 2018 16:43:32 +0000
Message-ID: <a285a8e27896486e9c0f6b2bf34950e5@ti.com>
References: <1532519588-17585-1-git-send-email-j-stiffler@ti.com>
	<1532519588-17585-3-git-send-email-j-stiffler@ti.com>
	<20180725164017.GG2269@beryl>
In-Reply-To: <20180725164017.GG2269@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.191]
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
X-List-Received-Date: Wed, 25 Jul 2018 16:43:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hongmei, Djordje,

Can you handle upstreaming these?

- Jake

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, July 25, 2018 12:40 PM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org; Senicic, Djordje
> Subject: Re: [meta-arago] [meta-processor-sdk][PATCH 3/3] packagegroup-
> arago-tisdk-opencl: add tidl-utils
>=20
> Will any of these 3 be upstreamed?
>=20
>=20
> On Wed, Jul 25, 2018 at 07:53:08AM -0400, Jacob Stiffler wrote:
> > Cc: Djordje Senicic <x0157990@ti.com>
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
> | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-
> opencl.bbappend b/recipes-core/packagegroups/packagegroup-arago-
> tisdk-opencl.bbappend
> > index 782affe..b1b74a9 100644
> > --- a/recipes-core/packagegroups/packagegroup-arago-tisdk-
> opencl.bbappend
> > +++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-
> opencl.bbappend
> > @@ -1,6 +1,6 @@
> > -PR_append =3D ".tisdk0"
> > +PR_append =3D ".tisdk1"
> >
> > -TIDL_PKGS =3D "tidl-examples-dev tidl-viewer"
> > +TIDL_PKGS =3D "tidl-examples-dev tidl-viewer tidl-utils"
> >
> >  EXTRA_PKGS_append_am57xx-evm =3D " ${TIDL_PKGS}"
> >  EXTRA_PKGS_append_am57xx-hs-evm =3D " ${TIDL_PKGS}"
> > --
> > 2.7.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

