Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.9162.1645504912193187811
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:41:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 843AA40C79
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nUg7Rv6h3PQE for <meta-arago@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 67AB440AE9
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 25EEF17476C
	for <meta-arago@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:41:51 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [PATCH 01/23] qt-provider/qt-vars: deprecate abstraction between Qt4 and Qt5
Date: Tue, 22 Feb 2022 04:41:29 +0000
Message-Id: <20220222044151.2844138-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222044151.2844138-1-denis@denix.org>
References: <20220222044151.2844138-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Qt4 has been long since deprecated, so there's no need for this abstracti=
on.
Update corresponding recipes that used these classes and variables.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/arago.conf      |  3 --
 .../conf/distro/include/branding-amsdk.inc    |  2 -
 .../packagegroups/packagegroup-arago-qte.bb   | 26 +-----------
 .../packagegroup-arago-tisdk-connectivity.bb  | 12 ------
 .../packagegroup-arago-tisdk-qte-sdk-host.bb  | 11 +----
 .../packagegroup-arago-tisdk-qte.bb           | 18 +--------
 .../ti-tisdk-makefile_1.0.bb                  |  8 ----
 meta-arago-extras/classes/qt-provider.bbclass | 13 ------
 meta-arago-extras/classes/qt-vars.bbclass     | 17 --------
 .../recipes-apps/evse-hmi/evse-hmi_git.bb     |  2 +-
 .../image-gallery/image-gallery_git.bb        |  2 +-
 .../mmwavegesture-hmi_git.bb                  |  2 +-
 .../pdm-anomaly-detection_git.bb              |  2 +-
 .../protection-relays-hmi_git.bb              |  2 +-
 .../thermostat-demo/qt-tstat_2.0.bb           | 11 ++---
 ...-opencv-opencl-opengl-multithreaded_git.bb |  2 +-
 .../matrix/matrix-gui-browser_2.0.bb          | 16 ++------
 .../recipes-core/matrix/matrix-gui_2.0.bb     | 12 +++---
 .../recipes-core/matrix/refresh-screen_2.0.bb |  5 +--
 .../meta/meta-toolchain-arago-qte.bb          |  8 +---
 ...k-packagegroup-arago-qte-toolchain-host.bb |  5 ++-
 ...packagegroup-arago-qte-toolchain-target.bb | 40 +------------------
 ...ackagegroup-arago-standalone-sdk-target.bb |  1 -
 .../dual-camera-demo/dual-camera-demo_1.0.bb  |  6 +--
 .../recipes-qt/examples/qtwebbrowser_1.0.bb   |  2 +-
 25 files changed, 34 insertions(+), 194 deletions(-)
 delete mode 100644 meta-arago-extras/classes/qt-provider.bbclass
 delete mode 100644 meta-arago-extras/classes/qt-vars.bbclass
 mode change 100755 =3D> 100644 meta-arago-extras/recipes-apps/protection=
-relays-hmi/protection-relays-hmi_git.bb

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
index bf96c54e..ed067a38 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -109,9 +109,6 @@ VIRTUAL-RUNTIME_login_manager =3D "busybox shadow"
=20
 DISTRO_FEATURES_append =3D "${@[""," systemd"][bool(d.getVar("ARAGO_SYSV=
INIT"))]}"
=20
-# Set preferred Qt version
-QT_PROVIDER ?=3D "qt5"
-
 # Distro-specific package configuration
 PACKAGECONFIG_append_pn-systemd =3D " coredump"
=20
diff --git a/meta-arago-distro/conf/distro/include/branding-amsdk.inc b/m=
eta-arago-distro/conf/distro/include/branding-amsdk.inc
index 3f3c5e44..6a4dd47b 100644
--- a/meta-arago-distro/conf/distro/include/branding-amsdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
@@ -1,7 +1,5 @@
 ARAGO_TISDK_IMAGE =3D "arago-amsdk-image"
