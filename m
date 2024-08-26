Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B17ABC5472F
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 19:16:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.61246.1724699781742952338
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 26 Aug 2024 12:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6D0C340CC1;
	Mon, 26 Aug 2024 19:16:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id unrH3nKAb2My; Mon, 26 Aug 2024 19:16:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 42DC740CCC;
	Mon, 26 Aug 2024 19:16:18 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 107CF16406E;
	Mon, 26 Aug 2024 15:16:17 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Andrew Davis <afd@ti.com>
Subject: [master][PATCH 14/16] opencl: deprecate
Date: Mon, 26 Aug 2024 15:16:03 -0400
Message-Id: <20240826191605.8190-14-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826191605.8190-1-denis@denix.org>
References: <20240826191605.8190-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 26 Aug 2024 19:16:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15527

From: Denys Dmytriyenko <denys@konsulko.com>

Remove opencl components as deprecated and not maintained.

Acked-by: Andrew Davis <afd@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../conf/distro/include/branding-core.inc     |   4 -
 .../recipes-core/images/arago-image.inc       |   1 -
 ...nativesdk-packagegroup-arago-tisdk-host.bb |   1 -
 meta-arago-extras/recipes-ti/ocl/clocl_git.bb |  43 ------
 ...-resource-table-for-new-Linux-kernel.patch |  95 ------------
 meta-arago-extras/recipes-ti/ocl/ocl.inc      |  17 ---
 ...tmpy-Link-with-libdl-to-resolve-link.patch |  42 -----
 .../recipes-ti/ocl/opencl-examples_git.bb     | 144 ------------------
 .../recipes-ti/ocl/opencl-monitor-ipu_git.bb  |  64 --------
 .../recipes-ti/ocl/opencl-monitor_git.bb      | 103 -------------
 .../recipes-ti/ocl/opencl-tidl-fw_git.bb      |  39 -----
 .../recipes-ti/ocl/opencl_git.bb              |  79 ----------
 12 files changed, 632 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-ti/ocl/clocl_git.bb
 delete mode 100644 meta-arago-extras/recipes-ti/ocl/files/0001-Update-VR=
ING-in-resource-table-for-new-Linux-kernel.patch
 delete mode 100644 meta-arago-extras/recipes-ti/ocl/ocl.inc
 delete mode 100644 meta-arago-extras/recipes-ti/ocl/ocl/0001-float_compu=
te-matmpy-Link-with-libdl-to-resolve-link.patch
 delete mode 100644 meta-arago-extras/recipes-ti/ocl/opencl-examples_git.=
bb
 delete mode 100644 meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_g=
it.bb
 delete mode 100644 meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.b=
b
 delete mode 100644 meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.b=
b
 delete mode 100644 meta-arago-extras/recipes-ti/ocl/opencl_git.bb

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/me=
ta-arago-distro/conf/distro/include/branding-core.inc
index f183e3a0..1d52ed60 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -5,10 +5,6 @@
 # The policy is for the "Core" brand to be the default,
 # hence this file is mostly empty and used as a template
=20
-# Lower opencl-monitor priority for now
-ALTERNATIVE_PRIORITY:pn-opencl-monitor =3D "1"
-ALTERNATIVE_PRIORITY:pn-opencl-monitor-ipu =3D "1"
-
 # Raise priority for sample IPC FW images
 ALTERNATIVE_PRIORITY:pn-ti-ipc-rtos =3D "15"
