Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4646C529B5
	for <meta-arago@arago-project.org>;
	Tue, 13 Oct 2015 17:19:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9DHJsEZ006437
	for <meta-arago@arago-project.org>; Tue, 13 Oct 2015 12:19:54 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9DHJs3x015450
	for <meta-arago@arago-project.org>; Tue, 13 Oct 2015 12:19:54 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 13 Oct 2015 12:19:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9DHJrmk011895;
	Tue, 13 Oct 2015 12:19:54 -0500
Date: Tue, 13 Oct 2015 13:19:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20151013171938.GH28164@edge>
References: <1444397451-19915-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1444397451-19915-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] weston: Update weston.ini to show top panel
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
X-List-Received-Date: Tue, 13 Oct 2015 17:19:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 09, 2015 at 09:30:51AM -0400, Jacob Stiffler wrote:
> * This provides a clock along with a shortcut to the weston-terminal

What was the reason to disable it in the first place?


> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-distro/recipes-graphics/wayland/weston/weston.ini     | 2 +-
>  meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston/weston.ini
> index 8caa891..615a604 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston/weston.ini
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston/weston.ini
> @@ -1,7 +1,7 @@
>  [shell]
>  locking=false
>  animation=zoom
> -panel-location=none
> +panel-location=top
>  startup-animation=fade
>  
>  [screensaver]
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
> index af504b4..fb7cda0 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
> @@ -2,7 +2,7 @@
>  PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
>  PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
>  
> -PR_append = "-arago6"
> +PR_append = "-arago7"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

