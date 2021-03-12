Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id E722852AAB
	for <meta-arago@arago-project.org>;
	Fri, 12 Mar 2021 22:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 717BF40BEA;
	Fri, 12 Mar 2021 22:50:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id XZfDsmjCyNC3; Fri, 12 Mar 2021 22:50:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4F78B407DA;
	Fri, 12 Mar 2021 22:50:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1451917453F; Fri, 12 Mar 2021 17:50:47 -0500 (EST)
Date: Fri, 12 Mar 2021 17:50:47 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Gowtham Tammana <g-tammana@ti.com>
Message-ID: <20210312225047.GC4892@denix.org>
References: <20210312222652.14023-1-g-tammana@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210312222652.14023-1-g-tammana@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] gstreamer1.0-plugins-good: backport qmlglsink EGL build fix
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
X-List-Received-Date: Fri, 12 Mar 2021 22:50:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 12, 2021 at 04:26:52PM -0600, Gowtham Tammana wrote:
> Backport qmlglsink build fix for EGL platform with no X11 headers.
> 
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
>  ...ild-on-EGL-platform-without-X11-head.patch | 36 +++++++++++++++++++
>  .../gstreamer1.0-plugins-good_1.16.%.bbappend |  3 +-
>  2 files changed, 38 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch
> new file mode 100644
> index 00000000..79db0e27
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch
> @@ -0,0 +1,36 @@
> +From 85229adbddcd8e7cacd5ebd9467c834352a882d0 Mon Sep 17 00:00:00 2001
> +From: Philipp Zabel <p.zabel@pengutronix.de>
> +Date: Tue, 3 Dec 2019 11:36:07 +0100
> +Subject: [PATCH] qmlglsink: fix build on EGL platform without X11 headers
> +
> +If Mesa is built without X11 headers, building against Mesa EGL headers
> +requires a dependency on egl.pc, to define MESA_EGL_NO_X11_HEADERS.
> +This fixes a build error when compiling ext/qt/gstqtglutility.cc:
> +
> +  In file included from /usr/include/EGL/egl.h:39,
> +                   from /usr/include/gstreamer-1.0/gst/gl/egl/gstegl.h:44,
> +                   from ../gst-plugins-good-1.16.1/ext/qt/gstqtglutility.cc:43:
> +  /usr/include/EGL/eglplatform.h:124:10: fatal error: X11/Xlib.h: No such file or directory

Thanks for the backport! We've seen this issue in the past in other places 
too, e.g.:

https://github.com/meta-qt5/meta-qt5/commit/41666ddba78ff1f094310589489e0a070e0094d8
http://arago-project.org/git/meta-arago.git?p=meta-arago.git;a=commitdiff;h=1e83ebf61bd22ca8ad04d5538db044d81330df2c


> +Upstream-Status: Backport [c47a585052fba6830a2cddd8caa18e2305596ed0]

Special thanks for Upstream-Status! :)


> +Signed-off-by: Gowtham Tammana <g-tammana@ti.com>

Reviewed-by: Denys Dmytriyenko <denis@denix.org>


> +---
> + ext/qt/meson.build | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/ext/qt/meson.build b/ext/qt/meson.build
> +index 5f040c844..43ddc6092 100644
> +--- a/ext/qt/meson.build
> ++++ b/ext/qt/meson.build
> +@@ -89,6 +89,8 @@ if have_cxx and build_gstgl
> +     if gst_gl_have_platform_egl
> +       # Embedded linux (e.g. i.MX6) with or without windowing support
> +       qt_defines += ['-DHAVE_QT_EGLFS']
> ++      egl_dep = dependency('egl', required : false)
> ++      optional_deps += egl_dep
> +       have_qt_windowing = true
> +       if have_qpa_include
> +         # Wayland windowing
> +--
> +2.17.1
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
> index 004a9968..e2ddbc27 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
> @@ -7,6 +7,7 @@ SRC_URI += " \
>      file://0002-v4l2src-Use-generic-dmabuf-import-in-v4l2src.patch \
>      file://0001-v4l2object-Update-formats-table-to-include-YUV422-mu.patch \
>      file://0001-v4l2src-Check-for-drm-memory-support-in-try_import.patch \
> +    file://0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch \
>  "
>  
> -PR_append = ".arago2"
> +PR_append = ".arago3"
> -- 
> 2.29.0

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

