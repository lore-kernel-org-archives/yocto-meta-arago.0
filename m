Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6936C0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 21:20:14 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.145896.1692134404857289885
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 15 Aug 2023 14:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C141140CA2;
	Tue, 15 Aug 2023 21:20:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id muBGwigqDWWn; Tue, 15 Aug 2023 21:20:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8995440C3A;
	Tue, 15 Aug 2023 21:20:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B08FB163C64; Tue, 15 Aug 2023 17:19:59 -0400 (EDT)
Date: Tue, 15 Aug 2023 17:19:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH v3] init-manager-*:
 Leverage oe-core method of choosing init manager
Message-ID: <20230815211959.GI3359@denix.org>
References: <20230815210806.12404-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815210806.12404-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 15 Aug 2023 21:20:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14848

On Tue, Aug 15, 2023 at 04:08:06PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Change arago over to the oe-core init-manager setup for all images instead
> of a mixture of systemd/sysvinit based on perceived image size.  With the
> migration to a more targeted initramfs we have the space in the image to
> support systemd and not require sysvinit for the smaller images.
> 
> We will still support setups that use ARAGO_SYSVINIT, but the preferred
> method will be to set INIT_MANAGER in the local.conf with the default
> being systemd.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v3: - Remove our own verisons of init-manager-*.inc and just use the
>       oe-core versions.
> v2: - Add missing .inc in require.
>     - Fix assignment in init-manager-*.inc files.
>     - Remove packagegroup-arago-sysvinit-boot.bb since we stopped using
>       it.
> 
>  meta-arago-distro/conf/distro/arago.conf          | 11 +++--------
>  .../recipes-core/images/arago-image.inc           |  2 +-
>  .../recipes-core/images/arago-tiny-image.inc      |  4 ----
>  .../packagegroup-arago-sysvinit-boot.bb           | 15 ---------------
>  4 files changed, 4 insertions(+), 28 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 38c42ef8..abae3724 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -58,14 +58,9 @@ DISTRO_FEATURES_FILTER_NATIVE:append = " opencl opencv openmp"
>  DISTRO_FEATURES_FILTER_NATIVESDK:append = " opencl opencv openmp"
>  
>  # Set global runtime providers for major components
> -ARAGO_SYSVINIT ?= "0"
> -VIRTUAL-RUNTIME_dev_manager = "${@'udev' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd'}"
> -VIRTUAL-RUNTIME_init_manager = "${@'sysvinit' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd'}"
> -VIRTUAL-RUNTIME_initscripts = "${@'initscripts' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd-compat-units'}"
> -VIRTUAL-RUNTIME_initramfs = "${@'sysvinit-initramfs' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd-initramfs'}"
> -VIRTUAL-RUNTIME_login_manager = "${@'busybox' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'shadow-base'}"
> -
> -DISTRO_FEATURES:append = " ${@'' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else ' systemd'}"
> +ARAGO_SYSVINIT ??= "0"
> +INIT_MANAGER ??= "${@['systemd','sysvinit'][int(d.getVar('ARAGO_SYSVINIT'))]}"
> +require conf/distro/include/init-manager-${INIT_MANAGER}.inc
>  
>  # Distro-specific package configuration
>  PACKAGECONFIG:append:pn-systemd = " coredump networkd resolved serial-getty-generator"
> diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
> index d00c1f70..1c87afd5 100644
> --- a/meta-arago-distro/recipes-core/images/arago-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
> @@ -30,6 +30,6 @@ BAD_RECOMMENDATIONS += " \
>      coreutils \
>      coreutils-dev \
>  "
> -BAD_RECOMMENDATIONS += "${@oe.utils.conditional("ARAGO_SYSVINIT", "1", "", "busybox-syslog", d)}"
> +BAD_RECOMMENDATIONS += "${@oe.utils.conditional("ARAGO_INIT_MANAGER", "sysvinit", "", "busybox-syslog", d)}"

No more ARAGO_INIT_MANAGER


>  inherit core-image remove-net-rules
> diff --git a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
> index 242e763c..6c726c4d 100644
> --- a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
> @@ -1,9 +1,5 @@
> -ARAGO_SYSVINIT = "1"
>  
>  require arago-image.inc
>  
>  IMAGE_FEATURES:remove = "splash"
>  
> -IMAGE_INSTALL = " \
> -	packagegroup-arago-sysvinit-boot \
> -"
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> deleted file mode 100644
> index df7ff960..00000000
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -REQUIRED_DISTRO_FEATURES = "sysvinit"
> -inherit features_check
> -
> -require recipes-core/packagegroups/packagegroup-core-boot.bb
> -
> -PR = "r0"
> -
> -# Cannot use eudev:
> -#   "eudev was skipped: 'systemd' in DISTRO_FEATURES"
> -#VIRTUAL-RUNTIME_dev_manager = "eudev"
> -VIRTUAL-RUNTIME_dev_manager = ""
> -VIRTUAL-RUNTIME_init_manager = "sysvinit"
> -VIRTUAL-RUNTIME_initscripts = "initscripts"
> -VIRTUAL-RUNTIME_initramfs = "sysvinit-initramfs"
> -VIRTUAL-RUNTIME_login_manager = "busybox"
> -- 
> 2.17.1

