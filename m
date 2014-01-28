Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 40014529AA
	for <meta-arago@arago-project.org>;
	Tue, 28 Jan 2014 21:51:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0SLpqMs009987
	for <meta-arago@arago-project.org>; Tue, 28 Jan 2014 15:51:52 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0SLpqIs014477
	for <meta-arago@arago-project.org>; Tue, 28 Jan 2014 15:51:52 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 28 Jan 2014 15:51:52 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 3/3] packagegroup-arago-test: Add useful
	testing tools
Thread-Index: AQHPFiopWZ+yby4pBEGMcE8qUvEkeZqOmvoAgAVofYA=
Date: Tue, 28 Jan 2014 21:51:51 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6140C7@DFLE08.ent.ti.com>
References: <1390259818-10267-1-git-send-email-fcooper@ti.com>
	<1390259818-10267-3-git-send-email-fcooper@ti.com>
	<20140120224548.GF24768@edge>
In-Reply-To: <20140120224548.GF24768@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/3] packagegroup-arago-test: Add useful testing tools
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
X-List-Received-Date: Tue, 28 Jan 2014 21:51:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry apparently I had this in my draft email directory since I forgot to h=
it send...

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, January 20, 2014 4:46 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 3/3] packagegroup-arago-test: Add useful
> testing tools
>=20
> On Mon, Jan 20, 2014 at 05:16:58PM -0600, Franklin S. Cooper Jr wrote:
> > * Add two useful testing utilites to the arago filesystem.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../packagegroups/packagegroup-arago-test.bb       |    4 +++-
> >  1 files changed, 3 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup=
-
> arago-test.bb
> > index 399eea9..93a980f 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> test.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> test.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "Extended task to get System Test specific apps"
> >  LICENSE =3D "MIT"
> > -PR =3D "r13"
> > +PR =3D "r14"
> >
> >  inherit packagegroup
> >
> > @@ -17,6 +17,8 @@ ARAGO_TEST =3D "\
> >      bc \
> >      memtester \
> >      libdrm-tests \
> > +    powertop \
>=20
> This will add powertop-1.13 from oe-core - is that what you want?
[Franklin] I heard that this version should be fine so I'm ok with that.
> There's 2.3 in meta-linaro, which we don't use, though...
>=20
> > +    stress \
> >      "
> >
> >  ARAGO_TI_TEST =3D "\
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

