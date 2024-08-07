Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A7DC52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 13:15:29 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.33229.1723036526521505537
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Aug 2024 06:15:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=l5NOrmNo;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 477DFLAd098966;
	Wed, 7 Aug 2024 08:15:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723036521;
	bh=VMTkjMgAThgldb3TuhHu7DTnlifPqQN05T6TTctOq/k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=l5NOrmNoSA2mv3S/ldaoF65C0FymjXEDGI/KtJEiH3J8p1UjX9ZoeL7lpMUUgocFN
	 HiMsYDiOiRRjEJxKbFgqXtnD8Ivivt8zZIkY2DIRllEtLmxHhN+BQWQd2s08ru8dJK
	 9/8xYadzIN30VmCD2BRoo/1yh+d0hUoLcu0Bybv8=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 477DFLNh109765
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Aug 2024 08:15:21 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Aug 2024 08:15:21 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Aug 2024 08:15:21 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 477DFK3X122419;
	Wed, 7 Aug 2024 08:15:21 -0500
Message-ID: <71670cda-bd9d-43e3-bc42-9c501feb2382@ti.com>
Date: Wed, 7 Aug 2024 08:15:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master][RFC PATCH 14/16] opencl: deprecate
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20240805043713.172555-1-denis@denix.org>
 <20240805043713.172555-14-denis@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20240805043713.172555-14-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Aug 2024 13:15:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15506

On 8/4/24 11:37 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Remove opencl components as deprecated and not maintained.
> 

Sad to see this go. I do have some of this working again locally,
but it requires pulling back in all the PDK build infra into meta-ti.
So no good reason to have this in meta-arago if it cannot be built
currently.

If DSP programming support ever does reemerge, the low level interfaces
like OpenMP/OpenCL and compilers would probably belong in meta-ti IMHO.
So either way, for removing this from meta-arago,

Acked-by: Andrew Davis <afd@ti.com>

> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   .../conf/distro/include/branding-core.inc     |   4 -
>   .../recipes-core/images/arago-image.inc       |   1 -
>   ...nativesdk-packagegroup-arago-tisdk-host.bb |   1 -
>   meta-arago-extras/recipes-ti/ocl/clocl_git.bb |  43 ------
>   ...-resource-table-for-new-Linux-kernel.patch |  95 ------------
>   meta-arago-extras/recipes-ti/ocl/ocl.inc      |  17 ---
>   ...tmpy-Link-with-libdl-to-resolve-link.patch |  42 -----
>   .../recipes-ti/ocl/opencl-examples_git.bb     | 144 ------------------
>   .../recipes-ti/ocl/opencl-monitor-ipu_git.bb  |  64 --------
>   .../recipes-ti/ocl/opencl-monitor_git.bb      | 103 -------------
>   .../recipes-ti/ocl/opencl-tidl-fw_git.bb      |  39 -----
>   .../recipes-ti/ocl/opencl_git.bb              |  79 ----------
>   12 files changed, 632 deletions(-)
>   delete mode 100644 meta-arago-extras/recipes-ti/ocl/clocl_git.bb
>   delete mode 100644 meta-arago-extras/recipes-ti/ocl/files/0001-Update-VRING-in-resource-table-for-new-Linux-kernel.patch
>   delete mode 100644 meta-arago-extras/recipes-ti/ocl/ocl.inc
>   delete mode 100644 meta-arago-extras/recipes-ti/ocl/ocl/0001-float_compute-matmpy-Link-with-libdl-to-resolve-link.patch
>   delete mode 100644 meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
>   delete mode 100644 meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
>   delete mode 100644 meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
>   delete mode 100644 meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
>   delete mode 100644 meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
> index f183e3a0..1d52ed60 100644
> --- a/meta-arago-distro/conf/distro/include/branding-core.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-core.inc
> @@ -5,10 +5,6 @@
>   # The policy is for the "Core" brand to be the default,
>   # hence this file is mostly empty and used as a template
>   
> -# Lower opencl-monitor priority for now
> -ALTERNATIVE_PRIORITY:pn-opencl-monitor = "1"
> -ALTERNATIVE_PRIORITY:pn-opencl-monitor-ipu = "1"
> -
>   # Raise priority for sample IPC FW images
>   ALTERNATIVE_PRIORITY:pn-ti-ipc-rtos = "15"
>   
> diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
> index 17325619..c4438e5c 100644
> --- a/meta-arago-distro/recipes-core/images/arago-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
> @@ -23,7 +23,6 @@ SDK_PACKAGE_ARCHS += "buildtools-dummy-${SDKPKGSUFFIX}"
>   
>   BAD_RECOMMENDATIONS += " \
>       ti-llvm3.6-dev \
> -    opencl-monitor-dev \
>       libulm-dev \
>       gdbserver-c6x-dev \
>       coreutils \
> diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
> index ccc8d380..177fa668 100644
> --- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
> +++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
> @@ -10,7 +10,6 @@ PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
>   EXTRA_TI_TOOLS = " \
>       nativesdk-ti-cgt6x \
>       nativesdk-ti-cgt-pru \
> -    nativesdk-clocl \
>       nativesdk-open62541-examples \
>       nativesdk-open62541-tests \
>       nativesdk-gcc-arm-baremetal \
> diff --git a/meta-arago-extras/recipes-ti/ocl/clocl_git.bb b/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
> deleted file mode 100644
> index b6ad9782..00000000
> --- a/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -DESCRIPTION = "TI OpenCL offline C compiler for compute devices"
> -HOMEPAGE = "https://downloads.ti.com/mctools/esd/docs/opencl/index.html"
> -LICENSE = "BSD-3-Clause"
> -
> -include ocl.inc
> -
> -PR = "${INC_PR}.0"
> -
> -DEPENDS = "ti-llvm3.6 ti-llvm3.6-native boost"
> -
> -S = "${WORKDIR}/git/host"
> -
> -export WANT_LLVM_RELEASE = "3.6-ti"
> -
> -TARGET:class-target = "arm"
> -TARGET:class-native = "x86"
> -TARGET:class-nativesdk = "x86"
> -
> -EXTRA_OEMAKE = " -C ${S}/clocl \
> -                 _PRODUCT_VERSION=${PV} \
> -                 TARGET=${TARGET} \
> -                 LLVM_CONFIG_EXE=${STAGING_BINDIR_NATIVE}/llvm-config \
> -"
> -
> -do_compile() {
> -  oe_runmake
> -}
> -
> -do_install() {
> -  install -d ${D}${bindir}
> -  install -m 755 ${S}/clocl/${TARGET}/clocl ${D}${bindir}
> -}
> -
> -RDEPENDS:${PN} += "ti-cgt6x"
> -BBCLASSEXTEND = "native nativesdk"
> -
> -# Disable the "buildpaths" check while we figure out how we are
> -# going to address this issue.
> -#
> -# The ti-llvm3.6 compiler is a custom TI compiler that has not
> -# been updated for a number of years.  It does not currently
> -# support reproducible builds.
> -INSANE_SKIP:${PN} += "buildpaths"
> diff --git a/meta-arago-extras/recipes-ti/ocl/files/0001-Update-VRING-in-resource-table-for-new-Linux-kernel.patch b/meta-arago-extras/recipes-ti/ocl/files/0001-Update-VRING-in-resource-table-for-new-Linux-kernel.patch
> deleted file mode 100644
> index fcdb2215..00000000
> --- a/meta-arago-extras/recipes-ti/ocl/files/0001-Update-VRING-in-resource-table-for-new-Linux-kernel.patch
> +++ /dev/null
> @@ -1,95 +0,0 @@
> -ocl: Update VRING in resource table for new Linux kernel
> -
> -- Mark the vring device addresses as FW_RSC_ADDR_ANY, so that Linux kernel
> -  knows it needs to update these to the actual dynamically allocated
> -  memory locations. The virtqueue driver itself will poll for the
> -  completion status of this update.
> -- The change is backward compatible with 4.19 kernel
> -
> -Upstream-Status: Submitted
> -
> -Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ----
> - monitor/src/custom_rsc_table_tci6638.h       | 7 +++----
> - monitor/src/custom_rsc_table_vayu_dsp.h      | 7 +++----
> - monitor_ipu/src/custom_rsc_table_vayu_ipu1.h | 7 +++----
> - 3 files changed, 9 insertions(+), 12 deletions(-)
> -
> -diff --git a/monitor/src/custom_rsc_table_tci6638.h b/monitor/src/custom_rsc_table_tci6638.h
> -index db6f686..c9f3f49 100644
> ---- a/monitor/src/custom_rsc_table_tci6638.h
> -+++ b/monitor/src/custom_rsc_table_tci6638.h
> -@@ -49,8 +49,7 @@
> - /* flip up bits whose indices represent features we support */
> - #define RPMSG_IPU_C0_FEATURES         1
> -
> --#define RPMSG_VRING0_DA     0xA0000000
> --#define RPMSG_VRING1_DA     0xA0004000
> -+#define RPMSG_VRING_ADDR_ANY    FW_RSC_ADDR_ANY
> -
> - /*
> -  * sizes of the virtqueues (expressed in number of buffers supported,
> -@@ -112,8 +111,8 @@ struct my_resource_table ti_ipc_remoteproc_ResourceTable = {
> -         /* no config data */
> -     },
> -     /* the two vrings */
> --    { RPMSG_VRING0_DA, 4096, RPMSG_VQ0_SIZE, 1, 0 },
> --    { RPMSG_VRING1_DA, 4096, RPMSG_VQ1_SIZE, 2, 0 },
> -+    { RPMSG_VRING_ADDR_ANY, 4096, RPMSG_VQ0_SIZE, 1, 0 },
> -+    { RPMSG_VRING_ADDR_ANY, 4096, RPMSG_VQ1_SIZE, 2, 0 },
> - #endif
> -
> -     {
> -diff --git a/monitor/src/custom_rsc_table_vayu_dsp.h b/monitor/src/custom_rsc_table_vayu_dsp.h
> -index ddcf4a5..f7fe9e7 100644
> ---- a/monitor/src/custom_rsc_table_vayu_dsp.h
> -+++ b/monitor/src/custom_rsc_table_vayu_dsp.h
> -@@ -138,8 +138,7 @@
> -
> - // Must be marked non-cached by monitor
> - #define DSP_MEM_IPC_VRING       0xFFF00000
> --#define DSP_MEM_RPMSG_VRING0    0xFFF00000
> --#define DSP_MEM_RPMSG_VRING1    0xFFF04000
> -+#define RPMSG_VRING_ADDR_ANY    FW_RSC_ADDR_ANY
> - #define DSP_MEM_VRING_BUFS0     0xFFF40000
> - #define DSP_MEM_VRING_BUFS1     0xFFF80000
> -
> -@@ -272,8 +271,8 @@ struct my_resource_table ti_ipc_remoteproc_ResourceTable = {
> -         /* no config data */
> -     },
> -     /* the two vrings */
> --    { DSP_MEM_RPMSG_VRING0, 4096, DSP_RPMSG_VQ0_SIZE, 1, 0 },
> --    { DSP_MEM_RPMSG_VRING1, 4096, DSP_RPMSG_VQ1_SIZE, 2, 0 },
> -+    { RPMSG_VRING_ADDR_ANY, 4096, DSP_RPMSG_VQ0_SIZE, 1, 0 },
> -+    { RPMSG_VRING_ADDR_ANY, 4096, DSP_RPMSG_VQ1_SIZE, 2, 0 },
> -
> -     {
> -         TYPE_CARVEOUT,
> -diff --git a/monitor_ipu/src/custom_rsc_table_vayu_ipu1.h b/monitor_ipu/src/custom_rsc_table_vayu_ipu1.h
> -index b06ab86..ab80089 100644
> ---- a/monitor_ipu/src/custom_rsc_table_vayu_ipu1.h
> -+++ b/monitor_ipu/src/custom_rsc_table_vayu_ipu1.h
> -@@ -96,8 +96,7 @@
> -
> - #define IPU_MEM_IPC_VRING       0x60000000
> - #define IPU_PHYS_MEM_IPC_VRING  0x9D000000
> --#define IPU_MEM_RPMSG_VRING0    0x60000000
> --#define IPU_MEM_RPMSG_VRING1    0x60004000
> -+#define RPMSG_VRING_ADDR_ANY    FW_RSC_ADDR_ANY
> -
> - /*
> -  * Sizes of the virtqueues (expressed in number of buffers supported,
> -@@ -206,8 +205,8 @@ struct my_resource_table ti_ipc_remoteproc_ResourceTable = {
> -         /* no config data */
> -     },
> -     /* the two vrings */
> --    { IPU_MEM_RPMSG_VRING0, 4096, IPU_RPMSG_VQ0_SIZE, 1, 0 },
> --    { IPU_MEM_RPMSG_VRING1, 4096, IPU_RPMSG_VQ1_SIZE, 2, 0 },
> -+    { RPMSG_VRING_ADDR_ANY, 4096, IPU_RPMSG_VQ0_SIZE, 1, 0 },
> -+    { RPMSG_VRING_ADDR_ANY, 4096, IPU_RPMSG_VQ1_SIZE, 2, 0 },
> -
> -     {
> -         TYPE_CARVEOUT,
> ---
> -2.17.1
> -
> diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> deleted file mode 100644
> index 9a9231a8..00000000
> --- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -# patch version at the end needs to be in double digits
> -PV = "1.2.00.02"
> -INC_PR = "r0"
> -
> -LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
> -
> -FILESEXTRAPATHS:prepend := "${THISDIR}/ocl:"
> -
> -OCL_GIT_URI = "git://git.ti.com/git/opencl/ti-opencl.git"
> -OCL_GIT_PROTOCOL = "https"
> -OCL_GIT_BRANCH = "master"
> -
> -OCL_SRCREV = "b1dfed9af21a1236380b9d643c432e4f0c619fce"
> -
> -BRANCH = "${OCL_GIT_BRANCH}"
> -SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
> -SRCREV = "${OCL_SRCREV}"
> diff --git a/meta-arago-extras/recipes-ti/ocl/ocl/0001-float_compute-matmpy-Link-with-libdl-to-resolve-link.patch b/meta-arago-extras/recipes-ti/ocl/ocl/0001-float_compute-matmpy-Link-with-libdl-to-resolve-link.patch
> deleted file mode 100644
> index 43bc9900..00000000
> --- a/meta-arago-extras/recipes-ti/ocl/ocl/0001-float_compute-matmpy-Link-with-libdl-to-resolve-link.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 79b7c204cafc2c96716b8e91093f135656820e16 Mon Sep 17 00:00:00 2001
> -From: Jacob Stiffler <j-stiffler@ti.com>
> -Date: Thu, 5 May 2016 08:35:34 -0400
> -Subject: [PATCH] float_compute, matmpy: Link with libdl to resolve linking
> - error
> -
> -* with GCC 5.3 toolchain, linking with libgomp also requires linking
> -  with libdl
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ----
> - examples/float_compute/Makefile | 2 +-
> - examples/matmpy/Makefile        | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/examples/float_compute/Makefile b/examples/float_compute/Makefile
> -index cb129f3..5514e0e 100644
> ---- a/examples/float_compute/Makefile
> -+++ b/examples/float_compute/Makefile
> -@@ -5,4 +5,4 @@ CLOCL_FLAGS =
> - include ../make.inc
> -
> - $(EXE): main.o dsp_compute.out
> --	@$(CPP) $(CPP_FLAGS) main.o $(LD_FLAGS) $(LIBS) -o $@ -lrt
> -+	@$(CPP) $(CPP_FLAGS) main.o $(LD_FLAGS) $(LIBS) -o $@ -lrt -ldl
> -diff --git a/examples/matmpy/Makefile b/examples/matmpy/Makefile
> -index 9b20091..f9e6112 100644
> ---- a/examples/matmpy/Makefile
> -+++ b/examples/matmpy/Makefile
> -@@ -6,6 +6,6 @@ CLOCL_FLAGS =
> - include ../make.inc
> -
> - $(EXE): main.o kernel.out
> --	@$(CPP) $(CPP_FLAGS) main.o $(LD_FLAGS) $(LIBS) -lrt -lgomp -o $@
> -+	@$(CPP) $(CPP_FLAGS) main.o $(LD_FLAGS) $(LIBS) -lrt -lgomp -ldl -o $@
> -
> - kernel.out: ccode.obj
> ---
> -1.9.1
> -
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> deleted file mode 100644
> index 98b6b64d..00000000
> --- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> +++ /dev/null
> @@ -1,144 +0,0 @@
> -SUMMARY = "TI OpenCL example applications"
> -HOMEPAGE = "https://downloads.ti.com/mctools/esd/docs/opencl/index.html"
> -LICENSE = "BSD-3-Clause"
> -
> -include ocl.inc
> -require recipes-ti/includes/ti-paths.inc
> -
> -PR = "${INC_PR}.1"
> -
> -COMPATIBLE_MACHINE = "dra7xx"
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
> -DEPENDS = "opencl opencl-monitor ti-cgt6x-native clocl-native"
> -
> -OCL_PERSISTENT_DEPENDS = "ti-xdctools-native ti-ipc-rtos ti-sysbios"
> -
> -DEPENDS:append:dra7xx = " ${OCL_PERSISTENT_DEPENDS}"
> -
> -# Split examples into two groups:
> -# - offline-compile: examples who's kernels are precompiled (offline).
> -# - runtime-compile: examples who's kernels are compiled during runtime.
> -PACKAGES =+ "${PN}-runtime-compile ${PN}-runtime-compile-dbg ${PN}-offline-compile ${PN}-offline-compile-dbg"
> -
> -RDEPENDS:${PN} = "${PN}-runtime-compile ${PN}-offline-compile"
> -RDEPENDS:${PN}-dev += "libgomp-dev"
> -RDEPENDS:${PN}-offline-compile += "opencl-runtime"
> -RDEPENDS:${PN}-runtime-compile += "opencl"
> -
> -S = "${WORKDIR}/git/opencl_example_src"
> -B = "${S}"
> -
> -OCL_RUNTIME_COMPILE_EXAMPLE_LIST = " \
> -    ccode \
> -    null \
> -    ooo_callback \
> -    simple \
> -    vecadd \
> -    vecadd_openmp \
> -    vecadd_openmp_t \
> -    vecadd_subdevice \
> -"
> -
> -OCL_EXAMPLE_LIST = " abort_exit \
> -                     buffer \
> -                     ccode \
> -                     conv1d \
> -                     dgemm \
> -                     dspheap \
> -                     dsplib_fft \
> -                     edmamgr \
> -                     float_compute \
> -                     matmpy \
> -                     monte_carlo \
> -                     null \
> -                     offline \
> -                     offline_embed \
> -                     ooo_callback \
> -                     platforms \
> -                     sgemm \
> -                     simple \
> -                     timeout \
> -                     vecadd \
> -                     vecadd_openmp \
> -                     vecadd_openmp_t \
> -                     vecadd_subdevice \
> -"
> -
> -OCL_PERSISTENT_EXAMPLE_LIST = " persistent_clock_concurrent \
> -                                persistent_clock_spanning \
> -                                persistent_common \
> -                                persistent_kernel_timeout \
> -                                persistent_messageq_concurrent \
> -                                persistent_task_concurrent \
> -                                persistent_task_spanning \
> -"
> -
> -OCL_EXAMPLE_LIST:append:dra7xx = " ${OCL_PERSISTENT_EXAMPLE_LIST}"
> -
> -OCL_MPAX_EXAMPLE_LIST = " vecadd_mpax \
> -                          vecadd_mpax_openmp \
> -"
> -
> -python do_unpack:append() {
> -    s = d.getVar("S")
> -    os.makedirs(s)
> -}
> -
> -python do_patch:append() {
> -    import shutil
> -    git_dir = d.expand("${WORKDIR}/git/examples")
> -    s = d.getVar("S")
> -    shutil.copy(os.path.join(git_dir,"Makefile"),s)
> -    shutil.copy(os.path.join(git_dir,"make.inc"),s)
> -    for example in d.getVar("OCL_EXAMPLE_LIST").split():
> -        shutil.copytree(os.path.join(git_dir,example), os.path.join(s,example))
> -}
> -
> -
> -EXTRA_OEMAKE = " TARGET_ROOTDIR=${STAGING_DIR_HOST} \
> -                 TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x \
> -"
> -
> -export XDC_DIR = "${XDC_INSTALL_DIR}/packages"
> -export IPC_DIR = "${IPC_INSTALL_DIR}/packages"
> -export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}/packages"
> -
> -do_install() {
> -    install -d ${D}${datadir}/ti/examples/opencl
> -
> -    install ${B}/Makefile ${D}${datadir}/ti/examples/opencl
> -    install ${B}/make.inc ${D}${datadir}/ti/examples/opencl
> -
> -    for ocl_example in ${OCL_EXAMPLE_LIST}; do
> -        install -d ${D}${datadir}/ti/examples/opencl/${ocl_example}
> -        cp -rv ${B}/${ocl_example}/* ${D}${datadir}/ti/examples/opencl/${ocl_example}
> -    done
> -}
> -
> -# First package the examples which require run-time kernel compilation.
> -FILES:${PN}-runtime-compile += "\
> -    ${@' '.join(['${datadir}/ti/examples/opencl/' + example for example in d.getVar('OCL_RUNTIME_COMPILE_EXAMPLE_LIST').split()])} \
> -"
> -
> -FILES:${PN}-runtime-compile-dbg += "\
> -    ${@' '.join(['${datadir}/ti/examples/opencl/' + example + '/.debug' for example in d.getVar('OCL_RUNTIME_COMPILE_EXAMPLE_LIST').split()])} \
> -"
> -
> -# Remaining examples will fall through to the "offline" package.
> -FILES:${PN}-offline-compile += "\
> -    ${datadir}/ti/examples/opencl/ \
> -"
> -
> -FILES:${PN}-offline-compile-dbg += "\
> -    ${datadir}/ti/examples/opencl/*/.debug \
> -"
> -
> -# Add makefiles to dev package
> -FILES:${PN}-dev = "${datadir}/ti/examples/opencl/Makefile \
> -                   ${datadir}/ti/examples/opencl/make.inc"
> -
> -ALLOW_EMPTY:${PN} = "1"
> -INSANE_SKIP:${PN} = "arch ldflags textrel staticdev"
> -INSANE_SKIP:${PN}-offline-compile = "arch ldflags textrel staticdev"
> -INSANE_SKIP:${PN}-runtime-compile = "arch ldflags textrel staticdev"
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
> deleted file mode 100644
> index 4ec9a547..00000000
> --- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -DESCRIPTION = "TI OpenCL M4/IPU device firmware for AM57x"
> -HOMEPAGE = "https://downloads.ti.com/mctools/esd/docs/opencl/index.html"
> -LICENSE = "BSD-3-Clause"
> -
> -include ocl.inc
> -require recipes-ti/includes/arago-paths.inc
> -
> -PR = "${INC_PR}.1"
> -SRC_URI += "file://0001-Update-VRING-in-resource-table-for-new-Linux-kernel.patch;patchdir=.."
> -
> -inherit update-alternatives
> -
> -DEPENDS = " common-csl-ip-rtos \
> -            pm-lld-rtos \
> -            ti-xdctools-native \
> -            ti-ipc-rtos \
> -            ti-sysbios \
> -            ti-pdk-build-rtos \
> -            ti-cgt-arm-native \
> -            util-linux-native \
> -            opencl-tidl-fw \
> -"
> -
> -COMPATIBLE_MACHINE = "dra7xx"
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
> -S = "${WORKDIR}/git/monitor_ipu"
> -
> -export IPC_DIR = "${IPC_INSTALL_DIR}"
> -export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}"
> -export PDK_DIR = "${PDK_INSTALL_DIR}"
> -export XDC_DIR = "${XDC_INSTALL_DIR}"
> -export TI_OCL_M4_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/ti-cgt-arm"
> -export CSL_LIB_M4 = "${PDK_DIR}/packages/ti/csl/lib/am572x/m4/release/ti.csl.aem4"
> -export PM_HAL_LIB_M4 = "$(PDK_DIR)/packages/ti/drv/pm/lib/am572x/m4/release/pm_hal.aem4"
> -export OCL_TIDL_FW_DIR = "${OCL_TIDL_FW_INSTALL_DIR}"
> -export OCL_FPERMS = "664"
> -export OCL_DPERMS = "775"
> -
> -EXTRA_OEMAKE += " BUILD_AM57=1 \
> -                  WORKING_DIRECTORY=${S} \
> -"
> -
> -do_compile() {
> -  oe_runmake -f Makefile
> -}
> -
> -do_install() {
> -    install -m ${OCL_DPERMS} -d ${D}${base_libdir}/firmware
> -    install -m ${OCL_FPERMS} bin/release/server_ipu1.xem4 ${D}${base_libdir}/firmware/dra7-ipu1-fw.xem4.opencl-monitor
> -}
> -
> -ALTERNATIVE:${PN} = "dra7-ipu1-fw.xem4"
> -ALTERNATIVE_LINK_NAME[dra7-ipu1-fw.xem4] = "${base_libdir}/firmware/dra7-ipu1-fw.xem4"
> -ALTERNATIVE_TARGET[dra7-ipu1-fw.xem4] = "${base_libdir}/firmware/dra7-ipu1-fw.xem4.opencl-monitor"
> -ALTERNATIVE_PRIORITY = "100"
> -
> -MONITOR_IPU_FIRMWARE = "${base_libdir}/firmware/dra7-ipu1-fw.*"
> -
> -FILES:${PN} += " \
> -    ${MONITOR_IPU_FIRMWARE} \
> -"
> -
> -INSANE_SKIP:${PN} = "arch"
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> deleted file mode 100644
> index c5bfe36a..00000000
> --- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> +++ /dev/null
> @@ -1,103 +0,0 @@
> -DESCRIPTION = "TI OpenCL compute device firmware"
> -HOMEPAGE = "https://downloads.ti.com/mctools/esd/docs/opencl/index.html"
> -LICENSE = "BSD-3-Clause"
> -
> -include ocl.inc
> -require recipes-ti/includes/arago-paths.inc
> -
> -inherit features_check
> -
> -REQUIRED_MACHINE_FEATURES = "dsp"
> -REQUIRED_DISTRO_FEATURES = "opencl openmp"
> -
> -PR = "${INC_PR}.2"
> -SRC_URI += "file://0001-Update-VRING-in-resource-table-for-new-Linux-kernel.patch;patchdir=.."
> -
> -inherit update-alternatives
> -
> -DEPENDS = " ti-llvm3.6-native \
> -            common-csl-ip-rtos \
> -            ti-xdctools-native \
> -            ti-ipc-rtos \
> -            ti-sysbios \
> -            ti-cgt6x-native \
> -            edma3-lld-rtos \
> -            ti-xdais \
> -            ti-framework-components \
> -            libulm \
> -            gdbserver-c6x \
> -            libaet \
> -            openmp-rtos \
> -"
> -
> -DEPENDS:append:dra7xx = " opencl-tidl-fw \
> -"
> -
> -COMPATIBLE_MACHINE = "dra7xx"
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
> -S = "${WORKDIR}/git/monitor"
> -
> -BUILD_TARGET:dra7xx = "ARM_AM57"
> -
> -export TI_OCL_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> -export PDK_DIR = "${PDK_INSTALL_DIR}"
> -export IPC_DIR = "${IPC_INSTALL_DIR}"
> -export XDC_DIR = "${XDC_INSTALL_DIR}"
> -export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}"
> -export EDMA3LLD_DIR = "${EDMA3_LLD_INSTALL_DIR}"
> -export XDAIS_DIR = "${XDAIS_INSTALL_DIR}"
> -export FC_DIR = "${FC_INSTALL_DIR}"
> -export MPM_DIR = "${MPM_INSTALL_DIR}"
> -export OMP_DIR = "${OMP_INSTALL_DIR}"
> -export ULM_DIR ="${STAGING_DIR_TARGET}/usr/share/ti/ulm"
> -export GDB_SERVER_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/gdbc6x"
> -export AET_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/ctoolslib/aet"
> -export X86_LLVM_DIR = "${STAGING_DIR_NATIVE}/usr"
> -export XDCPATH = "${S};${IPC_DIR}/packages;${BIOS_DIR}/packages;${EDMA3LLD_DIR}/packages;${FC_DIR}/packages;${XDAIS_DIR}/packages"
> -export OCL_TIDL_FW_DIR = "${OCL_TIDL_FW_INSTALL_DIR}"
> -export OCL_FPERMS = "664"
> -export OCL_DPERMS = "775"
> -export SHARE_PATH="${D}${datadir}/ti/opencl"
> -
> -EXTRA_OEMAKE += " BUILD_OS=linux \
> -                  WORKING_DIRECTORY=${S} \
> -                  BUILD_TARGET=${BUILD_TARGET} \
> -"
> -do_compile() {
> -  oe_runmake -f Makefile
> -}
> -
> -do_install() {
> -    install -m ${OCL_DPERMS} -d ${SHARE_PATH}
> -}
> -
> -install_dsp_objs() {
> -    install -m ${OCL_FPERMS} monitor_${1}/dsp0.out ${SHARE_PATH}/dsp.out
> -    install -m ${OCL_FPERMS} monitor_${1}/dsp0.syms.obj ${SHARE_PATH}/dsp_syms.obj
> -    install -m ${OCL_FPERMS} monitor_${1}/dsp0.syms ${SHARE_PATH}/dsp.syms
> -}
> -
> -do_install:append:dra7xx() {
> -    install_dsp_objs am57x
> -    install -m ${OCL_DPERMS} -d ${D}${base_libdir}/firmware
> -    install -m ${OCL_FPERMS} monitor_am57x/dsp0.out ${D}${base_libdir}/firmware/dra7-dsp1-fw.xe66.${BPN}
> -    install -m ${OCL_FPERMS} monitor_am57x/dsp1.out ${D}${base_libdir}/firmware/dra7-dsp2-fw.xe66.${BPN}
> -}
> -
> -ALTERNATIVE:${PN}:dra7xx = "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66"
> -ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] = "${base_libdir}/firmware/dra7-dsp1-fw.xe66"
> -ALTERNATIVE_TARGET[dra7-dsp1-fw.xe66] = "${base_libdir}/firmware/dra7-dsp1-fw.xe66.${BPN}"
> -ALTERNATIVE_LINK_NAME[dra7-dsp2-fw.xe66] = "${base_libdir}/firmware/dra7-dsp2-fw.xe66"
> -ALTERNATIVE_TARGET[dra7-dsp2-fw.xe66] = "${base_libdir}/firmware/dra7-dsp2-fw.xe66.${BPN}"
> -ALTERNATIVE_PRIORITY = "100"
> -
> -MONITOR_FIRMWARE = ""
> -MONITOR_FIRMWARE:dra7xx = "${base_libdir}/firmware/*"
> -
> -FILES:${PN} += " \
> -    ${datadir}/ti/opencl/* \
> -    ${MONITOR_FIRMWARE} \
> -"
> -
> -INSANE_SKIP:${PN} = "arch"
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> deleted file mode 100644
> index 46796147..00000000
> --- a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -SUMMARY = "OpenCL TIDL firmware for AM57xx"
> -
> -LICENSE = "TI-TFL"
> -LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=082a028431c455252c1e1d3d1021d382"
> -
> -PV = "01.02.00.01"
> -PR = "r0"
> -
> -require recipes-ti/includes/arago-paths.inc
> -
> -COMPATIBLE_MACHINE = "dra7xx"
> -
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
> -GIT_URI      = "git://git.ti.com/git/opencl/opencl-firmware.git"
> -GIT_PROTOCOL = "https"
> -BRANCH       = "master"
> -SRCREV       = "9e3d0b34f604203f275fba4807481a8a763a4f63"
> -
> -SRC_URI      = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
> -
> -S = "${WORKDIR}/git"
> -
> -TARGET = "eve_firmware.bin ocl_tidl_dsp.lib"
> -
> -do_install() {
> -    install -d ${D}${OCL_TIDL_FW_INSTALL_DIR_RECIPE}
> -    for f in ${TARGET}; do
> -	install -m 0644 ${S}/$f ${D}${OCL_TIDL_FW_INSTALL_DIR_RECIPE}/$f
> -    done
> -}
> -
> -FILES:${PN} += "${OCL_TIDL_FW_INSTALL_DIR_RECIPE}"
> -
> -INSANE_SKIP:${PN} = "arch"
> -
> -INHIBIT_PACKAGE_STRIP = "1"
> -INHIBIT_SYSROOT_STRIP = "1"
> -INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> deleted file mode 100644
> index 0bdbed7e..00000000
> --- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> +++ /dev/null
> @@ -1,79 +0,0 @@
> -DESCRIPTION = "TI OpenCL host runtime and development packages"
> -HOMEPAGE = "https://downloads.ti.com/mctools/esd/docs/opencl/index.html"
> -LICENSE = "BSD-3-Clause"
> -
> -include ocl.inc
> -
> -PR = "${INC_PR}.3"
> -
> -inherit cmake systemd
> -
> -COMPATIBLE_MACHINE = "dra7xx"
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
> -# Define runtime package for minimal dependencies to run opencl applications
> -# which precompile the offloaded kernels. The base package will provide the
> -# ability to compile kernels (clocl) during runtime.
> -PACKAGES =+ "${PN}-runtime"
> -
> -MONITORS                      = " opencl-monitor"
> -MONITORS:append:dra7xx        = " opencl-monitor-ipu"
> -
> -DEPENDS = " virtual/libgl \
> -            ${MONITORS} \
> -            cmake-native \
> -            cmem \
> -            ti-llvm3.6 \
> -            ti-llvm3.6-native \
> -            binutils \
> -            sqlite3 \
> -            libffi \
> -            boost \
> -            boost-native \
> -            libloki \
> -            pkgconfig-native \
> -            libulm \
> -            elfutils \
> -            json-c \
> -"
> -
> -DEPENDS:append:dra7xx = " ti-ipc virtual/kernel"
> -
> -RDEPENDS:${PN}-runtime += "bash ${MONITORS}"
> -RDEPENDS:${PN}-dev += "virtual-libgl-dev"
> -RDEPENDS:${PN} += "${PN}-runtime clocl bash"
> -
> -# Use main package to pull in full support
> -ALLOW_EMPTY:${PN} = "1"
> -
> -S = "${WORKDIR}/git/host"
> -
> -export WANT_LLVM_RELEASE = "3.6-ti"
> -
> -OCL_BUILD_TARGET:dra7xx = "ARM_AM57"
> -
> -ENABLE_ULM = "1"
> -SHMEM_MANAGER = "CMEM"
> -
> -EXTRA_OECMAKE += " -DBUILD_TARGET=${OCL_BUILD_TARGET} -DBUILD_OUTPUT=lib -DENABLE_ULM=${ENABLE_ULM} -DOCL_VERSION=${PV} -DSHMEM_MANAGER=${SHMEM_MANAGER}"
> -
> -EXTRA_OEMAKE += "KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} LINUX_DEVKIT_ROOT=${STAGING_DIR_HOST}"
> -export KERNEL_INSTALL_DIR = "${STAGING_KERNEL_DIR}"
> -
> -MCTD = ""
> -MCTD:dra7xx = "${S}/mct-daemon/ti-mct-daemon.service.am57x"
> -
> -do_install:append() {
> -    install -d ${D}${systemd_system_unitdir}
> -    install -m0644 ${MCTD} ${D}${systemd_system_unitdir}/ti-mct-daemon.service
> -}
> -
> -SYSTEMD_PACKAGES = "${PN}-runtime"
> -SYSTEMD_SERVICE:${PN}-runtime = "ti-mct-daemon.service"
> -SYSTEMD_AUTO_ENABLE:${PN}-runtime = "${@oe.utils.conditional("RESERVE_CMEM", "1", "enable", "disable", d)}"
> -
> -FILES:${PN}-runtime += "${bindir} ${systemd_system_unitdir} ${sysconfdir}/ti-mctd ${libdir}/lib*${SOLIBS}"
> -
> -FILES:${PN} += " \
> -    ${datadir}/ti/opencl/* \
> -"

