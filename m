Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C2BC52D7C
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 04:37:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.980.1722832644538094800
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 04 Aug 2024 21:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E228140CB0;
	Mon,  5 Aug 2024 04:37:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RT38l4K0bh9i; Mon,  5 Aug 2024 04:37:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C5E9840CC4;
	Mon,  5 Aug 2024 04:37:22 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7E923164060;
	Mon,  5 Aug 2024 00:37:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][RFC PATCH 10/16] linalg: deprecate
Date: Mon,  5 Aug 2024 00:37:07 -0400
Message-Id: <20240805043713.172555-10-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240805043713.172555-1-denis@denix.org>
References: <20240805043713.172555-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Aug 2024 04:37:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15490

From: Denys Dmytriyenko <denys@konsulko.com>

Remove linalg component as deprecated and not maintained.

This component was offloading processing tasks to DSP using heavily
modified OpenCL/OpenCV forks of old versions of corresponding upstream
projects on legacy platforms.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...001-Makefile-fix-toolchain-variables.patch | 194 ------------------
 ...RALLEL_MAKE-variable-to-overwrite-j8.patch |  66 ------
 .../recipes-ti/linalg/linalg-examples_git.bb  |  34 ---
 .../recipes-ti/linalg/linalg.inc              |  56 -----
 .../recipes-ti/linalg/linalg_git.bb           |  25 ---
 5 files changed, 375 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-ti/linalg/files/0001-Makefi=
le-fix-toolchain-variables.patch
 delete mode 100644 meta-arago-extras/recipes-ti/linalg/files/0001-Makefi=
le-pass-PARALLEL_MAKE-variable-to-overwrite-j8.patch
 delete mode 100644 meta-arago-extras/recipes-ti/linalg/linalg-examples_g=
it.bb
 delete mode 100644 meta-arago-extras/recipes-ti/linalg/linalg.inc
 delete mode 100644 meta-arago-extras/recipes-ti/linalg/linalg_git.bb

