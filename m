Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 032E9520DE
	for <meta-arago@arago-project.org>;
	Fri, 13 Sep 2019 13:34:48 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DDXg02048934
	for <meta-arago@arago-project.org>; Fri, 13 Sep 2019 08:33:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568381622;
	bh=1o6n/7NnONU21iuwIu5JBJEWvlX59yVcCiKfa5ItQhY=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=GI4lraWKzJX/XACuZu/PabOB4A+IsC65/wyDyW0TgKaWQPFEV3Jr2u+KSz/K0ch/t
	hRg3svqWJlbKXVKOVNXdGJqNeLpM+zeyjZyFkjxGlnRtth8X8R9jEFt0J50dQLVLIY
	UaJ0iMGJOa+WQTWh1FD6wagLQuOy236aiJiYV16I=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8DDXgYi131005
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 13 Sep 2019 08:33:42 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 13 Sep 2019 08:33:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 13 Sep 2019 08:33:41 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DDXfpq002517
	for <meta-arago@arago-project.org>; Fri, 13 Sep 2019 08:33:42 -0500
To: <meta-arago@arago-project.org>
References: <1567791131-25912-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <1b556f86-0362-ad39-0803-801d578b6d1b@ti.com>
Date: Fri, 13 Sep 2019 09:33:39 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567791131-25912-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [master/thud][PATCH] ti-tisdk-makefile: sysfw-image: extend support
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
X-List-Received-Date: Fri, 13 Sep 2019 13:34:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please backport to ti2019.03.


Thanks,

Jake

On 9/6/2019 1:32 PM, Jacob Stiffler wrote:
> * extend support to am65xx-hs-evm and j7-evm
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   .../ti-tisdk-makefile/Makefile_sysfw-image         | 28 +++++++++++++++++++++-
>   .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  2 +-
>   2 files changed, 28 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
> index f7b8787..94ee40d 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
> @@ -1,3 +1,29 @@
> +# Define the following to support multple platforms
> +PLATFORM_TYPE_$(PLATFORM) = gp
> +PLATFORM_TYPE_am65xx-hs-evm = hs
> +PLATFORM_TYPE = $(PLATFORM_TYPE_$(PLATFORM))
> +
> +SYSFW_CONFIG = evm
> +
> +SYSFW_SOC_$(PLATFORM) = NULL
> +SYSFW_SOC_am65xx-evm = am65x
> +SYSFW_SOC_am65xx-hs-evm = am65x
> +SYSFW_SOC_j7-evm = j721e
> +SYSFW_SOC = $(SYSFW_SOC_$(PLATFORM))
> +
> +SYSFW_PREFIX = ti-sci-firmware
> +
> +SYSFW_BASE = $(SYSFW_PREFIX)-$(SYSFW_SOC)-$(PLATFORM_TYPE)
> +
> +SYSFW_MAKEARGS_common = SYSFW_DL_URL="" SYSFW_HS_DL_URL="" SYSFW_HS_INNER_CERT_DL_URL="" \
> +                        SYSFW_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/$(SYSFW_BASE).bin \
> +                        SOC=$(SYSFW_SOC) CONFIG=$(SYSFW_CONFIG)
> +
> +SYSFW_MAKEARGS_gp =
> +SYSFW_MAKEARGS_hs = HS=1 SYSFW_HS_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/$(SYSFW_BASE)-enc.bin \
> +                    SYSFW_HS_INNER_CERT_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/$(SYSFW_BASE)-cert.bin
> +
> +SYSFW_MAKEARGS = $(SYSFW_MAKEARGS_common) $(SYSFW_MAKEARGS_$(PLATFORM_TYPE))
>   
>   # Depend on linux-dtbs for the dtc utility
>   sysfw-image: linux-dtbs
> @@ -5,7 +31,7 @@ sysfw-image: linux-dtbs
>   	@echo    Building SYSFW Image
>   	@echo =============================
>   	@cd board-support; cd `find . -maxdepth 1 -type d -name "*system-firmware-image*"`; \
> -		make SYSFW_DL_URL="" SYSFW_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/ti-sci-firmware-am65x-gp.bin CROSS_COMPILE=$(CROSS_COMPILE_ARMV7) PATH=$(PATH):$(LINUXKERNEL_INSTALL_DIR)/scripts/dtc
> +		make $(SYSFW_MAKEARGS) CROSS_COMPILE=$(CROSS_COMPILE_ARMV7) PATH=$(PATH):$(LINUXKERNEL_INSTALL_DIR)/scripts/dtc
>   
>   sysfw-image_clean:
>   	@echo =============================
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> index 99f6523..417b28b 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> @@ -55,7 +55,7 @@ SRC_URI = "\
>       file://Makefile_jailhouse \
>   "
>   
> -PR = "r100"
> +PR = "r101"
>   
>   MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
>                           refresh-screen \

