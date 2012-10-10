Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 76E0852A10
	for <meta-arago@arago-project.org>;
	Wed, 10 Oct 2012 20:01:19 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9AK1IKR006451
	for <meta-arago@arago-project.org>; Wed, 10 Oct 2012 15:01:18 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9AK1Ilr007334
	for <meta-arago@arago-project.org>; Wed, 10 Oct 2012 15:01:18 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Wed, 10 Oct 2012 15:01:18 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [meta-arago-extras][PATCH] ti-tisdk-setup: Port
	ti-tisdk-setup from arago
Thread-Index: AQHNmFkY5UdyyyUSCkSeh1clB6luSZeaYi6AgBiUgLCAAF04gIAAAMiA//+wAjKAAAjwgIAAWH4A//+tAfA=
Date: Wed, 10 Oct 2012 20:01:17 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159257515@DLEE12.ent.ti.com>
References: <1348275070-27814-1-git-send-email-fcooper@ti.com>
	<20120924215703.GG4278@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C300E9C@DFLE09.ent.ti.com>
	<20121010185225.GC32682@edge> <20121010185513.GD16944@denix.org>
	<9EA37CA2-92CB-4988-9E82-9D39A13B0F3C@ti.com>
	<7D46E86EC0A8354091174257B2FED10159257395@DLEE12.ent.ti.com>
	<20121010195738.GF16944@denix.org>
In-Reply-To: <20121010195738.GF16944@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [meta-arago-extras][PATCH] ti-tisdk-setup: Port ti-tisdk-setup from arago
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
X-List-Received-Date: Wed, 10 Oct 2012 20:01:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, October 10, 2012 2:58 PM
> To: Maupin, Chase
> Cc: Cooper Jr., Franklin; Dmytriyenko, Denys; meta-arago@arago-
> project.org
> Subject: Re: [meta-arago] [meta-arago-extras][PATCH] ti-tisdk-
> setup: Port ti-tisdk-setup from arago
>=20
> On Wed, Oct 10, 2012 at 07:43:08PM +0000, Maupin, Chase wrote:
> > There are lots of tweaks to the actual scripts that would be
> nice, but aside
> > from that no.  They all need to go into an SDK.  They make up a
> large part
> > of the OOBE and they tend to go together.  The only one that
> could be
> > separated (in that it is not a dependecy for another one) would
> be
> > create-sdcard.sh but we consider that script as critical as all
> the others
> > and a mandatory install as part of the setup for an SDK.
>=20
> First of all, let's cut the patch from the email - I'm tired
> going to the
> administrative interface to approve the oversize message to the
> list... :)
>=20
> Second, why can't we have a separate git repository for all those
> shell
> scripts that are used for OOBE - you'll get version control and
> move the bulk
> outside of the metadata. Is it feasible?

I'm OK with a separate git repo.  Can you create a tisdk-setup-scripts repo=
 on arago for us?

>=20
> --
> Denys
>=20
>=20
> > > -----Original Message-----
> > > From: Cooper Jr., Franklin
> > > Sent: Wednesday, October 10, 2012 2:09 PM
> > > To: Dmytriyenko, Denys; Maupin, Chase
> > > Cc: meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [meta-arago-extras][PATCH] ti-
> tisdk-
> > > setup: Port ti-tisdk-setup from arago
> > >
> > > I'll look at this tomorrow then.
> > >
> > > Chase,
> > > Did you have any thoughts over the years about improvement to
> > > this recipe/ scripts over the years that u wanted to make but
> > > couldn't due to legacy reasons?
> > >
> > > On Oct 10, 2012, at 1:55 PM, "Dmytriyenko, Denys"
> <denys@ti.com>
> > > wrote:
> > >
> > > > On Wed, Oct 10, 2012 at 02:52:25PM -0400, Denys Dmytriyenko
> > > wrote:
> > > >> On Wed, Oct 10, 2012 at 02:21:35PM -0400, Cooper Jr.,
> Franklin
> > > wrote:
> > > >>> What's concerning you about this patch?
> > > >>
> > > >> It's size and complexity, mostly.
> > > >
> > > > It doesn't even fit in the mailing list size limit of
> 100KB...
> > > :)

