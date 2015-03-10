Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 279A9529F8
	for <meta-arago@arago-project.org>;
	Tue, 10 Mar 2015 18:51:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2AIp5EC031665
	for <meta-arago@arago-project.org>; Tue, 10 Mar 2015 13:51:05 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2AIp4KF003825
	for <meta-arago@arago-project.org>; Tue, 10 Mar 2015 13:51:04 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Mar 2015 13:51:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2AIp3uP023496;
	Tue, 10 Mar 2015 13:51:03 -0500
Date: Tue, 10 Mar 2015 14:51:03 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20150310185103.GA21422@edge>
References: <1425457659-11042-1-git-send-email-a0393906@ti.com>
	<20150304202215.GL6052@edge> <20150310163311.GE21244@edge>
	<54FF3453.1010109@ti.com>
MIME-Version: 1.0
In-Reply-To: <54FF3453.1010109@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: weston: Add support for multiple display and DRM backend
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
X-List-Received-Date: Tue, 10 Mar 2015 18:51:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Karthik,

What I meant is meta-arago-extras contains pristine weston recipe, that went 
upstream and got accepted for dizzy and later. Once we migrate off of daisy to 
something newer, we won't need that recipe and it will be removed.

Our Arago/SDK customizations should go to meta-arago-distro in the form of 
bbappend. We already have one there - you are free to add to it or modify it 
as you see fit. I don't expect there be many conflicts with what you are 
adding for DRA7x - we only add there basic env and ini files for weston. Can 
you please identify what exactly is breaking GLSDK in there? Thanks.

-- 
Denys


