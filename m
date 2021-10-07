Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id C718F52B5B
	for <meta-arago@arago-project.org>;
	Thu,  7 Oct 2021 18:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 82BC740CA8;
	Thu,  7 Oct 2021 18:12:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id m_noNOkU1FPR; Thu,  7 Oct 2021 18:12:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 68DA140CA7;
	Thu,  7 Oct 2021 18:12:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2CDE917467F; Thu,  7 Oct 2021 14:12:31 -0400 (EDT)
Date: Thu, 7 Oct 2021 14:12:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Vivien Didelot <vivien.didelot@gmail.com>
Message-ID: <20211007181231.GT1528@denix.org>
References: <20211007175730.152202-1-vdidelot@pbsc.com>
	<20211007175730.152202-2-vdidelot@pbsc.com>
MIME-Version: 1.0
In-Reply-To: <20211007175730.152202-2-vdidelot@pbsc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [PATCH v2 2/2] qtwebengine: remove seccomp filter sandbox hack
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
X-List-Received-Date: Thu, 07 Oct 2021 18:11:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 07, 2021 at 01:57:30PM -0400, Vivien Didelot wrote:
> Now that qtbase-conf disables the seccomp filter sandbox via an
> environment variable, the hack patch against qtwebengine can be
> dropped.
> 
> Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  ...-disable-SECCOMP-BPF-Sandbox-at-star.patch | 32 -------------------
>  .../recipes-qt/qt5/qtwebengine_git.bbappend   |  4 ---
>  2 files changed, 36 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch
> 
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch b/meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch
> deleted file mode 100644
> index 09f1870d..00000000
> --- a/meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 77fc6e4391562a1f84d82b58319a73de08242797 Mon Sep 17 00:00:00 2001
> -From: Eric Ruei <e-ruei1@ti.com>
> -Date: Fri, 8 Mar 2019 18:17:06 -0500
> -Subject: [PATCH 3/3] qtwebengine: HACK: disable SECCOMP-BPF Sandbox at startup
> -
> -SECCOMP-BPF Sandbox does not work due to unexpected FUTEX_UNLOCK_PI call
> -from the pthread implementation
> -Disable this feature temporarily until those issues are resolved.
> -
> -Upstream-Status: Inappropriate [HACK]
> -
> -Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ----
> - src/core/web_engine_context.cpp | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/src/core/web_engine_context.cpp b/src/core/web_engine_context.cpp
> -index 48e5bc4..9ba3fa4 100644
> ---- a/src/core/web_engine_context.cpp
> -+++ b/src/core/web_engine_context.cpp
> -@@ -347,6 +347,8 @@ WebEngineContext::WebEngineContext()
> -         parsedCommandLine->AppendSwitch(switches::kNoSandbox);
> - #elif defined(Q_OS_LINUX)
> -         parsedCommandLine->AppendSwitch(service_manager::switches::kDisableSetuidSandbox);
> -+        // HACK: disable seccomp filter sandbox for now because it does not work
> -+        parsedCommandLine->AppendSwitch(service_manager::switches::kDisableSeccompFilterSandbox);
> - #endif
> -     } else {
> -         parsedCommandLine->AppendSwitch(switches::kNoSandbox);
> --- 
> -1.9.1
> -
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
> index c50b020f..6459bbf7 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
> @@ -1,8 +1,4 @@
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  PR_append = ".arago1"
>  
> -SRC_URI += " \
> -    file://0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch \
> -"
> -
>  DEPENDS += "bison-native"
> -- 
> 2.33.0

