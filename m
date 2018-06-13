Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 425FE5299A
	for <meta-arago@arago-project.org>;
	Wed, 13 Jun 2018 18:18:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5DII0IO019096
	for <meta-arago@arago-project.org>; Wed, 13 Jun 2018 13:18:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528913880;
	bh=8+ZRoeu7WYOFg1YsJm8BUe8T7ir2rrmn32NAGz2GmCA=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=OtcWCmEqNWFh6vvz6lEEE1mtW7lCsBjhlWvJ1Kfti+08gcwDuS2UDGN30c+D9NqZP
	wTZLjOSWz/6BFLKQpmA6dnID/fwyID8VyfY+suyIBRShduhoX/m2PLrfM9NVktyp8a
	T8d/ofPdWEitG+DVFXe6yzc/KMI9nINLVyQeClPo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5DII0uV011184
	for <meta-arago@arago-project.org>; Wed, 13 Jun 2018 13:18:00 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 13 Jun 2018 13:17:59 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 13 Jun 2018 13:17:59 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5DIHtZk015263;
	Wed, 13 Jun 2018 13:17:57 -0500
To: Sam Nelson <sam.nelson@ti.com>, <meta-arago@arago-project.org>
References: <1528745153-36003-1-git-send-email-sam.nelson@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <d063b42c-7cc7-2071-71a7-88cacda77bd0@ti.com>
Date: Wed, 13 Jun 2018 14:17:55 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1528745153-36003-1-git-send-email-sam.nelson@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH v2] ti-tisdk-makefile: Update to fix issue with ipc builds from linux
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
X-List-Received-Date: Wed, 13 Jun 2018 18:18:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I don't see any change from the first version.