=20
-QT_PROVIDER :=3D "${@bb.utils.contains('SOC_FAMILY','omap-a15:dra7xx','q=
t5','qt4e',d)}"
-
 PREFERRED_PROVIDER_virtual/kernel_am335x-evm =3D "sitara-linux-ti-stagin=
g"
 PREFERRED_PROVIDER_virtual/kernel_am437x-evm =3D "sitara-linux-ti-stagin=
g"
 PREFERRED_VERSION_sitara-linux-ti-staging =3D "3.14%"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-qte.bb
index bf8124da..3d69ba81 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte=
.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte=
.bb
@@ -6,27 +6,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit packagegroup
=20
-QT4_SGX_SUPPORT =3D "\
-    qt4-embedded-plugin-gfxdriver-gfxpvregl \
-    libqt-embeddedopengl4 \
-    libqt-embeddedpvrqwswsegl4 \
-"
-
-QT4_ESSENTIALS =3D "\
-    qt4-embedded \
-    qt4-embedded-plugin-mousedriver-tslib \
-    qt4-embedded-plugin-gfxdriver-gfxtransformed \
-    qt4-embedded-plugin-phonon-backend-gstreamer \
-    qt4-embedded-plugin-imageformat-gif \
-    qt4-embedded-plugin-imageformat-jpeg \
-    qt4-embedded-qml-plugins \
-    libqt-embeddedmultimedia4 \
-    libqt-embeddeddeclarative4 \
-    libqt-embeddedxmlpatterns4 \
-    ${@oe.utils.conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', '$=
{QT4_SGX_SUPPORT}', '', d)} \
-"
-
-QT5_ESSENTIALS =3D "\
+RDEPENDS_${PN} =3D "\
     qtbase-plugins \
     qtdeclarative-qmlplugins \
     qtlocation-plugins \
@@ -45,7 +25,3 @@ QT5_ESSENTIALS =3D "\
     qtconnectivity \
     qtconnectivity-qmlplugins \
 "
-
-RDEPENDS_${PN} =3D "\
-    ${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_ESSENTIALS}", "=
${QT4_ESSENTIALS}", d)} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/=
packagegroup-arago-tisdk-connectivity.bb
index 707c1bac..50c4ea25 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-connectivity.bb
@@ -51,10 +51,6 @@ BT_TI =3D "\
     bt-fw \
 "
=20
-DEMO_APPS =3D "\
-    ${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', 'wpa-gui-e', d)} \
-"
-
 #    net-snmp
 #    net-snmp-server-snmpd
 CONNECTIVITY_RDEPENDS =3D " \
@@ -69,14 +65,6 @@ CONNECTIVITY_RDEPENDS =3D " \
     ${BT_TI} \
 "
=20
-CONNECTIVITY_RDEPENDS_append_ti33x =3D "\
-    ${DEMO_APPS} \
-"
-
-CONNECTIVITY_RDEPENDS_append_ti43x =3D "\
-    ${DEMO_APPS} \
-"
-
 RDEPENDS_${PN} =3D "\
     ${CONNECTIVITY_RDEPENDS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-qte-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/=
packagegroup-arago-tisdk-qte-sdk-host.bb
index bcfa202f..d3b55e85 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-qte-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-qte-sdk-host.bb
@@ -6,15 +6,6 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit packagegroup
=20
-QT4_DEMOS =3D "\
-    ${@oe.utils.conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'q=
uick-playground-source', '', d)} \
-"
-
-QT_DEMOS =3D "\
-    qt-tstat-source \
-"
-
 RDEPENDS_${PN} =3D "\
-    ${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', "${QT4_DEMOS}", d)=
} \
-    ${QT_DEMOS} \
+    qt-tstat-source \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegr=
oup-arago-tisdk-qte.bb
index 7498dd2e..d1a9ae3c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-qte.bb
@@ -8,14 +8,9 @@ inherit packagegroup features_check
=20
 REQUIRED_MACHINE_FEATURES =3D "gpu"
