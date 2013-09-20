Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 40BAF52A88
	for <meta-arago@arago-project.org>;
	Fri, 20 Sep 2013 19:31:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8KJVgwl006553;
	Fri, 20 Sep 2013 14:31:42 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8KJVg7Z004898;
	Fri, 20 Sep 2013 14:31:42 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 20 Sep 2013 14:31:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8KJVgIA028943;
	Fri, 20 Sep 2013 14:31:42 -0500
Date: Fri, 20 Sep 2013 15:31:41 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130920193141.GC30673@edge>
References: <1379703595-1330-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C558148@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C558148@DFLE08.ent.ti.com>
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
X-List-Received-Date: Fri, 20 Sep 2013 19:31:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Sep 20, 2013 at 07:28:22PM +0000, Cooper Jr., Franklin wrote:
> Tested and it worked for me. 

Thanks! Tested-by: line would have been nice though :)


> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > Sent: Friday, September 20, 2013 2:00 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH] sourceipk: do not dereference symlinks when
> > packaging data to avoid breakage
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta-arago-distro/classes/sourceipk.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-
> > distro/classes/sourceipk.bbclass
> > index 1ea0577..777cb4f 100644
> > --- a/meta-arago-distro/classes/sourceipk.bbclass
> > +++ b/meta-arago-distro/classes/sourceipk.bbclass
> > @@ -167,7 +167,7 @@ sourceipk_do_create_srcipk() {
> >          fi
> > 
> >          #Write the data tarball
> > -        tar -C $tmp_dir --owner=0 --group=0 -chzf $srcipk_dir/data.tar.gz .
> > +        tar -C $tmp_dir --owner=0 --group=0 -czf $srcipk_dir/data.tar.gz .
> > 
> >          # Create the debian-binary file
> >          echo "2.0" > $srcipk_dir/debian-binary
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

