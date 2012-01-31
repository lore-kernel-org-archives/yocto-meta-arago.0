Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id 6A2B9529F1
	for <meta-arago@arago-project.org>;
	Tue, 31 Jan 2012 21:46:49 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LYO00BMCN5GYZD5@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 31 Jan 2012 15:46:29 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3B8BE201C0; Tue,
	31 Jan 2012 16:46:27 -0500 (EST)
Date: Tue, 31 Jan 2012 16:46:27 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-id: <20120131214627.GG5169@denix.org>
References: <1328040232-28814-1-git-send-email-Chase.Maupin@ti.com>
	<20120131202558.GF5169@denix.org>
	<7D46E86EC0A8354091174257B2FED1010BFA3D5D@DLEE12.ent.ti.com>
MIME-version: 1.0
In-reply-to: <7D46E86EC0A8354091174257B2FED1010BFA3D5D@DLEE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] arm-benchmarks: port benchmarks from old arago
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
X-List-Received-Date: Tue, 31 Jan 2012 21:46:49 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jan 31, 2012 at 08:32:57PM +0000, Maupin, Chase wrote:
> 
> > -----Original Message-----
> > From: Denys Dmytriyenko [mailto:denis@denix.org]
> > Sent: Tuesday, January 31, 2012 2:26 PM
> > To: Maupin, Chase
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH] arm-benchmarks: port benchmarks
> > from old arago
> > 
> > On Tue, Jan 31, 2012 at 02:03:52PM -0600, Chase Maupin wrote:
> > > * Port the am-benchmarks from the original arago overlay to
> > >   meta-arago
> > > * Change the name to arm-benchmarks
> > > * Modify the recipe for oe-core changes
> > > * Updated the SRCREV to pickup licensing file
> > >
> > > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > > ---
> > >  .../arm-benchmarks/arm-benchmarks_1.3.bb           |   24
> > ++++++++++++++++++++
> > >  1 files changed, 24 insertions(+), 0 deletions(-)
> > >  create mode 100644 meta-arago-extras/recipes-core/arm-
> > benchmarks/arm-benchmarks_1.3.bb
> > 
> > There is a whole set of benchmarks in meta-oe/recipes-benchmark/,
> > so should we
> > use the same path instead of recipes-core?
> 
> I was intending recipes-core to be the recipes that the various SDKs will 
> share.  Maybe my view was too SDK centric, so I'm OK with changing this.  I 
> just didn't want to get to:
> 
> Recipes-benchmark/arm-benchmarks
> Recipes-settigns/am-sysinfo
> Recipes-matrix/matrix

The idea is to group recipes by functionality - i.e. benchmarks, connectivity, 
devtools, multimedia, graphics etc. There are, of course, core and support 
directories, which are more loosely defined :)

So, I'd first look at existing directories in other layers and see if there's 
good fit, if not then resort to core or support. Either way it should be easy 
to move later, if needed.

-- 
Denys


> Etc.  But since recipes-benchmark is already used somewhere else I'll make 
> this change and resubmit.
> 
> > 
> > --
> > Denys
> > 
> > > diff --git a/meta-arago-extras/recipes-core/arm-benchmarks/arm-
> > benchmarks_1.3.bb b/meta-arago-extras/recipes-core/arm-
> > benchmarks/arm-benchmarks_1.3.bb
> > > new file mode 100644
> > > index 0000000..71f5eb8
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-core/arm-benchmarks/arm-
> > benchmarks_1.3.bb
> > > @@ -0,0 +1,24 @@
> > > +DESCRIPTION = "ARM Benchmarks"
> > > +HOMEPAGE = "https://gforge.ti.com/gf/project/am_benchmarks/"
> > > +LICENSE = "BSD"
> > > +LIC_FILES_CHKSUM =
> > "file://COPYING;md5=7aefb5e1cffc7b6a3ef18b803f957922"
> > > +SECTION = "system"
> > > +
> > > +SRCREV = "76"
> > > +PR = "r0+svnr${SRCPV}"
> > > +
> > > +SRC_URI =
> > "svn://gforge.ti.com/svn/am_benchmarks/;module=trunk;proto=https;us
> > er=anonymous;pswd=''"
> > > +
> > > +S = "${WORKDIR}/trunk"
> > > +
> > > +do_compile() {
> > > +	export CROSS_COMPILE=${TARGET_PREFIX}
> > > +	export ARCH=${TUNE_PKGARCH}
> > > +	# build the release version
> > > +	make release
> > > +}
> > > +
> > > +do_install() {
> > > +	export ARCH=${TUNE_PKGARCH}
> > > +	make DESTDIR=${D} install
> > > +}
> > > --
> > > 1.7.0.4
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >
> 

