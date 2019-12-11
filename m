Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id A6ACF529BC
	for <meta-arago@arago-project.org>;
	Wed, 11 Dec 2019 18:06:38 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBBI51vk129928
	for <meta-arago@arago-project.org>; Wed, 11 Dec 2019 12:05:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576087501;
	bh=ZeEfFgEzDqnYFQgl+DpHHSLhoCggG/H2AHwkCbuSOxw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=OkZDLcAFBgBA/K//MYqwQuhnLyerK8xHHzXk7Xangjy5dmE+5ZBdZvPAaEJ4VEX8P
	V+YuAvqYV4bo14Zr3VhmVvj6Ri7ObM8F9/qFjbqloAsRwhbZMpsdAxmHHWVpLtao5u
	4UXCnfZZLGNy3ccz4a/rvmrrcKrDmSsY9VZ5uxE8=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBBI5121091191
	for <meta-arago@arago-project.org>; Wed, 11 Dec 2019 12:05:01 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 11 Dec 2019 12:05:01 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 11 Dec 2019 12:05:01 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBBI50rG058748;
	Wed, 11 Dec 2019 12:05:00 -0600
To: Denys Dmytriyenko <denys@ti.com>, <meta-arago@arago-project.org>
References: <1576004680-14425-1-git-send-email-denys@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <bf99bc50-c337-406f-15f7-9a2ee88d0f71@ti.com>
Date: Wed, 11 Dec 2019 13:05:00 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1576004680-14425-1-git-send-email-denys@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [EXTERNAL] [tisdk-setup-scripts][PATCH] setup-uboot-env-*: replace ifconfig with ip addr show
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
X-List-Received-Date: Wed, 11 Dec 2019 18:06:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Pushed to master.


Thank you,

Jake

