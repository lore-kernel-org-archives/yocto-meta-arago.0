Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D759C52A78
	for <meta-arago@arago-project.org>;
	Wed,  4 Mar 2015 19:50:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t24Jo1DU016052
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 13:50:01 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t24Jo09c011188
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 13:50:00 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 13:50:00 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t24JnxMZ025838;
	Wed, 4 Mar 2015 13:50:00 -0600
Date: Wed, 4 Mar 2015 14:49:59 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150304194959.GJ6052@edge>
References: <1425498278-22639-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1425498278-22639-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] dual-camera-demo: patch Makefile.build to work with Qt5
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
X-List-Received-Date: Wed, 04 Mar 2015 19:50:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Mar 04, 2015 at 02:44:38PM -0500, Jacob Stiffler wrote:
> Makefile.build is only used when building from within SDK through a
> top-level SDK Makefile.

Will it break qt4?


> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  ...uild-with-Qt5-use-qmake-available-in-PATH.patch |   31 ++++++++++++++++++++
>  .../dual-camera-demo/dual-camera-demo_1.0.bb       |    3 +-
>  2 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch
> 
> diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch
> new file mode 100644
> index 0000000..a544c87
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch
> @@ -0,0 +1,31 @@
> +From 42653f94bbaff15d04ec527add6eeb3082ab4873 Mon Sep 17 00:00:00 2001
> +From: Jacob Stiffler <j-stiffler@ti.com>
> +Date: Wed, 4 Mar 2015 12:00:45 -0500
> +Subject: [PATCH] Makefile.build: with Qt5 use qmake available in PATH
> +
> +Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> +---
> + Makefile.build |    4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile.build b/Makefile.build
> +index d715722..fdea3d8 100644
> +--- a/Makefile.build
> ++++ b/Makefile.build
> +@@ -9,11 +9,11 @@ all: release
> + .PHONY: qmake
> + qmake : dual_camera.pro
> + 	@. ${ENV_SETUP}; \
> +-	qmake2 CONFIG+=release dual_camera.pro
> ++	qmake CONFIG+=release dual_camera.pro
> + 
> + qmake_debug : dual_camera.pro
> + 	@. ${ENV_SETUP}; \
> +-	qmake2 CONFIG+=debug dual_camera.pro
> ++	qmake CONFIG+=debug dual_camera.pro
> + 
> + debug : qmake_debug
> + 	@. ${ENV_SETUP}; \
> +-- 
> +1.7.9.5
> +
> diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> index 7893d01..f1e6e79 100644
> --- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
>  DEPENDS += "libdrm"
>  require recipes-core/matrix/matrix-gui-paths.inc
>  
> -PR = "r6"
> +PR = "r7"
>  
>  BRANCH = "drm"
>  SRCREV = "0c48cb66cc995420dfec2f1fd620c8977f0170aa"
> @@ -17,6 +17,7 @@ SRC_URI = "git://gitorious.org/dual-camera-demo/dual-camera-demo.git;protocol=gi
>             file://dual_camera_qt5.sh \
>             file://dual_camera_qt4.sh \
>             file://dual-camera.desktop \
> +           file://0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch \
>  "
>  
>  S = "${WORKDIR}/git"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

