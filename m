Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 2DD1452A31
	for <meta-arago@arago-project.org>;
	Tue, 10 Mar 2015 16:19:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2AGJt7R017080
	for <meta-arago@arago-project.org>; Tue, 10 Mar 2015 11:19:55 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2AGJstS019804
	for <meta-arago@arago-project.org>; Tue, 10 Mar 2015 11:19:54 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Mar 2015 11:19:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2AGJrcM022564;
	Tue, 10 Mar 2015 11:19:53 -0500
Date: Tue, 10 Mar 2015 12:19:53 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Carlos Hernandez <ceh@ti.com>
Message-ID: <20150310161952.GB21244@edge>
References: <1425993213-13246-1-git-send-email-ceh@ti.com>
MIME-Version: 1.0
In-Reply-To: <1425993213-13246-1-git-send-email-ceh@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] recipes-devtools: New ltp-ddt_1.0.0 recipe
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
X-List-Received-Date: Tue, 10 Mar 2015 16:19:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Mar 10, 2015 at 09:13:33AM -0400, Carlos Hernandez wrote:
> Latest ltp release was recently merge to ltp-ddt and there is a new
> way to configure and compile ltp-ddt.

Thanks, Carlos! Few comments inline.


> Signed-off-by: Carlos Hernandez <ceh@ti.com>
> ---
>  ...ite-Make-sure-to-include-generated-header.patch | 33 ++++++++
>  .../recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb      | 87 ++++++++++++++++++++++
>  2 files changed, 120 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_suite-Make-sure-to-include-generated-header.patch
>  create mode 100644 meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> 
> diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_suite-Make-sure-to-include-generated-header.patch b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_suite-Make-sure-to-include-generated-header.patch

First of all, this should probably go to meta-arago-extras, if not even to 
meta-ti... Although, if the plan is to upstream it to meta-openembedded, then 
meta-arago-extras should be fine as temp location.


> new file mode 100644
> index 0000000..31df16d
> --- /dev/null
> +++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_suite-Make-sure-to-include-generated-header.patch
> @@ -0,0 +1,33 @@
> +From 4a8f24892514cd5e4d11b9105c843db49eea921b Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 19 Feb 2014 19:41:33 -0800
> +Subject: [PATCH] wdt_test_suite: Make sure to include generated headers
> +
> +This makes sure that its using the generated headers
> +and not the raw headers from kernel, generated headers
> +are built for the given machine already when kernel is
> +built and are available in configured/compiled kernel tree
> +already

Have you looked into merging this patch back to ltp-ddt Makefile? Will it 
break your regular outside of OE builds?


> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + testcases/ddt/wdt_test_suite/Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/testcases/ddt/wdt_test_suite/Makefile b/testcases/ddt/wdt_test_suite/Makefile
> +index 90a6a90..22a1cfd 100644
> +--- a/testcases/ddt/wdt_test_suite/Makefile
> ++++ b/testcases/ddt/wdt_test_suite/Makefile
> +@@ -20,8 +20,8 @@ INCLUDES        = -I $(KERNEL_INC) -I src/interface/common -I ../utils/user
> + INCLUDES        = -I src/parser \
> +                   -I src/interface/common \
> +                   -I ../utils/user \
> +-                  -I $(KERNEL_INC)/include \
> +-                  -I $(KERNEL_INC)/arch/arm/include
> ++                  -I $(KERNEL_INC)/include/generated \
> ++                  -I $(KERNEL_INC)/arch/arm/include/generated \
> +
> +#List of source files- Update this on adding a new C file
> + SOURCES := \
> +--
> +1.9.0
> diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> new file mode 100644
> index 0000000..c321242
> --- /dev/null
> +++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> @@ -0,0 +1,87 @@
> +SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
> +HOMEPAGE = "http://arago-project.org/git/projects/test-automation/ltp-ddt.git"
> +SECTION = "console/utils"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
> +PR = "r1"
> +
> +PROVIDES += "ltp"
> +DEPENDS += "zip-native virtual/kernel alsa-lib"
> +
> +inherit autotools module-base kernel-module-split
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +SRCREV = "ltp-ddt_1.0.0"

