Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6B9D952A77
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 13:55:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CDtuMa018712
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 08:55:56 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CDttMS005915
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 08:55:55 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Mar 2015 08:55:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CDttfh007059;
	Thu, 12 Mar 2015 08:55:55 -0500
Date: Thu, 12 Mar 2015 09:55:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150312135554.GB24885@edge>
References: <1426164957-22030-1-git-send-email-j-stiffler@ti.com>
	<1426164957-22030-3-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1426164957-22030-3-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/4] qtbase: Use DISTRO_FEATURES to set appropriate qpa.
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
X-List-Received-Date: Thu, 12 Mar 2015 13:55:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Mar 12, 2015 at 08:55:55AM -0400, Jacob Stiffler wrote:
> * If wayland is in DISTRO_FEATURES, then configure '-qpa wayland'
> * Otherwise configure '-qpa eglfs'
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh  |    1 -
>  .../recipes-qt/qt5/qtbase_5.4.1.bbappend           |    9 ++++++---
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh
> index 1e8c196..f888d50 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh
> @@ -2,4 +2,3 @@
>  
>  ### QT Environment Variables ###
>  export QT_QPA_GENERIC_PLUGINS=Auto
> -export QT_QPA_PLATFORM=wayland
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
> index a466581..5a00800 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
> @@ -1,13 +1,16 @@
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
>  GLES_EXTRA_DEPS = ""
> -GLES_EXTRA_DEPS_omap-a15 = "libdrm wayland"
> +GLES_EXTRA_DEPS_omap-a15 = " \
> +    libdrm \
> +    ${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
> +"

I meant to comment to the previous revision about this part above ^^^
I don't think it will work (not that it will be tested) - the way OMAP5 GFX is 
built, it has hardcoded dependency on wayland libs, hence it's added above...
That said, I'm not sure you can get eglfs on OMAP5 platforms working cleanly 
w/o any wayland libs. But aren't you only doing it for AM3/4 anyway?


>  PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
>  
> -PR_append = "-arago3"
> +PR_append = "-arago4"
>  
> -QT_CONFIG_FLAGS += "-qpa wayland"
> +QT_CONFIG_FLAGS += "-qpa ${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
>  
>  SRC_URI += "file://qt_env.sh"
>  
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

