Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 0036E52094
	for <meta-arago@arago-project.org>;
	Mon, 27 Mar 2017 02:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C8BB120BAC;
	Mon, 27 Mar 2017 02:10:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id e-E61CVvmPbo; Mon, 27 Mar 2017 02:10:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 53B4C208BD;
	Mon, 27 Mar 2017 02:10:55 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id B6CD616242B;
	Sun, 26 Mar 2017 22:10:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 26 Mar 2017 22:10:48 -0400
Message-Id: <1490580653-40192-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490580653-40192-1-git-send-email-denis@denix.org>
References: <1490580653-40192-1-git-send-email-denis@denix.org>
Subject: [morty/master][PATCH 3/8] gstreamer1.0-plugins-dsp66: correct use of CPP/CXX and other standard variables
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
X-List-Received-Date: Mon, 27 Mar 2017 02:10:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...rrect-use-of-CPP-CXX-and-other-standard-v.patch | 89 ++++++++++++++++++++++
 .../gstreamer1.0-plugins-dsp66_git.bb              |  4 +-
 2 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66/0001-Makefile-correct-use-of-CPP-CXX-and-other-standard-v.patch

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66/0001-Makefile-correct-use-of-CPP-CXX-and-other-standard-v.patch b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66/0001-Makefile-correct-use-of-CPP-CXX-and-other-standard-v.patch
new file mode 100644
index 0000000..3c913ed
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66/0001-Makefile-correct-use-of-CPP-CXX-and-other-standard-v.patch
@@ -0,0 +1,89 @@
+From 145964aa34bc2cbf1499de6e14de80a7c2d7e935 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Sun, 26 Mar 2017 15:12:44 -0400
+Subject: [PATCH] Makefile: correct use of CPP/CXX and other standard variables
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ src/kernels/make.inc         | 16 +++++++---------
+ src/kernels/oclconv/Makefile |  7 +++----
+ 2 files changed, 10 insertions(+), 13 deletions(-)
+
+diff --git a/src/kernels/make.inc b/src/kernels/make.inc
+index 797e64b..f1475a3 100644
+--- a/src/kernels/make.inc
++++ b/src/kernels/make.inc
+@@ -4,7 +4,6 @@ DSP_INCLUDE += -I$(TARGET_ROOTDIR)/usr/share/ti/opencl
+ TI_IMGLIB_DIR=${TARGET_ROOTDIR}/usr/share/ti/ti-imglib-c66x-tree
+ TI_VLIB_DIR=${TARGET_ROOTDIR}/usr/share/ti/ti-vlib-c66x-tree
+ 
+-CPP   = g++ 
+ CL6X  = cl6x -mv6600 --abi=eabi $(DSP_INCLUDE)
+ CLOCL = clocl
+ 
+@@ -16,9 +15,9 @@ UNAME_M :=$(shell uname -m)
+ # If TI_OCL_INSTALL is set, setup make from that location
+ # ----------------------------------------------------------------------------
+ ifneq ($(TI_OCL_INSTALL),)
+-    CPP        = g++
+-    CPP_FLAGS += -I$(TI_OCL_INSTALL)/usr/include
+-    LD_FLAGS  += -L$(TI_OCL_INSTALL)/usr/lib 
++    CXX        = g++
++    CXXFLAGS += -I$(TI_OCL_INSTALL)/usr/include
++    LDFLAGS  += -L$(TI_OCL_INSTALL)/usr/lib
+     LIBS      += -lbfd
+ 
+ # ----------------------------------------------------------------------------
+@@ -38,20 +37,19 @@ else ifneq (,$(findstring 86, $(UNAME_M)))
+ 
+     # gcc ARM cross compiler will not, by default, search the host's
+     # /usr/include.  Explicitly specify here to find dependent vendor headers
+-    cross: override CPP = arm-linux-gnueabihf-g++ 
+-    cross: CPP_FLAGS += -I$(TARGET_ROOTDIR)/usr/include -idirafter /usr/include
++    cross: CXXFLAGS += -I$(TARGET_ROOTDIR)/usr/include -idirafter /usr/include
+ 
+     # If cross-compilineg, provide path to dependent ARM libraries on the 
+     # target filesystem
+-    cross: LD_FLAGS = -L$(TARGET_ROOTDIR)/lib -L$(TARGET_ROOTDIR)/usr/lib -Wl,-rpath-link,$(TARGET_ROOTDIR)/lib -Wl,-rpath-link,$(TARGET_ROOTDIR)/usr/lib 
++    cross: LDFLAGS = -L$(TARGET_ROOTDIR)/lib -L$(TARGET_ROOTDIR)/usr/lib -Wl,-rpath-link,$(TARGET_ROOTDIR)/lib -Wl,-rpath-link,$(TARGET_ROOTDIR)/usr/lib
+ endif
+ 
+ %.o: %.cpp
+-	@$(CPP) -c $(CPP_FLAGS) $<
++	@$(CXX) -c $(CXXFLAGS) $<
+ 	@echo Compiling $<
+ 
+ %.o: %.c
+-	@$(CPP) -c $(CPP_FLAGS) $<
++	@$(CXX) -c $(CXXFLAGS) $<
+ 	@echo Compiling $<
+ 
+ %.obj: %.c
+diff --git a/src/kernels/oclconv/Makefile b/src/kernels/oclconv/Makefile
+index e271670..c3774f8 100644
+--- a/src/kernels/oclconv/Makefile
++++ b/src/kernels/oclconv/Makefile
+@@ -1,12 +1,12 @@
+ EXE         = liboclconv.so
+-CPP_FLAGS   = -O3 -shared -fPIC -L.
++CXXFLAGS   = -O3 -shared -fPIC -L.
+ CLOCL_FLAGS = 
+ include ../make.inc
+ 
+ all: ${EXE}
+ 
+-$(EXE): oclconv.o 
+-	@$(CPP) $(CPP_FLAGS) oclconv.o $(LD_FLAGS) $(LIBS) -o $@
++$(EXE): oclconv.o
++	@$(CXX) $(CXXFLAGS) oclconv.o $(LDFLAGS) $(LIBS) -o $@
+ 
+ oclconv.o: conv.dsp_h
+ 
+@@ -16,4 +16,3 @@ conv.dsp_h: conv.cl ${TI_IMGLIB_DIR}/lib/imglib.ae66 ${TI_VLIB_DIR}/packages/ti/
+ 
+ install:
+ 	  mkdir -p  ${DESTDIR}/usr/lib && install -m 755 ${EXE} ${DESTDIR}/usr/lib/.
+-
+-- 
+2.7.4
+
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb
index 6977a47..2adf47d 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://git.ti.com/processor-sdk/gst-plugin-dsp66"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2827f94fc0a1adeff4d9702e97ce2979"
 
-SRC_URI = "git://git.ti.com/processor-sdk/gst-plugin-dsp66.git;protocol=git;branch=master"
+SRC_URI = "git://git.ti.com/processor-sdk/gst-plugin-dsp66.git;protocol=git;branch=master \
+file://0001-Makefile-correct-use-of-CPP-CXX-and-other-standard-v.patch \
+"
 SRCREV = "0db24f44b49ad673bcebce5d25a63ea41551ebec"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


