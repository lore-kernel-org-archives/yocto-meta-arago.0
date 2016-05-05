Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id BD87C52AA0
	for <meta-arago@arago-project.org>;
	Thu,  5 May 2016 15:09:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u45F9A2c000520
	for <meta-arago@arago-project.org>; Thu, 5 May 2016 10:09:10 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u45F9A2v022222
	for <meta-arago@arago-project.org>; Thu, 5 May 2016 10:09:10 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 May 2016 10:09:10 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u45F99oD019774;	Thu, 5 May 2016 10:09:10 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 5 May 2016 11:09:02 -0400
Message-ID: <1462460942-14363-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1462460942-14363-1-git-send-email-j-stiffler@ti.com>
References: <1462460942-14363-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] opencl-examples: examples with openmp need to link with libdl
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
X-List-Received-Date: Thu, 05 May 2016 15:09:11 -0000
Content-Type: text/plain

* GCC 5.3 got a little more strict, and executables which link with
  libgomp, now also need to link with libdl

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 ...te-matmpy-Link-with-libdl-to-resolve-link.patch | 40 ++++++++++++++++++++++
 .../recipes-ti/ocl/opencl-examples_git.bb          |  4 ++-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl/0001-float_compute-matmpy-Link-with-libdl-to-resolve-link.patch

diff --git a/meta-arago-extras/recipes-ti/ocl/ocl/0001-float_compute-matmpy-Link-with-libdl-to-resolve-link.patch b/meta-arago-extras/recipes-ti/ocl/ocl/0001-float_compute-matmpy-Link-with-libdl-to-resolve-link.patch
new file mode 100644
index 0000000..dd13d73
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/ocl/ocl/0001-float_compute-matmpy-Link-with-libdl-to-resolve-link.patch
@@ -0,0 +1,40 @@
+From 79b7c204cafc2c96716b8e91093f135656820e16 Mon Sep 17 00:00:00 2001
+From: Jacob Stiffler <j-stiffler@ti.com>
+Date: Thu, 5 May 2016 08:35:34 -0400
+Subject: [PATCH] float_compute, matmpy: Link with libdl to resolve linking
+ error
+
+* with GCC 5.3 toolchain, linking with libgomp also requires linking
+  with libdl
+
+Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
+---
+ examples/float_compute/Makefile | 2 +-
+ examples/matmpy/Makefile        | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/examples/float_compute/Makefile b/examples/float_compute/Makefile
+index cb129f3..5514e0e 100644
+--- a/examples/float_compute/Makefile
++++ b/examples/float_compute/Makefile
+@@ -5,4 +5,4 @@ CLOCL_FLAGS =
+ include ../make.inc
+ 
+ $(EXE): main.o dsp_compute.out
+-	@$(CPP) $(CPP_FLAGS) main.o $(LD_FLAGS) $(LIBS) -o $@ -lrt
++	@$(CPP) $(CPP_FLAGS) main.o $(LD_FLAGS) $(LIBS) -o $@ -lrt -ldl
+diff --git a/examples/matmpy/Makefile b/examples/matmpy/Makefile
+index 9b20091..f9e6112 100644
+--- a/examples/matmpy/Makefile
++++ b/examples/matmpy/Makefile
+@@ -6,6 +6,6 @@ CLOCL_FLAGS =
+ include ../make.inc
+ 
+ $(EXE): main.o kernel.out
+-	@$(CPP) $(CPP_FLAGS) main.o $(LD_FLAGS) $(LIBS) -lrt -lgomp -o $@
++	@$(CPP) $(CPP_FLAGS) main.o $(LD_FLAGS) $(LIBS) -lrt -lgomp -ldl -o $@
+ 
+ kernel.out: ccode.obj 
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
index e084463..da14f1a 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
@@ -4,7 +4,9 @@ LICENSE = "BSD"
 
 include ocl.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
+
+SRC_URI_append = " file://0001-float_compute-matmpy-Link-with-libdl-to-resolve-link.patch;pnum=2"
 
 COMPATIBLE_MACHINE = "dra7xx|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.7.4


