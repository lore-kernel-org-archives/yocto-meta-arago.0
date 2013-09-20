Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6DD06529DF
	for <meta-arago@arago-project.org>;
	Fri, 20 Sep 2013 20:53:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8KKrB8A024774;
	Fri, 20 Sep 2013 15:53:11 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8KKrBg6010633;
	Fri, 20 Sep 2013 15:53:11 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 20 Sep 2013 15:53:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8KKrBbq001314;
	Fri, 20 Sep 2013 15:53:11 -0500
Date: Fri, 20 Sep 2013 16:53:11 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130920205310.GE30673@edge>
References: <1379703595-1330-1-git-send-email-denis@denix.org>
	<20EC9FB1-3555-4CE0-9D7A-A45365A6A555@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C558340@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C558340@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] sourceipk: do not dereference symlinks when packaging data to avoid breakage
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
X-List-Received-Date: Fri, 20 Sep 2013 20:53:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Sep 20, 2013 at 08:49:00PM +0000, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Maupin, Chase
> > Sent: Friday, September 20, 2013 3:31 PM
> > To: Denys Dmytriyenko
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH] sourceipk: do not dereference symlinks
> > when packaging data to avoid breakage
> > 
> > Will this still package things like the patches applied on top of the kernel in the
> > kernel sources?
> 
> [Franklin] Good call. Your right it doesn't. I gave it a shot and the 
> symbolic link remains but of course the link is broken if it is used on a 
> different machine.

Yeah, I had the same question originally. Unfortunately, you cannot assume 
there are no broken links in the sources to begin with. And those broken 
symlinks cannot be dereferenced w/o breaking the entire tar command and hence 
the build. That is what we discussed couple days ago - kernel now has a broken 
symlink that kills our sourceipk...

Why do patches symlinked and not copied? Can we fix that step instead of doing 
it in tar command?

-- 
Denys


> > On Sep 20, 2013, at 2:00 PM, "Denys Dmytriyenko" <denis@denix.org> wrote:
> > 
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > > meta-arago-distro/classes/sourceipk.bbclass | 2 +-
> > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-
> > distro/classes/sourceipk.bbclass
> > > index 1ea0577..777cb4f 100644
> > > --- a/meta-arago-distro/classes/sourceipk.bbclass
> > > +++ b/meta-arago-distro/classes/sourceipk.bbclass
> > > @@ -167,7 +167,7 @@ sourceipk_do_create_srcipk() {
> > >         fi
> > >
> > >         #Write the data tarball
> > > -        tar -C $tmp_dir --owner=0 --group=0 -chzf $srcipk_dir/data.tar.gz .
> > > +        tar -C $tmp_dir --owner=0 --group=0 -czf $srcipk_dir/data.tar.gz .
> > >
> > >         # Create the debian-binary file
> > >         echo "2.0" > $srcipk_dir/debian-binary
> > > --
> > > 1.8.3.2
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

