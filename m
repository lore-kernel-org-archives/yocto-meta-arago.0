Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 53AAE52986
	for <meta-arago@arago-project.org>;
	Fri, 20 Apr 2018 21:21:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3KLLJkC007740
	for <meta-arago@arago-project.org>; Fri, 20 Apr 2018 16:21:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1524259279;
	bh=A0HlBTyDZcuZMbxdzV6FGIClaHTI2rNgPxwMV7OT2F4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=XEXKKZdwyV6Yu8TgEjRWjY/0AJYsiu5j6ASbA4OX0LeBDOto/GN4MCwaK4b6BG2kc
	jm4wn8DM1dx3sHLX221eSYzBTsckPCLFY13pL57YdMvl4nbWdhEPEcRrTc508t0zti
	5Xr/WRRlFQ0y9qHkJexZARhDP3YVceasLcJFo8dk=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3KLLJkj029758
	for <meta-arago@arago-project.org>; Fri, 20 Apr 2018 16:21:19 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 20 Apr 2018 16:21:19 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 20 Apr 2018 16:21:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3KLLJmI018851;
	Fri, 20 Apr 2018 16:21:19 -0500
Date: Fri, 20 Apr 2018 17:21:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Yuan Zhao <yuanzhao@ti.com>
Message-ID: <20180420212118.GE7580@edge>
References: <20180420211032.117513-1-yuanzhao@ti.com>
MIME-Version: 1.0
In-Reply-To: <20180420211032.117513-1-yuanzhao@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2] ocl: update to version 01.01.15.00
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
X-List-Received-Date: Fri, 20 Apr 2018 21:21:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Apr 20, 2018 at 04:10:32PM -0500, Yuan Zhao wrote:
> - opencl: add monitor build recipe for ipu
> - opencl: update examples list
> 
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>  meta-arago-extras/recipes-ti/ocl/ocl.inc           |  4 +-
>  .../recipes-ti/ocl/opencl-examples_git.bb          | 29 ++++++++----
>  .../recipes-ti/ocl/opencl-monitor-ipu_git.bb       | 54 ++++++++++++++++++++++
>  meta-arago-extras/recipes-ti/ocl/opencl_git.bb     |  6 ++-
>  4 files changed, 80 insertions(+), 13 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
> 
> diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> index 635bb911..dd336397 100644
> --- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
> +++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> @@ -1,4 +1,4 @@
> -PV = "1.1.14.11"
> +PV = "1.1.15.0"
>  INC_PR = "r0"
>  
>  LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
> @@ -9,7 +9,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
>  OCL_GIT_PROTOCOL = "git"
>  OCL_GIT_BRANCH = "master"
>  
> -OCL_SRCREV = "6bbf15687cffc62567848e2c041e9c2dbddea999"
> +OCL_SRCREV = "78b0bc0eb38e76a057bc20ed2e3e485f262a9349"
>  
>  BRANCH = "${OCL_GIT_BRANCH}"
>  SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> index 5721e581..25b01258 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> @@ -5,7 +5,7 @@ LICENSE = "BSD"
>  include ocl.inc
>  require recipes-ti/includes/ti-paths.inc
>  
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.0"
>  
>  COMPATIBLE_MACHINE = "dra7xx|keystone"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> @@ -22,26 +22,29 @@ RDEPENDS_${PN}-dev += " libgomp-dev"
>  S = "${WORKDIR}/git/opencl_example_src"
>  B = "${S}"
>  
> -OCL_EXAMPLE_LIST = " buffer \
> +OCL_EXAMPLE_LIST = " abort_exit \
> +                     buffer \
>                       ccode \
> +                     conv1d \
> +                     dgemm \
> +                     dspheap \
>                       dsplib_fft \
> +                     edmamgr \
>                       float_compute \
> +                     matmpy \
> +                     monte_carlo \
>                       null \
>                       offline \
>                       offline_embed \
> +                     ooo_callback \
>                       platforms \
> +                     sgemm \
>                       simple \
> +                     timeout \
>                       vecadd \
> -                     matmpy \
> -                     monte_carlo \
> -                     ooo_callback \
> -                     edmamgr \
> -                     sgemm \
>                       vecadd_openmp \
>                       vecadd_openmp_t \
> -                     dgemm \
> -                     abort_exit \
> -                     timeout \
> +                     vecadd_subdevice \
>  "
>  
>  OCL_PERSISTENT_EXAMPLE_LIST = " persistent_clock_concurrent \
> @@ -55,6 +58,12 @@ OCL_PERSISTENT_EXAMPLE_LIST = " persistent_clock_concurrent \
>  
>  OCL_EXAMPLE_LIST_append_dra7xx = " ${OCL_PERSISTENT_EXAMPLE_LIST}"
>  
> +OCL_MPAX_EXAMPLE_LIST = " vecadd_mpax \
> +                          vecadd_mpax_openmp \
> +"
> +
> +OCL_EXAMPLE_LIST_append_k2hk = " ${OCL_MPAX_EXAMPLE_LIST}"
> +
>  python do_unpack_append() {
>      import shutil
>  
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
> new file mode 100644
> index 00000000..853c7d3a
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
> @@ -0,0 +1,54 @@
> +DESCRIPTION = "TI OpenCL M4/IPU device firmware for AM57x"
> +HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
> +LICENSE = "BSD"
> +
> +include ocl.inc
> +require recipes-ti/includes/ti-paths.inc
> +
> +PR = "${INC_PR}.0"
> +
> +inherit cmake update-alternatives
> +
> +DEPENDS = " common-csl-ip-rtos \
> +            pm-lld-rtos \
> +            ti-xdctools-native \
> +            ti-ipc-rtos \
> +            ti-sysbios \
> +            ti-pdk-build-rtos \
> +            ti-cgt-arm-native \
> +            util-linux-native \
> +"
> +
> +COMPATIBLE_MACHINE = "am57xx-evm|am57xx-hs-evm"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +S = "${WORKDIR}/git/monitor_ipu"
> +
> +BUILD_TARGET_dra7xx = "ARM_AM57"

Since you limited this to am57xx-emv and am57xx-hs-evm, no need to do _dra7xx 
for BUILD_TARGET variable.


> +EXTRA_OECMAKE += " -DCROSS_COMPILE=TRUE \
> +                   -DOCL_MONITOR_IPU_DIR=${S} \
> +                   -DBUILD_OUTPUT=all \
> +"
> +
> +export IPC_DIR = "${IPC_INSTALL_DIR}"
> +export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}"
> +export PDK_DIR = "${PDK_INSTALL_DIR}"
> +export XDC_DIR = "${XDC_INSTALL_DIR}"
> +export TI_OCL_M4_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/ti-cgt-arm"
> +export CSL_LIB_M4 = "${PDK_DIR}/packages/ti/csl/lib/am572x/m4/release/ti.csl.aem4"
> +export PM_HAL_LIB_M4 = "$(PDK_DIR)/packages/ti/drv/pm/lib/am572x/m4/release/pm_hal.aem4"
> +
> +ALTERNATIVE_${PN}_dra7xx = "dra7-ipu1-fw.xem4"

