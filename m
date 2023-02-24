Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160C9C677F1
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 10:12:49 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.14477.1677233561254890039
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 02:12:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9774440C46
	for <meta-arago@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:12:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30KzFCyMXpUh for <meta-arago@lists.yoctoproject.org>;
	Fri, 24 Feb 2023 10:12:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7B76440C06
	for <meta-arago@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:12:40 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6CF2C163762
	for <meta-arago@lists.yoctoproject.org>; Fri, 24 Feb 2023 05:12:15 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH v2 1/2] all: convert graphics conditional switching from gpu to opengl
Date: Fri, 24 Feb 2023 10:12:39 +0000
Message-Id: <20230224101240.4132411-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:12:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14225

From: Randolph Sapp <rs@ti.com>

Everything that previously switched using the GPU machine feature should
instead switch based on the opengl distro feature to allow for software
rendering. There are couple tiny exceptions where a demo specifically
showcases hardware acceleration and offloading and doesn't make sense
with software rendering.

Signed-off-by: Randolph Sapp <rs@ti.com>
Acked-by: Andrew Davis <afd@ti.com>
Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
v2 changes:
* restore and move cairo PACKAGECONFIG settings to arago.conf
* update mainline and next branding to also clear gpudriver preferences
* keep qt-opencv-opencl-opengl-multithreaded demo checking for gpu
* simplify Matrix GPU demos packaging to have a generic default
* omapl138 is an underpowered ARM9 w/o graphics, so disable GPU demos for
  now, offscreen software rendering still gets built though
* Matrix touch demos check for touchscreen machine feature

 meta-arago-distro/conf/distro/arago.conf           |  3 +++
 .../conf/distro/include/branding-mainline.inc      |  2 ++
 .../conf/distro/include/branding-next.inc          |  2 ++
 .../recipes-core/images/tisdk-core-bundle.inc      |  4 ++--
 .../recipes-core/images/tisdk-default-image.bb     | 12 +++++-------
 .../recipes-core/images/tisdk-thinlinux-image.bb   |  4 +---
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  |  2 +-
 .../packagegroup-arago-tisdk-addons.bb             |  2 +-
 ...packagegroup-arago-tisdk-graphics-sdk-target.bb |  4 +---
 .../packagegroup-arago-tisdk-graphics.bb           |  4 +---
 .../packagegroup-arago-tisdk-gtk-sdk-target.bb     |  4 +---
 .../packagegroups/packagegroup-arago-tisdk-gtk.bb  |  4 +---
 .../packagegroups/packagegroup-arago-tisdk-hmi.bb  |  4 +---
 .../packagegroup-arago-tisdk-matrix.bb             | 12 +++++++-----
 .../packagegroup-arago-tisdk-multimedia.bb         |  4 ++--
 .../packagegroups/packagegroup-arago-tisdk-qte.bb  |  4 +---
 .../packagegroup-arago-toolchain-tisdk-target.bb   |  6 +++---
 .../recipes-core/packagegroups/ti-demos.bb         |  2 +-
 .../recipes-core/packagegroups/ti-world.bb         | 10 +++++-----
 .../recipes-graphics/cairo/cairo_%.bbappend        |  3 ---
 .../gstreamer/gstreamer1.0-plugins-%.bbappend      |  6 ------
 .../qt-opencv-opencl-opengl-multithreaded_git.bb   |  2 +-
 .../recipes-core/matrix/matrix-gui-3d-demos_2.0.bb | 14 +-------------
 .../matrix/matrix-gui-machinevision-demos_2.0.bb   |  2 +-
 .../matrix/matrix-gui-video-analytics-demos_2.0.bb |  2 +-
 .../recipes-core/matrix/matrix-gui_2.0.bb          |  2 +-
 26 files changed, 46 insertions(+), 74 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/cairo/cairo_%.bbap=
pend
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-%.bbappend

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
index 5e73c542..094e67da 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -114,6 +114,9 @@ PACKAGECONFIG:append:pn-openssl =3D " cryptodev-linux=
"
 # Enable GST_TRACER logging in gstreamer
 PACKAGECONFIG:append:pn-gstreamer1.0 =3D " tracer-hooks"
