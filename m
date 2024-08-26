Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C006AC54735
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 19:16:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.61247.1724699781745184374
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 26 Aug 2024 12:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 48D8740C67;
	Mon, 26 Aug 2024 19:16:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G99TWr65uDBx; Mon, 26 Aug 2024 19:16:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1BBA440CC1;
	Mon, 26 Aug 2024 19:16:18 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C1824164067;
	Mon, 26 Aug 2024 15:16:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Andrew Davis <afd@ti.com>
Subject: [master][PATCH 07/16] tidl-api, tidl-utils: deprecate
Date: Mon, 26 Aug 2024 15:15:56 -0400
Message-Id: <20240826191605.8190-7-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826191605.8190-1-denis@denix.org>
References: <20240826191605.8190-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 26 Aug 2024 19:16:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15526

From: Denys Dmytriyenko <denys@konsulko.com>

Remove old TIDL components as deprecated and not maintained.

This component was offloading processing tasks to DSP using heavily
modified OpenCL/OpenCV forks of old versions of corresponding upstream
projects on legacy platforms.

Current versions of TIDL/AI components are now maintained in a separate
meta-edgeai layer from TI.

Acked-by: Andrew Davis <afd@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...nativesdk-packagegroup-arago-tisdk-host.bb |  8 ---
 .../recipes-ti/tidl-api/tidl-api.inc          | 21 -------
 .../recipes-ti/tidl-api/tidl-api_git.bb       | 57 -------------------
 .../recipes-ti/tidl-api/tidl-examples_git.bb  | 52 -----------------
 .../recipes-ti/tidl-api/tidl-viewer_git.bb    | 33 -----------
 .../recipes-ti/tidl-utils/tidl-import_git.bb  | 46 ---------------
 .../recipes-ti/tidl-utils/tidl-utils.bb       | 34 -----------
 .../recipes-ti/tidl-utils/tidl-utils.inc      |  4 --
 8 files changed, 255 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
 delete mode 100644 meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
 delete mode 100644 meta-arago-extras/recipes-ti/tidl-api/tidl-examples_g=
it.bb
 delete mode 100644 meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git=
.bb
 delete mode 100644 meta-arago-extras/recipes-ti/tidl-utils/tidl-import_g=
it.bb
 delete mode 100644 meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
 delete mode 100644 meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.in=
c

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packa=
gegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroup=
s/nativesdk-packagegroup-arago-tisdk-host.bb
index 92a80b6b..ed29b6c4 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup=
-arago-tisdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup=
-arago-tisdk-host.bb
@@ -7,13 +7,6 @@ inherit_defer nativesdk
=20
 PACKAGEGROUP_DISABLE_COMPLEMENTARY =3D "1"
=20
-TIDL_TOOLS =3D ""
-#TIDL_TOOLS =3D " \
-#    nativesdk-tidl-import \
-#    nativesdk-tidl-viewer \
-#    nativesdk-tidl-utils \
-#"
-
 EXTRA_TI_TOOLS =3D " \
     nativesdk-ti-cgt6x \
     nativesdk-ti-cgt-pru \
@@ -22,7 +15,6 @@ EXTRA_TI_TOOLS =3D " \
     nativesdk-open62541-examples \
     nativesdk-open62541-tests \
     nativesdk-gcc-arm-baremetal \
-    ${@oe.utils.all_distro_features(d, "opencl opencv", "${TIDL_TOOLS}")=
} \
 "
