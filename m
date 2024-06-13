Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D638FC27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 16:00:34 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.12593.1718294431114938279
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Jun 2024 09:00:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=wc30OaSH;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45DG0SSE126860;
	Thu, 13 Jun 2024 11:00:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718294428;
	bh=fsUJ+GQ0YMrPQauk5Q5Tga25qG+rZ4klQhcRXd+vLDk=;
	h=From:To:Subject:Date;
	b=wc30OaSHmqmntJlG54Q4N41Ai4O9Tr/83OS4Vx0eyX2HXoaQo+A7Ilx47DZzggrZs
	 Y6+KRLVJUUSPPWS/A9UCVGM0LqxZzITvIbjcVPK0UvT/MPfm/4dicuHfKk7B5FzDwb
	 spwDMqmQNDX02oe3s9S26CUoNoQVm3rEzWfvf4V8=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45DG0S3D084698
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Jun 2024 11:00:28 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Jun 2024 11:00:28 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Jun 2024 11:00:28 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45DG0Spf103474;
	Thu, 13 Jun 2024 11:00:28 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sHmsG-0001kN-5K; Thu, 13 Jun 2024 11:00:28 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] recipes: Add missing Upstream-Status to patch files
Date: Thu, 13 Jun 2024 11:00:28 -0500
Message-ID: <20240613160028.6665-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 45DG0SSE126860
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Jun 2024 16:00:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15383

Now that master requires Upstream-Status for all layers we need to clean
up the meta-arago layers.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../pm-qa/0001-Return-non-zero-value-on-test-failure.patch     | 2 ++
 .../pm-qa/pm-qa/0002-cpuidle-Avoid-relative-paths.patch        | 2 ++
 .../0001-layer-add-surfaces-Add-screenId-as-an-argument.patch  | 2 ++
 .../0002-layer-add-surfaces-surface-layer-management.patch     | 2 ++
 .../wayland/wayland-ivi-extension/force-type-conversion.patch  | 3 +++
 ...-calculator-Add-exit-button-for-non-window-environmen.patch | 2 ++
 .../qt5/qtbase/0001-deform-Fix-how-controls-are-shown.patch    | 2 ++
 ...-animatedtiles-Add-exit-button-for-non-window-environ.patch | 2 ++
 .../qt5/qtbase/0002-deform-disable-opengl-button.patch         | 2 ++
 .../0001-touchinteraction.qml-Add-exit-button.patch            | 2 ++
 ...-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch | 2 ++
 .../recipes-qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.patch      | 3 +++
 .../recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch    | 3 +++
 .../recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch       | 3 +++
 meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch    | 3 +++
 .../recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.patch            | 3 +++
 .../0001-hostapd-change-conf-file-for-better-oob-startup.patch | 2 ++
 .../recipes-connectivity/vtun/vtun/08-gcc5-inline.patch        | 2 ++
 .../recipes-connectivity/vtun/vtun/Add_search_path.patch       | 3 +++
 .../recipes-connectivity/vtun/vtun/remove_strip.patch          | 3 +++
 .../wpa-supplicant/wpa-supplicant/crypto_openssl.patch         | 3 +++
 ...001-configure-Do-not-check-build-executable-extension.patch | 2 ++
 ...-Search-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch | 2 ++
 .../recipes-graphics/devil/files/Remove-ILUT-dependency.patch  | 2 ++
 ...-makefile.linux.def-relax-assignment-of-CC-and-other-.patch | 2 ++
 ...-Makefile-correct-use-of-CPP-CXX-and-other-standard-v.patch | 2 ++
 .../0001-configure.ac-stop-using-export-symbols-regex.patch    | 2 ++
 ...-gstducati-configure.ac-stop-using-export-symbols-reg.patch | 2 ++
 .../0001-configure.ac-stop-using-export-symbols-regex.patch    | 2 ++
 ...1-gstvpe-configure.ac-stop-using-export-symbols-regex.patch | 2 ++
 ...-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch | 2 ++
 .../0001-media-ctl-add-support-for-RGBIr-bayer-formats.patch   | 2 ++
 .../0001-v4l2-ctl-Add-routing-and-streams-support.patch        | 2 ++
 .../0002-media-ctl-add-support-for-routes-and-streams.patch    | 2 ++
 .../v4l-utils/0002-original-patch-mediactl-pkgconfig.patch     | 2 ++
 .../0003-original-patch-export-mediactl-headers.patch          | 2 ++
 ...-v4l2-ctl-compliance-add-routing-and-streams-multiple.patch | 2 ++
 ...-include-loki-SmallObj.h-ISO-C-17-does-not-allow-dyna.patch | 2 ++
 ...-include-loki-Threads.h-return-statement-with-a-value.patch | 2 ++
 ...-test-Function-FunctionTest.cpp-reference-to-bad_func.patch | 2 ++
 .../files/apply-modification-for-tflite-1.15-to-eigen.patch    | 3 +++
 .../netopeer2-server/0001-Add-EST-Yang-Models.patch            | 3 +++
 .../sysrepo-plugins-common/0001-so-version.patch               | 3 +++
 .../linalg/files/0001-Makefile-fix-toolchain-variables.patch   | 2 ++
 ...-Makefile-pass-PARALLEL_MAKE-variable-to-overwrite-j8.patch | 2 ++
 ...-float_compute-matmpy-Link-with-libdl-to-resolve-link.patch | 2 ++
 ...0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch | 2 ++
 .../iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch        | 2 ++
 ...1-headers.h-remove-math.h-include-that-breaks-aarch64.patch | 2 ++
 .../iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch              | 3 +++
 .../iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch                | 2 ++
 .../0001-autoconf-fix-for-cross-compilation-for-ARM.patch      | 2 ++
 ...1-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch | 2 ++
 53 files changed, 119 insertions(+)

