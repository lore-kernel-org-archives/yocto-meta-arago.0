Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 739215299C
	for <meta-arago@arago-project.org>;
	Wed, 30 Oct 2013 23:37:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9UNbtOH027806
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2013 18:37:55 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9UNbtIK027323
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2013 18:37:55 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 30 Oct 2013 18:37:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9UNbtka030304;
	Wed, 30 Oct 2013 18:37:55 -0500
Date: Wed, 30 Oct 2013 19:37:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20131030233754.GE24696@edge>
References: <1383160055-32615-1-git-send-email-sam.nelson@ti.com>
	<20131030192353.GA23669@edge>
	<4F9216F96E5DF9428610502835A9F49054980A88@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F49054980A88@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/1] ti-cmem: New recipes for ti-cmem
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
X-List-Received-Date: Wed, 30 Oct 2013 23:37:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 30, 2013 at 06:22:34PM -0400, Nelson, Sam wrote:
> Thanks Denys for the detailed feedback. See comments  inline.
> 
> First, thanks for the submission!
> 
> Second, please drop "ti-" prefix from the recipes - it's redundant. Plus, 
> everywhere else it is called just "cmem":

> [Sam] Ok. I will fix this.

Thanks! And if you need any support or backing for this change, please let me 
know - I had a past agreement on this topic with Bill and Jack...


> For the rest of the comments, please see inline. But mostly everything looks 
> fine, just a few minor questions/concerns.
> 
> On Wed, Oct 30, 2013 at 03:07:35PM -0400, Sam Nelson wrote:
> > - Recipes for ti-cmem which provides user space api for contigous memory allocaion
> > - ti-cmem_mod provides the kernel module
> > - ti-mem provides the user space library
> > 
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  .../recipes-bsp/ti-cmem/ti-cmem-mod.bb             |   40 ++++++++++++++++++++
> >  meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb   |   20 ++++++++++
> >  meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc  |   10 +++++
> >  3 files changed, 70 insertions(+)
> >  create mode 100755 meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem-mod.bb
> >  create mode 100644 meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb
> >  create mode 100644 meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc
> > 
> > diff --git a/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem-mod.bb b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem-mod.bb
> > new file mode 100755
> > index 0000000..0839c20
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem-mod.bb
> > @@ -0,0 +1,40 @@
> > +DESCRIPTION="The cmem component module for contiguous memory allocation from userspace "
> > +
> > +HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:CMEM"
> 
> You duplicate HOMEPAGE in all recipes and .inc file...
> 
> [Sam] I will fix this.
> 
> > +LICENSE = "GPLv2"
> 
> Can you move LICENSE field in the .inc file, since you already have 
> LIC_FILES_CHKSUM there...
> [Sam] Ok. I will fix this.
> 
> > +include ti-cmem.inc
> > +
> > +RDEPENDS_${PN} += "kernel (=${KERNEL_VERSION})"
> 
> Is it really tied to a specific kernel version? What if it's slightly 
> different, i.e. with a minor update? Would using ">=" be better here?

> [Sam] I am not clear on this. I thought the kernel module is compiled for 
> the particular version of kernel and may not work with a different version 
> of kernel.  Appreciate any explanation on this.

Ah, if that's the only reason, then you don't need to do anything - 
module.bbclass will do it for you.


> > +DEPENDS += "virtual/kernel"
> 
> module.bbclass already does it for you.
> [Sam] I guess I will remove this?

Yes, please.


> > +NAME="cmem"
> > +MODULE_BUILD_DIR ="src/cmem/module"
> > +
> > +# This package builds a kernel module, use kernel PR as base and append a local
> > +PR = "${MACHINE_KERNEL_PR}"
> > +PR_append = "a"
> > +
> > +PKG_${PN} = "kernel-module-${PN}"
> > +
> > +KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
> 
> This one is also defined by module.bbclass
> [Sam] I will remove this as well.
> 
> > +S = "${WORKDIR}/git"
> > +
> > +inherit module
> > +
> > +do_compile () {
> > +    cd ${S}
> > +    make -f lu.mak module_clean
> > +    make -f lu.mak module KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} TOOLCHAIN_PREFIX=${CROSS_COMPILE} 
> > +}
> > +
> > +do_install () {
> > +    cd ${S}
> > +    make -f lu.mak module_install KERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" EXEC_DIR="${D}/lib/modules/${KERNEL_VERSION}/extra" INSTALL_MOD_PATH="${D}"
> > +}
> > +
> > +PACKAGE_STRIP = "no"
> 
> Why this?
> 
> [Sam] Not sure may be there was some issue earlier. Looks like I can remove 
> this.
> 
> > diff --git a/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb
> > new file mode 100644
> > index 0000000..a106aa0
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb
> > @@ -0,0 +1,20 @@
> > +DESCRIPTION="The cmem component supports contiguous memory allocation from userspace "
> > +
> > +HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:CMEM"
> > +
> > +LICENSE = "GPLv2"
> > +
> > +include ti-cmem.inc
> > +
> > +DEPENDS = "ti-cmem-mod" 
> 
> Do you mean RDEPENDS here? I don't think you have a build-time dependency 
> here...
> [Sam] RDEPENDS makes sense. I will fix this.
> 
> 
> > +S = "${WORKDIR}/git"
> > +
> > +PR = "r1"
> > +
> > +PACKAGES =+ "${PN}-test"
> > +
> > +FILES_${PN}-test = "${bindir}/*"
> 
> So, all the binaries will go into cmem-test, what would remain in the main 
> cmem package?
> [Sam] Actually nothing remains in the cmem package itself. Is this an issue?

Not an issue, but then why not call the recipe cmem-test if that's its only 
purpose?


> > +inherit autotools
> > +
> > diff --git a/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc
> > new file mode 100644
> > index 0000000..9308b2d
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc
> > @@ -0,0 +1,10 @@
> > +HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:CMEM"
> > +
> > +LIC_FILES_CHKSUM = "file://products.mak;beginline=2;endline=30;md5=195feadf798bb4165bcb1a23ffd50dbb"
> 
> I haven't checked yet, but is the Makefile the only and proper place to define 
> licenses for the component?
> [Sam] It was used as the file was in the root directory. Do you prefer using 
> the API header file instead?

It doesn't need to be in the root directory, but it does need to specify the 
license that is being used.


> > +COMPATIBLE_MACHINE = "keystone-evm"
> > +
> > +BRANCH ?= "master"
> > +SRCREV = "4.00.00.06"
> 
> Any chance you can use a commit ID here?
> [Sam] I can switch to commit ID. 

Thanks. The reason for this request is to reduce the number of network 
connections required during parsing.


> > +SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
> > -- 
> > 1.7.9.5
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