diff --git a/meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-fix-=
toolchain-variables.patch b/meta-arago-extras/recipes-ti/linalg/files/000=
1-Makefile-fix-toolchain-variables.patch
deleted file mode 100644
index df387977..00000000
--- a/meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-fix-toolcha=
in-variables.patch
+++ /dev/null
@@ -1,194 +0,0 @@
-From a99f267c7dd799cd66f64fa41a3bd7b5c5d6f8a1 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Sun, 26 Mar 2017 18:17:06 -0400
-Subject: [PATCH] Makefile: fix toolchain variables
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- examples/arm+dsp/make.inc                         |  1 -
- src/ti/linalg/blis/config/cortex-a15/make_defs.mk |  1 -
- src/ti/linalg/cblas/Makefile.ARM                  |  4 +---
- src/ti/linalg/clapack/make.inc.ARM                |  8 +++-----
- src/ti/linalg/clapack/make.inc.ARMBLAS            | 10 ++++------
- src/ti/linalg/clapack/make.inc.ARMOpenCL          |  8 +++-----
- src/ti/linalg/make.inc                            |  6 +-----
- src/ti/linalg/tuning/make.inc                     |  1 -
- 8 files changed, 12 insertions(+), 27 deletions(-)
-
-diff --git a/examples/arm+dsp/make.inc b/examples/arm+dsp/make.inc
-index c3a042d..e916b97 100644
---- a/examples/arm+dsp/make.inc
-+++ b/examples/arm+dsp/make.inc
-@@ -11,7 +11,6 @@ ifneq (,$(findstring 86, $(UNAME_M)))
-=20
-     # gcc ARM cross compiler will not, by default, search the host's
-     # /usr/include.  Explicitly specify here to find dependent vendor h=
eaders
--    CC =3D arm-linux-gnueabihf-gcc
- else
-     CC =3D gcc=20
- endif
-diff --git a/src/ti/linalg/blis/config/cortex-a15/make_defs.mk b/src/ti/=
linalg/blis/config/cortex-a15/make_defs.mk
-index 58130a0..13e10be 100644
---- a/src/ti/linalg/blis/config/cortex-a15/make_defs.mk
-+++ b/src/ti/linalg/blis/config/cortex-a15/make_defs.mk
-@@ -74,7 +74,6 @@ GIT_LOG    :=3D $(GIT) log --decorate
- #
-=20
- # --- Determine the C compiler and related flags ---
--CC             :=3D arm-linux-gnueabihf-gcc
- #CC             :=3D gcc
- # Enable IEEE Standard 1003.1-2004 (POSIX.1d).=20
- # NOTE: This is needed to enable posix_memalign().
-diff --git a/src/ti/linalg/cblas/Makefile.ARM b/src/ti/linalg/cblas/Make=
file.ARM
-index 3702887..e065831 100644
---- a/src/ti/linalg/cblas/Makefile.ARM
-+++ b/src/ti/linalg/cblas/Makefile.ARM
-@@ -32,8 +32,6 @@ LN_S =3D ln -sf
- # Compilers
- #----------------------------------------------------------------------=
-------
-=20
--CC =3D arm-linux-gnueabihf-gcc
--FC =3D arm-linux-gnueabihf-gfortran
- LOADER =3D $(FC)
-=20
- #----------------------------------------------------------------------=
-------
-@@ -47,6 +45,6 @@ FFLAGS =3D -O2
- # Archive programs and flags
- #----------------------------------------------------------------------=
-------
-=20
--ARCH =3D arm-linux-gnueabihf-ar
-+ARCH =3D $(AR)
- ARCHFLAGS =3D r
- RANLIB =3D echo
-diff --git a/src/ti/linalg/clapack/make.inc.ARM b/src/ti/linalg/clapack/=
make.inc.ARM
-index 0fdbe72..204904b 100644
---- a/src/ti/linalg/clapack/make.inc.ARM
-+++ b/src/ti/linalg/clapack/make.inc.ARM
-@@ -23,10 +23,9 @@ PLAT =3D _ARM
- # This is used to compile C libary
- #CC        =3D arm-linux-gnueabihf-gcc -DNO_BLAS_WRAP
- # if no wrapping of the blas library is needed, uncomment next line
--CC        =3D arm-linux-gnueabihf-gcc=20
- CFLAGS    =3D -O2 -I$(TOPDIR)/INCLUDE=20
--LINKER    =3D arm-linux-gnueabihf-ld
--LOADER    =3D arm-linux-gnueabihf-gcc
-+LINKER    =3D $(LD)
-+LOADER    =3D $(CC)
- LOADOPTS  =3D -L$(TARGET_ROOTDIR)/lib -L$(TARGET_ROOTDIR)/usr/lib -Wl,-=
rpath-link,$(TARGET_ROOTDIR)/lib -Wl,-rpath-link,$(TARGET_ROOTDIR)/usr/li=
b
- NOOPT     =3D -O0 -I$(TOPDIR)/INCLUDE
- DRVCFLAGS =3D $(CFLAGS)
-@@ -51,9 +50,8 @@ TIMER    =3D INT_CPU_TIME
- #  The archiver and the flag(s) to use when building archive (library)
- #  If you system has no ranlib, set RANLIB =3D echo.
- #
--ARCH     =3D arm-linux-gnueabihf-ar
-+ARCH     =3D $(AR)
- ARCHFLAGS=3D cr
--RANLIB   =3D arm-linux-gnueabihf-ranlib
- #
- #  The location of BLAS library for linking the testing programs.
- #  The target's machine-specific, optimized BLAS library should be
-diff --git a/src/ti/linalg/clapack/make.inc.ARMBLAS b/src/ti/linalg/clap=
ack/make.inc.ARMBLAS
-index e3b1b04..d95763c 100644
---- a/src/ti/linalg/clapack/make.inc.ARMBLAS
-+++ b/src/ti/linalg/clapack/make.inc.ARMBLAS
-@@ -23,10 +23,9 @@ PLAT =3D _ARMBLAS
- # This is used to compile C libary
- #CC        =3D arm-linux-gnueabihf-gcc
- # if no wrapping of the blas library is needed, uncomment next line
--CC        =3D arm-linux-gnueabihf-gcc -DNO_BLAS_WRAP
--CFLAGS    =3D -O3 -I$(TOPDIR)/INCLUDE
--LINKER    =3D arm-linux-gnueabihf-ld
--LOADER    =3D arm-linux-gnueabihf-gcc
-+CFLAGS    =3D -O3 -I$(TOPDIR)/INCLUDE -DNO_BLAS_WRAP
-+LINKER    =3D $(LD)
-+LOADER    =3D $(CC)
- LOADOPTS  =3D
- NOOPT     =3D -O0 -I$(TOPDIR)/INCLUDE
- DRVCFLAGS =3D $(CFLAGS)
-@@ -51,9 +50,8 @@ TIMER    =3D INT_CPU_TIME
- #  The archiver and the flag(s) to use when building archive (library)
- #  If you system has no ranlib, set RANLIB =3D echo.
- #
--ARCH     =3D arm-linux-gnueabihf-ar
-+ARCH     =3D $(AR)
- ARCHFLAGS=3D cr
--RANLIB   =3D arm-linux-gnueabihf-ranlib
- #
- #  The location of BLAS library for linking the testing programs.
- #  The target's machine-specific, optimized BLAS library should be
-diff --git a/src/ti/linalg/clapack/make.inc.ARMOpenCL b/src/ti/linalg/cl=
apack/make.inc.ARMOpenCL
-index 036b3d1..1acc421 100644
---- a/src/ti/linalg/clapack/make.inc.ARMOpenCL
-+++ b/src/ti/linalg/clapack/make.inc.ARMOpenCL
-@@ -21,12 +21,11 @@ PLAT =3D _ARM
- #
- #######################################################
- # This is used to compile C libary
--CC        =3D arm-linux-gnueabihf-gcc #-pg
- # if no wrapping of the blas library is needed, uncomment next line
- #CC        =3D arm-linux-gnueabihf-gcc -DNO_BLAS_WRAP
- CFLAGS    =3D -O2 -I$(TOPDIR)/INCLUDE #-g=20
--LINKER    =3D arm-linux-gnueabihf-ld
--LOADER    =3D arm-linux-gnueabihf-gcc
-+LINKER    =3D $(LD)
-+LOADER    =3D $(CC)
- LOADOPTS  =3D -L$(TARGET_ROOTDIR)/lib -L$(TARGET_ROOTDIR)/usr/lib -Wl,-=
rpath-link,$(TARGET_ROOTDIR)/lib -Wl,-rpath-link,$(TARGET_ROOTDIR)/usr/li=
b
- NOOPT     =3D -O0 -I$(TOPDIR)/INCLUDE
- DRVCFLAGS =3D $(CFLAGS)
-@@ -51,9 +50,8 @@ TIMER    =3D INT_CPU_TIME
- #  The archiver and the flag(s) to use when building archive (library)
- #  If you system has no ranlib, set RANLIB =3D echo.
- #
--ARCH     =3D arm-linux-gnueabihf-ar
-+ARCH     =3D $(AR)
- ARCHFLAGS=3D cr
--RANLIB   =3D arm-linux-gnueabihf-ranlib
- #
- #  The location of BLAS library for linking the testing programs.
- #  The target's machine-specific, optimized BLAS library should be
-diff --git a/src/ti/linalg/make.inc b/src/ti/linalg/make.inc
-index b2e1afe..8588019 100644
---- a/src/ti/linalg/make.inc
-+++ b/src/ti/linalg/make.inc
-@@ -1,5 +1,4 @@
--
--CPP   =3D g++
-+CPP =3D $(CXX)
- CL6X  =3D cl6x -mv6600 --abi=3Deabi $(DSP_INCLUDE)
- CLOCL =3D clocl
-=20
-@@ -7,8 +6,6 @@ LIBS  =3D -lOpenCL -locl_util #-lstdc++ -lrt
-=20
- UNAME_M :=3D$(shell uname -m)
-=20
--OBJCOPY =3D arm-linux-gnueabihf-objcopy
--
- ifneq (,$(findstring 86, $(UNAME_M)))
-     .DEFAULT_GOAL :=3D cross
-=20
-@@ -29,7 +26,6 @@ ifneq (,$(findstring 86, $(UNAME_M)))
-=20
-     # gcc ARM cross compiler will not, by default, search the host's
-     # /usr/include.  Explicitly specify here to find dependent vendor h=
eaders
--    cross: override CPP =3D arm-linux-gnueabihf-g++
-     cross: CPP_FLAGS +=3D -I$(TARGET_ROOTDIR)/usr/include -idirafter /u=
sr/include
-     #cross: CL6X_FLAGS +=3D -I$(OMP_DIR)/packages/ti/runtime/openmp
-=20
-diff --git a/src/ti/linalg/tuning/make.inc b/src/ti/linalg/tuning/make.i=
nc
-index cd3c653..ecce3d9 100644
---- a/src/ti/linalg/tuning/make.inc
-+++ b/src/ti/linalg/tuning/make.inc
-@@ -11,7 +11,6 @@ ifneq (,$(findstring 86, $(UNAME_M)))
-=20
-     # gcc ARM cross compiler will not, by default, search the host's
-     # /usr/include.  Explicitly specify here to find dependent vendor h=
eaders
--    CC =3D arm-linux-gnueabihf-gcc
- else
-     CC =3D gcc=20
- endif
---=20
-2.7.4
-
diff --git a/meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-pass=
-PARALLEL_MAKE-variable-to-overwrite-j8.patch b/meta-arago-extras/recipes=
-ti/linalg/files/0001-Makefile-pass-PARALLEL_MAKE-variable-to-overwrite-j=
8.patch
deleted file mode 100644
index 7d2f1409..00000000
--- a/meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-pass-PARALL=
EL_MAKE-variable-to-overwrite-j8.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 54378094d58c79a9d5ff6c1cc17d7bfd9c497dab Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Wed, 29 Mar 2017 13:09:05 -0400
-Subject: [PATCH] Makefile: pass PARALLEL_MAKE variable to overwrite -j8
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- src/ti/linalg/Makefile | 12 +++++++-----
- 1 file changed, 7 insertions(+), 5 deletions(-)
-
-diff --git a/src/ti/linalg/Makefile b/src/ti/linalg/Makefile
-index 90b8ef4..8d8e338 100644
---- a/src/ti/linalg/Makefile
-+++ b/src/ti/linalg/Makefile
-@@ -13,6 +13,8 @@ CLAPACK_HEADERS =3D$(LINALG_CLAPACK_DIR)/INCLUDE/blasw=
rap.h
- CLAPACK_HEADERS+=3D$(LINALG_CLAPACK_DIR)/INCLUDE/clapack.h =20
- CLAPACK_HEADERS+=3D$(LINALG_CLAPACK_DIR)/INCLUDE/f2c.h =20
-=20
-+PARALLEL_MAKE ?=3D "-j8"
-+
- ifneq (,$(findstring DSP,$(MAKECMDGOALS)))
-=20
- ifeq ($(LIBOS),LIB_RTOS)
-@@ -52,7 +54,7 @@ endif
- DSPlibs:
- 	cd $(LINALG_CBLAS_DIR); make arch=3DC66 alllib  || exit 1; \
- 	cd ../$(LINALG_BLIS_DIR); ./configure -p install/$(BLIS_CFG) c66x; \
--	make -j8 MEM_MODEL=3D$(MEM_MODEL) TARGET=3D$(TARGET) LIBOS=3D$(LIBOS) =
NUM_DSP_CORES=3D$(NUM_DSP_CORES) || exit 1; make install; \
-+	make $(PARALLEL_MAKE) MEM_MODEL=3D$(MEM_MODEL) TARGET=3D$(TARGET) LIBO=
S=3D$(LIBOS) NUM_DSP_CORES=3D$(NUM_DSP_CORES) || exit 1; make install; \
- 	cd ../$(LINALG_TICBLAS_DIR)/src; make MEM_MODEL=3D$(MEM_MODEL) TARGET=3D=
$(TARGET) LIBOS=3D$(LIBOS) NUM_DSP_CORES=3D$(NUM_DSP_CORES) || exit 1; cd=
 ../lib; \
