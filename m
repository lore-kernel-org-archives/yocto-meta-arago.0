Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id AE6AF529BA
	for <meta-arago@arago-project.org>;
	Thu, 30 Apr 2015 20:09:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3UK9Pnl027736
	for <meta-arago@arago-project.org>; Thu, 30 Apr 2015 15:09:25 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3UK9OB4006896
	for <meta-arago@arago-project.org>; Thu, 30 Apr 2015 15:09:24 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 30 Apr 2015 15:09:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3UK9NqL011338;
	Thu, 30 Apr 2015 15:09:23 -0500
Date: Thu, 30 Apr 2015 16:09:23 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150430200922.GU29290@edge>
References: <1430244870-10948-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1430244870-10948-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] branding-processor-sdk: Use default virutal/kernel provider.
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
X-List-Received-Date: Thu, 30 Apr 2015 20:09:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack.


On Tue, Apr 28, 2015 at 02:14:30PM -0400, Jacob Stiffler wrote:
> * AUTOREV linux, u-boot, and ltp-ddt for all platforms
> * Configure linux-ti-staging sourceipk shallow clone to 400 commits.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../conf/distro/include/branding-processor-sdk.inc |   26 ++++----------------
>  1 file changed, 5 insertions(+), 21 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> index 3bb724d..3ef3009 100644
> --- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> @@ -5,28 +5,10 @@ DISTRO_FEATURES_remove_ti33x = "wayland"
>  DISTRO_FEATURES_remove_ti43x = "wayland"
>  
>  # Set preferred providers and srcrevs
> -PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "sitara-linux-ti-staging"
> -PREFERRED_PROVIDER_virtual/kernel_am437x-evm = "sitara-linux-ti-staging"
> -PREFERRED_VERSION_sitara-linux-ti-staging = "3.14%"
> -
>  # Auto rev important packages to pick up latest
> -#SRCREV_pn-u-boot-ti-staging_omap-a15 = "${AUTOREV}"
> -#SRCREV_pn-ltp-ddt_omap-a15 = "${AUTOREV}"
> -
> -# am3 and am4 use sitara-linux-ti-staging, so this only applies to omap-a15
> -#SRCREV_pn-linux-ti-staging = "${AUTOREV}"
> -
> -# Freeze am3 and am4 u-boot
> -PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-ti-staging"
> -PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-ti-staging"
> -PREFERRED_VERSION_u-boot-ti-staging_am335x-evm = "2014.07%"
> -SRCREV_pn-u-boot-ti-staging_am335x-evm = "7e537bfdd261bf8bf444f3ac4d1be3db4ee124e8"
> -
> -PREFERRED_PROVIDER_virtual/bootloader_am437x-evm = "u-boot-ti-staging"
> -PREFERRED_PROVIDER_u-boot_am437x-evm = "u-boot-ti-staging"
> -PREFERRED_VERSION_u-boot-ti-staging_am437x-evm = "2014.07%"
> -SRCREV_pn-u-boot-ti-staging_am437x-evm = "7e537bfdd261bf8bf444f3ac4d1be3db4ee124e8"
> -
> +SRCREV_pn-u-boot-ti-staging_omap-a15 = "${AUTOREV}"
> +SRCREV_pn-ltp-ddt_omap-a15 = "${AUTOREV}"
> +SRCREV_pn-linux-ti-staging = "${AUTOREV}"
>  
>  # To create newlines in the message \n is used and the slash must be escaped
>  # to function properly
> @@ -53,6 +35,8 @@ SRCIPK_CUSTOM_GIT_MESSAGE_pn-linux-ti-staging = "${SRCIPK_SHALLOW_GIT_COMMIT_MES
>  
>  SRCIPK_CUSTOM_GIT_BRANCH_pn-sitara-linux-ti-staging = "processor-sdk-1.0"
>  SRCIPK_CUSTOM_GIT_MESSAGE_pn-sitara-linux-ti-staging = "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
> +SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging = "true"
> +SRCIPK_SHALLOW_DEPTH_pn-linux-ti-staging = "400"
>  
>  SRCIPK_CUSTOM_GIT_BRANCH_pn-u-boot-ti-staging = "processor-sdk-1.0"
>  SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-staging = "${SRCIPK_GIT_COMMIT_MESSAGE}"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

