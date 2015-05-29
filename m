Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8472652A83
	for <meta-arago@arago-project.org>;
	Fri, 29 May 2015 20:02:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4TK2BGQ008896
	for <meta-arago@arago-project.org>; Fri, 29 May 2015 15:02:11 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TK2BEY009235
	for <meta-arago@arago-project.org>; Fri, 29 May 2015 15:02:11 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 May 2015 15:02:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TK2AxN032044;
	Fri, 29 May 2015 15:02:10 -0500
Date: Fri, 29 May 2015 16:02:10 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150529200210.GW16418@edge>
References: <1432811095-3754-1-git-send-email-j-stiffler@ti.com>
	<1432811095-3754-6-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1432811095-3754-6-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 5/5] ti-tisdk-makefile: Add debugss-module-drv makefile fragment.
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
X-List-Received-Date: Fri, 29 May 2015 20:02:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Thu, May 28, 2015 at 07:04:55AM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../ti-tisdk-makefile/Makefile_debugss-module-drv  |   29 ++++++++++++++++++++
>  .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |   11 ++++++--
>  2 files changed, 38 insertions(+), 2 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_debugss-module-drv
> 
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_debugss-module-drv b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_debugss-module-drv
> new file mode 100644
> index 0000000..fde7aca
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_debugss-module-drv
> @@ -0,0 +1,29 @@
> +debugss-module-drv: linux
> +	@echo =======================================
> +	@echo      Building debugss-module-drv
> +	@echo =======================================
> +	@cd board-support/extra-drivers; \
> +	cd `find . -maxdepth 1 -name "debugss*"`; \
> +	make ARCH=arm KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR) PLATFORM=__PLATFORM_DEBUGSS__
> +
> +debugss-module-drv_clean:
> +	@echo =======================================
> +	@echo      Cleaning debugss-module-drv
> +	@echo =======================================
> +	@cd board-support/extra-drivers; \
> +	cd `find . -maxdepth 1 -name "debugss*"`; \
> +	make ARCH=arm KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR) PLATFORM=__PLATFORM_DEBUGSS__ clean
> +
> +debugss-module-drv_install:
> +	@echo =======================================
> +	@echo      Installing debugss-module-drv
> +	@echo =======================================
> +	@if [ ! -d $(DESTDIR) ] ; then \
> +		echo "The extracted target filesystem directory doesn't exist."; \
> +		echo "Please run setup.sh in the SDK's root directory and then try again."; \
> +		exit 1; \
> +	fi
> +	@cd board-support/extra-drivers; \
> +	cd `find . -maxdepth 1 -name "debugss*"`; \
> +	make ARCH=arm  KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) PLATFORM=__PLATFORM_DEBUGSS__ modules_install
> +
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> index eedf097..aaaa173 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> @@ -36,9 +36,10 @@ SRC_URI = "\
>      file://Makefile_cryptodev \
>      file://Makefile_sgx-modules \
>      file://Makefile_cmem-mod \
> +    file://Makefile_debugss-module-drv \
>  "
>  
> -PR = "r46"
> +PR = "r47"
>  
>  MAKEFILES_COMMON = "linux \
>                      matrix-gui \
> @@ -84,7 +85,9 @@ MAKEFILES_append_ti43x = " u-boot-spl \
>                             image-gallery \
>  "
>  
> -MAKEFILES_append_dra7xx = " cryptodev"
> +MAKEFILES_append_dra7xx = " cryptodev \
> +                            debugss-module-drv \
> +"
>  
>  MAKEFILES_append_omap-a15 = " u-boot-spl \
>                                ${QUICK_PLAYGROUND} \
> @@ -104,6 +107,9 @@ PLATFORM_SGX = ""
>  PLATFORM_SGX_ti33x = "ti335x"
>  PLATFORM_SGX_ti43x = "ti43xx"
>  
> +PLATFORM_DEBUGSS = ""
> +PLATFORM_DEBUGSS_dra7xx = "DRA7xx_PLATFORM"
> +
>  KERNEL_BUILD_CMDS = "${@base_conditional('KERNEL_IMAGETYPE','uImage','LOADADDR=${UBOOT_LOADADDRESS} uImage','zImage',d)}"
>  
>  KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
> @@ -160,6 +166,7 @@ do_install () {
>      sed -i -e "s/__KERNEL_BUILD_CMDS__/${KERNEL_BUILD_CMDS}/" ${D}/Makefile
>  
>      sed -i -e "s/__PLATFORM_SGX__/${PLATFORM_SGX}/" ${D}/Makefile
> +    sed -i -e "s/__PLATFORM_DEBUGSS__/${PLATFORM_DEBUGSS}/g" ${D}/Makefile
>  
>      cat ${D}/Makefile | grep "__DTB_DEPEND__" > /dev/null
>  
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

