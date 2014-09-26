Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E41A652007
	for <meta-arago@arago-project.org>;
	Fri, 26 Sep 2014 19:42:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8QJgUue020941
	for <meta-arago@arago-project.org>; Fri, 26 Sep 2014 14:42:30 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8QJgTwS017836
	for <meta-arago@arago-project.org>; Fri, 26 Sep 2014 14:42:29 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 26 Sep 2014 14:42:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8QJgTA3016769;
	Fri, 26 Sep 2014 14:42:29 -0500
Date: Fri, 26 Sep 2014 15:42:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20140926194228.GF6303@edge>
References: <1409928767-11517-1-git-send-email-a0393906@ti.com>
	<1409928767-11517-5-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1409928767-11517-5-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [for master] [PATCH v2 4/4] weston: weston 1.3.0 for DRM backend
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
X-List-Received-Date: Fri, 26 Sep 2014 19:42:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Now, this is the messiest patch from the series. There are whitespaces, tabs 
and indentation all over the place, but that's not the biggest issue, as I 
would not reject a patch solely due to indentation issues - see below for 
details on other problems.

Moreover, there's lots of customizations and hacking going on in this recipe - 
I won't let it into "extras" part, as it should go into the corresponding 
bbappend in the "distro" section instead... Please see how it's currently done 
for 1.5.0 and 1.6.0 wayland/weston in meta-arago.


On Fri, Sep 05, 2014 at 08:22:47PM +0530, Karthik Ramanan wrote:
> On devices where the backend is chosen as DRM, as in the case
> of dra7xx, there are some addition patches that are specific
> to the omapdrm which are needed for basic functionality and
> some bug fixes.


> diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/profile b/meta-arago-extras/recipes-graphics/wayland/weston/profile
> new file mode 100644
> index 0000000..69564f2
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/wayland/weston/profile
> @@ -0,0 +1,9 @@
> +if test -z "${XDG_RUNTIME_DIR}"; then
> +    export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
> +    if ! test -d "${XDG_RUNTIME_DIR}"; then
> +        mkdir "${XDG_RUNTIME_DIR}"
> +        chmod 0700 "${XDG_RUNTIME_DIR}"
> +    fi
> +else 
> +   echo "Doing nothing"
> +fi

We have a similar code for weston-init, BTW. Can that be re-used?


> diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb b/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb
> index eb38ce1..c34b35e 100644
> --- a/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb
> +++ b/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb
> @@ -5,28 +5,45 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
>                      file://src/compositor.c;endline=23;md5=aa98a8db03480fe7d500d0b1f4b8850c"
>  
> -SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
> +SRC_URI = "git://anongit.freedesktop.org/wayland/weston;protocol=git \
>             file://weston.png \
> -           file://weston.desktop"
> -SRC_URI[md5sum] = "29ad994dd5ea07f52d7bffb24c25d9f7"
> -SRC_URI[sha256sum] = "8e4f5b4736358b63d83c3252567ba7aa49cc0da9e2e2c30f59ddf635159702a0"
> +           file://weston.desktop \
> +           file://terminal.png \
> +           file://pattern.png \
> +           file://profile \
> +           file://0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch \
> +           file://0002-Makefile-Include-option-to-search-in-include-drm.patch \
> +	   file://0003-input-source-prevent-input-disable-during-repaint.patch \
> +	   file://0005-temp-hack-to-enable-weston-1.3.patch \
> +	   file://0006-weston-drm-Enable-multiple-displays.patch "

Indents are off.


> +          
>  
> +SRCREV = "95659c03219b057d9d703b04cf89bc0329ce947a" 
> +
> +S = "${WORKDIR}/git"
> +
> +PR = "r1"
>  
>  inherit autotools pkgconfig useradd
>  
> -DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
> -DEPENDS += "wayland virtual/mesa virtual/egl pango"
> +DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg mtdev libpam"

mtdev and libpam dependencies are added automatically for corresponding 
PACKAGCONFIGs below...


> +DEPENDS += "wayland libgbm omap5-sgx-ddk-um-linux pango"

Why would you replace virtuals with the specific package names? That should 
not be required.


> -EXTRA_OECONF = "--enable-setuid-install \
> +COMPATIBLE_MACHINE = "dra7xx-evm"
> +
> +EXTRA_OECONF = "--disable-android-compositor \
> +                 --disable-simple-egl-clients \
> +                 --enable-fbdev-compositor \
> +                --enable-setuid-install \

Same with indents above.

>                  --disable-tablet-shell \
>                  --disable-xwayland \
>                  --enable-simple-clients \
>                  --enable-clients \
> -                --enable-demo-clients \
> -                --disable-simple-egl-clients \
>                  --disable-libunwind \
>                  --disable-rpi-compositor \
> -                --disable-rdp-compositor"
> +                --disable-rdp-compositor \
> +                --prefix=${STAGING_DIR_TARGET} \
> +                --with-libtool-sysroot=${STAGING_DIR_TARGET}"

