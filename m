Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637A1C64EC7
	for <webhook@archiver.kernel.org>; Sat, 25 Feb 2023 04:40:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.38589.1677300049204722602
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 20:40:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B383C40C5F;
	Sat, 25 Feb 2023 04:40:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z--uQIoEcSWU; Sat, 25 Feb 2023 04:40:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8B88F40C06;
	Sat, 25 Feb 2023 04:40:46 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C89C316375B;
	Fri, 24 Feb 2023 23:40:20 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] matrix, packagegroup: disable qtwebkit and matrix gui for omapl138/armv5
Date: Sat, 25 Feb 2023 04:40:43 +0000
Message-Id: <20230225044043.1930477-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 25 Feb 2023 04:40:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14227

From: Denys Dmytriyenko <denys@konsulko.com>

Latest qtwebkit 5.15 fails to build for armv5 with bunch of errors like:

Error: selected processor does not support `movw r8,#:lower16:.Lllint_op_=
enter-.LrelativePCBase' in ARM mode

Since omapl138/armv5 is already underpowered and has no graphics, it does=
n't
make too much sense to run matrix gui in qtwebkit while software renderin=
g
everything offscreen.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-qte.bb | 5 ++++-
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb     | 1 +
 meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb  | 1 +
 .../packagegroup-arago-qte-toolchain-target.bb           | 9 +++++++--
 4 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-qte.bb
index 6dac7bfb..129838cc 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte=
.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte=
.bb
@@ -6,6 +6,9 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit packagegroup
=20
+WEBKIT =3D "qtwebkit-qmlplugins"
+WEBKIT:armv5 =3D ""
+
 RDEPENDS:${PN} =3D "\
     qtbase-plugins \
     qtdeclarative-qmlplugins \
@@ -20,7 +23,7 @@ RDEPENDS:${PN} =3D "\
     qtgraphicaleffects-qmlplugins \
     qtvirtualkeyboard-plugins \
     qtvirtualkeyboard-qmlplugins \
-    qtwebkit-qmlplugins \
+    ${WEBKIT} \
     liberation-fonts \
     qtconnectivity \
     qtconnectivity-qmlplugins \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-matrix.bb
index d4a4712c..63afc4ec 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-matrix.bb
@@ -17,6 +17,7 @@ MATRIX_GUI =3D "               \
     refresh-screen           \
     matrix-gui-browser       \
 "
+MATRIX_GUI:omapl138 =3D ""
=20
 MATRIX_COMMON_APPS =3D "              \
     matrix-gui-armbenchmarks-demos  \
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/me=
ta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index b22f1151..9299a929 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -59,6 +59,7 @@ do_install(){
 }
=20
 GUIDEPS =3D "${@bb.utils.contains('DISTRO_FEATURES','opengl',"matrix-gui=
-browser refresh-screen",'',d)}"
+GUIDEPS:omapl138 =3D ""
=20
 RDEPENDS:${PN} +=3D "matrix-lighttpd-config lighttpd lighttpd-module-cgi=
 lighttpd-module-deflate lighttpd-module-expire php php-cgi php-cli ${GUI=
DEPS}"
=20
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-ar=
ago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroup=
s/packagegroup-arago-qte-toolchain-target.bb
index e0fb9a1d..0380f3a6 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte=
-toolchain-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte=
-toolchain-target.bb
@@ -7,6 +7,12 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit packagegroup
=20
+WEBKIT =3D " \
+        qtwebkit-mkspecs \
+        qtwebkit-dev \
+"
+WEBKIT:armv5 =3D ""
+
 RDEPENDS:${PN} +=3D " \
         packagegroup-arago-standalone-sdk-target \
         libsqlite3-dev \
@@ -27,8 +33,7 @@ RDEPENDS:${PN} +=3D " \
         qtsensors-dev \
         qtsvg-dev \
         qtxmlpatterns-dev \
-        qtwebkit-mkspecs \
-        qtwebkit-dev \
+        ${WEBKIT} \
         ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "qtwe=
bengine-mkspecs qtwebengine-dev", "", d)} \
         qtserialport-mkspecs \
         qtserialport-dev  \
--=20
2.25.1


