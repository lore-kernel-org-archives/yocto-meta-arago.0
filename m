Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id AED0952AAE
	for <meta-arago@arago-project.org>;
	Wed, 29 Jun 2016 13:59:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5TDx9n8011344
	for <meta-arago@arago-project.org>; Wed, 29 Jun 2016 08:59:09 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5TDx9nZ016294
	for <meta-arago@arago-project.org>; Wed, 29 Jun 2016 08:59:09 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 29 Jun 2016 08:59:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5TDx8F3009303;
	Wed, 29 Jun 2016 08:59:08 -0500
Date: Wed, 29 Jun 2016 09:59:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20160629135908.GI24597@edge>
References: <1467151876-29554-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1467151876-29554-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2] packagegroup-arago-tisdk-addons: Add uio-module-drv and related test code
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
X-List-Received-Date: Wed, 29 Jun 2016 13:59:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack


On Tue, Jun 28, 2016 at 06:11:16PM -0400, Sam Nelson wrote:
> Adds uio-module-drv component and related test code for omap-a15 and
> keystone2 platforms
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Added PR bump
> ---
> ---
>  .../packagegroups/packagegroup-arago-tisdk-addons.bb      | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index efa6ab9..75f8207 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
>  LICENSE = "MIT"
> -PR = "r50"
> +PR = "r51"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -51,6 +51,8 @@ UTILS_append_omap-a15 = " mmc-utils \
>                            pru-icss \
>                            strongswan \
>                            ti-ipc-rtos-fw \
> +                          uio-test-pruss \
> +                          uio-module-drv-test \
>  "
>  
>  UTILS_append_dra7xx = " canutils \
> @@ -60,6 +62,7 @@ UTILS_append_dra7xx = " canutils \
>  "
>  
>  UTILS_append_keystone = " \
> +    uio-module-drv-test \
>      ti-ipc-rtos-fw \
>  "
>  
> @@ -81,7 +84,15 @@ UTILS_append_k2e-evm = " \
>  UTILS_append_k2g-evm = " canutils"
>  
>  EXTRA_LIBS = ""
> -EXTRA_LIBS_append_omap-a15 = " cmem"
> +EXTRA_LIBS_append_omap-a15 = " \
> +    cmem \
> +    uio-module-drv \
> +"
> +
> +EXTRA_LIBS_append_keystone = " \
> +    cmem \
> +    uio-module-drv \
> +"
>  
>  DEVTOOLS = " \
>      packagegroup-core-buildessential \
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

