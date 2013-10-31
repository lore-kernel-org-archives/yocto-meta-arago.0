Return-Path: <heroor@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 607E0529E3
	for <meta-arago@arago-project.org>;
	Thu, 31 Oct 2013 04:18:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9V4Ism5004778
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2013 23:18:54 -0500
Received: from DLEE71.ent.ti.com ([157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9V4IspN022711
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2013 23:18:54 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 30 Oct 2013 23:18:54 -0500
Received: from [172.24.158.58] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9V4IqwS029062	for
	<meta-arago@arago-project.org>; Wed, 30 Oct 2013 23:18:53 -0500
Message-ID: <5271DA2C.8070401@ti.com>
Date: Thu, 31 Oct 2013 09:48:52 +0530
From: Siddharth Heroor <heroor@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <meta-arago@arago-project.org>
References: <1383160055-32615-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1383160055-32615-1-git-send-email-sam.nelson@ti.com>
Subject: Re: [PATCH 1/1] ti-cmem: New recipes for ti-cmem
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
X-List-Received-Date: Thu, 31 Oct 2013 04:18:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/2013 12:37 AM, Sam Nelson wrote:
> - Recipes for ti-cmem which provides user space api for contigous memory allocaion
> - ti-cmem_mod provides the kernel module
> - ti-mem provides the user space library

Why do we need to create a new recipe? The ti-linuxutils in meta-ti 
should be the provider for cmem. Shouldn't that be updated for newer 
versions?
Also, I would suggest that we make it machine compatible with omap-a15.

>
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>   .../recipes-bsp/ti-cmem/ti-cmem-mod.bb             |   40 ++++++++++++++++++++
>   meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb   |   20 ++++++++++
>   meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc  |   10 +++++
>   3 files changed, 70 insertions(+)
>   create mode 100755 meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem-mod.bb
>   create mode 100644 meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb
>   create mode 100644 meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc
>
> diff --git a/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem-mod.bb b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem-mod.bb
> new file mode 100755
> index 0000000..0839c20
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem-mod.bb
> @@ -0,0 +1,40 @@
> +DESCRIPTION="The cmem component module for contiguous memory allocation from userspace "
> +
> +HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:CMEM"
> +
> +LICENSE = "GPLv2"
> +
> +include ti-cmem.inc
> +
> +RDEPENDS_${PN} += "kernel (=${KERNEL_VERSION})"
> +
> +DEPENDS += "virtual/kernel"
> +
> +NAME="cmem"
> +MODULE_BUILD_DIR ="src/cmem/module"
> +
> +# This package builds a kernel module, use kernel PR as base and append a local
> +PR = "${MACHINE_KERNEL_PR}"
> +PR_append = "a"
> +
> +PKG_${PN} = "kernel-module-${PN}"
> +
> +KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit module
> +
> +do_compile () {
> +    cd ${S}
> +    make -f lu.mak module_clean
> +    make -f lu.mak module KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} TOOLCHAIN_PREFIX=${CROSS_COMPILE}
> +}
> +
> +do_install () {
> +    cd ${S}
> +    make -f lu.mak module_install KERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" EXEC_DIR="${D}/lib/modules/${KERNEL_VERSION}/extra" INSTALL_MOD_PATH="${D}"
> +}
> +
> +PACKAGE_STRIP = "no"
> +
> diff --git a/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb
> new file mode 100644
> index 0000000..a106aa0
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION="The cmem component supports contiguous memory allocation from userspace "
> +
> +HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:CMEM"
> +
> +LICENSE = "GPLv2"
> +
> +include ti-cmem.inc
> +
> +DEPENDS = "ti-cmem-mod"
> +
> +S = "${WORKDIR}/git"
> +
> +PR = "r1"
> +
> +PACKAGES =+ "${PN}-test"
> +
> +FILES_${PN}-test = "${bindir}/*"
> +
> +inherit autotools
> +
> diff --git a/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc
> new file mode 100644
> index 0000000..9308b2d
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc
> @@ -0,0 +1,10 @@
> +HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:CMEM"
> +
> +LIC_FILES_CHKSUM = "file://products.mak;beginline=2;endline=30;md5=195feadf798bb4165bcb1a23ffd50dbb"
> +
> +COMPATIBLE_MACHINE = "keystone-evm"
> +
> +BRANCH ?= "master"
> +SRCREV = "4.00.00.06"
> +
> +SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"