=20
 RDEPENDS:${PN} =3D "\
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-ar=
ago-extras/recipes-ti/tidl-api/tidl-api.inc
deleted file mode 100644
index 389e565a..00000000
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-PV =3D "1.5.1"
-INC_PR =3D "r0"
-
-LIC_FILES_CHKSUM =3D "file://license.txt;md5=3De3daeabffb9fc131a73f16d16=
cbdb118"
-
-GIT_URI =3D "git://git.ti.com/git/tidl/tidl-api.git"
-GIT_PROTOCOL =3D "https"
-BRANCH =3D "master"
-
-SRC_URI =3D "${GIT_URI};protocol=3D${GIT_PROTOCOL};branch=3D${BRANCH}"
-SRCREV =3D "4b801ad96b50f53e977b96d8b227ba4bcb26e011"
-
-# default patchdir is ${S}
-S =3D "${WORKDIR}/git"
-
-inherit features_check
-
-REQUIRED_MACHINE_FEATURES =3D "dsp"
-REQUIRED_MACHINE_FEATURES:class-native =3D ""
-REQUIRED_MACHINE_FEATURES:class-nativesdk =3D ""
-REQUIRED_DISTRO_FEATURES =3D "opencl opencv"
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta=
-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
deleted file mode 100644
index 7f37b63b..00000000
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
+++ /dev/null
@@ -1,57 +0,0 @@
-SUMMARY =3D "TIDL API"
-DESCRIPTION =3D "TIDL API header and library. Refer TIDL API User's Guid=
e for details."
-HOMEPAGE =3D "https://downloads.ti.com/mctools/esd/docs/tidl-api/intro.h=
tml"
-LICENSE =3D "BSD-3-Clause"
-
-include tidl-api.inc
-require recipes-ti/includes/ti-paths.inc
-
-PR =3D "${INC_PR}.0"
-
-COMPATIBLE_MACHINE =3D "dra7xx"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit python3native
-
-DEPENDS =3D "opencv \
-           opencl \
-           opencl-monitor \
-           ti-cgt6x-native \
-           clocl-native \
-"
-
-RDEPENDS:${PN} +=3D "opencl-runtime \
-                   opencv \
-"
-
-EXTRA_OEMAKE =3D " -C ${S}/tidl_api \
-                 TARGET_ROOTDIR=3D${STAGING_DIR_HOST} \
-                 TI_OCL_CGT_INSTALL=3D${STAGING_DIR_NATIVE}/usr/share/ti=
/cgt-c6x \
-"
-
-do_compile() {
-  oe_runmake
-}
-
-CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downership"
-
-TIDL_INSTALL_DIR =3D "${datadir}/ti/tidl"
-
-do_install() {
-    install -d ${D}${TIDL_INSTALL_DIR}
-    install -d ${D}${TIDL_INSTALL_DIR}/tidl_api
-    install -d ${D}${TIDL_INSTALL_DIR}/viewer
-    install -d ${D}${libdir}
-    cp ${CP_ARGS} ${S}/tidl_api/libtidl_*.so* ${D}${libdir}
-    rm -f ${S}/tidl_api/libtidl_*.so*
-    cp ${CP_ARGS} ${S}/tidl_api/* ${D}${TIDL_INSTALL_DIR}/tidl_api/
-    cp ${CP_ARGS} ${S}/viewer/* ${D}${TIDL_INSTALL_DIR}/viewer/
-    install ${S}/readme.md ${D}${TIDL_INSTALL_DIR}/
-}
-
-FILES:${PN} +=3D "\
-    ${TIDL_INSTALL_DIR} \
-"
-
-
-INSANE_SKIP:${PN} =3D "arch ldflags textrel staticdev"
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b=
/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
deleted file mode 100644
index c9756d40..00000000
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
+++ /dev/null
@@ -1,52 +0,0 @@
-SUMMARY =3D "TIDL API examples"
-DESCRIPTION =3D "Examples of TIDL API. Refer TIDL API User's Guide for d=
etails."
-HOMEPAGE =3D "https://downloads.ti.com/mctools/esd/docs/tidl-api/intro.h=
tml"
-LICENSE =3D "BSD-3-Clause"
-
-include tidl-api.inc
-require recipes-ti/includes/ti-paths.inc
-
-PR =3D "${INC_PR}.0"
-
-COMPATIBLE_MACHINE =3D "dra7xx"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-DEPENDS =3D "opencv \
-           clocl-native \
-           ti-cgt6x-native \
-           tidl-api \
-           json-c \
-"
-
-RDEPENDS:${PN} +=3D "tidl-api \
-                   opencl-runtime \
-                   opencv \
-                   json-c \
-                   python3-core \
-"
-
-EXTRA_OEMAKE =3D " -C ${S}/examples \
-                 TARGET_ROOTDIR=3D${STAGING_DIR_HOST} \
-                 TI_OCL_CGT_INSTALL=3D${STAGING_DIR_NATIVE}/usr/share/ti=
/cgt-c6x \
-"
-
-do_compile() {
-  oe_runmake
-}
-
-CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downership"
-
-TIDL_INSTALL_DIR =3D "${datadir}/ti/tidl"
-
-do_install() {
-    install -d ${D}${TIDL_INSTALL_DIR}
-    install -d ${D}${TIDL_INSTALL_DIR}/examples
-    cp ${CP_ARGS} ${S}/examples/* ${D}${TIDL_INSTALL_DIR}/examples/
-}
-
-FILES:${PN} +=3D "\
-    ${TIDL_INSTALL_DIR} \
-"
-
-
-INSANE_SKIP:${PN} =3D "arch ldflags textrel staticdev"
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb b/m=
eta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
deleted file mode 100644
index 644b8626..00000000
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY =3D "TIDL Network Viewer"
-DESCRIPTION =3D "TIDL Network viewer using dot and graphviz"
-HOMEPAGE =3D "https://downloads.ti.com/mctools/esd/docs/tidl-api/intro.h=
tml"
-LICENSE =3D "BSD-3-Clause"
-
-include tidl-api.inc
-
-PR =3D "${INC_PR}.0"
-
-DEPENDS =3D "boost boost-native ti-cgt6x-native clocl-native"
-
-TARGET:class-target =3D "arm"
-TARGET:class-native =3D "x86"
-TARGET:class-nativesdk =3D "x86"
-
-CXXFLAGS:append:class-native    =3D " -DPLATFORM_64BIT "
-CXXFLAGS:append:class-nativesdk =3D " -DPLATFORM_64BIT "
-
-EXTRA_OEMAKE =3D " -C ${S}/viewer \
-                 TARGET=3D${TARGET} \
-                 TARGET_ROOTDIR=3D${STAGING_DIR_HOST} \
-"
-
-do_compile() {
-  oe_runmake
-}
-
-do_install() {
-  install -d ${D}${bindir}
-  install -m 755 ${S}/viewer/${TARGET}/tidl_viewer ${D}${bindir}
-}
-
-BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb b=
/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
deleted file mode 100644
index 3c1b81ff..00000000
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-SUMMARY =3D "TIDL import tool for conversion of Caffe and TF models into=
 TI custom network format"
-DESCRIPTION =3D "TIDL import tool is using protobuf to read and parse in=
formation from external network models \
-               This is ARM Linux implementation."
-
-require ./tidl-utils.inc
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://modules/ti_dl/inc/itidl_ti.h;beginline=3D1;=
endline=3D34;md5=3Dcabe1fdaabfa0d85dc5544566b0e2425"
-
-S =3D "${WORKDIR}/git/src/importTool"
-
-DEPENDS =3D "protobuf zlib protobuf-native flatbuffers tensorflow-lite f=
latbuffers-native tensorflow-lite-native"
-
-EXTRA_OEMAKE +=3D "TIARM_TOOLS=3D${GCC_ARM_NONE_TOOLCHAIN}"
-EXTRA_OEMAKE +=3D "XDAIS_PATH=3D${XDAIS_INSTALL_DIR}"
-EXTRA_OEMAKE +=3D "SHOW_COMMANDS=3D1"
-EXTRA_OEMAKE +=3D "CORE=3Deve"
-EXTRA_OEMAKE +=3D "TARGET_BUILD=3Drelease"
-EXTRA_OEMAKE +=3D "TARGET_PLATFORM=3DPC"
-
-EXTRA_MAKE_ARGS =3D "PLATFORM_BUILD=3Dx86 LINUXENV=3Dx86 LINUX_IMPORT_TO=
OL=3D64BIT \
-                   PROTOBUF_LIB_DIR=3D${STAGING_DIR_NATIVE}/usr/lib PROT=
OBUF_INC_DIR=3D${STAGING_DIR_NATIVE}/usr/include \
-                   FLATBUFFERS_INC_DIR=3D${STAGING_DIR_NATIVE}$/usr/incl=
ude/flatbuffers \
-                   TF_LITE_GENERATED_PATH=3D${STAGING_DIR_NATIVE}/usr/in=
clude/tensorflow/lite/schema"
-EXTRA_MAKE_ARGS:class-target =3D "LINUX_BUILD_TOOLS=3D${TOOLCHAIN_PATH}/=
bin/${TARGET_PREFIX} \
-                                PROTOBUF_LIB_DIR=3D${STAGING_LIBDIR} PRO=
TOBUF_INC_DIR=3D${STAGING_INCDIR} \
-                                FLATBUFFERS_INC_DIR=3D${STAGING_INCDIR}/=
flatbuffers \
-                                TF_LITE_GENERATED_PATH=3D${STAGING_INCDI=
R}/tensorflow/lite/schema LINUXENV=3Doearm"
-
-EXTRA_OEMAKE +=3D "${EXTRA_MAKE_ARGS}"
-
-do_compile() {
-    cd ${S}/modules/ti_dl/utils
-    ./genProtoSrc.sh
-    cd ${S}
-    oe_runmake -C modules/ti_dl/utils/tidlModelImport
-}
-
-do_install () {
-    install -d ${D}${bindir}
-    install -m 755 ${S}/modules/ti_dl/utils/tidlModelImport/out/tidl_mod=
el_import.out ${D}${bindir}
-}
-
-INSANE_SKIP:${PN} =3D "ldflags"
-
-BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb b/meta=
-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
deleted file mode 100644
index e8aad51c..00000000
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY =3D "TIDL Utilities and configuration files"
-DESCRIPTION =3D "TIDL Utilities for standalone simulation and importing =
/ translation of Caffe and TF-Slim models"
-HOMEPAGE =3D "http://software-dl.ti.com/processor-sdk-linux/esd/docs/lat=
est/linux/Foundational_Components.html#tidl"
-LICENSE =3D "TI-TFL"
-
-require ./tidl-utils.inc
-
-LIC_FILES_CHKSUM =3D "file://docs/LICENSE.txt;md5=3Da93aa5af7a3bbbb6fb34=
c8df59efaa5c"
-
-RDEPENDS:${PN}:class-target +=3D "tidl-api tidl-examples"
-
-S =3D "${WORKDIR}/git"
-
-TARGET:class-target =3D "arm"
-TARGET:class-native =3D "x86"
-TARGET:class-nativesdk =3D "x86"
-
-CP_ARGS =3D "-Prf --preserve=3Dmode,timestamps --no-preserve=3Downership=
"
-
-do_install() {
-  install -d ${D}${bindir}
-  install -d ${D}${datadir}/ti/tidl/utils/test
-  install -d ${D}${datadir}/ti/tidl/utils/docs
-  install -m 755 ${S}/${TARGET}/bin/* ${D}${bindir}
-  cp ${CP_ARGS} ${S}/test/* ${D}${datadir}/ti/tidl/utils/test/.
-  cp ${CP_ARGS} ${S}/docs/* ${D}${datadir}/ti/tidl/utils/docs/.
-}
-
-FILES:${PN} +=3D "${datadir}/ti/tidl/utils \
-                ${bindir}"
-
-BBCLASSEXTEND =3D "native nativesdk"
-
-INSANE_SKIP:${PN} +=3D "build-deps ldflags already-stripped"
diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/met=
a-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
deleted file mode 100644
index 80eefe9d..00000000
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-SRC_URI =3D "git://git.ti.com/git/tidl/tidl-utils.git;protocol=3Dhttps;b=
ranch=3Dmaster"
-SRCREV =3D "6a51b2aff1709c13edb3445bdb4698a28fbb2ae7"
-PV =3D "01.01.03.02"
-PR =3D "r1"
--=20
2.25.1