diff --git a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0001-Return-n=
on-zero-value-on-test-failure.patch b/meta-arago-distro/recipes-devtools/=
pm-qa/pm-qa/0001-Return-non-zero-value-on-test-failure.patch
index a5b5b8cc..35dbe7f5 100644
--- a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0001-Return-non-zero=
-value-on-test-failure.patch
+++ b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0001-Return-non-zero=
-value-on-test-failure.patch
@@ -4,6 +4,8 @@ Date: Thu, 13 Aug 2015 15:03:00 -0400
=20
 By convention Linux tools return non-zero value on error/failure.
=20
+Upstream-Status: Inactive-Upstream
+
 Signed-off-by: Carlos Hernandez <ceh@ti.com>
 ---
  include/functions.sh | 1 +
diff --git a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0002-cpuidle-=
Avoid-relative-paths.patch b/meta-arago-distro/recipes-devtools/pm-qa/pm-=
qa/0002-cpuidle-Avoid-relative-paths.patch
index 5252e3b1..0c39d6f4 100644
--- a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0002-cpuidle-Avoid-r=
elative-paths.patch
+++ b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0002-cpuidle-Avoid-r=
elative-paths.patch
@@ -5,6 +5,8 @@ Date: Thu, 13 Aug 2015 15:03:01 -0400
 Instead of assuming location of files in the filesystem by using
 relative paths, call binary and let $PATH find binary location.
=20
+Upstream-Status: Inactive-Upstream
+
 Signed-off-by: Carlos Hernandez <ceh@ti.com>
 ---
  cpuidle/cpuidle_02.sh | 2 +-
diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-exten=
sion/0001-layer-add-surfaces-Add-screenId-as-an-argument.patch b/meta-ara=
go-distro/recipes-graphics/wayland/wayland-ivi-extension/0001-layer-add-s=
urfaces-Add-screenId-as-an-argument.patch
index b8afc0de..b8601e36 100644
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/00=
01-layer-add-surfaces-Add-screenId-as-an-argument.patch
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/00=
01-layer-add-surfaces-Add-screenId-as-an-argument.patch
@@ -7,6 +7,8 @@ Add Screen_ID as a argument to handle multiple screens.
 Removed choose_screen function as it is redundant
 after this change
=20
+Upstream-Status: Inappropriate [arago specific]
+
 Signed-off-by: Ramprasad N <x0038811@ti.com>
 Reviewed-by: Karthik Ramanan <a0393906@ti.com>
 ---
diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-exten=
sion/0002-layer-add-surfaces-surface-layer-management.patch b/meta-arago-=
distro/recipes-graphics/wayland/wayland-ivi-extension/0002-layer-add-surf=
aces-surface-layer-management.patch
index eff4a79c..adf6711f 100644
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/00=
02-layer-add-surfaces-surface-layer-management.patch
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/00=
02-layer-add-surfaces-surface-layer-management.patch
@@ -6,6 +6,8 @@ Subject: [PATCH 2/2] layer-add-surfaces: surface-layer ma=
nagement
 This patch prevents surfaces from getting added to a new layer
 if they are already registered to an existing layer.
=20
+Upstream-Status: Inappropriate [arago specific]
+
 Signed-off-by: Ramprasad N <x0038811@ti.com>
 Reviewed-by: Karthik Ramanan <a0393906@ti.com>
 ---
diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-exten=
sion/force-type-conversion.patch b/meta-arago-distro/recipes-graphics/way=
land/wayland-ivi-extension/force-type-conversion.patch
index a72aeedf..acebcfe4 100644
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/fo=
rce-type-conversion.patch
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/fo=
rce-type-conversion.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [arago specific]
+
 diff --git a/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGL=
ES2App.cpp b/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLE=
S2App.cpp
 index 2e65864..e14dbc0 100644
 --- a/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLES2App.=
cpp
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-calculator-Add-=
exit-button-for-non-window-environmen.patch b/meta-arago-distro/recipes-q=
t/qt5/qtbase/0001-calculator-Add-exit-button-for-non-window-environmen.pa=
tch
index e123df57..11112878 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-calculator-Add-exit-bu=
tton-for-non-window-environmen.patch
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-calculator-Add-exit-bu=
tton-for-non-window-environmen.patch
@@ -3,6 +3,8 @@ From: Jake Stiffler <jake@mcsdk-hpc-test.(none)>
 Date: Thu, 19 Mar 2015 15:21:08 -0400
 Subject: [PATCH 1/2] calculator: Add exit button for non-window environm=
ent.
=20
+Upstream-Status: Inappropriate [arago specific]
+
 Signed-off-by: Jake Stiffler <jake@mcsdk-hpc-test.(none)>
 ---
  examples/widgets/widgets/calculator/calculator.cpp |    9 ++++++++-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-deform-Fix-how-=
controls-are-shown.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-d=
eform-Fix-how-controls-are-shown.patch
index 076becaa..7f1e0570 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-deform-Fix-how-control=
s-are-shown.patch
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-deform-Fix-how-control=
s-are-shown.patch
@@ -8,6 +8,8 @@ Subject: [PATCH 1/2] deform: Fix how controls are shown.
 * If controls are not full screen, then they must retain focus while
   opened.
=20
+Upstream-Status: Pending
+
 Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
 ---
  examples/widgets/painting/deform/pathdeform.cpp |    4 +++-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0002-animatedtiles-A=
