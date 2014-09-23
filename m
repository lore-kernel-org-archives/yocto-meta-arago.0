Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 89F4B529CF
	for <meta-arago@arago-project.org>;
	Tue, 23 Sep 2014 16:18:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8NGIIir007882
	for <meta-arago@arago-project.org>; Tue, 23 Sep 2014 11:18:18 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NGIIB9003797
	for <meta-arago@arago-project.org>; Tue, 23 Sep 2014 11:18:18 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Tue, 23 Sep 2014 11:18:18 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "R, Karthik" <karthik.ramanan@ti.com>
Thread-Topic: [meta-arago] [for master 0/5] GFX/MM patches from meta-glsdk
	layer
Thread-Index: AQHP10aUcRqgLR/sL0S/NX8Q6Ml3P5wPM66A//+xuSA=
Date: Tue, 23 Sep 2014 16:18:16 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C73B3BD@DFLE08.ent.ti.com>
References: <1411487426-31949-1-git-send-email-a0393906@ti.com>
	<20140923155825.GM6303@edge>
In-Reply-To: <20140923155825.GM6303@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [for master 0/5] GFX/MM patches from meta-glsdk layer
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
X-List-Received-Date: Tue, 23 Sep 2014 16:18:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Same for me.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Tuesday, September 23, 2014 10:58 AM
> To: R, Karthik
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [for master 0/5] GFX/MM patches from meta-
> glsdk layer
>=20
> Except #4, the rest have my Ack.
>=20
> On Tue, Sep 23, 2014 at 09:20:21PM +0530, Karthik Ramanan wrote:
> > This patch set contains the first set of patches upstreamed to
> > meta-arago from meta-glsdk.
> >
> > Each of these patches can be independently applied in any order.
> >
> > Karthik Ramanan (5):
> >   gst-plugins-vpe: Bug fixes and feature additions
> >   gst-plugins-ducati: Support encoder and bug fix updates
> >   libdce: Single planar encode support
> >   example-applications: Adding repository of GLSDK example applications
> >   omapdrmtest: Added new tests and bug fixes.
> >
> >  .../example-applications/example-applications.bb   |   15
> +++++++++++++++
> >  .../omapdrmtest/omapdrmtest_1.0.0.bb               |    6 +++---
> >  .../gst-plugins-ti/gst-plugins-ducati_git.bb       |    4 ++--
> >  .../gst-plugins-ti/gst-plugins-vpe_git.bb          |    4 ++--
> >  .../recipes-multimedia/libdce/libdce_git.bb        |    4 ++--
> >  5 files changed, 24 insertions(+), 9 deletions(-)  create mode 100644
> > meta-arago-extras/recipes-graphics/example-applications/example-applic
> > ations.bb
> >
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