On 12/10/2019 2:04 PM, Denys Dmytriyenko wrote:
> Simple ifconfig has been deprecated for quite some time in favor of ip tools.
> New distros no longer package ifconfig, so use ip addr show command instead.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Cc: Andreas Dannenberg <dannenberg@ti.com>
> ---
>   setup-uboot-env-am18x.sh       | 2 +-
>   setup-uboot-env-am335x.sh      | 2 +-
>   setup-uboot-env-am3517.sh      | 2 +-
>   setup-uboot-env-am37x.sh       | 2 +-
>   setup-uboot-env-am43x.sh       | 2 +-
>   setup-uboot-env-am57xx-evm.sh  | 2 +-
>   setup-uboot-env-am65x.sh       | 2 +-
>   setup-uboot-env-beagleboard.sh | 2 +-
>   setup-uboot-env-k2g-evm.sh     | 2 +-
>   setup-uboot-env-keystone.sh    | 2 +-
>   setup-uboot-env-omap5.sh       | 2 +-
>   11 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/setup-uboot-env-am18x.sh b/setup-uboot-env-am18x.sh
> index 8c296e5..3733281 100644
> --- a/setup-uboot-env-am18x.sh
> +++ b/setup-uboot-env-am18x.sh
> @@ -42,7 +42,7 @@ SDKinstall=`grep TI_SDK_PATH= $cwd/../Rules.make | cut -d= -f2`
>   dstdefault=$SDKinstall/targetNFS
>   
>   
> -ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
> +ipdefault=`ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d/ -f1 | awk '{ print $2 }'`
>   platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
>   prompt=" >"
>   
> diff --git a/setup-uboot-env-am335x.sh b/setup-uboot-env-am335x.sh
> index 80b0a52..f129875 100644
> --- a/setup-uboot-env-am335x.sh
> +++ b/setup-uboot-env-am335x.sh
> @@ -51,7 +51,7 @@ echo "--------------------------------------------------------------------------
>   echo "This step will set up the U-Boot variables for booting the EVM."
>   echo
>   
> -ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
> +ipdefault=`ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d/ -f1 | awk '{ print $2 }'`
>   platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
>   
>   # Configure prompt for U-Boot 2016.05
> diff --git a/setup-uboot-env-am3517.sh b/setup-uboot-env-am3517.sh
> index 73e9971..49dda0a 100644
> --- a/setup-uboot-env-am3517.sh
> +++ b/setup-uboot-env-am3517.sh
> @@ -37,7 +37,7 @@ echo
>   echo "--------------------------------------------------------------------------------"
>   echo "This step will set up the u-boot variables for booting the EVM."
>   
> -ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
> +ipdefault=`ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d/ -f1 | awk '{ print $2 }'`
>   platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
>   prompt="EVM #"
>   
> diff --git a/setup-uboot-env-am37x.sh b/setup-uboot-env-am37x.sh
> index e9970d6..eab332b 100644
> --- a/setup-uboot-env-am37x.sh
> +++ b/setup-uboot-env-am37x.sh
> @@ -37,7 +37,7 @@ echo
>   echo "--------------------------------------------------------------------------------"
>   echo "This step will set up the u-boot variables for booting the EVM."
>   
> -ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
> +ipdefault=`ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d/ -f1 | awk '{ print $2 }'`
>   platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
>   prompt="EVM #"
>   
> diff --git a/setup-uboot-env-am43x.sh b/setup-uboot-env-am43x.sh
> index f7f2d95..24bc58a 100644
> --- a/setup-uboot-env-am43x.sh
> +++ b/setup-uboot-env-am43x.sh
> @@ -51,7 +51,7 @@ echo "--------------------------------------------------------------------------
>   echo "This step will set up the u-boot variables for booting the EVM."
>   echo
>   
> -ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
> +ipdefault=`ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d/ -f1 | awk '{ print $2 }'`
>   platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
>   
>   # Configure prompt for U-Boot 2016.05
> diff --git a/setup-uboot-env-am57xx-evm.sh b/setup-uboot-env-am57xx-evm.sh
> index 574c111..323c134 100644
> --- a/setup-uboot-env-am57xx-evm.sh
> +++ b/setup-uboot-env-am57xx-evm.sh
> @@ -51,7 +51,7 @@ echo "--------------------------------------------------------------------------
>   echo "This step will set up the u-boot variables for booting the EVM."
>   echo "--------------------------------------------------------------------------------"
>   
> -ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
> +ipdefault=`ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d/ -f1 | awk '{ print $2 }'`
>   platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
>   
>   # Configure prompt for U-Boot 2016.05
> diff --git a/setup-uboot-env-am65x.sh b/setup-uboot-env-am65x.sh
> index 6335ce4..e17f700 100644
> --- a/setup-uboot-env-am65x.sh
> +++ b/setup-uboot-env-am65x.sh
> @@ -51,7 +51,7 @@ echo "--------------------------------------------------------------------------
>   echo "This step will set up the u-boot variables for booting the EVM."
>   echo "--------------------------------------------------------------------------------"
>   
> -ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
> +ipdefault=`ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d/ -f1 | awk '{ print $2 }'`
>   platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
>   
>   # Configure prompt for U-Boot 2016.05
> diff --git a/setup-uboot-env-beagleboard.sh b/setup-uboot-env-beagleboard.sh
> index bc237ae..60ca7d6 100644
> --- a/setup-uboot-env-beagleboard.sh
> +++ b/setup-uboot-env-beagleboard.sh
> @@ -37,7 +37,7 @@ echo
>   echo "--------------------------------------------------------------------------------"
>   echo "This step will set up the u-boot variables for booting the EVM."
>   
> -ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
> +ipdefault=`ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d/ -f1 | awk '{ print $2 }'`
>   platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
>   prompt="OMAP3 beagleboard.org #"
>   
> diff --git a/setup-uboot-env-k2g-evm.sh b/setup-uboot-env-k2g-evm.sh
> index 4944f99..5845f2d 100755
> --- a/setup-uboot-env-k2g-evm.sh
> +++ b/setup-uboot-env-k2g-evm.sh
> @@ -78,7 +78,7 @@ echo "--------------------------------------------------------------------------
>   echo "This step will set up the u-boot variables for booting the EVM."
>   echo "--------------------------------------------------------------------------------"
>   
> -ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
> +ipdefault=`ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d/ -f1 | awk '{ print $2 }'`
>   platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
>   
>   # Configure prompt for U-Boot 2016.05
> diff --git a/setup-uboot-env-keystone.sh b/setup-uboot-env-keystone.sh
> index 37fb2c1..3a443dd 100755
> --- a/setup-uboot-env-keystone.sh
> +++ b/setup-uboot-env-keystone.sh
> @@ -154,7 +154,7 @@ echo "--------------------------------------------------------------------------
>   echo "This step will set up the u-boot variables for booting the EVM."
>   echo "--------------------------------------------------------------------------------"
>   
> -ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
> +ipdefault=`ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d/ -f1 | awk '{ print $2 }'`
>   platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
>   
>   # Configure prompt for U-Boot 2016.05
> diff --git a/setup-uboot-env-omap5.sh b/setup-uboot-env-omap5.sh
> index 7b6f084..7fba3ef 100644
> --- a/setup-uboot-env-omap5.sh
> +++ b/setup-uboot-env-omap5.sh
> @@ -37,7 +37,7 @@ echo
>   echo "--------------------------------------------------------------------------------"
>   echo "This step will set up the u-boot variables for booting the EVM."
>   
> -ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
> +ipdefault=`ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d/ -f1 | awk '{ print $2 }'`
>   platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
>   prompt="$prompt"
>   