dd-exit-button-for-non-window-environ.patch b/meta-arago-distro/recipes-q=
t/qt5/qtbase/0002-animatedtiles-Add-exit-button-for-non-window-environ.pa=
tch
index 7b7ab3c2..c1452eda 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase/0002-animatedtiles-Add-exit=
-button-for-non-window-environ.patch
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase/0002-animatedtiles-Add-exit=
-button-for-non-window-environ.patch
@@ -4,6 +4,8 @@ Date: Fri, 20 Mar 2015 15:00:51 -0400
 Subject: [PATCH 2/2] animatedtiles: Add exit button for non-window
  environment.
=20
+Upstream-Status: Inappropriate [arago specific]
+
 Signed-off-by: Jake Stiffler <jake@mcsdk-hpc-test.(none)>
 ---
  .../animation/animatedtiles/animatedtiles.qrc      |    1 +
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0002-deform-disable-=
opengl-button.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0002-deform=
-disable-opengl-button.patch
index b15324bf..31e573d5 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase/0002-deform-disable-opengl-=
button.patch
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase/0002-deform-disable-opengl-=
button.patch
@@ -3,6 +3,8 @@ From: Jacob Stiffler <j-stiffler@ti.com>
 Date: Fri, 12 Jun 2015 10:24:33 -0400
 Subject: [PATCH 2/2] deform: disable opengl button.
=20
+Upstream-Status: Inappropriate [arago specific]
+
 Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
 ---
  examples/widgets/painting/deform/pathdeform.cpp |   12 ++++++------
diff --git a/meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-touchint=
eraction.qml-Add-exit-button.patch b/meta-arago-distro/recipes-qt/qt5/qtd=
eclarative/0001-touchinteraction.qml-Add-exit-button.patch
index c7ae8d1d..8ff24601 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-touchinteractio=
n.qml-Add-exit-button.patch
+++ b/meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-touchinteractio=
n.qml-Add-exit-button.patch
@@ -3,6 +3,8 @@ From: Eric Ruei <e-ruei1@ti.com>
 Date: Tue, 16 Aug 2016 15:09:04 -0400
 Subject: [PATCH] touchinteraction.qml: Add "exit" button
=20
+Upstream-Status: Inappropriate [arago specific]
+
 Signed-off-by: Eric Ruei <e-ruei1@ti.com>
 ---
  .../quick/touchinteraction/touchinteraction.qml    | 38 +++++++++++++++=
+++++++
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-up=
date-to-use-GL_NoX-version-of-GraphicsS.patch b/meta-arago-distro/recipes=
-qt/qt5/qtwebkit/0001-Target.pri-update-to-use-GL_NoX-version-of-Graphics=
S.patch
index 55a4c032..5ccf6df3 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to=
-use-GL_NoX-version-of-GraphicsS.patch
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to=
-use-GL_NoX-version-of-GraphicsS.patch
@@ -4,6 +4,8 @@ Date: Thu, 17 Jul 2014 16:11:46 -0400
 Subject: [PATCH] Target.pri: update to use GL_NoX version of GraphicsSur=
face
  sources
=20
+Upstream-Status: Inappropriate [arago specific]
+
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
  Source/WebCore/Target.pri | 4 ++++
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsContext3DQ=
t.cpp.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsContext3D=
Qt.cpp.patch
index aa752bb8..7a7cf752 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.p=
atch
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.p=
atch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [arago specific]
+
 --- qtwebkit/Source/WebCore/platform/graphics/qt/GraphicsContext3DQt.cpp=
