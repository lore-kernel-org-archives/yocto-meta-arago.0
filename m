Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 2260C52A95
	for <meta-arago@arago-project.org>;
	Thu,  4 Feb 2016 18:36:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u14IaFc4002150
	for <meta-arago@arago-project.org>; Thu, 4 Feb 2016 12:36:15 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u14IaFxr014395
	for <meta-arago@arago-project.org>; Thu, 4 Feb 2016 12:36:15 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 4 Feb 2016 12:36:15 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u14IaFgJ013587;
	Thu, 4 Feb 2016 12:36:15 -0600
Date: Thu, 4 Feb 2016 13:35:59 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Anand Balagopalakrishnan <anandb@ti.com>
Message-ID: <20160204183559.GO31480@edge>
References: <1454424195-11064-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
In-Reply-To: <1454424195-11064-1-git-send-email-anandb@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/1] weston: restrict udev enumeration to /dev/dri/card0
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
X-List-Received-Date: Thu, 04 Feb 2016 18:36:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Anand,

Is this patch meant to be upstreamed? Or is this rather a hack for our 
own setup? If latter, please add the patch to weston_1.9.0.bbappend in 
meta-arago-distro instead of the main recipe. Thanks.

-- 
Denys


On Tue, Feb 02, 2016 at 08:13:15PM +0530, Anand Balagopalakrishnan wrote:
> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> ---
>  ...v-seat-restrict-udev-enumeration-to-card0.patch |   36 ++++++++++++++++++++
>  .../recipes-graphics/wayland/weston_1.9.0.bb       |    1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0001-udev-seat-restrict-udev-enumeration-to-card0.patch
> 
> diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0001-udev-seat-restrict-udev-enumeration-to-card0.patch b/meta-arago-extras/recipes-graphics/wayland/weston/0001-udev-seat-restrict-udev-enumeration-to-card0.patch
> new file mode 100644
> index 0000000..9503428
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/wayland/weston/0001-udev-seat-restrict-udev-enumeration-to-card0.patch
> @@ -0,0 +1,36 @@
> +From e8e7a9f7dfa164a75fdbdca87622a2e13334478a Mon Sep 17 00:00:00 2001
> +From: Anand Balagopalakrishnan <anandb@ti.com>
> +Date: Sat, 23 Jan 2016 22:48:07 +0530
> +Subject: [PATCH 1/1] udev-seat: restrict udev enumeration to card0
> +
> +In case of separate GPU and Display devices as found in embedded systems, we
> +could have modeset node and render node controlled by different drivers.
> +There is a distinct possibility that udev enumeration returns the DRM device
> +corresponding to render node as the primary DRM device.
> +
> +Obviously, modeset operations cannot be done on the GPU DRM device.
> +
> +Restrict the udev enumeration to card0 and ensure that DRM device corresponding
> +to display is returned as the primary DRM device.
> +
> +Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> +---
> + src/compositor-drm.c |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/compositor-drm.c b/src/compositor-drm.c
> +index 6777bf8..59c2cc5 100644
> +--- a/src/compositor-drm.c
> ++++ b/src/compositor-drm.c
> +@@ -2827,7 +2827,7 @@ find_primary_gpu(struct drm_backend *b, const char *seat)
> + 
> + 	e = udev_enumerate_new(b->udev);
> + 	udev_enumerate_add_match_subsystem(e, "drm");
> +-	udev_enumerate_add_match_sysname(e, "card[0-9]*");
> ++	udev_enumerate_add_match_sysname(e, "card0");
> + 
> + 	udev_enumerate_scan_devices(e);
> + 	drm_device = NULL;
> +-- 
> +1.7.9.5
> +
> diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.9.0.bb b/meta-arago-extras/recipes-graphics/wayland/weston_1.9.0.bb
> index 439b279..a444590 100644
> --- a/meta-arago-extras/recipes-graphics/wayland/weston_1.9.0.bb
> +++ b/meta-arago-extras/recipes-graphics/wayland/weston_1.9.0.bb
> @@ -13,6 +13,7 @@ SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
>             file://0001-make-error-portable.patch \
>             file://libsystemd.patch \
>             file://explicit-enable-disable-systemd.patch \
> +	   file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
>  "
>  SRC_URI[md5sum] = "66bbba12f546570b4d97f676bc79a28e"
>  SRC_URI[sha256sum] = "9c1b03f3184fa0b0dfdf67e215048085156e1a2ca344af6613fed36794ac48cf"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

