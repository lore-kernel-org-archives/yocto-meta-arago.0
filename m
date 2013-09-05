Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E5ED4529A2
	for <meta-arago@arago-project.org>;
	Thu,  5 Sep 2013 18:39:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r85IdABC025511
	for <meta-arago@arago-project.org>; Thu, 5 Sep 2013 13:39:10 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r85IdAAg025898
	for <meta-arago@arago-project.org>; Thu, 5 Sep 2013 13:39:10 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 5 Sep 2013 13:39:10 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 3/6 v3] board-port-labs-linux: Create new
	recipe using new sourceipk.bbclass feature
Thread-Index: AQHOqk0W9voP7nrLTEa5t7Ht8ULJppm3xfMA//+tvfA=
Date: Thu, 5 Sep 2013 18:39:09 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C547731@DFLE08.ent.ti.com>
References: <1378397315-14333-1-git-send-email-fcooper@ti.com>
	<20130905181140.GG27300@edge>
In-Reply-To: <20130905181140.GG27300@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/6 v3] board-port-labs-linux: Create new recipe using new sourceipk.bbclass feature
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
X-List-Received-Date: Thu, 05 Sep 2013 18:39:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, September 05, 2013 1:12 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 3/6 v3] board-port-labs-linux: Create ne=
w
> recipe using new sourceipk.bbclass feature
>=20
> On Thu, Sep 05, 2013 at 11:08:34AM -0500, Franklin S. Cooper Jr wrote:
> > * Do to the inability to keep the git repository intact the board port =
labs
> >   recipe manually ran git clone which took a long time every time the r=
ecipe
> was
> >   built.
> > * Using the new SRCIPK_PRESERVED_GIT feature in sourceipk.bbclass the
> recipes can
> >   now be treated like any other recipe and allow OE to handle the cloni=
ng and
> >   unpacking.
> > * This will significantly shorten the amount of time required to rebuil=
d this
> >   recipe.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> > Version 3 changes:
> > Use a specific commit instead of using AUTOREV
> >
> > Version 2 changes:
> > Split recipe into its own patch.
> > Also use the kernel's license.
> >
> >  .../board-port-labs/board-port-labs-linux_git.bb   |   35
> ++++++++++++++++++++
> >  1 files changed, 35 insertions(+), 0 deletions(-)  create mode 100644
> > meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-linux_
> > git.bb
> >
> > diff --git
> > a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-linu
> > x_git.bb
> > b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-linu
> > x_git.bb
> > new file mode 100644
> > index 0000000..4ed1adf
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-
> > +++ linux_git.bb
> > @@ -0,0 +1,35 @@
> > +DESCRIPTION =3D "Git repositories containing sample board port code"
> > +HOMEPAGE =3D "https://gitorious.org/sitara-board-port"
> > +
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> > +
> > +inherit allarch
> > +
> > +CREATE_SRCIPK =3D "1"
> > +SRCIPK_INSTALL_DIR =3D "board-support/board-port-labs/sitara-board-por=
t-
> linux"
> > +SRCIPK_PRESERVE_GIT =3D "true"
> > +
> > +PR =3D "r0"
> > +
> > +BRANCH =3D "master"
> > +SRC_URI =3D "git://gitorious.org/sitara-board-port/sitara-board-port-
> linux.git;protocol=3Dgit;branch=3D${BRANCH}"
> > +
> > +SRCREV =3D "30df33e7134ab507a339b89a864256cabfbddea1"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +adjust_git_prepend() {
> > +
> > +    # Checkout a specific branch instead of a commit that is used by d=
efault
> > +    git checkout ${BRANCH}
>=20
> So, you are still doing AUTOREV, even though you no longer explicitly nam=
e it
> that way... :)
[Franklin] Never thought of it that way. :)
>=20
> I was thinking if you agree to lock to a specific SRVREV, we don't need t=
hat
> whole adjust_git_prepend() part with branch checkout. Comments?
[Franklin]=20
The only reason I am doing this is so someone will know exactly what branch=
 they are on when looking at the git repo packaged by sourceipk.
Without that code if they did a git status they would see "Not currently on=
 any branch". By checking out the specific branch now they will see "# On b=
ranch master" which people tend to expect. So it's more a cosmetic change b=
ut does mimic how users see the board port git repositories in previous sdk=
s.
>=20
>=20
> > +}
> > +
> > +do_configure() {
> > +    :
> > +}
> > +
> > +do_compile() {
> > +    :
> > +}
> > +
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

