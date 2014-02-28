Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B5C4D52986
	for <meta-arago@arago-project.org>;
	Fri, 28 Feb 2014 18:17:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1SIHcZP027264
	for <meta-arago@arago-project.org>; Fri, 28 Feb 2014 12:17:38 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1SIHcIM004235
	for <meta-arago@arago-project.org>; Fri, 28 Feb 2014 12:17:38 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 28 Feb 2014 12:17:38 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1SIHc57009995;
	Fri, 28 Feb 2014 12:17:38 -0600
Date: Fri, 28 Feb 2014 13:17:37 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20140228181737.GQ22125@edge>
References: <1392229564-8938-1-git-send-email-sam.nelson@ti.com>
	<20140212183828.GL4346@edge>
	<4F9216F96E5DF9428610502835A9F49057F461DE@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F49057F461DE@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v3] linuxptp: Add recipe for linux ptp
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
X-List-Received-Date: Fri, 28 Feb 2014 18:17:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Feb 28, 2014 at 06:51:41AM -0500, Nelson, Sam wrote:
> Considering removing dependency of Kernel see my following comments inline.
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Wednesday, February 12, 2014 1:38 PM
> > To: Nelson, Sam
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH v3] linuxptp: Add recipe for linux ptp
> > 
> > On Wed, Feb 12, 2014 at 01:26:04PM -0500, Sam Nelson wrote:
> > > - linuxptp is an implementation of precision time protocol (PTP)
> > >
> > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > 
> > Ack, will push soon.
> > 
> > > ---
> > > Change from previous patch
> > > * Moved to recipes-connectivity directory
> > > * Updated to use tarball from release
> > > * Rename recipe to 1.3 version
> > > * Added SRC_URI checksum
> > > ---
> > > ---
> > >  .../recipes-connectivity/linuxptp/linuxptp_1.3.bb  |   22
> > ++++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > >  create mode 100755 meta-arago-extras/recipes-
> > connectivity/linuxptp/linuxptp_1.3.bb
> > >
> > > diff --git a/meta-arago-extras/recipes-
> > connectivity/linuxptp/linuxptp_1.3.bb b/meta-arago-extras/recipes-
> > connectivity/linuxptp/linuxptp_1.3.bb
> > > new file mode 100755
> > > index 0000000..33ddb06
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb
> > > @@ -0,0 +1,22 @@
> > > +DESCRIPTION = "This software is an implementation of the Precision Time
> > Protocol (PTP) \
> > > +according to IEEE standard 1588 for Linux"
> > > +HOMEPAGE = "http://linuxptp.sourceforge.net/"
> > > +SECTION = "console/network"
> > > +LICENSE = "GPLv2"
> > > +LIC_FILES_CHKSUM =
> > "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> > > +DEPENDS += "virtual/kernel"
> [Sam] I am assuming this can be removed? Do I setup dependency on libc-linux 
> headers? How can I do that.

Yes, drop the DEPENDS completely.
Dependency on linux-libc-headers is implicit, as those are part of the system 
headers. Similar to eglibc, gcc and everything else you need for compiling the 
code - all those dependencies are taken care of automatically.


> > > +PR = "r0"
> > > +
> > > +SRC_URI =
> > "http://iweb.dl.sourceforge.net/project/linuxptp/v${PV}/linuxptp-${PV}.tgz"
> > > +SRC_URI[md5sum] = "664706a86fe1413391d4536080548501"
> > > +SRC_URI[sha256sum] =
> > "b1651186689ef06e56add506bd9bb55a700ca56e3f92ba71d08f3ad12fad30
> > 85"
> > > +
> > > +inherit autotools
> > > +
> > > +EXTRA_OEMAKE = "KBUILD_OUTPUT=${STAGING_KERNEL_DIR}

> [Sam] How can I remove this dependency and point to the libc-linux-headers? 
> Especially the linux kernel root directory is used here. ( Can I use 
> STAGING_DIR_TARGET? ). Appreciate your comments.

Ok, so I ended up looking into their Makefile and what they try to do there 
with KBUILD_OUTPUT... Besides few errors in their script, what they try to do 
is to check couple header files for availability of specific features and at 
the end pass corresponding defines to their source code. When crosscompiling, 
your target kernel is different from host kernel, hence they try to locate the 
correct /usr/include/linux/net_tstamp.h just to see if it contains definition 
for HWTSTAMP_TX_ONESTEP_SYNC. But that header file hasn't changed in at least 
5 years... They also check time.h to have clock_adjtime.
Anyway, it should be possible to short-cut those checks, but at the end they 
need to define these: -D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME -DHAVE_ONESTEP_SYNC
We can pass those to EXTRA_CFLAGS directly:

EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} ARCH=${TARGET_ARCH} \
		EXTRA_CFLAGS=\"-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME \
		-DHAVE_ONESTEP_SYNC\""


> > CROSS_COMPILE=${TARGET_PREFIX} ARCH=${TARGET_ARCH}"
> > > +
> > > +do_install() {
> > > +	install -d ${D}${bindir}/
> > > +	install -c -m 755 ${S}/ptp4l ${D}${bindir}/
> > > +}
> > > +
> > > --
> > > 1.7.9.5
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