.orig	2013-09-07 13:41:19.946858466 +0530
 +++ qtwebkit/Source/WebCore/platform/graphics/qt/GraphicsContext3DQt.cpp=
	2013-09-07 17:48:13.958979770 +0530
 @@ -383,21 +383,23 @@ GraphicsContext3D::GraphicsContext3D(Gra
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_=
NoX.cpp.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurface=
GL_NoX.cpp.patch
index 89712a8b..033fa893 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp=
.patch
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp=
.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [arago specific]
+
 diff -Nurp8 Source/WebCore/platform/graphics/surfaces/qt/GraphicsSurface=
GL_NoX.cpp Source-new/WebCore/platform/graphics/surfaces/qt/GraphicsSurfa=
ceGL_NoX.cpp
 --- qtwebkit/Source/WebCore/platform/graphics/surfaces/qt/GraphicsSurfac=
eGL_NoX.cpp	1970-01-01 05:30:00.000000000 +0530
 +++ qtwebkit-new/Source/WebCore/platform/graphics/surfaces/qt/GraphicsSu=
rfaceGL_NoX.cpp	2013-09-07 13:43:55.186851650 +0530
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceTok=
en.h.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceTok=
en.h.patch
index 722df392..719793fd 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.pa=
tch
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.pa=
tch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [arago specific]
+
 --- qtwebkit/Source/WebCore/platform/graphics/surfaces/GraphicsSurfaceTo=
ken.h.orig	2013-09-07 13:44:47.906849335 +0530
 +++ qtwebkit/Source/WebCore/platform/graphics/surfaces/GraphicsSurfaceTo=
ken.h	2013-09-07 13:46:12.554845618 +0530
 @@ -50,17 +50,30 @@ struct GraphicsSurfaceToken {
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch =
b/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
index 276b3cf8..cc2bf510 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [arago specific]
+
 diff --git a/Source/WebCore/WebCore.pri b/Source/WebCore/WebCore.pri
 index 0189394..00f7090 100644
 --- a/Source/WebCore/WebCore.pri
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.=
patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.patch
index 9a57be22..badf9349 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.patch
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [arago specific]
+
 --- qtwebkit/Tools/QtTestBrowser/qttestbrowser.cpp.orig	2013-09-08 17:28=
:48.633593482 +0530
 +++ qtwebkit/Tools/QtTestBrowser/qttestbrowser.cpp	2013-09-08 17:29:07.7=
13592964 +0530
 @@ -235,19 +235,20 @@ void LauncherApplication::handleUserOpti
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-=
wl18xx/0001-hostapd-change-conf-file-for-better-oob-startup.patch b/meta-=
arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0001-hostap=
d-change-conf-file-for-better-oob-startup.patch
index c89dd4c8..1b1f59a1 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/=
0001-hostapd-change-conf-file-for-better-oob-startup.patch
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/=
0001-hostapd-change-conf-file-for-better-oob-startup.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] hostapd change conf file for better oob =
startup
=20
 Changed some of the default parameters
=20
+Upstream-Status: Inappropriate [configuration change]
+
 Signed-off-by: Yaniv Mahani <yanivma@ti.com>
 ---
  hostapd/hostapd.conf |  724 ++++++-------------------------------------=
-------
diff --git a/meta-arago-extras/recipes-connectivity/vtun/vtun/08-gcc5-inl=
ine.patch b/meta-arago-extras/recipes-connectivity/vtun/vtun/08-gcc5-inli=
ne.patch
index c9a00900..18497111 100644
--- a/meta-arago-extras/recipes-connectivity/vtun/vtun/08-gcc5-inline.pat=
ch
+++ b/meta-arago-extras/recipes-connectivity/vtun/vtun/08-gcc5-inline.pat=
ch
@@ -7,6 +7,8 @@ Author: "Potter, Tim (Cloud Services)" <timothy.potter@hp=
.com>
 Reviewed-by: gregor herrmann <gregoa@debian.org>
 Last-Update: 2015-07-23
=20
+Upstream-Status: Pending
+
 --- a/cfg_file.y
 +++ b/cfg_file.y
 @@ -624,7 +624,7 @@
diff --git a/meta-arago-extras/recipes-connectivity/vtun/vtun/Add_search_=
path.patch b/meta-arago-extras/recipes-connectivity/vtun/vtun/Add_search_=
path.patch
index ebf83310..30808ae3 100644
--- a/meta-arago-extras/recipes-connectivity/vtun/vtun/Add_search_path.pa=
tch
+++ b/meta-arago-extras/recipes-connectivity/vtun/vtun/Add_search_path.pa=
tch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [arago specific]
+
 --- vtun-3.0.3/configure.orig
 +++ vtun-3.0.3/configure
 @@ -5680,7 +5680,7 @@
diff --git a/meta-arago-extras/recipes-connectivity/vtun/vtun/remove_stri=
p.patch b/meta-arago-extras/recipes-connectivity/vtun/vtun/remove_strip.p=
atch
index 4e123931..86643877 100644
--- a/meta-arago-extras/recipes-connectivity/vtun/vtun/remove_strip.patch
+++ b/meta-arago-extras/recipes-connectivity/vtun/vtun/remove_strip.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [arago specific]
+
 --- vtun-3.0.3/Makefile.orig.in
 +++ vtun-3.0.3/Makefile.in
 @@ -99,6 +99,5 @@
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-su=
pplicant/crypto_openssl.patch b/meta-arago-extras/recipes-connectivity/wp=
a-supplicant/wpa-supplicant/crypto_openssl.patch
index 650f5c19..c958f403 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplican=
t/crypto_openssl.patch
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplican=
t/crypto_openssl.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [arago specific]
+
 --- a/src/crypto/crypto_openssl.c	2019-11-09 06:46:42.112779317 -0600
 +++ b/src/crypto/crypto_openssl.c.new	2019-11-09 13:16:57.560629882 -060=
0
 @@ -602,11 +602,15 @@
diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6/0001-configur=
e-Do-not-check-build-executable-extension.patch b/meta-arago-extras/recip=
es-core/llvm/ti-llvm3.6/0001-configure-Do-not-check-build-executable-exte=
nsion.patch
index 9a60caf3..e9c332ac 100644
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6/0001-configure-Do-no=
t-check-build-executable-extension.patch
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6/0001-configure-Do-no=
t-check-build-executable-extension.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] configure: Do not check build executable=
 extension.
  * This seems to cause issues nativesdk and build sdk
    architectures are the same.
=20
+Upstream-Status: Inappropriate [oe specific]
+
 Signed-off-by: Jake Stiffler <j-stiffler@ti.com>
 ---
  configure                 |    3 +++
diff --git a/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules=
/0001-Search-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch b/meta-a=
rago-extras/recipes-devtools/cmake/extra-cmake-modules/0001-Search-within=
-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch
index 964dbbf9..a8c2132e 100644
--- a/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules/0001-S=
earch-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch
+++ b/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules/0001-S=
earch-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch
@@ -4,6 +4,8 @@ Date: Mon, 29 Dec 2014 12:05:20 +0100
 Subject: [PATCH] Search within OE_QMAKE_PATH_EXTERNAL_HOST_BINS for
  qtwaylandscanner
=20
+Upstream-Status: Inappropriate [oe specific]
+
 Signed-off-by: Simon Busch <morphis@gravedo.de>
 ---
  find-modules/FindQtWaylandScanner.cmake | 2 +-
diff --git a/meta-arago-extras/recipes-graphics/devil/files/Remove-ILUT-d=
ependency.patch b/meta-arago-extras/recipes-graphics/devil/files/Remove-I=
LUT-dependency.patch
index 4f0f9dfa..0dcc9263 100644
--- a/meta-arago-extras/recipes-graphics/devil/files/Remove-ILUT-dependen=
cy.patch
+++ b/meta-arago-extras/recipes-graphics/devil/files/Remove-ILUT-dependen=
cy.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [arago specific]
+
 diff --git a/DevIL/CMakeLists.txt b/DevIL/CMakeLists.txt
 index e342f93d..fae40167 100644
 --- a/DevIL/CMakeLists.txt
diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/files/0001=
-makefile.linux.def-relax-assignment-of-CC-and-other-.patch b/meta-arago-=
extras/recipes-graphics/ti-gc320-tests/files/0001-makefile.linux.def-rela=
x-assignment-of-CC-and-other-.patch
index 0078a296..0ae5ff65 100644
--- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/files/0001-makefi=
le.linux.def-relax-assignment-of-CC-and-other-.patch
+++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/files/0001-makefi=
le.linux.def-relax-assignment-of-CC-and-other-.patch
@@ -3,6 +3,8 @@ From: Denys Dmytriyenko <denys@ti.com>
 Date: Sun, 26 Mar 2017 14:14:49 -0400
 Subject: [PATCH] makefile.linux.def: relax assignment of CC and other to=
ols
=20
+Upstream-Status: Inappropriate [oe specific]
+
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
  tests/src/makefile.linux.def | 14 +++++++-------
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-plugins-dsp66/0001-Makefile-correct-use-of-CPP-CXX-and-other-standar=
d-v.patch b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer=
1.0-plugins-dsp66/0001-Makefile-correct-use-of-CPP-CXX-and-other-standard=
-v.patch
index 3c913ed4..8048de93 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-dsp66/0001-Makefile-correct-use-of-CPP-CXX-and-other-standard-v.pat=
ch
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-dsp66/0001-Makefile-correct-use-of-CPP-CXX-and-other-standard-v.pat=
ch
@@ -3,6 +3,8 @@ From: Denys Dmytriyenko <denys@ti.com>
 Date: Sun, 26 Mar 2017 15:12:44 -0400
 Subject: [PATCH] Makefile: correct use of CPP/CXX and other standard var=
iables
=20
+Upstream-Status: Inappropriate [oe specific]
+
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
  src/kernels/make.inc         | 16 +++++++---------
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-plugins-dsp66/0001-configure.ac-stop-using-export-symbols-regex.patc=
h b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plug=
ins-dsp66/0001-configure.ac-stop-using-export-symbols-regex.patch
index c9721b70..e3df61ac 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-dsp66/0001-configure.ac-stop-using-export-symbols-regex.patch
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-dsp66/0001-configure.ac-stop-using-export-symbols-regex.patch
@@ -7,6 +7,8 @@ The old regex is no longer correct for GStreamer 1.14.
=20
 Bug-Debian: https://bugs.debian.org/894642
=20
+Upstream-Status: Inappropriate [arago specific]
+
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
  configure.ac | 2 +-
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-plugins-ducati/0001-gstducati-configure.ac-stop-using-export-symbols=
-reg.patch b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-plugins-ducati/0001-gstducati-configure.ac-stop-using-export-symbols=
-reg.patch
index 4104e24e..c6a24c06 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-ducati/0001-gstducati-configure.ac-stop-using-export-symbols-reg.pa=
tch
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-ducati/0001-gstducati-configure.ac-stop-using-export-symbols-reg.pa=
tch
@@ -5,6 +5,8 @@ Subject: [PATCH] gstducati: configure.ac stop using -expo=
rt-symbols-regex
=20
 The old regex is no longer correct for GStreamer 1.14.
=20
+Upstream-Status: Inappropriate [arago specific]
+
 Signed-off-by: Ramprasad N <x0038811@ti.com>
 ---
  configure.ac | 2 +-
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-plugins-hevc/0001-configure.ac-stop-using-export-symbols-regex.patch=
 b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugi=
ns-hevc/0001-configure.ac-stop-using-export-symbols-regex.patch
index c9721b70..e3df61ac 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-hevc/0001-configure.ac-stop-using-export-symbols-regex.patch
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-hevc/0001-configure.ac-stop-using-export-symbols-regex.patch
@@ -7,6 +7,8 @@ The old regex is no longer correct for GStreamer 1.14.
=20
 Bug-Debian: https://bugs.debian.org/894642
=20
+Upstream-Status: Inappropriate [arago specific]
+
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
  configure.ac | 2 +-
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-plugins-vpe/0001-gstvpe-configure.ac-stop-using-export-symbols-regex=
.patch b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0=
-plugins-vpe/0001-gstvpe-configure.ac-stop-using-export-symbols-regex.pat=
ch
index d68c152b..d1739df8 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-vpe/0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-vpe/0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch
@@ -12,6 +12,8 @@ undefined symbol as --export-symbols option is no more =
supported.
 Rename PACKAGE to vpe to get the expected symbol
 gst_plugin_vpe_get_desc
=20
+Upstream-Status: Inappropriate [arago specific]
+
 Signed-off-by: Ramprasad N <x0038811@ti.com>
 ---
  configure.ac | 2 +-
diff --git a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/000=
1-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch b/meta-arago=
-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-Revert-media-ctl-Don-=
t-install-libmediactl-and-libv4.patch
index 7305e471..2b5eef11 100644
--- a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-Rever=
t-media-ctl-Don-t-install-libmediactl-and-libv4.patch
+++ b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-Rever=
t-media-ctl-Don-t-install-libmediactl-and-libv4.patch
@@ -7,6 +7,8 @@ Subject: [PATCH] Revert "media-ctl: Don't install libmedi=
actl and
=20
 This reverts commit 0911dce53b08b0df3066be2c75f67e8a314d8729.
=20
+Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
=20
 Conflicts:
diff --git a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/000=
1-media-ctl-add-support-for-RGBIr-bayer-formats.patch b/meta-arago-extras=
/recipes-multimedia/v4l-utils/v4l-utils/0001-media-ctl-add-support-for-RG=
BIr-bayer-formats.patch
index 1dff0637..cf391bf5 100644
--- a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-media=
-ctl-add-support-for-RGBIr-bayer-formats.patch
+++ b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-media=
-ctl-add-support-for-RGBIr-bayer-formats.patch
@@ -3,6 +3,8 @@ From: Jai Luthra <j-luthra@ti.com>
 Date: Tue, 5 Jul 2022 16:23:39 +0530
 Subject: [PATCH] media-ctl: add support for RGBIr bayer formats
=20
+Upstream-Status: Pending
+
 Signed-off-by: Jai Luthra <j-luthra@ti.com>
 ---
  include/linux/media-bus-format.h | 10 +++++++++-
diff --git a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/000=
1-v4l2-ctl-Add-routing-and-streams-support.patch b/meta-arago-extras/reci=
pes-multimedia/v4l-utils/v4l-utils/0001-v4l2-ctl-Add-routing-and-streams-=
support.patch
index 9fd19edc..57fb630d 100644
--- a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-v4l2-=
ctl-Add-routing-and-streams-support.patch
+++ b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-v4l2-=
ctl-Add-routing-and-streams-support.patch
@@ -12,6 +12,8 @@ configurations per stream.
 Based on work from Jacopo Mondi <jacopo@jmondi.org> and
 Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>.
=20
+Upstream-Status: Pending
+
 Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
 ---
  utils/v4l2-ctl/v4l2-ctl-subdev.cpp | 288 +++++++++++++++++++++++++----
diff --git a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/000=
2-media-ctl-add-support-for-routes-and-streams.patch b/meta-arago-extras/=
recipes-multimedia/v4l-utils/v4l-utils/0002-media-ctl-add-support-for-rou=
tes-and-streams.patch
index 79864f01..5dc06ac0 100644
--- a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0002-media=
-ctl-add-support-for-routes-and-streams.patch
+++ b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0002-media=
-ctl-add-support-for-routes-and-streams.patch
@@ -8,6 +8,8 @@ configurations per stream.
=20
 Based on work from Sakari Ailus <sakari.ailus@linux.intel.com>.
=20
+Upstream-Status: Pending
+
 Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
 ---
  utils/media-ctl/libmediactl.c   |  41 +++++
diff --git a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/000=
2-original-patch-mediactl-pkgconfig.patch b/meta-arago-extras/recipes-mul=
timedia/v4l-utils/v4l-utils/0002-original-patch-mediactl-pkgconfig.patch
index 6ad9f2c1..e33b63d1 100644
--- a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0002-origi=
nal-patch-mediactl-pkgconfig.patch
+++ b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0002-origi=
nal-patch-mediactl-pkgconfig.patch
@@ -3,6 +3,8 @@ From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 1 Mar 2015 22:25:07 +0000
 Subject: [PATCH] %% original patch: mediactl-pkgconfig.patch
=20
+Upstream-Status: Pending
+
 ---
  utils/media-ctl/Makefile.am | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/000=
3-original-patch-export-mediactl-headers.patch b/meta-arago-extras/recipe=
s-multimedia/v4l-utils/v4l-utils/0003-original-patch-export-mediactl-head=
ers.patch
index 5562d2c1..7b599b9d 100644
--- a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0003-origi=
nal-patch-export-mediactl-headers.patch
+++ b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0003-origi=
nal-patch-export-mediactl-headers.patch
@@ -3,6 +3,8 @@ From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 1 Mar 2015 22:25:07 +0000
 Subject: [PATCH] %% original patch: export-mediactl-headers.patch
=20
+Upstream-Status: Inappropriate [arago specific]
+
 ---
  utils/media-ctl/Makefile.am | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
diff --git a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/000=
3-v4l2-ctl-compliance-add-routing-and-streams-multiple.patch b/meta-arago=
-extras/recipes-multimedia/v4l-utils/v4l-utils/0003-v4l2-ctl-compliance-a=
dd-routing-and-streams-multiple.patch
index aeb97e09..a9a3afce 100644
--- a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0003-v4l2-=
ctl-compliance-add-routing-and-streams-multiple.patch
+++ b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0003-v4l2-=
ctl-compliance-add-routing-and-streams-multiple.patch
@@ -6,6 +6,8 @@ Subject: [PATCH 3/3] v4l2-ctl/compliance: add routing and=
 streams multiplexed
=20
 Add basic support for routing and streams.
=20
+Upstream-Status: Pending
+
 Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
 ---
  utils/v4l2-compliance/v4l2-compliance.cpp   | 120 ++++++++++++++++----
diff --git a/meta-arago-extras/recipes-support/loki/libloki/0001-include-=
loki-SmallObj.h-ISO-C-17-does-not-allow-dyna.patch b/meta-arago-extras/re=
cipes-support/loki/libloki/0001-include-loki-SmallObj.h-ISO-C-17-does-not=
-allow-dyna.patch
index acd94d13..cabde7dd 100644
--- a/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-Sm=
allObj.h-ISO-C-17-does-not-allow-dyna.patch
+++ b/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-Sm=
allObj.h-ISO-C-17-does-not-allow-dyna.patch
@@ -4,6 +4,8 @@ Date: Mon, 13 Feb 2023 13:11:16 -0600
 Subject: [PATCH] include/loki/SmallObj.h: ISO C++17 does not allow dynam=
ic
  exception specifications
=20
+Upstream-Status: Pending
+
 Signed-off-by: Andrew Davis <afd@ti.com>
 ---
  include/loki/SmallObj.h | 15 ++-------------
