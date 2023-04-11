Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7370C7619A
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 19:35:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.24435.1681241700556832897
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 12:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 61BCD40C13;
	Tue, 11 Apr 2023 19:34:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AyMlCT0zj76u; Tue, 11 Apr 2023 19:34:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 328B840301;
	Tue, 11 Apr 2023 19:34:57 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E9D8F1637FE; Tue, 11 Apr 2023 15:34:18 -0400 (EDT)
Date: Tue, 11 Apr 2023 15:34:18 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH] linux-libc-headers:
 Remove custom Linux libc headers
Message-ID: <20230411193418.GV9226@denix.org>
References: <20230410204859.30707-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230410204859.30707-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Apr 2023 19:35:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14307

On Mon, Apr 10, 2023 at 03:48:59PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> We do not need nor want a custom libc as the base for our packages.
> Using our own Linux UAPI includes creates this situation and will
> cause issues for packages that make use of the custom kernel headers
> when moving from kernel to kernel.
> 
> If we do have some package that does need some custom header then
> it should be listed in the package itself so this dependency can
> be tracked correct. This is all described in the base recipe here[0].
> 
> As recommended, let's not create a custom linux-libc-headers. Remove
> this recipe and references to specific versions.
> 
> [0] https://cgit.openembedded.org/openembedded-core/tree/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc#n7

Yes, the above recommendation from OE-Core was always there and has been 
enforced for a long time, until there were packages added to Arago and 
TI-SDK requiring TI custom Linux UAPI headers that weren't upstreamed...

Not sure what's the latest list of such packages in Arago, but I see at 
least "switch-config" is still there. I'd recommend disabling those custom 
packages from the build first, before removing linux-libc-headers - you'll 
get broken builds for either 5.10 or 6.1, which isn't very nice.

But yes, this is the right move going forward - I was hesitant adding this 
hack back in the day and always wanted to remove it, as it would cause 
extra pain during every LTS migration...


> Signed-off-by: Andrew Davis <afd@ti.com>

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  .../conf/distro/include/toolchain-gcc.inc     |  4 ----
>  .../linux-libc-headers_5.10.bb                | 20 -------------------
>  2 files changed, 24 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
> 
> diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
> index 5570594d..1c059a6f 100644
> --- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
> +++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
> @@ -16,7 +16,6 @@ PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-can
>  SDKGCCVERSION ?= "11%"
>  SDKBINUVERSION ?= "2.38%"
>  SDKGLIBCVERSION ?= "2.35%"
> -SDKLINUXLIBCVERSION ?= "5.10%"
>  
>  PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
>  PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?= "${SDKGCCVERSION}"
> @@ -25,7 +24,6 @@ PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?= "${SDKBINUVERSION}"
>  PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
>  PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
>  PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
> -PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${SDKLINUXLIBCVERSION}"
>  PREFERRED_VERSION_nativesdk-glibc ?= "${SDKGLIBCVERSION}"
>  PREFERRED_VERSION_nativesdk-glibc-locale ?= "${SDKGLIBCVERSION}"
>  PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
> @@ -35,11 +33,9 @@ PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
>  GCCVERSION ?= "11%"
>  BINUVERSION ?= "2.38%"
>  GLIBCVERSION ?= "2.35%"
> -LINUXLIBCVERSION ?= "5.10%"
>  
>  PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
>  PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
> -PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
>  PREFERRED_VERSION_glibc ?= "${GLIBCVERSION}"
>  PREFERRED_VERSION_glibc-locale ?= "${GLIBCVERSION}"
>  PREFERRED_VERSION_glibc-initial ?= "${GLIBCVERSION}"
> diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
> deleted file mode 100644
> index 43493570..00000000
> --- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> -
> -PR:append = ".arago0"
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> -
> -BRANCH = "ti-linux-5.10.y"
> -SRCREV = "73aa709ca10103b61fba3a07471dbb4dcb56db45"
> -
> -KERNEL_GIT_URI = "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
> -KERNEL_GIT_PROTOCOL = "https"
> -SRC_URI = "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH}"
> -
> -S = "${WORKDIR}/git"
> -
> -# below overrides the multilib list - can be dropped for the next LTS
> -do_install_armmultilib () {
> -	oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm_para.h asm/mman.h asm/param.h asm/perf_regs.h asm/bpf_perf_event.h
> -	oe_multilib_header asm/posix_types.h asm/ptrace.h  asm/setup.h  asm/sigcontext.h asm/siginfo.h asm/signal.h asm/stat.h  asm/statfs.h asm/swab.h  asm/types.h asm/unistd.h
> -}
> -- 
> 2.39.2

