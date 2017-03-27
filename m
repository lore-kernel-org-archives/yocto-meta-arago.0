Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 0620352960
	for <meta-arago@arago-project.org>;
	Mon, 27 Mar 2017 02:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CDDF020BC3;
	Mon, 27 Mar 2017 02:10:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id KdpS6BkLBQi4; Mon, 27 Mar 2017 02:10:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 688CA20B86;
	Mon, 27 Mar 2017 02:10:55 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id C5A8D16242E;
	Sun, 26 Mar 2017 22:10:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 26 Mar 2017 22:10:50 -0400
Message-Id: <1490580653-40192-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490580653-40192-1-git-send-email-denis@denix.org>
References: <1490580653-40192-1-git-send-email-denis@denix.org>
Subject: [morty/master][PATCH 5/8] linalg: fix toolchain variables, depend on doxygen and zip native pkgs
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
X-List-Received-Date: Mon, 27 Mar 2017 02:10:58 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../0001-Makefile-fix-toolchain-variables.patch    | 192 +++++++++++++++++++++
 meta-arago-extras/recipes-ti/linalg/linalg.inc     |  31 ++--
 2 files changed, 210 insertions(+), 13 deletions(-)
 create mode 100644 meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-fix-toolchain-variables.patch

diff --git a/meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-fix-toolchain-variables.patch b/meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-fix-toolchain-variables.patch
new file mode 100644
index 0000000..af7c6a2
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-fix-toolchain-variables.patch
@@ -0,0 +1,192 @@
+From a99f267c7dd799cd66f64fa41a3bd7b5c5d6f8a1 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Sun, 26 Mar 2017 18:17:06 -0400
+Subject: [PATCH] Makefile: fix toolchain variables
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ examples/arm+dsp/make.inc                         |  1 -
+ src/ti/linalg/blis/config/cortex-a15/make_defs.mk |  1 -
+ src/ti/linalg/cblas/Makefile.ARM                  |  4 +---
+ src/ti/linalg/clapack/make.inc.ARM                |  8 +++-----
+ src/ti/linalg/clapack/make.inc.ARMBLAS            | 10 ++++------
+ src/ti/linalg/clapack/make.inc.ARMOpenCL          |  8 +++-----
+ src/ti/linalg/make.inc                            |  6 +-----
+ src/ti/linalg/tuning/make.inc                     |  1 -
+ 8 files changed, 12 insertions(+), 27 deletions(-)
+
+diff --git a/examples/arm+dsp/make.inc b/examples/arm+dsp/make.inc
+index c3a042d..e916b97 100644
+--- a/examples/arm+dsp/make.inc
++++ b/examples/arm+dsp/make.inc
+@@ -11,7 +11,6 @@ ifneq (,$(findstring 86, $(UNAME_M)))
+ 
+     # gcc ARM cross compiler will not, by default, search the host's
+     # /usr/include.  Explicitly specify here to find dependent vendor headers
+-    CC = arm-linux-gnueabihf-gcc
+ else
+     CC = gcc 
+ endif
+diff --git a/src/ti/linalg/blis/config/cortex-a15/make_defs.mk b/src/ti/linalg/blis/config/cortex-a15/make_defs.mk
+index 58130a0..13e10be 100644
+--- a/src/ti/linalg/blis/config/cortex-a15/make_defs.mk
++++ b/src/ti/linalg/blis/config/cortex-a15/make_defs.mk
+@@ -74,7 +74,6 @@ GIT_LOG    := $(GIT) log --decorate
+ #
+ 
+ # --- Determine the C compiler and related flags ---
+-CC             := arm-linux-gnueabihf-gcc
+ #CC             := gcc
+ # Enable IEEE Standard 1003.1-2004 (POSIX.1d). 
+ # NOTE: This is needed to enable posix_memalign().
+diff --git a/src/ti/linalg/cblas/Makefile.ARM b/src/ti/linalg/cblas/Makefile.ARM
+index 3702887..e065831 100644
+--- a/src/ti/linalg/cblas/Makefile.ARM
++++ b/src/ti/linalg/cblas/Makefile.ARM
+@@ -32,8 +32,6 @@ LN_S = ln -sf
+ # Compilers
+ #-----------------------------------------------------------------------------
+ 
+-CC = arm-linux-gnueabihf-gcc
+-FC = arm-linux-gnueabihf-gfortran
+ LOADER = $(FC)
+ 
+ #-----------------------------------------------------------------------------
+@@ -47,6 +45,6 @@ FFLAGS = -O2
+ # Archive programs and flags
+ #-----------------------------------------------------------------------------
+ 
+-ARCH = arm-linux-gnueabihf-ar
++ARCH = $(AR)
+ ARCHFLAGS = r
+ RANLIB = echo
+diff --git a/src/ti/linalg/clapack/make.inc.ARM b/src/ti/linalg/clapack/make.inc.ARM
+index 0fdbe72..204904b 100644
+--- a/src/ti/linalg/clapack/make.inc.ARM
++++ b/src/ti/linalg/clapack/make.inc.ARM
+@@ -23,10 +23,9 @@ PLAT = _ARM
+ # This is used to compile C libary
+ #CC        = arm-linux-gnueabihf-gcc -DNO_BLAS_WRAP
+ # if no wrapping of the blas library is needed, uncomment next line
+-CC        = arm-linux-gnueabihf-gcc 
+ CFLAGS    = -O2 -I$(TOPDIR)/INCLUDE 
+-LINKER    = arm-linux-gnueabihf-ld
+-LOADER    = arm-linux-gnueabihf-gcc
++LINKER    = $(LD)
++LOADER    = $(CC)
+ LOADOPTS  = -L$(TARGET_ROOTDIR)/lib -L$(TARGET_ROOTDIR)/usr/lib -Wl,-rpath-link,$(TARGET_ROOTDIR)/lib -Wl,-rpath-link,$(TARGET_ROOTDIR)/usr/lib
+ NOOPT     = -O0 -I$(TOPDIR)/INCLUDE
+ DRVCFLAGS = $(CFLAGS)
+@@ -51,9 +50,8 @@ TIMER    = INT_CPU_TIME
+ #  The archiver and the flag(s) to use when building archive (library)
+ #  If you system has no ranlib, set RANLIB = echo.
+ #
+-ARCH     = arm-linux-gnueabihf-ar
++ARCH     = $(AR)
+ ARCHFLAGS= cr
+-RANLIB   = arm-linux-gnueabihf-ranlib
+ #
+ #  The location of BLAS library for linking the testing programs.
+ #  The target's machine-specific, optimized BLAS library should be
+diff --git a/src/ti/linalg/clapack/make.inc.ARMBLAS b/src/ti/linalg/clapack/make.inc.ARMBLAS
+index e3b1b04..d95763c 100644
+--- a/src/ti/linalg/clapack/make.inc.ARMBLAS
++++ b/src/ti/linalg/clapack/make.inc.ARMBLAS
+@@ -23,10 +23,9 @@ PLAT = _ARMBLAS
+ # This is used to compile C libary
+ #CC        = arm-linux-gnueabihf-gcc
+ # if no wrapping of the blas library is needed, uncomment next line
+-CC        = arm-linux-gnueabihf-gcc -DNO_BLAS_WRAP
+-CFLAGS    = -O3 -I$(TOPDIR)/INCLUDE
+-LINKER    = arm-linux-gnueabihf-ld
+-LOADER    = arm-linux-gnueabihf-gcc
++CFLAGS    = -O3 -I$(TOPDIR)/INCLUDE -DNO_BLAS_WRAP
++LINKER    = $(LD)
++LOADER    = $(CC)
+ LOADOPTS  =
+ NOOPT     = -O0 -I$(TOPDIR)/INCLUDE
+ DRVCFLAGS = $(CFLAGS)
+@@ -51,9 +50,8 @@ TIMER    = INT_CPU_TIME
+ #  The archiver and the flag(s) to use when building archive (library)
+ #  If you system has no ranlib, set RANLIB = echo.
+ #
+-ARCH     = arm-linux-gnueabihf-ar
++ARCH     = $(AR)
+ ARCHFLAGS= cr
+-RANLIB   = arm-linux-gnueabihf-ranlib
+ #
+ #  The location of BLAS library for linking the testing programs.
+ #  The target's machine-specific, optimized BLAS library should be
+diff --git a/src/ti/linalg/clapack/make.inc.ARMOpenCL b/src/ti/linalg/clapack/make.inc.ARMOpenCL
+index 036b3d1..1acc421 100644
+--- a/src/ti/linalg/clapack/make.inc.ARMOpenCL
++++ b/src/ti/linalg/clapack/make.inc.ARMOpenCL
+@@ -21,12 +21,11 @@ PLAT = _ARM
+ #
+ #######################################################
+ # This is used to compile C libary
+-CC        = arm-linux-gnueabihf-gcc #-pg
+ # if no wrapping of the blas library is needed, uncomment next line
+ #CC        = arm-linux-gnueabihf-gcc -DNO_BLAS_WRAP
+ CFLAGS    = -O2 -I$(TOPDIR)/INCLUDE #-g 
+-LINKER    = arm-linux-gnueabihf-ld
+-LOADER    = arm-linux-gnueabihf-gcc
++LINKER    = $(LD)
++LOADER    = $(CC)
+ LOADOPTS  = -L$(TARGET_ROOTDIR)/lib -L$(TARGET_ROOTDIR)/usr/lib -Wl,-rpath-link,$(TARGET_ROOTDIR)/lib -Wl,-rpath-link,$(TARGET_ROOTDIR)/usr/lib
+ NOOPT     = -O0 -I$(TOPDIR)/INCLUDE
+ DRVCFLAGS = $(CFLAGS)
+@@ -51,9 +50,8 @@ TIMER    = INT_CPU_TIME
+ #  The archiver and the flag(s) to use when building archive (library)
+ #  If you system has no ranlib, set RANLIB = echo.
+ #
+-ARCH     = arm-linux-gnueabihf-ar
++ARCH     = $(AR)
+ ARCHFLAGS= cr
+-RANLIB   = arm-linux-gnueabihf-ranlib
+ #
+ #  The location of BLAS library for linking the testing programs.
+ #  The target's machine-specific, optimized BLAS library should be
+diff --git a/src/ti/linalg/make.inc b/src/ti/linalg/make.inc
+index b2e1afe..8588019 100644
+--- a/src/ti/linalg/make.inc
++++ b/src/ti/linalg/make.inc
+@@ -1,5 +1,4 @@
+-
+-CPP   = g++
++CPP = $(CXX)
+ CL6X  = cl6x -mv6600 --abi=eabi $(DSP_INCLUDE)
+ CLOCL = clocl
+ 
+@@ -7,8 +6,6 @@ LIBS  = -lOpenCL -locl_util #-lstdc++ -lrt
+ 
+ UNAME_M :=$(shell uname -m)
+ 
+-OBJCOPY = arm-linux-gnueabihf-objcopy
+-
+ ifneq (,$(findstring 86, $(UNAME_M)))
+     .DEFAULT_GOAL := cross
+ 
+@@ -29,7 +26,6 @@ ifneq (,$(findstring 86, $(UNAME_M)))
+ 
+     # gcc ARM cross compiler will not, by default, search the host's
+     # /usr/include.  Explicitly specify here to find dependent vendor headers
+-    cross: override CPP = arm-linux-gnueabihf-g++
+     cross: CPP_FLAGS += -I$(TARGET_ROOTDIR)/usr/include -idirafter /usr/include
+     #cross: CL6X_FLAGS += -I$(OMP_DIR)/packages/ti/runtime/openmp
+ 
+diff --git a/src/ti/linalg/tuning/make.inc b/src/ti/linalg/tuning/make.inc
+index cd3c653..ecce3d9 100644
+--- a/src/ti/linalg/tuning/make.inc
++++ b/src/ti/linalg/tuning/make.inc
+@@ -11,7 +11,6 @@ ifneq (,$(findstring 86, $(UNAME_M)))
+ 
+     # gcc ARM cross compiler will not, by default, search the host's
+     # /usr/include.  Explicitly specify here to find dependent vendor headers
+-    CC = arm-linux-gnueabihf-gcc
+ else
+     CC = gcc 
+ endif
+-- 
+2.7.4
+
diff --git a/meta-arago-extras/recipes-ti/linalg/linalg.inc b/meta-arago-extras/recipes-ti/linalg/linalg.inc
index 924b299..8879592 100644
--- a/meta-arago-extras/recipes-ti/linalg/linalg.inc
+++ b/meta-arago-extras/recipes-ti/linalg/linalg.inc
@@ -10,22 +10,27 @@ require recipes-ti/includes/arago-paths.inc
 require recipes-ti/includes/ti-staging.inc
 
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git;protocol=git;branch=${BRANCH} \
+file://0001-Makefile-fix-toolchain-variables.patch \
+"
 LIC_FILES_CHKSUM = "file://src/ti/linalg/docs/LINALG_1.2.0_manifest.html;md5=f30895e41e5947c3439b1ad4cf4c8555"
 SRCREV = "01960b319783b29aacf12b2a72606b28d657b78e"
 
-DEPENDS = "common-csl-ip \
-           libarch \
-           ti-xdctools \
-           ti-ipc-rtos \
-           ti-sysbios \
-           ti-cgt6x-native \
-           ti-xdais \
-           ti-framework-components \
-           libulm \
-           openmp-rtos \
-           opencl \
-           clocl-native \
+DEPENDS = " \
+common-csl-ip \
+libarch \
+ti-xdctools \
+ti-ipc-rtos \
+ti-sysbios \
+ti-cgt6x-native \
+ti-xdais \
+ti-framework-components \
+libulm \
+openmp-rtos \
+opencl \
+clocl-native \
+doxygen-native \
+zip-native \
 "
 
 export TI_OCL_INSTALL_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/opencl"
-- 
2.7.4