diff --git a/meta-arago-extras/recipes-support/loki/libloki/0001-include-=
loki-Threads.h-return-statement-with-a-value.patch b/meta-arago-extras/re=
cipes-support/loki/libloki/0001-include-loki-Threads.h-return-statement-w=
ith-a-value.patch
index 91a78e88..3710a45b 100644
--- a/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-Th=
reads.h-return-statement-with-a-value.patch
+++ b/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-Th=
reads.h-return-statement-with-a-value.patch
@@ -4,6 +4,8 @@ Date: Mon, 14 Nov 2016 19:41:28 -0500
 Subject: [PATCH] include/loki/Threads.h: return-statement with a value, =
in
  function returning 'void'
=20
+Upstream-Status: Pending
+
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
  include/loki/Threads.h | 4 ++--
diff --git a/meta-arago-extras/recipes-support/loki/libloki/0002-test-Fun=
ction-FunctionTest.cpp-reference-to-bad_func.patch b/meta-arago-extras/re=
cipes-support/loki/libloki/0002-test-Function-FunctionTest.cpp-reference-=
to-bad_func.patch
index 0de9f61c..3ee7d8ff 100644
--- a/meta-arago-extras/recipes-support/loki/libloki/0002-test-Function-F=
unctionTest.cpp-reference-to-bad_func.patch
+++ b/meta-arago-extras/recipes-support/loki/libloki/0002-test-Function-F=
unctionTest.cpp-reference-to-bad_func.patch
@@ -4,6 +4,8 @@ Date: Mon, 14 Nov 2016 19:55:08 -0500
 Subject: [PATCH] test/Function/FunctionTest.cpp: reference to
  'bad_function_call' is ambiguous
=20
+Upstream-Status: Pending
+
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
  test/Function/FunctionTest.cpp | 2 +-
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/files/appl=
y-modification-for-tflite-1.15-to-eigen.patch b/meta-arago-extras/recipes=
-support/tensorflow-lite/files/apply-modification-for-tflite-1.15-to-eige=
n.patch
index 06c9c63a..491dcbfa 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/files/apply-modif=
ication-for-tflite-1.15-to-eigen.patch
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/files/apply-modif=
ication-for-tflite-1.15-to-eigen.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [arago specific]
+
 diff --git a/tensorflow/lite/tools/make/downloads/eigen/Eigen/src/Core/a=
rch/NEON/Complex.h b/tensorflow/lite/tools/make/downloads/eigen/Eigen/src=
/Core/arch/NEON/Complex.h
 index 306a309beb..4527a64c91 100644
 --- a/tensorflow/lite/tools/make/downloads/eigen/Eigen/src/Core/arch/NEO=
N/Complex.h
diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2=
-server/0001-Add-EST-Yang-Models.patch b/meta-arago-extras/recipes-sysrep=
o/netopeer2-server/netopeer2-server/0001-Add-EST-Yang-Models.patch
index 10ed685d..983f594b 100644
--- a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server=
/0001-Add-EST-Yang-Models.patch
+++ b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server=
/0001-Add-EST-Yang-Models.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [arago specific]
+
 diff --git a/scripts/setup.sh b/scripts/setup.sh
 index 7bba711..4a98e66 100755
 --- a/scripts/setup.sh
diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/000=
1-so-version.patch b/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-co=
mmon/0001-so-version.patch
index 0eabf6a9..5e2fc3a5 100644
--- a/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/0001-so-ve=
rsion.patch
+++ b/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/0001-so-ve=
rsion.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [arago specific]
+
 diff --git a/CMakeLists.txt b/CMakeLists.txt
 index fd64b80..910510d 100644
 --- a/CMakeLists.txt
diff --git a/meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-fix-=
toolchain-variables.patch b/meta-arago-extras/recipes-ti/linalg/files/000=
1-Makefile-fix-toolchain-variables.patch
index af7c6a2b..df387977 100644
--- a/meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-fix-toolcha=
in-variables.patch
+++ b/meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-fix-toolcha=
in-variables.patch
@@ -3,6 +3,8 @@ From: Denys Dmytriyenko <denys@ti.com>
 Date: Sun, 26 Mar 2017 18:17:06 -0400
 Subject: [PATCH] Makefile: fix toolchain variables
=20
+Upstream-Status: Inappropriate [oe specific]
+
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
  examples/arm+dsp/make.inc                         |  1 -
diff --git a/meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-pass=
-PARALLEL_MAKE-variable-to-overwrite-j8.patch b/meta-arago-extras/recipes=
-ti/linalg/files/0001-Makefile-pass-PARALLEL_MAKE-variable-to-overwrite-j=
8.patch
index dacea7a5..7d2f1409 100644
--- a/meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-pass-PARALL=
EL_MAKE-variable-to-overwrite-j8.patch
+++ b/meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-pass-PARALL=
EL_MAKE-variable-to-overwrite-j8.patch
@@ -3,6 +3,8 @@ From: Denys Dmytriyenko <denys@ti.com>
 Date: Wed, 29 Mar 2017 13:09:05 -0400
 Subject: [PATCH] Makefile: pass PARALLEL_MAKE variable to overwrite -j8
=20
+Upstream-Status: Inappropriate [oe specific]
+
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
  src/ti/linalg/Makefile | 12 +++++++-----
diff --git a/meta-arago-extras/recipes-ti/ocl/ocl/0001-float_compute-matm=
py-Link-with-libdl-to-resolve-link.patch b/meta-arago-extras/recipes-ti/o=
cl/ocl/0001-float_compute-matmpy-Link-with-libdl-to-resolve-link.patch
index dd13d731..43bc9900 100644
--- a/meta-arago-extras/recipes-ti/ocl/ocl/0001-float_compute-matmpy-Link=
-with-libdl-to-resolve-link.patch
+++ b/meta-arago-extras/recipes-ti/ocl/ocl/0001-float_compute-matmpy-Link=
-with-libdl-to-resolve-link.patch
@@ -7,6 +7,8 @@ Subject: [PATCH] float_compute, matmpy: Link with libdl t=
o resolve linking
 * with GCC 5.3 toolchain, linking with libgomp also requires linking
   with libdl