It's not recommended to use git tags in SRCREV, as those would need to be 
resolved on every parsing, which is rather expensive and requires network 
connection at parsing time, even if you don't want to build (i.e. bitbake -g 
or -e mode). Please use the actual commid id hash for SRCREV - we've stoped 
using tags in recipes some time ago.


> +BRANCH ?= "master"
> +
> +SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
> +           file://0001-wdt_test_suite-Make-sure-to-include-generated-header.patch \
> +          "
> +
> +S = "${WORKDIR}/git"
> +
> +LTPROOT = "/opt/ltp"
> +
> +EXTRA_OEMAKE_append = " \
> +    prefix=${LTPROOT} \
> +    CROSS_COMPILE=${HOST_PREFIX} \
> +    SKIP_IDCHECK=1 \
> +    KERNEL_INC=${STAGING_KERNEL_DIR} \
> +    KERNEL_USR_INC=${STAGING_INCDIR} \
> +    ALSA_INCPATH=${STAGING_INCDIR} \
> +    ALSA_LIBPATH=${STAGING_LIBDIR} \
> +    PLATFORM=${MACHINE} \
> +    RANLIB=${RANLIB} \
> +"
> +
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +FILES_${PN}-dbg += " \
> +    ${LTPROOT}/.debug \
> +    ${LTPROOT}/bin/.debug \
> +    ${LTPROOT}/runtest/.debug \
> +    ${LTPROOT}/testcases/bin/.debug \
> +    ${LTPROOT}/testcases/bin/*/bin/.debug \
> +    ${LTPROOT}/testcases/bin/*/test/.debug \
> +    ${LTPROOT}/testcases/bin/ddt/.debug \
> +    ${LTPROOT}/testcases/bin/ddt/*/bin/.debug \
> +    ${LTPROOT}/testcases/bin/ddt/*/test/.debug \
> +    ${LTPROOT}/testcases/realtime/*/*/.debug \
> +"
> +
> +FILES_${PN}-staticdev += "${LTPROOT}/lib"
> +FILES_${PN} += "${LTPROOT}/*"
> +
> +# ltp doesn't regenerate ffsb-6.0-rc2 configure and hardcode configure call.
> +# we explicitly force regeneration of that directory and pass configure options.
> +do_configure_append() {
> +    (cd utils/ffsb-6.0-rc2; autoreconf -fvi; ./configure ${CONFIGUREOPTS})
> +}
> +
> +kmoddir = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/ddt"
> +
> +do_compile_append () {
> +    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> +    oe_runmake KERNEL_CC="${KERNEL_CC}" DESTDIR=${D} modules
> +}
> +
> +do_install() {
> +    oe_runmake DESTDIR=${D} install
> +    install -d ${D}${datadir}
> +    install -d ${D}${kmoddir}
> +    mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir}
> +}
> +
> +PR_append = "-arago10+gitr${SRCPV}"

And this will go into meta-arago-distro/.../*.bbappend, unless you want the 
+gitr${SRCPV} portion to go in the main recipe, in which case should probably 
be merged with the above PR assignment at the top.


> +RDEPENDS_${PN} += "linaro-pm-qa-utils serialcheck"
> +
> +EXTRA_OEMAKE += "KERNEL_PATH="${STAGING_KERNEL_DIR}""

Can you combine this EXTRA_OEMAKE with the one above in the recipe? I 
understand this recipe combined the original bb and our arago bbappend, but 
this is a good time to clean it up.


> +KERNEL_MODULES_META_PACKAGE = "${PN}"

BTW, would be better to move the above variables (RDEPENDS, 
KERNEL_MODULES_META_PACKAGE, etc.) above the do_compile and do_install 
functions for better readability.


> +# do_make_scripts should be a separate task for the lock to work
> +addtask make_scripts before do_compile
> +do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
> +do_make_scripts[deptask] = "do_populate_sysroot"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

