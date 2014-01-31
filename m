Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id AD84E5298F
	for <meta-arago@arago-project.org>;
	Fri, 31 Jan 2014 20:06:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0VK6Gim019384
	for <meta-arago@arago-project.org>; Fri, 31 Jan 2014 14:06:16 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0VK6FEN031476
	for <meta-arago@arago-project.org>; Fri, 31 Jan 2014 14:06:16 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 31 Jan 2014 14:06:15 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0VK6FNt006409;
	Fri, 31 Jan 2014 14:06:15 -0600
Date: Fri, 31 Jan 2014 15:06:15 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20140131200615.GL6814@edge>
References: <1391203584-17256-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1391203584-17256-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] Add release information to latest U-boot and Kernel sources.
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
X-List-Received-Date: Fri, 31 Jan 2014 20:06:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jan 31, 2014 at 03:26:24PM -0600, Franklin S. Cooper Jr wrote:
> * Add the kernel and u-boot release tag to the sources.

I'd have to NAK this change for now...

First of all, it's .01 not .00
And second, I don't think that's the right way to do it...
This needs more thought.


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../conf/distro/arago-source-ipk.conf              |    4 ++--
>  .../u-boot/u-boot-ti-staging_2013.10.bbappend      |    5 ++++-
>  .../linux/linux-ti-staging_3.12.bbappend           |    5 ++++-
>  3 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> index 19034b6..e3a90fc 100644
> --- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
> +++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> @@ -116,7 +116,7 @@ SRCIPK_INSTALL_DIR_pn-x-load_beagleboard = "board-support/${P}"
>  SRCIPK_PACKAGE_ARCH_pn-x-load = "${MACHINE_ARCH}"
>  
>  CREATE_SRCIPK_pn-u-boot-ti-staging = "1"
> -SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging = "board-support/u-boot-${PV}"
> +SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging = "board-support/u-boot-${PV}${BSPVER}"
>  SRCIPK_PACKAGE_ARCH_pn-u-boot-ti-staging = "${MACHINE_ARCH}"
>  SRCIPK_PRESERVE_GIT_pn-u-boot-ti-staging = "true"
>  
> @@ -141,7 +141,7 @@ SRCIPK_INSTALL_DIR_pn-u-boot-am3517 = "board-support/u-boot-${UVER}-psp${PSPREL}
>  SRCIPK_PACKAGE_ARCH_pn-u-boot-am3517 = "${MACHINE_ARCH}"
>  
>  CREATE_SRCIPK_pn-linux-ti-staging = "1"
> -SRCIPK_INSTALL_DIR_pn-linux-ti-staging = "board-support/linux-${PV}"
> +SRCIPK_INSTALL_DIR_pn-linux-ti-staging = "board-support/linux-${PV}${BSPVER}"
>  SRCIPK_PACKAGE_ARCH_pn-linux-ti-staging = "${MACHINE_ARCH}"
>  SRCIPK_PRESERVE_GIT_pn-linux-ti-staging = "true"
>  
> diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend
> index c5c5ae5..eda5feb 100644
> --- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend
> +++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = "-arago2"
> +PR_append = "-arago3"
>  
>  SRCREV = "${AUTOREV}"
>  
> @@ -11,3 +11,6 @@ do_compile_prepend() {
>          echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
>      fi
>  }
> +
> +# BSPVER is used by arago-source-ipk.conf
> +BSPVER = "-ti2013.12.00"
> diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend
> index 3450a1f..45424cb 100644
> --- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend
> +++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend
> @@ -1,4 +1,4 @@
> -MACHINE_KERNEL_PR_append = "-arago4"
> +MACHINE_KERNEL_PR_append = "-arago5"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
>  
> @@ -8,6 +8,9 @@ SRCREV = "${AUTOREV}"
>  
>  KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
>  
> +# BSPVER is used by arago-source-ipk.conf
> +BSPVER = "-ti2013.12.00"
> +
>  kernel_do_configure_prepend() {
>      if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
>      then
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

