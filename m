Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A93F6529A2
	for <meta-arago@arago-project.org>;
	Thu,  5 Sep 2013 18:48:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r85Im9ua032550
	for <meta-arago@arago-project.org>; Thu, 5 Sep 2013 13:48:09 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r85Im9UZ004702
	for <meta-arago@arago-project.org>; Thu, 5 Sep 2013 13:48:09 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 5 Sep 2013 13:48:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r85Im9su010145;
	Thu, 5 Sep 2013 13:48:09 -0500
Date: Thu, 5 Sep 2013 14:48:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130905184808.GK27300@edge>
References: <1378397315-14333-1-git-send-email-fcooper@ti.com>
	<20130905181140.GG27300@edge>
	<8F29D6B095ED194EA1980491A5E029710C547731@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C547731@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Thu, 05 Sep 2013 18:48:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 05, 2013 at 02:39:09PM -0400, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Thursday, September 05, 2013 1:12 PM
> > To: Cooper Jr., Franklin
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH 3/6 v3] board-port-labs-linux: Create new
> > recipe using new sourceipk.bbclass feature
> > 
> > On Thu, Sep 05, 2013 at 11:08:34AM -0500, Franklin S. Cooper Jr wrote:
> > > * Do to the inability to keep the git repository intact the board port labs
> > >   recipe manually ran git clone which took a long time every time the recipe
> > was
> > >   built.
> > > * Using the new SRCIPK_PRESERVED_GIT feature in sourceipk.bbclass the
> > recipes can
> > >   now be treated like any other recipe and allow OE to handle the cloning and
> > >   unpacking.
> > > * This will significantly shorten the amount of time required to rebuild this
> > >   recipe.
> > >
> > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > ---
> > > Version 3 changes:
> > > Use a specific commit instead of using AUTOREV
> > >
> > > Version 2 changes:
> > > Split recipe into its own patch.
> > > Also use the kernel's license.
> > >
> > >  .../board-port-labs/board-port-labs-linux_git.bb   |   35
> > ++++++++++++++++++++
> > >  1 files changed, 35 insertions(+), 0 deletions(-)  create mode 100644
> > > meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-linux_
> > > git.bb
> > >
> > > diff --git
> > > a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-linu
> > > x_git.bb
> > > b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-linu
> > > x_git.bb
> > > new file mode 100644
> > > index 0000000..4ed1adf
> > > --- /dev/null
> > > +++ b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-
> > > +++ linux_git.bb
> > > @@ -0,0 +1,35 @@
> > > +DESCRIPTION = "Git repositories containing sample board port code"
> > > +HOMEPAGE = "https://gitorious.org/sitara-board-port"
> > > +
> > > +LICENSE = "GPLv2"
> > > +LIC_FILES_CHKSUM =
> > "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> > > +
> > > +inherit allarch
> > > +
> > > +CREATE_SRCIPK = "1"
> > > +SRCIPK_INSTALL_DIR = "board-support/board-port-labs/sitara-board-port-
> > linux"
> > > +SRCIPK_PRESERVE_GIT = "true"
> > > +
> > > +PR = "r0"
> > > +
> > > +BRANCH = "master"
> > > +SRC_URI = "git://gitorious.org/sitara-board-port/sitara-board-port-
> > linux.git;protocol=git;branch=${BRANCH}"
> > > +
> > > +SRCREV = "30df33e7134ab507a339b89a864256cabfbddea1"
> > > +
> > > +S = "${WORKDIR}/git"
> > > +
> > > +adjust_git_prepend() {
> > > +
> > > +    # Checkout a specific branch instead of a commit that is used by default
> > > +    git checkout ${BRANCH}
> > 
> > So, you are still doing AUTOREV, even though you no longer explicitly name it
> > that way... :)
> [Franklin] Never thought of it that way. :)
> > 
> > I was thinking if you agree to lock to a specific SRVREV, we don't need that
> > whole adjust_git_prepend() part with branch checkout. Comments?
> [Franklin] 
> The only reason I am doing this is so someone will know exactly what branch 
> they are on when looking at the git repo packaged by sourceipk.
> Without that code if they did a git status they would see "Not currently on 
> any branch". By checking out the specific branch now they will see "# On 
> branch master" which people tend to expect. So it's more a cosmetic change 
> but does mimic how users see the board port git repositories in previous 
> sdks.

Ah, I see what you are saying. I think you are right - if we don't pull or 
fetch after a specific branch is checked out, then we should stay on the same 
commit... Ok, I'll take it.


> > 
> > 
> > > +}
> > > +
> > > +do_configure() {
> > > +    :
> > > +}
> > > +
> > > +do_compile() {
> > > +    :
> > > +}
> > > +
> > > --
> > > 1.7.0.4
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

