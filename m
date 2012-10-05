Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 9545652AB6
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 17:22:18 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MBF00EXOK95YXO1@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 05 Oct 2012 12:22:18 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8A2262038D; Fri,
	05 Oct 2012 13:22:17 -0400 (EDT)
Date: Fri, 05 Oct 2012 13:22:17 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20121005172217.GI23366@denix.org>
References: <1349419808-21687-1-git-send-email-fcooper@ti.com>
	<20121005165800.GA31500@edge>
	<A0CC959A-B26A-43D1-BE47-61EBB6E7A6DD@ti.com>
MIME-version: 1.0
In-reply-to: <A0CC959A-B26A-43D1-BE47-61EBB6E7A6DD@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] iperf: Update to version 2.0.5
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
X-List-Received-Date: Fri, 05 Oct 2012 17:22:18 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 05, 2012 at 05:20:09PM +0000, Cooper Jr., Franklin wrote:
> Original recipe didn't use the patches from 2.0.4 I didn't check if it didn't apply or not. 

Huh?
http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb


> On Oct 5, 2012, at 11:59 AM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
> 
> > On Fri, Oct 05, 2012 at 01:50:08AM -0500, Franklin S. Cooper Jr wrote:
> >> * Upgrading to newer version of iperf.
> >> * Newer versions of iperf reduced CPU load thus increasing performance in
> >>  wl12xx tests.
> > 
> > And one more question - sorry for separate emails.
> > 
> > 
> >> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> >> ---
> >> .../recipes-benchmark/iperf/iperf_2.0.5.bb         |   34 ++++++++++++++++++++
> >> 1 files changed, 34 insertions(+), 0 deletions(-)
> >> create mode 100644 meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
> >> 
> >> diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb b/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
> >> new file mode 100644
> >> index 0000000..aff06b2
> >> --- /dev/null
> >> +++ b/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
> >> @@ -0,0 +1,34 @@
> >> +DESCRIPTION = "Iperf is a tool to measure maximum TCP bandwidth, allowing the tuning of various parameters and UDP characteristics"
> >> +HOMEPAGE = "http://dast.nlanr.net/Projects/Iperf/"
> >> +SECTION = "console/network"
> >> +LICENSE = "NewBSD"
> >> +LIC_FILES_CHKSUM = "file://COPYING;md5=e8478eae9f479e39bc34975193360298"
> >> +
> >> +SRC_URI = " ${SOURCEFORGE_MIRROR}/iperf/iperf-${PV}.tar.gz"
> > 
> > You dropped all the other patches that were part of 2.0.4 - did you verify 
> > they are already there in 2.0.5 tree or they no longer needed?
> > 
> > -- 
> > Denys
> > 
> > 
> >> +
> >> +SRC_URI[md5sum] = "44b5536b67719f4250faed632a3cd016"
> >> +SRC_URI[sha256sum] = "636b4eff0431cea80667ea85a67ce4c68698760a9837e1e9d13096d20362265b"
> >> +
> >> +PR = "r0"
> >> +
> >> +inherit autotools
> >> +
> >> +S="${WORKDIR}/iperf-${PV}"
> >> +
> >> +EXTRA_OECONF = "--exec-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
> >> +
> >> +do_configure() {
> >> +    export ac_cv_func_malloc_0_nonnull=yes
> >> +    gnu-configize
> >> +    oe_runconf
> >> +}
> >> +
> >> +do_compile() {
> >> +    cd ${WORKDIR}/iperf-${PV}
> >> +    oe_runmake
> >> +}
> >> +
> >> +do_install() {
> >> +    cd ${WORKDIR}/iperf-${PV}/src
> >> +    oe_runmake DESTDIR=${D} install
> >> +}
> >> -- 
> >> 1.7.0.4
> >> 
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