Why the last 2 lines?


>  PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland', '', d)} \
> @@ -38,9 +55,9 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland',
>  # Compositor choices
>  #
>  # Weston on KMS
> -PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev mesa mtdev"
> +PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"

I see libgbm being unconditionally added above to DEPENDS, why the duplication?

I would understand removing mesa here though, as it was later fixed to require 
virtual/mesa instead...


>  # Weston on Wayland (nested Weston)
> -PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,mesa"
> +PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,libgbm"

No need to add libgbm the third time here.


>  # Weston on X11
>  PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
>  # Headless Weston
> @@ -49,8 +66,10 @@ PACKAGECONFIG[headless] = "--enable-headless-compositor,--disable-headless-compo
>  PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev"
>  # weston-launch
>  PACKAGECONFIG[launch] = "--enable-weston-launch,--disable-weston-launch,libpam"
> -# VA-API desktop recorder
> -PACKAGECONFIG[vaapi] = "--enable-vaapi-recorder,--disable-vaapi-recorder,libva"

Why remove unused flag?


> +# Use cairo-gl or cairo-glesv2
> +PACKAGECONFIG[gles] = "--with-cairo-glesv2,,virtual/libgles2"

Can't a similar line from 1.4.0+ be copied?


>  do_install_append() {
>  	# Weston doesn't need the .la files to load modules, so wipe them
> @@ -66,15 +85,64 @@ do_install_append() {
>  			install ${WORKDIR}/weston.png ${D}${datadir}/icons/hicolor/48x48/apps
>                  fi
>  	done
> +        install ${WORKDIR}/terminal.png ${D}${datadir}/icons/hicolor/48x48/apps
> +        install ${WORKDIR}/pattern.png ${D}${datadir}/icons/hicolor/48x48/apps
> +
> +        mkdir -p ${D}/usr/bin/weston-clients
> +        cp ${S}/clients/weston-calibrator ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-clickdot ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-cliptest ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-dnd ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-editor ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-eventdemo ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-flower ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-fullscreen ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-image ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-keyboard ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-multi-resource ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-resizor ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-simple-egl ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-simple-im ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-simple-shm ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-simple-touch ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-smoke ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-subsurfaces ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-desktop-shell ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-info ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-screenshooter ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-tablet-shell ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-terminal ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-transformed ${D}/usr/bin/weston-clients/

Unless these are very selective, why not copy them all in one line?


> +        mkdir -p ${D}/usr/libexec
> +        cp ${S}/clients/weston-desktop-shell ${D}/usr/libexec/
> +        cp ${S}/clients/weston-screenshooter ${D}/usr/libexec/
> +        cp ${S}/clients/weston-tablet-shell ${D}/usr/libexec/

Aren't those get installed by the default make install target?


> +	mkdir -p ${D}/home/root
> +        mkdir -p ${D}/home/root/.config
> +        cp ${S}/weston.ini ${D}/home/root/.config/
> +        cp ${WORKDIR}/profile ${D}/home/root/.profile

This part is a huge hack. Can those be installed in /etc as we do in 1.5.0 and 
1.6.0, instead of the user's home dir?


> +}
> +
> +do_configure() {
> +	aclocal -I ${STAGING_DIR_TARGET}/usr/share/aclocal
> +        ./autogen.sh --prefix=/usr --host=arm-linux --with-libtool-sysroot=${STAGING_DIR_TARGET} --enable-weston-launch

Why overwrite the default again? I'm pretty sure weston-launch is controlled 
by the corresponding PACKAGECONFIG above...


>  }
>  
>  PACKAGES += "${PN}-examples"
>  
> -FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${datadir}"
> +FILES_${PN} = "${bindir}/weston* ${bindir}/wcap-decode ${libexecdir} ${datadir} ${libdir}/weston/* /home/root/.profile /home/root/.config/* /usr/libexec/weston-desktop-shell /usr/libexec/weston-screenshooter /usr/libexec/weston-tablet-shell" 
>  FILES_${PN}-examples = "${bindir}/*"
>  
> +FILES_${PN}-dbg += "${bindir}/weston-clients/.debug"
> +
>  RDEPENDS_${PN} += "xkeyboard-config"
>  RRECOMMENDS_${PN} = "liberation-fonts"
>  
>  USERADD_PACKAGES = "${PN}"
>  GROUPADD_PARAM_${PN} = "--system weston-launch"
> +
> +INSANE_SKIP_weston += "dev-deps"
> +
> -- 
> 2.0.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