=20
-QT4_DEMOS =3D "\
-    qt4-embedded-examples \
-    qt4-embedded-demos \
-    ${@oe.utils.conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'q=
uick-playground', '', d)} \
-"
-
 #    qtdeclarative-examples
-QT5_DEMOS =3D "\
+RDEPENDS_${PN} =3D "\
+    packagegroup-arago-qte \
     qtbase-examples \
     qtdeclarative-tools \
     qtlocation-examples \
@@ -25,14 +20,5 @@ QT5_DEMOS =3D "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-exampl=
es', '', d)} \
     qtserialport-examples \
     qtcharts-examples \
-"
-
-QT_DEMOS =3D "\
     qt-tstat \
 "
-
-RDEPENDS_${PN} =3D "\
-    packagegroup-arago-qte \
-    ${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_DEMOS}", "${QT4=
_DEMOS}", d)} \
-    ${QT_DEMOS} \
-"
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tis=
dk-makefile_1.0.bb
index 4474b861..30e51386 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
_1.0.bb
@@ -27,7 +27,6 @@ SRC_URI =3D "\
     file://Makefile_pru \
     file://Makefile_ti-ocf-crypto-module \
     file://Makefile_qt-tstat \
-    file://Makefile_quick-playground \
     file://Makefile_omapconf \
     file://Makefile_oprofile-example \
     file://Makefile_dual-camera-demo \
@@ -76,13 +75,9 @@ MAKEFILES_COMMON =3D "linux \
 "
 MAKEFILES =3D ""
=20
-# This example application should not be used when using non-SGX
-QUICK_PLAYGROUND =3D "${@oe.utils.conditional('ARAGO_QT_PROVIDER','qt4-e=
mbedded-gles','quick-playground','', d)}"
-
 # Add device specific make targets
=20
 MAKEFILES_append_omap3 =3D " u-boot-spl \
-                           ${QUICK_PLAYGROUND} \
 "
 MAKEFILES_append_am37x-evm =3D " av-examples \
                                ti-ocf-crypto-module \
@@ -91,7 +86,6 @@ MAKEFILES_append_am3517-evm =3D " av-examples \
                                 ti-ocf-crypto-module \
 "
 MAKEFILES_append_ti33x =3D " u-boot-spl \
-                           ${QUICK_PLAYGROUND} \
                            ti-crypto-examples \
                            linux-dtbs \
                            cryptodev \
@@ -102,7 +96,6 @@ MAKEFILES_append_ti33x =3D " u-boot-spl \
                            pdm-anomaly-detection \
 "
 MAKEFILES_append_ti43x =3D " u-boot-spl \
-                           ${QUICK_PLAYGROUND} \
                            ti-crypto-examples \
                            linux-dtbs \
                            cryptodev \
@@ -127,7 +120,6 @@ MAKEFILES_append_dra7xx =3D " cryptodev \
 "
