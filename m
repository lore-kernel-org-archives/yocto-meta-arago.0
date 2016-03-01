Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B2FE552A26
	for <meta-arago@arago-project.org>;
	Tue,  1 Mar 2016 22:49:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u21Mnw70007711
	for <meta-arago@arago-project.org>; Tue, 1 Mar 2016 16:49:58 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u21Mnwpx016573
	for <meta-arago@arago-project.org>; Tue, 1 Mar 2016 16:49:58 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 1 Mar 2016 16:49:58 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u21MnwRd029338;
	Tue, 1 Mar 2016 16:49:58 -0600
Date: Tue, 1 Mar 2016 17:49:42 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20160301224942.GB5889@edge>
References: <1456872502-5739-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1456872502-5739-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] kmscube: Enhance and enable this demo for AM3
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
X-List-Received-Date: Tue, 01 Mar 2016 22:50:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Mar 01, 2016 at 05:48:22PM -0500, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  ...001-kmscube.c-init_drm-enable-AM3-support.patch | 28 ++++++++++++++++++++++
>  .../recipes-graphics/kmscube/kmscube_1.0.0.bb      |  9 +++----
>  2 files changed, 33 insertions(+), 4 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-init_drm-enable-AM3-support.patch
> 
> diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-init_drm-enable-AM3-support.patch b/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-init_drm-enable-AM3-support.patch
> new file mode 100644
> index 0000000..64b7b04
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-init_drm-enable-AM3-support.patch
> @@ -0,0 +1,28 @@
> +From 82a3cc3ddec96fba7204f5ecab0890801a0b54b4 Mon Sep 17 00:00:00 2001
> +From: Eric Ruei <e-ruei1@ti.com>
> +Date: Thu, 25 Feb 2016 09:49:24 -0500
> +Subject: [PATCH] kmscube.c: init_drm(): enable AM3 support
> +
> +Enable AM3 support by adding "tilcdc" to the modules list.
> +
> +Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> +---
> + kmscube.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/kmscube.c b/kmscube.c
> +index 5a18c32..919b3e7 100644
> +--- a/kmscube.c
> ++++ b/kmscube.c
> +@@ -84,7 +84,7 @@ struct drm_fb {
> + static int init_drm(void)
> + {
> + 	static const char *modules[] = {
> +-			"omapdrm", "i915", "radeon", "nouveau", "vmwgfx", "exynos"
> ++			"omapdrm", "tilcdc", "i915", "radeon", "nouveau", "vmwgfx", "exynos"
> + 	};
> + 	drmModeRes *resources;
> + 	drmModeConnector *connector = NULL;
> +-- 
> +1.9.1
> +
> diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
> index 484a46b..138a55b 100644
> --- a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
> +++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
> @@ -5,18 +5,19 @@ LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=e760965096e52da8
>  
>  DEPENDS = "libdrm libgbm omap5-sgx-ddk-um-linux"
>  
> -COMPATIBLE_MACHINE = "ti43x|omap-a15"
> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  inherit autotools pkgconfig
>  
> -PR = "r4"
> +PR = "r5"
>  SRCREV = "1c8a0d26c5b1918432fd94d2ac9894b3dcdb2814"
>  
>  SRC_URI = "git://git.ti.com/glsdk/kmscube.git;protocol=git"
>  
> -SRC_URI_append_ti43x = " \
> -    file://0001-kmscube.c-init_drm-select-the-current-CRTC-display-m.patch \
> +SRC_URI_append = " \
> +    file://0001-kmscube.c-init_drm-select-the-current-CRTC-display-m.patch \
> +    file://0001-kmscube.c-init_drm-enable-AM3-support.patch \

Just double-checking - these patches will now be applied to ALL platforms, not 
just am4 or am3...


>  "
>  
>  S = "${WORKDIR}/git"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

