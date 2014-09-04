Return-Path: <ceh@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 01BC5529D5
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 20:50:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84Kod7v001600;
	Thu, 4 Sep 2014 15:50:39 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84Kod7E001019;
	Thu, 4 Sep 2014 15:50:39 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 15:50:38 -0500
Received: from [158.218.103.10] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84KocfX024812;
	Thu, 4 Sep 2014 15:50:38 -0500
Message-ID: <5408D09E.7030708@ti.com>
Date: Thu, 4 Sep 2014 16:50:38 -0400
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>
References: <1409861210-28560-1-git-send-email-denis@denix.org>
In-Reply-To: <1409861210-28560-1-git-send-email-denis@denix.org>
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] recipes: HACK: disable parallel make for out-of-tree modules due to fixdep race
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
X-List-Received-Date: Thu, 04 Sep 2014 20:50:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Carlos Hernandez <ceh@ti.com>

On 09/04/2014 04:06 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> * The fixdep race happens in the kernel tree when building out-of-tree modules
> * It is intermittent and doesn't happen allways, but depend on high # of threads
> * Need to investigate it further, but currently it's blocking release builds
> * There's a previous report on LKML:
> https://groups.google.com/forum/#!msg/linux.kernel/j4DdW77nM60/QhgPF1jhKe4J
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Cc: Carlos Hernandez <ceh@ti.com>
> ---
>   .../recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend              | 4 +++-
>   .../recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend       | 4 +++-
>   .../ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb     | 9 +++++----
>   3 files changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
> index 8915917..8acb67a 100644
> --- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
> +++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
> @@ -1,4 +1,6 @@
> -PR_append = "-arago4+gitr${SRCPV}"
> +PR_append = "-arago5+gitr${SRCPV}"
> +
> +PARALLEL_MAKE = ""
>   
>   RDEPENDS_${PN} += "linaro-pm-qa-utils"
>   
> diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend
> index 7be7536..52bb6db 100644
> --- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend
> +++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend
> @@ -1,4 +1,6 @@
> -PR_append = "-arago2"
> +PR_append = "-arago3"
> +
> +PARALLEL_MAKE = ""
>   
>   module_autoload_cryptodev = "cryptodev-module"
>   
> diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb
> index dca2edb..fe75284 100644
> --- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb
> +++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb
> @@ -12,7 +12,9 @@ RDEPENDS_${PN} = "wireless-tools"
>   PV = "r8.a9.14"
>   inherit module
>   
> -PR = "${MACHINE_KERNEL_PR}+a+gitr${SRCPV}"
> +PR = "${MACHINE_KERNEL_PR}+b+gitr${SRCPV}"
> +
> +PARALLEL_MAKE = ""
>   
>   # Tags: ol_r8.a9.14
>   SRCREV_wl18xx = "0e48c4b55cfa0d557a098cbe92b1f092f1a9ad67"
> @@ -26,7 +28,7 @@ S = "${WORKDIR}/compat-wireless"
>   
>   SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx.git;branch=${BRANCH_wl18xx};destsuffix=wl18xx;name=wl18xx \
>              git://git.ti.com/wilink8-wlan/backports.git;branch=${BRANCH_backports};destsuffix=backports;name=backports \
> - "
> +"
>   
>   export KLIB_BUILD="${STAGING_KERNEL_DIR}"
>   export KLIB="${D}"
> @@ -41,11 +43,10 @@ do_configure() {
>       make defconfig-wl18xx
>   
>       # Now generate the sourceipk with the properly configured sources
> -	sourceipk_do_create_srcipk
> +    sourceipk_do_create_srcipk
>   }
>   
>   do_install() {
>       # Install modules
>       oe_runmake modules_install
>   }
> -


