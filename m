Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 0B0B452BB6
	for <meta-arago@arago-project.org>;
	Mon,  5 Apr 2021 21:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D201A40BEC;
	Mon,  5 Apr 2021 21:28:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id twDHLslXfZ1p; Mon,  5 Apr 2021 21:28:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 97ED140BE9;
	Mon,  5 Apr 2021 21:28:24 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 66244174579; Mon,  5 Apr 2021 17:28:24 -0400 (EDT)
Date: Mon, 5 Apr 2021 17:28:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Gowtham Tammana <g-tammana@ti.com>
Message-ID: <20210405212824.GD15937@denix.org>
References: <20210405203928.7783-1-g-tammana@ti.com>
	<20210405203928.7783-4-g-tammana@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210405203928.7783-4-g-tammana@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, denys@konsulko.com,
	Krunal Bhargav <k-bhargav@ti.com>
Subject: Re: [dunfell][PATCH v2 3/3] qtwebkit: Cleanup old patches
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
X-List-Received-Date: Mon, 05 Apr 2021 21:28:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 05, 2021 at 03:39:28PM -0500, Gowtham Tammana wrote:
> Remove the patches that are no longer needed.
> 
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  ...e-to-use-GL_NoX-version-of-GraphicsS.patch | 29 ----------------
>  .../qt5/qtwebkit/GraphicsSurfaceToken.h.patch | 33 -------------------
>  .../recipes-qt/qt5/qtwebkit/WebCore.pri.patch | 17 ----------
>  .../recipes-qt/qt5/qtwebkit_%.bbappend        |  6 +---
>  4 files changed, 1 insertion(+), 84 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch
>  delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch
>  delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
> 
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch
> deleted file mode 100644
> index 55a4c032..00000000
> --- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 90de2ab42bdd51b92dd00f700d6766ca1ffd23c0 Mon Sep 17 00:00:00 2001
> -From: Denys Dmytriyenko <denys@ti.com>
> -Date: Thu, 17 Jul 2014 16:11:46 -0400
> -Subject: [PATCH] Target.pri: update to use GL_NoX version of GraphicsSurface
> - sources
> -
> -Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ----
> - Source/WebCore/Target.pri | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/Source/WebCore/Target.pri b/Source/WebCore/Target.pri
> -index e2044bc..cc9bdd4 100644
> ---- a/Source/WebCore/Target.pri
> -+++ b/Source/WebCore/Target.pri
> -@@ -4283,6 +4283,10 @@ use?(GRAPHICS_SURFACE) {
> -             platform/graphics/surfaces/glx/X11Helper.cpp \
> -             platform/graphics/surfaces/glx/GraphicsSurfaceGLX.cpp
> -     }
> -+    contains(QT_CONFIG, opengles2) {
> -+        SOURCES -= platform/graphics/surfaces/qt/GraphicsSurfaceGLX.cpp
> -+        SOURCES += platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.cpp
> -+    }
> - }
> - 
> - build?(qttestsupport) {
> --- 
> -2.0.0
> -
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch
> deleted file mode 100644
> index 722df392..00000000
> --- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> ---- qtwebkit/Source/WebCore/platform/graphics/surfaces/GraphicsSurfaceToken.h.orig	2013-09-07 13:44:47.906849335 +0530
> -+++ qtwebkit/Source/WebCore/platform/graphics/surfaces/GraphicsSurfaceToken.h	2013-09-07 13:46:12.554845618 +0530
> -@@ -50,17 +50,30 @@ struct GraphicsSurfaceToken {
> -     {
> -         return frontBufferHandle != rhs.frontBufferHandle;
> -     }
> - 
> -     bool isValid() const
> -     {
> -         return frontBufferHandle;
> -     }
> -+#elif PLATFORM(QT)
> -+    GraphicsSurfaceToken(uint32_t windowID = 0)
> -+         : frontBufferHandle(windowID)
> -+    { }
> -+
> -+     bool operator!=(const GraphicsSurfaceToken &rhs) const
> -+     {
> -+         return frontBufferHandle != rhs.frontBufferHandle;
> -+     }
> - 
> -+     bool isValid() const
> -+     {
> -+         return frontBufferHandle;
> -+     }
> - #endif
> - 
> - #if OS(DARWIN) || OS(WINDOWS)
> -     GraphicsSurfaceToken(BufferHandle frontBuffer = 0, BufferHandle backBuffer = 0)
> -         : frontBufferHandle(frontBuffer)
> -         , backBufferHandle(backBuffer)
> -     { }
> - 
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
> deleted file mode 100644
> index 276b3cf8..00000000
> --- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -diff --git a/Source/WebCore/WebCore.pri b/Source/WebCore/WebCore.pri
> -index 0189394..00f7090 100644
> ---- a/Source/WebCore/WebCore.pri
> -+++ b/Source/WebCore/WebCore.pri
> -@@ -227,8 +227,10 @@ use?(3D_GRAPHICS) {
> - use?(GRAPHICS_SURFACE) {
> -     mac: LIBS += -framework IOSurface -framework CoreFoundation
> -     linux-*: {
> --        LIBS += -lXcomposite -lXrender
> --        CONFIG *= x11
> -+        xlibAvailable() {
> -+            LIBS += -lXcomposite -lXrender
> -+            CONFIG *= x11
> -+        }
> -     }
> - }
> - 
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
> index 308f3f25..5bcef47f 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
> @@ -1,15 +1,11 @@
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -#	file://GraphicsSurfaceToken.h.patch
> -#	file://0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch
> -#	file://WebCore.pri.patch
> -
>  SRC_URI += " \
>  	file://GraphicsSurfaceGL_NoX.cpp.patch \
>  	file://0001-WebCore-PlatformQt.cmake-Fix-no-x11-build.patch \
>  "
>  
> -PR_append = ".arago8"
> +PR_append = ".arago9"
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