=20
+# Enable EGL/GLESv2 support
+PACKAGECONFIG:append:pn-cairo =3D " egl glesv2"
+
 # Disable pulseaudio routing in alsa by default
 PACKAGECONFIG:remove:pn-alsa-plugins =3D "pulseaudio"
 RDEPENDS:pulseaudio-server:remove =3D "alsa-plugins-pulseaudio-conf"
diff --git a/meta-arago-distro/conf/distro/include/branding-mainline.inc =
b/meta-arago-distro/conf/distro/include/branding-mainline.inc
index 2fc9dc5f..613e76f9 100644
--- a/meta-arago-distro/conf/distro/include/branding-mainline.inc
+++ b/meta-arago-distro/conf/distro/include/branding-mainline.inc
@@ -4,4 +4,6 @@ PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-mainline"
 SRCREV_ti-upstream-tools:pn-linux-ti-mainline =3D "${AUTOREV}"
=20
 # GPU support requires out-of-tree SGX and RGX drivers not available in =
mainline
+# fall back to software rendering
 MACHINE_FEATURES:remove =3D "gpu"
+PREFERRED_PROVIDER_virtual/gpudriver =3D ""
diff --git a/meta-arago-distro/conf/distro/include/branding-next.inc b/me=
ta-arago-distro/conf/distro/include/branding-next.inc
index a4fe66dc..20291041 100644
--- a/meta-arago-distro/conf/distro/include/branding-next.inc
+++ b/meta-arago-distro/conf/distro/include/branding-next.inc
@@ -5,4 +5,6 @@ SRCREV:pn-linux-ti-next =3D "${AUTOREV}"
 SRCREV:pn-u-boot-ti-mainline =3D "${AUTOREV}"
=20
 # GPU support requires out-of-tree SGX and RGX drivers not available in =
next
+# fall back to software rendering
 MACHINE_FEATURES:remove =3D "gpu"
+PREFERRED_PROVIDER_virtual/gpudriver =3D ""
diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc =
b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
index 9da4b0d0..c7bd9629 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
@@ -31,8 +31,8 @@ DTB_FILTER:j721s2 =3D "j721s2"
 # List of target side images to build for the SDK
 TARGET_IMAGES =3D "tisdk-base-image tisdk-default-image tisdk-thinlinux-=
image tisdk-bootstrap-image"
=20
-TISDK_TOOLCHAIN =3D "${@bb.utils.contains('MACHINE_FEATURES','gpu','meta=
-toolchain-arago-tisdk','meta-toolchain-arago-tisdk-server',d)}"
-TOOLCHAIN_SUFFIX =3D "${@bb.utils.contains('MACHINE_FEATURES','gpu','-ti=
sdk','-tisdk-server',d)}"
+TISDK_TOOLCHAIN =3D "${@bb.utils.contains('DISTRO_FEATURES','opengl','me=
ta-toolchain-arago-tisdk','meta-toolchain-arago-tisdk-server',d)}"
+TOOLCHAIN_SUFFIX =3D "${@bb.utils.contains('DISTRO_FEATURES','opengl','-=
tisdk','-tisdk-server',d)}"
=20
 IMAGE_INSTALL =3D "\
     packagegroup-arago-tisdk-amsdk-sdk-host \
diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb=
 b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 10bf33fa..8d36e561 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -5,16 +5,14 @@ DESCRIPTION =3D "Complete Arago TI SDK filesystem image=
 containing complete\
=20
 require arago-image.inc
=20
-SPLASH =3D "${@bb.utils.contains('MACHINE_FEATURES','gpu','psplash','',d=
)}"
-
 IMAGE_INSTALL +=3D "\
     packagegroup-arago-base \
     packagegroup-arago-console \
     packagegroup-arago-base-tisdk \
     ti-test \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-ti=
sdk-graphics','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-ti=
sdk-gtk','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-ti=
sdk-qte','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-=
tisdk-graphics','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-=
tisdk-gtk','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-=
tisdk-qte','',d)} \
     ${@['','packagegroup-arago-tisdk-opencl'][oe.utils.all_distro_featur=
