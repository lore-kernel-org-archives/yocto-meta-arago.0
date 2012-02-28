Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E85CC52993
	for <meta-arago@arago-project.org>;
	Tue, 28 Feb 2012 22:37:11 +0000 (UTC)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q1SMbB4u024134;
	Tue, 28 Feb 2012 16:37:11 -0600
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1SMbBbq021845;
	Tue, 28 Feb 2012 16:37:11 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE71.ent.ti.com ([fe80::29f6:72ad:a62e:2025%21]) with mapi id
	14.01.0323.003; Tue, 28 Feb 2012 16:37:11 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCH 0/3] update matrix sources
Thread-Index: AQHM9mLCDBKbYzHso0agC6lR49KGqZZS3coQgABs54D//5uGwA==
Date: Tue, 28 Feb 2012 22:37:10 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1012F04395C@DLEE12.ent.ti.com>
References: <1330465723-24817-1-git-send-email-Chase.Maupin@ti.com>
	<7D46E86EC0A8354091174257B2FED1012F04379A@DLEE12.ent.ti.com>
	<20120228223641.GB12073@denix.org>
In-Reply-To: <20120228223641.GB12073@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 0/3] update matrix sources
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
X-List-Received-Date: Tue, 28 Feb 2012 22:37:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Agreed.  No issues here.

Sincerely,
Chase Maupin
Software Applications
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denis@denix.org]
> Sent: Tuesday, February 28, 2012 4:37 PM
> To: Maupin, Chase
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 0/3] update matrix sources
>=20
> On Tue, Feb 28, 2012 at 10:07:26PM +0000, Maupin, Chase wrote:
> > Looks like Denys already got these, so NM
>=20
> I didn't see your patches. I already synced up with changes you
> sent against
> arago, but then got distracted by a meeting, before pushing them
> in.
>=20
> They look the same though, I just commented out nbench until it
> gets into
> oe-core/meta-oe...
>=20
> --
> Denys
>=20
>=20
> > > -----Original Message-----
> > > From: Maupin, Chase
> > > Sent: Tuesday, February 28, 2012 3:49 PM
> > > To: meta-arago@arago-project.org
> > > Cc: Maupin, Chase
> > > Subject: [PATCH 0/3] update matrix sources
> > >
> > > The following patches update the matrix sources.
> > >
> > > Patches 2 and 3 depend on the nbench-byte recipe being added
> > > into meta-oe first.  The patch has been submitted to the list
> > > but has not yet been committed.
> > >
> > > Chase Maupin (3):
> > >   refresh-screen: update to latest sources
> > >   matrix-gui-apps-git: update to latest sources
> > >   matrix-gui-armbenchmarks-demos: update dependencies
> > >
> > >  .../recipes-core/matrix/matrix-gui-apps-git.inc    |    4 ++--
> > >  .../matrix/matrix-gui-armbenchmarks-demos_2.0.bb   |    4 ++--
> > >  .../recipes-core/matrix/refresh-screen_2.0.bb      |    4 ++--
> > >  3 files changed, 6 insertions(+), 6 deletions(-)
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >

