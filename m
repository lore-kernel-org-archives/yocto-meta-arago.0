Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F1AC433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 20:34:32 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.81.1648154070558207284
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 13:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6A13840BE9;
	Thu, 24 Mar 2022 20:34:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IkJyK8qHYZE5; Thu, 24 Mar 2022 20:34:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 35B0440B13;
	Thu, 24 Mar 2022 20:34:25 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 82E10174864; Thu, 24 Mar 2022 16:34:24 -0400 (EDT)
Date: Thu, 24 Mar 2022 16:34:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/dunfell][PATCH v2 1/2] ti-tisdk-makefile:
 adding uboot r5 config variable for am62xx
Message-ID: <20220324203424.GZ23554@denix.org>
References: <20220323210750.3959-1-reatmon@ti.com>
 <20220323210750.3959-2-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220323210750.3959-2-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 24 Mar 2022 20:34:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13752

> ti-tisdk-makefile: adding uboot r5 config variable for am62xx

The patch below does a lot more than what the subject says...

And this patchset depends on the corresponding change in meta-ti, which needs 
some more work.


On Wed, Mar 23, 2022 at 04:07:49PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> From: Nishanth Menon <nm@ti.com>
> 
> lets add support for the latest of TI SoC.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../packagegroup-arago-tisdk-addons-sdk-host.bb             | 4 ++++
>  .../packagegroups/packagegroup-arago-tisdk-addons.bb        | 1 +
>  .../ti-tisdk-makefile/Makefile_sysfw-image                  | 1 +
>  .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb              | 6 ++++++
>  4 files changed, 12 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> index c44f95ca..062948d0 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> @@ -57,6 +57,10 @@ UTILS_append_am64xx = " \
>      pru-icss-src \
>  "
>  
> +UTILS_append_am62xx = " \
> +    pru-icss-src \
> +"
> +
>  EXTRA_LIBS = ""
>  
>  EXTRA_LIBS_append_omap-a15 = " \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 099817c3..094c47a2 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -65,6 +65,7 @@ UTILS_append_k3 = " mmc-utils \
>  "
>  
>  UTILS_append_am64xx = " ti-rtos-firmware pru-icss"
> +UTILS_append_am62xx = " ti-rtos-firmware pru-icss"
>  UTILS_append_am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
>  UTILS_append_j7 = " ti-rtos-firmware"
>  UTILS_append_j7-evm = " pru-icss"
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
> index aaf1f112..316483df 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
> @@ -12,6 +12,7 @@ SYSFW_SOC_am65xx-evm = am65x
>  SYSFW_SOC_am65xx-hs-evm = am65x
>  SYSFW_SOC_am64xx-evm = am64x
>  SYSFW_SOC_am64xx-hs-evm = am64x
> +SYSFW_SOC_am62xx-evm = am62x
>  SYSFW_SOC_j7-evm = j721e
>  SYSFW_SOC_j7-hs-evm = j721e
>  SYSFW_SOC = $(SYSFW_SOC_$(PLATFORM))
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> index 7bda8eed..f0a044f7 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> @@ -202,6 +202,10 @@ MAKEFILES_append_am64xx = " \
>                          pru-icss \
>  "
>  
> +MAKEFILES_append_am62xx = " \
> +                        pru-icss \
> +"
> +
>  # Use this to export kernel arch to ARCH
>  #
>  # We need to be very careful here. This class will also overwrite UBOOT_ARCH
> @@ -239,6 +243,7 @@ PRU_ICSS_INSTALL_TARGET_k2g = "pru-icss_install_k2g"
>  PRU_ICSS_INSTALL_TARGET_am65xx = "pru-icss_install_am65x"
>  PRU_ICSS_INSTALL_TARGET_j7 = "pru-icss_install_j721e"
>  PRU_ICSS_INSTALL_TARGET_am64xx = "pru-icss_install_am64x"
> +PRU_ICSS_INSTALL_TARGET_am62xx = "pru-icss_install_am62x"
>  
>  # Path to toolchains for the various cores in TI SOCs
>  #
> @@ -363,6 +368,7 @@ K3_UBOOT_MACHINE_R5_j7-evm = "j721e_evm_r5_config"
>  K3_UBOOT_MACHINE_R5_j7-hs-evm = "j721e_hs_evm_r5_config"
>  K3_UBOOT_MACHINE_R5_j7200-evm = "j7200_evm_r5_config"
>  K3_UBOOT_MACHINE_R5_j721s2-evm = "j721s2_evm_r5_config"
> +K3_UBOOT_MACHINE_R5_am62xx-evm = "am62xx_evm_r5_config"
>  
>  do_install_append_k3() {
>      cat >> ${D}/Rules.make << __EOF__
> -- 
> 2.17.1

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

