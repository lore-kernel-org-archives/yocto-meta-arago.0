Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17ECCC52D71
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 04:37:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.975.1722832643304821104
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 04 Aug 2024 21:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 992F140CAF;
	Mon,  5 Aug 2024 04:37:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id usPpOAEmxQ9A; Mon,  5 Aug 2024 04:37:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 83D8640CB0;
	Mon,  5 Aug 2024 04:37:21 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 3B1F3164058;
	Mon,  5 Aug 2024 00:37:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][RFC PATCH 03/16] qt-opencv-opencl-opengl-multithreaded: deprecate
Date: Mon,  5 Aug 2024 00:37:00 -0400
Message-Id: <20240805043713.172555-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240805043713.172555-1-denis@denix.org>
References: <20240805043713.172555-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Aug 2024 04:37:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15484

From: Denys Dmytriyenko <denys@konsulko.com>

Old analytics demos haven't been maintained for quite some time, remove.

This demo used to offload processing tasks to DSP using heavily modified
OpenCL/OpenCV forks of old versions of corresponding upstream projects.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...-opencv-opencl-opengl-multithreaded_git.bb | 46 -------------------
 ...group-arago-tisdk-multimedia-sdk-target.bb |  1 -
 2 files changed, 47 deletions(-)
 delete mode 100644 meta-arago-demos/recipes-apps/video-analytics-demo/qt=
-opencv-opencl-opengl-multithreaded_git.bb

diff --git a/meta-arago-demos/recipes-apps/video-analytics-demo/qt-opencv=
-opencl-opengl-multithreaded_git.bb b/meta-arago-demos/recipes-apps/video=
-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
deleted file mode 100644
index de672e28..00000000
--- a/meta-arago-demos/recipes-apps/video-analytics-demo/qt-opencv-opencl=
-opengl-multithreaded_git.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-DESCRIPTION =3D "A simple multithreaded OpenCV example application using=
 the Qt framework"
-HOMEPAGE =3D "https://github.com/devernay/qt-opencv-multithreaded"
-SECTION =3D "multimedia"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De28b998056a1a513e87be11c5045e=
85b"
-
-inherit features_check
-
-REQUIRED_MACHINE_FEATURES =3D "dsp gpu"
-REQUIRED_DISTRO_FEATURES =3D "opencv opencl opengl"
-
-DEPENDS +=3D "opencv opencl virtual/egl ti-cgt6x-native clocl-native dsp=
lib-c66x"
-
-COMPATIBLE_MACHINE =3D "dra7xx"
-
-PV =3D "1.3.3"
-PR =3D "r3"
-
-BRANCH =3D "master"
-SRC_URI =3D "git://git.ti.com/git/apps/qt-opencv-opencl-opengl-multithre=
aded.git;protocol=3Dhttps;branch=3D${BRANCH}"
-
-SRCREV =3D "80051ec8befd921e40cfb74a49234ed045576bbc"
-
-S =3D "${WORKDIR}/git"
-
-inherit qt5
-
-export TARGET_ROOTDIR =3D "${STAGING_DIR_HOST}"
-export TI_OCL_CGT_INSTALL =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6=
x"
-export TI_DSPLIB_DIR =3D "${STAGING_DIR_TARGET}/usr/share/ti/ti-dsplib-c=
66x-tree"
-
-CXXFLAGS:append =3D " -DOCV_NATIVE "
-
-do_compile() {
-    cd ${S}
-    oe_runmake -f oclMakefile
-    cd -
-    oe_runmake
-}
-
-do_install() {
-    install -d ${D}/usr/bin
-    install -m 755 qt-opencv-opencl-opengl-multithreaded ${D}/usr/bin/qt=
-opencv-opencl-opengl-multithreaded
-}
-
-RDEPENDS:${PN} +=3D "opencv opencl-runtime"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packa=
gegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
index 62bcc0ea..121af56d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-multimedia-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-multimedia-sdk-target.bb
@@ -13,7 +13,6 @@ BARCODE_PKG =3D ""
=20
 MULTIMEDIA =3D ""
=20
-#    ${@['','qt-opencv-opencl-opengl-multithreaded-dev'][oe.utils.all_di=
stro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contai=
ns('MACHINE_FEATURES', 'gpu dsp', True, False, d)]}
 MULTIMEDIA:append:dra7xx =3D " \
     hevc-arm-decoder-dev \
     hevc-arm-decoder-staticdev \
--=20
2.25.1