=20
+Upstream-Status: Pending
+
 Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
 ---
  examples/float_compute/Makefile | 2 +-
diff --git a/meta-arago-extras/recipes-ti/tiovx/files/0001-Fix-paths-for-=
Yocto-build-and-add-RTOS-build-var.patch b/meta-arago-extras/recipes-ti/t=
iovx/files/0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch
index 1e667b87..ff80debc 100644
--- a/meta-arago-extras/recipes-ti/tiovx/files/0001-Fix-paths-for-Yocto-b=
uild-and-add-RTOS-build-var.patch
+++ b/meta-arago-extras/recipes-ti/tiovx/files/0001-Fix-paths-for-Yocto-b=
uild-and-add-RTOS-build-var.patch
@@ -3,6 +3,8 @@ From: Djordje Senicic <d-senicic1@ti.com>
 Date: Mon, 14 Aug 2017 10:26:39 -0400
 Subject: [PATCH] Fix paths for Yocto build and add RTOS build var
=20
+Upstream-Status: Inappropriate [oe specific]
+
 Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
 ---
  Makefile            | 27 +++++++++++++++++++--------
diff --git a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-fix=
-out-of-tree-config.patch b/meta-arago-test/recipes-benchmark/iperf/iperf=
-2.0.5/0001-fix-out-of-tree-config.patch
index e8a02979..003d2523 100644
--- a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of=
-tree-config.patch
+++ b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of=
-tree-config.patch
@@ -7,6 +7,8 @@ header is not found due to the hard path.
 We now make the path for package header relative to our 'srcdir' so it i=
s
 found appropriately.
=20
+Upstream-Status: Inappropriate [oe specific]
+
 Signed-off-by: Awais Belal <awais_belal@mentor.com>
 ---
 diff --git a/configure.ac b/configure.ac
diff --git a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-hea=
ders.h-remove-math.h-include-that-breaks-aarch64.patch b/meta-arago-test/=
recipes-benchmark/iperf/iperf-2.0.5/0001-headers.h-remove-math.h-include-=
that-breaks-aarch64.patch
index abd2315b..8d9e03f6 100644
--- a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-headers.h-=
remove-math.h-include-that-breaks-aarch64.patch
+++ b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-headers.h-=
remove-math.h-include-that-breaks-aarch64.patch
@@ -18,6 +18,8 @@ Content-Transfer-Encoding: 8bit
 |      struct __is_integer<bool>
 |             ^~~~~~~~~~~~~~~~~~
=20
+Upstream-Status: Inappropriate [oe specific]
+
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
  include/headers.h | 1 -
diff --git a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0002-fix=
-bool-size-m4.patch b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5=
/0002-fix-bool-size-m4.patch
index 348e316c..a6001b10 100644
--- a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-s=
ize-m4.patch
+++ b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-s=
ize-m4.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Pending
+
 --- iperf-2.0.5/m4/dast.m4.orig	2016-06-15 11:42:03.945581785 -0400
 +++ iperf-2.0.5/m4/dast.m4	2016-06-15 11:42:11.053581641 -0400
 @@ -11,7 +11,12 @@
diff --git a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.=
0.5_ManPage.patch b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/i=
perf-2.0.5_ManPage.patch
index 12e8f463..97cf1ff4 100755
--- a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_Man=
Page.patch
+++ b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_Man=
Page.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [arago specific]
+
 diff --git iperf-2.0.5/man/Makefile.am iperf-2.0.5/man/Makefile.am
  index ed97bc6..728873f 100644
 --- iperf-2.0.5/man/Makefile.am
diff --git a/meta-arago-test/recipes-devtools/input-utils/input-utils/000=
1-autoconf-fix-for-cross-compilation-for-ARM.patch b/meta-arago-test/reci=
pes-devtools/input-utils/input-utils/0001-autoconf-fix-for-cross-compilat=
ion-for-ARM.patch
index 72308690..075920b4 100644
--- a/meta-arago-test/recipes-devtools/input-utils/input-utils/0001-autoc=
onf-fix-for-cross-compilation-for-ARM.patch
+++ b/meta-arago-test/recipes-devtools/input-utils/input-utils/0001-autoc=
onf-fix-for-cross-compilation-for-ARM.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] autoconf: fix for cross compilation for =
ARM
 * Based on changes from Yebio Mesfin fixup the input-utils to
   cross compile for ARM.
=20
+Upstream-Status: Inappropriate [oe specific]
+
 Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
 ---
  mk/Autoconf.mk  |    8 ++++++--
diff --git a/meta-arago-test/recipes-graphics/omapdrmtest/files/0001-Make=
file.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch b/meta-arago-test/r=
ecipes-graphics/omapdrmtest/files/0001-Makefile.am-lblah-flags-belong-to-=
LDADD-not-LDFLAGS.patch
index f973500c..0adb30b7 100644
--- a/meta-arago-test/recipes-graphics/omapdrmtest/files/0001-Makefile.am=
-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch
+++ b/meta-arago-test/recipes-graphics/omapdrmtest/files/0001-Makefile.am=
-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch
@@ -3,6 +3,8 @@ From: Denys Dmytriyenko <denys@ti.com>
 Date: Wed, 4 Apr 2018 20:09:54 -0400
 Subject: [PATCH] Makefile.am: -lblah flags belong to LDADD, not LDFLAGS
=20
+Upstream-Status: Inappropriate [oe specific]
+
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
  Makefile.am | 3 +--
--=20
2.17.1


