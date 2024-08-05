Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41908C52D76
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 04:37:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1072.1722832645389681189
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 04 Aug 2024 21:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0674B40CC4;
	Mon,  5 Aug 2024 04:37:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p_VzZaXUCn09; Mon,  5 Aug 2024 04:37:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E2DBD40CCB;
	Mon,  5 Aug 2024 04:37:22 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 989D3164063;
	Mon,  5 Aug 2024 00:37:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][RFC PATCH 13/16] openmpacc: deprecate
Date: Mon,  5 Aug 2024 00:37:10 -0400
Message-Id: <20240805043713.172555-13-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240805043713.172555-1-denis@denix.org>
References: <20240805043713.172555-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Aug 2024 04:37:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15494

From: Denys Dmytriyenko <denys@konsulko.com>

Remove openmpacc component as deprecated and not maintained.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...nativesdk-packagegroup-arago-tisdk-host.bb |  1 -
 .../recipes-ti/openmpacc/clacc_git.bb         | 65 ---------------
 .../openmpacc/openmpacc-examples_git.bb       | 79 -------------------
 .../recipes-ti/openmpacc/openmpacc.inc        | 27 -------
 .../recipes-ti/openmpacc/openmpacc_git.bb     | 20 -----
 5 files changed, 192 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
 delete mode 100644 meta-arago-extras/recipes-ti/openmpacc/openmpacc-exam=
ples_git.bb
 delete mode 100644 meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
 delete mode 100644 meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.=
bb

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packa=
gegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroup=
s/nativesdk-packagegroup-arago-tisdk-host.bb
index ed29b6c4..ccc8d380 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup=
-arago-tisdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup=
-arago-tisdk-host.bb
@@ -11,7 +11,6 @@ EXTRA_TI_TOOLS =3D " \
     nativesdk-ti-cgt6x \
     nativesdk-ti-cgt-pru \
     nativesdk-clocl \
-    ${@oe.utils.all_distro_features(d, "opencl openmp", "nativesdk-clacc=
")} \
     nativesdk-open62541-examples \
     nativesdk-open62541-tests \
     nativesdk-gcc-arm-baremetal \
diff --git a/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb b/meta-a=
rago-extras/recipes-ti/openmpacc/clacc_git.bb
deleted file mode 100644
index f56d65cc..00000000
--- a/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
+++ /dev/null
@@ -1,65 +0,0 @@
-SUMMARY =3D "TI OpenMP-Acc C compiler"
-
-include openmpacc.inc
-
-PR =3D "${INC_PR}.0"
-
-DEPENDS =3D "boost elfutils perl-native"
-RDEPENDS:${PN} +=3D "clocl"
-
-S =3D "${WORKDIR}/git/host"
-
-TARGET:class-target =3D "clacc_arm"
-TARGET:class-native =3D "clacc_x86"
-TARGET:class-nativesdk =3D "clacc_x86"
-
-export LINUX_DEVKIT_ROOT =3D "${STAGING_DIR_HOST}"
-export X86_HOST_ROOT =3D "${STAGING_DIR_HOST}"
-
-PARALLEL_MAKE =3D ""
-
-# The variables CLACC_CC and CLACC_CXX are used to point clacc to set it=
s
-# host_cc and host_link_cc variables which were previously hardcoded in =
clacc.h.
-# This adds support for different toolchain configurations to build clac=
c by
-# passing in the compiler names at the build stage and removes correspon=
ding
-# string replacement requirements in yocto recipes.
-python __anonymous() {
-    cc_name =3D ""
-    cxx_name =3D ""
-    if d.getVar("TOOLCHAIN_PREFIX"):
-        cc_name =3D d.getVar("TOOLCHAIN_PREFIX") + "gcc"
-        cxx_name =3D d.getVar("TOOLCHAIN_PREFIX") + "g++"
-    else:
-        cc_name =3D d.getVar("TARGET_PREFIX") + "gcc"
-        cxx_name =3D d.getVar("TARGET_PREFIX") + "g++"
-
-    # Convert to upper case to workaround GCC preprocessor bug where the=
 word
-    # 'linux' is defined to be 1. This results in arm-linux-gnueabihf- b=
eing
-    # stringized to arm-1-gnueabihf- by the GCC preprocessor. To workaro=
und this
-    # bug, convert the names to upper case and send through. Clacc will =
convert
-    # to lower case before usage.
-    d.setVar("CLACC_CC_NAME", cc_name.upper())
-    d.setVar("CLACC_CXX_NAME", cxx_name.upper())
-}
-
-
-EXTRA_OEMAKE =3D " -C ${S}/clacc \
-                  ${TARGET} \
-                  CXX=3D"${CXX}" \
-                  CLACC_CC=3D"${CLACC_CC_NAME}" \
-                  CLACC_CXX=3D"${CLACC_CXX_NAME}" \
-"
-
-do_compile() {
-    oe_runmake
-}
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 755 clacc/${TARGET} ${D}${bindir}/clacc
-
-    install -d ${D}${mandir}/man1
-    install -m 644 clacc/clacc.1 ${D}${mandir}/man1
-}
-
-BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_gi=
t.bb b/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
deleted file mode 100644
index 260daf03..00000000
--- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
+++ /dev/null
@@ -1,79 +0,0 @@
-SUMMARY =3D "TI OpenMP-Acc example applications"
-
-include openmpacc.inc
-
-PR =3D "${INC_PR}.1"
-
-DEPENDS =3D "openmpacc clacc-native clocl-native ti-cgt6x-native"
-RDEPENDS:${PN} +=3D "opencl-runtime"
-
-S =3D "${WORKDIR}/git/openmpacc-examples-src"
-
-OMPACC_EXAMPLE_LIST =3D " target_update \
-                        vecadd \
-                        printf_debug \
-                        edmamgr \
-                        dspheap \
-                        target_orphan_call \
-                        target_implicit_map \
-                        vecadd_t \
-                        vecadd_complex \
-                        local \
-                        null \
-                        dsplib_fft \
-                        sub_section \
-"
-
-python do_unpack:append() {
-    import shutil
-
-    git_dir =3D d.expand("${WORKDIR}/git/examples")
-    s =3D d.getVar("S")
-
-    os.makedirs(s)
-    shutil.copy(os.path.join(git_dir,"Makefile"),s)
-    shutil.copy(os.path.join(git_dir,"make.inc"),s)
-    for example in d.getVar("OMPACC_EXAMPLE_LIST").split():
-        shutil.copytree(os.path.join(git_dir,example), os.path.join(s,ex=
ample))
-}
-
-EXTRA_OEMAKE =3D " TARGET_ROOTDIR=3D${STAGING_DIR_HOST} \
-                 TI_OCL_CGT_INSTALL=3D${STAGING_DIR_NATIVE}/usr/share/ti=
/cgt-c6x \
-"
-
-MKFILELIST =3D "vecadd/Makefile vecadd_complex/Makefile dsplib_fft/Makef=
ile \
-null/Makefile dspheap/Makefile target_implicit_map/Makefile printf_debug=
/Makefile \
-edmamgr/Makefile vecadd_t/Makefile target_orphan_call/Makefile target_up=
date/Makefile \
-sub_section/Makefile local/Makefile"
-
-do_configure() {
-    for f in ${MKFILELIST}; do
-        sed "s|-fopenmp|-fopenmp ${TUNE_CCARGS}${TOOLCHAIN_OPTIONS}|g" -=
i $f
-    done
-}
-
-do_compile() {
-    oe_runmake
-}
-
-do_install() {
-    install -d ${D}${datadir}/ti/examples/openmpacc
-
-    install -m 644 ${B}/Makefile ${D}${datadir}/ti/examples/openmpacc
-    install -m 644 ${B}/make.inc ${D}${datadir}/ti/examples/openmpacc
-
-    for ompacc_example in ${OMPACC_EXAMPLE_LIST}; do
-        install -d ${D}${datadir}/ti/examples/openmpacc/${ompacc_example=
}
-        cp -rv ${B}/${ompacc_example}/* ${D}${datadir}/ti/examples/openm=
pacc/${ompacc_example}
-    done
-}
-
-FILES:${PN} +=3D "\
-    ${datadir}/ti/examples/openmpacc \
-"
-
-FILES:${PN}-dbg +=3D "\
-    ${datadir}/ti/examples/openmpacc/*/.debug \
-"
-
-INSANE_SKIP:${PN} =3D "arch ldflags textrel staticdev"
diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc b/meta-=
arago-extras/recipes-ti/openmpacc/openmpacc.inc
deleted file mode 100644
index a54fa48d..00000000
--- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY =3D "TI OpenMP Accelerator Model"
-HOMEPAGE =3D "http://downloads.ti.com/mctools/esd/docs/openmpacc/"
-LICENSE =3D "BSD-3-Clause"
-
-inherit features_check
-
-REQUIRED_MACHINE_FEATURES =3D "dsp"
-REQUIRED_MACHINE_FEATURES:class-native =3D ""
-REQUIRED_MACHINE_FEATURES:class-nativesdk =3D ""
-REQUIRED_DISTRO_FEATURES =3D "opencl openmp"
-
-PV =3D "1.5.6.0"
-INC_PR =3D "r0"
-
-LIC_FILES_CHKSUM =3D "file://../debian/copyright;md5=3Daaa2a0939d0819713=
2fc382e97b62eb0"
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/openmpacc:"
-
-OMPACC_GIT_URI =3D "git://git.ti.com/git/openmp/ti-openmpacc.git"
-OMPACC_GIT_PROTOCOL =3D "https"
-OMPACC_GIT_BRANCH =3D "master"
-
-OMPACC_SRCREV =3D "7c4e68a0bf73ec193edff9dfc23ea764ae6ad434"
-
-BRANCH =3D "${OMPACC_GIT_BRANCH}"
-SRC_URI =3D "${OMPACC_GIT_URI};protocol=3D${OMPACC_GIT_PROTOCOL};branch=3D=
${BRANCH}"
-SRCREV =3D "${OMPACC_SRCREV}"
diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb b/me=
ta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
deleted file mode 100644
index 7a18e47e..00000000
--- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION =3D "TI OpenMP-Acc host runtime and development packages"
-
-include openmpacc.inc
-
-PR =3D "${INC_PR}.1"
-
-inherit cmake
-
-DEPENDS =3D "boost boost-native opencl"
-RDEPENDS:${PN} +=3D "opencl-runtime"
-RDEPENDS:${PN}-dev +=3D "clacc"
-
-S =3D "${WORKDIR}/git/host"
-
-export TARGET_ROOTDIR =3D "${STAGING_DIR_HOST}"
-export LINUX_DEVKIT_ROOT =3D "${STAGING_DIR_HOST}"
-
-EXTRA_OECMAKE +=3D "-DVERSION=3D"${PV}" -DBUILD_OUTPUT=3Dlib"
-
-FILES:${PN} +=3D "/usr/share/ti/openmpacc/*"
--=20
2.25.1


