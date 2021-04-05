Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id C1A8052BB6
	for <meta-arago@arago-project.org>;
	Mon,  5 Apr 2021 21:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8529140BEC;
	Mon,  5 Apr 2021 21:28:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id vEhSkSmcroJC; Mon,  5 Apr 2021 21:28:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4C59840BE9;
	Mon,  5 Apr 2021 21:28:05 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 18E5D174579; Mon,  5 Apr 2021 17:28:05 -0400 (EDT)
Date: Mon, 5 Apr 2021 17:28:05 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Gowtham Tammana <g-tammana@ti.com>
Message-ID: <20210405212805.GC15937@denix.org>
References: <20210405203928.7783-1-g-tammana@ti.com>
	<20210405203928.7783-3-g-tammana@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210405203928.7783-3-g-tammana@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, denys@konsulko.com,
	Krunal Bhargav <k-bhargav@ti.com>
Subject: Re: [dunfell][PATCH v2 2/3] qtwebkit: Fix no X11 build
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
X-List-Received-Date: Mon, 05 Apr 2021 21:27:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 05, 2021 at 03:39:27PM -0500, Gowtham Tammana wrote:
> qtwebkit build is failing to set EGL_NO_X11 on platforms with no x11
> support causing below failure.
> 
> ```{.package=qtwebkit .version=dunfell}
> In file included from
> tisdk/build/arago-tmp-external-arm-glibc/work/aarch64-linux/qtwebkit/5.14.2+gitAUTOINC+ab1bd15209-r0.arago7/recipe-sysroot/usr/include/EGL/egl.h:39,
>                 from tisdk/build/arago-tmp-external-arm-glibc/work/aarch64-linux/qtwebkit/5.14.2+gitAUTOINC+ab1bd15209-r0.arago7/git/Source/WebCore/platform/graphics/opengl/Extensions3DOpenGLES.cpp:36:
> tisdk/build/arago-tmp-external-arm-glibc/work/aarch64-linux/qtwebkit/5.14.2+gitAUTOINC+ab1bd15209-r0.arago7/recipe-sysroot/usr/include/EGL/eglplatform.h:134:10: fatal error: X11/Xlib.h: No such file or directory
>   134 | #include <X11/Xlib.h>
>       |          ^~~~~~~~~~~~
> compilation terminated.
> ```
> 
> Setting up the flag EGL_NO_X11 when X11 target is disabled.
> 
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  ...re-PlatformQt.cmake-Fix-no-x11-build.patch | 46 +++++++++++++++++++
>  .../recipes-qt/qt5/qtwebkit_%.bbappend        |  3 +-
>  2 files changed, 48 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-WebCore-PlatformQt.cmake-Fix-no-x11-build.patch
> 
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-WebCore-PlatformQt.cmake-Fix-no-x11-build.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-WebCore-PlatformQt.cmake-Fix-no-x11-build.patch
> new file mode 100644
> index 00000000..c70b3dc0
> --- /dev/null
> +++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-WebCore-PlatformQt.cmake-Fix-no-x11-build.patch
> @@ -0,0 +1,46 @@
> +From 82b7ec12b768ba9de4b7a4ae71500a3de6574bfd Mon Sep 17 00:00:00 2001
> +From: Gowtham Tammana <g-tammana@ti.com>
> +Date: Thu, 1 Apr 2021 10:45:13 -0500
> +Subject: [PATCH] WebCore/PlatformQt.cmake: Fix no x11 build
> +
> +For platforms with no x11 support, egl package config sets up EGL_NO_X11
> +flag. However the build is not picking up this flag at the moment
> +causing below build failure.
> +
> +```{.package=qtwebkit .version=dunfell}
> +In file included from
> +tisdk/build/arago-tmp-external-arm-glibc/work/aarch64-linux/qtwebkit/5.14.2+gitAUTOINC+ab1bd15209-r0.arago7/recipe-sysroot/usr/include/EGL/egl.h:39,
> +                from tisdk/build/arago-tmp-external-arm-glibc/work/aarch64-linux/qtwebkit/5.14.2+gitAUTOINC+ab1bd15209-r0.arago7/git/Source/WebCore/platform/graphics/opengl/Extensions3DOpenGLES.cpp:36:
> +tisdk/build/arago-tmp-external-arm-glibc/work/aarch64-linux/qtwebkit/5.14.2+gitAUTOINC+ab1bd15209-r0.arago7/recipe-sysroot/usr/include/EGL/eglplatform.h:134:10: fatal error: X11/Xlib.h: No such file or directory
> +  134 | #include <X11/Xlib.h>
> +      |          ^~~~~~~~~~~~
> +compilation terminated.
> +```
> +
> +Set this flag explicitly when there is no X11 target enable.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> +---
> + Source/WebCore/PlatformQt.cmake | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/Source/WebCore/PlatformQt.cmake b/Source/WebCore/PlatformQt.cmake
> +index 99c625dc3..375d28a47 100644
> +--- a/Source/WebCore/PlatformQt.cmake
> ++++ b/Source/WebCore/PlatformQt.cmake
> +@@ -350,6 +350,10 @@ if (ENABLE_OPENGL)
> +             ${Qt5Gui_EGL_LIBRARIES}
> +             ${Qt5Gui_OPENGL_LIBRARIES}
> +         )
> ++        if (NOT ENABLE_X11_TARGET)
> ++            # EGL definitions are not getting detected. Add the EGL_NO_X11 flag.
> ++            add_definitions("-DEGL_NO_X11")
> ++        endif ()
> +     else ()
> +         list(APPEND WebCore_SOURCES
> +             platform/graphics/opengl/Extensions3DOpenGL.cpp
> +-- 
> +2.31.1
> +
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
> index 75213487..308f3f25 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
> @@ -6,9 +6,10 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
>  SRC_URI += " \
>  	file://GraphicsSurfaceGL_NoX.cpp.patch \
> +	file://0001-WebCore-PlatformQt.cmake-Fix-no-x11-build.patch \
>  "
>  
> -PR_append = ".arago7"
> +PR_append = ".arago8"
>  
>  EXTRA_OECMAKE_append = " -DCMAKE_BUILD_TYPE=Release"
>  
> -- 
> 2.31.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