=20
 MAKEFILES_append_omap-a15 =3D " u-boot-spl \
-                              ${QUICK_PLAYGROUND} \
                               omapconf \
                               linux-dtbs \
                               ti-sgx-ddk-km \
diff --git a/meta-arago-extras/classes/qt-provider.bbclass b/meta-arago-e=
xtras/classes/qt-provider.bbclass
deleted file mode 100644
index 40ec7a07..00000000
--- a/meta-arago-extras/classes/qt-provider.bbclass
+++ /dev/null
@@ -1,13 +0,0 @@
-# Class to handle switching between Qt4 and Qt5
-# Usage:
-# 1. Set QT_PROVIDER in distro config to either "qt4e" or "qt5"
-#    It defaults to "qt4e" when not set
-#    Hasn't been tested with "qt4x11" but should theoretically work
-# 2. Update recipes to inherit qt-provider instead of qt4e directly
-# 3. May need to use below QT_DEPENDS_* and QT_RDEPENDS_* variables
-#    instead of the actual Qt-version specific values
-
-QT_PROVIDER ?=3D "qt5"
-
-inherit ${QT_PROVIDER}
-inherit qt-vars
diff --git a/meta-arago-extras/classes/qt-vars.bbclass b/meta-arago-extra=
s/classes/qt-vars.bbclass
deleted file mode 100644
index 5a8cc798..00000000
--- a/meta-arago-extras/classes/qt-vars.bbclass
+++ /dev/null
@@ -1,17 +0,0 @@
-# Class to define many useful variables that differ between Qt4 and Qt5
-
-QT_PROVIDER ?=3D "qt5"
-
-# Build-time dependencies - those are now separate modules in Qt5 and
-# require separate dependencies, unlike Qt4 that provides everything
-# in a single qt4-embedded/qt4-x11 recipe
-QT_DEPENDS_BASE =3D "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'qtba=
se', 'qt4-embedded', d)}"
-QT_DEPENDS_WEBKIT =3D "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'qt=
webkit', '', d)}"
-QT_DEPENDS_SVG =3D "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'qtsvg=
', '', d)}"
-QT_DEPENDS_SCRIPT =3D "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'qt=
script', '', d)}"
-QT_DEPENDS_WEBENGINE =3D "${@oe.utils.conditional('QT_PROVIDER', 'qt5', =
'qtwebengine', '', d)}"
-
-# Run-time dependencies
-QT_RDEPENDS_FONTS =3D "${@oe.utils.conditional('QT_PROVIDER', 'qt5', '',=
 'qt4-embedded-fonts', d)}"
-QT_RDEPENDS_NATIVESDK_TOOLS =3D "${@oe.utils.conditional('QT_PROVIDER', =
'qt5', 'nativesdk-qtbase nativesdk-qttools', 'nativesdk-qt4-tools', d)}"
-QT_RDEPENDS_MKSPECS =3D "${@oe.utils.conditional('QT_PROVIDER', 'qt5', '=
qtbase-mkspecs', 'qt4-embedded-mkspecs', d)}"
diff --git a/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb b/me=
ta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
index e2d7b882..a5083999 100644
--- a/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
+++ b/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "HMI demo for electronic vehicle charging sta=
tion (EVSE) using QT QWid
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://main.cpp;beginline=3D1;endline=3D33;md5=3Da=
9cde3921a8be42ed79ab74661799104"
=20
-inherit qt-provider
+inherit qt5
=20
 PV =3D "1.0"
 PR =3D "r1"
diff --git a/meta-arago-extras/recipes-apps/image-gallery/image-gallery_g=
it.bb b/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
index 26a567bc..2a9750da 100644
--- a/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
+++ b/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9c57cc1cdee589=
f97cbba69e95a89a15"
=20
 require recipes-core/matrix/matrix-gui-paths.inc
=20
-inherit qt-provider
+inherit qt5
=20
 PR =3D "r5"
=20
diff --git a/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegestu=
re-hmi_git.bb b/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavege=
sture-hmi_git.bb
index ff6b02a8..d5f9e43c 100644
--- a/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_=
git.bb
+++ b/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_=
git.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Gesture baed HMI demo using mmWave IWR1642 c=
hip and Sitara AM device"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://main.cpp;beginline=3D1;endline=3D33;md5=3De=
7e749ff1989b18db836e5d9910a37e9"
=20
-inherit qt-provider
+inherit qt5
=20
 PV =3D "1.0"
 PR =3D "r0"
diff --git a/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-ano=
maly-detection_git.bb b/meta-arago-extras/recipes-apps/pdm-anomaly-detect=
ion/pdm-anomaly-detection_git.bb
index 266cabd9..e4f43f1d 100644
--- a/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-de=
tection_git.bb
+++ b/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-de=
tection_git.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Predictive maintenance demo for anomaly dete=
ction using Recurrent Neu
 LICENSE =3D "BSD-3-Clause & MIT & GPLv3"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De88016d2cbc82d0d2efbb0865891e=
