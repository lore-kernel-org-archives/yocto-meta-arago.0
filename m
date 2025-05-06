Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C1DC3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 16:08:36 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.79735.1746547706475759326
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 May 2025 09:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B231140CC6;
	Tue,  6 May 2025 16:08:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SIoAYai24P_9; Tue,  6 May 2025 16:08:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 878F640CC5;
	Tue,  6 May 2025 16:08:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C0C661678F0; Tue,  6 May 2025 12:08:22 -0400 (EDT)
Date: Tue, 6 May 2025 12:08:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap/master][PATCH] mesa-demos: add a git
 version
Message-ID: <20250506160822.GA18383@denix.org>
References: <20250506002203.1766376-1-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506002203.1766376-1-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 May 2025 16:08:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16179

On Mon, May 05, 2025 at 07:22:03PM -0500, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Add a newer git version of this package to fetch modifications that
> allow us to build the EGL and GLES specific demos without the hard
> Desktop GL and X11 dependencies.
> 
> These modification have not made it into a tag yet, but this recipe can
> be removed once oe-core's version of the package passes
> 02eae079cb0b8186064d5b194ca4cc2995f099ee.

Adding a different version of an upstream recipe potentially causes signature 
change during YP compliance checks.

There are 2 alternatives:

1. Do a .bbappend that modifies SRC_URI, SRCREV, S and anything else you need. 
That way you can activate it based on one of the overrides, such as :arago

2. Set DEFAULT_PREFERENCE = "-1" in the recipe and then force preference in a 
distro conf with PREFERRED_VERSION. And you have to set the correct PV here.


> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  .../recipes-graphics/mesa/mesa-demos_git.bb   | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
> 
> diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
> new file mode 100644
> index 00000000..5dd5a8ec
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
> @@ -0,0 +1,43 @@
> +SUMMARY = "Mesa demo applications"
> +DESCRIPTION = "This package includes the demonstration application, such as glxgears. \
> +These applications can be used for Mesa validation and benchmarking."
> +HOMEPAGE = "http://mesa3d.org"
> +BUGTRACKER = "https://bugs.freedesktop.org"
> +
> +LICENSE = "MIT & PD"
> +LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=a481fbdb2ac800ecb12405c33bcfacae \
> +                    file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
> +
> +SRC_URI = "git://gitlab.freedesktop.org/mesa/demos.git;protocol=https;branch=main"
> +SRCREV = "02eae079cb0b8186064d5b194ca4cc2995f099ee"
> +S = "${WORKDIR}/git"
> +
> +inherit meson pkgconfig features_check
> +# depends on virtual/egl, virtual/libgl ...
> +REQUIRED_DISTRO_FEATURES = "opengl"
> +
> +EXTRA_OEMESON = "-Dwith-system-data-files=true"
> +
> +# Note: wayland is not included as the feature requires libdecor recipe,
> +# which is not currently in core
> +PACKAGECONFIG ?= "drm egl gles1 gles2 \
> +                  ${@bb.utils.filter('DISTRO_FEATURES', 'vulkan x11 wayland', d)}"
> +
> +PACKAGECONFIG[drm] = "-Dlibdrm=enabled,-Dlibdrm=disabled,libdrm"
> +PACKAGECONFIG[egl] = "-Degl=enabled,-Degl=disabled,virtual/egl"
> +PACKAGECONFIG[gles1] = "-Dgles1=enabled,-Dgles1=disabled,virtual/libgles1"
> +PACKAGECONFIG[gles2] = "-Dgles2=enabled,-Dgles2=disabled,virtual/libgles2"
> +PACKAGECONFIG[glut] = "-Dwith-glut=${STAGING_EXECPREFIXDIR},-Dglut=disabled,freeglut"
> +PACKAGECONFIG[osmesa] = "-Dosmesa=enabled,-Dosmesa=disabled,"
> +PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader glslang-native"
> +PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/libgl wayland wayland-native wayland-protocols libxkbcommon libdecor"
> +PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11 libglu libxkbcommon libxcb"
> +
> +do_install:append() {
> +	# it can be completely empty when all PACKAGECONFIG options are disabled
> +	rmdir --ignore-fail-on-non-empty ${D}${bindir}
> +
> +	if [ -f ${D}${bindir}/clear ]; then
> +		mv ${D}${bindir}/clear ${D}${bindir}/clear.mesa-demos
> +	fi
> +}
> -- 
> 2.49.0
> 

