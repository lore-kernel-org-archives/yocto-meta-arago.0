Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A0AC4529D4
	for <meta-arago@arago-project.org>;
	Thu, 17 Sep 2015 20:14:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8HKEIRP009377
	for <meta-arago@arago-project.org>; Thu, 17 Sep 2015 15:14:18 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8HKEIe2011138
	for <meta-arago@arago-project.org>; Thu, 17 Sep 2015 15:14:18 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 17 Sep 2015 15:14:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8HKEIkp012495;
	Thu, 17 Sep 2015 15:14:18 -0500
Date: Thu, 17 Sep 2015 16:14:02 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150917201402.GG18085@edge>
References: <1442423699-24800-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1442423699-24800-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/4] ti-tisdk-makefile: Source ENV_SETUP for certain apps
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
X-List-Received-Date: Thu, 17 Sep 2015 20:14:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Jake,

Do you need these 4 patches now?

On Wed, Sep 16, 2015 at 01:14:56PM -0400, Jacob Stiffler wrote:
> * In moving to the latest toolchain (2015.05) the linker cannot find
>   standard toolchain libraries without help.
> * Use the environment-setup script from the devkit to set the
>   appropriate CFLAGS and LDFLAGS
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo             | 2 +-
>  .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks         | 2 +-
>  .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example       | 2 +-
>  .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples     | 2 +-
>  .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb            | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo
> index 445dd10..9d56246 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo
> @@ -3,7 +3,7 @@ am-sysinfo:
>  	@echo =============================
>  	@echo    Building AM Sysinfo
>  	@echo =============================
> -	@cd example-applications; cd `find . -name "*am-sysinfo*"`; make
> +	@cd example-applications; cd `find . -name "*am-sysinfo*"`; . $(ENV_SETUP); make
>  
>  am-sysinfo_clean:
>  	@echo =============================
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks
> index 0447ea5..2337550 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks
> @@ -3,7 +3,7 @@ arm-benchmarks:
>  	@echo =============================
>  	@echo    Building ARM Benchmarks
>  	@echo =============================
> -	@cd example-applications; cd `find . -name "*arm-benchmarks*"`; make
> +	@cd example-applications; cd `find . -name "*arm-benchmarks*"`; . $(ENV_SETUP); make
>  
>  arm-benchmarks_clean:
>  	@echo =============================
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example
> index c7a4385..bc117c0 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example
> @@ -3,7 +3,7 @@ oprofile-example:
>  	@echo =============================
>  	@echo    Building OProfile Example
>  	@echo =============================
> -	@cd example-applications; cd `find . -name "*oprofile-example*"`; make
> +	@cd example-applications; cd `find . -name "*oprofile-example*"`; . $(ENV_SETUP); make
>  
>  oprofile-example_clean:
>  	@echo =============================
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
> index 9ab9616..d166245 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
> @@ -3,7 +3,7 @@ ti-crypto-examples:
>  	@echo =================================
>  	@echo    Building TI Crypto Examples
>  	@echo =================================
> -	@cd example-applications; cd `find . -name "*ti-crypto-examples*"`; make release
> +	@cd example-applications; cd `find . -name "*ti-crypto-examples*"`; . $(ENV_SETUP); make release
>  
>  ti-crypto-examples_clean:
>  	@echo =================================
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> index a770117..4947c94 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> @@ -41,7 +41,7 @@ SRC_URI = "\
>      file://Makefile_omapdrm-pvr \
>  "
>  
> -PR = "r51"
> +PR = "r52"
>  
>  MAKEFILES_COMMON = "linux \
>                      matrix-gui \
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

