Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02680CA5FC4
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 23:36:37 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.220.1790811387894895351
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Sep 2026 16:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A06F340CD1;
	Wed, 30 Sep 2026 23:36:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BdnXywSPXvWH; Wed, 30 Sep 2026 23:36:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 53E7740B13;
	Wed, 30 Sep 2026 23:36:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7B9CA17EEE4; Wed, 30 Sep 2026 19:36:22 -0400 (EDT)
Date: Wed, 30 Sep 2026 19:36:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] mesa-demos: Update recipe to match
 oe-core
Message-ID: <20260930233622.GK4190@denix.org>
References: <20260930222241.3467841-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930222241.3467841-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 23:36:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17727

On Wed, Sep 30, 2026 at 05:22:41PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> oe-core has moved the version of mesa-demos beyond the SRCREV that we
> were pointing to in our mesa-demos_get.bb recipe.  We can safely remove
> our recipe in favor of the oe-core version... except there is one change
> in our recipe that is needed that oe-core does not have.  Removing "x11"
> as a REQUIRED_DISTRO_FEATURES.
> 
> We are working on a patch to oe-core to fix this, in the meantime we can
> carry a simple bbappend to correctly adjust this.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../mesa/mesa-demos-arago.inc                 |  1 +
>  .../mesa/mesa-demos_%.bbappend                |  4 ++
>  .../recipes-graphics/mesa/mesa-demos_git.bb   | 41 -------------------
>  3 files changed, 5 insertions(+), 41 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
>  create mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos_%.bbappend
>  delete mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
> 
> diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc b/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
> new file mode 100644
> index 00000000..ff3f2992
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
> @@ -0,0 +1 @@
> +REQUIRED_DISTRO_FEATURES:remove = "x11"
> diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_%.bbappend b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_%.bbappend
> new file mode 100644
> index 00000000..3b26e342
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_%.bbappend
> @@ -0,0 +1,4 @@
> +MESA_DEMOS_ARAGO = ""
> +MESA_DEMOS_ARAGO:arago = "mesa-demos-arago.inc"

For a one-liner like this, I'd suggest doing it directly in the arago.conf, 
instead of a distro-guarded .bbappend:

REQUIRED_DISTRO_FEATURES:remove:pn-mesa-demos = "x11"

Similar to how we do this for different PACKAGECONFIGs...

It seems cleaner and is already distro-guarded.


> +
> +require ${MESA_DEMOS_ARAGO}
> diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
> deleted file mode 100644
> index 8dab581b..00000000
> --- a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -SUMMARY = "Mesa demo applications"
> -DESCRIPTION = "This package includes the demonstration application, such as glxgears. \
> -These applications can be used for Mesa validation and benchmarking."
> -HOMEPAGE = "http://mesa3d.org"
> -BUGTRACKER = "https://bugs.freedesktop.org"
> -
> -LICENSE = "MIT AND LicenseRef-PD"
> -LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=a481fbdb2ac800ecb12405c33bcfacae \
> -                    file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
> -
> -SRC_URI = "git://gitlab.freedesktop.org/mesa/demos.git;protocol=https;branch=main"
> -SRCREV = "02eae079cb0b8186064d5b194ca4cc2995f099ee"
> -
> -PV = "9.0.0+git"
> -
> -inherit meson pkgconfig features_check
> -REQUIRED_DISTRO_FEATURES = "opengl"
> -
> -EXTRA_OEMESON = "-Dwith-system-data-files=true"
> -
> -PACKAGECONFIG ?= "drm egl gles1 gles2 \
> -                  ${@bb.utils.filter('DISTRO_FEATURES', 'vulkan x11 wayland', d)}"
> -
> -PACKAGECONFIG[drm] = "-Dlibdrm=enabled,-Dlibdrm=disabled,libdrm"
> -PACKAGECONFIG[egl] = "-Degl=enabled,-Degl=disabled,virtual/egl"
> -PACKAGECONFIG[gles1] = "-Dgles1=enabled,-Dgles1=disabled,virtual/libgles1"
> -PACKAGECONFIG[gles2] = "-Dgles2=enabled,-Dgles2=disabled,virtual/libgles2"
> -PACKAGECONFIG[glut] = "-Dwith-glut=${STAGING_EXECPREFIXDIR},-Dglut=disabled,freeglut"
> -PACKAGECONFIG[osmesa] = "-Dosmesa=enabled,-Dosmesa=disabled,"
> -PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader glslang-native"
> -PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/libgl wayland wayland-native wayland-protocols libxkbcommon libdecor"
> -PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11 libglu libxkbcommon libxcb"
> -
> -do_install:append() {
> -	# it can be completely empty when all PACKAGECONFIG options are disabled
> -	rmdir --ignore-fail-on-non-empty ${D}${bindir}
> -
> -	if [ -f ${D}${bindir}/clear ]; then
> -		mv ${D}${bindir}/clear ${D}${bindir}/clear.mesa-demos
> -	fi
> -}
> -- 
> 2.43.0