9d6"
=20
-inherit qt-provider
+inherit qt5
=20
 PV =3D "1.0"
 PR =3D "r2"
diff --git a/meta-arago-extras/recipes-apps/protection-relays-hmi/protect=
ion-relays-hmi_git.bb b/meta-arago-extras/recipes-apps/protection-relays-=
hmi/protection-relays-hmi_git.bb
old mode 100755
new mode 100644
index a0c7321f..018859e0
--- a/meta-arago-extras/recipes-apps/protection-relays-hmi/protection-rel=
ays-hmi_git.bb
+++ b/meta-arago-extras/recipes-apps/protection-relays-hmi/protection-rel=
ays-hmi_git.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "HMI demo for Protection Relays using QT  too=
ls"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://main.cpp;beginline=3D1;endline=3D33;md5=3Da=
9cde3921a8be42ed79ab74661799104"
=20
-inherit qt-provider
+inherit qt5
=20
 PV =3D "1.0"
 PR =3D "r0"
diff --git a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.=
bb b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
index ba96fa60..a0f2c937 100644
--- a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
+++ b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
@@ -10,11 +10,11 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D93a105adb9=
9011afa5baee932b560714 \
=20
 require recipes-core/matrix/matrix-gui-paths.inc
=20
-inherit qt-provider
+inherit qt5
=20
 PR =3D "r10"
=20
-DEPENDS +=3D "${QT_DEPENDS_SVG} ${QT_DEPENDS_SCRIPT}"
+DEPENDS +=3D "qtsvg qtscript"
=20
 BRANCH ?=3D "master"
 SRCREV =3D "665bff9a7bc0dbf82f9d6a58ff2778c03fe04fd1"