=20
diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta=
-arago-distro/recipes-core/images/arago-image.inc
index 17325619..c4438e5c 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -23,7 +23,6 @@ SDK_PACKAGE_ARCHS +=3D "buildtools-dummy-${SDKPKGSUFFIX=
}"
=20
 BAD_RECOMMENDATIONS +=3D " \
     ti-llvm3.6-dev \
-    opencl-monitor-dev \
     libulm-dev \
     gdbserver-c6x-dev \
     coreutils \
diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packa=
gegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroup=
s/nativesdk-packagegroup-arago-tisdk-host.bb
index ccc8d380..177fa668 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup=
-arago-tisdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup=
-arago-tisdk-host.bb
@@ -10,7 +10,6 @@ PACKAGEGROUP_DISABLE_COMPLEMENTARY =3D "1"
 EXTRA_TI_TOOLS =3D " \
     nativesdk-ti-cgt6x \
     nativesdk-ti-cgt-pru \
-    nativesdk-clocl \
     nativesdk-open62541-examples \
     nativesdk-open62541-tests \
     nativesdk-gcc-arm-baremetal \
diff --git a/meta-arago-extras/recipes-ti/ocl/clocl_git.bb b/meta-arago-e=
xtras/recipes-ti/ocl/clocl_git.bb
deleted file mode 100644
index b6ad9782..00000000
--- a/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-DESCRIPTION =3D "TI OpenCL offline C compiler for compute devices"
-HOMEPAGE =3D "https://downloads.ti.com/mctools/esd/docs/opencl/index.htm=
l"
-LICENSE =3D "BSD-3-Clause"
-
-include ocl.inc
-
-PR =3D "${INC_PR}.0"
-
-DEPENDS =3D "ti-llvm3.6 ti-llvm3.6-native boost"
-
-S =3D "${WORKDIR}/git/host"
-
-export WANT_LLVM_RELEASE =3D "3.6-ti"
-
-TARGET:class-target =3D "arm"
-TARGET:class-native =3D "x86"
-TARGET:class-nativesdk =3D "x86"
-
-EXTRA_OEMAKE =3D " -C ${S}/clocl \
-                 _PRODUCT_VERSION=3D${PV} \
-                 TARGET=3D${TARGET} \
-                 LLVM_CONFIG_EXE=3D${STAGING_BINDIR_NATIVE}/llvm-config =
\
-"
-
-do_compile() {
-  oe_runmake
-}
-
-do_install() {
-  install -d ${D}${bindir}
-  install -m 755 ${S}/clocl/${TARGET}/clocl ${D}${bindir}
-}
-
-RDEPENDS:${PN} +=3D "ti-cgt6x"
-BBCLASSEXTEND =3D "native nativesdk"
-
-# Disable the "buildpaths" check while we figure out how we are
-# going to address this issue.
-#
-# The ti-llvm3.6 compiler is a custom TI compiler that has not
-# been updated for a number of years.  It does not currently
-# support reproducible builds.
-INSANE_SKIP:${PN} +=3D "buildpaths"
diff --git a/meta-arago-extras/recipes-ti/ocl/files/0001-Update-VRING-in-=
resource-table-for-new-Linux-kernel.patch b/meta-arago-extras/recipes-ti/=
ocl/files/0001-Update-VRING-in-resource-table-for-new-Linux-kernel.patch
deleted file mode 100644
index fcdb2215..00000000
--- a/meta-arago-extras/recipes-ti/ocl/files/0001-Update-VRING-in-resourc=
e-table-for-new-Linux-kernel.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-ocl: Update VRING in resource table for new Linux kernel
-
-- Mark the vring device addresses as FW_RSC_ADDR_ANY, so that Linux kern=
el
-  knows it needs to update these to the actual dynamically allocated
-  memory locations. The virtqueue driver itself will poll for the
-  completion status of this update.
-- The change is backward compatible with 4.19 kernel
-
-Upstream-Status: Submitted
-
-Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
----
- monitor/src/custom_rsc_table_tci6638.h       | 7 +++----
- monitor/src/custom_rsc_table_vayu_dsp.h      | 7 +++----
- monitor_ipu/src/custom_rsc_table_vayu_ipu1.h | 7 +++----
- 3 files changed, 9 insertions(+), 12 deletions(-)
-
-diff --git a/monitor/src/custom_rsc_table_tci6638.h b/monitor/src/custom=
_rsc_table_tci6638.h
-index db6f686..c9f3f49 100644
---- a/monitor/src/custom_rsc_table_tci6638.h
-+++ b/monitor/src/custom_rsc_table_tci6638.h
-@@ -49,8 +49,7 @@
- /* flip up bits whose indices represent features we support */
- #define RPMSG_IPU_C0_FEATURES         1
-=20
--#define RPMSG_VRING0_DA     0xA0000000
--#define RPMSG_VRING1_DA     0xA0004000
-+#define RPMSG_VRING_ADDR_ANY    FW_RSC_ADDR_ANY
-=20
- /*
-  * sizes of the virtqueues (expressed in number of buffers supported,
-@@ -112,8 +111,8 @@ struct my_resource_table ti_ipc_remoteproc_ResourceT=
able =3D {
-         /* no config data */
-     },
-     /* the two vrings */
--    { RPMSG_VRING0_DA, 4096, RPMSG_VQ0_SIZE, 1, 0 },
--    { RPMSG_VRING1_DA, 4096, RPMSG_VQ1_SIZE, 2, 0 },
-+    { RPMSG_VRING_ADDR_ANY, 4096, RPMSG_VQ0_SIZE, 1, 0 },
-+    { RPMSG_VRING_ADDR_ANY, 4096, RPMSG_VQ1_SIZE, 2, 0 },
- #endif
-=20
-     {
-diff --git a/monitor/src/custom_rsc_table_vayu_dsp.h b/monitor/src/custo=
m_rsc_table_vayu_dsp.h
-index ddcf4a5..f7fe9e7 100644
---- a/monitor/src/custom_rsc_table_vayu_dsp.h
-+++ b/monitor/src/custom_rsc_table_vayu_dsp.h
-@@ -138,8 +138,7 @@
-=20
- // Must be marked non-cached by monitor
- #define DSP_MEM_IPC_VRING       0xFFF00000
--#define DSP_MEM_RPMSG_VRING0    0xFFF00000
--#define DSP_MEM_RPMSG_VRING1    0xFFF04000
-+#define RPMSG_VRING_ADDR_ANY    FW_RSC_ADDR_ANY
- #define DSP_MEM_VRING_BUFS0     0xFFF40000
- #define DSP_MEM_VRING_BUFS1     0xFFF80000
-=20
-@@ -272,8 +271,8 @@ struct my_resource_table ti_ipc_remoteproc_ResourceT=
able =3D {
-         /* no config data */
-     },
-     /* the two vrings */
--    { DSP_MEM_RPMSG_VRING0, 4096, DSP_RPMSG_VQ0_SIZE, 1, 0 },
--    { DSP_MEM_RPMSG_VRING1, 4096, DSP_RPMSG_VQ1_SIZE, 2, 0 },
-+    { RPMSG_VRING_ADDR_ANY, 4096, DSP_RPMSG_VQ0_SIZE, 1, 0 },
-+    { RPMSG_VRING_ADDR_ANY, 4096, DSP_RPMSG_VQ1_SIZE, 2, 0 },
-=20
-     {
-         TYPE_CARVEOUT,
-diff --git a/monitor_ipu/src/custom_rsc_table_vayu_ipu1.h b/monitor_ipu/=
src/custom_rsc_table_vayu_ipu1.h
-index b06ab86..ab80089 100644
---- a/monitor_ipu/src/custom_rsc_table_vayu_ipu1.h
-+++ b/monitor_ipu/src/custom_rsc_table_vayu_ipu1.h
-@@ -96,8 +96,7 @@
-=20
- #define IPU_MEM_IPC_VRING       0x60000000
- #define IPU_PHYS_MEM_IPC_VRING  0x9D000000
--#define IPU_MEM_RPMSG_VRING0    0x60000000
--#define IPU_MEM_RPMSG_VRING1    0x60004000
-+#define RPMSG_VRING_ADDR_ANY    FW_RSC_ADDR_ANY
-=20
- /*
-  * Sizes of the virtqueues (expressed in number of buffers supported,
-@@ -206,8 +205,8 @@ struct my_resource_table ti_ipc_remoteproc_ResourceT=
able =3D {
-         /* no config data */
-     },
-     /* the two vrings */
--    { IPU_MEM_RPMSG_VRING0, 4096, IPU_RPMSG_VQ0_SIZE, 1, 0 },
--    { IPU_MEM_RPMSG_VRING1, 4096, IPU_RPMSG_VQ1_SIZE, 2, 0 },
-+    { RPMSG_VRING_ADDR_ANY, 4096, IPU_RPMSG_VQ0_SIZE, 1, 0 },
-+    { RPMSG_VRING_ADDR_ANY, 4096, IPU_RPMSG_VQ1_SIZE, 2, 0 },
-=20
-     {
-         TYPE_CARVEOUT,
---=20
-2.17.1
-
diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras=
/recipes-ti/ocl/ocl.inc
deleted file mode 100644
index 9a9231a8..00000000
--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-# patch version at the end needs to be in double digits
-PV =3D "1.2.00.02"
-INC_PR =3D "r0"
-
-LIC_FILES_CHKSUM =3D "file://../debian/copyright;md5=3D2e3965a73a8a49c23=
836467266120dff"
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/ocl:"
-
-OCL_GIT_URI =3D "git://git.ti.com/git/opencl/ti-opencl.git"
-OCL_GIT_PROTOCOL =3D "https"
-OCL_GIT_BRANCH =3D "master"
-
-OCL_SRCREV =3D "b1dfed9af21a1236380b9d643c432e4f0c619fce"
-
-BRANCH =3D "${OCL_GIT_BRANCH}"
-SRC_URI =3D "${OCL_GIT_URI};protocol=3D${OCL_GIT_PROTOCOL};branch=3D${BR=
ANCH}"
-SRCREV =3D "${OCL_SRCREV}"
diff --git a/meta-arago-extras/recipes-ti/ocl/ocl/0001-float_compute-matm=
py-Link-with-libdl-to-resolve-link.patch b/meta-arago-extras/recipes-ti/o=
cl/ocl/0001-float_compute-matmpy-Link-with-libdl-to-resolve-link.patch
deleted file mode 100644
index 43bc9900..00000000
--- a/meta-arago-extras/recipes-ti/ocl/ocl/0001-float_compute-matmpy-Link=
-with-libdl-to-resolve-link.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 79b7c204cafc2c96716b8e91093f135656820e16 Mon Sep 17 00:00:00 2001
-From: Jacob Stiffler <j-stiffler@ti.com>
-Date: Thu, 5 May 2016 08:35:34 -0400
-Subject: [PATCH] float_compute, matmpy: Link with libdl to resolve linki=
ng
- error
-
-* with GCC 5.3 toolchain, linking with libgomp also requires linking
-  with libdl
-
-Upstream-Status: Pending
-
-Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
----
- examples/float_compute/Makefile | 2 +-
- examples/matmpy/Makefile        | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/examples/float_compute/Makefile b/examples/float_compute/Ma=
kefile
-index cb129f3..5514e0e 100644
---- a/examples/float_compute/Makefile
-+++ b/examples/float_compute/Makefile
-@@ -5,4 +5,4 @@ CLOCL_FLAGS =3D
- include ../make.inc
-=20
- $(EXE): main.o dsp_compute.out
--	@$(CPP) $(CPP_FLAGS) main.o $(LD_FLAGS) $(LIBS) -o $@ -lrt
-+	@$(CPP) $(CPP_FLAGS) main.o $(LD_FLAGS) $(LIBS) -o $@ -lrt -ldl
-diff --git a/examples/matmpy/Makefile b/examples/matmpy/Makefile
-index 9b20091..f9e6112 100644
---- a/examples/matmpy/Makefile
-+++ b/examples/matmpy/Makefile
-@@ -6,6 +6,6 @@ CLOCL_FLAGS =3D
- include ../make.inc
-=20
- $(EXE): main.o kernel.out
--	@$(CPP) $(CPP_FLAGS) main.o $(LD_FLAGS) $(LIBS) -lrt -lgomp -o $@
-+	@$(CPP) $(CPP_FLAGS) main.o $(LD_FLAGS) $(LIBS) -lrt -lgomp -ldl -o $@
-=20
- kernel.out: ccode.obj=20
---=20
-1.9.1
-
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/me=
ta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
deleted file mode 100644
index 98b6b64d..00000000
--- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
+++ /dev/null
@@ -1,144 +0,0 @@
-SUMMARY =3D "TI OpenCL example applications"
-HOMEPAGE =3D "https://downloads.ti.com/mctools/esd/docs/opencl/index.htm=
l"
-LICENSE =3D "BSD-3-Clause"
-
-include ocl.inc
-require recipes-ti/includes/ti-paths.inc
-
-PR =3D "${INC_PR}.1"
-
-COMPATIBLE_MACHINE =3D "dra7xx"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-DEPENDS =3D "opencl opencl-monitor ti-cgt6x-native clocl-native"
-
-OCL_PERSISTENT_DEPENDS =3D "ti-xdctools-native ti-ipc-rtos ti-sysbios"
-
-DEPENDS:append:dra7xx =3D " ${OCL_PERSISTENT_DEPENDS}"
-
-# Split examples into two groups:
-# - offline-compile: examples who's kernels are precompiled (offline).
-# - runtime-compile: examples who's kernels are compiled during runtime.
-PACKAGES =3D+ "${PN}-runtime-compile ${PN}-runtime-compile-dbg ${PN}-off=
line-compile ${PN}-offline-compile-dbg"
-
-RDEPENDS:${PN} =3D "${PN}-runtime-compile ${PN}-offline-compile"
-RDEPENDS:${PN}-dev +=3D "libgomp-dev"
-RDEPENDS:${PN}-offline-compile +=3D "opencl-runtime"
-RDEPENDS:${PN}-runtime-compile +=3D "opencl"
-
-S =3D "${WORKDIR}/git/opencl_example_src"
-B =3D "${S}"
-
-OCL_RUNTIME_COMPILE_EXAMPLE_LIST =3D " \
-    ccode \
-    null \
-    ooo_callback \
-    simple \
-    vecadd \
-    vecadd_openmp \
-    vecadd_openmp_t \
-    vecadd_subdevice \
-"
-
-OCL_EXAMPLE_LIST =3D " abort_exit \
-                     buffer \
-                     ccode \
-                     conv1d \
-                     dgemm \
-                     dspheap \
-                     dsplib_fft \
-                     edmamgr \
-                     float_compute \
-                     matmpy \
-                     monte_carlo \
-                     null \
-                     offline \
-                     offline_embed \
-                     ooo_callback \
-                     platforms \
-                     sgemm \
-                     simple \
-                     timeout \
-                     vecadd \
-                     vecadd_openmp \
-                     vecadd_openmp_t \
-                     vecadd_subdevice \
-"
-
-OCL_PERSISTENT_EXAMPLE_LIST =3D " persistent_clock_concurrent \
-                                persistent_clock_spanning \
-                                persistent_common \
-                                persistent_kernel_timeout \
-                                persistent_messageq_concurrent \
-                                persistent_task_concurrent \
-                                persistent_task_spanning \
-"
-
-OCL_EXAMPLE_LIST:append:dra7xx =3D " ${OCL_PERSISTENT_EXAMPLE_LIST}"
-
-OCL_MPAX_EXAMPLE_LIST =3D " vecadd_mpax \
-                          vecadd_mpax_openmp \
-"
-
-python do_unpack:append() {
-    s =3D d.getVar("S")
-    os.makedirs(s)
-}
-
-python do_patch:append() {
-    import shutil
-    git_dir =3D d.expand("${WORKDIR}/git/examples")
-    s =3D d.getVar("S")
-    shutil.copy(os.path.join(git_dir,"Makefile"),s)
-    shutil.copy(os.path.join(git_dir,"make.inc"),s)
-    for example in d.getVar("OCL_EXAMPLE_LIST").split():
-        shutil.copytree(os.path.join(git_dir,example), os.path.join(s,ex=
ample))
-}
-
-
-EXTRA_OEMAKE =3D " TARGET_ROOTDIR=3D${STAGING_DIR_HOST} \
-                 TI_OCL_CGT_INSTALL=3D${STAGING_DIR_NATIVE}/usr/share/ti=
/cgt-c6x \
-"
-
-export XDC_DIR =3D "${XDC_INSTALL_DIR}/packages"
-export IPC_DIR =3D "${IPC_INSTALL_DIR}/packages"
-export BIOS_DIR =3D "${SYSBIOS_INSTALL_DIR}/packages"
-
-do_install() {
-    install -d ${D}${datadir}/ti/examples/opencl
-
-    install ${B}/Makefile ${D}${datadir}/ti/examples/opencl
-    install ${B}/make.inc ${D}${datadir}/ti/examples/opencl
-
-    for ocl_example in ${OCL_EXAMPLE_LIST}; do
-        install -d ${D}${datadir}/ti/examples/opencl/${ocl_example}
-        cp -rv ${B}/${ocl_example}/* ${D}${datadir}/ti/examples/opencl/$=
{ocl_example}
-    done
-}
-
-# First package the examples which require run-time kernel compilation.
-FILES:${PN}-runtime-compile +=3D "\
-    ${@' '.join(['${datadir}/ti/examples/opencl/' + example for example =
in d.getVar('OCL_RUNTIME_COMPILE_EXAMPLE_LIST').split()])} \
-"
-
-FILES:${PN}-runtime-compile-dbg +=3D "\
-    ${@' '.join(['${datadir}/ti/examples/opencl/' + example + '/.debug' =
for example in d.getVar('OCL_RUNTIME_COMPILE_EXAMPLE_LIST').split()])} \
-"
-
-# Remaining examples will fall through to the "offline" package.
-FILES:${PN}-offline-compile +=3D "\
-    ${datadir}/ti/examples/opencl/ \
-"
-
-FILES:${PN}-offline-compile-dbg +=3D "\
-    ${datadir}/ti/examples/opencl/*/.debug \
-"
-
-# Add makefiles to dev package
-FILES:${PN}-dev =3D "${datadir}/ti/examples/opencl/Makefile \
-                   ${datadir}/ti/examples/opencl/make.inc"
-
-ALLOW_EMPTY:${PN} =3D "1"
-INSANE_SKIP:${PN} =3D "arch ldflags textrel staticdev"
-INSANE_SKIP:${PN}-offline-compile =3D "arch ldflags textrel staticdev"
-INSANE_SKIP:${PN}-runtime-compile =3D "arch ldflags textrel staticdev"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb b=
/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
deleted file mode 100644
index 4ec9a547..00000000
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
+++ /dev/null
@@ -1,64 +0,0 @@
-DESCRIPTION =3D "TI OpenCL M4/IPU device firmware for AM57x"
-HOMEPAGE =3D "https://downloads.ti.com/mctools/esd/docs/opencl/index.htm=
l"
-LICENSE =3D "BSD-3-Clause"
-
-include ocl.inc
-require recipes-ti/includes/arago-paths.inc
-
-PR =3D "${INC_PR}.1"
-SRC_URI +=3D "file://0001-Update-VRING-in-resource-table-for-new-Linux-k=
ernel.patch;patchdir=3D.."
-
-inherit update-alternatives
-
-DEPENDS =3D " common-csl-ip-rtos \
-            pm-lld-rtos \
-            ti-xdctools-native \
-            ti-ipc-rtos \
-            ti-sysbios \
-            ti-pdk-build-rtos \
-            ti-cgt-arm-native \
-            util-linux-native \
-            opencl-tidl-fw \
-"
-
-COMPATIBLE_MACHINE =3D "dra7xx"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-S =3D "${WORKDIR}/git/monitor_ipu"
-
-export IPC_DIR =3D "${IPC_INSTALL_DIR}"
-export BIOS_DIR =3D "${SYSBIOS_INSTALL_DIR}"
-export PDK_DIR =3D "${PDK_INSTALL_DIR}"
-export XDC_DIR =3D "${XDC_INSTALL_DIR}"
-export TI_OCL_M4_CGT_INSTALL =3D "${STAGING_DIR_NATIVE}/usr/share/ti/ti-=
cgt-arm"
-export CSL_LIB_M4 =3D "${PDK_DIR}/packages/ti/csl/lib/am572x/m4/release/=
ti.csl.aem4"
-export PM_HAL_LIB_M4 =3D "$(PDK_DIR)/packages/ti/drv/pm/lib/am572x/m4/re=
lease/pm_hal.aem4"
-export OCL_TIDL_FW_DIR =3D "${OCL_TIDL_FW_INSTALL_DIR}"
-export OCL_FPERMS =3D "664"
-export OCL_DPERMS =3D "775"
-
-EXTRA_OEMAKE +=3D " BUILD_AM57=3D1 \
-                  WORKING_DIRECTORY=3D${S} \
-"
-
-do_compile() {
-  oe_runmake -f Makefile
-}
-
-do_install() {
-    install -m ${OCL_DPERMS} -d ${D}${base_libdir}/firmware
-    install -m ${OCL_FPERMS} bin/release/server_ipu1.xem4 ${D}${base_lib=
dir}/firmware/dra7-ipu1-fw.xem4.opencl-monitor
-}
-
-ALTERNATIVE:${PN} =3D "dra7-ipu1-fw.xem4"
-ALTERNATIVE_LINK_NAME[dra7-ipu1-fw.xem4] =3D "${base_libdir}/firmware/dr=
a7-ipu1-fw.xem4"
-ALTERNATIVE_TARGET[dra7-ipu1-fw.xem4] =3D "${base_libdir}/firmware/dra7-=
ipu1-fw.xem4.opencl-monitor"
-ALTERNATIVE_PRIORITY =3D "100"
-
-MONITOR_IPU_FIRMWARE =3D "${base_libdir}/firmware/dra7-ipu1-fw.*"
-
-FILES:${PN} +=3D " \
-    ${MONITOR_IPU_FIRMWARE} \
-"
-
-INSANE_SKIP:${PN} =3D "arch"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/met=
a-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
deleted file mode 100644
index c5bfe36a..00000000
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ /dev/null
@@ -1,103 +0,0 @@
-DESCRIPTION =3D "TI OpenCL compute device firmware"
-HOMEPAGE =3D "https://downloads.ti.com/mctools/esd/docs/opencl/index.htm=
l"
-LICENSE =3D "BSD-3-Clause"
-
-include ocl.inc
-require recipes-ti/includes/arago-paths.inc
-
-inherit features_check
-
-REQUIRED_MACHINE_FEATURES =3D "dsp"
-REQUIRED_DISTRO_FEATURES =3D "opencl openmp"
-
-PR =3D "${INC_PR}.2"
-SRC_URI +=3D "file://0001-Update-VRING-in-resource-table-for-new-Linux-k=
ernel.patch;patchdir=3D.."
-
-inherit update-alternatives
-
-DEPENDS =3D " ti-llvm3.6-native \
-            common-csl-ip-rtos \
-            ti-xdctools-native \
-            ti-ipc-rtos \
-            ti-sysbios \
-            ti-cgt6x-native \
-            edma3-lld-rtos \
-            ti-xdais \
-            ti-framework-components \
-            libulm \
-            gdbserver-c6x \
-            libaet \
-            openmp-rtos \
-"
-
-DEPENDS:append:dra7xx =3D " opencl-tidl-fw \
-"
-
-COMPATIBLE_MACHINE =3D "dra7xx"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-S =3D "${WORKDIR}/git/monitor"
-
-BUILD_TARGET:dra7xx =3D "ARM_AM57"
-
-export TI_OCL_CGT_INSTALL =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6=
x"
-export PDK_DIR =3D "${PDK_INSTALL_DIR}"
-export IPC_DIR =3D "${IPC_INSTALL_DIR}"
-export XDC_DIR =3D "${XDC_INSTALL_DIR}"
-export BIOS_DIR =3D "${SYSBIOS_INSTALL_DIR}"
-export EDMA3LLD_DIR =3D "${EDMA3_LLD_INSTALL_DIR}"
-export XDAIS_DIR =3D "${XDAIS_INSTALL_DIR}"
-export FC_DIR =3D "${FC_INSTALL_DIR}"
-export MPM_DIR =3D "${MPM_INSTALL_DIR}"
-export OMP_DIR =3D "${OMP_INSTALL_DIR}"
-export ULM_DIR =3D"${STAGING_DIR_TARGET}/usr/share/ti/ulm"
-export GDB_SERVER_DIR =3D "${STAGING_DIR_TARGET}/usr/share/ti/gdbc6x"
-export AET_DIR =3D "${STAGING_DIR_TARGET}/usr/share/ti/ctoolslib/aet"
-export X86_LLVM_DIR =3D "${STAGING_DIR_NATIVE}/usr"
-export XDCPATH =3D "${S};${IPC_DIR}/packages;${BIOS_DIR}/packages;${EDMA=
3LLD_DIR}/packages;${FC_DIR}/packages;${XDAIS_DIR}/packages"
-export OCL_TIDL_FW_DIR =3D "${OCL_TIDL_FW_INSTALL_DIR}"
-export OCL_FPERMS =3D "664"
-export OCL_DPERMS =3D "775"
-export SHARE_PATH=3D"${D}${datadir}/ti/opencl"
-
-EXTRA_OEMAKE +=3D " BUILD_OS=3Dlinux \
-                  WORKING_DIRECTORY=3D${S} \
-                  BUILD_TARGET=3D${BUILD_TARGET} \
-"
-do_compile() {
-  oe_runmake -f Makefile
-}
-
-do_install() {
-    install -m ${OCL_DPERMS} -d ${SHARE_PATH}
-}
-
-install_dsp_objs() {
-    install -m ${OCL_FPERMS} monitor_${1}/dsp0.out ${SHARE_PATH}/dsp.out
-    install -m ${OCL_FPERMS} monitor_${1}/dsp0.syms.obj ${SHARE_PATH}/ds=
p_syms.obj
-    install -m ${OCL_FPERMS} monitor_${1}/dsp0.syms ${SHARE_PATH}/dsp.sy=
ms
-}
-
-do_install:append:dra7xx() {
-    install_dsp_objs am57x
-    install -m ${OCL_DPERMS} -d ${D}${base_libdir}/firmware
-    install -m ${OCL_FPERMS} monitor_am57x/dsp0.out ${D}${base_libdir}/f=
irmware/dra7-dsp1-fw.xe66.${BPN}
-    install -m ${OCL_FPERMS} monitor_am57x/dsp1.out ${D}${base_libdir}/f=
irmware/dra7-dsp2-fw.xe66.${BPN}
-}
-
-ALTERNATIVE:${PN}:dra7xx =3D "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66"
-ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] =3D "${base_libdir}/firmware/dr=
a7-dsp1-fw.xe66"
-ALTERNATIVE_TARGET[dra7-dsp1-fw.xe66] =3D "${base_libdir}/firmware/dra7-=
dsp1-fw.xe66.${BPN}"
-ALTERNATIVE_LINK_NAME[dra7-dsp2-fw.xe66] =3D "${base_libdir}/firmware/dr=
a7-dsp2-fw.xe66"
-ALTERNATIVE_TARGET[dra7-dsp2-fw.xe66] =3D "${base_libdir}/firmware/dra7-=
dsp2-fw.xe66.${BPN}"
-ALTERNATIVE_PRIORITY =3D "100"
-
-MONITOR_FIRMWARE =3D ""
-MONITOR_FIRMWARE:dra7xx =3D "${base_libdir}/firmware/*"
-
-FILES:${PN} +=3D " \
-    ${datadir}/ti/opencl/* \
-    ${MONITOR_FIRMWARE} \
-"
-
-INSANE_SKIP:${PN} =3D "arch"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb b/met=
a-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
deleted file mode 100644
index 46796147..00000000
--- a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY =3D "OpenCL TIDL firmware for AM57xx"
-
-LICENSE =3D "TI-TFL"
-LIC_FILES_CHKSUM =3D "file://LICENSE.ti;md5=3D082a028431c455252c1e1d3d10=
21d382"
-
-PV =3D "01.02.00.01"
-PR =3D "r0"
-
-require recipes-ti/includes/arago-paths.inc
-
-COMPATIBLE_MACHINE =3D "dra7xx"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-GIT_URI      =3D "git://git.ti.com/git/opencl/opencl-firmware.git"
-GIT_PROTOCOL =3D "https"
-BRANCH       =3D "master"
-SRCREV       =3D "9e3d0b34f604203f275fba4807481a8a763a4f63"
-
-SRC_URI      =3D "${GIT_URI};protocol=3D${GIT_PROTOCOL};branch=3D${BRANC=
H}"
-
-S =3D "${WORKDIR}/git"
-
-TARGET =3D "eve_firmware.bin ocl_tidl_dsp.lib"
-
-do_install() {
-    install -d ${D}${OCL_TIDL_FW_INSTALL_DIR_RECIPE}
-    for f in ${TARGET}; do
-	install -m 0644 ${S}/$f ${D}${OCL_TIDL_FW_INSTALL_DIR_RECIPE}/$f
-    done
-}
-
-FILES:${PN} +=3D "${OCL_TIDL_FW_INSTALL_DIR_RECIPE}"
-
-INSANE_SKIP:${PN} =3D "arch"
-
-INHIBIT_PACKAGE_STRIP =3D "1"
-INHIBIT_SYSROOT_STRIP =3D "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-=
extras/recipes-ti/ocl/opencl_git.bb
deleted file mode 100644
index 0bdbed7e..00000000
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ /dev/null
@@ -1,79 +0,0 @@
-DESCRIPTION =3D "TI OpenCL host runtime and development packages"
-HOMEPAGE =3D "https://downloads.ti.com/mctools/esd/docs/opencl/index.htm=
l"
-LICENSE =3D "BSD-3-Clause"
-
-include ocl.inc
-
-PR =3D "${INC_PR}.3"
-
-inherit cmake systemd
-
-COMPATIBLE_MACHINE =3D "dra7xx"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-# Define runtime package for minimal dependencies to run opencl applicat=
ions
-# which precompile the offloaded kernels. The base package will provide =
the
-# ability to compile kernels (clocl) during runtime.
-PACKAGES =3D+ "${PN}-runtime"
-
-MONITORS                      =3D " opencl-monitor"
-MONITORS:append:dra7xx        =3D " opencl-monitor-ipu"
-
-DEPENDS =3D " virtual/libgl \
-            ${MONITORS} \
-            cmake-native \
-            cmem \
-            ti-llvm3.6 \
-            ti-llvm3.6-native \
-            binutils \
-            sqlite3 \
-            libffi \
-            boost \
-            boost-native \
-            libloki \
-            pkgconfig-native \
-            libulm \
-            elfutils \
-            json-c \
-"
-
-DEPENDS:append:dra7xx =3D " ti-ipc virtual/kernel"
-
-RDEPENDS:${PN}-runtime +=3D "bash ${MONITORS}"
-RDEPENDS:${PN}-dev +=3D "virtual-libgl-dev"
-RDEPENDS:${PN} +=3D "${PN}-runtime clocl bash"
-
-# Use main package to pull in full support
-ALLOW_EMPTY:${PN} =3D "1"
-
-S =3D "${WORKDIR}/git/host"
-
-export WANT_LLVM_RELEASE =3D "3.6-ti"
-
-OCL_BUILD_TARGET:dra7xx =3D "ARM_AM57"
-
-ENABLE_ULM =3D "1"
-SHMEM_MANAGER =3D "CMEM"
-
-EXTRA_OECMAKE +=3D " -DBUILD_TARGET=3D${OCL_BUILD_TARGET} -DBUILD_OUTPUT=
=3Dlib -DENABLE_ULM=3D${ENABLE_ULM} -DOCL_VERSION=3D${PV} -DSHMEM_MANAGER=
=3D${SHMEM_MANAGER}"
-
-EXTRA_OEMAKE +=3D "KERNEL_INSTALL_DIR=3D${STAGING_KERNEL_DIR} LINUX_DEVK=
IT_ROOT=3D${STAGING_DIR_HOST}"
-export KERNEL_INSTALL_DIR =3D "${STAGING_KERNEL_DIR}"
-
-MCTD =3D ""
-MCTD:dra7xx =3D "${S}/mct-daemon/ti-mct-daemon.service.am57x"
-
-do_install:append() {
-    install -d ${D}${systemd_system_unitdir}
-    install -m0644 ${MCTD} ${D}${systemd_system_unitdir}/ti-mct-daemon.s=
ervice
-}
-
-SYSTEMD_PACKAGES =3D "${PN}-runtime"
-SYSTEMD_SERVICE:${PN}-runtime =3D "ti-mct-daemon.service"
-SYSTEMD_AUTO_ENABLE:${PN}-runtime =3D "${@oe.utils.conditional("RESERVE_=
CMEM", "1", "enable", "disable", d)}"
-
-FILES:${PN}-runtime +=3D "${bindir} ${systemd_system_unitdir} ${sysconfd=
ir}/ti-mctd ${libdir}/lib*${SOLIBS}"
-
-FILES:${PN} +=3D " \
-    ${datadir}/ti/opencl/* \
-"
--=20
2.25.1


