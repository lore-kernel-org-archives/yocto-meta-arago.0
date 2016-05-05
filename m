Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 727EC52AF7
	for <meta-arago@arago-project.org>;
	Thu,  5 May 2016 20:21:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u45KL1CI006846
	for <meta-arago@arago-project.org>; Thu, 5 May 2016 15:21:01 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u45KL1dd010145
	for <meta-arago@arago-project.org>; Thu, 5 May 2016 15:21:01 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 May 2016 15:21:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u45KL0vG022089;
	Thu, 5 May 2016 15:21:00 -0500
Date: Thu, 5 May 2016 16:20:45 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20160505202045.GM12998@edge>
References: <1462479539-2263-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1462479539-2263-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] recipes: re-enable cmem, opencl and other dependencies
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
X-List-Received-Date: Thu, 05 May 2016 20:21:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Jake,

This is the patch I mentioned that re-enables all the previosuly disabled 
components except ipsecmgr. But I can't push it yet, as there are still some 
issues with opencl related pieces, as I mentioned in other emails...

-- 
Denys


On Thu, May 05, 2016 at 04:18:59PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> This reverts commit 2ad662005f4778a4082103a67bb42661187c41e3.
> This reverts commit 86e1c945f1f3f102bf26ff0b84062dee08b7b439.
> This reverts commit d8fdfcb7403e305437d6d951e73e0364925fb614.
> This reverts commit 62900ec73413d1979f399289cb410275dda38f02.
> This reverts commit 4eee3d80d17f67f23b890db0f107ad8f73f6cb77.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../packagegroup-arago-base-tisdk-server-extra.bb  | 14 +++---
>  .../packagegroup-arago-test-addons.bb              | 25 +++++-----
>  .../packagegroup-arago-tisdk-addons-sdk-host.bb    | 40 +++++++--------
>  .../packagegroup-arago-tisdk-addons-sdk-target.bb  | 57 +++++++++++-----------
>  .../packagegroup-arago-tisdk-addons.bb             | 54 ++++++++++----------
>  .../packagegroup-arago-tisdk-matrix.bb             | 36 +++++++-------
>  ...packagegroup-arago-tisdk-multimedia-sdk-host.bb |  8 +--
>  ...ckagegroup-arago-tisdk-multimedia-sdk-target.bb |  4 +-
>  .../packagegroup-arago-tisdk-multimedia.bb         |  4 +-
>  .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  4 +-
>  meta-arago-extras/recipes-ti/ocl/opencl_git.bb     |  2 +-
>  11 files changed, 123 insertions(+), 125 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> index d9b7eab..c5352bc 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -PR = "r10"
> +PR = "r11"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -81,11 +81,6 @@ ARAGO_SECURE_STORAGE = "\
>      engine-pkcs11 \
>      "
>  
> -#    cmem-mod
> -#    cmem
> -#    mpm-transport
> -#    multiprocmgr
> -#    qmss-lld
>  #    ipsecmgr-mod
>  ARAGO_TI_KEYSTONE_PKGS = "\
>      ${ARAGO_SECURE_STORAGE} \
> @@ -97,10 +92,15 @@ ARAGO_TI_KEYSTONE_PKGS = "\
>      cuia \
>      edma3-lld \
>      srss-tc \
> +    cmem \
> +    cmem-mod \
>      ti-ipc \
> +    mpm-transport \
> +    multiprocmgr \
>      rm-lld \
>      demo-image-proc \
>      pa-lld \
> +    qmss-lld \
>      hplib-mod \
>      pktlib \
>      cppi-lld \
> @@ -123,10 +123,10 @@ ARAGO_TI_PKGS_append_k2l-evm = "\
>      nwal-lld \
>      "
>  
> -#    srio-lld
>  #    netapi
>  #    netapi-test
>  ARAGO_TI_PKGS_append_k2hk-evm = "\
> +    srio-lld \
>      mmap-lld \
>      hyplnk-lld \
>      aif2-lld \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
> index fd1f5e9..51bfc2f 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Task to install additional utilities/demos for test image"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -PR = "r8"
> +PR = "r9"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -14,16 +14,15 @@ TEST_ADDONS = " \
>      strongswan \
>      "
>  
> -#TEST_ADDONS_TI = " \
> -#    cmem-test \
> -#    "
> +TEST_ADDONS_TI = " \
> +    cmem-test \
> +    "
>  
> -#    mpm-transport-test
> -#    multiprocmgr-test
> -#    qmss-lld-test
> -#    mpm-transport-test
>  #    ipsecmgr
>  TEST_ADDONS_TI_append_keystone = " \
> +    mpm-transport-test \
> +    multiprocmgr-test \
> +    qmss-lld-test \
>      pa-lld-test \
>      cppi-lld-test \
>      edma3-lld-test \
> @@ -42,11 +41,11 @@ TEST_ADDONS_TI_append_keystone = " \
>  #    ipc-transport-qmss-test
>  #    netapi-test
>  
> -#    srio-lld-test
> -#    ipc-transport-srio-test
> -#    ipc-transport-qmss-test
>  #    netapi-test
>  TEST_ADDONS_TI_append_k2hk-evm = " \
> +    srio-lld-test \
> +    ipc-transport-srio-test \
> +    ipc-transport-qmss-test \
>      hyplnk-lld-test \
>      mmap-lld-test \
>      aif2-lld-test \
> @@ -55,7 +54,6 @@ TEST_ADDONS_TI_append_k2hk-evm = " \
>      nwal-lld \
>      "
>  
> -#    ipc-transport-qmss-test
>  #    netapi-test
>  TEST_ADDONS_TI_append_k2l-evm = " \
>      dfe-lld-test \
> @@ -63,9 +61,9 @@ TEST_ADDONS_TI_append_k2l-evm = " \
>      nwal-lld-test \
>      hplib-test \
>      nwal-lld \
> +    ipc-transport-qmss-test \
>      "
>  
> -#    ipc-transport-qmss-test
>  #    netapi-test
>  TEST_ADDONS_TI_append_k2e-evm = " \
>      mmap-lld-test \
> @@ -73,6 +71,7 @@ TEST_ADDONS_TI_append_k2e-evm = " \
>      nwal-lld-test \
>      hplib-test \
>      nwal-lld \
> +    ipc-transport-qmss-test \
>      "
>  
>  RDEPENDS_${PN} = "\
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> index 6067982..ee73b61 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
>  LICENSE = "MIT"
> -PR = "r25"
> +PR = "r26"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -31,31 +31,31 @@ UTILS_append_ti43x = " \
>      pru-icss-src \
>  "
>  
> -#UTILS_append_dra7xx = " \
> -#    opencl-examples-src \
> -#    openmpacc-examples-src \
> -#"
> +UTILS_append_dra7xx = " \
> +    opencl-examples-src \
> +    openmpacc-examples-src \
> +"
>  
> -#    linalg-examples-src
> -#UTILS_append_k2hk-evm = " \
> -#    opencl-examples-src \
> -#    openmpacc-examples-src \
> -#"
> +UTILS_append_k2hk-evm = " \
> +    opencl-examples-src \
> +    openmpacc-examples-src \
> +    linalg-examples-src \
> +"
>  
> -#UTILS_append_k2l-evm = " \
> -#    opencl-examples-src \
> -#    openmpacc-examples-src \
> -#"
> +UTILS_append_k2l-evm = " \
> +    opencl-examples-src \
> +    openmpacc-examples-src \
> +"
>  
> -#UTILS_append_k2e-evm = " \
> -#    opencl-examples-src \
> -#    openmpacc-examples-src \
> -#"
> +UTILS_append_k2e-evm = " \
> +    opencl-examples-src \
> +    openmpacc-examples-src \
> +"
>  
>  EXTRA_LIBS = ""
>  
> -#    cmem-mod-src
>  EXTRA_LIBS_append_omap-a15 = " \
> +    cmem-mod-src \
>      pru-icss-src \
>  "
>  
> @@ -64,9 +64,9 @@ EXTRA_LIBS_append_dra7xx = " \
>      gdbserverproxy-module-drv-src \
>  "
>  
> -#    cmem-mod-src
>  #    ipsecmgr-mod-src
>  EXTRA_LIBS_append_keystone = " \
> +    cmem-mod-src \
>      uio-module-drv-src \
>      hplib-mod-src \
>  "
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> index 748ea1a..564126d 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
>  LICENSE = "MIT"
> -PR = "r30"
> +PR = "r31"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -28,20 +28,12 @@ TI_SECURE_STORAGE_DEV = "\
>  	libp11-staticdev \
>  	"
>  
> -#	cmem-dev
> -#	cmem-staticdev
> -#	multiprocmgr-dev
> -#	multiprocmgr-staticdev
> -#	mpm-transport-dev
> -#	mpm-transport-staticdev
> -#	qmss-lld-dev
> -#	qmss-lld-staticdev
> -#	ipc-transport-qmss-dev
> -#	ipc-transport-qmss-staticdev
>  #	ipsecmgr-dev
>  #	ipsecmgr-staticdev
>  EXTRA_LIBS_append_keystone = "\
>  	${TI_SECURE_STORAGE_DEV} \
> +	cmem-dev \
> +	cmem-staticdev \
>  	udma-dev \
>  	udma-staticdev \
>  	traceframework-dev \
> @@ -51,6 +43,8 @@ EXTRA_LIBS_append_keystone = "\
>  	common-csl-ip-dev \
>  	cppi-lld-dev \
>  	cppi-lld-staticdev \
> +	qmss-lld-dev \
> +	qmss-lld-staticdev \
>  	pa-lld-dev \
>  	pa-lld-staticdev \
>  	rm-lld-dev \
> @@ -65,10 +59,16 @@ EXTRA_LIBS_append_keystone = "\
>  	libnl-staticdev \
>  	ti-ipc-dev \
>  	ti-ipc-staticdev \
> +	multiprocmgr-dev \
> +	multiprocmgr-staticdev \
> +	mpm-transport-dev \
> +	mpm-transport-staticdev \
>  	edma3-lld-dev \
>  	edma3-lld-staticdev \
>  	lksctp-tools-dev \
>  	lksctp-tools-staticdev \
> +	ipc-transport-qmss-dev \
> +	ipc-transport-qmss-staticdev \
>  	"
>  
>  #	netapi-dev
> @@ -84,13 +84,13 @@ EXTRA_LIBS_append_k2l-evm = "\
>  	nwal-lld-staticdev \
>  	"
>  
> -#	srio-lld-dev
> -#	srio-lld-staticdev
> -#	ipc-transport-srio-dev
> -#	ipc-transport-srio-staticdev
>  #	netapi-dev
>  #	netapi-staticdev
>  EXTRA_LIBS_append_k2hk-evm = "\
> +	srio-lld-dev \
> +	srio-lld-staticdev \
> +	ipc-transport-srio-dev \
> +	ipc-transport-srio-staticdev \
>  	mmap-lld \
>  	mmap-lld-staticdev \
>  	hyplnk-lld-dev \
> @@ -119,27 +119,26 @@ EXTRA_LIBS_append_k2e-evm = "\
>  UTILS_append_omap3 = " canutils-dev"
>  UTILS_append_ti33x = " canutils-dev"
>  UTILS_append_ti43x = " canutils-dev"
> -
> -#                        opencl-staticdev
> -#                        openmpacc-dev
>  UTILS_append_dra7xx = " canutils-dev \
> +                        opencl-staticdev \
>                          elfutils-dev \
>                          elfutils-staticdev \
> +                        openmpacc-dev \
> +"
> +UTILS_append_k2hk-evm = " opencl-staticdev \
> +                          openmpacc-dev \
> +                          linalg-dev \
> +"
> +UTILS_append_k2l-evm = " opencl-staticdev \
> +                         openmpacc-dev \
> +"
> +UTILS_append_k2e-evm = " opencl-staticdev \
> +                         openmpacc-dev \
>  "
> -#                          linalg-dev
> -#UTILS_append_k2hk-evm = " opencl-staticdev \
> -#                          openmpacc-dev \
> -#"
> -#UTILS_append_k2l-evm = " opencl-staticdev \
> -#                         openmpacc-dev \
> -#"
> -#UTILS_append_k2e-evm = " opencl-staticdev \
> -#                         openmpacc-dev \
> -#"
>  UTILS_append_k2g-evm = " canutils-dev"
>  
>  EXTRA_LIBS = ""
> -#EXTRA_LIBS_append_omap-a15 = " cmem-dev"
> +EXTRA_LIBS_append_omap-a15 = " cmem-dev"
>  EXTRA_LIBS_append_dra7xx = " libulm-dev \
>                               libulm-staticdev \
>                               gdbserver-c6x-dev \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index fc6b821..9a63ef9 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
>  LICENSE = "MIT"
> -PR = "r48"
> +PR = "r49"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -58,31 +58,31 @@ UTILS_append_am180x-evm = " ti-pru-sw-examples"
>  
>  UTILS_append_omap3 = " canutils"
>  
> -#                        opencl-examples
>  UTILS_append_dra7xx = " canutils \
>                          dsptop \
>                          gdbc6x \
>                          glsdk-example-apps \
> +                        opencl-examples \
>  "
>  
>  UTILS_append_keystone = " \
>      ti-ipc-rtos-fw \
>  "
>  
> -#    opencl-examples
>  UTILS_append_k2hk-evm = " \
> +    opencl-examples \
>      gdbc6x \
>      dsptop \
>  "
>  
> -#    opencl-examples
>  UTILS_append_k2l-evm = " \
> +    opencl-examples \
>      gdbc6x \
>      dsptop \
>  "
>  
> -#    opencl-examples
>  UTILS_append_k2e-evm = " \
> +    opencl-examples \
>      gdbc6x \
>      dsptop \
>  "
> @@ -90,7 +90,7 @@ UTILS_append_k2e-evm = " \
>  UTILS_append_k2g-evm = " canutils"
>  
>  EXTRA_LIBS = ""
> -#EXTRA_LIBS_append_omap-a15 = " cmem"
> +EXTRA_LIBS_append_omap-a15 = " cmem"
>  
>  DEVTOOLS = " \
>      packagegroup-core-buildessential \
> @@ -103,27 +103,27 @@ EXTRA_PACKAGES = " \
>      nodejs-npm \
>      protobuf \
>  "
> -#EXTRA_PACKAGES_append_dra7xx = " \
> -#    opencl-staticdev \
> -#    opencl-examples-dev \
> -#    openmpacc-examples-dev \
> -#"
> -#    linalg-examples
> -#EXTRA_PACKAGES_append_k2hk-evm = " \
> -#    opencl-staticdev \
> -#    opencl-examples-dev \
> -#    openmpacc-examples-dev \
> -#"
> -#EXTRA_PACKAGES_append_k2l-evm = " \
> -#    opencl-staticdev \
> -#    opencl-examples-dev \
> -#    openmpacc-examples-dev \
> -#"
> -#EXTRA_PACKAGES_append_k2e-evm = " \
> -#    opencl-staticdev \
> -#    opencl-examples-dev \
> -#    openmpacc-examples-dev \
> -#"
> +EXTRA_PACKAGES_append_dra7xx = " \
> +    opencl-staticdev \
> +    opencl-examples-dev \
> +    openmpacc-examples-dev \
> +"
> +EXTRA_PACKAGES_append_k2hk-evm = " \
> +    opencl-staticdev \
> +    opencl-examples-dev \
> +    openmpacc-examples-dev \
> +    linalg-examples \
> +"
> +EXTRA_PACKAGES_append_k2l-evm = " \
> +    opencl-staticdev \
> +    opencl-examples-dev \
> +    openmpacc-examples-dev \
> +"
> +EXTRA_PACKAGES_append_k2e-evm = " \
> +    opencl-staticdev \
> +    opencl-examples-dev \
> +    openmpacc-examples-dev \
> +"
>  
>  RDEPENDS_${PN} = "\
>      ${UTILS} \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> index 51cac11..d9ed0e1 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to include Matrix v2"
>  LICENSE = "MIT"
> -PR = "r55"
> +PR = "r56"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -129,11 +129,11 @@ MATRIX_APPS_append_omap-a15 = "     \
>      matrix-gui-pm-demos-governor    \
>  "
>  
> -#MATRIX_APPS_append_dra7xx = "        \
> -#    matrix-opencl-demo-floatcompute  \
> -#    matrix-opencl-demo-vecadd        \
> -#    matrix-video-analytics-opencv-opencl-opengl-demo \
> -#"
> +MATRIX_APPS_append_dra7xx = "        \
> +    matrix-opencl-demo-floatcompute  \
> +    matrix-opencl-demo-vecadd        \
> +    matrix-video-analytics-opencv-opencl-opengl-demo \
> +"
>  
>  MATRIX_APPS_append_beagleboard = "  \
>      matrix-gui-display-control      \
> @@ -171,20 +171,20 @@ MATRIX_APPS_append_keystone = " \
>      matrix-mc-demo-ipc          \
>  "
>  
> -#MATRIX_APPS_append_k2hk-evm = "      \
> -#    matrix-opencl-demo-floatcompute  \
> -#    matrix-opencl-demo-vecadd        \
> -#"
> +MATRIX_APPS_append_k2hk-evm = "      \
> +    matrix-opencl-demo-floatcompute  \
> +    matrix-opencl-demo-vecadd        \
> +"
>  
> -#MATRIX_APPS_append_k2l-evm = "       \
> -#    matrix-opencl-demo-floatcompute  \
> -#    matrix-opencl-demo-vecadd        \
> -#"
> +MATRIX_APPS_append_k2l-evm = "       \
> +    matrix-opencl-demo-floatcompute  \
> +    matrix-opencl-demo-vecadd        \
> +"
>  
> -#MATRIX_APPS_append_k2e-evm = "       \
> -#    matrix-opencl-demo-floatcompute  \
> -#    matrix-opencl-demo-vecadd        \
> -#"
> +MATRIX_APPS_append_k2e-evm = "       \
> +    matrix-opencl-demo-floatcompute  \
> +    matrix-opencl-demo-vecadd        \
> +"
>  
>  RDEPENDS_${PN} = "        \
>      ${MATRIX_ESSENTIALS}  \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
> index 5bc77de..80288f4 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to add multimedia related sources into the SDK"
>  LICENSE = "MIT"
> -PR = "r12"
> +PR = "r11"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -21,9 +21,9 @@ MULTIMEDIA_append_ti43x = " \
>      image-gallery-src \
>  "
>  
> -#MULTIMEDIA_append_dra7xx = " \
> -#    qt-opencv-opencl-opengl-multithreaded-src \
> -#"
> +MULTIMEDIA_append_dra7xx = " \
> +    qt-opencv-opencl-opengl-multithreaded-src \
> +"
>  
>  #Demo doesn't work on 3.14
>  # ${@base_conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo-src image-gallery-src', d)}
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
> index e6000ea..c74b79c 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to build and install header and libs into sdk"
>  LICENSE = "MIT"
> -PR = "r9"
> +PR = "r8"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -8,10 +8,10 @@ inherit packagegroup
>  
>  MULTIMEDIA = ""
>  
> -#    qt-opencv-opencl-opengl-multithreaded-dev
>  MULTIMEDIA_append_dra7xx = " \
>      hevc-arm-decoder-dev \
>      hevc-arm-decoder-staticdev \
> +    qt-opencv-opencl-opengl-multithreaded-dev \
>  "
>  
>  RDEPENDS_${PN} = "\
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> index 4c637d4..a9b6e1a 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to add multimedia related packages"
>  LICENSE = "MIT"
> -PR = "r19"
> +PR = "r18"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -26,9 +26,9 @@ MULTIMEDIA_append_omap-a15 = " \
>      amsdk-av-files \
>  "
>  
> -#    qt-opencv-opencl-opengl-multithreaded-dev
>  MULTIMEDIA_append_dra7xx = " \
>      hevc-arm-decoder \
> +    qt-opencv-opencl-opengl-multithreaded-dev \
>  "
>  
>  MULTIMEDIA_append_am37x-evm = " \
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> index d76b5c7..3ec6989 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> @@ -107,22 +107,22 @@ MAKEFILES_append_dra7xx = " cryptodev \
>                              qt-opencv-opencl-opengl-multithreaded \
>  "
>  
> -#                              cmem-mod
>  MAKEFILES_append_omap-a15 = " u-boot-spl \
>                                ${QUICK_PLAYGROUND} \
>                                omapconf \
>                                linux-dtbs \
>                                ti-sgx-ddk-km \
> +                              cmem-mod \
>                                pru-icss \
>  "
>  MAKEFILES_append_am180x-evm = " pru \
>                                  u-boot-legacy \
>  "
>  
> -#                              cmem-mod
>  MAKEFILES_append_keystone = " u-boot-spl \
>                                linux-dtbs \
>                                boot-monitor \
> +                              cmem-mod \
>                                cryptodev \
>                                ti-crypto-examples \
>                                hplib-mod \
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> index 028ae81..7954f2f 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> @@ -13,10 +13,10 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PACKAGES += " ${PN}-runtime"
>  
> -#            cmem
>  DEPENDS = " ocl-gl-headers \
>              opencl-monitor \
>              cmake-native \
> +            cmem \
>              ti-llvm3.6 \
>              ti-llvm3.6-native \
>              binutils \
> -- 
> 2.2.0
> 