@@ -23,19 +23,16 @@ SRC_URI =3D "git://git.ti.com/apps/thermostat-demo.gi=
t;protocol=3Dgit;branch=3D${BRANC
=20
 S =3D "${WORKDIR}/git"
=20
-DESKTOP_FILE =3D "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'thermos=
tat_demo_qt5.desktop', 'thermostat_demo.desktop', d)}"
-
-
 do_install() {
 	install -d ${D}/usr/bin
 	install -m 0755 ${B}/ThermostatDemo ${D}/usr/bin/ThermostatDemo
 	install -d ${D}${MATRIX_APP_DIR}/qt_tstat
 	install ${S}/matrix-files/desc_thermostat_demo.html  ${D}${MATRIX_APP_D=
IR}/qt_tstat
-	install ${S}/matrix-files/${DESKTOP_FILE}  ${D}${MATRIX_APP_DIR}/qt_tst=
at/thermostat_demo.desktop
+	install ${S}/matrix-files/thermostat_demo_qt5.desktop  ${D}${MATRIX_APP=
_DIR}/qt_tstat/thermostat_demo.desktop
 }
=20
 PACKAGES +=3D "matrix-gui-thermostat-demo"
=20
-RDEPENDS_matrix-gui-thermostat-demo +=3D "matrix-gui-apps-images ${@oe.u=
tils.conditional('QT_PROVIDER', 'qt5', 'matrix-gui-submenus-qt5', 'matrix=
-gui-submenus-qt4', d)}"
+RDEPENDS_matrix-gui-thermostat-demo +=3D "matrix-gui-apps-images matrix-=
gui-submenus-qt5"
=20
 FILES_matrix-gui-thermostat-demo +=3D "${MATRIX_APP_DIR}/*"
diff --git a/meta-arago-extras/recipes-apps/video-analytics-demo/qt-openc=
v-opencl-opengl-multithreaded_git.bb b/meta-arago-extras/recipes-apps/vid=
eo-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
index 7d2fb51c..9a25e911 100644
--- a/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-openc=
l-opengl-multithreaded_git.bb
+++ b/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-openc=
l-opengl-multithreaded_git.bb
@@ -23,7 +23,7 @@ SRCREV =3D "80051ec8befd921e40cfb74a49234ed045576bbc"
=20
 S =3D "${WORKDIR}/git"
=20
-inherit qt-provider
+inherit qt5
=20
 export TARGET_ROOTDIR =3D "${STAGING_DIR_HOST}"
 export TI_OCL_CGT_INSTALL =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6=
x"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0=
.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
index 44f66d0d..c9440628 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
@@ -3,24 +3,14 @@ LICENSE =3D "BSD"
 LIC_FILES_CHKSUM =3D "file://main.cpp;beginline=3D9;endline=3D37;md5=3D7=
5a9adc782a6df0d3a5419743e9a9f18"
 SECTION =3D "multimedia"
=20
-inherit qt-provider
+inherit qt5
=20
-# Make sure that QT font libraries have been installed
-RDEPENDS_${PN} +=3D "${QT_RDEPENDS_FONTS}"
-
-DEPENDS +=3D "${QT_DEPENDS_WEBKIT}"
-#DEPENDS_k3 +=3D "${QT_DEPENDS_WEBKIT}"
-#DEPENDS_remove_k3 =3D "${QT_DEPENDS_WEBENGINE}"
+DEPENDS +=3D "qtwebkit"
=20
 PR =3D "r17"
=20
-QT4_SRCREV =3D "83019b46fb3dec1a12667d251d35ba8682953a79"
-QT5_SRCREV =3D "78ad5db716d1abc4c05abfe435f066b6b88454d5"
-#QT5_SRCREV =3D "d3ecf8d0dff3e4f901d588ea0dfe485733dfc9dc"
-#QT5_SRCREV_k3 =3D "78ad5db716d1abc4c05abfe435f066b6b88454d5"
-
+SRCREV =3D "78ad5db716d1abc4c05abfe435f066b6b88454d5"
=20
-SRCREV =3D "${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_SRCREV}=
", "${QT4_SRCREV}", d)}"
 BRANCH ?=3D "master"
=20
 SRC_URI =3D "git://git.ti.com/matrix-gui-v2/matrix_browser.git;protocol=3D=
git;branch=3D${BRANCH}"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/me=
ta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index b9c0637c..4c9c5386 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -16,22 +16,24 @@ inherit systemd
 BRANCH ?=3D "master"
 SRCREV =3D "9a2d12590102fefc5c29fc9e8d346ce6b0198468"
=20
-MATRIX_INITSCRIPT =3D "${@oe.utils.conditional('QT_PROVIDER', 'qt5', bb.=
utils.contains('DISTRO_FEATURES', 'wayland', 'init', 'init.eglfs', d), 'i=
nit', d)}"
+MATRIX_INITSCRIPT =3D "${@bb.utils.contains('DISTRO_FEATURES', 'wayland'=
, 'init', 'init.eglfs', d)}"
=20
 SRC_URI =3D "git://git.ti.com/matrix-gui-v2/matrix-gui-v2.git;protocol=3D=
git;branch=3D${BRANCH} \
            file://${MATRIX_INITSCRIPT} \
            file://php.ini \
            file://matrix-gui-2.0.service \
-           ${@oe.utils.conditional('QT_PROVIDER', 'qt5', bb.utils.contai=
ns('DISTRO_FEATURES', 'wayland', '', 'file://0001-execute_command-Stop-ma=
trix-when-running-a-GUI-demo.patch', d), '', d)} \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'file://00=
01-execute_command-workaround-for-GUI-apps-with-weston.patch', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', \
+                'file://0001-execute_command-workaround-for-GUI-apps-wit=
h-weston.patch', \
+                'file://0001-execute_command-Stop-matrix-when-running-a-=
GUI-demo.patch', d)} \
 "
=20
 require matrix-gui-paths.inc
=20
 S =3D "${WORKDIR}/git"
=20
-MATRIX_FLAGS =3D "${@oe.utils.conditional('QT_PROVIDER','qt5','','-qws',=
d)}"
-SWITCH_FOREGROUND_VT =3D "${@oe.utils.conditional('QT_PROVIDER','qt5',''=
,'chvt 4',d)}"
+MATRIX_FLAGS =3D ""
+SWITCH_FOREGROUND_VT =3D ""
+
 do_install(){
 	install -d ${D}${MATRIX_BASE_DIR}
 	install -d ${D}${MATRIX_WEB_DIR}
diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb =
b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
index 9e214f42..10dfada9 100644
--- a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
@@ -3,10 +3,7 @@ LICENSE =3D "BSD"
 LIC_FILES_CHKSUM =3D "file://main.cpp;beginline=3D9;endline=3D37;md5=3D7=
5a9adc782a6df0d3a5419743e9a9f18"
 SECTION =3D "multimedia"
=20
-inherit qt-provider
-
-# Make sure that QT font libraries have been installed
-RDEPENDS_${PN} +=3D "${QT_RDEPENDS_FONTS}"
+inherit qt5
=20
 PR =3D "r9"
=20
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte=
.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
index d3139398..f0cefb0d 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
@@ -7,12 +7,8 @@ require meta-toolchain-arago.bb
=20
 PR =3D "r20"
=20
-# There could be qt5, qt4e and qt4x11 providers, but we don't support qt=
4x11 for now
-QT_DIR_NAME =3D "${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', 'qtop=
ia', d)}"
-QT_BIN_PREFIX =3D "${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', '',=
 d)}"
-QT_BIN_SUFFIX =3D "${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', '4'=
, d)}"
-QT_MKSPECS_LOCATION =3D "${@oe.utils.conditional('QT_PROVIDER', 'qt5', "=
${libdir}", "${datadir}", d)}"
-QT_MKSPECS_DIR =3D "${@oe.utils.conditional('QT_PROVIDER', 'qt5', "linux=
-oe-g++", "linux-gnueabi-oe-g++", d)}"
+QT_MKSPECS_LOCATION =3D "${libdir}"
+QT_MKSPECS_DIR =3D "linux-oe-g++"
=20
 toolchain_create_sdk_env_script_append() {
 	echo 'export PATH=3D$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_DIR_NAME}:=
$PATH' >> $script
diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packa=
gegroup-arago-qte-toolchain-host.bb b/meta-arago-extras/recipes-core/pack=
agegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
index dbf9038d..1498f70d 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup=
-arago-qte-toolchain-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup=
-arago-qte-toolchain-host.bb
@@ -2,9 +2,10 @@ DESCRIPTION =3D "Host packages for Qt Embedded SDK"
 PR =3D "r10"
 LICENSE =3D "MIT"
=20
-inherit packagegroup qt-vars nativesdk
+inherit packagegroup nativesdk
=20
 RDEPENDS_${PN} =3D "\
     nativesdk-packagegroup-arago-tisdk-host \
-    ${QT_RDEPENDS_NATIVESDK_TOOLS} \
+    nativesdk-qtbase \
+    nativesdk-qttools \
     "
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-ar=
ago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroup=
s/packagegroup-arago-qte-toolchain-target.bb
index c40b4532..f14877e0 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte=
-toolchain-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte=
-toolchain-target.bb
@@ -7,41 +7,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit packagegroup
=20
-QT4_SGX_SUPPORT =3D "\
-        libqt-embeddedopengl4-dev \
-        libqt-embeddedpvrqwswsegl4-dev \
-"
-
-QT4_DEV =3D " \
-        packagegroup-arago-standalone-sdk-target \
-        qt4-embedded-mkspecs \
-        libqt-embeddedmultimedia4-dev \
-        libqt-embeddedphonon4-dev \
-        libqt-embedded3support4-dev \
-        libqt-embeddedclucene4-dev \
-        libqt-embeddedcore4-dev \
-        libqt-embeddeddbus4-dev \
-        libqt-embeddeddesignercomponents4-dev \
-        libqt-embeddeddesigner4-dev \
-        libqt-embeddeduitools4-dev \
-        libqt-embeddedgui4-dev \
-        libqt-embeddedhelp4-dev \
-        libqt-embeddednetwork4-dev \
-        libqt-embeddedscript4-dev \
-        libqt-embeddedscripttools4-dev \
-        libqt-embeddedsql4-dev \
-        libqt-embeddedsvg4-dev \
-        libqt-embeddedtest4-dev \
-        libqt-embeddedwebkit4-dev \
-        libqt-embeddedxml4-dev \
-        libsqlite3-dev \
-        libqt-embeddedxmlpatterns4-dev \
-        libqt-embeddedmultimedia4-dev \
-        libqt-embeddeddeclarative4-dev \
-        ${@oe.utils.conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles'=
,'${QT4_SGX_SUPPORT}', '', d)} \
-"
-
-QT5_DEV =3D " \
+RDEPENDS_${PN} +=3D " \
         packagegroup-arago-standalone-sdk-target \
         libsqlite3-dev \
         qtbase-mkspecs \
