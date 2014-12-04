Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B72FB529DD
	for <meta-arago@arago-project.org>;
	Thu,  4 Dec 2014 22:41:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id sB4MfvgJ025674
	for <meta-arago@arago-project.org>; Thu, 4 Dec 2014 16:41:57 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id sB4MfudB015010
	for <meta-arago@arago-project.org>; Thu, 4 Dec 2014 16:41:56 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Dec 2014 16:41:56 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id sB4MfueB018675;
	Thu, 4 Dec 2014 16:41:56 -0600
Date: Thu, 4 Dec 2014 17:41:56 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20141204224155.GF5113@edge>
References: <1417611953-20698-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1417611953-20698-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] gst-plugins: Use 'gitsm' fetcher for submodule support.
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
X-List-Received-Date: Thu, 04 Dec 2014 22:41:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Jake,

Thanks!
Can I assume this was thoroughly tested with and w/o mirror setup? :)


On Wed, Dec 03, 2014 at 08:05:53AM -0500, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb  |    3 +--
>  .../gstreamer/gst-plugins-base-mm-accel_0.10.36.bb |    3 +--
>  .../gstreamer/gst-plugins-good-mm-accel_0.10.31.bb |    3 +--
>  .../gstreamer/gstreamer-mm-accel_0.10.36.bb        |    3 +--
>  4 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb
> index 6eb7bc1..e00e919 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb
> @@ -26,14 +26,13 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  DEPENDS += "omap5-sgx-ddk-um-linux libdce libdrm wayland"
>  
>  SRCREV = "a9510bef52331fee9a23a5c955dbf76ac210056a"
> -SRC_URI = "git://git.ti.com/glsdk/gst-plugins-bad0-10.git;protocol=git"
> +SRC_URI = "gitsm://git.ti.com/glsdk/gst-plugins-bad0-10.git;protocol=git"
>  
>  S = "${WORKDIR}/git"
>  
>  EXTRA_OECONF += " --disable-pvr"
>  
>  do_configure_prepend() {
> -	git submodule init && git submodule update
>  	autopoint -f
>  }
>  
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb
> index 1de5e6c..33f82b0 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb
> @@ -23,13 +23,12 @@ RCONFLICTS_${PN}-meta += "gst-plugins-base-meta"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRC_URI = "git://git.ti.com/glsdk/gst-plugins-base0-10.git;protocol=git"
> +SRC_URI = "gitsm://git.ti.com/glsdk/gst-plugins-base0-10.git;protocol=git"
>  SRCREV = "3427e885daa749275e07339d3633b83c717aa419"
>  
>  S = "${WORKDIR}/git"
>  
>  do_configure_prepend() {
> -	git submodule init && git submodule update
>  	autopoint -f
>  }
>  
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb
> index 31456af..ad071ec 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb
> @@ -23,7 +23,7 @@ RCONFLICTS_${PN}-meta += "gst-plugins-good-meta"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRC_URI = "git://git.ti.com/glsdk/gst-plugins-good0-10.git;protocol=git"
> +SRC_URI = "gitsm://git.ti.com/glsdk/gst-plugins-good0-10.git;protocol=git"
>  SRCREV = "a44097d542f2bf219ac9dc3ef2372e58d769a8f9"
>  
>  # Fix compile errors with recent kernels
> @@ -33,7 +33,6 @@ SRC_URI_append = " file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffe
>  S = "${WORKDIR}/git"
>  
>  do_configure_prepend() {
> -	git submodule init && git submodule update
>  	autopoint -f
>  }
>  
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb
> index d3db41e..8cfbd05 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb
> @@ -21,13 +21,12 @@ RCONFLICTS_${PN}-dbg += "gstreamer-dbg"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRC_URI = "git://git.ti.com/glsdk/gstreamer0-10.git;protocol=git"
> +SRC_URI = "gitsm://git.ti.com/glsdk/gstreamer0-10.git;protocol=git"
>  SRCREV = "e505f4a2ceee3b0328eb2efddb9ec1281d3fd60a"
>  
>  S = "${WORKDIR}/git"
>  
>  do_configure_prepend() {
> -	git submodule init && git submodule update
>  	autopoint -f
>  }
>  
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

