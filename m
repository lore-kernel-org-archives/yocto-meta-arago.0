Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 61EE352987
	for <meta-arago@arago-project.org>;
	Sat,  9 Mar 2019 01:07:01 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2916rmL059402
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 19:06:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552093613;
	bh=JuugTRVUDVMZEDTENAhjIafMRy9g/8tTBjKnMsF7qJw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=czcvgeSKGHq04D5xTX6yjos4U0a9764ee40yx7iOCYATywqA2w+i1/JQLOlZZmJtB
	1FMBjOURiHy/KQHGb1UlQnpmM/EM9er9zmlvGMot/jRSaBAVySSEQHa8r1BVF5VO9x
	gEqZ9LUybNnc/skcn2Xsf9wFvMsIgpQSNLkPppdQ=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2916rO2042741
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 19:06:53 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 8 Mar 2019 19:06:52 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 8 Mar 2019 19:06:52 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2916qkK029754;
	Fri, 8 Mar 2019 19:06:52 -0600
Date: Fri, 8 Mar 2019 20:06:52 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Ruei, Eric" <a0850410@ti.com>
Message-ID: <20190309010652.GA28041@beryl>
References: <1552086127-40979-1-git-send-email-e-ruei1@ti.com>
	<20190308234719.GG26510@beryl>
	<8655627d-a942-acb1-ab12-a0695ffa1ad1@ti.com>
MIME-Version: 1.0
In-Reply-To: <8655627d-a942-acb1-ab12-a0695ffa1ad1@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud/master][PATCH 1/2] qtbase: enable gbm/kms and fix compiling error
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
X-List-Received-Date: Sat, 09 Mar 2019 01:07:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Mar 08, 2019 at 07:15:51PM -0500, Ruei, Eric wrote:
> On 3/8/2019 6:47 PM, Denys Dmytriyenko wrote:
> >On Fri, Mar 08, 2019 at 06:02:06PM -0500, Eric Ruei wrote:
> >>- enable gbm/kms for eglfs_kms
> >>- fix compiling error at platform/eglfs_kms
> >>- remove unused patch which has been upstreamed
> >>
> >>Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> >>---
> >>+
> >>diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
> >>index 4cb8f9c..1570e1f 100644
> >>--- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
> >>+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
> >>@@ -4,7 +4,14 @@ GLES_EXTRA_DEPS = "libdrm wayland"
> >>  PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
> >>-PR_append = ".arago13"
> >>+# the orginal gbm packageconfig requires virtual/libgbm
> >
> >Shouldn't be doing this. Our own libgbm should now provide virtual/libgbm -
> >sent a patch to meta-ti.
> >
> >
> Got it. I shall remove this.
> 
> 
> 
> >>+# Implement the patch here
> >>+
> >>+PACKAGECONFIG[gbm] = "-gbm,-no-gbm,drm virtual/egl"
> >>+PACKAGECONFIG += "gbm"
> >>+PACKAGECONFIG += "kms"
> >
> >Any PACKAGECONFIG settings should be done in the distro conf.
> >
> >
> I do not understand. This is addition to qtbase specific PACKAGECONFIG as
> defined at qtbase_git.bb:

A recipe defines different PACKAGECONFIG options and a sane default set of 
them to be enabled by default:

PACKAGECONFIG[a] = "..."
PACKAGECONFIG[b] = "..."
PACKAGECONFIG[c] = "..."
PACKAGECONFIG = "a c"

It is not recommended to change the default set in the recipe itself or in a 
bbappend. It is recommended to tweak it in a specific configuration - could be 
distro.conf, could be local.conf, etc.

We do this in arago.conf:
http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/conf/distro/arago.conf;hb=HEAD#l102

It also can be conditional based on DISTRO_FEATURES, or anything else...


> # separate some parts of PACKAGECONFIG which are often changed
> PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl',
> '', d)}"
> PACKAGECONFIG_FB ?= "${@bb.utils.contains('DISTRO_FEATURES', 'directfb',
> 'directfb', '', d)}"
> PACKAGECONFIG_X11 ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcb
> xinput2 glib xkb xkbcommon-evdev', '', d)}"
> PACKAGECONFIG_KDE ?= "${@bb.utils.contains('DISTRO_FEATURES', 'kde', 'sm
> cups fontconfig kms gbm libinput', '', d)}"
> PACKAGECONFIG_FONTS ?= ""
> PACKAGECONFIG_SYSTEM ?= "jpeg libpng zlib"
> PACKAGECONFIG_DISTRO ?= ""
> # Either release or debug, can be overridden in bbappends
> PACKAGECONFIG_RELEASE ?= "release"
> # This is in qt5.inc, because qtwebkit-examples are using it to enable
> ca-certificates dependency
> # PACKAGECONFIG_OPENSSL ?= "openssl"
> PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs freetype tests
> \
>     ${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Os', 'optimize-size
> ltcg', '', d)} \
>     ${@bb.utils.contains('DISTRO_FEATURES', 'qt5-static', 'static', '', d)}
> \
> "
> 
> PACKAGECONFIG ?= " \
>     ${PACKAGECONFIG_RELEASE} \
>     ${PACKAGECONFIG_DEFAULT} \
>     ${PACKAGECONFIG_OPENSSL} \
>     ${PACKAGECONFIG_GL} \
>     ${PACKAGECONFIG_FB} \
>     ${PACKAGECONFIG_X11} \
>     ${PACKAGECONFIG_KDE} \
>     ${PACKAGECONFIG_FONTS} \
>     ${PACKAGECONFIG_SYSTEM} \
>     ${PACKAGECONFIG_DISTRO} \
> "
> 
> Eric
> 
> >>+
> >>+PR_append = ".arago14"
> >>  QT_CONFIG_FLAGS += "-qpa ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
> >>@@ -14,12 +21,11 @@ QT_EGLFS_PATCHES = "\
> >>      file://quit.png \
> >>  "
> >>-#    file://0001-QOpenGLTexture-Set-wrap-mode-if-NPOT-textures-are-no.patch
> >>-
> >>  SRC_URI += "\
> >>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', "${QT_EGLFS_PATCHES}", d)}\
> >>      file://0001-deform-Fix-how-controls-are-shown.patch \
> >>      file://0002-deform-disable-opengl-button.patch \
> >>+    file://0001-qtbase-plugins-platforms-eglfs_kms-fix-compiler-erro.patch \
> >>  "
> >>  python do_patch_append() {
> >>-- 
> >>1.9.1
> >>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

