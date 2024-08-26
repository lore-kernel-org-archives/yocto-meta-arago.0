Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E731C5473E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 19:16:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.61241.1724699780760970541
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 26 Aug 2024 12:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 23D8B40A03;
	Mon, 26 Aug 2024 19:16:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wdK9EHcSsbiz; Mon, 26 Aug 2024 19:16:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 20A0F40CC3;
	Mon, 26 Aug 2024 19:16:18 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D23E7164069;
	Mon, 26 Aug 2024 15:16:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 09/16] fftlib: deprecate
Date: Mon, 26 Aug 2024 15:15:58 -0400
Message-Id: <20240826191605.8190-9-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826191605.8190-1-denis@denix.org>
References: <20240826191605.8190-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 26 Aug 2024 19:16:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15519

From: Denys Dmytriyenko <denys@konsulko.com>

Remove fftlib component as deprecated and not maintained.

This component was offloading processing tasks to DSP using heavily
modified OpenCL/OpenCV forks of old versions of corresponding upstream
projects on legacy platforms.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-ti/fftlib/fftlib.inc              |  17 ---
 .../recipes-ti/fftlib/fftlib_git.bb           | 103 ------------------
 .../recipes-ti/fftlib/ti-fftw-examples_git.bb |  25 -----
 .../recipes-ti/fftlib/ti-fftw_git.bb          |  63 -----------
 4 files changed, 208 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-ti/fftlib/fftlib.inc
 delete mode 100644 meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb
 delete mode 100644 meta-arago-extras/recipes-ti/fftlib/ti-fftw-examples_=
git.bb
 delete mode 100644 meta-arago-extras/recipes-ti/fftlib/ti-fftw_git.bb

