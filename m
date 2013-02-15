Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTP id B71D352A50
	for <meta-arago@arago-project.org>;
	Fri, 15 Feb 2013 03:42:06 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MI8001BKSY5XMU1@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 14 Feb 2013 21:42:06 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B4F50201AD; Thu,
	14 Feb 2013 22:42:05 -0500 (EST)
Date: Thu, 14 Feb 2013 22:42:05 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: fcooperjr27@gmail.com
Message-id: <20130215034205.GF9154@denix.org>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
	<1360629979-24789-12-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1360629979-24789-12-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: Re: [PATCH 12/18] arago-tisdk-amsdk-sdk-host: Use generic name for kernel sources
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
X-List-Received-Date: Fri, 15 Feb 2013 03:42:07 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Feb 11, 2013 at 06:46:13PM -0600, fcooperjr27@gmail.com wrote:
> From: Franklin S. Cooper Jr <fcooper@ti.com>
> 
> * Use generic name for kernel sources which will allow for any machine to be
>   used without modification.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    8 +++-----
>  1 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
> index 14626c8..b990235 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
> @@ -1,17 +1,15 @@
>  DESCRIPTION = "Task to install additional scripts and applications into the SDK"
>  LICENSE = "MIT"
> -PR = "r3"
> +PR = "r4"
>  
>  inherit packagegroup
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  # Choose the kernel and u-boot recipe sources to use
> -U-BOOT_SRC = ""
> -KERNEL_SRC = ""
>  
> -U-BOOT_SRC_am335x-evm = "u-boot-src"
> -KERNEL_SRC_am335x-evm = "linux-am335x-src"
> +U-BOOT_SRC  = "u-boot-src"
> +KERNEL_SRC := "${PREFERRED_PROVIDER_virtual/kernel}-src"

1. Do you need to use := assignment here?
2. Should we also consider using existing PREFERRED_PROVIDER_virtual/bootloader 
for u-boot sources here as well?

-- 
Denys

>  TOOLS = "pinmux-utility"
>  TOOLS_am37x-evm_append = " flash-utility"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

