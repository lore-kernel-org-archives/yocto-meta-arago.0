Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 41BA252A56
	for <meta-arago@arago-project.org>;
	Wed, 13 Nov 2013 14:38:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rADEcW9J004430;
	Wed, 13 Nov 2013 08:38:32 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rADEcWFX001487;
	Wed, 13 Nov 2013 08:38:32 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Wed, 13 Nov 2013 08:38:32 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 3/6] nativesdk-qttools: add nativesdk
	version of qttools necessary for SDK tools
Thread-Index: AQHO32GxySCjHRK2DEWxnQBDUOO+zJojPTCA
Date: Wed, 13 Nov 2013 14:38:31 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101598157BF@DLEE11.ent.ti.com>
References: <1384231333-26952-1-git-send-email-denis@denix.org>
	<1384231333-26952-4-git-send-email-denis@denix.org>
In-Reply-To: <1384231333-26952-4-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 3/6] nativesdk-qttools: add nativesdk version of qttools necessary for SDK tools
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
X-List-Received-Date: Wed, 13 Nov 2013 14:38:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>=20

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Monday, November 11, 2013 10:42 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 3/6] nativesdk-qttools: add nativesdk
>version of qttools necessary for SDK tools
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../recipes-qt/qt5/nativesdk-qttools.inc           |  32 +++++
> ...w-to-build-only-lrelease-lupdate-lconvert.patch | 138
>+++++++++++++++++++++
> .../recipes-qt/qt5/nativesdk-qttools_5.1.1.bb      |  10 ++
> 3 files changed, 180 insertions(+)
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-
>qttools.inc
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-
>qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-
>qttools_5.1.1.bb
>
>diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-
>qttools.inc b/meta-arago-distro/recipes-qt/qt5/nativesdk-
>qttools.inc
>new file mode 100644
>index 0000000..30bb357
>--- /dev/null
>+++ b/meta-arago-distro/recipes-qt/qt5/nativesdk-qttools.inc
>@@ -0,0 +1,32 @@
>+# doesnt have GFDL-1.3 like qtbase, LICENSE files are missing in
>5.0.0 and 5.0.1, this is for 5.0.2 and git
>+LICENSE =3D "LGPL-2.1 | GPL-3.0"
>+LIC_FILES_CHKSUM =3D
>"file://LICENSE.LGPL;md5=3D4193e7f1d47a858f6b7c0f1ee66161de \
>+
>file://LICENSE.GPL;md5=3Dd32239bcb673463ab874e80d47fae504 \
>+
>file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
>+"
>+
>+DEPENDS =3D "nativesdk-qtbase qtbase-native"
>+
>+QT_MODULE =3D "qttools"
>+
>+require nativesdk-qt5.inc
>+
>+SRC_URI +=3D "file://0001-Allow-to-build-only-lrelease-lupdate-
>lconvert.patch"
>+
>+PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
>+
>+FILES_${PN}-dbg =3D " \
>+    ${OE_QMAKE_PATH_BINS}/.debug \
>+"
>+
>+FILES_${PN} =3D " \
>+    ${OE_QMAKE_PATH_BINS}/* \
>+"
>+
>+do_configure() {
>+    ${OE_QMAKE_QMAKE} ${OE_QMAKE_DEBUG_OUTPUT} -r ${S}
>CONFIG+=3Dlinguistonly
>+}
>+
>+do_install() {
>+    oe_runmake install INSTALL_ROOT=3D${D}
>+}
>diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-
>qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
>b/meta-arago-distro/recipes-qt/qt5/nativesdk-qttools/0001-Allow-
>to-build-only-lrelease-lupdate-lconvert.patch
>new file mode 100644
>index 0000000..a5f26a3
>--- /dev/null
>+++ b/meta-arago-distro/recipes-qt/qt5/nativesdk-qttools/0001-
>Allow-to-build-only-lrelease-lupdate-lconvert.patch
>@@ -0,0 +1,138 @@
>+From 9337242944c936104db5eee64df804a27fb02bb8 Mon Sep 17 00:00:00
>2001
>+From: Martin Jansa <Martin.jansa@gmail.com>
>+Date: Wed, 11 Sep 2013 18:30:08 +0200
>+Subject: [PATCH] Allow to build only lrelease + lupdate +
>lconvert
>+
>+This is useful e.g. when cross compiling with OpenEmbedded where
>qtbase-native
>+is built without GUI support (no-png is set) and we still want to
>build
>+native lrelease + lupdate + lconvert tools.
>+
>+Upstream-Status: Pending
>+
>+Signed-off-by: Martin Jansa <Martin.jansa@gmail.com>
>+---
>+ examples/examples.pro     |  4 ++--
>+ src/designer/src/src.pro  | 16 +++++++++-------
>+ src/linguist/linguist.pro |  2 +-
>+ src/src.pro               | 10 ++++++----
>+ tests/auto/auto.pro       | 22 ++++++++++++----------
>+ 5 files changed, 30 insertions(+), 24 deletions(-)
>+
>+diff --git a/examples/examples.pro b/examples/examples.pro
>+index 4955969..8e86419 100644
>+--- a/examples/examples.pro
>++++ b/examples/examples.pro
>+@@ -1,3 +1,3 @@
>+ TEMPLATE =3D subdirs
>+-qtHaveModule(widgets): SUBDIRS +=3D help designer linguist uitools
>assistant
>+-
>++!linguistonly:qtHaveModule(widgets): SUBDIRS +=3D help designer
>assistant
>++qtHaveModule(widgets): SUBDIRS +=3D linguist uitools
>+diff --git a/src/designer/src/src.pro b/src/designer/src/src.pro
>+index e02ca8e..49527c5 100644
>+--- a/src/designer/src/src.pro
>++++ b/src/designer/src/src.pro
>+@@ -1,18 +1,20 @@
>+ TEMPLATE =3D subdirs
>+
>+-SUBDIRS =3D \
>+-    uitools \
>+-    lib \
>+-    components \
>+-    designer
>++!linguistonly {
>++    SUBDIRS =3D \
>++        lib \
>++        components \
>++        designer
>++}
>++SUBDIRS +=3D uitools
>+
>+-contains(QT_CONFIG, shared): SUBDIRS +=3D plugins
>++!linguistonly:contains(QT_CONFIG, shared): SUBDIRS +=3D plugins
>+
>+ components.depends =3D lib
>+ designer.depends =3D components
>+ plugins.depends =3D lib
>+
>+-qtNomakeTools( \
>++!linguistonly:qtNomakeTools( \
>+     lib \
>+     components \
>+     designer \
>+diff --git a/src/linguist/linguist.pro
>b/src/linguist/linguist.pro
>+index df3c0c7..75bdf26 100644
>+--- a/src/linguist/linguist.pro
>++++ b/src/linguist/linguist.pro
>+@@ -3,7 +3,7 @@ SUBDIRS  =3D \
>+     lrelease \
>+     lupdate \
>+     lconvert
>+-!no-png:qtHaveModule(widgets): SUBDIRS +=3D linguist
>++!linguistonly:!no-png:qtHaveModule(widgets): SUBDIRS +=3D linguist
>+
>+ qtNomakeTools( \
>+     linguist \
>+diff --git a/src/src.pro b/src/src.pro
>+index c8756db..d71c4a0 100644
>+--- a/src/src.pro
>++++ b/src/src.pro
>+@@ -4,10 +4,12 @@ qtHaveModule(widgets) {
>+     no-png {
>+         message("Some graphics-related tools are unavailable
>without PNG support")
>+     } else {
>+-        SUBDIRS =3D assistant \
>++        !linguistonly {
>++            SUBDIRS =3D assistant \
>+                   pixeltool \
>+-                  qtestlib \
>+-                  designer
>++                  qtestlib
>++        }
>++        SUBDIRS +=3D designer
>+ #    unix:!mac:!embedded:!qpa:SUBDIRS +=3D qtconfig
>+
>+         linguist.depends =3D designer
>+@@ -20,7 +22,7 @@ mac {
>+     SUBDIRS +=3D macdeployqt
>+ }
>+
>+-qtHaveModule(dbus): SUBDIRS +=3D qdbus
>++!linguistonly:qtHaveModule(dbus): SUBDIRS +=3D qdbus
>+
>+ qtNomakeTools( \
>+     pixeltool \
>+diff --git a/tests/auto/auto.pro b/tests/auto/auto.pro
>+index eaf440b..1778ad1 100644
>+--- a/tests/auto/auto.pro
>++++ b/tests/auto/auto.pro
>+@@ -1,14 +1,16 @@
>+ TEMPLATE=3Dsubdirs
>+-SUBDIRS=3D\
>+-    linguist \
>+-    host.pro \
>+-    qhelpcontentmodel \
>+-    qhelpenginecore \
>+-    qhelpgenerator \
>+-    qhelpindexmodel \
>+-    qhelpprojectdata \
>+-    cmake \
>+-    installed_cmake
>++!linguistonly {
>++    SUBDIRS=3D\
>++        linguist \
>++        host.pro \
>++        qhelpcontentmodel \
>++        qhelpenginecore \
>++        qhelpgenerator \
>++        qhelpindexmodel \
>++        qhelpprojectdata \
>++        cmake \
>++        installed_cmake
>++}
>+
>+ installed_cmake.depends =3D cmake
>+
>+--
>+1.8.3.1
>+
>diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-
>qttools_5.1.1.bb b/meta-arago-distro/recipes-qt/qt5/nativesdk-
>qttools_5.1.1.bb
>new file mode 100644
>index 0000000..0bf946a
>--- /dev/null
>+++ b/meta-arago-distro/recipes-qt/qt5/nativesdk-qttools_5.1.1.bb
>@@ -0,0 +1,10 @@
>+require recipes-qt/qt5/qt5-${PV}.inc
>+require ${PN}.inc
>+
>+# LICENSE files are missing in 5.0.0 and 5.0.1
>+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/LGPL-
>2.1;md5=3D1a6d268fd218675ffea8be556788b780 \
>+                    file://${COMMON_LICENSE_DIR}/GPL-
>3.0;md5=3Dc79ff39f19dfec6d293b95dea7b07891 \
>+"
>+
>+SRC_URI[md5sum] =3D "022073d32ff9d408de0182b5d1f01781"
>+SRC_URI[sha256sum] =3D
>"2b42c6d5feeccffb67e890b86a150bae64dd2ff550be39a3cc449ee0e95462b6"
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