diff --git a/meta-arago-extras/recipes-ti/fftlib/fftlib.inc b/meta-arago-=
extras/recipes-ti/fftlib/fftlib.inc
deleted file mode 100644
index 49777a53..00000000
--- a/meta-arago-extras/recipes-ti/fftlib/fftlib.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-PV =3D "3_1_0_0"
-INC_PR =3D "r4"
-
-require recipes-ti/includes/arago-paths.inc
-
-
-FFTLIB_GIT_URI =3D "git://git.ti.com/git/fftlib/fftlib"
-FFTLIB_GIT_PROTOCOL =3D "https"
-FFTLIB_GIT_BRANCH =3D "master"
-FFTLIB_GIT_DESTSUFFIX =3D "${WORKDIR}/git"
-
-FFTLIB_SRCREV =3D "e05426894c73af940ccc26880ebd7f2c9ce21880"
-
-BRANCH =3D "${FFTLIB_GIT_BRANCH}"
-SRC_URI =3D "${FFTLIB_GIT_URI};destsuffix=3D${FFTLIB_GIT_DESTSUFFIX};pro=
tocol=3D${FFTLIB_GIT_PROTOCOL};branch=3D${BRANCH}"
-
-SRCREV =3D "${FFTLIB_SRCREV}"
diff --git a/meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb b/meta-ara=
go-extras/recipes-ti/fftlib/fftlib_git.bb
deleted file mode 100644
index 3f7ea874..00000000
--- a/meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb
+++ /dev/null
@@ -1,103 +0,0 @@
-SUMMARY =3D "TI FFTLIB"
-HOMEPAGE =3D "http://git.ti.com/fftlib/fftlib"
-LICENSE =3D "BSD-3-Clause"
-
-LIC_FILES_CHKSUM =3D "file://ti/fftlib/docs/manifest/manifest.xml.xdt;md=
5=3D178402e86abc15ff3bac0d4fc57e5463"
-
-include fftlib.inc
-
-inherit features_check
-
-REQUIRED_MACHINE_FEATURES =3D "dsp"
-REQUIRED_DISTRO_FEATURES =3D "openmp"
-
-PR =3D "${INC_PR}.0"
-
-DEPENDS =3D "common-csl-ip-rtos libarch ti-xdctools-native doxygen-nativ=
e ti-cgt6x-native ti-xdais libulm dsplib-c66x php libxslt-native libxslt =
openmp-rtos"
-
-COMPATIBLE_MACHINE =3D "dra7xx"
-
-TARGET:dra7xx =3D "SOC_AM572x"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-S =3D "${WORKDIR}/git"
-
-export FFTLIB_ROOT=3D"${S}"
-export DOXYGEN_DIR=3D"${DOXYGEN_INSTALL_DIR}"
-
-export TI_OCL_INSTALL_DIR =3D "${STAGING_DIR_TARGET}/usr/share/ti/opencl=
"
-export CGTROOT =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
-export TI_OCL_CGT_INSTALL =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6=
x"
-export XDC_DIR =3D "${XDC_INSTALL_DIR}"
-export BIOS_DIR =3D "${SYSBIOS_INSTALL_DIR}"
-export XDAIS_DIR =3D "${XDAIS_INSTALL_DIR}"
-export FC_DIR =3D "${FC_INSTALL_DIR}"
-export PDK_DIR =3D "${PDK_INSTALL_DIR}"
-export OMP_DIR =3D"${OMP_INSTALL_DIR}"
-export IPC_DIR =3D "${IPC_INSTALL_DIR}/packages"
-export LIBARCH_DIR =3D "${LIBARCH_INSTALL_DIR}"
-export TARGET_ROOTDIR =3D"${STAGING_DIR_TARGET}"
-
-export X86_LLVM_DIR =3D "${STAGING_DIR_NATIVE}/usr"
-export C6636_PDK_DIR =3D"${PDK_INSTALL_DIR}/packages"
-export XDCCGROOT =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
-export LINUX_DEVKIT_ROOT =3D "${STAGING_DIR_TARGET}"
-
-export PDK_INSTALL_DIR
-export FC_INSTALL_DIR
-export IPC_INSTALL_DIR
-export XDC_INSTALL_DIR
-export XDAIS_INSTALL_DIR
-
-export OPENMP_INSTALL_DIR=3D"${OMP_INSTALL_DIR}"
-export BIOS_INSTALL_DIR=3D"${SYSBIOS_INSTALL_DIR}"
-export EDMA_INSTALL_DIR=3D"${EDMA3_LLD_INSTALL_DIR}"
-export C66CODEGENTOOL=3D"${TI_OCL_CGT_INSTALL}"
-export C64CODEGENTOOL=3D"${TI_OCL_CGT_INSTALL}"
-export TI_DOXYGEN_TEMPLATES=3D"${DOXYGEN_DIR}/TI_Templates/10-01-2007"
-export XDCBUILDCFG=3D"${FFTLIB_ROOT}/ti/mas/swtools/config.bld"
-export FFTLIB_INSTALL_DIR=3D"${FFTLIB_ROOT}"
-export IPC_DIR=3D"{IPC_INSTALL_DIR}"
-
-XDCPATH.=3D"${XDCCGROOT}/include;"
-XDCPATH.=3D"${XDAIS_INSTALL_DIR}/packages;"
-XDCPATH.=3D"${XDC_INSTALL_DIR}/packages;"
-XDCPATH.=3D"${FFTLIB_INSTALL_DIR};"
-XDCPATH.=3D"${FC_INSTALL_DIR}/packages;"
-XDCPATH.=3D"${OMP_INSTALL_DIR}/packages;"
-XDCPATH.=3D"${PDK_INSTALL_DIR}/packages;"
-XDCPATH.=3D"${BIOS_INSTALL_DIR}/packages;"
-XDCPATH.=3D"${EDMA3_LLD_INSTALL_DIR}/packages;"
-XDCPATH.=3D"${DSPLIB_C66_INSTALL_DIR}/packages;"
-XDCPATH.=3D"${IPC_INSTALL_DIR}/packages;"
-XDCPATH.=3D"${LIBARCH_INSTALL_DIR}/packages;"
-XDCPATH.=3D"${TI_OCL_INSTALL_DIR};"
-
-XDCPATH.=3D"${FFTLIB_ROOT}"
-
-export XDCPATH
-export PATH :=3D "${XDC_INSTALL_DIR}:${PATH}"
-
-
-do_compile() {
-   echo "Building the FFTLIB.zip"
-   cd ${FFTLIB_ROOT}/ti/fftlib
-   xdc XDCARGS=3D"${TARGET} c66x armplusdsp bundle" XDCOPTIONS=3D"-v"
-}
-
-do_install() {
-
-   cd ${FFTLIB_ROOT}/ti/fftlib
-   install -d ${D}${FFTLIB_INSTALL_DIR_RECIPE}
-
-   find -name "fftlib*.zip" -exec unzip -o {} -d ${D}${FFTLIB_INSTALL_DI=
R_RECIPE} \;
-   mv ${D}${FFTLIB_INSTALL_DIR_RECIPE}/fftlib/* ${D}${FFTLIB_INSTALL_DIR=
_RECIPE}
-   rm -r ${D}${FFTLIB_INSTALL_DIR_RECIPE}/fftlib
-
-}
-
-FILES:${PN}-dev +=3D "${FFTLIB_INSTALL_DIR_RECIPE}"
-
-# skip checking binary against ARM architecture
-INSANE_SKIP:${PN}-dev =3D "arch"
-ALLOW_EMPTY:${PN} =3D "1"
diff --git a/meta-arago-extras/recipes-ti/fftlib/ti-fftw-examples_git.bb =
b/meta-arago-extras/recipes-ti/fftlib/ti-fftw-examples_git.bb
deleted file mode 100644
index 9e3347cb..00000000
--- a/meta-arago-extras/recipes-ti/fftlib/ti-fftw-examples_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY =3D "TI FFTW"
-HOMEPAGE =3D "http://git.ti.com/fftlib"
-LICENSE =3D "BSD-3-Clause"
-
-LIC_FILES_CHKSUM =3D "file://../docs/TI-FFTW_3.1.0_manifest.html;md5=3Da=
aa275ec704a738216ba696898941b44"
-
-include fftlib.inc
-
-PR =3D "${INC_PR}.0"
-
-DEPENDS =3D "ti-fftw"
-
-RDEPENDS:${PN} +=3D "ti-fftw-staticdev"
-
-S =3D "${WORKDIR}/git/ti/fftw/examples"
-
-EXTRA_OEMAKE +=3D "TARGET_ROOTDIR=3D"${STAGING_DIR_TARGET}""
-
-do_install() {
-    install -d ${D}${datadir}/ti/examples/fftw
-    cp -r ./* ${D}${datadir}/ti/examples/fftw
-}
-
-FILES:${PN} =3D "${datadir}/ti/examples/fftw"
-INSANE_SKIP:${PN} =3D "ldflags"
diff --git a/meta-arago-extras/recipes-ti/fftlib/ti-fftw_git.bb b/meta-ar=
ago-extras/recipes-ti/fftlib/ti-fftw_git.bb
deleted file mode 100644
index df9e9708..00000000
--- a/meta-arago-extras/recipes-ti/fftlib/ti-fftw_git.bb
+++ /dev/null
@@ -1,63 +0,0 @@
-SUMMARY =3D "TI FFTW"
-HOMEPAGE =3D "http://git.ti.com/fftlib"
-LICENSE =3D "GPL-2.0-only & BSD-3-Clause"
-
-LIC_FILES_CHKSUM =3D "file://docs/TI-FFTW_3.1.0_manifest.html;md5=3Daaa2=
75ec704a738216ba696898941b44 \
-                    file://fftw-3.3.4/COPYING;md5=3D59530bdf33659b29e73d=
4adb9f9f6552"
-
-include fftlib.inc
-
-inherit features_check
-
-REQUIRED_MACHINE_FEATURES =3D "dsp"
-REQUIRED_DISTRO_FEATURES =3D "opencl"
-
-PR =3D "${INC_PR}.0"
-
-DEPENDS =3D "common-csl-ip-rtos common-csl-ip ti-xdctools-native ti-sysb=
ios ti-cgt6x-native ti-xdais libulm fftlib dsplib-c66x opencl clocl-nativ=
e libarch"
-
-RDEPENDS:${PN} +=3D "opencl-runtime"
-
-COMPATIBLE_MACHINE =3D "dra7xx"
-TARGET:dra7xx =3D "SOC_AM572x"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-S =3D "${WORKDIR}/git/ti/fftw"
-
-export TI_OCL_INSTALL_DIR =3D "${STAGING_DIR_TARGET}/usr/share/ti/opencl=
"
-export TI_OCL_CGT_INSTALL =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6=
x"
-export PDK_DIR =3D "${PDK_INSTALL_DIR}"
-export IPC_DIR =3D "${IPC_INSTALL_DIR}/packages"
-export XDC_DIR =3D "${XDC_INSTALL_DIR}"
-export BIOS_DIR =3D "${SYSBIOS_INSTALL_DIR}"
-export XDAIS_DIR =3D "${XDAIS_INSTALL_DIR}"
-export FC_DIR =3D "${FC_INSTALL_DIR}"
-export ULM_DIR =3D"${STAGING_DIR_TARGET}/usr/share/ti/ulm"
-export GDB_SERVER_DIR =3D "${STAGING_DIR_TARGET}/usr/share/ti/gdbc6x"
-export X86_LLVM_DIR =3D "${STAGING_DIR_NATIVE}/usr"
-export C6636_PDK_DIR =3D"${PDK_INSTALL_DIR}/packages"
-export XDCCGROOT =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
-export LINUX_DEVKIT_ROOT =3D "${STAGING_DIR_TARGET}"
-export TARGET_ROOTDIR=3D"${STAGING_DIR_TARGET}"
-export OMP_DIR =3D "${OMP_INSTALL_DIR}"
-export FFTLIB_DIR=3D"${FFTLIB_INSTALL_DIR}"
-export DSPLIB_DIR=3D"${DSPLIB_C66_INSTALL_DIR}"
-export BIOS_INSTALL_DIR=3D"${SYSBIOS_INSTALL_DIR}"
-export EDMA_INSTALL_DIR=3D"${EDMA3_LLD_INSTALL_DIR}"
-export XDCTOOLS_DIR=3D"${XDC_INSTALL_DIR}/packages"
-export LIBARCH_DIR =3D "${LIBARCH_INSTALL_DIR}"
-
-do_compile() {
-    make build TARGET=3D${TARGET}
-}
-
-do_install() {
-    make install DESTDIR=3D${D}
-
-    # These files will be installed by the ti-fftw-examples recipe
-    rm -rf ${D}${datadir}/ti
-}
-
-ALLOW_EMPTY:${PN} =3D "1"
-
-INSANE_SKIP:${PN} =3D "arch"
--=20
2.25.1