Same here ^


> +ALTERNATIVE_LINK_NAME[dra7-ipu1-fw.xem4] = "${base_libdir}/firmware/dra7-ipu1-fw.xem4"
> +ALTERNATIVE_TARGET[dra7-ipu1-fw.xem4] = "${base_libdir}/firmware/dra7-ipu1-fw.xem4.opencl-monitor"
> +ALTERNATIVE_PRIORITY = "100"
> +
> +MONITOR_IPU_FIRMWARE = ""
> +MONITOR_IPU_FIRMWARE_dra7xx = "${base_libdir}/firmware/dra7-ipu1-fw.*"

And same here ^


> +FILES_${PN} += " \
> +    ${MONITOR_IPU_FIRMWARE} \
> +"
> +
> +INSANE_SKIP_${PN} = "arch"
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> index fdc822d0..d1aed8a1 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> @@ -35,9 +35,13 @@ DEPENDS_append_dra7xx   = " ti-ipc virtual/kernel"
>  DEPENDS_append_keystone = " mpm-transport multiprocmgr"
>  DEPENDS_remove_k2g = " libulm"
>  
> +MONITORS                      = " opencl-monitor"
> +MONITORS_append_am57xx-evm    = " opencl-monitor-ipu"
> +MONITORS_append_am57xx-hs-evm = " opencl-monitor-ipu"
> +
>  RDEPENDS_${PN} += " bash"
>  RDEPENDS_${PN}-dev += " ocl-gl-headers-dev opencl-monitor"
> -RDEPENDS_${PN}-runtime += " ${PN} opencl-monitor clocl ti-cgt6x"
> +RDEPENDS_${PN}-runtime += " ${PN} ${MONITORS} clocl ti-cgt6x"
>  
>  ALLOW_EMPTY_${PN}-runtime = "1"
>  
> -- 
> 2.14.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

