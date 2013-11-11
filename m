Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 49F9252998
	for <meta-arago@arago-project.org>;
	Mon, 11 Nov 2013 19:28:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rABJSoxx001250
	for <meta-arago@arago-project.org>; Mon, 11 Nov 2013 13:28:50 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rABJSoO5031264
	for <meta-arago@arago-project.org>; Mon, 11 Nov 2013 13:28:50 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Mon, 11 Nov 2013 13:28:50 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 4/4] arago-test: add linaro-pm-qa-utils to
	test	packages
Thread-Index: AQHO3vh7SZr1wTzVrU6bhsRMtI0sPpogYEFQgAAC7QCAAAUfgIAAARgAgABlfgD//5uisA==
Date: Mon, 11 Nov 2013 19:28:49 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C59D184@DFLE08.ent.ti.com>
References: <1384189628-21944-1-git-send-email-Chase.Maupin@ti.com>
	<1384189628-21944-4-git-send-email-Chase.Maupin@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C59CF0B@DFLE08.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015980BE91@DLEE11.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015980BED0@DLEE11.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C59D119@DFLE08.ent.ti.com>
	<20131111192756.GD24766@denix.org>
In-Reply-To: <20131111192756.GD24766@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 4/4] arago-test: add linaro-pm-qa-utils to test	packages
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
X-List-Received-Date: Mon, 11 Nov 2013 19:28:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Meant stuck :)

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, November 11, 2013 1:28 PM
> To: Cooper Jr., Franklin
> Cc: Maupin, Chase; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 4/4] arago-test: add linaro-pm-qa-utils =
to test
> packages
>=20
> "suck" is not the word I'd use here...
>=20
> On Mon, Nov 11, 2013 at 07:26:47PM +0000, Cooper Jr., Franklin wrote:
> > FYI only ltp-ddt in meta-arago picks up the latest commits via
> > AUTOREV. The base recipe in meta-oe is suck on a commit two years old..=
..
> >
> > > -----Original Message-----
> > > From: Maupin, Chase
> > > Sent: Monday, November 11, 2013 1:22 PM
> > > To: Maupin, Chase; Cooper Jr., Franklin;
> > > meta-arago@arago-project.org
> > > Subject: RE: [meta-arago] [PATCH 4/4] arago-test: add
> > > linaro-pm-qa-utils to test packages
> > >
> > > Denys,
> > >
> > > I could use some advice here though.  Ltp-ddt sits in
> > > meta-openembedded so even if we get the pm-utils into meta-linaro we
> > > still should not introduce this dependency between layers right?
> > >
> > > However, we do append ltp-ddt in meta-arago so if we introduce this
> > > dependency there would that be an issue?
> > >
> > > What do you think about how to handle this?
> > >
> > > >-----Original Message-----
> > > >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > >bounces@arago-project.org] On Behalf Of Maupin, Chase
> > > >Sent: Monday, November 11, 2013 1:19 PM
> > > >To: Cooper Jr., Franklin; meta-arago@arago-project.org
> > > >Subject: Re: [meta-arago] [PATCH 4/4] arago-test: add linaro-pm-
> > > >qa-utils to test packages
> > > >
> > > >Good point.
> > > >
> > > >Sincerely,
> > > >Chase Maupin
> > > >Integration Team Manager
> > > >Linux Core Product Development
> > > >e-mail: chase.maupin@ti.com
> > > >phone: (214) 567-2950
> > > >
> > > >For support:
> > > >Forums - http://community.ti.com/forums/ Wiki -
> > > >http://wiki.davincidsp.com/
> > > >
> > > >
> > > >>-----Original Message-----
> > > >>From: Cooper Jr., Franklin
> > > >>Sent: Monday, November 11, 2013 12:54 PM
> > > >>To: Maupin, Chase; meta-arago@arago-project.org
> > > >>Subject: RE: [meta-arago] [PATCH 4/4] arago-test: add linaro-pm-
> > > >>qa-utils to test packages
> > > >>
> > > >>The current patch is fine as is but should there be another patch
> > > >>that makes ltp-ddt RDEPENDS on linaro-pm-qa-utils?
> > > >>
> > > >>> -----Original Message-----
> > > >>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > >>> bounces@arago-project.org] On Behalf Of Maupin, Chase
> > > >>> Sent: Monday, November 11, 2013 11:07 AM
> > > >>> To: meta-arago@arago-project.org
> > > >>> Subject: [meta-arago] [PATCH 4/4] arago-test: add linaro-pm-qa-
> > > >>utils to test
> > > >>> packages
> > > >>>
> > > >>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > > >>> ---
> > > >>>  .../packagegroups/packagegroup-arago-test.bb       |    3 ++-
> > > >>>  1 files changed, 2 insertions(+), 1 deletions(-)
> > > >>>
> > > >>> diff --git a/meta-arago-distro/recipes-
> > > >>core/packagegroups/packagegroup-
> > > >>> arago-test.bb b/meta-arago-distro/recipes-
> > > >>core/packagegroups/packagegroup-
> > > >>> arago-test.bb
> > > >>> index 35fa627..58ecd83 100644
> > > >>> --- a/meta-arago-distro/recipes-
> > > >core/packagegroups/packagegroup-
> > > >>arago-
> > > >>> test.bb
> > > >>> +++ b/meta-arago-distro/recipes-
> > > >core/packagegroups/packagegroup-
> > > >>arago-
> > > >>> test.bb
> > > >>> @@ -1,6 +1,6 @@
> > > >>>  DESCRIPTION =3D "Extended task to get System Test specific apps"
> > > >>>  LICENSE =3D "MIT"
> > > >>> -PR =3D "r9"
> > > >>> +PR =3D "r10"
> > > >>>
> > > >>>  inherit packagegroup
> > > >>>
> > > >>> @@ -21,6 +21,7 @@ ARAGO_TEST =3D "\  ARAGO_TI_TEST =3D "\
> > > >>>      ltp-ddt \
> > > >>>      input-utils \
> > > >>> +    linaro-pm-qa-utils \
> > > >>>      "
> > > >>>
> > > >>>  ARAGO_TI_TEST_append_omap-a15 =3D " \
> > > >>> --
> > > >>> 1.7.0.4
> > > >>>
> > > >>> _______________________________________________
> > > >>> meta-arago mailing list
> > > >>> meta-arago@arago-project.org
> > > >>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > >_______________________________________________
> > > >meta-arago mailing list
> > > >meta-arago@arago-project.org
> > > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >

