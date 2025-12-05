Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55EAD374A3
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 20:48:42 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3559.1764967719431377427
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 05 Dec 2025 12:48:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8357340C86;
	Fri,  5 Dec 2025 20:48:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZNR-A58vk-k3; Fri,  5 Dec 2025 20:48:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4230340A20;
	Fri,  5 Dec 2025 20:48:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6DFE2176404; Fri,  5 Dec 2025 15:48:34 -0500 (EST)
Date: Fri, 5 Dec 2025 15:48:34 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] coremark: Clean up buildpaths QA
 error
Message-ID: <20251205204834.GF11121@denix.org>
References: <20251201184100.1372032-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201184100.1372032-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 05 Dec 2025 20:48:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16863

On Mon, Dec 01, 2025 at 12:41:00PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> The coremark binary includes a copy of the compiler flags in the output
> which breaks the reproducible build tenet of Yocto.  This patch simply
> replaces COMPILER_FLAGS with "".

This is also needed on scarthgap, where it is a warning, not an error, but 
still.


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  ..._main-Remove-printing-compiler-flags.patch | 41 +++++++++++++++++++
>  .../coremark/coremark_git.bb                  |  5 ++-
>  2 files changed, 45 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-test/recipes-benchmark/coremark/coremark/0001-core_main-Remove-printing-compiler-flags.patch
> 
> diff --git a/meta-arago-test/recipes-benchmark/coremark/coremark/0001-core_main-Remove-printing-compiler-flags.patch b/meta-arago-test/recipes-benchmark/coremark/coremark/0001-core_main-Remove-printing-compiler-flags.patch
> new file mode 100644
> index 00000000..ef7c78b2
> --- /dev/null
> +++ b/meta-arago-test/recipes-benchmark/coremark/coremark/0001-core_main-Remove-printing-compiler-flags.patch
> @@ -0,0 +1,41 @@
> +From 0af4e2298ccacc8afc0294b7a731f0e866155427 Mon Sep 17 00:00:00 2001
> +From: Ryan Eatmon <reatmon@ti.com>
> +Date: Mon, 1 Dec 2025 12:21:23 -0600
> +Subject: [PATCH] core_main: Remove printing compiler flags
> +
> +Reproducible builds do not like including anything that references the
> +build environment on the host machine.  This would include printing out
> +the COMPILER_FLAGS macro.  Substitute it with "".
> +
> +Upstream-Status: Inappropriate [OE-Specific]
> +
> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> +---
> + core_main.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/core_main.c b/core_main.c
> +index a4beeb6..f0ab87f 100644
> +--- a/core_main.c
> ++++ b/core_main.c
> +@@ -380,7 +380,7 @@ for (i = 0; i < MULTITHREAD; i++)
> +     ee_printf("Iterations       : %lu\n",
> +               (long unsigned)default_num_contexts * results[0].iterations);
> +     ee_printf("Compiler version : %s\n", COMPILER_VERSION);
> +-    ee_printf("Compiler flags   : %s\n", COMPILER_FLAGS);
> ++    ee_printf("Compiler flags   : %s\n", ""); //Reproducible build fix: COMPILER_FLAGS);
> + #if (MULTITHREAD > 1)
> +     ee_printf("Parallel %s : %d\n", PARALLEL_METHOD, default_num_contexts);
> + #endif
> +@@ -410,7 +410,7 @@ for (i = 0; i < MULTITHREAD; i++)
> +                       default_num_contexts * results[0].iterations
> +                           / time_in_secs(total_time),
> +                       COMPILER_VERSION,
> +-                      COMPILER_FLAGS);
> ++                      ""); //Reproducible build fix: COMPILER_FLAGS);
> + #if defined(MEM_LOCATION) && !defined(MEM_LOCATION_UNSPEC)
> +             ee_printf(" / %s", MEM_LOCATION);
> + #else
> +-- 
> +2.43.0
> +
> diff --git a/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb b/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb
> index 1e002c06..9d770c44 100644
> --- a/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb
> +++ b/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb
> @@ -3,7 +3,10 @@ SUMMARY = "The benchmark utility to measure the performance of CPU"
>  LICENSE = "Coremark"
>  LIC_FILES_CHKSUM = "file://LICENSE.md;md5=0a18b17ae63deaa8a595035f668aebe1"
>  
> -SRC_URI = "git://github.com/eembc/coremark.git;branch=main;protocol=https"
> +SRC_URI = " \
> +    git://github.com/eembc/coremark.git;branch=main;protocol=https \
> +    file://0001-core_main-Remove-printing-compiler-flags.patch \
> +"
>  PV = "1.01+git"
>  SRCREV = "1f483d5b8316753a742cbf5590caf5bd0a4e4777"
>  
> -- 
> 2.43.0

