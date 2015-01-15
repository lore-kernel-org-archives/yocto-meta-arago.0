Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B2254529DD
	for <meta-arago@arago-project.org>;
	Thu, 15 Jan 2015 02:53:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0F2rFxn008290
	for <meta-arago@arago-project.org>; Wed, 14 Jan 2015 20:53:15 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0F2rFdr023588
	for <meta-arago@arago-project.org>; Wed, 14 Jan 2015 20:53:15 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 20:53:15 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0F2rFYx006659;
	Wed, 14 Jan 2015 20:53:15 -0600
Date: Wed, 14 Jan 2015 21:53:14 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20150115025314.GR4759@edge>
References: <1421184385-21751-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1421184385-21751-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/4] branding-amsdk: Clear AMSDK branding and include Qt 4 for AM335x and AM437x
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
X-List-Received-Date: Thu, 15 Jan 2015 02:53:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

All looks good.

On Tue, Jan 13, 2015 at 03:26:22PM -0600, Franklin S. Cooper Jr wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> 
> * Since SOC_FAMILY/MACHINE overrides have issues working in conf files use
>   python based commands to only use Qt 5 on AM57x. All other devices (am335x and
>   am437x) will  use Qt 4.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../conf/distro/include/branding-amsdk.inc         |   19 ++-----------------
>  1 file changed, 2 insertions(+), 17 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-amsdk.inc b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
> index 11634a8..0d2a601 100644
> --- a/meta-arago-distro/conf/distro/include/branding-amsdk.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
> @@ -1,18 +1,3 @@
> -# AM-SDK branding configuration
> +require branding-core.inc
> +QT_PROVIDER := "${@bb.utils.contains('SOC_FAMILY','omap-a15:dra7xx','qt5','qt4e',d)}"
>  
> -# Use the SDK supported kernel and kernel version
> -PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-am335x-psp"
> -PREFERRED_VERSION_linux-am335x-psp = "3.2"
> -PREFERRED_VERSION_linux-libc-headers_am335x-evm = "3.2"
> -
> -PREFERRED_PROVIDER_ltp-ddt_am335x-evm = "ltp-ddt-legacy"
> -
> -PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-ti-staging"
> -PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-ti-staging"
> -
> -PREFERRED_PROVIDER_virtual/bootloader_am437x-evm = "u-boot-ti-staging"
> -PREFERRED_PROVIDER_u-boot_am437x-evm = "u-boot-ti-staging"
> -
> -# Use v4.09.00.01 of the Graphics SDK
> -PREFERRED_VERSION_omap3-sgx-modules = "4.09.00.01"
> -PREFERRED_VERSION_libgles-omap3 = "4.09.00.01"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

