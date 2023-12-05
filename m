Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BB0C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 15:42:41 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.104005.1701790951961931693
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 05 Dec 2023 07:42:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=GbTlJdP0;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B5FgUrD031083;
	Tue, 5 Dec 2023 09:42:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701790950;
	bh=7tC7LsshizbZPh1ZG3vQMC5PpQvWkhIeHf1rNm8QvvA=;
	h=From:To:Subject:Date;
	b=GbTlJdP0BpdOHRGmQr2KgQNCNSS/uqU+vg+gSnjz8S5q0ytIe6ZsY9rngmu4kZf40
	 LuW2fBHKBfQSa8wXTJMxjfPGjwb6BwdFF2YRpXoDVA0+J4YbuR3hv4yGm8zmblj7z+
	 JJ0py5sZRZlPBMvAl7AfB5y1uDCQXRByYMZAHMGw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B5FgUAd126286
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Dec 2023 09:42:30 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Dec 2023 09:42:30 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Dec 2023 09:42:30 -0600
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B5FgURv111024;
	Tue, 5 Dec 2023 09:42:30 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rAXZ7-0008Ev-Pw; Tue, 05 Dec 2023 09:42:29 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] qtbase: Patch to support xkbcommon 1.6.0
Date: Tue, 5 Dec 2023 09:42:29 -0600
Message-ID: <20231205154229.31600-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 3B5FgUrD031083
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 05 Dec 2023 15:42:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15031

xkbcommon 1.6.0 (and newer) remove 4 defintions that qtbase seems to use.
Backport an upstream patch to look to see if they are defined and
ignore them if they're not.

This is a temporary patch to fix our master builds while we wait for the
meta-q5 patch [1] to make it to the master branch.  This will be
reverted once that patch is promoted.

[1] https://github.com/meta-qt5/meta-qt5/pull/545

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-qt/qt5/qtbase-native_%.bbappend   |  7 +++
 ...ld-with-libxkbcommon-1.6.0-and-later.patch | 55 +++++++++++++++++++
 .../recipes-qt/qt5/qtbase_%.bbappend          |  1 +
 3 files changed, 63 insertions(+)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase-native_%.bbap=
pend
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0027-xkb-fix-=
build-with-libxkbcommon-1.6.0-and-later.patch

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-native_%.bbappend b/=
meta-arago-distro/recipes-qt/qt5/qtbase-native_%.bbappend
new file mode 100644
index 00000000..e49941db
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-native_%.bbappend
@@ -0,0 +1,7 @@
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/qtbase:"
+
+SRC_URI +=3D "\
+    file://0027-xkb-fix-build-with-libxkbcommon-1.6.0-and-later.patch \
+"
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0027-xkb-fix-build-w=
ith-libxkbcommon-1.6.0-and-later.patch b/meta-arago-distro/recipes-qt/qt5=
/qtbase/0027-xkb-fix-build-with-libxkbcommon-1.6.0-and-later.patch
new file mode 100644
index 00000000..ab6e92cc
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase/0027-xkb-fix-build-with-lib=
xkbcommon-1.6.0-and-later.patch
@@ -0,0 +1,55 @@
+From 8946e4874d0e071b182ba5ac438fb4d52d2a44d0 Mon Sep 17 00:00:00 2001
+From: Mark Hatle <mark.hatle@amd.com>
+Date: Fri, 1 Dec 2023 08:17:51 -0700
+Subject: [PATCH] xkb: fix build with libxkbcommon 1.6.0 and later
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Disable the 4 XKB_KEY_dead functions to support libxkbcommon 1.6.0.  See=
:
+
+https://gitlab.freedesktop.org/xorg/proto/xorgproto/-/merge_requests/70
+
+The above URL points to a commit in qt which was used as a basis for the=
 fix.
+
+Upstream-Status: Backport
+[https://github.com/qt/qtbase/commit/8af35d27e8f02bbb99aef4ac495ed406e50=
e3cca]
+
+  xkb: fix build with libxkbcommon 1.6.0 and later
+
+  A few XKB_KEY_dead_* defines got removed from 1.6.0. See also
+  https://github.com/xkbcommon/libxkbcommon/blob/6073565903488cb5b9a8d37=
fdc4a7c2f9d7ad04d/NEWS#L9-L14
+  https://gitlab.freedesktop.org/xorg/proto/xorgproto/-/merge_requests/7=
0/diffs?commit_id=3Dcb44799b72f611eb4c9d7cc185bc3b09e070be08
+
+  Pick-to: 6.6 6.5 6.2 5.15
+  Fixes: QTBUG-117950
+  Change-Id: I55861868f2bb29c553d68365fa9b9b6ed01c9aea
+  Reviewed-by: Tor Arne Vestb=C3=B8 <tor.arne.vestbo@qt.io>
+
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+---
+ src/platformsupport/input/xkbcommon/qxkbcommon.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/platformsupport/input/xkbcommon/qxkbcommon.cpp b/src/pl=
atformsupport/input/xkbcommon/qxkbcommon.cpp
+index b713c19447..ecf02de6db 100644
+--- a/src/platformsupport/input/xkbcommon/qxkbcommon.cpp
++++ b/src/platformsupport/input/xkbcommon/qxkbcommon.cpp
+@@ -273,10 +273,14 @@ static constexpr const auto KeyTbl =3D qMakeArray(
+         Xkb2Qt<XKB_KEY_dead_small_schwa,        Qt::Key_Dead_Small_Schw=
a>,
+         Xkb2Qt<XKB_KEY_dead_capital_schwa,      Qt::Key_Dead_Capital_Sc=
hwa>,
+         Xkb2Qt<XKB_KEY_dead_greek,              Qt::Key_Dead_Greek>,
++/* The following four XKB_KEY_dead keys got removed in libxkbcommon 1.6=
.0
++   The define check is kind of version check here. */
++#ifdef XKB_KEY_dead_lowline
+         Xkb2Qt<XKB_KEY_dead_lowline,            Qt::Key_Dead_Lowline>,
+         Xkb2Qt<XKB_KEY_dead_aboveverticalline,  Qt::Key_Dead_Aboveverti=
calline>,
+         Xkb2Qt<XKB_KEY_dead_belowverticalline,  Qt::Key_Dead_Belowverti=
calline>,
+         Xkb2Qt<XKB_KEY_dead_longsolidusoverlay, Qt::Key_Dead_Longsolidu=
soverlay>,
++#endif
+
+         // Special keys from X.org - This include multimedia keys,
+         // wireless/bluetooth/uwb keys, special launcher keys, etc.
+--=20
+2.34.1
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-ar=
ago-distro/recipes-qt/qt5/qtbase_%.bbappend
index 8ae8110b..3d875683 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
@@ -21,6 +21,7 @@ SRC_URI +=3D "\
     file://0001-deform-Fix-how-controls-are-shown.patch \
     file://0001-qtbase-plugins-platforms-eglfs_kms-fix-compiler-erro.pat=
ch \
     file://0001-eglfs-Force-888-format-only-on-env-flag.patch \
+    file://0027-xkb-fix-build-with-libxkbcommon-1.6.0-and-later.patch \
 "
=20
 python do_patch:append() {
--=20
2.17.1