es(d, 'opencl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'd=
sp', True, False, d)]} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
@@ -23,7 +21,7 @@ IMAGE_INSTALL +=3D "\
     packagegroup-arago-tisdk-multimedia \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-ti=
sdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-=
tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
     ti-analytics \
     ti-demos \
 "
@@ -50,7 +48,7 @@ EXTRABROWSERS =3D " \
 "
=20
 PYTHON2APPS =3D " \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${EXTRABROWSERS}",'',=
d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl',"${EXTRABROWSERS}",'=
',d)} \
     ${@bb.utils.contains("BBFILE_COLLECTIONS","browser-layer",bb.utils.c=
ontains('DISTRO_FEATURES','wayland',"${CHROMIUM}",'',d),'',d)} \
 "
=20
diff --git a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.=
bb b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
index 5161704d..a61e6881 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
@@ -5,8 +5,6 @@ DESCRIPTION =3D "Minimal bootable image with container to=
 start the next\
=20
 require arago-image.inc
=20
-SPLASH =3D "${@bb.utils.contains('MACHINE_FEATURES','gpu','psplash','',d=
)}"
-
 # Allow users to tack on additional packages as interesting.
 ARAGO_THIN_IMAGE_EXTRA_INSTALL ?=3D ""
=20
@@ -14,7 +12,7 @@ IMAGE_INSTALL +=3D "\
     packagegroup-arago-base \
     packagegroup-arago-console \
     packagegroup-arago-base-tisdk \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-ti=
sdk-graphics','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-=
tisdk-graphics','',d)} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
     docker \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegr=
oups/packagegroup-arago-tisdk-addons-sdk-target.bb
index b6fe62ab..0cd1b540 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-target.bb
@@ -32,7 +32,7 @@ EXTRA_LIBS:append:dra7xx =3D " libulm-dev \
 "
=20
 PDM_ANOMALY_PKG_DEV =3D "\
-    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'pdm-anomaly-detecti=
on-dev', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'pdm-anomaly-detec=
tion-dev', '', d)} \
 "
=20
=20
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-addons.bb
index 8f42c464..8d8a36f6 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
@@ -66,7 +66,7 @@ UTILS:append:omapl138 =3D " ti-ipc-rtos-fw"
=20
 UTILS:append:dra7xx =3D " \
                         ${UTILS_DSP} \
-                        ${@bb.utils.contains('MACHINE_FEATURES','gpu','g=
lsdk-example-apps','',d)} \
+                        ${@bb.utils.contains('DISTRO_FEATURES','opengl',=
'glsdk-example-apps','',d)} \
 "
=20
 EXTRA_PACKAGES =3D " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/package=
groups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index 093b2d3f..acb06558 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-graphics-sdk-target.bb
@@ -4,9 +4,7 @@ PR =3D "r10"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-inherit packagegroup features_check
-
-REQUIRED_MACHINE_FEATURES =3D "gpu"
+inherit packagegroup
=20
 RDEPENDS:${PN} =3D "\
     libegl-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/pack=
agegroup-arago-tisdk-graphics.bb
index 1d450600..381fa950 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-graphics.bb
@@ -4,9 +4,7 @@ PR =3D "r26"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-inherit packagegroup features_check
-
-REQUIRED_MACHINE_FEATURES =3D "gpu"
+inherit packagegroup
=20
 GFX_WAYLAND =3D "\
     weston-init \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-gtk-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroup=
s/packagegroup-arago-tisdk-gtk-sdk-target.bb
index 0bf3530d..030583e3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-gtk-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-gtk-sdk-target.bb
@@ -4,9 +4,7 @@ PR =3D "r2"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-inherit packagegroup features_check
-
-REQUIRED_MACHINE_FEATURES =3D "gpu"
+inherit packagegroup
=20
 RDEPENDS:${PN} =3D "\
     gtk+3-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-gtk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegr=
oup-arago-tisdk-gtk.bb
index 59b0461d..c2208380 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-gtk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-gtk.bb
@@ -4,9 +4,7 @@ PR =3D "r2"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-inherit packagegroup features_check
-
-REQUIRED_MACHINE_FEATURES =3D "gpu"
+inherit packagegroup
=20
 RDEPENDS:${PN} =3D "\
     gtk+3 \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-hmi.bb b/meta-arago-distro/recipes-core/packagegroups/packagegr=
