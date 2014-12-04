Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id EB385529DD
	for <meta-arago@arago-project.org>;
	Thu,  4 Dec 2014 23:02:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id sB4N2jHP005419;
	Thu, 4 Dec 2014 17:02:45 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sB4N2j7D026800;
	Thu, 4 Dec 2014 17:02:45 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Dec 2014 17:02:45 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id sB4N2jcP021708;
	Thu, 4 Dec 2014 17:02:45 -0600
Date: Thu, 4 Dec 2014 18:02:44 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20141204230244.GI5113@edge>
References: <1417558009-8372-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1417558009-8372-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] branding-core, recipes: move AUTOREV for kernel, u-boot and ltp-ddt
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
X-List-Received-Date: Thu, 04 Dec 2014 23:02:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

What do people think about this one? Will it help or hurt other SDKs?


On Tue, Dec 02, 2014 at 05:06:49PM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Move setting AUTOREV for important packages into branding-core, so it won't
> affect other SDK products using meta-arago/master.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/conf/distro/include/branding-core.inc            | 5 +++++
>  .../recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend          | 7 +------
>  meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend  | 5 +----
>  .../recipes-kernel/linux/linux-ti-staging_3.14.bbappend            | 4 +---
>  4 files changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
> index b1ae89b..b759469 100644
> --- a/meta-arago-distro/conf/distro/include/branding-core.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-core.inc
> @@ -4,3 +4,8 @@
>  # Please avoid creating multiple versions of the same brand, if possible
>  # The policy is for the "Core" brand to be the default,
>  # hence this file is mostly empty and used as a template
> +
> +# Auto rev important packages to pick up latest
> +SRCREV_pn-linux-ti-staging = "${AUTOREV}"
> +SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
> +SRCREV_pn-ltp-ddt = "${AUTOREV}"
> diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
> index 54a1691..872d0b2 100644
> --- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
> +++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
> @@ -1,12 +1,7 @@
> -# Append the base 2014.07 u-boot mainline recipe to AUTOREV for now so that
> -# we can test the latest mainline
> -
> -PR_append = "-arago4"
> +PR_append = "-arago5"
>  
>  UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
>  
> -SRCREV = "${AUTOREV}"
> -
>  # AM57x EVM is currently on a seperate git tree/branch.
>  # Once the software has been integrated to the u-boot-ti-staging
>  # repository these lines can be removed.
> diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
> index 8332150..8e49900 100644
> --- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
> +++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
> @@ -1,10 +1,7 @@
> -PR_append = "-arago8+gitr${SRCPV}"
> +PR_append = "-arago9+gitr${SRCPV}"
>  
>  RDEPENDS_${PN} += "linaro-pm-qa-utils"
>  
> -# Auto rev so we pick up the latest changes
> -SRCREV = "${AUTOREV}"
> -
>  SRC_URI_remove = "file://0001-KERNEL_INC-in-modern-kernel-should-point-at-toplevel.patch"
>  
>  EXTRA_OEMAKE += "KERNEL_PATH="${STAGING_KERNEL_DIR}""
> diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.14.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.14.bbappend
> index b178b5e..22d1f4f 100644
> --- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.14.bbappend
> +++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.14.bbappend
> @@ -1,4 +1,4 @@
> -MACHINE_KERNEL_PR_append = "-arago1"
> +MACHINE_KERNEL_PR_append = "-arago2"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
>  
> @@ -6,8 +6,6 @@ require copy-defconfig.inc
>  
>  KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
>  
> -SRCREV = "${AUTOREV}"
> -
>  kernel_do_configure_prepend() {
>      if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
>      then
> -- 
> 2.1.2
> 

