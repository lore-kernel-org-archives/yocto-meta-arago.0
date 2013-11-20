Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id EA2F252A6A
	for <meta-arago@arago-project.org>;
	Wed, 20 Nov 2013 15:24:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAKFOoEW025075
	for <meta-arago@arago-project.org>; Wed, 20 Nov 2013 09:24:50 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAKFOo6g016224
	for <meta-arago@arago-project.org>; Wed, 20 Nov 2013 09:24:50 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 20 Nov 2013 09:24:49 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAKFOn80016547;
	Wed, 20 Nov 2013 09:24:49 -0600
Date: Wed, 20 Nov 2013 10:24:49 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20131120152449.GC29952@edge>
References: <1383800614-31915-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED1015983FDC3@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015983FDC3@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Wed, 20 Nov 2013 15:24:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 20, 2013 at 01:11:18PM +0000, Maupin, Chase wrote:
> Sam,
> 
> Were you going to post an updated set of these patches to meta-ti so you can 
> align with Mrinmayee? I think your approach of splitting out the packages in 
> linux-utils is a good one and will be cleaner going forward.  Since both of 
> your groups share these packages aligning between the two would be helpful.
> 
> As a side note I assume you have other recipes that depend on the cmem 
> libraries that your cmem recipe provides.  Can you post one of those or 
> share it with Mrinmayee as an example of how you are able to point to the 
> right staging location for the libraries and headers for cmem in other 
> recipes.  I'm hoping we can start getting rid of ti-paths.inc but I'd like 
> to see how you were working around this.
> 
> Denys,
> 
> Since ti-linuxutils has other modules in it for edma, sdma, and irq but 
> those are only for legacy devices can we just replace the whole 
> ti-linuxutils with the cmem package which seems to be the main package 
> needed?  Or do you want to see additional recipes for the sdma, edma, and 
> irq moduled?

I'd like to see other parts of linuxutils modularized, but that can be done on 
as needed basis for any of the new platforms when they require those. We can 
keep the old linuxutils around for a little longer, but it can only be used on 
the old 35x and 37x plaftorms only and there are many other components (like 
SGX) removing support for those old platforms already...

-- 
Denys


> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Nelson, Sam
> >Sent: Wednesday, November 06, 2013 11:04 PM
> >To: meta-arago@arago-project.org; Nelson, Sam
> >Subject: [meta-arago] [PATCH v2] cmem: Adding New recipe for cmem
> >
> >- Cmem module is used for user space contiguous memory alloation
> >
> >Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> >---
> > recipes-bsp/cmem/cmem-mod_git.bb |   26
> >++++++++++++++++++++++++++
> > recipes-bsp/cmem/cmem.inc        |   12 ++++++++++++
> > recipes-bsp/cmem/cmem_git.bb     |   16 ++++++++++++++++
> > 3 files changed, 54 insertions(+)
> > create mode 100644 recipes-bsp/cmem/cmem-mod_git.bb
> > create mode 100644 recipes-bsp/cmem/cmem.inc
> > create mode 100644 recipes-bsp/cmem/cmem_git.bb
> >
> >diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-
> >bsp/cmem/cmem-mod_git.bb
> >new file mode 100644
> >index 0000000..c402b72
> >--- /dev/null
> >+++ b/recipes-bsp/cmem/cmem-mod_git.bb
> >@@ -0,0 +1,26 @@
> >+DESCRIPTION="Contiguous memory allocation kernel module for
> >contiguous memory allocation from userspace "
> >+
> >+include cmem.inc
> >+
> >+NAME="cmem"
> >+
> >+# This package builds a kernel module, use kernel PR as base and
> >append a local
> >+PR = "${MACHINE_KERNEL_PR}"
> >+PR_append = "a"
> >+
> >+PKG_${PN} = "kernel-module-${PN}"
> >+
> >+S = "${WORKDIR}/git"
> >+
> >+inherit module
> >+
> >+do_compile () {
> >+    cd ${S}
> >+    make -f lu.mak module_clean
> >+    make -f lu.mak module
> >KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR}
> >TOOLCHAIN_PREFIX=${CROSS_COMPILE}
> >+}
> >+
> >+do_install () {
> >+    cd ${S}
> >+    make -f lu.mak module_install
> >KERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}"
> >EXEC_DIR="${D}/lib/modules/${KERNEL_VERSION}/extra"
> >INSTALL_MOD_PATH="${D}"
> >+}
> >diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
> >new file mode 100644
> >index 0000000..5d17d8e
> >--- /dev/null
> >+++ b/recipes-bsp/cmem/cmem.inc
> >@@ -0,0 +1,12 @@
> >+HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:CMEM"
> >+
> >+LICENSE = "GPLv2"
> >+LIC_FILES_CHKSUM =
> >"file://include/ti/cmem.h;beginline=1;endline=30;md5=b86138d4028fb
> >8310b3b983024edc620"
> >+
> >+COMPATIBLE_MACHINE = "keystone-evm"
> >+
> >+BRANCH ?= "master"
> >+#SRCREV = "4.00.00.06"
> >+SRCREV = "c2cf2406702bcb889c10d0e6e7d298ba7b84ae7d"
> >+
> >+SRC_URI =
> >"git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
> >diff --git a/recipes-bsp/cmem/cmem_git.bb b/recipes-
> >bsp/cmem/cmem_git.bb
> >new file mode 100644
> >index 0000000..f415630
> >--- /dev/null
> >+++ b/recipes-bsp/cmem/cmem_git.bb
> >@@ -0,0 +1,16 @@
> >+DESCRIPTION="The cmem component supports contiguous memory
> >allocation from userspace "
> >+
> >+include cmem.inc
> >+
> >+RDEPENDS_${PN} = "cmem-mod"
> >+
> >+S = "${WORKDIR}/git"
> >+
> >+PR = "r0"
> >+
> >+PACKAGES =+ "${PN}-test"
> >+
> >+FILES_${PN}-test = "${bindir}/*"
> >+
> >+inherit autotools
> >+
> >--
> >1.7.9.5
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

