Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7B89152A29
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 00:47:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2C0lOFU011126
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 19:47:24 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2C0lN2R029749
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 19:47:23 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 19:47:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2C0lNUg004731;
	Wed, 11 Mar 2015 19:47:23 -0500
Date: Wed, 11 Mar 2015 20:47:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Hernandez, Carlos" <ceh@ti.com>
Message-ID: <20150312004722.GE23587@edge>
References: <1425993213-13246-1-git-send-email-ceh@ti.com>
	<20150311235329.GD23587@edge>
	<32B5D12402BE454796026F6AC58AA86E33115ACC@DLEE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <32B5D12402BE454796026F6AC58AA86E33115ACC@DLEE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Thu, 12 Mar 2015 00:47:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

No, it wasn't a clean build. I'll try that next, but I think I need to drop 
"share" part I've added first...


On Wed, Mar 11, 2015 at 08:44:53PM -0400, Hernandez, Carlos wrote:
>    Did you do a clean ltp-ddt build? The v2 patch ran successfully for me.
>    Carlos
> 
>    Sent from my Android phone using TouchDown (www.nitrodesk.com)
> 
>    -----Original Message-----
>    From: Dmytriyenko, Denys [denys@ti.com]
>    Received: Wednesday, 11 Mar 2015, 7:53PM
>    To: Hernandez, Carlos [ceh@ti.com]
>    CC: meta-arago@arago-project.org [meta-arago@arago-project.org]
>    Subject: Re: [meta-arago] [PATCH] recipes-devtools: New ltp-ddt_1.0.0
>    recipe
> 
>    Carlos,
> 
>    ltp-ddt 1.0 fails to build now:
> 
>    | arm-linux-gnueabihf-gcc  -march=armv7-a -marm -mthumb-interwork
>    -mfloat-abi=hard -mfpu=neon -mtune=cortex-a8 
>    -L/opt/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-rpath-li
>    nk,/opt/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-O1
>    -Wl,--hash-style=gnu
>    --sysroot=/home/jenkins/tisdk-build/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots
>    /am335x-evm -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include 
>    -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -g -O2
>    -fno-strict-aliasing -pipe -Wall
>    -W  -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include 
>    -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types
>    -Wold-style-definition -isystem/opt/linaro-2013.
>    03/arm-linux-gnueabihf/include  -fstack-protector -D_FORTIFY_SOURCE=2
>    -I/home/jenkins/tisdk-build/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-lin
>    ux-gnueabi/ltp-ddt/1.0.0-r0/git/testcases/kernel/include -D_GNU_SOURCE
>    -I/home/jenkins/tisdk-build/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-li
>    nux-gnueabi/ltp-ddt/1.0.0-r0/git/testcases/kernel/timers/timer_create/../include
>    -I../../../../include -I../../../../include
>    -L/opt/linaro-2013.03/arm-linux-gnueabihf/lib
>    -Wl,-rpath-link,/opt/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-O1
>    -Wl,--hash-style=gnu  -L../../../../lib  timer_create02.c   -lltp
>    -lpthread -lrt -o timer_create02
>    |
>    /home/jenkins/tisdk-build/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/lib/libfl.so:
>    undefined reference to `yylex'
>    | collect2: error: ld returned 1 exit status
>    | make[1]: *** [ltp-bump] Error 1
> 
>    Looks like flex doesn't have the right symbol - is it wrong version?
> 
>    --
>    Denys
> 
>    On Tue, Mar 10, 2015 at 09:13:33AM -0400, Carlos Hernandez wrote:
>    > Latest ltp release was recently merge to ltp-ddt and there is a new
>    > way to configure and compile ltp-ddt.
>    >
>    > Signed-off-by: Carlos Hernandez <ceh@ti.com>
>    > ---
>    >  ...ite-Make-sure-to-include-generated-header.patch | 33 ++++++++
>    >  .../recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb      | 87
>    ++++++++++++++++++++++
>    >  2 files changed, 120 insertions(+)
>    >  create mode 100644
>    meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_suite-Make-sure-to-include-generated-header.patch
>    >  create mode 100644
>    meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
>    >
>    > diff --git
>    a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_suite-Make-sure-to-include-generated-header.patch
>    b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_suite-Make-sure-to-include-generated-header.patch
>    > new file mode 100644
>    > index 0000000..31df16d
>    > --- /dev/null
>    > +++
>    b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_suite-Make-sure-to-include-generated-header.patch
>    > @@ -0,0 +1,33 @@
>    > +From 4a8f24892514cd5e4d11b9105c843db49eea921b Mon Sep 17 00:00:00 2001
>    > +From: Khem Raj <raj.khem@gmail.com>
>    > +Date: Wed, 19 Feb 2014 19:41:33 -0800
>    > +Subject: [PATCH] wdt_test_suite: Make sure to include generated headers
>    > +
>    > +This makes sure that its using the generated headers
>    > +and not the raw headers from kernel, generated headers
>    > +are built for the given machine already when kernel is
>    > +built and are available in configured/compiled kernel tree
>    > +already
>    > +
>    > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    > +---
>    > + testcases/ddt/wdt_test_suite/Makefile | 4 ++--
>    > + 1 file changed, 2 insertions(+), 2 deletions(-)
>    > +
>    > +diff --git a/testcases/ddt/wdt_test_suite/Makefile
>    b/testcases/ddt/wdt_test_suite/Makefile
>    > +index 90a6a90..22a1cfd 100644
>    > +--- a/testcases/ddt/wdt_test_suite/Makefile
>    > ++++ b/testcases/ddt/wdt_test_suite/Makefile
>    > +@@ -20,8 +20,8 @@ INCLUDES        = -I $(KERNEL_INC) -I
>    src/interface/common -I ../utils/user
>    > + INCLUDES        = -I src/parser \
>    > +                   -I src/interface/common \
>    > +                   -I ../utils/user \
>    > +-                  -I $(KERNEL_INC)/include \
>    > +-                  -I $(KERNEL_INC)/arch/arm/include
>    > ++                  -I $(KERNEL_INC)/include/generated \
>    > ++                  -I $(KERNEL_INC)/arch/arm/include/generated \
>    > +
>    > +#List of source files- Update this on adding a new C file
>    > + SOURCES := \
>    > +--
>    > +1.9.0
>    > diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
>    b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
>    > new file mode 100644
>    > index 0000000..c321242
>    > --- /dev/null
>    > +++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
>    > @@ -0,0 +1,87 @@
>    > +SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test
>    Project"
>    > +HOMEPAGE =
>    "http://arago-project.org/git/projects/test-automation/ltp-ddt.git"
>    > +SECTION = "console/utils"
>    > +LICENSE = "GPLv2"
>    > +LIC_FILES_CHKSUM =
>    "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
>    > +PR = "r1"
>    > +
>    > +PROVIDES += "ltp"
>    > +DEPENDS += "zip-native virtual/kernel alsa-lib"
>    > +
>    > +inherit autotools module-base kernel-module-split
>    > +
>    > +PACKAGE_ARCH = "${MACHINE_ARCH}"
>    > +
>    > +SRCREV = "ltp-ddt_1.0.0"
>    > +BRANCH ?= "master"
>    > +
>    > +SRC_URI =
>    "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}
>    \
>    > +          
>    file://0001-wdt_test_suite-Make-sure-to-include-generated-header.patch \
>    > +          "
>    > +
>    > +S = "${WORKDIR}/git"
>    > +
>    > +LTPROOT = "/opt/ltp"
>    > +
>    > +EXTRA_OEMAKE_append = " \
>    > +    prefix=${LTPROOT} \
>    > +    CROSS_COMPILE=${HOST_PREFIX} \
>    > +    SKIP_IDCHECK=1 \
>    > +    KERNEL_INC=${STAGING_KERNEL_DIR} \
>    > +    KERNEL_USR_INC=${STAGING_INCDIR} \
>    > +    ALSA_INCPATH=${STAGING_INCDIR} \
>    > +    ALSA_LIBPATH=${STAGING_LIBDIR} \
>    > +    PLATFORM=${MACHINE} \
>    > +    RANLIB=${RANLIB} \
>    > +"
>    > +
>    > +TARGET_CC_ARCH += "${LDFLAGS}"
>    > +
>    > +FILES_${PN}-dbg += " \
>    > +    ${LTPROOT}/.debug \
>    > +    ${LTPROOT}/bin/.debug \
>    > +    ${LTPROOT}/runtest/.debug \
>    > +    ${LTPROOT}/testcases/bin/.debug \
>    > +    ${LTPROOT}/testcases/bin/*/bin/.debug \
>    > +    ${LTPROOT}/testcases/bin/*/test/.debug \
>    > +    ${LTPROOT}/testcases/bin/ddt/.debug \
>    > +    ${LTPROOT}/testcases/bin/ddt/*/bin/.debug \
>    > +    ${LTPROOT}/testcases/bin/ddt/*/test/.debug \
>    > +    ${LTPROOT}/testcases/realtime/*/*/.debug \
>    > +"
>    > +
>    > +FILES_${PN}-staticdev += "${LTPROOT}/lib"
>    > +FILES_${PN} += "${LTPROOT}/*"
>    > +
>    > +# ltp doesn't regenerate ffsb-6.0-rc2 configure and hardcode configure
>    call.
>    > +# we explicitly force regeneration of that directory and pass configure
>    options.
>    > +do_configure_append() {
>    > +    (cd utils/ffsb-6.0-rc2; autoreconf -fvi; ./configure
>    ${CONFIGUREOPTS})
>    > +}
>    > +
>    > +kmoddir = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/ddt"
>    > +
>    > +do_compile_append () {
>    > +    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>    > +    oe_runmake KERNEL_CC="${KERNEL_CC}" DESTDIR=${D} modules
>    > +}
>    > +
>    > +do_install() {
>    > +    oe_runmake DESTDIR=${D} install
>    > +    install -d ${D}${datadir}
>    > +    install -d ${D}${kmoddir}
>    > +    mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir}
>    > +}
>    > +
>    > +PR_append = "-arago10+gitr${SRCPV}"
>    > +
>    > +RDEPENDS_${PN} += "linaro-pm-qa-utils serialcheck"
>    > +
>    > +EXTRA_OEMAKE += "KERNEL_PATH="${STAGING_KERNEL_DIR}""
>    > +
>    > +KERNEL_MODULES_META_PACKAGE = "${PN}"
>    > +
>    > +# do_make_scripts should be a separate task for the lock to work
>    > +addtask make_scripts before do_compile
>    > +do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
>    > +do_make_scripts[deptask] = "do_populate_sysroot"
>    > --
>    > 1.9.1
>    >
>    > _______________________________________________
>    > meta-arago mailing list
>    > meta-arago@arago-project.org
>    > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

