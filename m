Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id A8D3652B5B
	for <meta-arago@arago-project.org>;
	Thu,  7 Oct 2021 18:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6763640CA8;
	Thu,  7 Oct 2021 18:12:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id P3XMr4b-_c_4; Thu,  7 Oct 2021 18:12:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4529A40CA7;
	Thu,  7 Oct 2021 18:12:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EB50217467F; Thu,  7 Oct 2021 14:12:10 -0400 (EDT)
Date: Thu, 7 Oct 2021 14:12:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Vivien Didelot <vivien.didelot@gmail.com>
Message-ID: <20211007181210.GS1528@denix.org>
References: <20211007175730.152202-1-vdidelot@pbsc.com>
MIME-Version: 1.0
In-Reply-To: <20211007175730.152202-1-vdidelot@pbsc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [PATCH v2 1/2] qtbase-conf: disable the seccomp filter sandbox
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
X-List-Received-Date: Thu, 07 Oct 2021 18:11:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 07, 2021 at 01:57:29PM -0400, Vivien Didelot wrote:
> SECCOMP-BPF Sandbox is known to cause runtime issues so set the
> QTWEBENGINE_CHROMIUM_FLAGS environment variable to disable this
> feature temporarily until those issues are resolved.
> 
> Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh       | 5 +++++
>  meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
> index 146ee07e..928e2cc7 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
> @@ -6,3 +6,8 @@ export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
>  export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
>  export QT_QPA_EGLFS_ALWAYS_SET_MODE=1
>  export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
> +
> +# SECCOMP-BPF Sandbox does not work due to unexpected FUTEX_UNLOCK_PI call
> +# from the pthread implementation. Disable this feature temporarily until
> +# those issues are resolved.
> +export QTWEBENGINE_CHROMIUM_FLAGS="--disable-seccomp-filter-sandbox"
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
> -- 
> 2.33.0

