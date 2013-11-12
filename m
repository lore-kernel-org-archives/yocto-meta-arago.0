Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C204052986
	for <meta-arago@arago-project.org>;
	Tue, 12 Nov 2013 21:20:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rACLKf4N008420
	for <meta-arago@arago-project.org>; Tue, 12 Nov 2013 15:20:41 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rACLKfOq003767
	for <meta-arago@arago-project.org>; Tue, 12 Nov 2013 15:20:41 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 12 Nov 2013 15:20:41 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rACLKf3d022515;
	Tue, 12 Nov 2013 15:20:41 -0600
Date: Tue, 12 Nov 2013 16:20:40 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20131112212040.GA15473@edge>
References: <1383800614-31915-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED101597FEDD2@DLEE11.ent.ti.com>
	<4F9216F96E5DF9428610502835A9F49054988C24@DLEE11.ent.ti.com>
	<20131108015325.GV4510@edge>
	<4F9216F96E5DF9428610502835A9F4905498E688@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F4905498E688@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Ring,
	Chris" <cring@ti.com>
Subject: Re: [PATCH v2] cmem: Adding New recipe for cmem
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
X-List-Received-Date: Tue, 12 Nov 2013 21:20:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Nov 12, 2013 at 04:01:14PM -0500, Nelson, Sam wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Thursday, November 07, 2013 8:53 PM
> > To: Nelson, Sam
> > Cc: Maupin, Chase; meta-arago@arago-project.org; Ring, Chris; Tivy, Robert
> > Subject: Re: [meta-arago] [PATCH v2] cmem: Adding New recipe for cmem
> > 
> > On Thu, Nov 07, 2013 at 11:49:42AM +0000, Nelson, Sam wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Maupin, Chase
> > > > Sent: Thursday, November 07, 2013 2:35 AM
> > > > To: Nelson, Sam; meta-arago@arago-project.org
> > > > Subject: RE: [meta-arago] [PATCH v2] cmem: Adding New recipe for cmem
> > > >
> > > > >-----Original Message-----
> > > > >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > > >bounces@arago-project.org] On Behalf Of Nelson, Sam
> > > > >Sent: Thursday, November 07, 2013 10:34 AM
> > > > >To: meta-arago@arago-project.org; Nelson, Sam
> > > > >Subject: [meta-arago] [PATCH v2] cmem: Adding New recipe for cmem
> > > > >
> > > > >- Cmem module is used for user space contiguous memory alloation
> > > > >
> > > > >Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > > >---
> > > > > recipes-bsp/cmem/cmem-mod_git.bb |   26
> > > > >++++++++++++++++++++++++++
> > > > > recipes-bsp/cmem/cmem.inc        |   12 ++++++++++++
> > > > > recipes-bsp/cmem/cmem_git.bb     |   16 ++++++++++++++++
> > > > > 3 files changed, 54 insertions(+)
> > > > > create mode 100644 recipes-bsp/cmem/cmem-mod_git.bb
> > > > > create mode 100644 recipes-bsp/cmem/cmem.inc
> > > > > create mode 100644 recipes-bsp/cmem/cmem_git.bb
> > > >
> > > > This patch should be submitted to meta-ti@yoctoproject.org which is the
> > > > meta-ti mailing list.
> > > [Sam] Ok. I will do that.
> > > >
> > > > >
> > > > >diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-
> > > > >bsp/cmem/cmem-mod_git.bb
> > > > >new file mode 100644
> > > > >index 0000000..c402b72
> > > > >--- /dev/null
> > > > >+++ b/recipes-bsp/cmem/cmem-mod_git.bb
> > > > >@@ -0,0 +1,26 @@
> > > > >+DESCRIPTION="Contiguous memory allocation kernel module for
> > > > >contiguous memory allocation from userspace "
> > > > >+
> > > > >+include cmem.inc
> > > > >+
> > > > >+NAME="cmem"
> > > >
> > > > Not sure what the NAME variable is for
> > > [Sam] I am not sure either. This is probably because of initial template
> > > used for creation of the recipe. I can remove it if this really not needed.
> > 
> > This is not a variable used by bitbake, so assigning it and not using later is
> > rather redundant.
> > 
> > 
> > > > >+# This package builds a kernel module, use kernel PR as base and
> > > > >append a local
> > > > >+PR = "${MACHINE_KERNEL_PR}"
> > > > >+PR_append = "a"
> > > > >+
> > > > >+PKG_${PN} = "kernel-module-${PN}"
> > > >
> > > > I think what you are trying to do here is already handled by the
> > > > package.bbclass.  I assume you are trying to set the package name to
> > kernel-
> > > > module-cmem-mod?
> > > >
> > > > This raises the question of whether you want this to be cmem-mod for
> > the
> > > > recipe and PN or if you want cmem for the module and cmem-xyz for the
> > > > libraries.
> > > >
> > > [Sam] I guess the alternative you are suggesting is cmem for the module
> > and
> > > cmem-lib for the libraries. I am not seeing a compelling reason to change.
> > 
> > You can keep cmem-mod as the name of the recipe. And even if you keep it
> > as the name of the package (i.e. not set PKG_${PN} above), it will still work
> > just fine.
> > 
> > So, if your recipe is called cmem-mod, but PKG_${PN} = "kernel-module-
> > ${PN}"
> > then the resulting package will be called kernel-module-cmem-mod.ipk
> > 
> > If you don't set PKG_${PN}, then the package will be called cmem-mod.ipk,
> > but
> > there will be an empty package kernel-module-cmem-mod.ipk that
> > automatically
> > depend on cmem-mod.ipk :) At the end of the day, it will work just fine, as
> > long as you don't mess the FILES_${PN} variable...
> > 
> > 
> > > > >+S = "${WORKDIR}/git"
> > > > >+
> > > > >+inherit module
> > > > >+
> > > > >+do_compile () {
> > > > >+    cd ${S}
> > > > >+    make -f lu.mak module_clean
> > > > >+    make -f lu.mak module
> > > > >KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR}
> > > > >TOOLCHAIN_PREFIX=${CROSS_COMPILE}
> > > >
> > > > You should use the default do_compile in the module.bbclass I think.
> > You
> > > > should be able to pass this with MAKE_TARGETS variable.
> > >
> > > [Sam] Probably Chris and Rob on the CC list can comment on this. This will
> > > need change of the module.
> > 
> > Well, it is rather "nice to have" - I won't require this as a mandatory
> > change. After all, components may come from different environments and
> > it's
> > unrealistic to demand them to come with a comformant Makefile...
> > 
> > But, in case it would be possible and easy to change the Makefile, here's how
> > default do_compile and do_install functions look like for a module:
> > 
> > module_do_compile() {
> >         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> >         oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
> >                    KERNEL_SRC=${STAGING_KERNEL_DIR}    \
> >                    KERNEL_VERSION=${KERNEL_VERSION}    \
> >                    CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
> >                    AR="${KERNEL_AR}" \
> >                    ${MAKE_TARGETS}
> > }
> > 
> > module_do_install() {
> >         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> >         oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" \
> >                    KERNEL_SRC=${STAGING_KERNEL_DIR} \
> >                    CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
> >                    modules_install
> > }
> > 
> > You are only supposed to set MAKE_TARGETS variable, which in your case
> > would
> > be "module_clean module"...