oup-arago-tisdk-hmi.bb
index e16727c4..a8261bf2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-hmi.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-hmi.bb
@@ -4,9 +4,7 @@ PR =3D "r0"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-inherit packagegroup features_check
-
-REQUIRED_MACHINE_FEATURES =3D "gpu"
+inherit packagegroup
=20
 HMI =3D " \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-matrix.bb
index 3d9ebdf3..d4a4712c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-matrix.bb
@@ -65,7 +65,7 @@ MATRIX_QT_APPS:append:ti43x =3D " \
 "
=20
 MATRIX_TOUCH_APPS =3D " \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','matrix-gui-touch-demo=
s','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','touchscreen','matrix-gui-to=
uch-demos','',d)} \
 "
=20
 MATRIX_GPU_DEMOS =3D " \
@@ -76,6 +76,8 @@ MATRIX_GPU_DEMOS:append:omap-a15 =3D " \
     matrix-3d-demo-kmscubevideo \
 "
=20
+MATRIX_GPU_DEMOS:omapl138 =3D ""
+
 MATRIX_OPENCL_APPS =3D " \
     matrix-opencl-demo-floatcompute  \
     matrix-opencl-demo-vecadd        \
@@ -151,7 +153,7 @@ MATRIX_APPS:append:omap-a15 =3D "     \
     matrix-gui-pm-demos-governor    \
 "
=20
-#    ${@['','matrix-gui-browser-demos'][bb.utils.contains('MACHINE_FEATU=
RES','gpu',True,False,d) and bb.utils.contains('DISTRO_FEATURES','wayland=
',True,False,d)]} \
+#    ${@['','matrix-gui-browser-demos'][bb.utils.contains('DISTRO_FEATUR=
ES','opengl',True,False,d) and bb.utils.contains('DISTRO_FEATURES','wayla=
nd',True,False,d)]} \
 #                                \
 #
=20
@@ -184,9 +186,9 @@ RDEPENDS:${PN} =3D "        \
     ${MATRIX_APPS}        \
     ${MATRIX_COMMON_APPS} \
     ${@bb.utils.contains('MACHINE_FEATURES','touchscreen',"${MATRIX_TOUC=
H_APPS}",'',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${MATRIX_GUI}",'',d)}=
 \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${MATRIX_QT_APPS}",''=
,d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${MATRIX_GPU_DEMOS}",=
'',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl',"${MATRIX_GUI}",'',d=
)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl',"${MATRIX_QT_APPS}",=
'',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl',"${MATRIX_GPU_DEMOS}=
",'',d)} \
     ${@['',"${MATRIX_OPENCL_APPS}"][oe.utils.all_distro_features(d, 'ope=
ncl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True,=
 False, d)]} \
 "
=20
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/pa=
ckagegroup-arago-tisdk-multimedia.bb
index 9d6767b0..d06fbb6f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-multimedia.bb
@@ -12,8 +12,8 @@ MULTIMEDIA =3D " \
=20
 MULTIMEDIA:omapl138 =3D ""
=20
-DUAL_CAMERA_DEMO =3D "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'd=
ual-camera-demo', '', d)}"
-IMAGE_GALLERY_DEMO =3D "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', =
'image-gallery', '', d)}"
+DUAL_CAMERA_DEMO =3D "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', =
'dual-camera-demo', '', d)}"
+IMAGE_GALLERY_DEMO =3D "${@bb.utils.contains('DISTRO_FEATURES', 'opengl'=
, 'image-gallery', '', d)}"
=20
 MULTIMEDIA:append:ti43x =3D " \
     ${DUAL_CAMERA_DEMO} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegr=
oup-arago-tisdk-qte.bb
index 60d6e63c..a133e7e7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-qte.bb
@@ -4,9 +4,7 @@ PR =3D "r22"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-inherit packagegroup features_check
-
-REQUIRED_MACHINE_FEATURES =3D "gpu"
+inherit packagegroup
=20
 #    qtdeclarative-examples
 RDEPENDS:${PN} =3D "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegro=
