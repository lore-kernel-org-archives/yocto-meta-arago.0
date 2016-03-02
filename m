Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 816FF52A7D
	for <meta-arago@arago-project.org>;
	Wed,  2 Mar 2016 15:38:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u22FcJxc024654
	for <meta-arago@arago-project.org>; Wed, 2 Mar 2016 09:38:19 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u22FcJm1011364
	for <meta-arago@arago-project.org>; Wed, 2 Mar 2016 09:38:19 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 2 Mar 2016 09:38:19 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u22FcJ15020536;
	Wed, 2 Mar 2016 09:38:19 -0600
Date: Wed, 2 Mar 2016 10:38:03 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20160302153803.GD7505@edge>
References: <1456929820-47497-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1456929820-47497-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH V4] ti-tisdk-makefile: Replace PVR_NULLDRM and PLATFORM_OMAPDRM with TARGET_PRODUCT per graphics DDK change
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
X-List-Received-Date: Wed, 02 Mar 2016 15:38:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Wed, Mar 02, 2016 at 09:43:40AM -0500, Eric Ruei wrote:
> PVR_NULLDRM and PLATFORM_OMAPDRM are only applicable for DDK 1.9 and no longer used.
> TARGET_PRODUCT is required for omapdrm-pvr build per DDK 1.14
> 
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
> V4 Changes: Update commit message 
>  .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb            | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> index bcd78ba..c49909e 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> @@ -151,15 +151,9 @@ MAKEFILES_append_k2e-evm = " opencl-examples \
>  PLATFORM_ARCH = "armv7-a"
>  PLATFORM_ARCH_omapl138 = "armv5te"
>  
> -PLATFORM_OMAPDRM = ""
> -PLATFORM_OMAPDRM_ti33x = "omap335x"
> -PLATFORM_OMAPDRM_ti43x = "omap437x"
> -PLATFORM_OMAPDRM_omap-a15 = "omap5430"
> -
> -PVR_NULLDRM = ""
> -PVR_NULLDRM_ti33x = "1"
> -PVR_NULLDRM_ti43x = "0"
> -PVR_NULLDRM_omap-a15 = "0"
> +TARGET_PRODUCT = "jacinto6evm"
> +TARGET_PRODUCT_ti33x = "ti335x"
> +TARGET_PRODUCT_ti43x = "ti437x"
>  
>  PLATFORM_DEBUGSS = ""
>  PLATFORM_DEBUGSS_dra7xx = "DRA7xx_PLATFORM"
> @@ -238,8 +232,7 @@ do_install () {
>      sed -i -e "s/__KERNEL_BUILD_CMDS__/${KERNEL_BUILD_CMDS}/" ${D}/Makefile
>      sed -i -e "s/__SDKMACHINE__/${SDKMACHINE}/g" ${D}/Makefile
>  
> -    sed -i -e "s/__PLATFORM_OMAPDRM__/${PLATFORM_OMAPDRM}/" ${D}/Makefile
> -    sed -i -e "s/__PVR_NULLDRM__/${PVR_NULLDRM}/" ${D}/Makefile
> +    sed -i -e "s/__TARGET_PRODUCT__/${TARGET_PRODUCT}/" ${D}/Makefile
>      sed -i -e "s/__PLATFORM_DEBUGSS__/${PLATFORM_DEBUGSS}/g" ${D}/Makefile
>      sed -i -e "s/__PLATFORM_GDBSERVERPROXY__/${PLATFORM_GDBSERVERPROXY}/g" ${D}/Makefile
>      sed -i -e "s/__BOOT_MONITOR_MAKE_TARGET__/${BOOT_MONITOR_MAKE_TARGET}/g" ${D}/Makefile
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

