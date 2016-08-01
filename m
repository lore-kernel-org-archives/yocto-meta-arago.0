Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id DAFB652ABA
	for <meta-arago@arago-project.org>;
	Mon,  1 Aug 2016 16:38:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u71GYpLX030973
	for <meta-arago@arago-project.org>; Mon, 1 Aug 2016 11:34:51 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u71GcguV002169
	for <meta-arago@arago-project.org>; Mon, 1 Aug 2016 11:38:42 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Mon, 1 Aug 2016 11:38:42 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: fix compilation
	for k2 machines
Thread-Index: AQHR7BIfi39kypn3bUmTBBHP/U5NH6A0oWMA//+sq3A=
Date: Mon, 1 Aug 2016 16:38:41 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958142EFE4D@DFLE09.ent.ti.com>
References: <1470069037-21648-1-git-send-email-j-stiffler@ti.com>
	<20160801163630.GA3677@edge>
In-Reply-To: <20160801163630.GA3677@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: fix compilation for k2 machines
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
X-List-Received-Date: Mon, 01 Aug 2016 16:38:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, August 01, 2016 12:37 PM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: fix
> compilation for k2 machines
>=20
> On Mon, Aug 01, 2016 at 12:30:37PM -0400, Jacob Stiffler wrote:
> > * Previously, the SRCREV was set to a commit compatible with only
> >   dra7xx and overridden to a generic commit for select machines.
> > * Now set SRCREV to the generic commit, and override for dra7xx.
>=20
> omap-a15?
>=20
> Should we keep distinguishing OMAP5 from DRA7?

Sorry, this was an oversight. I'll resubmit with omap-a15.

>=20
>=20
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  .../gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend              | 7=
 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta-arago-extras/recipes-
> multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend b/meta-
> arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> bad_1.6.3.bbappend
> > index bb69168..44a1b8a 100644
> > --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-bad_1.6.3.bbappend
> > +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-bad_1.6.3.bbappend
> > @@ -35,8 +35,7 @@ SRC_URI =3D "git://git.ti.com/glsdk/gstreamer1-0-
> plugins-bad.git;protocol=3Dgit;bran
> >
> >  S =3D "${WORKDIR}/git"
> >
> > -SRCREV =3D "f0694b5fcec997036ef7df4d382b28e833c8ebfd"
> > -SRCREV_ti43x =3D "d0160ca810be30bf2b2e7681f5047933402efb52"
> > -SRCREV_ti33x =3D "d0160ca810be30bf2b2e7681f5047933402efb52"
> > +SRCREV_dra7xx =3D "f0694b5fcec997036ef7df4d382b28e833c8ebfd"
> > +SRCREV =3D "d0160ca810be30bf2b2e7681f5047933402efb52"
> >
> > -PR =3D "r20"
> > +PR =3D "r21"
> > --
> > 2.7.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

