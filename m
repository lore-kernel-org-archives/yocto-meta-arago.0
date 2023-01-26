Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7080CC54EAA
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 19:18:35 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.83478.1674760705995258239
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 Jan 2023 11:18:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=vpao6Ex3;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30QJIOI5027287;
	Thu, 26 Jan 2023 13:18:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674760704;
	bh=41qYX+FyCugjdyUrazQagzQAYOG8EzZ8iOHNwY5J5Qk=;
	h=From:To:Subject:Date;
	b=vpao6Ex3MxDRr13N1I8MIGk57huti3GUEBytlU5e6ulHpVpSLy8Q8QDO9J6aF6VPW
	 9Us5Kl4PoO/kJUYd+xS5Tn82aAShAngWJ0DKTmOznKXzbwZOPYeK+sVljT7WpUeFVX
	 J3XnXruiUHMjsj86hLSqIxYxPjxwVaIyoDKROu6g=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30QJIOnu018137
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Jan 2023 13:18:24 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 26
 Jan 2023 13:18:24 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 26 Jan 2023 13:18:24 -0600
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30QJIOYF011026;
	Thu, 26 Jan 2023 13:18:24 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pL7lQ-000538-AC; Thu, 26 Jan 2023 13:18:24 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] qtwayland: Remove patch
Date: Thu, 26 Jan 2023 13:18:24 -0600
Message-ID: <20230126191824.19362-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 30QJIOI5027287
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 26 Jan 2023 19:18:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14187

This patch is now included in the version of qtwayland that we are
pointing to and so does not apply cleanly anymore.  Simply remove it.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...land-texture-sharing-custom-composit.patch | 52 -------------------
 .../recipes-qt/qt5/qtwayland_git.bbappend     |  1 -
 2 files changed, 53 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwayland/0001-examp=
les-fix-wayland-texture-sharing-custom-composit.patch

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-examples-fix=
-wayland-texture-sharing-custom-composit.patch b/meta-arago-distro/recipe=
s-qt/qt5/qtwayland/0001-examples-fix-wayland-texture-sharing-custom-compo=
sit.patch
deleted file mode 100644
index c209dfc4..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-examples-fix-waylan=
d-texture-sharing-custom-composit.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 1d18591d9e7ed9b3580e06c37be23bfde24bc30c Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Fri, 3 Apr 2020 22:40:29 +0200
-Subject: [PATCH] examples: fix wayland/texture-sharing/custom-compositor
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-
-  main.cpp:83:33: error: =E2=80=98GL_RGBA8=E2=80=99 was not declared in =
this scope; did you mean =E2=80=98GL_RGBA4=E2=80=99?
-     83 |             *glInternalFormat =3D GL_RGBA8;
-        |                                 ^~~~~~~~
-        |                                 GL_RGBA4
-  main.cpp:120:33: error: =E2=80=98GL_RGBA8=E2=80=99 was not declared in=
 this scope; did you mean =E2=80=98GL_RGBA4=E2=80=99?
-    120 |             *glInternalFormat =3D GL_RGBA8;
-        |                                 ^~~~~~~~
-        |                                 GL_RGBA4
-
-Task-number: QTBUG-83304
-Change-Id: I0515f3303b08c405d162986e280e9a7bd35e28f7
-Reviewed-by: Laszlo Agocs <laszlo.agocs@qt.io>
-Reviewed-by: Eskil Abrahamsen Blomfeldt <eskil.abrahamsen-blomfeldt@qt.i=
o>
-
-Upstream-Status: Backport [1d18591d9e7ed9b3580e06c37be23bfde24bc30c]
-
-The patch is backport from upstream commit -
-1d18591d9e7ed9b3580e06c37be23bfde24bc30c
-
-Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
----
- examples/wayland/texture-sharing/custom-compositor/main.cpp | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/examples/wayland/texture-sharing/custom-compositor/main.cpp=
 b/examples/wayland/texture-sharing/custom-compositor/main.cpp
-index a39c8c38..af375024 100644
---- a/examples/wayland/texture-sharing/custom-compositor/main.cpp
-+++ b/examples/wayland/texture-sharing/custom-compositor/main.cpp
-@@ -63,6 +63,10 @@
-=20
- #include "QtWaylandCompositor/private/qwltexturesharingextension_p.h"
-=20
-+#ifndef GL_RGBA8
-+#define GL_RGBA8 0x8058
-+#endif
-+
- class CustomSharingExtension : public QWaylandTextureSharingExtension
- {
-     Q_OBJECT
---=20
-2.17.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend b/me=
ta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
index f6d6ceec..f6341d2f 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
@@ -3,7 +3,6 @@ PR:append =3D ".arago2"
=20
 SRC_URI +=3D " \
     file://0001-plugins-decorations-bradient-display-window-icon-onl.pat=
ch \
-    file://0001-examples-fix-wayland-texture-sharing-custom-composit.pat=
ch \
 "
=20
 SRCREV =3D "533fff12f7c4beb177b56b766c71b1c7384e6229"
--=20
2.17.1


