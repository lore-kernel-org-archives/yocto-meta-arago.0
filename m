Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732F5C47E49
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 22:07:20 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.172.1706134032602259612
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 Jan 2024 14:07:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DEF2040C50;
	Wed, 24 Jan 2024 22:07:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rjF5Q3GhrGU6; Wed, 24 Jan 2024 22:07:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C871840C1E;
	Wed, 24 Jan 2024 22:07:09 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 79664163DDA;
	Wed, 24 Jan 2024 17:07:09 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 1/2] libcamera: drop old 0.0.5 version
Date: Wed, 24 Jan 2024 17:07:07 -0500
Message-Id: <20240124220708.2031475-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 Jan 2024 22:07:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15090

From: Denys Dmytriyenko <denys@konsulko.com>

This version no longer works with Python 3.12

Version 0.1.0 from meta-openembedded/meta-multimedia has a workaround pat=
ch.

Upstream 0.2.0 version has this fixed and the update patch has been submi=
tted:
https://patchwork.yoctoproject.org/project/oe/patch/20240124215938.203054=
8-1-denis@denix.org/

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../0001-simple-Support-TI-CSI-RX.patch       | 32 ---------
 .../libcamera/libcamera_0.0.5.bb              | 72 -------------------
 2 files changed, 104 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/libcamera/libcam=
era/0001-simple-Support-TI-CSI-RX.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/libcamera/libcam=
era_0.0.5.bb

diff --git a/meta-arago-extras/recipes-multimedia/libcamera/libcamera/000=
1-simple-Support-TI-CSI-RX.patch b/meta-arago-extras/recipes-multimedia/l=
ibcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch
deleted file mode 100644
index e1c30b61..00000000
--- a/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simpl=
e-Support-TI-CSI-RX.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From d0e4f4f224671e9fc992d39e7beb9c486303ede1 Mon Sep 17 00:00:00 2001
-From: Jai Luthra <j-luthra@ti.com>
-Date: Thu, 23 Mar 2023 11:38:46 +0530
-Subject: [PATCH] simple: Support TI CSI-RX
-
-Add support for TI's CSI-RX pixel grabber device for the simple
-pipeline.
-
-The driver is not yet merged, but v7 is posted [1] upstream.
-
-Link: https://lore.kernel.org/all/20230314115516.667-1-vaishnav.a@ti.com=
/ [1]
-Upstream-Status: Pending
-Signed-off-by: Jai Luthra <j-luthra@ti.com>
----
- src/libcamera/pipeline/simple/simple.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/libcamera/pipeline/simple/simple.cpp b/src/libcamera/pi=
peline/simple/simple.cpp
-index e1f8b989..520405a1 100644
---- a/src/libcamera/pipeline/simple/simple.cpp
-+++ b/src/libcamera/pipeline/simple/simple.cpp
-@@ -194,6 +194,8 @@ static const SimplePipelineInfo supportedDevices[] =3D=
 {
-	{ "mxc-isi", {} },
-	{ "qcom-camss", {} },
-	{ "sun6i-csi", {} },
-+	{ "j721e-csi2rx", {} },
-+
- };
-
- } /* namespace */
---
-2.41.0
diff --git a/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0=
.5.bb b/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
deleted file mode 100644
index f4290320..00000000
--- a/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
+++ /dev/null
@@ -1,72 +0,0 @@
-SUMMARY =3D "Linux libcamera framework"
-SECTION =3D "libs"
-
-LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
-
-LIC_FILES_CHKSUM =3D "\
-    file://LICENSES/GPL-2.0-or-later.txt;md5=3Dfed54355545ffd980b814dab4=
a3b312c \
-    file://LICENSES/LGPL-2.1-or-later.txt;md5=3D2a4f4fd2128ea2f65047ee63=
fbca9f68 \
-"
-
-SRC_URI =3D " \
-        git://git.libcamera.org/libcamera/libcamera.git;protocol=3Dhttps=
;branch=3Dmaster \
-        file://0001-simple-Support-TI-CSI-RX.patch \
-"
-
-SRCREV =3D "fb44403f1c5571549ac128c21daee9761eb9249c"
-
-PE =3D "1"
-
-S =3D "${WORKDIR}/git"
-
-DEPENDS =3D "python3-pyyaml-native python3-jinja2-native python3-ply-nat=
ive python3-jinja2-native udev gnutls chrpath-native libevent libyaml"
-DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtba=
se-native', '', d)}"
-
-PACKAGES =3D+ "${PN}-gst"
-
-PACKAGECONFIG ??=3D ""
-PACKAGECONFIG[gst] =3D "-Dgstreamer=3Denabled,-Dgstreamer=3Ddisabled,gst=
reamer1.0 gstreamer1.0-plugins-base"
-
-LIBCAMERA_PIPELINES ??=3D "auto"
-
-EXTRA_OEMESON =3D " \
-    -Dpipelines=3D${LIBCAMERA_PIPELINES} \
-    -Dv4l2=3Dtrue \
-    -Dcam=3Denabled \
-    -Dlc-compliance=3Ddisabled \
-    -Dtest=3Dfalse \
-    -Ddocumentation=3Ddisabled \
-"
-
-RDEPENDS:${PN} =3D "${@bb.utils.contains('DISTRO_FEATURES', 'wayland qt'=
, 'qtwayland', '', d)}"
-
-inherit meson pkgconfig python3native
-
-do_configure:prepend() {
-    sed -i -e 's|py_compile=3DTrue,||' ${S}/utils/ipc/mojo/public/tools/=
mojom/mojom/generate/template_expander.py
-}
-
-do_install:append() {
-    chrpath -d ${D}${libdir}/libcamera.so
-    chrpath -d ${D}${libdir}/v4l2-compat.so
-}
-
-addtask do_recalculate_ipa_signatures_package after do_package before do=
_packagedata
-do_recalculate_ipa_signatures_package() {
-    local modules
-    for module in $(find ${PKGD}/usr/lib/libcamera -name "*.so.sign"); d=
o
-        module=3D"${module%.sign}"
-        if [ -f "${module}" ] ; then
-            modules=3D"${modules} ${module}"
-        fi
-    done
-
-    ${S}/src/ipa/ipa-sign-install.sh ${B}/src/ipa-priv-key.pem "${module=
s}"
-}
-
-FILES:${PN} +=3D " ${libdir}/v4l2-compat.so"
-FILES:${PN}-gst =3D "${libdir}/gstreamer-1.0"
-
-# libcamera-v4l2 explicitly sets _FILE_OFFSET_BITS=3D32 to get access to
-# both 32 and 64 bit file APIs.
-GLIBC_64BIT_TIME_FLAGS =3D ""
--=20
2.25.1


