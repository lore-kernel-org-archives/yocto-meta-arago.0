Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4301EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 21:23:42 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.36483.1688678621991471891
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 14:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5696640C13;
	Thu,  6 Jul 2023 21:23:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GDykO1S9FKWf; Thu,  6 Jul 2023 21:23:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3FCAF40C8E;
	Thu,  6 Jul 2023 21:23:40 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id E42B4163BF3;
	Thu,  6 Jul 2023 17:23:38 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [kirkstone][PATCH 6/6] tisdk-bundle: package up secondary K3R5 toolchain
Date: Thu,  6 Jul 2023 21:23:35 +0000
Message-Id: <20230706212335.1893675-7-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230706212335.1893675-1-denis@denix.org>
References: <20230706212335.1893675-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 21:23:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14789

From: Denys Dmytriyenko <denys@konsulko.com>

Use multiconfig to build and package a secondary toolchain for K3R5 cores=
.
This makes some assumptions about k3r5 multiconfig using baremetal TCLIBC
in meta-ti-bsp.

The toolchain for k3r5 is not combined with the Linux one and is packaged
independently as k3r5-devkit.sh along with the main linux-devkit.sh insid=
e
the TISDK bundle.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../classes/tisdk-bundle.bbclass              | 37 +++++++++++++++----
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-=
distro/classes/tisdk-bundle.bbclass
index c7aba032..7bd46f2f 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -35,10 +35,21 @@ TARGET_IMAGES ?=3D "tisdk-base-image"
 # path to install the meta-toolchain package in the SDK
 TISDK_TOOLCHAIN_PATH ?=3D "linux-devkit"
=20
-# meta toolchain recipe to build and package as part of the tisdk image
+# Linux glibc toolchain recipe(s) to build and package as part of the ti=
sdk bundle
 TISDK_TOOLCHAIN ?=3D "meta-toolchain-arago"
 TOOLCHAIN_SUFFIX ?=3D "-sdk"
=20
+# K3R5 baremetal toolchain recipe(s) to build and package as part of the=
 tisdk bundle
+TOOLCHAIN_MC_DEP =3D ""
+TOOLCHAIN_MC_DEP:k3 =3D "mc::k3r5:meta-toolchain-arago"
+TISDK_TOOLCHAIN_K3R5 ?=3D "${TOOLCHAIN_MC_DEP}"
+TOOLCHAIN_K3R5_SUFFIX ?=3D "-sdk"
+
+# Since K3R5 packaging happens in the main default MC, these vars
+# are not accessible and have to be set here
+ARMPKGARCH_K3R5 ?=3D "armv7a"
+TARGET_OS_K3R5 ?=3D "eabi"
+
 # List of the type of target file system images we want to include
 TARGET_IMAGE_TYPES ?=3D "tar.xz tar.gz ubi wic.gz wic.xz"
=20
@@ -81,6 +92,7 @@ do_rootfs[depends] +=3D "${@string_set('%s:do_image_com=
plete' % pn for pn in (d.ge
 # variable which will force us to build the toolchain first so that it w=
ill be
 # available for packaging
 do_rootfs[depends] +=3D "${@string_set('%s:do_populate_sdk' % pn for pn =
in (d.getVar("TISDK_TOOLCHAIN") or "").split())}"
+do_rootfs[mcdepends] +=3D "${@string_set('%s:do_populate_sdk' % pn for p=
n in (d.getVar("TISDK_TOOLCHAIN_K3R5") or "").split())}"
=20
 do_rootfs[nostamp] =3D "1"
 do_rootfs[lockfiles] +=3D "${IMAGE_ROOTFS}.lock"
@@ -698,12 +710,16 @@ tisdk_image_setup () {
     mkdir -p ${IMAGE_ROOTFS}/var/lib/opkg
     mkdir -p ${IMAGE_ROOTFS}/lib
=20
-    if [ -e ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TO=
OLCHAIN_SUFFIX}.sh ]
+    if [ -e ${SDK_DEPLOY}/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCH=
AIN_SUFFIX}.sh ]
     then
-        chmod 755 ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_O=
S}${TOOLCHAIN_SUFFIX}*.sh
+        chmod 755 ${SDK_DEPLOY}/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${=
TOOLCHAIN_SUFFIX}.sh
=20
         # Temporarily extract the toolchain sdk so we can read license i=
nformation from it.
-        echo "${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}" | ${DEPLOY_DIR}/s=
dk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}*.sh
+        echo "${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}" | ${SDK_DEPLOY}/$=
{SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}.sh
+    fi
+    if [ -e ${SDK_DEPLOY}/${SDK_NAME}-${ARMPKGARCH_K3R5}-${TARGET_OS_K3R=
5}${TOOLCHAIN_K3R5_SUFFIX}.sh ]
+    then
+        chmod 755 ${SDK_DEPLOY}/${SDK_NAME}-${ARMPKGARCH_K3R5}-${TARGET_=
OS_K3R5}${TOOLCHAIN_K3R5_SUFFIX}.sh
     fi
 }
=20
@@ -849,11 +865,18 @@ tisdk_image_build () {
     # not the extracted version
     rm -rf ${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}
=20
-    # Copy over the toolchain sdk installer an give it a simple name whi=
ch
+    # Copy over Linux glibc toolchain sdk installer and give it a simple=
 name which
+    # matches the traditional name within the SDK.
+    if [ -e ${SDK_DEPLOY}/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCH=
AIN_SUFFIX}.sh ]
+    then
+        cp ${SDK_DEPLOY}/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHA=
IN_SUFFIX}.sh ${IMAGE_ROOTFS}/linux-devkit.sh
+    fi
+
+    # Copy over K3R5 baremetal toolchain sdk installer and give it a sim=
ple name which
     # matches the traditional name within the SDK.
-    if [ -e ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TO=
OLCHAIN_SUFFIX}.sh ]
+    if [ -e ${SDK_DEPLOY}/${SDK_NAME}-${ARMPKGARCH_K3R5}-${TARGET_OS_K3R=
5}${TOOLCHAIN_K3R5_SUFFIX}.sh ]
     then
-        cp ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOO=
LCHAIN_SUFFIX}.sh ${IMAGE_ROOTFS}/linux-devkit.sh
+        cp ${SDK_DEPLOY}/${SDK_NAME}-${ARMPKGARCH_K3R5}-${TARGET_OS_K3R5=
}${TOOLCHAIN_K3R5_SUFFIX}.sh ${IMAGE_ROOTFS}/k3r5-devkit.sh
     fi
=20
     # Copy the opkg.conf used by the image to allow for future updates
--=20
2.25.1


