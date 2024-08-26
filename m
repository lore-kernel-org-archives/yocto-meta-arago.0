Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEC5C54740
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 19:16:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.61238.1724699778726706366
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 26 Aug 2024 12:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0D35640CBB;
	Mon, 26 Aug 2024 19:16:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wRg2-3uiRULY; Mon, 26 Aug 2024 19:16:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E1B0840CBF;
	Mon, 26 Aug 2024 19:16:16 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9C06E164064;
	Mon, 26 Aug 2024 15:16:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 04/16] barcode-roi: deprecate
Date: Mon, 26 Aug 2024 15:15:53 -0400
Message-Id: <20240826191605.8190-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826191605.8190-1-denis@denix.org>
References: <20240826191605.8190-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 26 Aug 2024 19:16:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15516

From: Denys Dmytriyenko <denys@konsulko.com>

Old analytics demos haven't been maintained for quite some time, remove.

This demo used to offload processing tasks to DSP using heavily modified
OpenCL/OpenCV forks of old versions of corresponding upstream projects.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../barcode-demo/barcode-roi_git.bb           | 34 -------------------
 ...group-arago-tisdk-multimedia-sdk-target.bb | 10 ------
 2 files changed, 44 deletions(-)
 delete mode 100644 meta-arago-demos/recipes-apps/barcode-demo/barcode-ro=
i_git.bb

diff --git a/meta-arago-demos/recipes-apps/barcode-demo/barcode-roi_git.b=
b b/meta-arago-demos/recipes-apps/barcode-demo/barcode-roi_git.bb
deleted file mode 100644
index ddad14c2..00000000
--- a/meta-arago-demos/recipes-apps/barcode-demo/barcode-roi_git.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-DESCRIPTION =3D "Barcode demo to detect region of interest"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://detect_barcode.cpp;beginline=3D1;endline=3D=
25;md5=3Dbabab64d39715b3671dd16bcb4f4917b"
-
-inherit features_check
-
-REQUIRED_MACHINE_FEATURES =3D "dsp"
-REQUIRED_DISTRO_FEATURES =3D "opencv"
-
-DEPENDS +=3D "opencv"
-
-PV =3D "01.00.00"
-PR =3D "r1"
-
-BRANCH =3D "master"
-SRC_URI =3D "git://git.ti.com/git/apps/barcode-roi-detection.git;protoco=
l=3Dhttps;branch=3D${BRANCH}"
-
-SRCREV =3D "50fa051f66012ebaa10eba1cb289287c4c5e7432"
-
-S =3D "${WORKDIR}/git"
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 755 ${S}/detect_barcode ${D}${bindir}
-
-    install -d ${D}${datadir}/ti/image
-    install -m 644 ${S}/test/sample_barcode.jpg ${D}${datadir}/ti/image
-}
-
-FILES:${PN} +=3D "\
-    ${datadir}/ti/image \
-"
-
-INSANE_SKIP:${PN} =3D "ldflags"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packa=
gegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
index 121af56d..95939c09 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-multimedia-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-multimedia-sdk-target.bb
@@ -6,11 +6,6 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit packagegroup
=20
-BARCODE_PKG =3D ""
-#BARCODE_PKG =3D " \
-#    ${@['','barcode-roi-dev'][oe.utils.all_distro_features(d, 'opencv',=
 True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, Fals=
e, d)]} \
-#"
-
 MULTIMEDIA =3D ""
=20
 MULTIMEDIA:append:dra7xx =3D " \
@@ -18,11 +13,6 @@ MULTIMEDIA:append:dra7xx =3D " \
     hevc-arm-decoder-staticdev \
 "
=20
-MULTIMEDIA:append:ti33x =3D " ${BARCODE_PKG}"
-MULTIMEDIA:append:ti43x =3D " ${BARCODE_PKG}"
-MULTIMEDIA:append:omap-a15 =3D " ${BARCODE_PKG}"
-MULTIMEDIA:append:am65xx =3D " ${BARCODE_PKG}"
-
 RDEPENDS:${PN} =3D "\
     ${MULTIMEDIA} \
     packagegroup-arago-gst-sdk-target \
--=20
2.25.1


