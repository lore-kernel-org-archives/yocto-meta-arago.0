Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 15ED852A4D
	for <meta-arago@arago-project.org>;
	Mon,  4 May 2015 11:31:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t44BV9cf032481
	for <meta-arago@arago-project.org>; Mon, 4 May 2015 06:31:09 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t44BV8wh008034
	for <meta-arago@arago-project.org>; Mon, 4 May 2015 06:31:08 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Mon, 4 May 2015 06:31:08 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] ltp-ddt: Skip mv of kernel files if no
	files found
Thread-Index: AQHQeUywIN46JmND80K+zYZdea0N651WlGmAgAMuD4CAEgZyAA==
Date: Mon, 4 May 2015 11:31:08 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905819AD56@DLEE11.ent.ti.com>
References: <1429302346-9926-1-git-send-email-sam.nelson@ti.com>
	<20150420184121.GA23723@edge> <20150422191458.GK25236@edge>
In-Reply-To: <20150422191458.GK25236@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] ltp-ddt: Skip mv of kernel files if no files found
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
X-List-Received-Date: Mon, 04 May 2015 11:31:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, April 22, 2015 3:15 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] ltp-ddt: Skip mv of kernel files if no =
files
> found
>=20
> On Mon, Apr 20, 2015 at 02:41:21PM -0400, Denys Dmytriyenko wrote:
> > On Fri, Apr 17, 2015 at 04:25:46PM -0400, Sam Nelson wrote:
> > > - Install was failing if there are no modules for certain platforms
> > >
> > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > ---
> > >  .../recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb      |    2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git
> > > a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> > > b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> > > index 68e1a3c..609b344 100644
> > > --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> > > +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> > > @@ -87,7 +87,7 @@ do_install() {
> > >      oe_runmake install
> > >      install -d ${D}${datadir}
> > >      install -d ${D}${kmoddir}
> > > -    mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir}
> > > +    find ${D}${LTPROOT}/testcases/bin/ddt/*.ko && mv
> > > + ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir}
> >
> > Should probably do "mv || true" instead...
>=20
> Sam,
>=20
> Do you have any issues doing mv||true construct or do you want to stick
> with the find command for any reason?
I am fine with this. Thanks.
>=20
> --
> Denys

