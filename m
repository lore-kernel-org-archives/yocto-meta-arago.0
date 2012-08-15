Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by arago-project.org (Postfix) with ESMTP id DF27852986
	for <meta-arago@arago-project.org>;
	Wed, 15 Aug 2012 19:30:57 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M8T0089MA6EC8J2@vms173005.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 15 Aug 2012 14:30:25 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 25DAB201AC; Wed,
	15 Aug 2012 15:30:13 -0400 (EDT)
Date: Wed, 15 Aug 2012 15:30:13 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20120815193013.GA7503@denix.org>
References: <1344873428-7710-1-git-send-email-fcooper@ti.com>
	<1344873428-7710-2-git-send-email-fcooper@ti.com>
	<20120814154647.GA1094@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C29F728@DFLE09.ent.ti.com>
MIME-version: 1.0
In-reply-to: <8F29D6B095ED194EA1980491A5E029710C29F728@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] matrix-gui-oprofile-demos: Update RDEPENDS
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
X-List-Received-Date: Wed, 15 Aug 2012 19:31:07 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Aug 14, 2012 at 09:11:27PM +0000, Cooper Jr., Franklin wrote:
> That makes sense. Will do so in the future. Thx

Thanks. The point is to ensure every commit is atomic and does not break the 
build - try to avoid having one patch break the build and another right after 
that to fix it. Patches should be split into functional entities, but it 
doesn't mean they always have to be one patch per recipe...

Denys


> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denis@denix.org] 
> Sent: Tuesday, August 14, 2012 10:47 AM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] matrix-gui-oprofile-demos: Update RDEPENDS
> 
> Franklin,
> 
> Just a nit-pick for the future - to not break bisectability, you should 
> normally do this in 2 commits:
> 
> 1. add oprofile-example recipe AND switch the RDEPENDS
> 2. remove the old reference from am-sysinfo
> 
> Denys
> 
> 
> On Mon, Aug 13, 2012 at 10:57:07AM -0500, Franklin S Cooper Jr wrote:
> > * Replace the RDEPENDS from am-sysinfo to oprofile-example.
> >   The application oprofile-example use to be located within
> >   am-sysinfo but now is located in its own repository.
> > 
> > Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> > ---
> >  .../matrix/matrix-gui-oprofile-demos_2.0.bb        |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb
> > index e8aad0b..d3246f9 100644
> > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb
> > @@ -4,7 +4,7 @@ LICENSE = "CC-BY-SA"
> >  
> >  require matrix-gui-apps-git.inc
> >  
> > -PR = "${INC_PR}.0"
> > +PR = "${INC_PR}.1"
> >  
> >  inherit allarch
> >  
> > @@ -13,6 +13,6 @@ S = "${WORKDIR}/git/oprofile_apps"
> >  # Make sure profiling submenu and app images  has been installed
> >  # Include am-sysinfo because that package has the sample
> >  # executables for profiling.
> > -RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-oprofile oprofile am-sysinfo"
> > +RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-oprofile oprofile oprofile-example"
> >  
> >  FILES_${PN} += "${MATRIX_BASE_DIR}/*"
> > -- 
> > 1.7.0.4
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > 
> 

