Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C83A15209B
	for <meta-arago@arago-project.org>;
	Wed,  9 Sep 2015 23:17:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t89NH00c003891
	for <meta-arago@arago-project.org>; Wed, 9 Sep 2015 18:17:00 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t89NH0Dw014212
	for <meta-arago@arago-project.org>; Wed, 9 Sep 2015 18:17:00 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 9 Sep 2015 18:16:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t89NGxUO001188	for
	<meta-arago@arago-project.org>; Wed, 9 Sep 2015 18:16:59 -0500
Date: Wed, 9 Sep 2015 19:16:44 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20150909231644.GK18085@edge>
References: <20150909200929.9E4AC52979@arago-project.org>
MIME-Version: 1.0
In-Reply-To: <20150909200929.9E4AC52979@arago-project.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-ti] Jacob Stiffler : cmem-mod: update for changed module autoload syntax.
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
X-List-Received-Date: Wed, 09 Sep 2015 23:17:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Jake,

We can now partially revert this commit for cmem:

http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=0feeb899d914eee640ac15f825db26b97c2e78f6

Unfortunately, debugss-module seems to still be broken - any plans to fix it?

-- 
Denys


On Wed, Sep 09, 2015 at 08:09:29PM +0000, Arago Project git wrote:
> Module: meta-ti
> Branch: fido
> Commit: 8d0189bd1b847b89f4276c70aa9d3b8f70defbc4
> URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8d0189bd1b847b89f4276c70aa9d3b8f70defbc4
> 
> Author: Jacob Stiffler <j-stiffler@ti.com>
> Date:   Wed Sep  9 18:32:23 2015 +0000
> 
> cmem-mod: update for changed module autoload syntax.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> 
> ---
> 
>  recipes-bsp/cmem/cmem-mod_git.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-bsp/cmem/cmem-mod_git.bb
> index 6b2303c..d36816b 100644
> --- a/recipes-bsp/cmem/cmem-mod_git.bb
> +++ b/recipes-bsp/cmem/cmem-mod_git.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Kernel module for contiguous memory allocation from userspace"
>  include cmem.inc
>  
>  # This package builds a kernel module, use kernel PR as base and append a local
> -MACHINE_KERNEL_PR_append = "a"
> +MACHINE_KERNEL_PR_append = "b"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  inherit module
> @@ -11,4 +11,4 @@ inherit module
>  EXTRA_OEMAKE += '-f lu.mak KERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" TOOLCHAIN_PREFIX="${TOOLCHAIN_PREFIX}" EXEC_DIR="${D}/lib/modules/${KERNEL_VERSION}/extra"'
>  MAKE_TARGETS = "module"
>  
> -module_autoload_cmemk = "cmemk"
> +KERNEL_MODULE_AUTOLOAD += "cmemk"
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

