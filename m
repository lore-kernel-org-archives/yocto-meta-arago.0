Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A715852A32
	for <meta-arago@arago-project.org>;
	Fri, 31 Oct 2014 16:08:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9VG838r020696
	for <meta-arago@arago-project.org>; Fri, 31 Oct 2014 11:08:03 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9VG83jD009943
	for <meta-arago@arago-project.org>; Fri, 31 Oct 2014 11:08:03 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Fri, 31 Oct 2014 11:08:03 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [for master v3 4/4] weston: v1.3.0 for DRM based
	backend (additional patches)
Thread-Index: AQHP9SIt6TdvNcffaUev8WjC063IUJxKXTvw
Date: Fri, 31 Oct 2014 16:08:02 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C75CCD7@DFLE08.ent.ti.com>
References: <1414770194-24178-1-git-send-email-a0393906@ti.com>
	<1414770194-24178-5-git-send-email-a0393906@ti.com>
In-Reply-To: <1414770194-24178-5-git-send-email-a0393906@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [for master v3 4/4] weston: v1.3.0 for DRM based	backend (additional patches)
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
X-List-Received-Date: Fri, 31 Oct 2014 16:08:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of R, Karthik
> Sent: Friday, October 31, 2014 10:43 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [for master v3 4/4] weston: v1.3.0 for DRM based
> backend (additional patches)
>=20
> GLSDK specific additions to enable full functionality
>=20
> On devices where the backend is chosen as DRM, as in the case of dra7xx,
> there are some additional patches that are specific to the omapdrm which
> are needed for basic functionality and some bug fixes.
>=20
> This will fully enable
> * multiple display support
> * Handle screensavers more efficiently
> * Be compatible with libgbm, TI adaptation of libgbm
> * Install all the weston clients in the target filesystem.
>=20
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  ...tor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch |   26 +++++++++++
>  ...e-Include-option-to-search-in-include-drm.patch |   47
> ++++++++++++++++++++
>  ...urce-prevent-input-disable-during-repaint.patch |   34 ++++++++++++++
>  .../0005-temp-hack-to-enable-weston-1.3.patch      |   33 ++++++++++++++
>  .../0006-weston-drm-Enable-multiple-displays.patch |   43
> ++++++++++++++++++
>  .../recipes-graphics/wayland/weston_1.3.0.bb       |   32 ++++++++-----
>  6 files changed, 204 insertions(+), 11 deletions(-)  create mode 100644
> meta-arago-extras/recipes-graphics/wayland/weston/0001-compositor-
> drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch
>  create mode 100644 meta-arago-extras/recipes-
> graphics/wayland/weston/0002-Makefile-Include-option-to-search-in-
> include-drm.patch
>  create mode 100644 meta-arago-extras/recipes-
> graphics/wayland/weston/0003-input-source-prevent-input-disable-during-
> repaint.patch
>  create mode 100644 meta-arago-extras/recipes-
> graphics/wayland/weston/0005-temp-hack-to-enable-weston-1.3.patch
>  create mode 100644 meta-arago-extras/recipes-
> graphics/wayland/weston/0006-weston-drm-Enable-multiple-displays.patch
>=20
> diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0001-
> compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch b/meta-
> arago-extras/recipes-graphics/wayland/weston/0001-compositor-drm-
> Change-path-of-gbm.h-to-gbm-gbm.h.patch
> new file mode 100644
> index 0000000..cd0581a
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/wayland/weston/0001-
> compositor-
> +++ drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch
> @@ -0,0 +1,26 @@
> +From 5f655cb89813e39d6410493b4725e447212ea3a3 Mon Sep 17
> 00:00:00 2001
> +From: Mrinmayee Hingolikar <mrinmayee@ti.com>
> +Date: Tue, 24 Sep 2013 19:13:50 +0530
> +Subject: [PATCH] compositor-drm: Change path of gbm.h to gbm/gbm.h
> +
> +Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> +---
> + src/compositor-drm.c |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/compositor-drm.c b/src/compositor-drm.c index
> +f055118..7a59872 100644
> +--- a/src/compositor-drm.c
> ++++ b/src/compositor-drm.c
> +@@ -35,7 +35,7 @@
> + #include <xf86drmMode.h>
> + #include <drm_fourcc.h>
> +
> +-#include <gbm.h>
> ++#include <gbm/gbm.h>
> + #include <libbacklight.h>
> + #include <libudev.h>
> +
> +--
> +1.7.9.5
> +
> diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0002-
> Makefile-Include-option-to-search-in-include-drm.patch b/meta-arago-
> extras/recipes-graphics/wayland/weston/0002-Makefile-Include-option-to-
> search-in-include-drm.patch
> new file mode 100644
> index 0000000..557373d
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/wayland/weston/0002-Makefile-
> In
> +++ clude-option-to-search-in-include-drm.patch
> @@ -0,0 +1,47 @@
> +From c8b6fe71ad0231c4787836f4156e604cedfe45a8 Mon Sep 17 00:00:00
> 2001
> +From: Mrinmayee Hingolikar <mrinmayee@ti.com>
> +Date: Thu, 3 Jul 2014 15:06:31 +0530
> +Subject: [PATCH] Makefile change to search for correct drm headers
> +
> +Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> +---
> + src/Makefile.am   | 3 ++-
> + tests/Makefile.am | 1 +
> + 2 files changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/Makefile.am b/src/Makefile.am index 749c074..a6e44e7
> +100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -2,6 +2,7 @@ bin_PROGRAMS =3D weston				\
> + 	$(weston_launch)
> +
> + AM_CPPFLAGS =3D					\
> ++        $(DRM_COMPOSITOR_CFLAGS)                \
> + 	-I$(top_srcdir)/shared			\
> + 	-DDATADIR=3D'"$(datadir)"'		\
> + 	-DMODULEDIR=3D'"$(moduledir)"'		\
> +@@ -9,7 +10,7 @@ AM_CPPFLAGS =3D					\
> + 	-DIN_WESTON
> +
> + weston_LDFLAGS =3D -export-dynamic
> +-weston_CFLAGS =3D $(GCC_CFLAGS) $(COMPOSITOR_CFLAGS)
> $(LIBUNWIND_CFLAGS)
> ++weston_CFLAGS =3D $(GCC_CFLAGS) $(COMPOSITOR_CFLAGS)
> $(LIBUNWIND_CFLAGS)
> + weston_LDADD =3D $(COMPOSITOR_LIBS) $(LIBUNWIND_LIBS) \
> + 	$(DLOPEN_LIBS) -lm ../shared/libshared.la
> +
> +diff --git a/tests/Makefile.am b/tests/Makefile.am index
> +5be52c6..42ebd2b 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -47,6 +47,7 @@ AM_CPPFLAGS =3D					\
> + 	-I$(top_srcdir)/shared			\
> + 	-I$(top_builddir)/src			\
> + 	-DUNIT_TEST				\
> ++	$(DRM_COMPOSITOR_CFLAGS)                \
> + 	$(COMPOSITOR_CFLAGS)
> +
> + surface_global_test_la_SOURCES =3D surface-global-test.c
> +--
> +2.0.1
> +
> diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0003-
> input-source-prevent-input-disable-during-repaint.patch b/meta-arago-
> extras/recipes-graphics/wayland/weston/0003-input-source-prevent-input-
> disable-during-repaint.patch
> new file mode 100644
> index 0000000..74e82fb
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/wayland/weston/0003-input-
> sourc
> +++ e-prevent-input-disable-during-repaint.patch
> @@ -0,0 +1,34 @@
> +From cdd9043580e0f0a6c60c21b955f1966c78b2098b Mon Sep 17 00:00:00
> 2001
> +From: Karthik Ramanan <a0393906@ti.com>
> +Date: Mon, 2 Dec 2013 15:52:41 +0530
> +Subject: [PATCH] input source: prevent input disable during repaint
> +
> +Under certain race conditions, the input source was getting disabled
> +which was preventing the evdev events from keyboard or mouse to reach
> +Weston. The side effect of this issue was that after the screen gets
> +locked, it was not possible to come to Weston desktop without killing
> +Weston.
> +
> +Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> +---
> + src/compositor.c |    4 ----
> + 1 files changed, 0 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/compositor.c b/src/compositor.c index 0e0835f..ced3883
> +100644
> +--- a/src/compositor.c
> ++++ b/src/compositor.c
> +@@ -1084,10 +1084,6 @@ weston_output_schedule_repaint(struct
> weston_output *output)
> + 	wl_event_loop_add_idle(loop, idle_repaint, output);
> + 	output->repaint_scheduled =3D 1;
> +
> +-	if (compositor->input_loop_source) {
> +-		wl_event_source_remove(compositor->input_loop_source);
> +-		compositor->input_loop_source =3D NULL;
> +-	}
> + }
> +
> + WL_EXPORT void
> +--
> +1.7.0.4
> +
> diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0005-
> temp-hack-to-enable-weston-1.3.patch b/meta-arago-extras/recipes-
> graphics/wayland/weston/0005-temp-hack-to-enable-weston-1.3.patch
> new file mode 100644
> index 0000000..0c860b3
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/wayland/weston/0005-temp-
> hack-t
> +++ o-enable-weston-1.3.patch
> @@ -0,0 +1,33 @@
> +From 518fe5aea452a4660e07855716349a0c84e59b14 Mon Sep 17
> 00:00:00 2001
> +From: Karthik Ramanan <a0393906@ti.com>
> +Date: Tue, 21 Jan 2014 11:48:19 +0000
> +Subject: [PATCH] temp-hack: to enable weston 1.3
> +
> +This patch resolves the issue with the black display seen when running
> +weston 1.3 version on the dra7xx target.
> +
> +Known issues:
> +1. simple-egl application does not work 2. weston on multiple displays
> +does not work
> +
> +Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> +---
> + src/compositor-drm.c |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/compositor-drm.c b/src/compositor-drm.c index
> +0ac5efa..dd28f0f 100644
> +--- a/src/compositor-drm.c
> ++++ b/src/compositor-drm.c
> +@@ -616,7 +616,7 @@ drm_output_repaint(struct weston_output
> *output_base,
> + 			.request.sequence =3D 1,
> + 		};
> +
> +-		if ((!s->current && !s->next) ||
> ++		if ((!s->current && !s->next) &&
> + 		    !drm_sprite_crtc_supported(output_base, s-
> >possible_crtcs))
> + 			continue;
> +
> +--
> +1.7.9.5
> +
> diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0006-
> weston-drm-Enable-multiple-displays.patch b/meta-arago-extras/recipes-
> graphics/wayland/weston/0006-weston-drm-Enable-multiple-displays.patch
> new file mode 100644
> index 0000000..abc4295
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/wayland/weston/0006-weston-
> drm-
> +++ Enable-multiple-displays.patch
> @@ -0,0 +1,43 @@
> +From dce69cadd858bd959dd41edf82860cd370ca1fa8 Mon Sep 17 00:00:00
> 2001
> +From: Karthik Ramanan <a0393906@ti.com>
> +Date: Fri, 14 Mar 2014 18:55:12 +0530
> +Subject: [PATCH] weston-drm: Enable multiple displays
> +
> +We are currently seeing an issue with missing VBlanks for LCD and HDMI
> +connectors which leads to display not getting refreshed.
> +This patch can be considered as a workaround.
> +
> +Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> +---
> + src/compositor-drm.c |    8 +++++++-
> + 1 file changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/compositor-drm.c b/src/compositor-drm.c index
> +79dcc6c..ef2fbd2 100644
> +--- a/src/compositor-drm.c
> ++++ b/src/compositor-drm.c
> +@@ -709,6 +709,7 @@ page_flip_handler(int fd, unsigned int frame,  {
> + 	struct drm_output *output =3D (struct drm_output *) data;
> + 	uint32_t msecs;
> ++	uint32_t bail;
> +
> + 	/* We don't set page_flip_pending on start_repaint_loop, in that
> case
> + 	 * we just want to page flip to the current buffer to get an accurate
> +@@ -721,7 +722,12 @@ page_flip_handler(int fd, unsigned int frame,
> +
> + 	output->page_flip_pending =3D 0;
> +
> +-	if (!output->vblank_pending) {
> ++	if (output->vblank_pending) {
> ++		weston_log("VBlank is pending for connector =3D %d, frame =3D
> %d\n", output->connector_id, frame);
> ++		bail =3D 1;
> ++	}
> ++
> ++	if (!output->vblank_pending || bail) {
> + 		msecs =3D sec * 1000 + usec / 1000;
> + 		weston_output_finish_frame(&output->base, msecs);
> +
> +--
> +1.7.9.5
> +
> diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb
> b/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb
> index eb38ce1..cf81a33 100644
> --- a/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb
> +++ b/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb
> @@ -5,17 +5,28 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D275efac2559a224527bd4fd593d38466 \
>=20
> file://src/compositor.c;endline=3D23;md5=3Daa98a8db03480fe7d500d0b1f4b885
> 0c"
>=20
> -SRC_URI =3D "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz=
 \
> +SRC_URI =3D "git://anongit.freedesktop.org/wayland/weston;protocol=3Dgit=
 \
>             file://weston.png \
> -           file://weston.desktop"
> -SRC_URI[md5sum] =3D "29ad994dd5ea07f52d7bffb24c25d9f7"
> -SRC_URI[sha256sum] =3D
> "8e4f5b4736358b63d83c3252567ba7aa49cc0da9e2e2c30f59ddf635159702a
> 0"
> +           file://weston.desktop \
> +           file://0001-compositor-drm-Change-path-of-gbm.h-to-gbm-
> gbm.h.patch \
> +           file://0002-Makefile-Include-option-to-search-in-include-drm.=
patch \
> +           file://0003-input-source-prevent-input-disable-during-repaint=
.patch \
> +           file://0005-temp-hack-to-enable-weston-1.3.patch \
> +           file://0006-weston-drm-Enable-multiple-displays.patch "
>=20
>=20
> +S =3D "${WORKDIR}/git"
> +
> +SRCREV =3D "95659c03219b057d9d703b04cf89bc0329ce947a"
> +
> +PR =3D "r2"
> +
>  inherit autotools pkgconfig useradd
>=20
>  DEPENDS =3D "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
> -DEPENDS +=3D "wayland virtual/mesa virtual/egl pango"
> +DEPENDS +=3D "wayland libgbm virtual/egl pango"
> +
> +COMPATIBLE_MACHINE =3D "dra7xx-evm"
[Franklin] Can all of this work on am57x? If so can we add that machine to =
the compatible field or maybe set this to the generic SOC family?
>=20
>  EXTRA_OECONF =3D "--enable-setuid-install \
>                  --disable-tablet-shell \ @@ -23,7 +34,6 @@ EXTRA_OECONF =
=3D "--
> enable-setuid-install \
>                  --enable-simple-clients \
>                  --enable-clients \
>                  --enable-demo-clients \
> -                --disable-simple-egl-clients \
>                  --disable-libunwind \
>                  --disable-rpi-compositor \
>                  --disable-rdp-compositor"
> @@ -38,9 +48,9 @@ PACKAGECONFIG ??=3D
> "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland',  #
> Compositor choices  #  # Weston on KMS -PACKAGECONFIG[kms] =3D "--
> enable-drm-compositor,--disable-drm-compositor,drm udev mesa mtdev"
> +PACKAGECONFIG[kms] =3D "--enable-drm-compositor,--disable-drm-
> compositor,drm udev libgbm mtdev"
>  # Weston on Wayland (nested Weston)
> -PACKAGECONFIG[wayland] =3D "--enable-wayland-compositor,--disable-
> wayland-compositor,mesa"
> +PACKAGECONFIG[wayland] =3D "--enable-wayland-compositor,--disable-
> wayland-compositor,libgbm"
>  # Weston on X11
>  PACKAGECONFIG[x11] =3D "--enable-x11-compositor,--disable-x11-
> compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
>  # Headless Weston
> @@ -66,15 +76,15 @@ do_install_append() {
>  			install ${WORKDIR}/weston.png
> ${D}${datadir}/icons/hicolor/48x48/apps
>                  fi
>  	done
> +
>  }
>=20
> -PACKAGES +=3D "${PN}-examples"
>=20
> -FILES_${PN} =3D "${bindir}/weston ${bindir}/weston-terminal
> ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode
> ${libexecdir} ${datadir}"
> -FILES_${PN}-examples =3D "${bindir}/*"
> +FILES_${PN} =3D "${bindir}/* ${libexecdir} ${datadir}"
>=20
>  RDEPENDS_${PN} +=3D "xkeyboard-config"
>  RRECOMMENDS_${PN} =3D "liberation-fonts"
>=20
>  USERADD_PACKAGES =3D "${PN}"
>  GROUPADD_PARAM_${PN} =3D "--system weston-launch"
> +
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