On 6/11/2018 3:25 PM, Sam Nelson wrote:
> setupenv.sh in PRSDK is getting deprecated and all the definitions moved
> to Rules.make. With this change, Rules.make from RTOS package is
> directly used.
>
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>   .../ti-tisdk-makefile/Makefile_big-data-ipc-demo   | 21 +++++++----------
>   .../ti-tisdk-makefile/Makefile_ti-ipc              | 27 +++++++++++-----------
>   .../ti-tisdk-makefile_1.0.bbappend                 |  6 ++---
>   3 files changed, 25 insertions(+), 29 deletions(-)
>
> diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_big-data-ipc-demo b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_big-data-ipc-demo
> index 32bb398..ea6ae34 100644
> --- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_big-data-ipc-demo
> +++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_big-data-ipc-demo
> @@ -19,14 +19,12 @@ big-data-ipc-demo-linux:
>   	@echo     Building the big data ipc demo: Linux host
>   	@echo ==================================================
>   	@cd example-applications; cd `find . -name "*big-data-ipc-demo-linux*"`; \
> -	SDK_INSTALL_PATH=$(TI_RTOS_PATH_ABS) source $(TI_PRSDK_PATH)/setupenv.sh > /dev/null; \
> -	source $(ENV_SETUP); \
> -	make -j $(MAKE_JOBS) host_linux \
> -		PLATFORM="$${IPC_PLATFORM}" \
> +	$(MAKE) -j $(MAKE_JOBS) host_linux \
> +		PLATFORM="$(IPC_PLATFORM)" \
>   		KERNEL_INSTALL_DIR="$(LINUXKERNEL_INSTALL_DIR)" \
> -		XDC_INSTALL_DIR="$${XDC_INSTALL_PATH}" \
> -		BIOS_INSTALL_DIR="$${BIOS_INSTALL_PATH}" \
> -		IPC_INSTALL_DIR="$${IPC_INSTALL_PATH}" \
> +		XDC_INSTALL_DIR="$(XDC_INSTALL_PATH)" \
> +		BIOS_INSTALL_DIR="$(BIOS_INSTALL_PATH)" \
> +		IPC_INSTALL_DIR="$(IPC_INSTALL_PATH)" \
>   		TOOLCHAIN_LONGNAME=$${TOOLCHAIN_SYS} \
>   		TOOLCHAIN_INSTALL_DIR=$${SDK_PATH_NATIVE}/usr \
>   		TOOLCHAIN_PREFIX=$(CROSS_COMPILE) \
> @@ -44,17 +42,14 @@ big-data-ipc-demo-linux_install:
>   	fi
>   	@cd example-applications; \
>   	cd `find . -name "*big-data-ipc-demo-linux*"`; \
> -	SDK_INSTALL_PATH=$(TI_RTOS_PATH_ABS) source $(TI_PRSDK_PATH)/setupenv.sh > /dev/null; \
> -	source $(ENV_SETUP); \
>   	$(MAKE) -j $(MAKE_JOBS) install_linux_bin DESTDIR=$(DESTDIR) \
> -	PLATFORM="$${IPC_PLATFORM}"
> +	PLATFORM="$(IPC_PLATFORM)"
>   
>   big-data-ipc-demo-linux_clean:
>   	@echo ==================================================
>   	@echo     Cleaning the big data ipc demo: Linux host
>   	@echo ==================================================
>   	@cd example-applications; cd `find . -name "*big-data-ipc-demo-linux*"`; \
> -	SDK_INSTALL_PATH=$(TI_RTOS_PATH_ABS) source $(TI_PRSDK_PATH)/setupenv.sh > /dev/null; \
> -	source $(ENV_SETUP); \
>   	$(MAKE) -j $(MAKE_JOBS) clean_linux \
> -	PLATFORM="$${IPC_PLATFORM}"
> +	PLATFORM="$(IPC_PLATFORM)"
> +
> diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc
> index f1721c7..49aefb3 100644
> --- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc
> +++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc
> @@ -15,10 +15,15 @@ endif
>   TI_IPC_CLEAN = $(addsuffix _clean, $(TI_IPC_TARGETS))
>   TI_IPC_INSTALL = $(addsuffix _install, $(TI_IPC_TARGETS))
>   
> +ifneq ($(TI_RTOS_PATH),)
>   export TI_PRSDK_PATH=$(TI_RTOS_PATH_ABS)/processor_sdk_rtos_$(PRSDK_PLATFORM)_$(PRSDK_VERSION)
> +export SDK_INSTALL_PATH=$(TI_RTOS_PATH_ABS)
> +include $(TI_PRSDK_PATH)/Rules.make
>   
>   export IPC_TOOLS_PATHS=__IPC_TOOLS_PATHS__
>   
> +endif
> +
>   ti-ipc-rtos-missing ti-ipc-rtos-missing_clean ti-ipc-rtos-missing_install:
>   	@echo
>   	@echo ===========================================================
> @@ -91,15 +96,13 @@ ti-ipc-linux-examples: ti-ipc-rtos-path-check
>   	@echo =================================
>   	@echo     Building the IPC Examples
>   	@echo =================================
> -	SDK_INSTALL_PATH=$(TI_RTOS_PATH_ABS) source $(TI_PRSDK_PATH)/setupenv.sh > /dev/null; \
> -	source $(ENV_SETUP); \
>   	$(MAKE) -j $(MAKE_JOBS) -C $${IPC_INSTALL_PATH}/examples \
>   		HOSTOS="linux" \
> -		PLATFORM="$${IPC_PLATFORM}" \
> +		PLATFORM="$(IPC_PLATFORM)" \
>   		KERNEL_INSTALL_DIR="$(LINUXKERNEL_INSTALL_DIR)" \
> -		XDC_INSTALL_DIR="$${XDC_INSTALL_PATH}" \
> -		BIOS_INSTALL_DIR="$${BIOS_INSTALL_PATH}" \
> -		IPC_INSTALL_DIR="$${IPC_INSTALL_PATH}" \
> +		XDC_INSTALL_DIR="$(XDC_INSTALL_PATH)" \
> +		BIOS_INSTALL_DIR="$(BIOS_INSTALL_PATH)" \
> +		IPC_INSTALL_DIR="$(IPC_INSTALL_PATH)" \
>   		TOOLCHAIN_LONGNAME=$${TOOLCHAIN_SYS} \
>   		TOOLCHAIN_INSTALL_DIR=$${SDK_PATH_NATIVE}/usr \
>   		TOOLCHAIN_PREFIX=$(CROSS_COMPILE) \
> @@ -114,11 +117,9 @@ ti-ipc-linux-examples_install: ti-ipc-rtos-path-check ti-ipc-linux-examples
>   		echo "Please run setup.sh in the SDK's root directory and then try again."; \
>   		exit 1; \
>   	fi
> -	SDK_INSTALL_PATH=$(TI_RTOS_PATH_ABS) source $(TI_PRSDK_PATH)/setupenv.sh > /dev/null; \
> -	source $(ENV_SETUP); \
>   	$(MAKE) -j $(MAKE_JOBS) -C $${IPC_INSTALL_PATH}/examples install \
>   		HOSTOS="linux" \
> -		PLATFORM="$${IPC_PLATFORM}" \
> +		PLATFORM="$(IPC_PLATFORM)" \
>   		EXEC_DIR="$(EXEC_DIR)"
>   
>   ti-ipc-linux-examples_clean: ti-ipc-rtos-path-check
> @@ -129,11 +130,11 @@ ti-ipc-linux-examples_clean: ti-ipc-rtos-path-check
>   	source $(ENV_SETUP); \
>   	$(MAKE) -j $(MAKE_JOBS) -C $${IPC_INSTALL_PATH}/examples clean \
>   		HOSTOS="linux" \
> -		PLATFORM="$${IPC_PLATFORM}" \
> +		PLATFORM="$(IPC_PLATFORM)" \
>   		KERNEL_INSTALL_DIR="$(LINUXKERNEL_INSTALL_DIR)" \
> -		XDC_INSTALL_DIR="$${XDC_INSTALL_PATH}" \
> -		BIOS_INSTALL_DIR="$${BIOS_INSTALL_PATH}" \
> -		IPC_INSTALL_DIR="$${IPC_INSTALL_PATH}" \
> +		XDC_INSTALL_DIR="$(XDC_INSTALL_PATH)" \
> +		BIOS_INSTALL_DIR="$(BIOS_INSTALL_PATH)" \
> +		IPC_INSTALL_DIR="$(IPC_INSTALL_PATH)" \
>   		TOOLCHAIN_LONGNAME=$${TOOLCHAIN_SYS} \
>   		TOOLCHAIN_INSTALL_DIR=$${SDK_PATH_NATIVE}/usr \
>   		TOOLCHAIN_PREFIX=$(CROSS_COMPILE) \
> diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
> index 27a8b2b..b7399c7 100644
> --- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
> +++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
> @@ -71,9 +71,9 @@ KERNEL_DEVICETREE_append_am57xx-evm = " \
>   "
>   
>   
> -IPC_TOOLS_PATHS_C66 = "ti.targets.elf.C66="\$\${C6X_GEN_INSTALL_PATH}""
> -IPC_TOOLS_PATHS_M4  = "ti.targets.arm.elf.M4="\$\${TOOLCHAIN_PATH_M4}" ti.targets.arm.elf.M4F="\$\${TOOLCHAIN_PATH_M4}""
> -IPC_TOOLS_PATHS_C674 = "ti.targets.elf.C674="\$\${C6X_GEN_INSTALL_PATH}""
> +IPC_TOOLS_PATHS_C66 = "ti.targets.elf.C66="\$\(C6X_GEN_INSTALL_PATH\)""
> +IPC_TOOLS_PATHS_M4  = "ti.targets.arm.elf.M4="\$\(TOOLCHAIN_PATH_M4\)" ti.targets.arm.elf.M4F="\$\(TOOLCHAIN_PATH_M4\)""
> +IPC_TOOLS_PATHS_C674 = "ti.targets.elf.C674="\$\(C6X_GEN_INSTALL_PATH\)""
>   
>   IPC_TOOLS_PATHS = ""
>   IPC_TOOLS_PATHS_append_keystone = " ${IPC_TOOLS_PATHS_C66}"


