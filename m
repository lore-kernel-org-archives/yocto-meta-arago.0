Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E8E30529ED
	for <meta-arago@arago-project.org>;
	Thu, 27 Feb 2014 17:59:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1RHxES6011843
	for <meta-arago@arago-project.org>; Thu, 27 Feb 2014 11:59:14 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1RHxE2K006480
	for <meta-arago@arago-project.org>; Thu, 27 Feb 2014 11:59:14 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 27 Feb 2014 11:59:13 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1RHxD2P026195;
	Thu, 27 Feb 2014 11:59:13 -0600
Date: Thu, 27 Feb 2014 12:59:13 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20140227175913.GC22125@edge>
References: <1392230029-12829-1-git-send-email-sam.nelson@ti.com>
	<20140212193813.GO4346@edge>
	<4F9216F96E5DF9428610502835A9F49054A02CA3@DLEE11.ent.ti.com>
	<20140214190206.GH7138@edge>
	<4F9216F96E5DF9428610502835A9F49057F45DB4@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F49057F45DB4@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2] openntpd: Add recipe for building OpenNTPD
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
X-List-Received-Date: Thu, 27 Feb 2014 17:59:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 27, 2014 at 10:49:22AM -0500, Nelson, Sam wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Friday, February 14, 2014 2:02 PM
> > To: Nelson, Sam
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH v2] openntpd: Add recipe for building
> > OpenNTPD
> > 
> > On Fri, Feb 14, 2014 at 10:27:13AM -0500, Nelson, Sam wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Nelson, Sam
> > > > Sent: Wednesday, February 12, 2014 11:03 PM
> > > > To: Dmytriyenko, Denys
> > > > Cc: meta-arago@arago-project.org
> > > > Subject: RE: [meta-arago] [PATCH v2] openntpd: Add recipe for building
> > > > OpenNTPD
> > > >
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Dmytriyenko, Denys
> > > > > Sent: Wednesday, February 12, 2014 2:38 PM
> > > > > To: Nelson, Sam
> > > > > Cc: meta-arago@arago-project.org
> > > > > Subject: Re: [meta-arago] [PATCH v2] openntpd: Add recipe for building
> > > > > OpenNTPD
> > > > >
> > > > > On Wed, Feb 12, 2014 at 01:33:49PM -0500, Sam Nelson wrote:
> > > > > > - OpenNTPD is a open source implementation of Network time
> > protocol
> > > > > >
> > > > > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > > > >
> > > > > > ---
> > > > > > Changes from previous patch
> > > > > > * Moved to recipes-connectivity
> > > > > > * Removed redundant setting of STAGING_KERNEL_DIR
> > > > > > ---
> > > > > > ---
> > > > > >  .../openntpd/openntpd_3.9p1.bb                     |   26
> > > > ++++++++++++++++++++
> > > > > >  1 file changed, 26 insertions(+)
> > > > > >  create mode 100755 meta-arago-extras/recipes-
> > > > > connectivity/openntpd/openntpd_3.9p1.bb
> > > > > >
> > > > > > diff --git a/meta-arago-extras/recipes-
> > > > > connectivity/openntpd/openntpd_3.9p1.bb b/meta-arago-
> > extras/recipes-
> > > > > connectivity/openntpd/openntpd_3.9p1.bb
> > > > > > new file mode 100755
> > > > > > index 0000000..ca090e4
> > > > > > --- /dev/null
> > > > > > +++ b/meta-arago-extras/recipes-
> > > > > connectivity/openntpd/openntpd_3.9p1.bb
> > > > > > @@ -0,0 +1,26 @@
> > > > > > +DESCRIPTION = "OpenNTPD is a FREE, easy to use implementation of
> > > > the \
> > > > > > +Network Time Protocol."
> > > > > > +HOMEPAGE = "http://www.openntpd.org/"
> > > > > > +SECTION = "console/network"
> > > > > > +LICENSE = "BSD ISC"
> > > > > > +LIC_FILES_CHKSUM =
> > > > > "file://LICENCE;md5=4b4f5158007cc97e6b0e2325bb99854a"
> > > > > > +
> > > > > > +DEPENDS += "virtual/kernel"
> > > > > > +PR = "r0"
> > > > > > +
> > > > > > +SRC_URI =
> > > > > "http://mirror.ece.vt.edu/pub/OpenBSD/OpenNTPD/${P}.tar.gz"
> > > > > > +
> > > > > > +S = "${WORKDIR}/openntpd-${PV}"
> > > > > > +EXTRA_OECONF = "--disable-strip"
> > > > > > +inherit autotools
> > > > > > +
> > > > > > +LDFLAGS += "-lrt"
> > > > > > +CFLAGS += "-DTI_ADD_SUPPORT_HW_TIMESTAMPING"
> > > > > > +CPPFLAGS = "-I${STAGING_KERNEL_DIR}/include"
> > > > > > +CPPFLAGS += "-I${STAGING_KERNEL_DIR}/arch/arm/include"
> > > > >
> > > > > Sam, I keep seeing you passing staged kernel location to user-space
> > apps
> > > > and
> > > > > daemons and I'm growing suspicious that it's not really needed... Both
> > > > > openntpd and linuxptp should be buildable as is w/o needing to have
> > > > access
> > > > > to
> > > > > the staged kernel. Unless I'm missing something and they do use kernel
> > > > > headers
> > > > > directly (not libc provided) and you have those headers modified for
> > your
> > > > > platform... Can you please elaborate here? Thanks.
> > > > >
> > > > [Sam]  I checked on openntp and looks like the kernel reference may be
> > > > unnecessary.  This recipe came from tci6614 and I will check on more
> > details.
> > > > But linuxptp does depend on kernel headers.
> > 
> > > [Sam] I was wrong, the openntp looks like does depend on H/W
> > timestamping
> > > defines from the kernel header based on local expert here. So recipe
> > should
> > > be pushed as is.
> > 
> > Can you please be more specific - what defines and in which files?
> > 
> > The reason I'm asking is that you use both of those user-space networking
> > daemons directly from upstream w/o modifications. So, even if they do
> > include
> > kernel header files and require some specific defines, they work with a well
> > defined user-space API that should exist on any other regular Linux system.
> > And that means the headers should come from linux-libc-headers, not
> > directly
> > from the kernel.
> > 
> [Sam] Thanks. Looks like the dependency is on net_tstamp.h for openntp. 
> Looks like linux-libc-headers-dev has the file already.  I can remove it.

Good, then it means nothing special needs to be done and no need to pass 
staged kernel location. Please also check linuxptp recipe. Thanks.


> > > > > > +EXTRA_OECONF += "CPPFLAGS="${CPPFLAGS}"
> > LDFLAGS="${LDFLAGS}"
> > > > > CFLAGS="${CFLAGS}" \
> > > > > > +                 --with-privsep-user=root --with-privsep-path=/${prefix}"
> > > > > > +
> > > > > > +SRC_URI[md5sum] = "afc34175f38d08867c1403d9008600b3"
> > > > > > +SRC_URI[sha256sum] =
> > > > >
> > > >
> > "83dd7c1e8ec8b4567afe49af539271b5a73562fb7a3ca51df73eccba89ec8c49
> > > > > "
> > > > > > --
> > > > > > 1.7.9.5
> > > > > >
> > > > > > _______________________________________________
> > > > > > meta-arago mailing list
> > > > > > meta-arago@arago-project.org
> > > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