@@ -69,7 +35,3 @@ QT5_DEV =3D " \
         qtcharts-mkspecs \
         qtcharts-dev \
 "
-
-RDEPENDS_${PN} +=3D " \
-        ${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_DEV}", "${Q=
T4_DEV}", d)} \
-"
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-ar=
ago-standalone-sdk-target.bb b/meta-arago-extras/recipes-core/packagegrou=
ps/packagegroup-arago-standalone-sdk-target.bb
index 2a1d29b6..936ed17c 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-sta=
ndalone-sdk-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-sta=
ndalone-sdk-target.bb
@@ -26,7 +26,6 @@ RDEPENDS_${PN} =3D "\
     opkg-dev \
     libpng-dev \
     readline-dev \
-    ${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', 'tslib-dev', d)} \
     libusb-compat-dev \
     libusb1-dev \
     zlib-dev \
diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-c=
amera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo=
/dual-camera-demo_1.0.bb
index 66746793..eaa52a7b 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-d=
emo_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-d=
emo_1.0.bb
@@ -21,9 +21,7 @@ SRC_URI =3D "git://git.ti.com/sitara-linux/dual-camera-=
demo.git;protocol=3Dgit;branc
=20
 S =3D "${WORKDIR}/git"
=20
-DEMO_SCRIPT =3D "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'dual_cam=
era_qt5.sh', 'dual_camera_qt4.sh', d)}"
-
-inherit qt-provider
+inherit qt5
=20
 export SDK_PATH_TARGET=3D'${STAGING_DIR_HOST}'
=20
@@ -32,7 +30,7 @@ do_install() {
     install -d ${D}/usr/bin
     install -d ${D}${MATRIX_APP_DIR}/dual-camera
     install dual_camera ${D}/usr/bin/dual_camera
-    install ${WORKDIR}/${DEMO_SCRIPT} ${D}/usr/bin/dual_camera.sh
+    install ${WORKDIR}/dual_camera_qt5.sh ${D}/usr/bin/dual_camera.sh
     install ${WORKDIR}/desc_dual-camera.html ${D}/${MATRIX_APP_DIR}/dual=
-camera
     install ${WORKDIR}/dual-camera.desktop ${D}/${MATRIX_APP_DIR}/dual-c=
amera
 }
diff --git a/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb b/=
meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb
index c32ec22c..59372b05 100644
--- a/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb
+++ b/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb
@@ -20,7 +20,7 @@ SRC_URI =3D "git://code.qt.io/qt-apps/qtwebbrowser.git;=
protocol=3Dgit;branch=3D${BRANC
=20
 S =3D "${WORKDIR}/git"
=20
-inherit qt-provider
+inherit qt5
=20
 # Install qtwebbrowser under /usr/bin
 do_install() {
--=20
2.25.1

