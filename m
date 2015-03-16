Return-Path: <h-gou@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 93BCE52099
	for <meta-arago@arago-project.org>;
	Mon, 16 Mar 2015 22:46:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2GMk0E4017304
	for <meta-arago@arago-project.org>; Mon, 16 Mar 2015 17:46:00 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2GMjxG0012543
	for <meta-arago@arago-project.org>; Mon, 16 Mar 2015 17:45:59 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Mon, 16 Mar 2015 17:45:59 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "R, Karthik" <karthik.ramanan@ti.com>
Thread-Topic: [meta-arago] weston: Add support for multiple display and DRM
	backend
Thread-Index: AQHQVrjsD7inu7ozNEytyD1Tobj/Xp0WRiwAgAAcEYCAAApzgIAJWJNw
Date: Mon, 16 Mar 2015 22:45:58 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926A06301@DLEE08.ent.ti.com>
References: <1425457659-11042-1-git-send-email-a0393906@ti.com>
	<20150304202215.GL6052@edge> <20150310163311.GE21244@edge>
	<54FF3453.1010109@ti.com> <20150310185103.GA21422@edge>
In-Reply-To: <20150310185103.GA21422@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Mon, 16 Mar 2015 22:46:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Karthik,

We wonder if there is any update on this weston patch for supporting DRM ba=
ckend. We applied your meta-arago-extras patch locally in processor SDK and=
 observed two issues after the patching.

1) weston.ini is not updated as in GLSDK 7.0 EA release
GLSDK 7.0 EA release:
[core]
backend=3Ddrm-backend.so

[shell]
locking=3Dtrue
animation=3Dzoom

Processor SDK:
[shell]
locking=3Dfalse
animation=3Dzoom
panel-location=3Dnone
startup-animation=3Dfade

[screensaver]
# Uncomment path to disable screensaver
#path=3D@libexecdir@/weston-screensaver

2) The following files are missing from /usr/lib/weston
drm-backend.so*
gl-renderer.so*
wayland-backend.so*

Can you please let us know your plan on moving the patch to "meta-arago-dis=
tro in the form of bbappend" as Denys mentioned earlier? Please also let us=
 know if we are missing any other patches, which results in the two issues =
above.

Thanks,
Hongmei

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Dmytriyenko, Denys
Sent: Tuesday, March 10, 2015 2:51 PM
To: R, Karthik
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] weston: Add support for multiple display and DRM =
backend

Karthik,

What I meant is meta-arago-extras contains pristine weston recipe, that wen=
t upstream and got accepted for dizzy and later. Once we migrate off of dai=
sy to something newer, we won't need that recipe and it will be removed.

Our Arago/SDK customizations should go to meta-arago-distro in the form of =
bbappend. We already have one there - you are free to add to it or modify i=
t as you see fit. I don't expect there be many conflicts with what you are =
adding for DRA7x - we only add there basic env and ini files for weston. Ca=
n you please identify what exactly is breaking GLSDK in there? Thanks.

--=20
Denys


