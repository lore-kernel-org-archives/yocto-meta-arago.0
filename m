Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8364052004
	for <meta-arago@arago-project.org>;
	Fri, 26 Feb 2016 19:20:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1QJKHqH028316
	for <meta-arago@arago-project.org>; Fri, 26 Feb 2016 13:20:17 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1QJKH7W000409
	for <meta-arago@arago-project.org>; Fri, 26 Feb 2016 13:20:17 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 26 Feb 2016 13:20:17 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1QJKH8i031907;
	Fri, 26 Feb 2016 13:20:17 -0600
Date: Fri, 26 Feb 2016 14:20:01 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20160226192001.GX29852@edge>
References: <1456505620-48160-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1456505620-48160-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] Re-enable dual camera demo on AM4
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
X-List-Received-Date: Fri, 26 Feb 2016 19:20:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Eric,

The patch looks good and the description is informative, but the commit log is 
not following the guidelines I linked yesterday. Instead of this:

Subject: [PATCH] Re-enable dual camera demo on AM4

It should be:

Subject: [PATCH] dual-camera-demo: re-enable on AM4 to run outside of Weston

-- 
Denys


On Fri, Feb 26, 2016 at 11:53:40AM -0500, Eric Ruei wrote:
> The dual camera demo stopped working when Wayland/DRM-based graphics support
> was introduced on AM4 and therefore this demo was disabled. This demo does not
> work with Wayland/DRM-based graphics system because it invokes DRM APIs to
> demonstrate DRM mode setings and overlay operations and those operations
> are denied because there should be only one DRM master.
> 
> The simple solution is to update the demo script to run this QT5-based demo
> program over linuxfb platform and therefore there is not another DRM master
> running.
> 
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
> V2 Changes: Remove DOS <CR> from dual_camera_qt5.sh
> 
>  .../dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh         | 9 +++++----
>  .../recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb  | 2 +-
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh
> index 9bf560b..4802337 100644
> --- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh
> +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh
> @@ -1,12 +1,13 @@
>  #!/bin/bash
>  
> -/etc/init.d/matrix-gui-2.0 stop
> +/etc/init.d/weston stop
> +sleep 1
>  
>  echo 0 > /sys/class/graphics/fbcon/cursor_blink
>  
> -dual_camera
> +dual_camera -platform linuxfb
>  
>  echo 1 > /sys/class/graphics/fbcon/cursor_blink
>  
> -/etc/init.d/matrix-gui-2.0 start
> -
> +/etc/init.d/weston start
> +sleep 1
> diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> index 43bf00d..1b1a146 100644
> --- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
>  DEPENDS += "libdrm"
>  require recipes-core/matrix/matrix-gui-paths.inc
>  
> -PR = "r12"
> +PR = "r13"
>  
>  BRANCH = "drm"
>  SRCREV = "3be10676149c5f6e0ef1660d6b1ee4b9165dd993"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

