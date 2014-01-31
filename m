Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id AB2575298F
	for <meta-arago@arago-project.org>;
	Fri, 31 Jan 2014 23:11:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0VNB4kT028448
	for <meta-arago@arago-project.org>; Fri, 31 Jan 2014 17:11:04 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0VNB44u004047
	for <meta-arago@arago-project.org>; Fri, 31 Jan 2014 17:11:04 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 31 Jan 2014 17:11:04 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0VNB34w002026;
	Fri, 31 Jan 2014 17:11:04 -0600
Date: Fri, 31 Jan 2014 18:11:03 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140131231103.GN6814@edge>
References: <1391198997-31679-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C617A57@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C617A57@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] base-files: pre-create /run symlink to point	to /var/run
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
X-List-Received-Date: Fri, 31 Jan 2014 23:11:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jan 31, 2014 at 10:44:49PM +0000, Cooper Jr., Franklin wrote:
> I like this approach a lot to fix the last mount.sh issue.

So, I take it as you are fine with all the related changes and I'll go ahead 
and push my 3 patches to move automount to /run/media along with one of yours.


> Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > Sent: Friday, January 31, 2014 2:10 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH] base-files: pre-create /run symlink to point to
> > /var/run
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Make it available on the first boot too, otherwise the first boot may fail to
> > automount SD card partitions. Normally, it gets created on the first boot by
> > volatiles init script and stays there on consecutive boots.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  .../recipes-core/base-files/base-files_3.0.14.bbappend        | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta-arago-distro/recipes-core/base-files/base-
> > files_3.0.14.bbappend b/meta-arago-distro/recipes-core/base-files/base-
> > files_3.0.14.bbappend
> > index c0ab069..4d831fd 100644
> > --- a/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
> > +++ b/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappe
> > +++ nd
> > @@ -1,4 +1,13 @@
> >  # look for files in this layer first
> >  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> > 
> > -PR_append = "-arago0"
> > +PR_append = "-arago1"
> > +
> > +# Pre-create /run symlink to point to /var/run at build time # This
> > +normally happens on first boot, but may be too late for automount, #
> > +which tries to create mount-points in /run # NOTE: This step is not
> > +required in Dora and up, due to reverse direction # of symlinking
> > +between /run and /var/run do_install_append () {
> > +	ln -sf /var/run ${D}/run
> > +}
> > --
> > 1.8.3.2
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

