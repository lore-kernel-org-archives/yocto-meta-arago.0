Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id C8DC052972
	for <meta-arago@arago-project.org>;
	Sun,  3 Aug 2014 20:44:52 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.89])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N9R00LI00ACMKN0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 03 Aug 2014 15:44:42 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3647F21CF8; Sat,
	02 Aug 2014 21:10:25 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 02 Aug 2014 21:10:20 -0400
Message-id: <1407028221-9762-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.2
In-reply-to: <1407028221-9762-1-git-send-email-denis@denix.org>
References: <1407028221-9762-1-git-send-email-denis@denix.org>
Subject: [PATCH 4/5] packagegroups, images: combine qt4e and qt5 recipes to avoid confusion
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
X-List-Received-Date: Sun, 03 Aug 2014 20:44:53 -0000

From: Denys Dmytriyenko <denys@ti.com>

It was started as a fix to prevent qt4-embedded from being pulled into the
build when building qt5 and would have required creating empty qt5-specific
packagegroup-arago-tisdk-qt5-sdk-host recipe. Unification was in order.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/arago-qt5-test-image.bb    | 19 -----------
 .../recipes-core/images/tisdk-rootfs-image.bb      |  2 +-
 .../packagegroups/packagegroup-arago-qt5.bb        | 15 ---------
 .../packagegroups/packagegroup-arago-qte.bb        | 20 ++++++++---
 .../packagegroups/packagegroup-arago-tisdk-qt5.bb  | 18 ----------
 .../packagegroup-arago-tisdk-qte-sdk-host.bb       |  8 +++--
 .../packagegroups/packagegroup-arago-tisdk-qte.bb  | 15 +++++++--
 .../packagegroups/packagegroup-linaro-tc-test.bb   | 24 +++++++++++++
 .../packagegroup-arago-qt5-toolchain-target.bb     | 33 ------------------
 .../packagegroup-arago-qte-toolchain-target.bb     | 39 ++++++++++++++++++----
 10 files changed, 92 insertions(+), 101 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/images/arago-qt5-test-image.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qt5.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qt5.bb
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-linaro-tc-test.bb
 delete mode 100644 meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qt5-toolchain-target.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-qt5-test-image.bb b/meta-arago-distro/recipes-core/images/arago-qt5-test-image.bb
deleted file mode 100644
index 5fbbfd3..0000000
--- a/meta-arago-distro/recipes-core/images/arago-qt5-test-image.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-# Arago Qt5 test image
-# gives you an image with Qt5 for basic testing purposes.
-
-require arago-image.inc
-inherit remove-net-rules
-
-IMAGE_INSTALL += "\
-    packagegroup-arago-base \
-    packagegroup-arago-console \
-    packagegroup-arago-base-tisdk \
-    qtbase-plugins \
-    qt-tstat \
-    "
-
-# These are now disabled due to gles dependency
-#    matrix-gui-browser
-#    qtwebkit-examples-examples
-
-export IMAGE_BASENAME = "arago-qt5-test-image"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index 649dfe3..1bc6a36 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -5,7 +5,7 @@ require arago-base-tisdk-image.bb
 IMAGE_INSTALL += "\
     packagegroup-arago-test \
     ${@base_contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics','',d)} \
-    ${@base_conditional('QT_PROVIDER','qt5','packagegroup-arago-tisdk-qt5','packagegroup-arago-tisdk-qte',d)} \
+    packagegroup-arago-tisdk-qte \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qt5.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qt5.bb
deleted file mode 100644
index ff0f3ed..0000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qt5.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Task to add Qt embedded related packages"
-LICENSE = "MIT"
-PR = "r0"
-
-inherit packagegroup
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-RDEPENDS_${PN} = "\
-    qtbase-plugins \
-    qtdeclarative-plugins \
-    qtlocation-plugins \
-    qtmultimedia-plugins \
-    qtwayland-plugins \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
index 0ce08db..b2dd546 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
@@ -1,18 +1,18 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
-PR = "r4"
+PR = "r5"
 
 inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-QT_SGX_SUPPORT = "\
+QT4_SGX_SUPPORT = "\
     qt4-embedded-plugin-gfxdriver-gfxpvregl \
     libqt-embeddedopengl4 \
     libqt-embeddedpvrqwswsegl4 \
 "
 
-RDEPENDS_${PN} = "\
+QT4_ESSENTIALS = "\
     qt4-embedded \
     qt4-embedded-plugin-mousedriver-tslib \
     qt4-embedded-plugin-gfxdriver-gfxtransformed \
@@ -23,5 +23,17 @@ RDEPENDS_${PN} = "\
     libqt-embeddedmultimedia4 \
     libqt-embeddeddeclarative4 \
     libqt-embeddedxmlpatterns4 \
-    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', '${QT_SGX_SUPPORT}', '', d)} \
+    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', '${QT4_SGX_SUPPORT}', '', d)} \
+"
+
+QT5_ESSENTIALS = "\
+    qtbase-plugins \
+    qtdeclarative-plugins \
+    qtlocation-plugins \
+    qtmultimedia-plugins \
+    qtwayland-plugins \
+"
+
+RDEPENDS_${PN} = "\
+    ${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_ESSENTIALS}", "${QT4_ESSENTIALS}", d)} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qt5.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qt5.bb
deleted file mode 100644
index 9ce43e6..0000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qt5.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "Task to add Qt embedded related packages"
-LICENSE = "MIT"
-PR = "r0"
-
-inherit packagegroup
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-QT_DEMOS = "\
-    qtwayland-examples \
-    qtwebkit-examples-examples \
-    qt-tstat \
-"
-
-RDEPENDS_${PN} = "\
-    packagegroup-arago-qt5 \
-    ${QT_DEMOS} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
index 4cb85fe..3615cd4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
@@ -1,16 +1,20 @@
 DESCRIPTION = "Task to add Qt embedded related sources into the sdk"
 LICENSE = "MIT"
