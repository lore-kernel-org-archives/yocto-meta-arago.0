Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 0510052A46
	for <meta-arago@arago-project.org>;
	Thu, 16 Mar 2017 18:58:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2GIwD8b014983
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 13:58:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489690693;
	bh=n4t8hkGYkKcGQIB/7zZzvTeaI4udX5OLp3N8YNqGCZU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=MnDPgTcrKVVaKqgLyu+cNxjvRRR4Krr/vwGKUnbOtX+/YV6j98ijgnYGjmQTW4R7Y
	8hmIexRZ0reb4j9RNEJYl2F8OudfsCTe23xX9KzR35c3VAwSmIqXkwKAptWx5DeElC
	l1E8akmpK2UR2Pt9Axd2+qMmvJ2h0J0Taj4BtjzE=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2GIwCdc013483
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 13:58:12 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 13:58:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2GIwCE1032473;
	Thu, 16 Mar 2017 13:58:12 -0500
Date: Thu, 16 Mar 2017 14:58:12 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20170316185811.GN14484@edge>
References: <1489690621-54415-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1489690621-54415-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [krogoth][PATCH v2 1/3] gstreamer1.0-plugins-bad: kmssink: remove DCE dependencies
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
X-List-Received-Date: Thu, 16 Mar 2017 18:58:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks! Ack to all 3

