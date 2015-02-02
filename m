Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id AB9B8529AF
	for <meta-arago@arago-project.org>;
	Mon,  2 Feb 2015 21:09:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t12L9mug015986
	for <meta-arago@arago-project.org>; Mon, 2 Feb 2015 15:09:48 -0600
Received: from DFLE51.ent.ti.com (dfle51.ent.ti.com [10.64.6.12])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t12L9lXt023007
	for <meta-arago@arago-project.org>; Mon, 2 Feb 2015 15:09:47 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE51.ent.ti.com ([fe80::f88a:66e:ad57:ae4a%17]) with mapi id
	14.03.0224.002; Mon, 2 Feb 2015 15:09:47 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 4/6] sourceipk: Fix issue with git fetch
	when shallow clone is used
Thread-Index: AQHQPNyJUZL5GdsnskuAvwoTwBvOSJzeQoSA//+cvNA=
Date: Mon, 2 Feb 2015 21:09:46 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7F4477@DFLE08.ent.ti.com>
References: <1422657099-15544-1-git-send-email-fcooper@ti.com>
	<1422657099-15544-4-git-send-email-fcooper@ti.com>
	<20150202210427.GB6257@edge>
In-Reply-To: <20150202210427.GB6257@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 4/6] sourceipk: Fix issue with git fetch when shallow clone is used
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
X-List-Received-Date: Mon, 02 Feb 2015 21:09:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, February 02, 2015 3:04 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 4/6] sourceipk: Fix issue with git fetch
> when shallow clone is used
>=20
> On Fri, Jan 30, 2015 at 04:31:37PM -0600, Franklin S. Cooper Jr wrote:
> > From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> >
> > * When shallow clone is used for some reason running git fetch on the
> repository
> >   didn't end up making it completely whole (fetch all commits).
> > * Even worse the copied repository didn't have a proper way to referenc=
e
> or
> >   fetch remote branches or tags.
> > * For some reason deleting the origin and seeing it back to the correct
> value
> >   fixed these problems.
>=20
> That all sounds like some kind of voodoo... :) What version of git were y=
ou
> using?
>=20
[Franklin] 1.7.9.5 that's the version used with Ubuntu 12.04.

>=20
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  meta-arago-distro/classes/sourceipk.bbclass |    6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-
> distro/classes/sourceipk.bbclass
> > index 6b16657..6895378 100644
> > --- a/meta-arago-distro/classes/sourceipk.bbclass
> > +++ b/meta-arago-distro/classes/sourceipk.bbclass
> > @@ -157,7 +157,11 @@ adjust_git() {
> >
> >              cd -
> >
> > -            git remote set-url origin $remote_repo $local_repo
> > +            # Some crazy reason I need to add these two lines when doi=
ng a
> > +            # shallow copy. Otherwise, I had problems where git fetch =
wasn't
> > +            # properly fetching all the commits and extra remotes.
> > +            git remote rm origin
> > +            git remote add origin $remote_repo
> >
> >              # Repackage the repository so its a proper clone of the or=
iginal
> >              # (remote) git repository
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