ups/packagegroup-arago-toolchain-tisdk-target.bb
index c64e1727..cdf54ecc 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-too=
lchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-too=
lchain-tisdk-target.bb
@@ -18,11 +18,11 @@ TISDK_TOOLCHAIN_EXTRA_TARGET =3D "\
 TISDK_TOOLCHAIN_EXTRA_TARGET:omapl138 =3D ""
=20
 RDEPENDS:${PN} =3D "\
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-qt=
e-toolchain-target','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-ti=
sdk-gtk-sdk-target','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-=
qte-toolchain-target','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-=
tisdk-gtk-sdk-target','',d)} \
     ${TISDK_TOOLCHAIN_BASE_TARGET} \
     ${TISDK_TOOLCHAIN_EXTRA_TARGET} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-ti=
sdk-graphics-sdk-target','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-=
tisdk-graphics-sdk-target','',d)} \
     ${@['','packagegroup-arago-tisdk-opencl-sdk-target'][oe.utils.all_di=
stro_features(d, 'opencl', True, False) and bb.utils.contains('MACHINE_FE=
ATURES', 'dsp', True, False, d)]} \
     packagegroup-arago-tisdk-addons-sdk-target \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb b/m=
eta-arago-distro/recipes-core/packagegroups/ti-demos.bb
index 3fbf4199..7bccb4de 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
@@ -5,7 +5,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit packagegroup
=20
-PDM_ANOMALY_PKG =3D "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'pd=
m-anomaly-detection', '', d)}"
+PDM_ANOMALY_PKG =3D "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '=
pdm-anomaly-detection', '', d)}"
=20
 PDM_ANOMALY =3D ""
 PDM_ANOMALY:ti33x =3D "${PDM_ANOMALY_PKG}"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/m=
eta-arago-distro/recipes-core/packagegroups/ti-world.bb
index 05423a87..4a7a5e3f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -22,7 +22,7 @@ EXTRABROWSERS =3D " \
 "
=20
 PYTHON2APPS =3D " \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${EXTRABROWSERS}",'',=
d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl',"${EXTRABROWSERS}",'=
',d)} \
     ${@bb.utils.contains("BBFILE_COLLECTIONS","browser-layer",bb.utils.c=
ontains('DISTRO_FEATURES','wayland',"${CHROMIUM}",'',d),'',d)} \
 "
=20
@@ -43,9 +43,9 @@ RDEPENDS:${PN} =3D "\
     packagegroup-arago-console \
     packagegroup-arago-base-tisdk \
     ti-test \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-ti=
sdk-graphics','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-ti=
sdk-gtk','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-ti=
sdk-qte qt3d-examples','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-=
tisdk-graphics','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-=
tisdk-gtk','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-=
tisdk-qte qt3d-examples','',d)} \
     ${@oe.utils.all_distro_features(d, "opencl", "${OPENCL}")} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
@@ -54,7 +54,7 @@ RDEPENDS:${PN} =3D "\
     packagegroup-arago-tisdk-multimedia \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-ti=
sdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-=
tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "${PYTHON=
2APPS}", "", d)} \
     ${DEVTOOLS} \
     ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} =
\
diff --git a/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend b/=
meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
deleted file mode 100644
index 1de9aebb..00000000
--- a/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-PR:append =3D ".arago1"
-
-PACKAGECONFIG:append =3D " ${@bb.utils.contains('MACHINE_FEATURES', 'gpu=
', 'egl glesv2', '', d)}"
diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-=
plugins-%.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gstre=
amer1.0-plugins-%.bbappend
deleted file mode 100644
index 4a4986c3..00000000
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-%.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-# Remove all GFX PACKAGECONFIGs for platforms w/o GPU
-PACKAGECONFIG:remove =3D "${@bb.utils.contains('MACHINE_FEATURES','gpu',=
'','x11 wayland gl egl gles2 qt5',d)}"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PR:append =3D ".0"
diff --git a/meta-arago-extras/recipes-apps/video-analytics-demo/qt-openc=
v-opencl-opengl-multithreaded_git.bb b/meta-arago-extras/recipes-apps/vid=
eo-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
index 12793df0..de672e28 100644
--- a/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-openc=
l-opengl-multithreaded_git.bb
+++ b/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-openc=
l-opengl-multithreaded_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De28b998056a1a5=
13e87be11c5045e85b"
=20
 inherit features_check
