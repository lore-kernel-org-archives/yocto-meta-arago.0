Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 8C32C530B7
	for <meta-arago@arago-project.org>;
	Wed,  6 Oct 2021 23:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EF25840C1E;
	Wed,  6 Oct 2021 23:19:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id vLHLL_OksOB4; Wed,  6 Oct 2021 23:19:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C2CE640031;
	Wed,  6 Oct 2021 23:19:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7CC7017467A; Wed,  6 Oct 2021 19:19:56 -0400 (EDT)
Date: Wed, 6 Oct 2021 19:19:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Vivien Didelot <vivien.didelot@gmail.com>
Message-ID: <20211006231956.GN1528@denix.org>
References: <20211006205454.4056166-1-vdidelot@pbsc.com>
MIME-Version: 1.0
In-Reply-To: <20211006205454.4056166-1-vdidelot@pbsc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [PATCH] qtwebengine: replace patch with chromium flags
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
X-List-Received-Date: Wed, 06 Oct 2021 23:19:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 06, 2021 at 04:54:54PM -0400, Vivien Didelot wrote:
> Instead of maintaining an inappropriate hack on qtwebengine to disable
> seccomp filter sandbox, export the corresponding chromium flag in
> the QTWEBENGINE_CHROMIUM_FLAGS environment variable.
> 
> Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
> ---
>  .../qt5/qtbase-conf/ti33x/qt_env.sh           |  5 +++
>  ...-disable-SECCOMP-BPF-Sandbox-at-star.patch | 32 -------------------
>  .../recipes-qt/qt5/qtwebengine_git.bbappend   |  4 ---
>  3 files changed, 5 insertions(+), 36 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch
> 
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
> index 29fa2969..96526393 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
> @@ -7,3 +7,8 @@ export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
>  export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
>  export QT_QPA_EGLFS_ALWAYS_SET_MODE=1
>  export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
> +
> +# SECCOMP-BPF Sandbox does not work due to unexpected FUTEX_UNLOCK_PI call
> +# from the pthread implementation. Disable this feature temporarily until
> +# those issues are resolved.
> +export QTWEBENGINE_CHROMIUM_FLAGS="--disable-seccomp-filter-sandbox"

Why is this only done for ti33x platform? What about other platforms?


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

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