On Tue, Mar 10, 2015 at 11:43:39PM +0530, Karthik Ramanan wrote:
> On 10-Mar-15 10:03 PM, Denys Dmytriyenko wrote:
> >Ping
> >
> >
> >On Wed, Mar 04, 2015 at 03:22:15PM -0500, Denys Dmytriyenko wrote:
> >>This should go to meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
> 
> Denys,
> 
> Sorry, I thought I replied to this.
> 
> I tried to analyze your input and what I find is that
> meta-arago-distro/.../weston_1.6.0.bbappend already has some
> additions that probably needs some rework. I will need to start a
> discussion on that topic and reach an alignment because it doesn't
> work well with GLSDK. But we have taken care of it by overridding
> this for now.
> 
> In my opinion, this patch can be present in the current form and it
> will not affect the other SDKs that are using the bbappend in the
> meta-arago-distro and it will choose the fbdev backend. All dra7xx
> family SoCs will most likely use the DRM backend and it will be
> applicable for these cases.
> 
> Regards
> Karthik
> 
> >>
> >>
> >>On Wed, Mar 04, 2015 at 01:57:39PM +0530, Karthik Ramanan wrote:
> >>>On devices where the backend is chosen as DRM, as in the case of dra7xx,
> >>>we need some additional patches that are specific to the omapdrm
> >>>which are needed for basic functionality. This includes some bug fixes
> >>>too.
> >>>
> >>>This will fully enable
> >>>* multiple display support
> >>>* Handle screensavers more efficiently
> >>>* Be compatible with libgbm, TI adaptation of libgbm
> >>>
> >>>Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> >>>---
> >>>  ...abling-DRM-backend-with-multiple-displays.patch |   60 ++++++++++++++++++++
> >>>  .../recipes-graphics/wayland/weston_1.6.0.bb       |   15 +++--
> >>>  2 files changed, 70 insertions(+), 5 deletions(-)
> >>>  create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0001-weston-Enabling-DRM-backend-with-multiple-displays.patch
> >>>
> >>>diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0001-weston-Enabling-DRM-backend-with-multiple-displays.patch b/meta-arago-extras/recipes-graphics/wayland/weston/0001-weston-Enabling-DRM-backend-with-multiple-displays.patch
> >>>new file mode 100644
> >>>index 0000000..2f215c9
> >>>--- /dev/null
> >>>+++ b/meta-arago-extras/recipes-graphics/wayland/weston/0001-weston-Enabling-DRM-backend-with-multiple-displays.patch
> >>>@@ -0,0 +1,60 @@
> >>>+From b1829ce962aa4e13d737edb54130bdce05f068f0 Mon Sep 17 00:00:00 2001
> >>>+From: Karthik Ramanan <a0393906@ti.com>
> >>>+Date: Wed, 17 Dec 2014 09:21:49 +0530
> >>>+Subject: [PATCH] weston: Enabling DRM backend with multiple displays
> >>>+
> >>>+There are three main issues that this patch tries to address
> >>>+
> >>>+ 1. Black screen when running weston
> >>>+ 2. Support for multiple displays
> >>>+ 3. Handling missing VBlanks
> >>>+
> >>>+There is an issue with missing VBlanks for LCD and
> >>>+HDMI connectors which leads to display not getting refreshed.
> >>>+This patch can be considered as a workaround.
> >>>+
> >>>+Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> >>>+---
> >>>+ src/compositor-drm.c |   10 ++++++++--
> >>>+ 1 files changed, 8 insertions(+), 2 deletions(-)
> >>>+
> >>>+diff --git a/src/compositor-drm.c b/src/compositor-drm.c
> >>>+index e4496e7..3b22aa3 100644
> >>>+--- a/src/compositor-drm.c
> >>>++++ b/src/compositor-drm.c
> >>>+@@ -646,7 +646,7 @@ drm_output_repaint(struct weston_output *output_base,
> >>>+ 			.request.sequence = 1,
> >>>+ 		};
> >>>+
> >>>+-		if ((!s->current && !s->next) ||
> >>>++		if ((!s->current && !s->next) &&
> >>>+ 		    !drm_sprite_crtc_supported(output_base, s->possible_crtcs))
> >>>+ 			continue;
> >>>+
> >>>+@@ -757,6 +757,7 @@ page_flip_handler(int fd, unsigned int frame,
> >>>+ {
> >>>+ 	struct drm_output *output = (struct drm_output *) data;
> >>>+ 	uint32_t msecs;
> >>>++	uint32_t bail;
> >>>+
> >>>+ 	/* We don't set page_flip_pending on start_repaint_loop, in that case
> >>>+ 	 * we just want to page flip to the current buffer to get an accurate
> >>>+@@ -769,9 +770,14 @@ page_flip_handler(int fd, unsigned int frame,
> >>>+
> >>>+ 	output->page_flip_pending = 0;
> >>>+
> >>>++	if(output->vblank_pending) {
> >>>++		weston_log("VBlank is pending for connector = %d, frame = %d\n", output->connector_id, frame);
> >>>++		bail = 1;
> >>>++	}
> >>>++
> >>>+ 	if (output->destroy_pending)
> >>>+ 		drm_output_destroy(&output->base);
> >>>+-	else if (!output->vblank_pending) {
> >>>++	else if (!output->vblank_pending || bail ) {
> >>>+ 		msecs = sec * 1000 + usec / 1000;
> >>>+ 		weston_output_finish_frame(&output->base, msecs);
> >>>+
> >>>+--
> >>>+1.7.9.5
> >>>+
> >>>diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.6.0.bb b/meta-arago-extras/recipes-graphics/wayland/weston_1.6.0.bb
> >>>index efbbbe0..0d1962b 100644
> >>>--- a/meta-arago-extras/recipes-graphics/wayland/weston_1.6.0.bb
> >>>+++ b/meta-arago-extras/recipes-graphics/wayland/weston_1.6.0.bb
> >>>@@ -5,15 +5,20 @@ LICENSE = "MIT"
> >>>  LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
> >>>                      file://src/compositor.c;endline=23;md5=aa98a8db03480fe7d500d0b1f4b8850c"
> >>>
> >>>-SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
> >>>+SRC_URI = "git://anongit.freedesktop.org/wayland/weston;protocol=git \
> >>>             file://weston.png \
> >>>             file://weston.desktop \
> >>>             file://disable-wayland-scanner-pkg-check.patch \
> >>>             file://make-lcms-explicitly-configurable.patch \
> >>>             file://make-libwebp-explicitly-configurable.patch \
> >>>+           file://0001-weston-Enabling-DRM-backend-with-multiple-displays.patch \
> >>>  "
> >>>-SRC_URI[md5sum] = "c60ce9dde99a089db0539d8f6b557827"
> >>>-SRC_URI[sha256sum] = "dc3ea5d13bbf025fabc006216c5ddc0d80d5f4ebe778912b8c4d1d4acaaa614d"
> >>>+
> >>>+S = "${WORKDIR}/git"
> >>>+
> >>>+SRCREV = "2858cc2a50854685b44eee72994dea57f5aa4246"
> >>>+
> >>>+PR = "r2"
> >>>
> >>>  inherit autotools pkgconfig useradd
> >>>
> >>>@@ -39,9 +44,9 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev
> >>>  # Compositor choices
> >>>  #
> >>>  # Weston on KMS
> >>>-PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev virtual/mesa mtdev"
> >>>+PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
> >>>  # Weston on Wayland (nested Weston)
> >>>-PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,virtual/mesa"
> >>>+PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,libgbm"
> >>>  # Weston on X11
> >>>  PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
> >>>  # Headless Weston
> >>>--
> >>>1.7.9.5
> >>>
> >>>_______________________________________________
> >>>meta-arago mailing list
> >>>meta-arago@arago-project.org
> >>>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

