Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id DF2AD5298D
	for <meta-arago@arago-project.org>;
	Wed,  7 Dec 2016 19:51:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id uB7Jpudk026676
	for <meta-arago@arago-project.org>; Wed, 7 Dec 2016 13:51:56 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uB7JpuST017542
	for <meta-arago@arago-project.org>; Wed, 7 Dec 2016 13:51:56 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 7 Dec 2016 13:51:55 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id uB7JpuVc030171;
	Wed, 7 Dec 2016 13:51:56 -0600
Date: Wed, 7 Dec 2016 14:51:55 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20161207195155.GS28380@edge>
References: <1481122859-29354-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1481122859-29354-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH V2] ti-sgx-ddk-um: fix a bug at the drmModeAddFB() call at null_drm_ws.c
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
X-List-Received-Date: Wed, 07 Dec 2016 19:51:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Applied, thanks! It was sent to the wrong list, though...


On Wed, Dec 07, 2016 at 10:00:59AM -0500, Eric Ruei wrote:
> Both parameter depth and bpp are set to uiPixelWidthInBits at the current
> implementation, however, the depth may not be the same as bpp for certain
> pixel format such as XRGB8888. This bug was exposed by the recent DRM
> driver change introducing strict error checking. To fix this problem,
> add utility function uiPixelDepthInBits to derive and use depth based on
> the pixel format.
> 
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> index 770cda2..5903b2e 100644
> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> @@ -8,7 +8,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  BRANCH = "ti-img-sgx/${PV}"
>  
>  SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "a5152f0b90bf3916eb1f478ac9fefe7d7ebe8bd9"
> +SRCREV = "3c0537748dd283b2de9c5369570aa2aade5a9979"
>  
>  # There's only hardfp version available
>  python __anonymous() {
> @@ -31,7 +31,7 @@ INITSCRIPT_PARAMS = "defaults 8"
>  
>  inherit update-rc.d
>  
> -PR = "r17"
> +PR = "r18"
>  PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"
>  
>  DEPENDS += "libdrm udev libgbm wayland libffi"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

