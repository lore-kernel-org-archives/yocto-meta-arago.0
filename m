Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACC6F532C6
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 00:51:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10108.1774313498182876306
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 17:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4978540CB2;
	Tue, 24 Mar 2026 00:51:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ukR8rD-hyV7h; Tue, 24 Mar 2026 00:51:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E718240B96;
	Tue, 24 Mar 2026 00:51:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E0CA117AA85; Mon, 23 Mar 2026 20:51:31 -0400 (EDT)
Date: Mon, 23 Mar 2026 20:51:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Randolph Sapp <rs@ti.com>
Cc: reatmon@ti.com, Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH 3/4] mesa-demos: Flip to a bbappend
Message-ID: <20260324005131.GT11121@denix.org>
References: <20260320221404.3991734-1-reatmon@ti.com>
 <20260320221404.3991734-3-reatmon@ti.com>
 <DH7YLAZ0Q5JO.3DMH78OR4C8Y2@ti.com>
 <20260322192633.GS11121@denix.org>
 <DHABYNK6UHI3.38G28NSA7DBOQ@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHABYNK6UHI3.38G28NSA7DBOQ@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 24 Mar 2026 00:51:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17423

On Mon, Mar 23, 2026 at 12:16:30PM -0500, Randolph Sapp wrote:
> On Sun Mar 22, 2026 at 2:26 PM CDT, Denys Dmytriyenko wrote:
> > On Fri, Mar 20, 2026 at 05:22:30PM -0500, Randolph Sapp via lists.yoctoproject.org wrote:
> >> On Fri Mar 20, 2026 at 5:14 PM CDT, Ryan Eatmon via lists.yoctoproject.org wrote:
> >> > Clean up a check layer error related to how this recipe was setup.
> >> >
> >> > Change the recipe to a bbappend instead of a new git version.  Apply all
> >> > of the changes that were made in the new recipe to the bbappend, and
> >> > remove the PREFERRED_VERSION in arago-prefs.inc.
> >> >
> >> > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >> > ---
> >> >  .../conf/distro/include/arago-prefs.inc       |  3 --
> >> >  .../mesa/mesa-demos-arago.inc                 | 17 ++++++++
> >> >  .../mesa/mesa-demos_9.0.0.bbappend            |  4 ++
> >> >  .../recipes-graphics/mesa/mesa-demos_git.bb   | 42 -------------------
> >> >  4 files changed, 21 insertions(+), 45 deletions(-)
> >> >  create mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
> >> >  create mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos_9.0.0.bbappend
> >> >  delete mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
> >> >
> >> > diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >> > index 4d1a6006..6a2faa53 100644
> >> > --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >> > +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >> > @@ -10,6 +10,3 @@ VIRTUAL-RUNTIME_dbus = "dbus-broker"
> >> >  # application that does not have a GPLv3 license
> >> >  PREFERRED_VERSION_crda = "3.18"
> >> >  PREFERRED_VERSION_obex = "0.34"
> >> > -
> >> > -# Bump mesa-demos to include some patches not in a tagged release
> >> > -PREFERRED_VERSION_mesa-demos = "9.0.0+git"
> >> > diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc b/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
> >> > new file mode 100644
> >> > index 00000000..5a5412c2
> >> > --- /dev/null
> >> > +++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
> >> > @@ -0,0 +1,17 @@
> >> > +SECTION = ""
> >> > +
> >> > +LIC_FILES_CHKSUM:remove = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=914225785450eff644a86c871d3ae00e"
> >> > +
> >> > +LIC_FILES_CHKSUM:append = " file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=a481fbdb2ac800ecb12405c33bcfacae"
> >> > +
> >> > +SRC_URI = "git://gitlab.freedesktop.org/mesa/demos.git;protocol=https;branch=main"
> >> > +SRCREV = "02eae079cb0b8186064d5b194ca4cc2995f099ee"
> >> > +
> >> > +PV = "9.0.0+git"
> >> > +
> >> > +REQUIRED_DISTRO_FEATURES:remove = "x11"
> >> > +
> >> > +PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
> >> > +
> >> > +PACKAGECONFIG[glut] = "-Dwith-glut=${STAGING_EXECPREFIXDIR},-Dglut=disabled,freeglut"
> >> > +PACKAGECONFIG[osmesa] = "-Dosmesa=enabled,-Dosmesa=disabled,"
> >> > diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_9.0.0.bbappend b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_9.0.0.bbappend
> >> > new file mode 100644
> >> > index 00000000..3b26e342
> >> > --- /dev/null
> >> > +++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_9.0.0.bbappend
> >> > @@ -0,0 +1,4 @@
> >> > +MESA_DEMOS_ARAGO = ""
> >> > +MESA_DEMOS_ARAGO:arago = "mesa-demos-arago.inc"
> >> > +
> >> > +require ${MESA_DEMOS_ARAGO}
> >> > diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
> >> > deleted file mode 100644
> >> > index 2da3ceff..00000000
> >> > --- a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
> >> > +++ /dev/null
> >> > @@ -1,42 +0,0 @@
> >> > -SUMMARY = "Mesa demo applications"
> >> > -DESCRIPTION = "This package includes the demonstration application, such as glxgears. \
> >> > -These applications can be used for Mesa validation and benchmarking."
> >> > -HOMEPAGE = "http://mesa3d.org"
> >> > -BUGTRACKER = "https://bugs.freedesktop.org"
> >> > -
> >> > -LICENSE = "MIT & PD"
> >> > -LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=a481fbdb2ac800ecb12405c33bcfacae \
> >> > -                    file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
> >> > -
> >> > -SRC_URI = "git://gitlab.freedesktop.org/mesa/demos.git;protocol=https;branch=main"
> >> > -SRCREV = "02eae079cb0b8186064d5b194ca4cc2995f099ee"
> >> > -
> >> > -DEFAULT_PREFERENCE = "-1"
> >> > -PV = "9.0.0+git"
> >> > -
> >> > -inherit meson pkgconfig features_check
> >> > -REQUIRED_DISTRO_FEATURES = "opengl"
> >> > -
> >> > -EXTRA_OEMESON = "-Dwith-system-data-files=true"
> >> > -
> >> > -PACKAGECONFIG ?= "drm egl gles1 gles2 \
> >> > -                  ${@bb.utils.filter('DISTRO_FEATURES', 'vulkan x11 wayland', d)}"
> >> > -
> >> > -PACKAGECONFIG[drm] = "-Dlibdrm=enabled,-Dlibdrm=disabled,libdrm"
> >> > -PACKAGECONFIG[egl] = "-Degl=enabled,-Degl=disabled,virtual/egl"
> >> > -PACKAGECONFIG[gles1] = "-Dgles1=enabled,-Dgles1=disabled,virtual/libgles1"
> >> > -PACKAGECONFIG[gles2] = "-Dgles2=enabled,-Dgles2=disabled,virtual/libgles2"
> >> > -PACKAGECONFIG[glut] = "-Dwith-glut=${STAGING_EXECPREFIXDIR},-Dglut=disabled,freeglut"
> >> > -PACKAGECONFIG[osmesa] = "-Dosmesa=enabled,-Dosmesa=disabled,"
> >> > -PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader glslang-native"
> >> > -PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/libgl wayland wayland-native wayland-protocols libxkbcommon libdecor"
> >> > -PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11 libglu libxkbcommon libxcb"
> >> > -
> >> > -do_install:append() {
> >> > -	# it can be completely empty when all PACKAGECONFIG options are disabled
> >> > -	rmdir --ignore-fail-on-non-empty ${D}${bindir}
> >> > -
> >> > -	if [ -f ${D}${bindir}/clear ]; then
> >> > -		mv ${D}${bindir}/clear ${D}${bindir}/clear.mesa-demos
> >> > -	fi
> >> > -}
> >> 
> >> I still hate that layer conformance thinks this is the correct way to do what is
> >> essentially adding a new *optional* package version. Feels really backwards and
> >> gross, but I'm already picking other fights right now.
> >
> > In order for a new version of a recipe to be *optional*, it should not be 
> > selected by bitbake by default.
> >
> > There are 2 ways to do this (besides making a bbappend):
> >
> > 1. Use the same name, but lower the default preference DEFAULT_PREFERENCE="-1" 
> > and still able to select it with PREFERRED_VERSION_mesa-demos="9.0.0+git"
> 
> Yeah, I did that. You can see it in the patch above, being removed. The
> conformance still thinks it's wrong.

Ah, indeed, missed that.

Still not sure why the yocto-check-layer fails for this case...


> > 2. Use a different name e.g. mesa-demos-arago and set PROVIDES="mesa-demos" - 
> > allows selecting it with PREFERRED_PROVIDER_mesa-demos="mesa-demos-arago"

