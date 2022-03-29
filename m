Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1405C433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 05:37:15 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3292.1648532226315626656
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 28 Mar 2022 22:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4D39F40C1E;
	Tue, 29 Mar 2022 05:37:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id njvUbomLGLGH; Tue, 29 Mar 2022 05:37:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2859440952;
	Tue, 29 Mar 2022 05:37:04 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D922A1747C9;
	Tue, 29 Mar 2022 01:37:03 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] DONOTMERGE: weston: overlay version 9.0.0 locally
Date: Tue, 29 Mar 2022 05:37:03 +0000
Message-Id: <20220329053703.2367559-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Mar 2022 05:37:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13759

From: Denys Dmytriyenko <denys@konsulko.com>

OE-Core has upgraded weston to 10.0.0, that requires some new Mesa/GBM AP=
Is,
which currently breaks with SGX and RGX DDK versions provided by meta-ti.
Until DDKs are upgraded in meta-ti, overlay older weston 9.0.0 directly f=
rom
OE-Core before the upgrade, in order to get graphics stack built.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...d-drm-Re-order-gbm-destruction-at-DR.patch |  50 +++++
 ...001-meson.build-fix-incorrect-header.patch |  32 +++
 ...ntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch |  47 +++++
 ...ovide-a-default-version-that-doesn-t.patch | 199 ++++++++++++++++++
 .../weston/dont-use-plane-add-prop.patch      |  23 ++
 .../weston/systemd-notify.weston-start        |   9 +
 .../wayland/weston/weston.desktop             |   9 +
 .../wayland/weston/weston.png                 | Bin 0 -> 2383 bytes
 .../wayland/weston/xwayland.weston-start      |   5 +
 .../recipes-graphics/wayland/weston_9.0.0.bb  | 143 +++++++++++++
 10 files changed, 517 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/000=
1-libweston-backend-drm-Re-order-gbm-destruction-at-DR.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/000=
1-meson.build-fix-incorrect-header.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/000=
1-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/000=
1-weston-launch-Provide-a-default-version-that-doesn-t.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/don=
t-use-plane-add-prop.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/sys=
temd-notify.weston-start
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/wes=
ton.desktop
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/wes=
ton.png
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/xwa=
yland.weston-start
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston_9.0=
.0.bb

diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0001-libwe=
ston-backend-drm-Re-order-gbm-destruction-at-DR.patch b/meta-arago-extras=
/recipes-graphics/wayland/weston/0001-libweston-backend-drm-Re-order-gbm-=
destruction-at-DR.patch
new file mode 100644
index 00000000..f8f75894
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston/0001-libweston-ba=
ckend-drm-Re-order-gbm-destruction-at-DR.patch
@@ -0,0 +1,50 @@
+From c8bfa1f8d576cdc6d515dbbac36c48c6166be0d5 Mon Sep 17 00:00:00 2001
+From: Marius Vlad <marius.vlad@collabora.com>
+Date: Thu, 1 Apr 2021 00:12:00 +0300
+Subject: [PATCH] libweston/backend-drm: Re-order gbm destruction at DRM-=
backend tear down
+
+Tearing down the drm-backend when there are no input devices, would call
+for the gbm device destruction before compositor shutdown. The latter
+would call into the renderer detroy function and assume that the
+EGLDisplay, which was created using the before-mentioned gbm device, is
+still available. This patch re-orders the gbm destruction after the
+compositor shutdown when no one would make use of it.
+
+Fixes: #314
+
+Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
+Suggested-by: Daniel Stone <daniel.stone@collabora.com>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/wayland/weston=
/-/commit/d171c7b3ba346c4d0bd6494f45ebf0be3c3cc5fb]
+---
+ libweston/backend-drm/drm.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libweston/backend-drm/drm.c b/libweston/backend-drm/drm.c
+index 2780f3b..fbcfeca 100644
+--- a/libweston/backend-drm/drm.c
++++ b/libweston/backend-drm/drm.c
+@@ -3025,10 +3025,6 @@ err_drm_source:
+ err_udev_input:
+ 	udev_input_destroy(&b->input);
+ err_sprite:
+-#ifdef BUILD_DRM_GBM
+-	if (b->gbm)
+-		gbm_device_destroy(b->gbm);
+-#endif
+ 	destroy_sprites(b);
+ err_udev_dev:
+ 	udev_device_unref(drm_device);
+@@ -3038,6 +3034,10 @@ err_launcher:
+ 	weston_launcher_destroy(compositor->launcher);
+ err_compositor:
+ 	weston_compositor_shutdown(compositor);
++#ifdef BUILD_DRM_GBM
++	if (b->gbm)
++		gbm_device_destroy(b->gbm);
++#endif
+ 	free(b);
+ 	return NULL;
+ }
+--
+2.33.0
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0001-meson=
.build-fix-incorrect-header.patch b/meta-arago-extras/recipes-graphics/wa=
yland/weston/0001-meson.build-fix-incorrect-header.patch
new file mode 100644
index 00000000..06e0f7ba
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston/0001-meson.build-=
fix-incorrect-header.patch
@@ -0,0 +1,32 @@
+From a2ba4714a6872e547621d29d9ddcb0f374b88cf6 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 20 Apr 2021 20:42:18 -0700
+Subject: [PATCH] meson.build: fix incorrect header
+
+The wayland.c actually include 'xdg-shell-client-protocol.h' instead of
+the server one, so fix it. Otherwise, it's possible to get build failure
+due to race condition.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ libweston/backend-wayland/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libweston/backend-wayland/meson.build b/libweston/backend-w=
ayland/meson.build
+index 7e82513..29270b5 100644
+--- a/libweston/backend-wayland/meson.build
++++ b/libweston/backend-wayland/meson.build
+@@ -10,7 +10,7 @@ srcs_wlwl =3D [
+ 	fullscreen_shell_unstable_v1_protocol_c,
+ 	presentation_time_protocol_c,
+ 	presentation_time_server_protocol_h,
+-	xdg_shell_server_protocol_h,
++	xdg_shell_client_protocol_h,
+ 	xdg_shell_protocol_c,
+ ]
+=20
+--=20
+2.30.2
+
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0001-tests=
-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch b/meta-arago-extras=
/recipes-graphics/wayland/weston/0001-tests-include-fcntl.h-for-open-O_RD=
WR-O_CLOEXEC-and-.patch
new file mode 100644
index 00000000..6fe86ff3
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston/0001-tests-includ=
e-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch
@@ -0,0 +1,47 @@
+From 58760e09eed662a72da939ff4802d605489cff8e Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Tue, 8 Sep 2020 19:37:42 -0400
+Subject: [PATCH] tests: include fcntl.h for open(), O_RDWR, O_CLOEXEC an=
d
+ O_CREAT
+
+musl libc (unlike glibc) requires explicitly incuding fcntl.h to define =
open(),
+O_RDWR, O_CLOEXEC and O_CREAT. Otherwise the build fails with the errors=
:
+
+| ../weston-9.0.0/tests/weston-test-fixture-compositor.c: In function 'w=
ait_for_lock':
+| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:7: warning:=
 implicit declaration of function 'open'; did you mean 'popen'? [-Wimplic=
it-function-declaration]
+|   135 |  fd =3D open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
+|       |       ^~~~
+|       |       popen
+| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:23: error: =
'O_RDWR' undeclared (first use in this function)
+|   135 |  fd =3D open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
+|       |                       ^~~~~~
+| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:23: note: e=
ach undeclared identifier is reported only once for each function it appe=
ars in
+| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:32: error: =
'O_CLOEXEC' undeclared (first use in this function)
+|   135 |  fd =3D open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
+|       |                                ^~~~~~~~~
+| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:44: error: =
'O_CREAT' undeclared (first use in this function)
+|   135 |  fd =3D open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
+|       |                                            ^~~~~~~
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/westo=
n/-/merge_requests/493/diffs?commit_id=3Db10c0e843dcb8148bbe869bb15261955=
b94ac98c]
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ tests/weston-test-fixture-compositor.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/weston-test-fixture-compositor.c b/tests/weston-test-=
fixture-compositor.c
+index 0c9855f..e0e32c9 100644
+--- a/tests/weston-test-fixture-compositor.c
++++ b/tests/weston-test-fixture-compositor.c
+@@ -31,6 +31,7 @@
+ #include <unistd.h>
+ #include <sys/file.h>
+ #include <errno.h>
++#include <fcntl.h>
+=20
+ #include "shared/helpers.h"
+ #include "weston-test-fixture-compositor.h"
+--=20
+2.7.4
+
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0001-westo=
n-launch-Provide-a-default-version-that-doesn-t.patch b/meta-arago-extras=
/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-ver=
sion-that-doesn-t.patch
new file mode 100644
index 00000000..f6ebfd8f
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston/0001-weston-launc=
h-Provide-a-default-version-that-doesn-t.patch
@@ -0,0 +1,199 @@
+From a1548c742bf2dedbb47282d8a00407b60bbab669 Mon Sep 17 00:00:00 2001
+From: Tom Hochstein <tom.hochstein@nxp.com>
+Date: Wed, 22 Feb 2017 15:53:30 +0200
+Subject: [PATCH] weston-launch: Provide a default version that doesn't r=
equire
+
+ PAM
+
+weston-launch requires PAM for starting weston as a non-root user.
+
+Since starting weston as root is a valid use case by itself, if
+PAM is not available, provide a default version of weston-launch
+without non-root-user support.
+
+Upstream-Status: Denied [https://gitlab.freedesktop.org/wayland/weston/-=
/merge_requests/725]
+
+Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+Signed-off-by: Ming Liu <ming.liu@toradex.com>
+
+---
+ libweston/meson.build     | 16 ++++++++++++----
+ libweston/weston-launch.c | 21 +++++++++++++++++++++
+ meson_options.txt         |  7 +++++++
+ 3 files changed, 40 insertions(+), 4 deletions(-)
+
+diff --git a/libweston/meson.build b/libweston/meson.build
+index 08d23ec..cb9fd3f 100644
+--- a/libweston/meson.build
++++ b/libweston/meson.build
+@@ -216,16 +216,24 @@ dep_vertex_clipping =3D declare_dependency(
+ )
+=20
+ if get_option('weston-launch')
+-	dep_pam =3D cc.find_library('pam')
++	deps_weston_launch =3D [systemd_dep, dep_libdrm]
+=20
+-	if not cc.has_function('pam_open_session', dependencies: dep_pam)
+-		error('pam_open_session not found for weston-launch')
++	if get_option('pam')
++		dep_pam =3D cc.find_library('pam')
++		if not cc.has_function('pam_open_session', dependencies: dep_pam)
++			error('pam_open_session not found for weston-launch')
++		endif
++
++		if dep_pam.found()
++			deps_weston_launch +=3D dep_pam
++			config_h.set('HAVE_PAM', '1')
++		endif
+ 	endif
+=20
+ 	executable(
+ 		'weston-launch',
+ 		'weston-launch.c',
+-		dependencies: [dep_pam, systemd_dep, dep_libdrm],
++		dependencies: deps_weston_launch,
+ 		include_directories: common_inc,
+ 		install: true
+ 	)
+diff --git a/libweston/weston-launch.c b/libweston/weston-launch.c
+index 521cb2c..2d42d33 100644
+--- a/libweston/weston-launch.c
++++ b/libweston/weston-launch.c
+@@ -51,7 +51,9 @@
+=20
+ #include <pwd.h>
+ #include <grp.h>
++#ifdef HAVE_PAM
+ #include <security/pam_appl.h>
++#endif
+=20
+ #ifdef HAVE_SYSTEMD_LOGIN
+ #include <systemd/sd-login.h>
+@@ -100,8 +102,10 @@ drmSetMaster(int drm_fd)
+ #endif
+=20
+ struct weston_launch {
++#ifdef HAVE_PAM
+ 	struct pam_conv pc;
+ 	pam_handle_t *ph;
++#endif
+ 	int tty;
+ 	int ttynr;
+ 	int sock[2];
+@@ -192,6 +196,7 @@ weston_launch_allowed(struct weston_launch *wl)
+ 	return false;
+ }
+=20
++#ifdef HAVE_PAM
+ static int
+ pam_conversation_fn(int msg_count,
+ 		    const struct pam_message **messages,
+@@ -232,6 +237,7 @@ setup_pam(struct weston_launch *wl)
+=20
+ 	return 0;
+ }
++#endif
+=20
+ static int
+ setup_launcher_socket(struct weston_launch *wl)
+@@ -466,6 +472,7 @@ quit(struct weston_launch *wl, int status)
+ 	close(wl->signalfd);
+ 	close(wl->sock[0]);
+=20
++#ifdef HAVE_PAM
+ 	if (wl->new_user) {
+ 		err =3D pam_close_session(wl->ph, 0);
+ 		if (err)
+@@ -473,6 +480,7 @@ quit(struct weston_launch *wl, int status)
+ 				err, pam_strerror(wl->ph, err));
+ 		pam_end(wl->ph, err);
+ 	}
++#endif
+=20
+ 	/*
+ 	 * Get a fresh handle to the tty as the previous one is in
+@@ -710,6 +718,7 @@ setup_session(struct weston_launch *wl, char **child=
_argv)
+ 	setenv("HOME", wl->pw->pw_dir, 1);
+ 	setenv("SHELL", wl->pw->pw_shell, 1);
+=20
++#ifdef HAVE_PAM
+ 	env =3D pam_getenvlist(wl->ph);
+ 	if (env) {
+ 		for (i =3D 0; env[i]; ++i) {
+@@ -718,6 +727,7 @@ setup_session(struct weston_launch *wl, char **child=
_argv)
+ 		}
+ 		free(env);
+ 	}
++#endif
+=20
+ 	/*
+ 	 * We open a new session, so it makes sense
+@@ -789,8 +799,10 @@ static void
+ help(const char *name)
+ {
+ 	fprintf(stderr, "Usage: %s [args...] [-- [weston args..]]\n", name);
++#ifdef HAVE_PAM
+ 	fprintf(stderr, "  -u, --user      Start session as specified username=
,\n"
+ 			"                  e.g. -u joe, requires root.\n");
++#endif
+ 	fprintf(stderr, "  -t, --tty       Start session on alternative tty,\n=
"
+ 			"                  e.g. -t /dev/tty4, requires -u option.\n");
+ 	fprintf(stderr, "  -v, --verbose   Be verbose\n");
+@@ -804,7 +816,9 @@ main(int argc, char *argv[])
+ 	int i, c;
+ 	char *tty =3D NULL;
+ 	struct option opts[] =3D {
++#ifdef HAVE_PAM
+ 		{ "user",    required_argument, NULL, 'u' },
++#endif
+ 		{ "tty",     required_argument, NULL, 't' },
+ 		{ "verbose", no_argument,       NULL, 'v' },
+ 		{ "help",    no_argument,       NULL, 'h' },
+@@ -816,11 +830,16 @@ main(int argc, char *argv[])
+ 	while ((c =3D getopt_long(argc, argv, "u:t:vh", opts, &i)) !=3D -1) {
+ 		switch (c) {
+ 		case 'u':
++#ifdef HAVE_PAM
+ 			wl.new_user =3D optarg;
+ 			if (getuid() !=3D 0) {
+ 				fprintf(stderr, "weston: Permission denied. -u allowed for root onl=
y\n");
+ 				exit(EXIT_FAILURE);
+ 			}
++#else
++			fprintf(stderr, "weston: -u is unsupported in this weston-launch bui=
ld\n");
++			exit(EXIT_FAILURE);
++#endif
+ 			break;
+ 		case 't':
+ 			tty =3D optarg;
+@@ -872,8 +891,10 @@ main(int argc, char *argv[])
+ 	if (setup_tty(&wl, tty) < 0)
+ 		exit(EXIT_FAILURE);
+=20
++#ifdef HAVE_PAM
+ 	if (wl.new_user && setup_pam(&wl) < 0)
+ 		exit(EXIT_FAILURE);
++#endif
+=20
+ 	if (setup_launcher_socket(&wl) < 0)
+ 		exit(EXIT_FAILURE);
+diff --git a/meson_options.txt b/meson_options.txt
+index 239bd2d..99e4ec3 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -73,6 +73,13 @@ option(
+ )
+=20
+ option(
++	'pam',
++	type: 'boolean',
++	value: true,
++	description: 'Define if PAM is available'
++)
++
++option(
+ 	'xwayland',
+ 	type: 'boolean',
+ 	value: true,
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/dont-use-p=
lane-add-prop.patch b/meta-arago-extras/recipes-graphics/wayland/weston/d=
ont-use-plane-add-prop.patch
new file mode 100644
index 00000000..a4444e5d
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston/dont-use-plane-ad=
d-prop.patch
@@ -0,0 +1,23 @@
+Fix atomic modesetting with musl
+
+atomic modesetting seems to fail with drm weston backend and this patch =
fixes
+it, below errors are seen before weston exits
+
+atomic: couldn't commit new state: Invalid argument
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/westo=
n/-/issues/158]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/libweston/backend-drm/kms.c
++++ b/libweston/backend-drm/kms.c
+@@ -1168,8 +1168,8 @@ drm_pending_state_apply_atomic(struct dr
+ 		wl_list_for_each(plane, &b->plane_list, link) {
+ 			drm_debug(b, "\t\t[atomic] starting with plane %lu disabled\n",
+ 				  (unsigned long) plane->plane_id);
+-			plane_add_prop(req, plane, WDRM_PLANE_CRTC_ID, 0);
+-			plane_add_prop(req, plane, WDRM_PLANE_FB_ID, 0);
++			//plane_add_prop(req, plane, WDRM_PLANE_CRTC_ID, 0);
++			//plane_add_prop(req, plane, WDRM_PLANE_FB_ID, 0);
+ 		}
+=20
+ 		flags |=3D DRM_MODE_ATOMIC_ALLOW_MODESET;
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/systemd-no=
tify.weston-start b/meta-arago-extras/recipes-graphics/wayland/weston/sys=
temd-notify.weston-start
new file mode 100644
index 00000000..a97e7b38
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston/systemd-notify.we=
ston-start
@@ -0,0 +1,9 @@
+#!/bin/sh
+ =20
+# SPDX-FileCopyrightText: Huawei Inc.
+# SPDX-License-Identifier: Apache-2.0
+
+
+if [[ -x "/usr/lib/weston/systemd-notify.so" ]]; then
+        add_weston_module "systemd-notify.so"
+fi
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/weston.des=
ktop b/meta-arago-extras/recipes-graphics/wayland/weston/weston.desktop
new file mode 100644
index 00000000..1086ae8b
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston/weston.desktop
@@ -0,0 +1,9 @@
+[Desktop Entry]
+Encoding=3DUTF-8
+Type=3DApplication
+Name=3DWeston
+Comment=3DWayland Compostitor
+Exec=3Dweston
+Icon=3Dweston
+Terminal=3Dfalse
+Categories=3DUtility;
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/weston.png=
 b/meta-arago-extras/recipes-graphics/wayland/weston/weston.png
new file mode 100644
index 0000000000000000000000000000000000000000..ea8b7e0e233c86301a88e5bc9=
25f09b3de2f9dec
GIT binary patch
literal 2383
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
BD_j5o

literal 0
HcmV?d00001

diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/xwayland.w=
eston-start b/meta-arago-extras/recipes-graphics/wayland/weston/xwayland.=
weston-start
new file mode 100644
index 00000000..db384b1a
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston/xwayland.weston-s=
tart
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+if type Xwayland  >/dev/null 2>/dev/null; then
+	mkdir -p /tmp/.X11-unix
+fi
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_9.0.0.bb b=
/meta-arago-extras/recipes-graphics/wayland/weston_9.0.0.bb
new file mode 100644
index 00000000..59ab217a
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston_9.0.0.bb
@@ -0,0 +1,143 @@
+SUMMARY =3D "Weston, a Wayland compositor"
+DESCRIPTION =3D "Weston is the reference implementation of a Wayland com=
positor"
+HOMEPAGE =3D "http://wayland.freedesktop.org"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd79ee9e66bb0f95d3386a7acae780=
b70 \
+                    file://libweston/compositor.c;endline=3D27;md5=3D6c5=
3bbbd99273f4f7c4affa855c33c0a"
+
+SRC_URI =3D "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.x=
z \
+           file://weston.png \
+           file://weston.desktop \
+           file://xwayland.weston-start \
+           file://systemd-notify.weston-start \
+           file://0001-weston-launch-Provide-a-default-version-that-does=
n-t.patch \
+           file://0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-a=
nd-.patch \
+           file://0001-meson.build-fix-incorrect-header.patch \
+           file://0001-libweston-backend-drm-Re-order-gbm-destruction-at=
-DR.patch \
+"
+
+SRC_URI:append:libc-musl =3D " file://dont-use-plane-add-prop.patch "
+
+SRC_URI[sha256sum] =3D "5cf5d6ce192e0eb15c1fc861a436bf21b5bb3b91dbdabbde=
be83e1f83aa098fe"
+
+UPSTREAM_CHECK_URI =3D "https://wayland.freedesktop.org/releases.html"
+
+inherit meson pkgconfig useradd features_check
+# depends on virtual/egl
+# weston-init requires pam enabled if started via systemd
+REQUIRED_DISTRO_FEATURES =3D "opengl ${@oe.utils.conditional('VIRTUAL-RU=
NTIME_init_manager', 'systemd', 'pam', '', d)}"
+
+DEPENDS =3D "libxkbcommon gdk-pixbuf pixman cairo glib-2.0"
+DEPENDS +=3D "wayland wayland-protocols libinput virtual/egl pango wayla=
nd-native"
+
+LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'lto', '-Wl,-z,und=
efs', '', d)}"
+
+WESTON_MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
+
+EXTRA_OEMESON +=3D "-Dbackend-default=3Dauto -Dpipewire=3Dfalse"
+
+PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', =
'kms fbdev wayland egl clients', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland'=
, 'xwayland', '', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd x1=
1', d)} \
+                   ${@bb.utils.contains_any('DISTRO_FEATURES', 'wayland =
x11', '', 'headless', d)} \
+                   launch \
+                   image-jpeg \
+                   screenshare \
+                   shell-desktop \
+                   shell-fullscreen \
+                   shell-ivi"
+
+#
+# Compositor choices
+#
+# Weston on KMS
+PACKAGECONFIG[kms] =3D "-Dbackend-drm=3Dtrue,-Dbackend-drm=3Dfalse,drm u=
dev virtual/egl virtual/libgles2 virtual/libgbm mtdev"
+# Weston on Wayland (nested Weston)
+PACKAGECONFIG[wayland] =3D "-Dbackend-wayland=3Dtrue,-Dbackend-wayland=3D=
false,virtual/egl virtual/libgles2"
+# Weston on X11
+PACKAGECONFIG[x11] =3D "-Dbackend-x11=3Dtrue,-Dbackend-x11=3Dfalse,virtu=
al/libx11 libxcb libxcb libxcursor cairo"
+# Headless Weston
+PACKAGECONFIG[headless] =3D "-Dbackend-headless=3Dtrue,-Dbackend-headles=
s=3Dfalse"
+# Weston on framebuffer
+PACKAGECONFIG[fbdev] =3D "-Dbackend-fbdev=3Dtrue,-Dbackend-fbdev=3Dfalse=
,udev mtdev"
+# Weston on RDP
+PACKAGECONFIG[rdp] =3D "-Dbackend-rdp=3Dtrue,-Dbackend-rdp=3Dfalse,freer=
dp"
+# weston-launch
+PACKAGECONFIG[launch] =3D "-Dweston-launch=3Dtrue,-Dweston-launch=3Dfals=
e,drm"
+# VA-API desktop recorder
+PACKAGECONFIG[vaapi] =3D "-Dbackend-drm-screencast-vaapi=3Dtrue,-Dbacken=
d-drm-screencast-vaapi=3Dfalse,libva"
+# Weston with EGL support
+PACKAGECONFIG[egl] =3D "-Drenderer-gl=3Dtrue,-Drenderer-gl=3Dfalse,virtu=
al/egl"
+# Weston with lcms support
+PACKAGECONFIG[lcms] =3D "-Dcolor-management-lcms=3Dtrue,-Dcolor-manageme=
nt-lcms=3Dfalse,lcms"
+# Weston with webp support
+PACKAGECONFIG[webp] =3D "-Dimage-webp=3Dtrue,-Dimage-webp=3Dfalse,libweb=
p"
+# Weston with systemd-login support
+PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue -Dlauncher-logind=3Dtrue,-D=
systemd=3Dfalse -Dlauncher-logind=3Dfalse,systemd dbus"
+# Weston with Xwayland support (requires X11 and Wayland)
+PACKAGECONFIG[xwayland] =3D "-Dxwayland=3Dtrue,-Dxwayland=3Dfalse"
+# colord CMS support
+PACKAGECONFIG[colord] =3D "-Dcolor-management-colord=3Dtrue,-Dcolor-mana=
gement-colord=3Dfalse,colord"
+# Clients support
+PACKAGECONFIG[clients] =3D "-Dsimple-clients=3Dall -Ddemo-clients=3Dtrue=
,-Dsimple-clients=3D -Ddemo-clients=3Dfalse"
+# Virtual remote output with GStreamer on DRM backend
+PACKAGECONFIG[remoting] =3D "-Dremoting=3Dtrue,-Dremoting=3Dfalse,gstrea=
mer1.0 gstreamer1.0-plugins-base"
+# Weston with PAM support
+PACKAGECONFIG[pam] =3D "-Dpam=3Dtrue,-Dpam=3Dfalse,libpam"
+# Weston with screen-share support
+PACKAGECONFIG[screenshare] =3D "-Dscreenshare=3Dtrue,-Dscreenshare=3Dfal=
se"
+# Traditional desktop shell
+PACKAGECONFIG[shell-desktop] =3D "-Dshell-desktop=3Dtrue,-Dshell-desktop=
=3Dfalse"
+# Fullscreen shell
+PACKAGECONFIG[shell-fullscreen] =3D "-Dshell-fullscreen=3Dtrue,-Dshell-f=
ullscreen=3Dfalse"
+# In-Vehicle Infotainment (IVI) shell
+PACKAGECONFIG[shell-ivi] =3D "-Dshell-ivi=3Dtrue,-Dshell-ivi=3Dfalse"
+# JPEG image loading support
+PACKAGECONFIG[image-jpeg] =3D "-Dimage-jpeg=3Dtrue,-Dimage-jpeg=3Dfalse,=
 jpeg"
+
+do_install:append() {
+	# Weston doesn't need the .la files to load modules, so wipe them
+	rm -f ${D}/${libdir}/libweston-${WESTON_MAJOR_VERSION}/*.la
+
+	# If X11, ship a desktop file to launch it
+	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}" ]; then
+		install -d ${D}${datadir}/applications
+		install ${WORKDIR}/weston.desktop ${D}${datadir}/applications
+
+		install -d ${D}${datadir}/icons/hicolor/48x48/apps
+		install ${WORKDIR}/weston.png ${D}${datadir}/icons/hicolor/48x48/apps
+	fi
+
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'yes', 'no', d)=
}" =3D "yes" ]; then
+		install -Dm 644 ${WORKDIR}/xwayland.weston-start ${D}${datadir}/weston=
-start/xwayland
+	fi
+
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'yes', 'no', d)}=
" =3D "yes" ]; then
+		install -Dm 644 ${WORKDIR}/systemd-notify.weston-start ${D}${datadir}/=
weston-start/systemd-notify
+	fi
+
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'launch', 'yes', 'no', d)}"=
 =3D "yes" ]; then
+		chmod u+s ${D}${bindir}/weston-launch
+	fi
+}
+
+PACKAGES +=3D "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', '${PN}-=
xwayland', '', d)} \
+             libweston-${WESTON_MAJOR_VERSION} ${PN}-examples"
+
+FILES:${PN}-dev +=3D "${libdir}/${BPN}/libexec_weston.so"
+FILES:${PN} =3D "${bindir}/weston ${bindir}/weston-terminal ${bindir}/we=
ston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${l=
ibdir}/${BPN}/*.so* ${datadir}"
+
+FILES:libweston-${WESTON_MAJOR_VERSION} =3D "${libdir}/lib*${SOLIBS} ${l=
ibdir}/libweston-${WESTON_MAJOR_VERSION}/*.so"
+SUMMARY:libweston-${WESTON_MAJOR_VERSION} =3D "Helper library for implem=
enting 'wayland window managers'."
+
+FILES:${PN}-examples =3D "${bindir}/*"
+
+FILES:${PN}-xwayland =3D "${libdir}/libweston-${WESTON_MAJOR_VERSION}/xw=
ayland.so"
+RDEPENDS:${PN}-xwayland +=3D "xwayland"
+
+RDEPENDS:${PN} +=3D "xkeyboard-config"
+RRECOMMENDS:${PN} =3D "weston-init liberation-fonts"
+RRECOMMENDS:${PN}-dev +=3D "wayland-protocols"
+
+USERADD_PACKAGES =3D "${PN}"
+GROUPADD_PARAM:${PN} =3D "--system weston-launch"
--=20
2.25.1