=20
-REQUIRED_MACHINE_FEATURES =3D "dsp"
+REQUIRED_MACHINE_FEATURES =3D "dsp gpu"
 REQUIRED_DISTRO_FEATURES =3D "opencv opencl opengl"
=20
 DEPENDS +=3D "opencv opencl virtual/egl ti-cgt6x-native clocl-native dsp=
lib-c66x"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.=
0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
index a834fbbf..5478db9f 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
@@ -17,25 +17,13 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 #       we can use an RRECOMMENDS instead.
=20
 PACKAGES =3D " \
+            matrix-3d-demo-kmscube      \
 "
=20
 PACKAGES:append:omap-a15 =3D " \
-            matrix-3d-demo-kmscube      \
             matrix-3d-demo-kmscubevideo \
 "
=20
-PACKAGES:append:ti43x =3D " \
-            matrix-3d-demo-kmscube \
-"
-
-PACKAGES:append:ti33x =3D " \
-            matrix-3d-demo-kmscube \
-"
-
-PACKAGES:append:k3 =3D " \
-            matrix-3d-demo-kmscube \
-"
-
 MATRIX_3D_DEMO_SGX_QAF_PARAM =3D "1000"
=20
 do_install:prepend() {
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevisi=
on-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-machin=
evision-demos_2.0.bb
index 16482003..6cb9ba6d 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demo=
s_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demo=
s_2.0.bb
@@ -29,7 +29,7 @@ RDEPENDS:matrix-machinevision-demo-dlp3dscanner =3D " \
 "
=20
 RDEPENDS:matrix-machinevision-demo-dlp3dscanner:append:dra7xx =3D " \
-    ${@['','point-cloud-viewer'][oe.utils.all_distro_features(d, 'opencv=
', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu', True, Fa=
lse, d)]} \
+    ${@['','point-cloud-viewer'][oe.utils.all_distro_features(d, 'opencv=
', True, False) and bb.utils.contains('DISTRO_FEATURES', 'opengl', True, =
False, d)]} \
 "
=20
 RDEPENDS:matrix-machinevision-demo-barcoderoi =3D " \
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analy=
tics-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-vide=
o-analytics-demos_2.0.bb
index d0cf5233..73fc4661 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-de=
mos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-de=
mos_2.0.bb
@@ -17,7 +17,7 @@ VIDEO_ANALYTICS_DEMO_RDEPENDS +=3D " \
 PACKAGES =3D "matrix-video-analytics-opencv-opencl-opengl-demo \
 "
=20
-#    ${@['','qt-opencv-opencl-opengl-multithreaded'][oe.utils.all_distro=
_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('=
MACHINE_FEATURES', 'gpu dsp', True, False, d)]}
+#    ${@['','qt-opencv-opencl-opengl-multithreaded'][oe.utils.all_distro=
_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('=
MACHINE_FEATURES', 'dsp', True, False, d)]}
 RDEPENDS:matrix-video-analytics-opencv-opencl-opengl-demo =3D " \
     ${VIDEO_ANALYTICS_DEMO_RDEPENDS} \
 "
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/me=
ta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 047e9dbd..b22f1151 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -58,7 +58,7 @@ do_install(){
 	install -m 0644 ${WORKDIR}/matrix-gui-2.0.service ${D}${systemd_system_=
unitdir}
 }
=20
-GUIDEPS =3D "${@bb.utils.contains('MACHINE_FEATURES','gpu',"matrix-gui-b=
rowser refresh-screen",'',d)}"
+GUIDEPS =3D "${@bb.utils.contains('DISTRO_FEATURES','opengl',"matrix-gui=
-browser refresh-screen",'',d)}"
=20
 RDEPENDS:${PN} +=3D "matrix-lighttpd-config lighttpd lighttpd-module-cgi=
 lighttpd-module-deflate lighttpd-module-expire php php-cgi php-cli ${GUI=
DEPS}"
=20
--=20
2.25.1


