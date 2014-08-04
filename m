Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1EF3852996
	for <meta-arago@arago-project.org>;
	Mon,  4 Aug 2014 13:48:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s74DmpOV012366;
	Mon, 4 Aug 2014 08:48:51 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s74DmoAT019095;
	Mon, 4 Aug 2014 08:48:51 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Mon, 4 Aug 2014 08:48:50 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 4/5] packagegroups, images: combine qt4e
	and qt5 recipes to avoid confusion
Thread-Index: AQHPr1vLICeyQEa3PkeInvLG1ojpQJvAdtgA
Date: Mon, 4 Aug 2014 13:48:49 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D198B54@DLEE11.ent.ti.com>
References: <1407028221-9762-1-git-send-email-denis@denix.org>
	<1407028221-9762-4-git-send-email-denis@denix.org>
In-Reply-To: <1407028221-9762-4-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 4/5] packagegroups, images: combine qt4e and qt5 recipes to avoid confusion
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
X-List-Received-Date: Mon, 04 Aug 2014 13:48:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Saturday, August 02, 2014 8:10 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 4/5] packagegroups, images: combine
>qt4e and qt5 recipes to avoid confusion
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>It was started as a fix to prevent qt4-embedded from being pulled
>into the
>build when building qt5 and would have required creating empty
>qt5-specific
>packagegroup-arago-tisdk-qt5-sdk-host recipe. Unification was in
>order.
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../recipes-core/images/arago-qt5-test-image.bb    | 19 ---------
>--
> .../recipes-core/images/tisdk-rootfs-image.bb      |  2 +-
> .../packagegroups/packagegroup-arago-qt5.bb        | 15 ---------
> .../packagegroups/packagegroup-arago-qte.bb        | 20 ++++++++-
>--
> .../packagegroups/packagegroup-arago-tisdk-qt5.bb  | 18 ---------
>-
> .../packagegroup-arago-tisdk-qte-sdk-host.bb       |  8 +++--
> .../packagegroups/packagegroup-arago-tisdk-qte.bb  | 15 +++++++--
> .../packagegroups/packagegroup-linaro-tc-test.bb   | 24
>+++++++++++++
> .../packagegroup-arago-qt5-toolchain-target.bb     | 33 ---------
>---------
> .../packagegroup-arago-qte-toolchain-target.bb     | 39
>++++++++++++++++++----
> 10 files changed, 92 insertions(+), 101 deletions(-)
> delete mode 100644 meta-arago-distro/recipes-core/images/arago-
>qt5-test-image.bb
> delete mode 100644 meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-qt5.bb
> delete mode 100644 meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-tisdk-qt5.bb
> create mode 100644 meta-arago-distro/recipes-
>core/packagegroups/packagegroup-linaro-tc-test.bb
> delete mode 100644 meta-arago-extras/recipes-
>core/packagegroups/packagegroup-arago-qt5-toolchain-target.bb
>
>diff --git a/meta-arago-distro/recipes-core/images/arago-qt5-test-
>image.bb b/meta-arago-distro/recipes-core/images/arago-qt5-test-
>image.bb
>deleted file mode 100644
>index 5fbbfd3..0000000
>--- a/meta-arago-distro/recipes-core/images/arago-qt5-test-
>image.bb
>+++ /dev/null
>@@ -1,19 +0,0 @@
>-# Arago Qt5 test image
>-# gives you an image with Qt5 for basic testing purposes.
>-
>-require arago-image.inc
>-inherit remove-net-rules
>-
>-IMAGE_INSTALL +=3D "\
>-    packagegroup-arago-base \
>-    packagegroup-arago-console \
>-    packagegroup-arago-base-tisdk \
>-    qtbase-plugins \
>-    qt-tstat \
>-    "
>-
>-# These are now disabled due to gles dependency
>-#    matrix-gui-browser
>-#    qtwebkit-examples-examples
>-
>-export IMAGE_BASENAME =3D "arago-qt5-test-image"
>diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-
>image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-
>image.bb
>index 649dfe3..1bc6a36 100644
>--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
>+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
>@@ -5,7 +5,7 @@ require arago-base-tisdk-image.bb
> IMAGE_INSTALL +=3D "\
>     packagegroup-arago-test \
>     ${@base_contains('MACHINE_FEATURES','sgx','packagegroup-
>arago-tisdk-graphics','',d)} \
>-    ${@base_conditional('QT_PROVIDER','qt5','packagegroup-arago-
>tisdk-qt5','packagegroup-arago-tisdk-qte',d)} \
>+    packagegroup-arago-tisdk-qte \
>     packagegroup-arago-tisdk-addons \
>     packagegroup-arago-tisdk-connectivity \
>     packagegroup-arago-tisdk-crypto \
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-qt5.bb b/meta-arago-
>distro/recipes-core/packagegroups/packagegroup-arago-qt5.bb
>deleted file mode 100644
>index ff0f3ed..0000000
>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-qt5.bb
>+++ /dev/null
>@@ -1,15 +0,0 @@
>-DESCRIPTION =3D "Task to add Qt embedded related packages"
>-LICENSE =3D "MIT"
>-PR =3D "r0"
>-
>-inherit packagegroup
>-
>-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>-
>-RDEPENDS_${PN} =3D "\
>-    qtbase-plugins \
>-    qtdeclarative-plugins \
>-    qtlocation-plugins \
>-    qtmultimedia-plugins \
>-    qtwayland-plugins \
>-"
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-
>distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
>index 0ce08db..b2dd546 100644
>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-qte.bb
>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-qte.bb
>@@ -1,18 +1,18 @@
> DESCRIPTION =3D "Task to add Qt embedded related packages"
> LICENSE =3D "MIT"
>-PR =3D "r4"
>+PR =3D "r5"
>
> inherit packagegroup
>
> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>
>-QT_SGX_SUPPORT =3D "\
>+QT4_SGX_SUPPORT =3D "\
>     qt4-embedded-plugin-gfxdriver-gfxpvregl \
>     libqt-embeddedopengl4 \
>     libqt-embeddedpvrqwswsegl4 \
> "
>
>-RDEPENDS_${PN} =3D "\
>+QT4_ESSENTIALS =3D "\
>     qt4-embedded \
>     qt4-embedded-plugin-mousedriver-tslib \
>     qt4-embedded-plugin-gfxdriver-gfxtransformed \
>@@ -23,5 +23,17 @@ RDEPENDS_${PN} =3D "\
>     libqt-embeddedmultimedia4 \
>     libqt-embeddeddeclarative4 \
>     libqt-embeddedxmlpatterns4 \
>-    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles',
>'${QT_SGX_SUPPORT}', '', d)} \
>+    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles',
>'${QT4_SGX_SUPPORT}', '', d)} \
>+"
>+
>+QT5_ESSENTIALS =3D "\
>+    qtbase-plugins \
>+    qtdeclarative-plugins \
>+    qtlocation-plugins \
>+    qtmultimedia-plugins \
>+    qtwayland-plugins \
>+"
>+
>+RDEPENDS_${PN} =3D "\
>+    ${@base_conditional('QT_PROVIDER', 'qt5',
>"${QT5_ESSENTIALS}", "${QT4_ESSENTIALS}", d)} \
> "
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-tisdk-qt5.bb b/meta-arago-
>distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qt5.bb
>deleted file mode 100644
>index 9ce43e6..0000000
>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-qt5.bb
>+++ /dev/null
>@@ -1,18 +0,0 @@
>-DESCRIPTION =3D "Task to add Qt embedded related packages"
>-LICENSE =3D "MIT"
>-PR =3D "r0"
>-
>-inherit packagegroup
>-
>-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>-
>-QT_DEMOS =3D "\
>-    qtwayland-examples \
>-    qtwebkit-examples-examples \
>-    qt-tstat \
>-"
>-
>-RDEPENDS_${PN} =3D "\
>-    packagegroup-arago-qt5 \
>-    ${QT_DEMOS} \
>-"
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
>b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
>tisdk-qte-sdk-host.bb
>index 4cb85fe..3615cd4 100644
>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-qte-sdk-host.bb
>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-qte-sdk-host.bb
>@@ -1,16 +1,20 @@
> DESCRIPTION =3D "Task to add Qt embedded related sources into the
>sdk"
> LICENSE =3D "MIT"
>-PR =3D "r3"
>+PR =3D "r4"
>
> inherit packagegroup
>
> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>
>+QT4_DEMOS =3D "\
>+    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles',
>'quick-playground-src', '', d)} \
>+"
>+
> QT_DEMOS =3D "\
>     qt-tstat-src \
>-    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles',
>'quick-playground-src', '', d)} \
> "
>
> RDEPENDS_${PN} =3D "\
>+    ${@base_conditional('QT_PROVIDER', 'qt5', '', "${QT4_DEMOS}",
>d)} \
>     ${QT_DEMOS} \
> "
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-
>distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
>index 10187a6..e745a08 100644
>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-qte.bb
>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-qte.bb
>@@ -1,19 +1,28 @@
> DESCRIPTION =3D "Task to add Qt embedded related packages"
> LICENSE =3D "MIT"
>-PR =3D "r4"
>+PR =3D "r5"
>
> inherit packagegroup
>
> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>
>-QT_DEMOS =3D "\
>+QT4_DEMOS =3D "\
>     qt4-embedded-examples \
>     qt4-embedded-demos \
>-    qt-tstat \
>     ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles',
>'quick-playground', '', d)} \
> "
>
>+QT5_DEMOS =3D "\
>+    qtwayland-examples \
>+    qtwebkit-examples-examples \
>+"
>+
>+QT_DEMOS =3D "\
>+    qt-tstat \
>+"
>+
> RDEPENDS_${PN} =3D "\
>     packagegroup-arago-qte \
>+    ${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_DEMOS}",
>"${QT4_DEMOS}", d)} \
>     ${QT_DEMOS} \
> "
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-linaro-tc-test.bb b/meta-arago-
>distro/recipes-core/packagegroups/packagegroup-linaro-tc-test.bb
>new file mode 100644
>index 0000000..8fd863e
>--- /dev/null
>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>linaro-tc-test.bb
>@@ -0,0 +1,24 @@
>+DESCRIPTION =3D "Group of packages to build with Linaro toolchain
>for testing"
>+LICENSE =3D "MIT"
>+
>+inherit packagegroup
>+
>+RDEPENDS_${PN} =3D "\
>+    virtual/kernel \
>+    u-boot \
>+    busybox \
>+    bash \
>+    coreutils \
>+    apache \
>+    wayland \
>+    weston \
>+    gstreamer \
>+    openssl \
>+    openssh \
>+    perl \
>+    python \
>+    php \
>+    qt4-embedded \
>+    qtbase \
>+    qtwebkit \
>+    "
>diff --git a/meta-arago-extras/recipes-
>core/packagegroups/packagegroup-arago-qt5-toolchain-target.bb
>b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-
>qt5-toolchain-target.bb
>deleted file mode 100644
>index 7e0d12c..0000000
>--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-
>arago-qt5-toolchain-target.bb
>+++ /dev/null
>@@ -1,33 +0,0 @@
>-DESCRIPTION =3D "Target packages for Qt5 SDK"
>-LICENSE =3D "MIT"
>-
>-PR =3D "r1"
>-
>-inherit packagegroup
>-
>-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>-
>-RDEPENDS_${PN} +=3D " \
>-        packagegroup-arago-standalone-sdk-target \
>-        libsqlite3-dev \
>-        qtbase-mkspecs \
>-        qtdeclarative-mkspecs \
>-        qtscript-mkspecs \
>-        qtwebkit-mkspecs \
>-        qt3d-mkspecs \
>-        qtlocation-mkspecs \
>-        qtsensors-mkspecs \
>-        qtsvg-mkspecs \
>-        qtjsbackend-mkspecs \
>-        qtxmlpatterns-mkspecs \
>-        qtbase-dev \
>-        qtdeclarative-dev \
>-        qtscript-dev \
>-        qtwebkit-dev \
>-        qt3d-dev \
>-        qtlocation-dev \
>-        qtsensors-dev \
>-        qtsvg-dev \
>-        qtjsbackend-dev \
>-        qtxmlpatterns-dev \
>-"
>diff --git a/meta-arago-extras/recipes-
>core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
>b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-
>qte-toolchain-target.bb
>index 796e7c3..acba6c8 100644
>--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-
>arago-qte-toolchain-target.bb
>+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-
>arago-qte-toolchain-target.bb
>@@ -1,18 +1,18 @@
> DESCRIPTION =3D "Target packages for Qt Embedded SDK"
> LICENSE =3D "MIT"
>
>-PR =3D "r6"
>+PR =3D "r7"
>
> inherit packagegroup
>
> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>
>-QT_SGX_SUPPORT =3D "\
>-    libqt-embeddedopengl4-dev \
>-    libqt-embeddedpvrqwswsegl4-dev \
>+QT4_SGX_SUPPORT =3D "\
>+        libqt-embeddedopengl4-dev \
>+        libqt-embeddedpvrqwswsegl4-dev \
> "
>
>-RDEPENDS_${PN} +=3D " \
>+QT4_DEV =3D " \
>         packagegroup-arago-standalone-sdk-target \
>         qt4-embedded-mkspecs \
>         libqt-embeddedmultimedia4-dev \
>@@ -38,5 +38,32 @@ RDEPENDS_${PN} +=3D " \
>         libqt-embeddedxmlpatterns4-dev \
>         libqt-embeddedmultimedia4-dev \
>         libqt-embeddeddeclarative4-dev \
>-        ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-
>gles','${QT_SGX_SUPPORT}', '', d)} \
>+        ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-
>gles','${QT4_SGX_SUPPORT}', '', d)} \
>+"
>+
>+QT5_DEV =3D " \
>+        packagegroup-arago-standalone-sdk-target \
>+        libsqlite3-dev \
>+        qtbase-mkspecs \
>+        qtdeclarative-mkspecs \
>+        qtscript-mkspecs \
>+        qtwebkit-mkspecs \
>+        qt3d-mkspecs \
>+        qtlocation-mkspecs \
>+        qtsensors-mkspecs \
>+        qtsvg-mkspecs \
>+        qtxmlpatterns-mkspecs \
>+        qtbase-dev \
>+        qtdeclarative-dev \
>+        qtscript-dev \
>+        qtwebkit-dev \
>+        qt3d-dev \
>+        qtlocation-dev \
>+        qtsensors-dev \
>+        qtsvg-dev \
>+        qtxmlpatterns-dev \
>+"
>+
>+RDEPENDS_${PN} +=3D " \
>+        ${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_DEV}",
>"${QT4_DEV}", d)} \
> "
>--
>2.0.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

