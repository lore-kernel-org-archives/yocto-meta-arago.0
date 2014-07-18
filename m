Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 56028529D5
	for <meta-arago@arago-project.org>;
	Fri, 18 Jul 2014 19:18:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6IJIrnd024625
	for <meta-arago@arago-project.org>; Fri, 18 Jul 2014 14:18:53 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6IJIrjw008481
	for <meta-arago@arago-project.org>; Fri, 18 Jul 2014 14:18:53 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 18 Jul 2014 14:18:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6IJIrXv016240	for
	<meta-arago@arago-project.org>; Fri, 18 Jul 2014 14:18:53 -0500
Date: Fri, 18 Jul 2014 15:18:52 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20140718191852.GP15788@edge>
References: <1405709522-404-1-git-send-email-denis@denix.org>
	<1405709522-404-6-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1405709522-404-6-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 06/11] HACK: matrix-gui: run on top of Wayland
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
X-List-Received-Date: Fri, 18 Jul 2014 19:18:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jul 18, 2014 at 02:51:57PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

This would require some cleanup - exporting additional env variables should be 
fine, but there were some problems with -qws option and chvt, so I had to drop 
them. Of course, if we want to preserve the old behavior, this would need to 
be done conditionally...


> ---
>  meta-arago-extras/recipes-core/matrix/matrix-gui/init   | 7 +++++--
>  meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb | 2 +-
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
> index dab7dc6..6286028 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui/init
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
> @@ -2,17 +2,20 @@
>  
>  matrixgui="/usr/bin/matrix_browser"
>  ROTATION=__MATRIX_ROT__
> -GUI_OPTS="-qws $ROTATION http://localhost:80/"
> +GUI_OPTS="http://localhost:80/"
>  PIDFILE="/var/run/matrix-gui-2.0.pid"
>  
>  test -x "$matrixgui" || exit 0
>  
>  export TSLIB_TSDEVICE=/dev/input/touchscreen0
>  export QWS_MOUSE_PROTO=Auto
> +export QT_QPA_PLATFORM=wayland
> +export XDG_RUNTIME_DIR=/run/user/root
> +export WAYLAND_DISPLAY=wayland-0
>  
>  case "$1" in
>    start)
> -    chvt 4
> +#    chvt 4
>  
>      # ARM9 devices get a lot of alignment trap errors with the current
>      # version of Qt (4.7.2) that we use.  The printing of these messages
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> index 523cfe1..16f2eeb 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
>  
>  SECTION = "multimedia"
>  
> -PR = "r16"
> +PR = "r17"
>  
>  INITSCRIPT_NAME = "matrix-gui-2.0"
>  INITSCRIPT_PARAMS = "defaults 97"
> -- 
> 2.0.0
> 

