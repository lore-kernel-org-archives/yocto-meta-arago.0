Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A542052A2A
	for <meta-arago@arago-project.org>;
	Wed,  1 Feb 2012 13:07:41 +0000 (UTC)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q11D7dPV018113;
	Wed, 1 Feb 2012 07:07:39 -0600
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q11D7dkO011348;
	Wed, 1 Feb 2012 07:07:39 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE70.ent.ti.com ([fe80::db3:609a:aa62:e1ec%22]) with mapi id
	14.01.0323.003; Wed, 1 Feb 2012 07:07:39 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCH] qt4-embedded: append qt4-embedded LICENSE
	setting
Thread-Index: AQHM4KlRFk1iqCKRgUeRrU04K+f7jJYoAm+Q
Date: Wed, 1 Feb 2012 13:07:38 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1010BFA53B4@DLEE12.ent.ti.com>
References: <1328040848-29090-1-git-send-email-Chase.Maupin@ti.com>
	<20120201061827.GH5169@denix.org>
In-Reply-To: <20120201061827.GH5169@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] qt4-embedded: append qt4-embedded LICENSE setting
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
X-List-Received-Date: Wed, 01 Feb 2012 13:07:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

I realize there are tools for handling bbappends and I've used some of them=
 before.  But what I saw with arago in the past was that amends were added =
to work around some issue temporarily while the fix was being pushed upstre=
am, but then kind of lost in the mix or forgotten about.  I guess what I wa=
s hoping for was that by placing the bbappends in a single directory that w=
e could have an easy focal point for what we should be trying to reduce or =
keep minimal.  Basically out of sight out of mind is what I'm trying to avo=
id.

But, I'm not married to this.  At the end of the day I am willing to go wit=
h whatever makes sense to the most people and we could use one of the tools=
 to check for appends that no longer apply, as well as a list of which reci=
pes are being appended.

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
> Sent: Wednesday, February 01, 2012 12:18 AM
> To: Maupin, Chase
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] qt4-embedded: append qt4-embedded
> LICENSE setting
>=20
> On Tue, Jan 31, 2012 at 02:14:08PM -0600, Chase Maupin wrote:
> > * Append the qt4-embedded LICENSE field to LGPLv2.1 to reflect
> >   the license we are distributing this under.
> > * This is similar to the amend used in the old arago overlay
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  .../qt4/qt4-embedded_4.8.0.bbappend                |    5 +++++
> >  1 files changed, 5 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-arago-distro/recipes-bbappends/qt4/qt4-
> embedded_4.8.0.bbappend
>=20
> I'm still not convinced about recipes-bbappends. What do you see
> are the
> benefits? Are you afraid of losing track of .bbappends among real
> recipes?
> There are tools for that, such as bitbake-layers.
>=20
> Qt recipes live in recipes-qt/qt4 in OE-Core and corresponding
> bbappends in
> meta-oe are at the same location. Why do we need a different one
> for Arago?
> bitbake-layers would allow you to examine the recipe overlaying and
> modifications from .bbappends...
>=20
> --
> Denys
>=20
>=20
> > diff --git a/meta-arago-distro/recipes-bbappends/qt4/qt4-
> embedded_4.8.0.bbappend b/meta-arago-distro/recipes-
> bbappends/qt4/qt4-embedded_4.8.0.bbappend
> > new file mode 100644
> > index 0000000..462a746
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-bbappends/qt4/qt4-
> embedded_4.8.0.bbappend
> > @@ -0,0 +1,5 @@
> > +# Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
> > +# For our distribution purposes we only use LGPLv2.1
> > +LICENSE =3D "LGPLv2.1"
> > +
> > +PR_append =3D "-arago1"
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >

