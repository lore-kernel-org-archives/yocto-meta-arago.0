Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20DB2C54741
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 19:16:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.60348.1724699780799439120
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 26 Aug 2024 12:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2E42840CB2;
	Mon, 26 Aug 2024 19:16:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z925cT4oIF_9; Mon, 26 Aug 2024 19:16:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2EF0A40CC5;
	Mon, 26 Aug 2024 19:16:18 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id EAA4516406B;
	Mon, 26 Aug 2024 15:16:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 11/16] libarch: deprecate
Date: Mon, 26 Aug 2024 15:16:00 -0400
Message-Id: <20240826191605.8190-11-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826191605.8190-1-denis@denix.org>
References: <20240826191605.8190-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 26 Aug 2024 19:16:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15521

From: Denys Dmytriyenko <denys@konsulko.com>

Remove libarch component as deprecated and not maintained.

This component was offloading processing tasks to DSP using heavily
modified OpenCL/OpenCV forks of old versions of corresponding upstream
projects on legacy platforms.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../libarch/libarch-examples_git.bb           | 36 -------------------
 .../recipes-ti/libarch/libarch.inc            | 36 -------------------
 .../recipes-ti/libarch/libarch_git.bb         | 20 -----------
 3 files changed, 92 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-ti/libarch/libarch-examples=
_git.bb
 delete mode 100644 meta-arago-extras/recipes-ti/libarch/libarch.inc
 delete mode 100644 meta-arago-extras/recipes-ti/libarch/libarch_git.bb

diff --git a/meta-arago-extras/recipes-ti/libarch/libarch-examples_git.bb=
 b/meta-arago-extras/recipes-ti/libarch/libarch-examples_git.bb
deleted file mode 100644
index f7b893f7..00000000
--- a/meta-arago-extras/recipes-ti/libarch/libarch-examples_git.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-DESCRIPTION =3D "TI Library Architecture Examples"
-
-include libarch.inc
-
-PR =3D "${INC_PR}.0"
-
-DEPENDS +=3D "libarch clocl-native"
-RDEPENDS:${PN} +=3D "opencl-runtime"
-
-export LIBARCH_DIR    =3D "${LIBARCH_INSTALL_DIR}"
-export TARGET_ROOTDIR =3D "${STAGING_DIR_TARGET}"
-
-do_compile() {
-    cd examples
-    make TARGET=3D${TARGET} LIBOS=3DLIB_OPENCL
-    # Remove object files before installing so that the binaries are not=
 present
-    find . -name "*.obj" -type f -delete
-    find . -name "*.o" -type f -delete
-    find . -name "*.out" -type f -delete
-    find . -name "*.dsp_h" -type f -delete
-}
-
-do_install() {
-    install -d ${D}${datadir}/ti/examples/libarch
-    cp -r examples/arm+dsp ${D}${datadir}/ti/examples/libarch
-    cp -r examples/common ${D}${datadir}/ti/examples/libarch
-    cp examples/Makefile ${D}${datadir}/ti/examples/libarch
-}
-
-FILES:${PN} +=3D "\
-    ${datadir}/ti/examples/libarch/* \ "
-
-FILES:${PN}-dbg +=3D "\
-    ${datadir}/ti/examples/libarch/*/.debug \ "
-
-INSANE_SKIP:${PN} =3D "arch ldflags textrel"
diff --git a/meta-arago-extras/recipes-ti/libarch/libarch.inc b/meta-arag=
o-extras/recipes-ti/libarch/libarch.inc
deleted file mode 100644
index 3c708250..00000000
--- a/meta-arago-extras/recipes-ti/libarch/libarch.inc
+++ /dev/null
@@ -1,36 +0,0 @@
-HOMEPAGE =3D "https://git.ti.com/library-architecture/libarch"
-LICENSE =3D "BSD-3-Clause"
-
-PV =3D "1_0_0_0"
-INC_PR =3D "r2"
-
-require recipes-ti/includes/arago-paths.inc
-require recipes-ti/includes/ti-staging.inc
-
-inherit features_check
-
-REQUIRED_MACHINE_FEATURES =3D "dsp"
-REQUIRED_DISTRO_FEATURES =3D "opencl"
-
-BRANCH =3D "master"
-LIC_FILES_CHKSUM =3D "file://src/ti/libarch/docs/LibArch_1.0.0_manifest.=
html;md5=3Dbb48cacb8827ec8d8e5a94c4f2425ee3"
-SRC_URI =3D "git://git.ti.com/git/library-architecture/libarch.git;proto=
col=3Dhttps;branch=3D${BRANCH}"
-SRCREV =3D "cb6d785e95cd390c6388853a4f1e99a302e5a58f"
-
-COMPATIBLE_MACHINE =3D "dra7xx"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-S =3D "${WORKDIR}/git"
-
-DEPENDS =3D "common-csl-ip-rtos ti-xdctools-native ti-sysbios ti-cgt6x-n=
ative ti-xdais ti-framework-components opencl opencl-monitor doxygen-nati=
ve zip-native"
-
-export CGTROOT =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
-export TI_OCL_CGT_INSTALL =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6=
x"
-export TI_OCL_INSTALL_DIR =3D "${STAGING_DIR_TARGET}/usr/share/ti/opencl=
"
-export XDC_DIR =3D "${XDC_INSTALL_DIR}"
-export BIOS_DIR=3D "${SYSBIOS_INSTALL_DIR}"
-export XDAIS_DIR =3D "${XDAIS_INSTALL_DIR}"
-export FC_DIR =3D "${FC_INSTALL_DIR}"
-export PDK_DIR =3D "${PDK_INSTALL_DIR}"
-
-TARGET:dra7xx =3D "SOC_AM572x"
diff --git a/meta-arago-extras/recipes-ti/libarch/libarch_git.bb b/meta-a=
rago-extras/recipes-ti/libarch/libarch_git.bb
deleted file mode 100644
index 4151e1c4..00000000
--- a/meta-arago-extras/recipes-ti/libarch/libarch_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION =3D "TI Library Architecture"
-
-include libarch.inc
-
-PR =3D "${INC_PR}.0"
-
-do_compile() {
-    make -f build/Makefile TARGET=3D${TARGET} LIBOS=3DLIB_OPENCL
-}
-
-do_install() {
-    install -d ${D}${LIBARCH_INSTALL_DIR_RECIPE}
-    cp -r exports/libarch_*/* ${D}${LIBARCH_INSTALL_DIR_RECIPE}
-}
-
-FILES:${PN}-dev +=3D "${LIBARCH_INSTALL_DIR_RECIPE}"
-
-# skip checking binary against ARM architecture
-INSANE_SKIP:${PN}-dev =3D "arch"
-ALLOW_EMPTY:${PN} =3D "1"
--=20
2.25.1