On Tue, Mar 10, 2015 at 11:43:39PM +0530, Karthik Ramanan wrote:
> On 10-Mar-15 10:03 PM, Denys Dmytriyenko wrote:
> >Ping
> >
> >
> >On Wed, Mar 04, 2015 at 03:22:15PM -0500, Denys Dmytriyenko wrote:
> >>This should go to meta-arago-distro/recipes-graphics/wayland/weston_1.6=
.0.bbappend
>=20
> Denys,
>=20
> Sorry, I thought I replied to this.
>=20
> I tried to analyze your input and what I find is that
> meta-arago-distro/.../weston_1.6.0.bbappend already has some
> additions that probably needs some rework. I will need to start a
> discussion on that topic and reach an alignment because it doesn't
> work well with GLSDK. But we have taken care of it by overridding
> this for now.
>=20
> In my opinion, this patch can be present in the current form and it
> will not affect the other SDKs that are using the bbappend in the
> meta-arago-distro and it will choose the fbdev backend. All dra7xx
> family SoCs will most likely use the DRM backend and it will be
> applicable for these cases.
>=20
> Regards
> Karthik
>=20
> >>
> >>
> >>On Wed, Mar 04, 2015 at 01:57:39PM +0530, Karthik Ramanan wrote:
> >>>On devices where the backend is chosen as DRM, as in the case of dra7x=
x,
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
> >>>  ...abling-DRM-backend-with-multiple-displays.patch |   60 ++++++++++=
++++++++++
> >>>  .../recipes-graphics/wayland/weston_1.6.0.bb       |   15 +++--
> >>>  2 files changed, 70 insertions(+), 5 deletions(-)
> >>>  create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston=
/0001-weston-Enabling-DRM-backend-with-multiple-displays.patch
> >>>
> >>>diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0001-we=
ston-Enabling-DRM-backend-with-multiple-displays.patch b/meta-arago-extras/=
recipes-graphics/wayland/weston/0001-weston-Enabling-DRM-backend-with-multi=
ple-displays.patch
> >>>new file mode 100644
> >>>index 0000000..2f215c9
> >>>--- /dev/null
> >>>+++ b/meta-arago-extras/recipes-graphics/wayland/weston/0001-weston-En=
abling-DRM-backend-with-multiple-displays.patch
> >>>@@ -0,0 +1,60 @@
> >>>+From b1829ce962aa4e13d737edb54130bdce05f068f0 Mon Sep 17 00:00:00 200=
1
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
> >>>+@@ -646,7 +646,7 @@ drm_output_repaint(struct weston_output *output_b=
ase,
> >>>+ 			.request.sequence =3D 1,
> >>>+ 		};
> >>>+
> >>>+-		if ((!s->current && !s->next) ||
> >>>++		if ((!s->current && !s->next) &&
> >>>+ 		    !drm_sprite_crtc_supported(output_base, s->possible_crtcs))
> >>>+ 			continue;
> >>>+
> >>>+@@ -757,6 +757,7 @@ page_flip_handler(int fd, unsigned int frame,
> >>>+ {
> >>>+ 	struct drm_output *output =3D (struct drm_output *) data;
> >>>+ 	uint32_t msecs;
> >>>++	uint32_t bail;
> >>>+
> >>>+ 	/* We don't set page_flip_pending on start_repaint_loop, in that ca=
se
> >>>+ 	 * we just want to page flip to the current buffer to get an accura=
te
> >>>+@@ -769,9 +770,14 @@ page_flip_handler(int fd, unsigned int frame,
> >>>+
> >>>+ 	output->page_flip_pending =3D 0;
> >>>+
> >>>++	if(output->vblank_pending) {
> >>>++		weston_log("VBlank is pending for connector =3D %d, frame =3D %d\n=
", output->connector_id, frame);
> >>>++		bail =3D 1;
> >>>++	}
> >>>++
> >>>+ 	if (output->destroy_pending)
> >>>+ 		drm_output_destroy(&output->base);
> >>>+-	else if (!output->vblank_pending) {
> >>>++	else if (!output->vblank_pending || bail ) {
> >>>+ 		msecs =3D sec * 1000 + usec / 1000;
> >>>+ 		weston_output_finish_frame(&output->base, msecs);
> >>>+
> >>>+--
> >>>+1.7.9.5
> >>>+
> >>>diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.6.0.b=
b b/meta-arago-extras/recipes-graphics/wayland/weston_1.6.0.bb
> >>>index efbbbe0..0d1962b 100644
> >>>--- a/meta-arago-extras/recipes-graphics/wayland/weston_1.6.0.bb
> >>>+++ b/meta-arago-extras/recipes-graphics/wayland/weston_1.6.0.bb
> >>>@@ -5,15 +5,20 @@ LICENSE =3D "MIT"
> >>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D275efac2559a224527bd4fd59=
3d38466 \
> >>>                      file://src/compositor.c;endline=3D23;md5=3Daa98a=
8db03480fe7d500d0b1f4b8850c"
> >>>
> >>>-SRC_URI =3D "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar=
.xz \
> >>>+SRC_URI =3D "git://anongit.freedesktop.org/wayland/weston;protocol=3D=
git \
> >>>             file://weston.png \
> >>>             file://weston.desktop \
> >>>             file://disable-wayland-scanner-pkg-check.patch \
> >>>             file://make-lcms-explicitly-configurable.patch \
> >>>             file://make-libwebp-explicitly-configurable.patch \
> >>>+           file://0001-weston-Enabling-DRM-backend-with-multiple-disp=
lays.patch \
> >>>  "
> >>>-SRC_URI[md5sum] =3D "c60ce9dde99a089db0539d8f6b557827"
> >>>-SRC_URI[sha256sum] =3D "dc3ea5d13bbf025fabc006216c5ddc0d80d5f4ebe7789=
12b8c4d1d4acaaa614d"
> >>>+
> >>>+S =3D "${WORKDIR}/git"
> >>>+
> >>>+SRCREV =3D "2858cc2a50854685b44eee72994dea57f5aa4246"
> >>>+
> >>>+PR =3D "r2"
> >>>
> >>>  inherit autotools pkgconfig useradd
> >>>
> >>>@@ -39,9 +44,9 @@ PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FE=
ATURES', 'wayland', 'kms fbdev
> >>>  # Compositor choices
> >>>  #
> >>>  # Weston on KMS
> >>>-PACKAGECONFIG[kms] =3D "--enable-drm-compositor,--disable-drm-composi=
tor,drm udev virtual/mesa mtdev"
> >>>+PACKAGECONFIG[kms] =3D "--enable-drm-compositor,--disable-drm-composi=
tor,drm udev libgbm mtdev"
> >>>  # Weston on Wayland (nested Weston)
> >>>-PACKAGECONFIG[wayland] =3D "--enable-wayland-compositor,--disable-way=
land-compositor,virtual/mesa"
> >>>+PACKAGECONFIG[wayland] =3D "--enable-wayland-compositor,--disable-way=
land-compositor,libgbm"
> >>>  # Weston on X11
> >>>  PACKAGECONFIG[x11] =3D "--enable-x11-compositor,--disable-x11-compos=
itor,virtual/libx11 libxcb libxcb libxcursor cairo"
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
>=20
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

