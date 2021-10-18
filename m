Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.851.1634593404645644083
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 14:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7E69A40C2C;
	Mon, 18 Oct 2021 21:43:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mf064N7M2NhP; Mon, 18 Oct 2021 21:43:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5FE5C40BE6;
	Mon, 18 Oct 2021 21:43:21 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B0D5D17468D; Mon, 18 Oct 2021 17:43:20 -0400 (EDT)
Date: Mon, 18 Oct 2021 17:43:20 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Yogesh Siraswar <yogeshs@ti.com>
Cc: Vivien Didelot <vivien.didelot@gmail.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [PATCH v2 1/2] qtbase-conf: disable the seccomp filter sandbox
Message-ID: <20211018214320.GI10132@denix.org>
References: <20211007175730.152202-1-vdidelot@pbsc.com>
 <20211007181210.GS1528@denix.org>
 <00ec3405-588f-2a3c-9692-edd5e3135cd3@ti.com>
MIME-Version: 1.0
In-Reply-To: <00ec3405-588f-2a3c-9692-edd5e3135cd3@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 18, 2021 at 11:01:13AM -0500, Yogesh Siraswar wrote:
> Is this for master or dunfell or both.

Probably both.


> On 10/7/21 1:12 PM, Denys Dmytriyenko wrote:
> >On Thu, Oct 07, 2021 at 01:57:29PM -0400, Vivien Didelot wrote:
> >>SECCOMP-BPF Sandbox is known to cause runtime issues so set the
> >>QTWEBENGINE_CHROMIUM_FLAGS environment variable to disable this
> >>feature temporarily until those issues are resolved.
> >>
> >>Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
> >
> >Acked-by: Denys Dmytriyenko <denys@konsulko.com>
> >
> >
> >>---
> >>  meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh       | 5 +++++
> >>  meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh | 5 +++++
> >>  2 files changed, 10 insertions(+)
> >>
> >>diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
> >>index 146ee07e..928e2cc7 100644
> >>--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
> >>+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
> >>@@ -6,3 +6,8 @@ export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
> >>  export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
> >>  export QT_QPA_EGLFS_ALWAYS_SET_MODE=1
> >>  export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
> >>+
> >>+# SECCOMP-BPF Sandbox does not work due to unexpected FUTEX_UNLOCK_PI call
> >>+# from the pthread implementation. Disable this feature temporarily until
> >>+# those issues are resolved.
> >>+export QTWEBENGINE_CHROMIUM_FLAGS="--disable-seccomp-filter-sandbox"
> >>diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
> >>index 29fa2969..96526393 100644
> >>--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
> >>+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
> >>@@ -7,3 +7,8 @@ export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
> >>  export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
> >>  export QT_QPA_EGLFS_ALWAYS_SET_MODE=1
> >>  export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
> >>+
> >>+# SECCOMP-BPF Sandbox does not work due to unexpected FUTEX_UNLOCK_PI call
> >>+# from the pthread implementation. Disable this feature temporarily until
> >>+# those issues are resolved.
> >>+export QTWEBENGINE_CHROMIUM_FLAGS="--disable-seccomp-filter-sandbox"
> >>-- 
> >>2.33.0
