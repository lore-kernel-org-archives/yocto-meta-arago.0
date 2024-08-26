Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6597CC54735
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 19:16:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.60353.1724699792840434117
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 26 Aug 2024 12:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3721140CC4;
	Mon, 26 Aug 2024 19:16:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jsNM6jBlGty1; Mon, 26 Aug 2024 19:16:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 20A6540CBF;
	Mon, 26 Aug 2024 19:16:31 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D751E164065;
	Mon, 26 Aug 2024 15:16:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [scarthgap][PATCH 05/16] arm-compute-library: remove
Date: Mon, 26 Aug 2024 15:16:14 -0400
Message-Id: <20240826191625.8267-5-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826191625.8267-1-denis@denix.org>
References: <20240826191625.8267-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 26 Aug 2024 19:16:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15534

From: Denys Dmytriyenko <denys@konsulko.com>

Remove local copy of an old and outdated arm-compute-library component.

There are much newer versions of this component available from other laye=
rs.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...kagegroup-arago-tisdk-addons-sdk-target.bb |  5 +-
 .../arm-compute-library_git.bb                | 61 -------------------
 2 files changed, 1 insertion(+), 65 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-support/arm-compute-library=
/arm-compute-library_git.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegr=
oups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 0cd1b540..e91f33c9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-target.bb
@@ -38,24 +38,21 @@ PDM_ANOMALY_PKG_DEV =3D "\
=20
 EXTRA_PACKAGES =3D ""
 #EXTRA_PACKAGES:append:ti33x =3D " \
-#                                arm-compute-library-dev \
 #                                tensorflow-lite-dev \
 #                                tensorflow-lite-staticdev \
 #                                ${PDM_ANOMALY_PKG_DEV} \
 #"
 #EXTRA_PACKAGES:append:ti43x =3D " \
-#                                arm-compute-library-dev \
 #                                tensorflow-lite-dev \
 #                                tensorflow-lite-staticdev \
 #                                ${PDM_ANOMALY_PKG_DEV} \
 #"
 #EXTRA_PACKAGES:append:omap-a15 =3D " \
-#                                arm-compute-library-dev \
 #                                tensorflow-lite-dev \
 #                                tensorflow-lite-staticdev \
 #                                ${PDM_ANOMALY_PKG_DEV} \
 #"
-#EXTRA_PACKAGES:append:am65xx =3D " arm-compute-library-dev \
+#EXTRA_PACKAGES:append:am65xx =3D " \
 #                             tensorflow-lite-dev \
 #                             tensorflow-lite-staticdev \
 #                             ${PDM_ANOMALY_PKG_DEV} \
diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-co=
mpute-library_git.bb b/meta-arago-extras/recipes-support/arm-compute-libr=
ary/arm-compute-library_git.bb
deleted file mode 100644
index 3612f7b9..00000000
--- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-l=
ibrary_git.bb
+++ /dev/null
@@ -1,61 +0,0 @@
-SUMMARY =3D "The ARM Computer Vision and Machine Learning library"
-DESCRIPTION =3D "The ARM Computer Vision and Machine Learning library is=
 a set of functions optimised for both ARM CPUs and GPUs."
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8948bc85114b3b716576ef8d732f0=
34f"
-
-COMPATIBLE_MACHINE =3D "armv7a|aarch64"
-
-SRC_URI =3D " \
-    git://review.mlplatform.org/ml/ComputeLibrary;protocol=3Dhttps;branc=
h=3D${BRANCH} \
-"
-
-PR =3D "r0"
-PV  =3D "19.08"
-PV_MAJOR =3D "${@d.getVar('PV',d,1).split('.')[0]}"
-
-BRANCH =3D "branches/arm_compute_19_08"
-SRCREV =3D "35c3eb011d8e2813d83c6a6cbe28a446534e4a14"
-
-S =3D "${WORKDIR}/git"
-
-do_compile:prepend() {
-    sed -i 's/arm-linux-gnueabihf-/${TOOLCHAIN_SYS}-/' SConstruct
-    sed -i 's/aarch64-linux-gnu-/${TOOLCHAIN_SYS}-/' SConstruct
-    sed -i "s#env.Append(LINKFLAGS =3D \['-fopenmp'\])#env.Append(LINKFL=
AGS =3D \['-fopenmp','--sysroot=3D${STAGING_DIR_TARGET}'\])#" SConstruct
-    unset CC CXX
-}
-
-inherit scons
-
-EXTRA_OESCONS =3D "arch=3Darmv7a extra_cxx_flags=3D"-fPIC -Wno-unused-bu=
t-set-variable -Wno-ignored-qualifiers -Wno-noexcept ${TOOLCHAIN_OPTIONS}=
" benchmark_tests=3D1 validation_tests=3D0 neon=3D1 openmp=3D1 opencl=3D0=
 set_soname=3D1"
-EXTRA_OESCONS:aarch64 =3D "arch=3Darm64-v8a extra_cxx_flags=3D"-fPIC -Wn=
o-unused-but-set-variable -Wno-ignored-qualifiers -Wno-noexcept ${TOOLCHA=
IN_OPTIONS}" benchmark_tests=3D1 validation_tests=3D0 neon=3D1 openmp=3D1=
 opencl=3D0 set_soname=3D1"
-
-LIBS +=3D "-larmpl_lp64_mp"
-
-do_install() {
-    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downersh=
ip"
-
-    install -d ${D}${libdir}
-    for lib in ${S}/build/*.so*
-    do
-        cp $CP_ARGS $lib ${D}${libdir}
-    done
-
-    # Install 'example' and benchmark executables
-    install -d ${D}${bindir}
-    find ${S}/build/examples/ -maxdepth 1 -type f -executable -exec cp $=
CP_ARGS {} ${D}${bindir} \;
-    cp $CP_ARGS ${S}/build/tests/arm_compute_benchmark ${D}${bindir}
-
-    # Install built source package as expected by ARMNN
-    install -d ${D}${datadir}/${BPN}
-    cp $CP_ARGS ${S}/arm_compute ${D}${datadir}/${BPN}/.
-    cp $CP_ARGS ${S}/include ${D}${datadir}/${BPN}/.
-    cp $CP_ARGS ${S}/support ${D}${datadir}/${BPN}/.
-}
-
-INSANE_SKIP:${PN} =3D "ldflags"
-INSANE_SKIP:${PN}-dev =3D "dev-elf ldflags"
-
-FILES:${PN}-source =3D "${datadir}/${BPN}"
-INSANE_SKIP:${PN}-source =3D "ldflags libdir staticdev"
-INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
--=20
2.25.1


