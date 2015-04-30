Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C4651529BA
	for <meta-arago@arago-project.org>;
	Thu, 30 Apr 2015 20:14:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3UKEn5v006780
	for <meta-arago@arago-project.org>; Thu, 30 Apr 2015 15:14:49 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3UKEmfB006111
	for <meta-arago@arago-project.org>; Thu, 30 Apr 2015 15:14:48 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 30 Apr 2015 15:14:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3UKElj2001514;
	Thu, 30 Apr 2015 15:14:48 -0500
Date: Thu, 30 Apr 2015 16:14:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150430201447.GV29290@edge>
References: <1430244996-11036-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1430244996-11036-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: Fix compilation on non DRM devices.
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
X-List-Received-Date: Thu, 30 Apr 2015 20:15:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Since this is a conditional build dependency specific to a machine, it makes 
the resulting package machine-specific. I can try this approach and see if 
there's an issue with Qt5 again, as it was with gst 0.10...


On Tue, Apr 28, 2015 at 02:16:36PM -0400, Jacob Stiffler wrote:
> * Conditionally build libgstdrm based on whether both libdrm and
>   libdce are available.
> * Add libdrm/libdce dependency on dra7xx platforms.
> * Only include wayland packageconfig if wayland is a distro feature.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../0006-GstDRMBufferPool-support-fix.patch        |   36 ++++++++++++++++++++
>  .../gstreamer1.0-plugins-bad_1.2.3.bbappend        |   13 +++++--
>  2 files changed, 46 insertions(+), 3 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-GstDRMBufferPool-support-fix.patch
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-GstDRMBufferPool-support-fix.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-GstDRMBufferPool-support-fix.patch
> new file mode 100644
> index 0000000..0af1323
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-GstDRMBufferPool-support-fix.patch
> @@ -0,0 +1,36 @@
> +From 9e4d46611c4d4600a5abac81b619ae1489d4b8c1 Mon Sep 17 00:00:00 2001
> +From: Jacob Stiffler <j-stiffler@ti.com>
> +Date: Mon, 27 Apr 2015 08:27:59 -0400
> +Subject: [PATCH 6/6] GstDRMBufferPool support fix:
> +
> +Conditionally build drm library based on if kmssink dependencies are
> +by pkgconfig found.
> +
> +Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> +---
> + gst-libs/gst/Makefile.am |    8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/gst-libs/gst/Makefile.am b/gst-libs/gst/Makefile.am
> +index b915d07..52ff331 100644
> +--- a/gst-libs/gst/Makefile.am
> ++++ b/gst-libs/gst/Makefile.am
> +@@ -2,9 +2,13 @@ if HAVE_EGL
> + EGL_DIR = egl
> + endif
> + 
> +-SUBDIRS = interfaces basecamerabinsrc codecparsers drm \
> ++if USE_KMS
> ++DRM_DIR = drm
> ++endif
> ++
> ++SUBDIRS = interfaces basecamerabinsrc codecparsers $(DRM_DIR) \
> + 	 insertbin uridownloader mpegts $(EGL_DIR)
> + 
> + noinst_HEADERS = gst-i18n-plugin.h gettext.h glib-compat-private.h
> +-DIST_SUBDIRS = interfaces egl basecamerabinsrc codecparsers \
> ++DIST_SUBDIRS = interfaces egl basecamerabinsrc codecparsers drm \
> + 	insertbin uridownloader mpegts
> +-- 
> +1.7.9.5
> +
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
> index b1cacac..d49da02 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
> @@ -1,12 +1,19 @@
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -PACKAGECONFIG = "faad wayland"
> +PACKAGECONFIG = "faad ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
> +
> +DEPENDS_append_dra7xx = " \
> +    libdce \
> +    libdrm \
> +"
>  
>  SRC_URI_append = " \
>          file://0001-Added-GstDRMBufferPool-support.patch \
>          file://0002-Modified-waylandsink-to-accept-NV12-format.patch \
>          file://0003-Added-KMSsink-support.patch \
>          file://0004-waylandsink-Removed-dependency-on-dri2.patch \
> -        file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch"
> +        file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch \
> +        file://0006-GstDRMBufferPool-support-fix.patch \
> +"
>  
> -PR_append = "-arago0"
> +PR_append = "-arago1"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

