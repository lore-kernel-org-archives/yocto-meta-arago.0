Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 5736D529D3
	for <meta-arago@arago-project.org>;
	Tue, 29 Oct 2019 21:14:43 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9TLDNFE092111
	for <meta-arago@arago-project.org>; Tue, 29 Oct 2019 16:13:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572383603;
	bh=zYaYgbQ9m3JR3z64mAD8aTBPIfbhu4FzWwLuObNgkQg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=RqiMy2lMjViY/fqHlJjEH2Hbuhw8xotJGmSHdZfxCyqKtc8g/Zvj1YBUySi47uDC5
	gWEg3/L78af2IqdfMAJxGAto8/nVN1BHZikTD8smafhVS/XYvzbjaJrZu/yCLLq1rN
	YmkXqCoAY/hQr96kCM7R45NNvbV/uqYAuEluaFJc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9TLDNIE095670
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 29 Oct 2019 16:13:23 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 29 Oct 2019 16:13:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 29 Oct 2019 16:13:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9TLDMkA033135;
	Tue, 29 Oct 2019 16:13:22 -0500
Date: Tue, 29 Oct 2019 17:13:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20191029211322.GJ7518@beryl>
References: <20191029135349.31792-1-e-ruei1@ti.com>
	<20191029135349.31792-4-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <20191029135349.31792-4-e-ruei1@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/7] HACK: weston: undefine HAVE_GBM_MODIFIERS explicitly
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
X-List-Received-Date: Tue, 29 Oct 2019 21:14:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 29, 2019 at 09:53:45AM -0400, Eric Ruei wrote:
> This hack is required tentatively until GBM_MODIFIERS is fully supported
> by Mesa-based EGL.
> 
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  ...mposito-drm-undef-HAVE_GBM_MODIFIERS.patch | 29 +++++++++++++++++++
>  .../wayland/weston_5.0.0.bbappend             |  3 +-
>  2 files changed, 31 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS.patch
> 
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS.patch
> new file mode 100644
> index 00000000..56a78e46
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS.patch
> @@ -0,0 +1,29 @@
> +From e406b4141c23fb762a14a09d565c363ebaccb5a4 Mon Sep 17 00:00:00 2001
> +From: Eric Ruei <e-ruei1@ti.com>
> +Date: Sun, 1 Sep 2019 08:28:27 -0400
> +Subject: [PATCH] HACK: composito-drm: undef HAVE_GBM_MODIFIERS
> +
> +HAVE_GBM_MODIFIERS is defined, but not fully supported by the gbm module
> +yet.

Upstream-Status: Inappropriate [reason]


> +Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> +---
> + libweston/compositor-drm.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/libweston/compositor-drm.c b/libweston/compositor-drm.c
> +index d92ecfcd..88f845a8 100644
> +--- a/libweston/compositor-drm.c
> ++++ b/libweston/compositor-drm.c
> +@@ -68,6 +68,8 @@
> + #include "linux-dmabuf-unstable-v1-server-protocol.h"
> + #include "linux-explicit-synchronization.h"
> + 
> ++#undef HAVE_GBM_MODIFIERS
> ++
> + #ifndef DRM_CLIENT_CAP_ASPECT_RATIO
> + #define DRM_CLIENT_CAP_ASPECT_RATIO	4
> + #endif
> +-- 
> +2.17.1
> +
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
> index 1bdcf7e4..94a5bc60 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
> @@ -2,7 +2,7 @@
>  PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
>  PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev virtual/libgbm mtdev"
>  
> -PR_append = ".arago34"
> +PR_append = ".arago35"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> @@ -26,6 +26,7 @@ SRC_URI += " \
>          file://0011-compositor-Add-scene-graph-debug-scope.patch \
>          file://0012-compositor-drm-Add-backend-pointer-to-drm_output.patch \
>          file://0013-compositor-drm-Add-drm-backend-log-debug-scope.patch \
> +	file://0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS.patch \
>  "
>  
>  INHIBIT_PACKAGE_STRIP = "1"
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

