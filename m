Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 104CA529DD
	for <meta-arago@arago-project.org>;
	Sat, 31 Jan 2015 02:52:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0V2qibp007763
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 20:52:44 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0V2qh6A016375
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 20:52:43 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 30 Jan 2015 20:52:43 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0V2qgCP026131;
	Fri, 30 Jan 2015 20:52:42 -0600
Date: Fri, 30 Jan 2015 21:52:42 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20150131025242.GA2883@edge>
References: <1422657099-15544-1-git-send-email-fcooper@ti.com>
	<1422657099-15544-6-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1422657099-15544-6-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 6/6] sitara-linux-ti-staging: Simply package up the sources don't copy the defconfig
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
X-List-Received-Date: Sat, 31 Jan 2015 02:52:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jan 30, 2015 at 04:31:39PM -0600, Franklin S. Cooper Jr wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> 
> * Avoid creating a "new" defconfig when the one used by the recipe
>   gives the same exact result.
> * This also avoids the confusion people have when seeing a defconfig that
>   doesn't exist in any other git tree.
> * Doing this only makes sense if the defconfig is intree and not being patched.

Do you use config fragments in your kernel?


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../linux/sitara-linux-ti-staging_3.14.bbappend    |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bbappend b/meta-arago-distro/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bbappend
> index b0b1df2..7e8eaf2 100644
> --- a/meta-arago-distro/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bbappend
> +++ b/meta-arago-distro/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bbappend
> @@ -1,9 +1,7 @@
> -MACHINE_KERNEL_PR_append = "-arago0"
> +MACHINE_KERNEL_PR_append = "-arago1"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
>  
> -require copy-defconfig.inc
> -
>  KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
>  
>  kernel_do_configure_prepend() {
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

