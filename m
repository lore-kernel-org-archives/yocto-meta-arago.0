Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8283B52099
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2015 15:01:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2HF1A1F009582
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 10:01:10 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HF19lJ028740
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 10:01:09 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 17 Mar 2015 10:01:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HF195L017602;
	Tue, 17 Mar 2015 10:01:09 -0500
Date: Tue, 17 Mar 2015 11:01:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150317150108.GH4669@edge>
References: <1426604292-11709-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1426604292-11709-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] branding-processor-sdk: Set more preferences
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
X-List-Received-Date: Tue, 17 Mar 2015 15:01:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Isn't u-boot-ti-staging-2014.07% already a default for am3/4?

On Tue, Mar 17, 2015 at 10:58:12AM -0400, Jacob Stiffler wrote:
> * AUTOREV linux-ti-staging and u-boot-ti-staging for omap-a15
> * Freeze u-boot for am335x-evm and am437x-evm.
> * Add commit message for linux-ti-staging.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../conf/distro/include/branding-processor-sdk.inc |   23 ++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> index d277aac..c2327fa 100644
> --- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> @@ -4,10 +4,30 @@ ARAGO_TISDK_IMAGE = "processor-sdk-linux-image"
>  DISTRO_FEATURES_remove_ti33x = "wayland"
>  DISTRO_FEATURES_remove_ti43x = "wayland"
>  
> +# Set preferred providers and srcrevs
>  PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "sitara-linux-ti-staging"
>  PREFERRED_PROVIDER_virtual/kernel_am437x-evm = "sitara-linux-ti-staging"
>  PREFERRED_VERSION_sitara-linux-ti-staging = "3.14%"
>  
> +# Auto rev important packages to pick up latest
> +SRCREV_pn-u-boot-ti-staging_omap-a15 = "${AUTOREV}"
> +SRCREV_pn-ltp-ddt_omap-a15 = "${AUTOREV}"
> +
> +# am3 and am4 use sitara-linux-ti-staging, so this only applies to omap-a15
> +SRCREV_pn-linux-ti-staging = "${AUTOREV}"
> +
> +# Freeze am3 and am4 u-boot
> +PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-ti-staging"
> +PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-ti-staging"
> +PREFERRED_VERSION_u-boot-ti-staging_am335x-evm = "2014.07%"
> +SRCREV_pn-u-boot-ti-staging_am335x-evm = "7e537bfdd261bf8bf444f3ac4d1be3db4ee124e8"
> +
> +PREFERRED_PROVIDER_virtual/bootloader_am437x-evm = "u-boot-ti-staging"
> +PREFERRED_PROVIDER_u-boot_am437x-evm = "u-boot-ti-staging"
> +PREFERRED_VERSION_u-boot-ti-staging_am437x-evm = "2014.07%"
> +SRCREV_pn-u-boot-ti-staging_am437x-evm = "7e537bfdd261bf8bf444f3ac4d1be3db4ee124e8"
> +
> +
>  # To create newlines in the message \n is used and the slash must be escaped
>  # to function properly
>  
> @@ -28,6 +48,9 @@ script located in the sdk\'s bin directory\\n\
>  The script may take several minutes but you will then have a full copy of\\n\
>  the git repository including its entire git history.\\n"
>  
> +SRCIPK_CUSTOM_GIT_BRANCH_pn-linux-ti-staging = "processor-sdk-1.0"
> +SRCIPK_CUSTOM_GIT_MESSAGE_pn-linux-ti-staging = "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
> +
>  SRCIPK_CUSTOM_GIT_BRANCH_pn-sitara-linux-ti-staging = "processor-sdk-1.0"
>  SRCIPK_CUSTOM_GIT_MESSAGE_pn-sitara-linux-ti-staging = "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
>  
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

