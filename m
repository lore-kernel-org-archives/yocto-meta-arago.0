Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4A0D1BDF5
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 21:32:54 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2369.1730755966691634161
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 13:32:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BC2EA40CF2;
	Mon,  4 Nov 2024 21:32:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ewig0zUNfc-T; Mon,  4 Nov 2024 21:32:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 839BB40CEF;
	Mon,  4 Nov 2024 21:32:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B2B4B1640C4; Mon,  4 Nov 2024 16:32:41 -0500 (EST)
Date: Mon, 4 Nov 2024 16:32:41 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [meta-ti][master/scarthgap][PATCH v2 1/2]
 mesa-pvr_23.2.1: Fix build issues with llvm 18+
Message-ID: <20241104213241.GK20070@denix.org>
References: <20241104211841.9898-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104211841.9898-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 04 Nov 2024 21:32:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15589

Wrong list?


On Mon, Nov 04, 2024 at 03:18:40PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> Backport two fixes from the latest mesa project to fix two builds issues
> related to newer llvm versions.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2: Rework commit message since we need to add patches for mesa-pvr_22.3.5 too.
> 
>  ...allium-Fix-build-with-llvm-18-and-19.patch | 53 +++++++++++++++++++
>  .../recipes-graphics/mesa/mesa-pvr_23.2.1.bb  |  1 +
>  2 files changed, 54 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-18-and-19.patch
> 
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-18-and-19.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-18-and-19.patch
> new file mode 100644
> index 00000000..ad5059f1
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-18-and-19.patch
> @@ -0,0 +1,53 @@
> +From 6c5033bb01a3a1341d4db5007586a5f2e2727b0a Mon Sep 17 00:00:00 2001
> +From: Ryan Eatmon <reatmon@ti.com>
> +Date: Mon, 4 Nov 2024 13:37:29 -0600
> +Subject: [PATCH] gallium: Fix build with llvm 18 and 19
> +
> +- CodeGenOpt::Level changed to CodeGenOoptLevel. [1]
> +- llvm::sys::getHostCPUFeatures() now returns the features instead of
> +modifying the passed in argument. [2]
> +
> +Upstream-Status: Backport [1][https://gitlab.freedesktop.org/mesa/mesa/-/commit/f79617fe804ea6524651ff1bc3a91098d3199179]
> +Upstream-Status: Backport [2][https://gitlab.freedesktop.org/mesa/mesa/-/commit/fa9cd89a85b904615ebc11da609445b5b751e68d]
> +
> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> +---
> + src/gallium/auxiliary/gallivm/lp_bld_misc.cpp | 14 ++++++++++++--
> + 1 file changed, 12 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
> +index 5e7a30a6cc2..dbc777e3096 100644
> +--- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
> ++++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
> +@@ -366,7 +366,11 @@ lp_build_create_jit_compiler_for_module(LLVMExecutionEngineRef *OutJIT,
> +    builder.setEngineKind(EngineKind::JIT)
> +           .setErrorStr(&Error)
> +           .setTargetOptions(options)
> ++#if LLVM_VERSION_MAJOR >= 18
> ++          .setOptLevel((CodeGenOptLevel)OptLevel);
> ++#else
> +           .setOptLevel((CodeGenOpt::Level)OptLevel);
> ++#endif
> + 
> + #if DETECT_OS_WINDOWS
> +     /*
> +@@ -394,8 +398,14 @@ lp_build_create_jit_compiler_for_module(LLVMExecutionEngineRef *OutJIT,
> +     * which allows us to enable/disable code generation based
> +     * on the results of cpuid on these architectures.
> +     */
> +-   llvm::StringMap<bool> features;
> +-   llvm::sys::getHostCPUFeatures(features);
> ++   #if LLVM_VERSION_MAJOR >= 19
> ++      /* llvm-19+ returns StringMap from getHostCPUFeatures.
> ++      */
> ++      auto features = llvm::sys::getHostCPUFeatures();
> ++   #else
> ++      llvm::StringMap<bool> features;
> ++      llvm::sys::getHostCPUFeatures(features);
> ++   #endif
> + 
> +    for (StringMapIterator<bool> f = features.begin();
> +         f != features.end();
> +-- 
> +2.17.1
> +
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> index 21134bc7..33af456d 100644
> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> @@ -16,6 +16,7 @@ SRC_URI = " \
>      file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
>      file://0001-gallium-Fix-build-with-llvm-17.patch \
>      file://0001-meson-Disable-cmake-dependency-detector-for-llvm.patch \
> +    file://0001-gallium-Fix-build-with-llvm-18-and-19.patch \
>  "
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.17.1