- 	echo "combining BLIS, CBLAS, and TICBLAS libraries into one: libcblas.=
ae66"; \
- 	rm -rf blas_objs blis_objs; mkdir blas_objs blis_objs; cd blis_objs; a=
r x ../../../blis/install/$(BLIS_CFG)/lib/libblis.ae66; chmod +rw *; \
-@@ -63,8 +65,8 @@ DSPlibs:
- # Build ARM code for ARM+DSP platforms
- ARMlibs:
- 	cd $(LINALG_CBLAS_DIR); make arch=3DARM alllib || exit 1; \
--	cd ../$(LINALG_BLIS_DIR); ./configure -p install/arm cortex-a15; make =
-j8 NUM_ARM_CORES=3D$(NUM_ARM_CORES) || exit 1; make install; \
--	cd ../$(LINALG_CLAPACK_DIR); make f2clib || exit 1; make cblaswrap || =
exit 1; cd SRC; make -j8 || exit 1; cd ..
-+	cd ../$(LINALG_BLIS_DIR); ./configure -p install/arm cortex-a15; make =
$(PARALLEL_MAKE) NUM_ARM_CORES=3D$(NUM_ARM_CORES) || exit 1; make install=
; \
-+	cd ../$(LINALG_CLAPACK_DIR); make f2clib || exit 1; make cblaswrap || =
exit 1; cd SRC; make $(PARALLEL_MAKE) || exit 1; cd ..
-=20
- # Build host-callable libraries for ARM+DSP platforms.=20
- # BLAS has a single archive: libcblas_armplusdsp.a, which includes:
-@@ -91,7 +93,7 @@ ARMplusDSP: DSPlibs ARMlibs
- cleanDSPlibs:
- 	rm -f lib/*
- 	cd $(LINALG_CBLAS_DIR); make arch=3DC66 clean; \
--	cd ../$(LINALG_BLIS_DIR); ./configure -p install/$(BLIS_CFG) c66x; mak=
e -j8 clean; rm -r install/$(BLIS_CFG); \
-+	cd ../$(LINALG_BLIS_DIR); ./configure -p install/$(BLIS_CFG) c66x; mak=
e $(PARALLEL_MAKE) clean; rm -r install/$(BLIS_CFG); \
- 	cd ../$(LINALG_TICBLAS_DIR)/src; make clean;=20
-=20
- cleanARMlibs:
-@@ -103,7 +105,7 @@ cleanARMlibs:
-=20
- BLIStest:
- 	cd $(LINALG_BLIS_DIR); ./configure -p install/arm cortex-a15; \
--	cd testsuite; make lib=3DOpenCLCBLAS -j8=20
-+	cd testsuite; make lib=3DOpenCLCBLAS $(PARALLEL_MAKE)
-=20
- BLIStestDSP:
- 	cd $(LINALG_BLIS_DIR); ./configure -p install/$(BLIS_CFG) c66x; \
---=20
-2.7.4
-
diff --git a/meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb b=
/meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb
deleted file mode 100644
index 0871193f..00000000
--- a/meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-DESCRIPTION =3D "TI Linear Algebra Library examples"
-
-include linalg.inc
-PR =3D "${INC_PR}.0"
-
-DEPENDS +=3D "linalg"
-RDEPENDS:${PN} +=3D "opencl-runtime"
-
-export LINALG_DIR =3D "${LINALG_INSTALL_DIR}"
-
-EXAMPLES_ROOT =3D "${WORKDIR}/git/examples/arm+dsp"
-
-do_compile() {
-    cd examples/arm+dsp
-    make
-    # Remove object files before installing so that the binaries are not=
 present
-    find . -name "*.obj" -type f -delete
-    find . -name "*.o" -type f -delete
-}
-
-do_install() {
-    install -d ${D}${datadir}/ti/examples/linalg
-    cp -r examples/arm+dsp/* ${D}${datadir}/ti/examples/linalg
-}
-
-FILES:${PN} +=3D "\
-    ${datadir}/ti/examples/linalg/* \
-"
-
-FILES:${PN}-dbg +=3D "\
-    ${datadir}/ti/examples/linalg/*/.debug \
-"
-
-INSANE_SKIP:${PN} =3D "arch ldflags textrel"
diff --git a/meta-arago-extras/recipes-ti/linalg/linalg.inc b/meta-arago-=
extras/recipes-ti/linalg/linalg.inc
deleted file mode 100644
index 32459847..00000000
--- a/meta-arago-extras/recipes-ti/linalg/linalg.inc
+++ /dev/null
@@ -1,56 +0,0 @@
-HOMEPAGE =3D "git://git.ti.com/git/dense-linear-algebra-libraries/linalg=
.git"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://src/ti/linalg/docs/LINALG_1.2.0_manifest.ht=
ml;md5=3Df30895e41e5947c3439b1ad4cf4c8555"
-
-PV =3D "1_2_0_0"
-INC_PR =3D "r7"
-
-COMPATIBLE_MACHINE =3D "dra7xx"
-
-require recipes-ti/includes/arago-paths.inc
-require recipes-ti/includes/ti-staging.inc
-
-inherit features_check
-
-REQUIRED_MACHINE_FEATURES =3D "dsp"
-REQUIRED_DISTRO_FEATURES =3D "opencl openmp"
-
-SRC_URI =3D " \
-	git://git.ti.com/git/dense-linear-algebra-libraries/linalg.git;protocol=
=3Dhttps;branch=3D${BRANCH} \
-	file://0001-Makefile-fix-toolchain-variables.patch \
-	file://0001-Makefile-pass-PARALLEL_MAKE-variable-to-overwrite-j8.patch =
\
-"
-
-BRANCH =3D "master"
-SRCREV =3D "01960b319783b29aacf12b2a72606b28d657b78e"
-
-DEPENDS =3D " \
-	common-csl-ip \
-	libarch \
-	ti-xdctools-native \
-	ti-ipc-rtos \
-	ti-sysbios \
-	ti-cgt6x-native \
-	ti-xdais \
-	ti-framework-components \
-	libulm \
-	openmp-rtos \
-	opencl \
-	clocl-native \
-	doxygen-native \
-	zip-native \
-"
-
-S =3D "${WORKDIR}/git"
-
-export TI_OCL_INSTALL_DIR =3D "${STAGING_DIR_TARGET}/usr/share/ti/opencl=
"
-export CGTROOT =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
-export TI_OCL_CGT_INSTALL =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6=
x"
-export XDC_DIR =3D "${XDC_INSTALL_DIR}"
-export BIOS_DIR=3D "${SYSBIOS_INSTALL_DIR}"
-export XDAIS_DIR =3D "${XDAIS_INSTALL_DIR}"
-export FC_DIR =3D "${FC_INSTALL_DIR}"
-export PDK_DIR =3D "${PDK_INSTALL_DIR}"
-export OMP_DIR =3D"${OMP_INSTALL_DIR}"
-export LIBARCH_DIR =3D "${LIBARCH_INSTALL_DIR}"
-export TARGET_ROOTDIR=3D"${STAGING_DIR_TARGET}"
diff --git a/meta-arago-extras/recipes-ti/linalg/linalg_git.bb b/meta-ara=
go-extras/recipes-ti/linalg/linalg_git.bb
deleted file mode 100644
index aa87f5f2..00000000
--- a/meta-arago-extras/recipes-ti/linalg/linalg_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION =3D "TI Linear Algebra Library"
-
-include linalg.inc
-PR =3D "${INC_PR}.0"
-
-TARGET:dra7xx        =3D "SOC_AM572x"
-MEM_MODEL:dra7xx     =3D "Small"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-do_compile() {
-	make -f build/Makefile MEM_MODEL=3D${MEM_MODEL} TARGET=3D${TARGET} LIBO=
S=3DLIB_OPENCL PARALLEL_MAKE=3D"${PARALLEL_MAKE}"
-}
-
-do_install() {
-	install -d ${D}${LINALG_INSTALL_DIR_RECIPE}
-	cp -r exports/linalg_${PV}/* ${D}${LINALG_INSTALL_DIR_RECIPE}
-}
-
-# to create a package for LINALG
-FILES:${PN}-dev +=3D "${LINALG_INSTALL_DIR_RECIPE}"
-
-INSANE_SKIP:${PN}-dev =3D "arch staticdev"
-ALLOW_EMPTY:${PN} =3D "1"
-
-RDEPENDS:${PN}-dev +=3D "bash perl"
--=20
2.25.1