> [Sam] we will add the unset FLAGS. Am I supposed to also rename do_install 
> to module_do_install, do_compile --> module_do_install. And also will add 
> module_do_clean? Please confirm. Currently we have to still use non-standard 
> makefile.

No, providing own do_install and do_compile should be fine for now, if you 
can't change module's Makefile.


> > > > >+}
> > > > >+
> > > > >+do_install () {
> > > > >+    cd ${S}
> > > > >+    make -f lu.mak module_install
> > > > >KERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}"
> > > > >EXEC_DIR="${D}/lib/modules/${KERNEL_VERSION}/extra"
> > > > >INSTALL_MOD_PATH="${D}"
> > > >
> > > > Hmmm.  The default do_install for the module.bbclass uses
> > > > "modules_install" instead of "module_install".  If you can get the lu.mak
> > file
> > > > updated that would be ideal.  If not then you should at least copy the
> > base
> > > > function which unsets some variables.
> > > >
> > > [Sam] Probably Chris and Rob on the CC list can comment on this. This will
> > > need change of the module.
> > 
> > Again, if changing the component is not really possible at this time, just
> > unset all those *FLAGS variables above.
> > 
> > 
> > > > >+}
> > > > >diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
> > > > >new file mode 100644
> > > > >index 0000000..5d17d8e
> > > > >--- /dev/null
> > > > >+++ b/recipes-bsp/cmem/cmem.inc
> > > > >@@ -0,0 +1,12 @@
> > > >
> > >+HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:CMEM"
> > > > >+
> > > > >+LICENSE = "GPLv2"
> > > > >+LIC_FILES_CHKSUM =
> > > > >"file://include/ti/cmem.h;beginline=1;endline=30;md5=b86138d4028fb
> > > > >8310b3b983024edc620"
> > > > >+
> > > > >+COMPATIBLE_MACHINE = "keystone-evm"
> > > >
> > > > As Sidd pointed out is there any reason not to add the other devices like
> > > > omap-a15 as compatible machines?
> > >
> > > [Sam] I am fine with remove the compatible machine. Although this is not
> > > tested with other machines.
> > 
> > So, Chris and Rob should comment on which platforms this version of cmem
> > is
> > supposed to be compatible with, even if it's not tested yet.
> > 
> > 
> > > > >+BRANCH ?= "master"
> > > > >+#SRCREV = "4.00.00.06"
> > > >
> > > > Remove this comment but add one that the commit id below corresponds
> > to
> > > > release 4.00.00.06.
> > > >
> > > [Sam] I will fix this.
> > > > Is there perhaps a value to having the version in the package name
> > instead of
> > > > using _git versions?  Will all SDKs be in step with using the same version?
> > > >
> > > [Sam] Chris or Rob, can you comment on this.  I am not sure of when the
> > > other verticals pick up CMEM.
> > >
> > > > >+SRCREV = "c2cf2406702bcb889c10d0e6e7d298ba7b84ae7d"
> > > > >+
> > > > >+SRC_URI =
> > > > >"git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
> > > > >diff --git a/recipes-bsp/cmem/cmem_git.bb b/recipes-
> > > > >bsp/cmem/cmem_git.bb
> > > > >new file mode 100644
> > > > >index 0000000..f415630
> > > > >--- /dev/null
> > > > >+++ b/recipes-bsp/cmem/cmem_git.bb
> > > > >@@ -0,0 +1,16 @@
> > > > >+DESCRIPTION="The cmem component supports contiguous memory
> > > > >allocation from userspace "
> > > > >+
> > > > >+include cmem.inc
> > > > >+
> > > > >+RDEPENDS_${PN} = "cmem-mod"
> > > > >+
> > > > >+S = "${WORKDIR}/git"
> > > > >+
> > > > >+PR = "r0"
> > > > >+
> > > > >+PACKAGES =+ "${PN}-test"
> > > > >+
> > > > >+FILES_${PN}-test = "${bindir}/*"
> > > >
> > > > As Denys pointed out last time, if everything goes into cmem-test then
> > why
> > > > not just call this whole recipe cmem-test since the base cmem package is
> > > > empty.
> > >
> > > [Sam] The cmem package has the library that goes into cmem-dev. And
> > hence
> > > the name cmem. cmem-test will have the example/unit test code binaries.
> > > Only thing is there is no binary files associated with the cmem package
> > > itself.
> > 
> > Right, we discussed some of this before and yesterday as well. It is not
> > obvious, but a correct use case nevertheless. So, let's keep the name.
> > 
> > But, now I have one question - you do mention a library that goes to cmem-
> > dev.
> > Is is a dynamic library? If so, it should rather go into the main package. I
> > suspect it lacks the correect extension and hence ends up in the -dev
> > package.
> > 
> > 
> > > > >+inherit autotools
> > > > >+
> > > > >--
> > > > >1.7.9.5
> > > > >
> > > > >_______________________________________________
> > > > >meta-arago mailing list
> > > > >meta-arago@arago-project.org
> > > > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

