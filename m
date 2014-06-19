Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8FFAB529C2
	for <meta-arago@arago-project.org>;
	Thu, 19 Jun 2014 16:18:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5JGIBoe013945
	for <meta-arago@arago-project.org>; Thu, 19 Jun 2014 11:18:11 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5JGIBAR001522
	for <meta-arago@arago-project.org>; Thu, 19 Jun 2014 11:18:11 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 19 Jun 2014 11:18:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5JGIAGR015775;
	Thu, 19 Jun 2014 11:18:10 -0500
Date: Thu, 19 Jun 2014 12:18:09 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20140619161808.GP1825@edge>
References: <1403103711-15485-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1403103711-15485-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2] toolchain-*.inc: Replace variable overrides with bb.utils function
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
X-List-Received-Date: Thu, 19 Jun 2014 16:18:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jun 18, 2014 at 10:01:51AM -0500, Franklin S. Cooper Jr wrote:
> * Conf files are unable to use variable overrides instead bitbake utility
>   functions are needed to mimic the functionality.
> * Currently the DEFAULTTUNE variable isn't being set properly for non Cortex A8
>   devices which causes uses when using an architecture override for non Cortex
>   A8 devices.
> * This issue was first discovered due to the inability to build valgrind for
>   am43x and via testing determined that this affected any non Cortex A8 machine/SOC_FAMILY
>   within meta-ti.

Ok, so skipping the DEFAULTTUNE override issues for now, why would it affect 
valgrind and it's COMPATIBLE_HOST setting?


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
> Version 2 changes:
> Remove all the extra spaces
> 
>  .../conf/distro/include/toolchain-gcc.inc          |    7 ++++---
>  .../conf/distro/include/toolchain-linaro.inc       |    9 +++++----
>  2 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
> index f7c8032..8388d13 100644
> --- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
> +++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
> @@ -3,9 +3,10 @@ TCMODE = "default"
>  TCLIBC = "eglibc"
>  
>  DEFAULTTUNE = "cortexa8thf-neon"
> -DEFAULTTUNE_omap-a15 = "cortexa15thf-neon"
> -DEFAULTTUNE_keystone = "cortexa15thf-neon"
> -DEFAULTTUNE_omap4 = "cortexa9thf-neon"
> +DEFAULTTUNE := "${@bb.utils.contains('SOC_FAMILY','ti43x','cortexa9thf-neon','${DEFAULTTUNE}',d)}"
> +DEFAULTTUNE := "${@bb.utils.contains('SOC_FAMILY','omap-a15','cortexa15thf-neon','${DEFAULTTUNE}',d)}"
> +DEFAULTTUNE := "${@bb.utils.contains('SOC_FAMILY','keystone','cortexa15thf-neon','${DEFAULTTUNE}',d)}"
> +DEFAULTTUNE := "${@bb.utils.contains('SOC_FAMILY','omap4','cortexa9thf-neon','${DEFAULTTUNE}',d)}"
>  
>  # Match some of the external vars
>  TOOLCHAIN_SYS := "${TARGET_SYS}"
> diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> index 95269a7..0418359 100644
> --- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> +++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> @@ -3,11 +3,12 @@ TCMODE = "external-linaro"
>  TCLIBC = "external-linaro-toolchain"
>  
>  ELT_TARGET_SYS = "arm-linux-gnueabihf"
> +
>  DEFAULTTUNE = "cortexa8thf-neon"
> -DEFAULTTUNE_omap-a15 = "cortexa15thf-neon"
> -DEFAULTTUNE_keystone = "cortexa15thf-neon"
> -DEFAULTTUNE_omap4 = "cortexa9thf-neon"
> -DEFAULTTUNE_ti43x = "cortexa9thf-neon"
> +DEFAULTTUNE := "${@bb.utils.contains('SOC_FAMILY','ti43x','cortexa9thf-neon','${DEFAULTTUNE}',d)}"
> +DEFAULTTUNE := "${@bb.utils.contains('SOC_FAMILY','omap-a15','cortexa15thf-neon','${DEFAULTTUNE}',d)}"
> +DEFAULTTUNE := "${@bb.utils.contains('SOC_FAMILY','keystone','cortexa15thf-neon','${DEFAULTTUNE}',d)}"
> +DEFAULTTUNE := "${@bb.utils.contains('SOC_FAMILY','omap4','cortexa9thf-neon','${DEFAULTTUNE}',d)}"
>  
>  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-linaro-toolchain"
>  
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