-PR = "r3"
+PR = "r4"
 
 inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+QT4_DEMOS = "\
+    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground-src', '', d)} \
+"
+
 QT_DEMOS = "\
     qt-tstat-src \
-    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground-src', '', d)} \
 "
 
 RDEPENDS_${PN} = "\
+    ${@base_conditional('QT_PROVIDER', 'qt5', '', "${QT4_DEMOS}", d)} \
     ${QT_DEMOS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index 10187a6..e745a08 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -1,19 +1,28 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
-PR = "r4"
+PR = "r5"
 
 inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-QT_DEMOS = "\
+QT4_DEMOS = "\
     qt4-embedded-examples \
     qt4-embedded-demos \
-    qt-tstat \
     ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground', '', d)} \
 "
 
+QT5_DEMOS = "\
+    qtwayland-examples \
+    qtwebkit-examples-examples \
+"
+
+QT_DEMOS = "\
+    qt-tstat \
+"
+
 RDEPENDS_${PN} = "\
     packagegroup-arago-qte \
+    ${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_DEMOS}", "${QT4_DEMOS}", d)} \
     ${QT_DEMOS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-linaro-tc-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-linaro-tc-test.bb
new file mode 100644
index 0000000..8fd863e
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-linaro-tc-test.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Group of packages to build with Linaro toolchain for testing"
+LICENSE = "MIT"
+
+inherit packagegroup
+
+RDEPENDS_${PN} = "\
+    virtual/kernel \
+    u-boot \
+    busybox \
+    bash \
+    coreutils \
+    apache \
+    wayland \
+    weston \
+    gstreamer \
+    openssl \
+    openssh \
+    perl \
+    python \
+    php \
+    qt4-embedded \
+    qtbase \
+    qtwebkit \
+    "
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qt5-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qt5-toolchain-target.bb
deleted file mode 100644
index 7e0d12c..0000000
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qt5-toolchain-target.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION = "Target packages for Qt5 SDK"
-LICENSE = "MIT"
-
-PR = "r1"
-
-inherit packagegroup
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-RDEPENDS_${PN} += " \
-        packagegroup-arago-standalone-sdk-target \
-        libsqlite3-dev \
-        qtbase-mkspecs \
-        qtdeclarative-mkspecs \
-        qtscript-mkspecs \
-        qtwebkit-mkspecs \
-        qt3d-mkspecs \
-        qtlocation-mkspecs \
-        qtsensors-mkspecs \
-        qtsvg-mkspecs \
-        qtjsbackend-mkspecs \
-        qtxmlpatterns-mkspecs \
-        qtbase-dev \
-        qtdeclarative-dev \
-        qtscript-dev \
-        qtwebkit-dev \
-        qt3d-dev \
-        qtlocation-dev \
-        qtsensors-dev \
-        qtsvg-dev \
-        qtjsbackend-dev \
-        qtxmlpatterns-dev \
-"
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
index 796e7c3..acba6c8 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
@@ -1,18 +1,18 @@
 DESCRIPTION = "Target packages for Qt Embedded SDK"
 LICENSE = "MIT"
 
-PR = "r6"
+PR = "r7"
 
 inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-QT_SGX_SUPPORT = "\
-    libqt-embeddedopengl4-dev \
-    libqt-embeddedpvrqwswsegl4-dev \
+QT4_SGX_SUPPORT = "\
+        libqt-embeddedopengl4-dev \
+        libqt-embeddedpvrqwswsegl4-dev \
 "
 
-RDEPENDS_${PN} += " \
+QT4_DEV = " \
         packagegroup-arago-standalone-sdk-target \
         qt4-embedded-mkspecs \
         libqt-embeddedmultimedia4-dev \
@@ -38,5 +38,32 @@ RDEPENDS_${PN} += " \
         libqt-embeddedxmlpatterns4-dev \
         libqt-embeddedmultimedia4-dev \
         libqt-embeddeddeclarative4-dev \
-        ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles','${QT_SGX_SUPPORT}', '', d)} \
+        ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles','${QT4_SGX_SUPPORT}', '', d)} \
+"
+
+QT5_DEV = " \
+        packagegroup-arago-standalone-sdk-target \
+        libsqlite3-dev \
+        qtbase-mkspecs \
+        qtdeclarative-mkspecs \
+        qtscript-mkspecs \
+        qtwebkit-mkspecs \
+        qt3d-mkspecs \
+        qtlocation-mkspecs \
+        qtsensors-mkspecs \
+        qtsvg-mkspecs \
+        qtxmlpatterns-mkspecs \
+        qtbase-dev \
+        qtdeclarative-dev \
+        qtscript-dev \
+        qtwebkit-dev \
+        qt3d-dev \
+        qtlocation-dev \
+        qtsensors-dev \
+        qtsvg-dev \
+        qtxmlpatterns-dev \
+"
+
+RDEPENDS_${PN} += " \
+        ${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_DEV}", "${QT4_DEV}", d)} \
 "
-- 
2.0.2


