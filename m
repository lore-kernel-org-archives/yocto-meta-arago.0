Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD1CC77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 17:20:54 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.27205.1682616049490369748
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 10:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=NLV8aeNn;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33RHKjNj066299;
	Thu, 27 Apr 2023 12:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682616045;
	bh=OLHAVXoGiKQ3+iGi6tbX7hZ2VHcaKP8i5bsNmkvZEUs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NLV8aeNnxIPMflJdXcjzk4F4b0QSbpmiX//ZY+oS5QDGCw/udOSZIVL9+bbW6zRc8
	 obseT8VLQsPTasgR/kj3Wmiq+V5JaOvtn5mAqU2lN961YNoDC6HIlhYWENPeJHCcEz
	 0DYqW8lGeZCBQ1sljW7CXGMQhDWT3G2qI1iDFhDc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33RHKjE0086167
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Apr 2023 12:20:45 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 12:20:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 12:20:45 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33RHKj8i110570;
	Thu, 27 Apr 2023 12:20:45 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <detheridge@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][kirkstone][PATCHv2 3/5] qtwayland: drop the fix-wayland-texture-sharing patch
Date: Thu, 27 Apr 2023 12:20:34 -0500
Message-ID: <20230427172036.863789-4-rs@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230427172036.863789-1-rs@ti.com>
References: <20230427172036.863789-1-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 33RHKjNj066299
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 27 Apr 2023 17:20:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14368

From: Randolph Sapp <rs@ti.com>

Meta-qt is now providing a version of qtwayland that already has this
patch applied.

Signed-off-by: Randolph Sapp <rs@ti.com>
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
index 25b5fc42..df8b5eff 100644
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
 PACKAGECONFIG:remove =3D "xcomposite-egl xcomposite-glx"
--=20
2.40.0


