Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 5EABE52AB4
	for <meta-arago@arago-project.org>;
	Thu,  8 Dec 2016 20:53:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id uB8Kromr015990;
	Thu, 8 Dec 2016 14:53:50 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uB8Krn0q029794;
	Thu, 8 Dec 2016 14:53:50 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 8 Dec 2016 14:53:49 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id uB8KrnFR014216;
	Thu, 8 Dec 2016 14:53:49 -0600
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@arago-project.org>
References: <1481142324-24891-1-git-send-email-denis@denix.org>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <1034c2f8-70bf-ed4c-f307-834c1195ba90@ti.com>
Date: Thu, 8 Dec 2016 15:53:49 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1481142324-24891-1-git-send-email-denis@denix.org>
Subject: Re: [RFC][PATCH] opencl, openmp: don't hardcode specific toolchain, pass the one being used for the build
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
X-List-Received-Date: Thu, 08 Dec 2016 20:53:50 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Is this something we should propose to fix in the sources?

- Jake


On 12/7/2016 3:25 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb | 10 +++++++---
>   meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb     |  9 +++++++--
>   .../recipes-ti/openmpacc/openmpacc-examples_git.bb      | 17 +++++++++++++++--
>   3 files changed, 29 insertions(+), 7 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> index 2a4b714..c69b7e2 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> @@ -1,10 +1,10 @@
> -DESCRIPTION = "TI OpenCL example applications"
> +SUMMARY = "TI OpenCL example applications"
>   HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
>   LICENSE = "BSD"
>   
>   include ocl.inc
>   
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>   
>   COMPATIBLE_MACHINE = "dra7xx|keystone"
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
> @@ -55,8 +55,12 @@ EXTRA_OEMAKE = " TARGET_ROOTDIR=${STAGING_DIR_HOST} \
>                    TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x \
>   "
>   
> +do_configure() {
> +    sed "s|arm-linux-gnueabihf-g++|${CXX}|g" -i make.inc
> +}
> +
>   do_compile() {
> -    oe_runmake
> +    oe_runmake CC="${CC}" CPP="${CPP}" CXX="${CXX}"
>   }
>   
>   do_install() {
> diff --git a/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb b/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
> index f41c291..75ce462 100644
> --- a/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
> +++ b/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
> @@ -1,8 +1,8 @@
> -DESCRIPTION = "TI OpenMP-Acc C compiler"
> +SUMMARY = "TI OpenMP-Acc C compiler"
>   
>   include openmpacc.inc
>   
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>   
>   DEPENDS = "boost elfutils"
>   RDEPENDS_${PN} += "clocl"
> @@ -23,6 +23,11 @@ EXTRA_OEMAKE = " -C ${S}/clacc \
>                     CXX="${CXX}" \
>   "
>   
> +do_configure() {
> +    sed "s|arm-linux-gnueabihf-gcc|${TOOLCHAIN_PREFIX}gcc|g" -i clacc/clacc.h
> +    sed "s|arm-linux-gnueabihf-g++|${TOOLCHAIN_PREFIX}g++|g" -i clacc/clacc.h
> +}
> +
>   do_compile() {
>       oe_runmake
>   }
> diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb b/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
> index 703e754..e96fa76 100644
> --- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
> +++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
> @@ -1,8 +1,8 @@
> -DESCRIPTION = "TI OpenMP-Acc example applications"
> +SUMMARY = "TI OpenMP-Acc example applications"
>   
>   include openmpacc.inc
>   
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>   
>   DEPENDS = "openmpacc clacc-native clocl-native ti-cgt6x-native"
>   RDEPENDS_${PN} += "opencl-runtime"
> @@ -44,6 +44,19 @@ EXTRA_OEMAKE = " TARGET_ROOTDIR=${STAGING_DIR_HOST} \
>                    TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x \
>   "
>   
> +MKFILELIST = "vecadd/Makefile vecadd_complex/Makefile dsplib_fft/Makefile \
> +null/Makefile dspheap/Makefile target_implicit_map/Makefile printf_debug/Makefile \
> +edmamgr/Makefile vecadd_t/Makefile target_orphan_call/Makefile target_update/Makefile \
> +edmabw/Makefile sub_section/Makefile vecadd_lib/Makefile local/Makefile"
> +
> +do_configure() {
> +    sed "s|arm-linux-gnueabihf-gcc|${CC}|g" -i make.inc
> +    sed "s|arm-linux-gnueabihf-g++|${CXX}|g" -i make.inc
> +    for f in ${MKFILELIST}; do
> +        sed "s|-fopenmp|-fopenmp ${TUNE_CCARGS}${TOOLCHAIN_OPTIONS}|g" -i $f
> +    done
> +}
> +
>   do_compile() {
>       oe_runmake
>   }