On Thu, Mar 16, 2017 at 02:56:59PM -0400, Eric Ruei wrote:
> - remove DCE dependencies from kmssink
> - AM4(ti43x) shares the same branch as of AM5(omap-a15)
> - remove patch 0001-gstwaylandsink-Add-mouse-drag-and-drop-support.patch
>   which is no longer applicable to AM4 with the SRCREV update
> 
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../0001-kmssink-remove-DCE-dependencies.patch     | 96 ++++++++++++++++++++++
>  .../gstreamer1.0-plugins-bad_1.6.3.bbappend        |  8 +-
>  2 files changed, 102 insertions(+), 2 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-kmssink-remove-DCE-dependencies.patch
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-kmssink-remove-DCE-dependencies.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-kmssink-remove-DCE-dependencies.patch
> new file mode 100644
> index 0000000..e050e08
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-kmssink-remove-DCE-dependencies.patch
> @@ -0,0 +1,96 @@
> +From 6b04eb39296caec717d310872c1f0acfa85c5ae7 Mon Sep 17 00:00:00 2001
> +From: Eric Ruei <e-ruei1@ti.com>
> +Date: Wed, 15 Mar 2017 09:08:13 -0400
> +Subject: [PATCH 1/2] kmssink: remove DCE dependencies
> +
> +Replace DCE related API calls to libdrm and omapdrm API calls
> +to decouple DCE from kmssink
> +
> +Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> +---
> + configure.ac         |  1 -
> + sys/kms/Makefile.am  |  2 --
> + sys/kms/gstkmssink.c | 17 +++++++++++++----
> + 3 files changed, 13 insertions(+), 7 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 2e0d1f3..2b1ecaa 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -2119,7 +2119,6 @@ dnl *** kms ***
> + translit(dnm, m, l) AM_CONDITIONAL(USE_KMS, true)
> + AG_GST_CHECK_FEATURE(KMS, [kmssink], kms, [
> +   PKG_CHECK_MODULES([DRM], [libdrm libdrm_omap], HAVE_KMS=yes, HAVE_KMS=no)
> +-  PKG_CHECK_MODULES(LIBDCE, [libdce >= 1.0.0], HAVE_KMS=yes, HAVE_KMS=no)
> +   AC_SUBST(DRM_CFLAGS)
> +   AC_SUBST(DRM_LIBS)
> + ])
> +diff --git a/sys/kms/Makefile.am b/sys/kms/Makefile.am
> +index 6d56073..cc7353e 100644
> +--- a/sys/kms/Makefile.am
> ++++ b/sys/kms/Makefile.am
> +@@ -9,7 +9,6 @@ libgstkmssink_la_CFLAGS = \
> + 	$(GST_PLUGINS_BAD_CFLAGS) \
> + 	$(GST_PLUGINS_BASE_CFLAGS) \
> + 	$(GST_BASE_CFLAGS) \
> +-	$(LIBDCE_CFLAGS) \
> + 	$(GST_CFLAGS) \
> + 	$(DRM_CFLAGS)
> + 
> +@@ -17,7 +16,6 @@ libgstkmssink_la_LIBADD = \
> + 	$(GST_PLUGINS_BASE_LIBS) \
> + 	$(GST_BASE_LIBS) \
> + 	$(GST_LIBS) \
> +-	$(LIBDCE_LIBS) \
> + 	$(DRM_LIBS) \
> + 	-lgstvideo-$(GST_API_VERSION) \
> + 	$(top_builddir)/gst-libs/gst/drm/libgstdrm-$(GST_API_VERSION).la
> +diff --git a/sys/kms/gstkmssink.c b/sys/kms/gstkmssink.c
> +index 17e6407..9795bdf 100644
> +--- a/sys/kms/gstkmssink.c
> ++++ b/sys/kms/gstkmssink.c
> +@@ -31,7 +31,6 @@
> + #include "gstkmssink.h"
> + #include "gstkmsbufferpriv.h"
> + 
> +-#include <libdce.h>
> + #include <omap_drm.h>
> + #include <omap_drmif.h>
> + #include <xf86drmMode.h>
> +@@ -516,13 +515,18 @@ gst_kms_sink_start (GstBaseSink * bsink)
> + 
> +   sink = GST_KMS_SINK (bsink);
> + 
> +-  drm_dev = dce_init ();
> ++  drm_fd = open("/dev/dri/card0", O_RDWR | O_CLOEXEC);
> ++  if(drm_fd == NULL)
> ++    goto drm_failed;
> ++  else {
> ++    drm_dev = omap_device_new(drm_fd);
> ++  }
> ++
> +   if (drm_dev == NULL)
> +     goto device_failed;
> +   else {
> ++    sink->fd = drm_fd;
> +     sink->dev = drm_dev;
> +-    sink->fd = dce_get_fd ();
> +-    drm_fd = dce_get_fd ();
> +   }
> + 
> +   sink->resources = drmModeGetResources (sink->fd);
> +@@ -539,6 +543,11 @@ fail:
> +   gst_kms_sink_reset (sink);
> +   return FALSE;
> + 
> ++drm_failed:
> ++  GST_ELEMENT_ERROR (sink, RESOURCE, FAILED,
> ++      (NULL), ("drmOpen failed"));
> ++  goto fail;
> ++
> + device_failed:
> +   GST_ELEMENT_ERROR (sink, RESOURCE, FAILED,
> +       (NULL), ("omap_device_new failed"));
> +-- 
> +1.9.1
> +
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
> index b5ccebf..2c903d4 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
> @@ -8,7 +8,6 @@ PACKAGECONFIG_append_ti43x = " ${@bb.utils.contains('DISTRO_FEATURES','wayland',
>  PACKAGECONFIG_append_ti33x = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
>  
>  DEPENDS_append_omap-a15 = " \
> -    libdce \
>      libdrm \
>  "
>  
> @@ -18,10 +17,14 @@ DEPENDS_append_ti43x = " \
>  
>  DEPENDS_append_ti33x = " \
>      libdrm \
> +"
> +
> +SRC_URI_append_omap-a15 = " \
> +    file://0001-kmssink-remove-DCE-dependencies.patch \
>  "
>  
>  SRC_URI_append_ti43x = " \
> -    file://0001-gstwaylandsink-Add-mouse-drag-and-drop-support.patch \
> +    file://0001-kmssink-remove-DCE-dependencies.patch \
>  "
>  
>  SRC_URI_append_ti33x = " \
> @@ -38,6 +41,7 @@ SRC_URI = "git://git.ti.com/glsdk/gstreamer1-0-plugins-bad.git;protocol=git;bran
>  S = "${WORKDIR}/git"
>  
>  SRCREV_omap-a15 = "eb41f1c8fde05f87587c83d157835e3b2d19a298"
> +SRCREV_ti43x = "eb41f1c8fde05f87587c83d157835e3b2d19a298"
>  SRCREV = "d0160ca810be30bf2b2e7681f5047933402efb52"
>  
>  PR = "r25"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

