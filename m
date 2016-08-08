Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 50C705207C
	for <meta-arago@arago-project.org>;
	Mon,  8 Aug 2016 14:44:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u78Ee9kV022540
	for <meta-arago@arago-project.org>; Mon, 8 Aug 2016 09:40:09 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u78Eilwv003532
	for <meta-arago@arago-project.org>; Mon, 8 Aug 2016 09:44:47 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 8 Aug 2016 09:44:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u78EikBs023421;
	Mon, 8 Aug 2016 09:44:46 -0500
Date: Mon, 8 Aug 2016 10:44:45 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160808144445.GG18333@edge>
References: <1470663570-5175-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1470663570-5175-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/3] linux: copy-defconfig: move create_srcipk task after configure
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
X-List-Received-Date: Mon, 08 Aug 2016 14:44:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Didn't I already submit this last week when Sam reported it?


On Mon, Aug 08, 2016 at 09:39:28AM -0400, Jacob Stiffler wrote:
> * With sstate support for the sourceipk class, create_srcipk can no
>   longer be successfully called within another task.
> * Move the create_srcipk task after configure so that the build
>   defconfig is included in the src package.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc          | 7 +++++--
>  .../recipes-kernel/linux/linux-ti-staging-rt_%.bbappend            | 2 +-
>  .../recipes-kernel/linux/linux-ti-staging-systest_%.bbappend       | 2 +-
>  meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend | 2 +-
>  4 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc b/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
> index b9db1ee..46de4a3 100644
> --- a/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
> +++ b/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
> @@ -5,7 +5,10 @@ CONFIG_NAME ?= "tisdk_${MACHINE}_defconfig"
>  # the function to build the sourceipk again.  This is done as a
>  # do_compile_prepend so that we can pick up any changes to the
>  # defconfig thay may have been done by the sanitizer code.
> -do_compile_prepend() {
> +do_configure_append() {
>      cp ${B}/.config ${S}/arch/arm/configs/${CONFIG_NAME}
> -    sourceipk_do_create_srcipk
>  }
> +
> +# Move create_srcipk task so that the release defconfig is included.
> +deltask do_create_srcipk
> +addtask create_srcipk after do_configure before do_compile
> diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
> index 7c90ac5..a3241ab 100644
> --- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
> +++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
> @@ -1,4 +1,4 @@
> -MACHINE_KERNEL_PR_append = ".arago0"
> +MACHINE_KERNEL_PR_append = ".arago1"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
>  
> diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
> index 7c90ac5..a3241ab 100644
> --- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
> +++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
> @@ -1,4 +1,4 @@
> -MACHINE_KERNEL_PR_append = ".arago0"
> +MACHINE_KERNEL_PR_append = ".arago1"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
>  
> diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
> index 4c50655..6ae4bd7 100644
> --- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
> +++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
> @@ -1,4 +1,4 @@
> -MACHINE_KERNEL_PR_append = ".arago4"
> +MACHINE_KERNEL_PR_append = ".arago5"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
>  
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

