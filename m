Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 938D15298D
	for <meta-arago@arago-project.org>;
	Wed,  3 Jul 2019 19:42:27 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x63JffqW112642
	for <meta-arago@arago-project.org>; Wed, 3 Jul 2019 14:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562182901;
	bh=qfIVpeICRlL1dUAFTiOkiLUMJMbDD8sTCcreMFxa4pE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=tZN00MZb9lNdJk3Sa4bntOL7amQnuxg3fG3oHH2PZE9hDgB/zK67/Np6VBzHwAfc2
	C7UblYE2H5wIpaLjqA2vq8Odqet57SCX3qmi2ehBLhaSiB4m8qsQATVMD69LaP0oEt
	M+4DsvDvDy8xf8QLc4Pl0YuuQVde7eFLEeHyDv6E=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x63JffiR065160
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 3 Jul 2019 14:41:41 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 3 Jul 2019 14:41:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 3 Jul 2019 14:41:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x63JffdN064832;
	Wed, 3 Jul 2019 14:41:41 -0500
Date: Wed, 3 Jul 2019 15:41:41 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20190703194141.GA18265@beryl>
References: <1562175997-5821-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1562175997-5821-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/thud][PATCH] ti-sdk-makefile: add sysroot option to CC
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
X-List-Received-Date: Wed, 03 Jul 2019 19:42:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jul 03, 2019 at 01:46:37PM -0400, Jacob Stiffler wrote:
> * When using the OE toolchain in the devkit, the sysroot option is
>   required, so add this to the default CC in Rules.make
> * Also, this does not have any negative impact when the external
>   toolchain is packaged in the devkit.
> * Update the fragments which break without the sysroot option.
> 
> See 31702588e02cdcf466b2b6f153ce9604e3cd105a
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo             | 2 +-
>  .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks         | 2 +-
>  .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example       | 2 +-
>  .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make        | 2 +-
>  .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb            | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo
> index 445dd10..e198350 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo
> @@ -3,7 +3,7 @@ am-sysinfo:
>  	@echo =============================
>  	@echo    Building AM Sysinfo
>  	@echo =============================
> -	@cd example-applications; cd `find . -name "*am-sysinfo*"`; make
> +	@cd example-applications; cd `find . -name "*am-sysinfo*"`; make CC="$(CC)"
>  
>  am-sysinfo_clean:
>  	@echo =============================
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks
> index 0447ea5..9a1f8aa 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks
> @@ -3,7 +3,7 @@ arm-benchmarks:
>  	@echo =============================
>  	@echo    Building ARM Benchmarks
>  	@echo =============================
> -	@cd example-applications; cd `find . -name "*arm-benchmarks*"`; make
> +	@cd example-applications; cd `find . -name "*arm-benchmarks*"`; make CC="$(CC)"
>  
>  arm-benchmarks_clean:
>  	@echo =============================
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example
> index c7a4385..1e4793b 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example
> @@ -3,7 +3,7 @@ oprofile-example:
>  	@echo =============================
>  	@echo    Building OProfile Example
>  	@echo =============================
> -	@cd example-applications; cd `find . -name "*oprofile-example*"`; make
> +	@cd example-applications; cd `find . -name "*oprofile-example*"`; make CC="$(CC)"
>  
>  oprofile-example_clean:
>  	@echo =============================
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
> index fad8045..bfee2fc 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
> @@ -25,7 +25,7 @@ export CROSS_COMPILE=$(LINUX_DEVKIT_PATH)/sysroots/__SDKMACHINE__-arago-linux/us
>  
>  #Default CC value to be used when cross compiling.  This is so that the
>  #GNU Make default of "cc" is not used to point to the host compiler
> -export CC=$(CROSS_COMPILE)gcc
> +export CC=$(CROSS_COMPILE)gcc --sysroot=$(SDK_PATH_TARGET)

I see you overwrite CC here - do you use environment-setup script?

>  #Location of environment-setup file
>  export ENV_SETUP=$(LINUX_DEVKIT_PATH)/environment-setup

And it's listed here. Shouldn't CC come from this script instead?

BTW, defining just CC may not be enough for some cases - CPP, CXX, LD, etc. 
are also needed and set in there. I wonder if there's too much customization 
going on in the tisdk-makefile...


> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> index 87f7150..9131a71 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> @@ -54,7 +54,7 @@ SRC_URI = "\
>      file://Makefile_pdm-anomaly-detection \
>  "
>  
> -PR = "r96"
> +PR = "r97"
>  
>  MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
>                          refresh-screen \
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

