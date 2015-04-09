Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 49435529A9
	for <meta-arago@arago-project.org>;
	Thu,  9 Apr 2015 21:16:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t39LGGDu032486
	for <meta-arago@arago-project.org>; Thu, 9 Apr 2015 16:16:16 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t39LGFYt001864
	for <meta-arago@arago-project.org>; Thu, 9 Apr 2015 16:16:15 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 9 Apr 2015 16:16:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t39LGE3T016424;
	Thu, 9 Apr 2015 16:16:14 -0500
Date: Thu, 9 Apr 2015 17:16:14 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20150409211614.GB6414@edge>
References: <1428582873-438-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1428582873-438-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: weston: Add custom profile into targetfs
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
X-List-Received-Date: Thu, 09 Apr 2015 21:16:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Karthik,

Looks better. Now, can you just merge the existing wayland_env and the new 
profile you are adding? Both of them are installed in /etc/profile.d and get 
sourced on every login. Just add the mkdir and chmod part to the end of 
existing wayland_env.sh and that's it. Also, since you are changing wayldn_env 
file anyway, set XDG_RUNTIME_DIR to the same value of /tmp/${UID}-runtime-dir?

-- 
Denys


On Thu, Apr 09, 2015 at 06:04:33PM +0530, Karthik Ramanan wrote:
> There are different set of requirements on the bootup behavior
> across different platforms. To name a few:
>  * J6, the required behavior is console/command prompt
>  * AM57xx, it will be the matrix-gui (QT5 on Wayland)
> 
> weston-init recipe addresses the needs of AM57xx.
> This patch is needed for J6/J6-Eco etc.
> 
> Note that if there are customers on AM57xx who need the default behavior
> to be console/command prompt, this patch will address those needs.
> It does not conflict with weston-init.
> 
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../recipes-graphics/wayland/weston/profile        |    8 ++++++++
>  .../recipes-graphics/wayland/weston/wayland_env.sh |    2 +-
>  .../recipes-graphics/wayland/weston_1.6.0.bbappend |    4 +++-
>  3 files changed, 12 insertions(+), 2 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/profile
> 
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/profile b/meta-arago-distro/recipes-graphics/wayland/weston/profile
> new file mode 100644
> index 0000000..0848c18
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston/profile
> @@ -0,0 +1,8 @@
> +if test -z "${XDG_RUNTIME_DIR}"; then
> +       export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
> +fi
> +
> +if ! test -d "${XDG_RUNTIME_DIR}"; then
> +       mkdir -p "${XDG_RUNTIME_DIR}"
> +       chmod 0700 "${XDG_RUNTIME_DIR}"
> +fi
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/wayland_env.sh b/meta-arago-distro/recipes-graphics/wayland/weston/wayland_env.sh
> index a0e3b90..70a7d17 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston/wayland_env.sh
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston/wayland_env.sh
> @@ -3,6 +3,6 @@
>  ### Wayland Environment Variables ###
>  
>  export XDG_CONFIG_HOME=/etc/
> -export XDG_RUNTIME_DIR=/run/user/root
> +export XDG_RUNTIME_DIR=/tmp
>  export WAYLAND_DISPLAY=wayland-0
>  export WS_CALUDEV_FILE=/etc/udev/rules.d/ws-calibrate.rules
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
> index b0e8985..e3a9089 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
> @@ -2,13 +2,14 @@
>  PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
>  PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
>  
> -PR_append = "-arago3"
> +PR_append = "-arago4"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
>  SRC_URI += "file://wayland_env.sh \
>              file://weston.ini \
>              file://0001-weston-Enabling-DRM-backend-with-multiple-displays.patch \
> +            file://profile \
>  "
>  
>  # Add custom Arago Wayland Environment script file
> @@ -16,6 +17,7 @@ do_install_append () {
>      install -d ${D}${sysconfdir}/profile.d
>      install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}
>      install -m 0644 ${WORKDIR}/wayland_env.sh ${D}${sysconfdir}/profile.d/
> +    install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile.d/weston_profile
>  }
>  
>  PACKAGES += "${PN}-conf"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

