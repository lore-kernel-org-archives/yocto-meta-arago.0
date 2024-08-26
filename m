Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BADC54731
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 19:16:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.60346.1724699778653244516
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 26 Aug 2024 12:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EE77840A03;
	Mon, 26 Aug 2024 19:16:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pQ6YZVOuxhL1; Mon, 26 Aug 2024 19:16:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C9E3840C67;
	Mon, 26 Aug 2024 19:16:16 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 843C8164061;
	Mon, 26 Aug 2024 15:16:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 02/16] packagegroup: remove opencl/openmp packagegroups
Date: Mon, 26 Aug 2024 15:15:51 -0400
Message-Id: <20240826191605.8190-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826191605.8190-1-denis@denix.org>
References: <20240826191605.8190-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 26 Aug 2024 19:16:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15515

From: Denys Dmytriyenko <denys@konsulko.com>

These packagegroups used to group together components for OpenCL/MP suppo=
rt
and related other libraries, which are being deprecated. Remove them firs=
t
for bisectability.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../images/tisdk-default-image.bb             |  7 -----
 ...kagegroup-arago-tisdk-opencl-sdk-target.bb | 22 -------------
 .../packagegroup-arago-tisdk-opencl.bb        | 31 -------------------
 ...ckagegroup-arago-toolchain-tisdk-target.bb |  1 -
 .../recipes-core/packagegroups/ti-opencl.bb   | 12 -------
 .../recipes-core/packagegroups/ti-world.bb    |  6 ----
 6 files changed, 79 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-opencl-sdk-target.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-opencl.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/ti-openc=
l.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb=
 b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 4b5697e5..faae53d3 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -18,7 +18,6 @@ IMAGE_INSTALL +=3D "\
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-=
tisdk-graphics','',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-=
tisdk-gtk','',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-=
tisdk-qte','',d)} \
-    ${@['','packagegroup-arago-tisdk-opencl'][oe.utils.all_distro_featur=
es(d, 'opencl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'd=
sp', True, False, d)]} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
     packagegroup-arago-tisdk-multimedia \
@@ -54,13 +53,7 @@ DEVTOOLS =3D " \
     dtc \
 "
=20
-OPENCL =3D " \
-    ${@bb.utils.contains('MACHINE_FEATURES','dsp','ti-opencl','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-ti=
sdk-opencl-extra','',d)} \
-"
-
 IMAGE_INSTALL +=3D "\
-    ${@oe.utils.all_distro_features(d, "opencl", "${OPENCL}")} \
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "${PYTHON=
2APPS}", "", d)} \
     ${DEVTOOLS} \
     ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} =
\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-opencl-sdk-target.bb b/meta-arago-distro/recipes-core/packagegr=
oups/packagegroup-arago-tisdk-opencl-sdk-target.bb
deleted file mode 100644
index b660fcb4..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-opencl-sdk-target.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION =3D "Task to install headers and libraries of OpenCL/MP and =
related components"
-LICENSE =3D "MIT"
-PR =3D "r2"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup features_check
-
-REQUIRED_DISTRO_FEATURES =3D "opencl"
-
-UTILS =3D " \
-    opencl-staticdev \
-    ${@oe.utils.all_distro_features(d, 'openmp', 'openmpacc-dev')} \
-"
-
-UTILS:append:dra7xx =3D " \
-    ${@oe.utils.all_distro_features(d, 'openmp', 'linalg-dev')} \
-"
-
-RDEPENDS:${PN} =3D "\
-    ${UTILS} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-opencl.bb
deleted file mode 100644
index 1aba3f7b..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-opencl.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION =3D "Task to install OpenCL/MP and related components"
-LICENSE =3D "MIT"
-PR =3D "r4"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup features_check
-
-REQUIRED_DISTRO_FEATURES =3D "opencl"
-
-PACKAGES =3D+ "${PN}-extra"
-
-MAIN_PKGS =3D " \
-    opencl-examples-offline-compile \
-"
-
-EXTRA_PKGS =3D " \
-"
-
-#    ti-fftw-examples
-EXTRA_PKGS:append:dra7xx =3D " \
-    ${@oe.utils.all_distro_features(d, 'openmp', 'linalg-examples')} \
-"
-
-RDEPENDS:${PN} =3D "\
-    ${MAIN_PKGS} \
-"
-
-RDEPENDS:${PN}-extra =3D "\
-    ${EXTRA_PKGS} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegro=
ups/packagegroup-arago-toolchain-tisdk-target.bb
index cdf54ecc..43cd9c59 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-too=
lchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-too=
lchain-tisdk-target.bb
@@ -23,6 +23,5 @@ RDEPENDS:${PN} =3D "\
     ${TISDK_TOOLCHAIN_BASE_TARGET} \
     ${TISDK_TOOLCHAIN_EXTRA_TARGET} \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-=
tisdk-graphics-sdk-target','',d)} \
-    ${@['','packagegroup-arago-tisdk-opencl-sdk-target'][oe.utils.all_di=
stro_features(d, 'opencl', True, False) and bb.utils.contains('MACHINE_FE=
ATURES', 'dsp', True, False, d)]} \
     packagegroup-arago-tisdk-addons-sdk-target \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-opencl.bb b/=
meta-arago-distro/recipes-core/packagegroups/ti-opencl.bb
deleted file mode 100644
index ecae271f..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/ti-opencl.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-# This is just an alias between debian and OE names
-
-LICENSE =3D "MIT"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-PACKAGES +=3D "${PN}-runtime"
-
-RDEPENDS:${PN} =3D "opencl"
-RDEPENDS:${PN}-runtime =3D "opencl-runtime"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/m=
eta-arago-distro/recipes-core/packagegroups/ti-world.bb
index 5db67fdf..438dd8d0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -33,11 +33,6 @@ DEVTOOLS =3D " \
     git \
 "
=20
-OPENCL =3D " \
-    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-ti=
sdk-opencl ti-opencl','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-ti=
sdk-opencl-extra','',d)} \
-"
-
 RDEPENDS:${PN} =3D "\
     packagegroup-arago-base \
     packagegroup-arago-console \
@@ -45,7 +40,6 @@ RDEPENDS:${PN} =3D "\
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-=
tisdk-graphics','',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-=
tisdk-gtk','',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-=
tisdk-qte qt3d-examples','',d)} \
-    ${@oe.utils.all_distro_features(d, "opencl", "${OPENCL}")} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
     packagegroup-arago-tisdk-multimedia \
--=20
2.25.1


