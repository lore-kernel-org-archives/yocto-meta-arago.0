Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 57E1D52093
	for <meta-arago@arago-project.org>;
	Fri, 13 Oct 2017 01:40:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9D1ePlA017182
	for <meta-arago@arago-project.org>; Thu, 12 Oct 2017 20:40:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507858825;
	bh=1WShfU3ZqVDKSi1ZbjwXlHVw+onZCLL+V06G4Ofz5T4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=xKiALZrytMS5qbM2gQx3AsvYSd8xFQ3otn3SkWRKgJUbfQ5xRLMa73ce+yvYz6il0
	dFLttutUQDwH5DqYEKaoMMTVdCTQElR8hWuJXTo6/6h8dwRCM44Vh/7k+nTmCDeHGY
	j42v5Lb+WLhmIISqQVQJ59jy59hfhGpwjLeT6nmk=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9D1ePKF027253
	for <meta-arago@arago-project.org>; Thu, 12 Oct 2017 20:40:25 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 12 Oct 2017 20:40:24 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 12 Oct 2017 20:40:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9D1eO3n023343;
	Thu, 12 Oct 2017 20:40:24 -0500
Date: Thu, 12 Oct 2017 21:40:09 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ajay Jayaraj <ajayj@ti.com>
Message-ID: <20171013014009.GF16210@edge>
References: <1507572638-14065-1-git-send-email-ajayj@ti.com>
MIME-Version: 1.0
In-Reply-To: <1507572638-14065-1-git-send-email-ajayj@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] ocl-rtos: OpenCL offload to C66x on TI-RTOS host
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
X-List-Received-Date: Fri, 13 Oct 2017 01:40:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Oct 09, 2017 at 02:10:38PM -0400, Ajay Jayaraj wrote:
> Recipes to build OpenCL when the host is running TI-RTOS.
> 
> Signed-off-by: Ajay Jayaraj <ajayj@ti.com>
> ---
>  .../recipes-ti/includes/arago-paths.inc            |  2 +
>  .../recipes-ti/ocl-rtos/clocl-rtos_git.bb          | 40 +++++++++
>  .../recipes-ti/ocl-rtos/clocl-win_git.bb           | 32 +++++++
>  .../ocl-rtos/opencl-examples-rtos_git.bb           | 98 ++++++++++++++++++++++
>  .../recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb | 64 ++++++++++++++
>  .../recipes-ti/ocl-rtos/opencl-rtos_git.bb         | 85 +++++++++++++++++++
>  6 files changed, 321 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb
>  create mode 100644 meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
>  create mode 100644 meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
>  create mode 100644 meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
>  create mode 100644 meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
> 
> diff --git a/meta-arago-extras/recipes-ti/includes/arago-paths.inc b/meta-arago-extras/recipes-ti/includes/arago-paths.inc
> index 393f14b..d617af3 100644
> --- a/meta-arago-extras/recipes-ti/includes/arago-paths.inc
> +++ b/meta-arago-extras/recipes-ti/includes/arago-paths.inc
> @@ -3,7 +3,9 @@ require recipes-ti/includes/ti-paths.inc
>  export LIBARCH_INSTALL_DIR_RECIPE    = "${installdir}/ti-libarch-tree"
>  export LINALG_INSTALL_DIR_RECIPE     = "${installdir}/ti-linalg-tree"
>  export LLVM_RTOS_INSTALL_DIR_RECIPE  = "${installdir}/llvm-rtos-tree"
> +export OCL_RTOS_INSTALL_DIR_RECIPE   = "${installdir}/ti-opencl-rtos-tree"
>  
>  export LIBARCH_INSTALL_DIR    = "${STAGING_DIR_TARGET}${LIBARCH_INSTALL_DIR_RECIPE}"
>  export LINALG_INSTALL_DIR     = "${STAGING_DIR_TARGET}${LINALG_INSTALL_DIR_RECIPE}"
>  export LLVM_RTOS_INSTALL_DIR  = "${STAGING_DIR_NATIVE}${LLVM_RTOS_INSTALL_DIR_RECIPE}"
> +export OCL_RTOS_INSTALL_DIR   = "${STAGING_DIR_TARGET}${OCL_RTOS_INSTALL_DIR_RECIPE}"
> diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb
> new file mode 100644
> index 0000000..3725567
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb
> @@ -0,0 +1,40 @@
> +SUMMARY = "TI OpenCL-C compiler for C66x (Linux hosted)"
> +HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
> +LICENSE = "BSD"
> +
> +require recipes-ti/ocl/ocl.inc
> +require recipes-ti/includes/arago-paths.inc
> +
> +PR = "${INC_PR}.0"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +DEPENDS = "ti-llvm3.6-native boost-native"
> +
> +S = "${WORKDIR}/git/host"
> +
> +TARGET_class-target = "am57xx"
> +TARGET_class-native = "x86"
> +
> +export WANT_LLVM_RELEASE = "3.6-ti"
> +export DESTDIR="${OCL_RTOS_INSTALL_DIR}"
> +export LDFLAGS="${BUILD_LDFLAGS}"
> +export CXXFLAGS="${BUILD_CFLAGS}"
> +
> +EXTRA_OEMAKE = "CXX=${BUILD_CXX} \
> +                -C ${S}/clocl \
> +                 _PRODUCT_VERSION=${PV} \
> +                 TARGET=x86 \
> +                 LLVM_CONFIG_EXE=llvm-config \
> +"
> +
> +do_compile() {
> +  oe_runmake
> +}
> +
> +do_install() {
> +    install -d ${DESTDIR}/bin/x86
> +    install -m 755 ${S}/clocl/x86/clocl ${DESTDIR}/bin/x86/
> +}
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
> new file mode 100644
> index 0000000..230c34a
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
> @@ -0,0 +1,32 @@
> +SUMMARY = "TI OpenCL-C compiler for C66x (Windows hosted)"
> +HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
> +LICENSE = "BSD"
> +
> +require recipes-ti/ocl/ocl.inc
> +require recipes-ti/includes/arago-paths.inc
> +
> +PR = "${INC_PR}.0"
> +
> +CLOCL_WIN_GIT_URI = "git://git.ti.com/opencl/clocl-win.git"
> +CLOCL_WIN_GIT_BRANCH = "master"
> +CLOCL_WIN_SRCREV = "eac7ac7cc2e64a9ff05e4238e44dff3f9a9fcf6b"
> +
> +BRANCH = "${CLOCL_WIN_GIT_BRANCH}"
> +SRC_URI = "${CLOCL_WIN_GIT_URI};protocol=git;branch=${BRANCH}"
> +SRCREV = "${CLOCL_WIN_SRCREV}"
> +
> +LIC_FILES_CHKSUM = "file://opencl-manifest.html;md5=e0810676ad435e2ef53c1a538e24a9a7"
> +
> +COMPATIBLE_MACHINE = "omap-a15"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +RELEASE_TARGET = ""
> +RELEASE_TARGET_omap-a15 = "am57xx"
> +
> +S = "${WORKDIR}/git"
> +export DESTDIR="${OCL_RTOS_INSTALL_DIR}/ti-opencl-rtos-${RELEASE_TARGET}-${PV}/packages/ti/opencl"
> +
> +do_install() {
> +    install -d ${DESTDIR}/usr/share/ti/opencl/bin/pc
> +    install -m 755 ${S}/bin/clocl.exe ${DESTDIR}/usr/share/ti/opencl/bin/pc
> +}
> diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
> new file mode 100644
> index 0000000..1bf300c
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
> @@ -0,0 +1,98 @@
> +SUMMARY = "TI OpenCL example applications"
> +HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
> +LICENSE = "BSD"
> +
> +require recipes-ti/ocl/ocl.inc
> +require recipes-ti/includes/arago-paths.inc
> +
> +PR = "${INC_PR}.0"
> +
> +COMPATIBLE_MACHINE = "omap-a15"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +DEPENDS = "opencl-rtos ti-cgt6x-native clocl-rtos-native opencl-monitor-rtos \
> +           clocl-win \
> +"
> +
> +S = "${WORKDIR}/git/opencl_example_src"
> +B = "${S}"
> +
> +OCL_EXAMPLE_LIST = " abort_exit \
> +                     buffer \
> +                     ccode \
> +                     dsplib_fft \
> +                     float_compute \
> +                     null \
> +                     offline_embed \
> +                     platforms \
> +                     simple \
> +                     timeout \
> +                     vecadd \
> +                     matmpy \
> +                     ooo_callback \
> +                     sgemm \
> +                     edmamgr \
> +                     vecadd_openmp \
> +		     vecadd_openmp_t \
> +"
> +
> +RELEASE_TARGET = ""
> +RELEASE_TARGET_omap-a15 = "am57xx"
> +
> +export BIOS_INSTALL_DIR = "${SYSBIOS_INSTALL_DIR}"
> +export DESTDIR="${OCL_RTOS_INSTALL_DIR}/ti-opencl-rtos-${RELEASE_TARGET}-${PV}"
> +export TI_OCL_INSTALL = "${DESTDIR}/packages/ti/opencl"
> +
> +
> +python do_unpack_append() {
> +    import shutil
> +
> +    git_dir = d.expand("${WORKDIR}/git/examples")
> +    s = d.getVar("S", True)
> +
> +    os.makedirs(s)
> +    shutil.copy(os.path.join(git_dir,"Makefile"),s)
> +    shutil.copy(os.path.join(git_dir,"make_rtos.inc"),s)
> +    shutil.copy(os.path.join(git_dir,"rtos_main.c"),s)
> +    shutil.copy(os.path.join(git_dir,"load_am57_rtos.js"),s)
> +    for example in d.getVar("OCL_EXAMPLE_LIST", True).split():
> +        shutil.copytree(os.path.join(git_dir,example), os.path.join(s,example))
> +}
> +
> +
> +EXTRA_OEMAKE = "BUILD_OS=SYS_BIOS \
> +                TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x \
> +"
> +
> +do_compile() {
> +    unset LDFLAGS
> +    unset TARGET_LDFLAGS
> +
> +    oe_runmake
> +}
> +
> +do_install() {
> +    install -d ${DESTDIR}/examples
> +
> +    install ${B}/Makefile ${DESTDIR}/examples
> +    install ${B}/make_rtos.inc ${DESTDIR}/examples
> +    install ${B}/rtos_main.c ${DESTDIR}/examples
> +
> +    for ocl_example in ${OCL_EXAMPLE_LIST}; do
> +        install -d ${DESTDIR}/examples/${ocl_example}
> +        cp -rv ${B}/${ocl_example}/* ${DESTDIR}/examples/${ocl_example}
> +    done
> +}
> +
> +inherit component_meta

^^^^ NAK


> +CM_NAME = "OpenCL"
> +CM_VERSION = "${PV}"
> +CM_ROOT_DIR = "opencl_rtos_${RELEASE_TARGET}_${@'${PV}'.replace('.', '_')}"
> +CM_DESCRIPTION = "OpenCL is a framework for writing programs that execute across heterogeneous systems"
> +
> +deltask do_create_srcipk
> +addtask create_srcipk after do_install before do_package
> +
> +CREATE_SRCIPK = "1"
> +SRCIPK_SRC_DIR = "${DESTDIR}"
> +SRCIPK_INSTALL_DIR = "${CM_ROOT_DIR}"
> diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
> new file mode 100644
> index 0000000..b6f21aa
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
> @@ -0,0 +1,64 @@
> +SUMMARY = "TI OpenCL compute device firmware for C66x (RTOS)"
> +HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
> +LICENSE = "BSD"
> +
> +require recipes-ti/ocl/ocl.inc
> +require recipes-ti/includes/arago-paths.inc
> +
> +PR = "${INC_PR}.0"
> +
> +inherit cmake
> +
> +DEPENDS = " ti-llvm3.6-native \
> +            common-csl-ip-rtos \
> +            ti-xdctools \
> +            ti-ipc-rtos \
> +            ti-sysbios \
> +            ti-cgt6x-native \
> +            edma3-lld-rtos \
> +            ti-xdais \
> +            ti-framework-components \
> +            libaet \
> +            openmp-rtos \
> +"
> +
> +COMPATIBLE_MACHINE = "omap-a15"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +S = "${WORKDIR}/git/monitor"
> +
> +BUILD_TARGET_omap-a15   = "ARM_AM57"
> +
> +RELEASE_TARGET = ""
> +RELEASE_TARGET_omap-a15 = "am57xx"
> +
> +EXTRA_OECMAKE += " -DCROSS_COMPILE=TRUE \
> +                   -DOCL_MONITOR_DIR=${S} \
> +                   -DBUILD_OUTPUT=all \
> +                   -DSHARE_PATH=${datadir}/ti \
> +                   -DBUILD_TARGET=${BUILD_TARGET} \
> +                   -DBUILD_OS=SYS_BIOS \
> +"
> +
> +export TI_OCL_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> +export PDK_DIR = "${PDK_INSTALL_DIR}"
> +export IPC_DIR = "${IPC_INSTALL_DIR}"
> +export XDC_DIR = "${XDC_INSTALL_DIR}"
> +export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}"
> +export EDMA3LLD_DIR = "${EDMA3_LLD_INSTALL_DIR}"
> +export XDAIS_DIR = "${XDAIS_INSTALL_DIR}"
> +export FC_DIR = "${FC_INSTALL_DIR}"
> +export MPM_DIR = "${MPM_INSTALL_DIR}"
> +export OMP_DIR = "${OMP_INSTALL_DIR}"
> +export ULM_DIR ="${STAGING_DIR_TARGET}/usr/share/ti/ulm"
> +export GDB_SERVER_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/gdbc6x"
> +export AET_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/ctoolslib/aet"
> +export X86_LLVM_DIR = "${STAGING_DIR_NATIVE}/usr"
> +export XDCPATH = "${S};${IPC_DIR}/packages;${BIOS_DIR}/packages;${EDMA3LLD_DIR}/packages;${FC_DIR}/packages;${XDAIS_DIR}/packages"
> +export DESTDIR="${OCL_RTOS_INSTALL_DIR}/ti-opencl-rtos-${RELEASE_TARGET}-${PV}/packages/ti/opencl"
> +
> +do_install() {
> +    oe_runmake install
> +    install -d ${DESTDIR}/platforms/am57x_rtos
> +    cp -r ${S}/../packages/ti/opencl/platforms/am57x_rtos/* ${DESTDIR}/platforms/am57x_rtos/
> +}
> diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
> new file mode 100644
> index 0000000..41b6653
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
> @@ -0,0 +1,85 @@
> +SUMMARY = "TI OpenCL host runtime (RTOS)"
> +HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
> +LICENSE = "BSD"
> +
> +require recipes-ti/ocl/ocl.inc
> +require recipes-ti/includes/arago-paths.inc
> +
> +PR = "${INC_PR}.0"
> +
> +
> +COMPATIBLE_MACHINE = "omap-a15"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +PACKAGES += " ${PN}-runtime"
> +
> +DEPENDS = "cmake-native \
> +           llvm-rtos \
> +           libloki \
> +           gcc-arm-none-eabi-native \
> +           ti-sysbios \
> +           ti-xdctools \
> +           ti-ipc-rtos  \
> +           opencl-monitor-rtos  \
> +           clocl-rtos-native  \
> +"
> +
> +#RDEPENDS_${PN}-dev += " opencl-monitor-rtos"
> +
> +ALLOW_EMPTY_${PN}-runtime = "1"
> +
> +
> +S = "${WORKDIR}/git/host"
> +
> +export WANT_LLVM_RELEASE = "3.6-ti"
> +
> +OCL_BUILD_TARGET_omap-a15   = "ARM_AM57"
> +
> +ENABLE_ULM = "0"
> +
> +RELEASE_TARGET = ""
> +RELEASE_TARGET_omap-a15 = "am57xx"
> +
> +export TI_OCL_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> +export ARM_LLVM_DIR="${LLVM_RTOS_INSTALL_DIR}"
> +export DESTDIR="${OCL_RTOS_INSTALL_DIR}/ti-opencl-rtos-${RELEASE_TARGET}-${PV}/packages/ti/opencl"
> +
> +# Required for eclipse plugin and packages
> +export XDC_DIR = "${XDC_INSTALL_DIR}"
> +export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}"
> +export IPC_DIR = "${IPC_INSTALL_DIR}"
> +
> +do_compile() {
> +
> +    echo "LLVM_RTOS_INSTALL_DIR=${LLVM_RTOS_INSTALL_DIR}"
> +
> +    unset LDFLAGS
> +    unset TARGET_LDFLAGS
> +
> +    cd ${WORKDIR}
> +    rm -rf build
> +
> +    mkdir -p build
> +    cd build; cmake \
> +        -DCMAKE_TOOLCHAIN_FILE=../git/host/cmake/CMakeBiosARMToolChain.txt \
> +        -DBUILD_TARGET=${OCL_BUILD_TARGET} \
> +        -DBUILD_OUTPUT=lib \
> +        -DENABLE_ULM=${ENABLE_ULM} \
> +        -DBUILD_OS=SYS_BIOS \
> +        -DIPC_INSTALL_PATH=${IPC_INSTALL_DIR}/packages \
> +        -DXDC_INSTALL_PATH=${XDC_INSTALL_DIR}/packages \
> +        -DBIOS_INSTALL_PATH=${SYSBIOS_INSTALL_DIR}/packages \
> +        -DLOKI_INCLUDE_PATH=${STAGING_DIR_HOST}/usr/include/loki \
> +        -DARM_LLVM_DIR=${ARM_LLVM_DIR} \
> +        -DOCL_VERSION=${PV} ../git/host;
> +    make install
> +    make -C eclipse install
> +    make -C packages install
> +    cd ..
> +}
> +
> +# Install x86/Linux clocl built by clocl-rtos-native recipe
> +do_install() {
> +    install -d ${DESTDIR}/usr/share/ti/opencl/bin/x86
> +    install -m 755 ${STAGING_DIR_NATIVE}/usr/share/ti/ti-opencl-rtos-tree/bin/x86/clocl ${DESTDIR}/usr/share/ti/opencl/bin/x86
> +}
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

