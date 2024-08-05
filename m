Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C85C3DA7F
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 04:37:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1068.1722832643090407988
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 04 Aug 2024 21:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 75F5B40CC3;
	Mon,  5 Aug 2024 04:37:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8KUNpr9_0pOf; Mon,  5 Aug 2024 04:37:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5F09440C21;
	Mon,  5 Aug 2024 04:37:21 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 236FD164000;
	Mon,  5 Aug 2024 00:37:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][RFC PATCH 01/16] ti-analytics: remove
Date: Mon,  5 Aug 2024 00:36:58 -0400
Message-Id: <20240805043713.172555-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Aug 2024 04:37:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15482

From: Denys Dmytriyenko <denys@konsulko.com>

Remove packagegroup that used to build analytics demos and dependencies.
Those demos have been disabled for a while and are being deprecated -
remove corresponding packagegroup first for bisectability.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../images/tisdk-default-image.bb             |  1 -
 .../packagegroups/ti-analytics.bb             | 27 -------------------
 .../recipes-core/packagegroups/ti-world.bb    |  1 -
 3 files changed, 29 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/ti-analy=
tics.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb=
 b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index c282f9e6..4b5697e5 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -25,7 +25,6 @@ IMAGE_INSTALL +=3D "\
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-=
tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
-    ti-analytics \
     ti-demos \
     ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} \
     packagegroup-arago-tisdk-sysrepo \
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb=
 b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
deleted file mode 100644
index e16e4d51..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY =3D "TI World packagegroup"
-LICENSE =3D "MIT"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-TENSORFLOW_DEMO =3D ""
-#TENSORFLOW_DEMO =3D " \
-#    ${@oe.utils.all_distro_features(d, 'opencv', 'tensorflow-lite-demo'=
, '')} \
-#"
-#TENSORFLOW_DEMO:dra7xx =3D " \
-#    ${@['','tensorflow-lite-demo'][oe.utils.all_distro_features(d, 'ope=
ncl opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp'=
, True, False, d)]} \
-#"
-
-ANALYTICS =3D ""
-#ANALYTICS =3D " \
-#    ${TENSORFLOW_DEMO} \
-#    ${@['','qt-opencv-opencl-opengl-multithreaded'][oe.utils.all_distro=
_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('=
MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
-#    ${@['','barcode-roi'][oe.utils.all_distro_features(d, 'opencv', Tru=
e, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d=
)]} \
-#"
-ANALYTICS:j7 =3D ""
-ANALYTICS:omapl138 =3D ""
-
-RDEPENDS:${PN} =3D "\
-    ${ANALYTICS} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/m=
eta-arago-distro/recipes-core/packagegroups/ti-world.bb
index a70701f9..5db67fdf 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -56,7 +56,6 @@ RDEPENDS:${PN} =3D "\
     ${DEVTOOLS} \
     ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} =
\
     packagegroup-arago-misc \
-    ti-analytics \
     ti-demos \
     ${PREFERRED_PROVIDER_virtual/docker} \
 "
--=20
2.25.1


