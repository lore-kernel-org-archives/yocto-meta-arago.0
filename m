Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 133F852961
	for <meta-arago@arago-project.org>;
	Mon,  1 Feb 2016 21:32:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u11LWU3M029809
	for <meta-arago@arago-project.org>; Mon, 1 Feb 2016 15:32:30 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u11LWUoL000315
	for <meta-arago@arago-project.org>; Mon, 1 Feb 2016 15:32:30 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Feb 2016 15:32:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u11LWTFZ012371;
	Mon, 1 Feb 2016 15:32:29 -0600
Date: Mon, 1 Feb 2016 16:32:14 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160201213213.GS11314@edge>
References: <1454091629-31031-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1454091629-31031-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] weston: ti43x: Limit resolution to prevent HDMI display underrun
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
X-List-Received-Date: Mon, 01 Feb 2016 21:32:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jan 29, 2016 at 01:20:29PM -0500, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../recipes-graphics/wayland/weston/ti43x/weston.ini        | 13 +++++++++++++
>  .../recipes-graphics/wayland/weston_1.9.0.bbappend          |  4 +++-
>  2 files changed, 16 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/ti43x/weston.ini
> 
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/ti43x/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston/ti43x/weston.ini
> new file mode 100644
> index 0000000..b2b7927
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston/ti43x/weston.ini
> @@ -0,0 +1,13 @@
> +[shell]
> +locking=false
> +animation=zoom
> +panel-location=top
> +startup-animation=fade
> +
> +[screensaver]
> +# Uncomment path to disable screensaver
> +#path=@libexecdir@/weston-screensaver
> +
> +[output]
> +name=HDMI1
> +mode=1024x768
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
> index 4aff58d..1a85eca 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
> @@ -2,7 +2,7 @@
>  PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
>  PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
>  
> -PR_append = "-arago0"
> +PR_append = "-arago1"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> @@ -21,3 +21,5 @@ PACKAGES += "${PN}-conf"
>  
>  FILES_${PN}-conf += "${sysconfdir}/profile.d/* ${sysconfdir}/weston.ini"
>  RDEPENDS_${PN} += "${PN}-conf"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"

I'd hate to make the entire weston package machine-specific, especially only 
for the ini file. Can you please extract ini and env files into a separate 
weston-conf package? Thanks.

-- 
Denys

