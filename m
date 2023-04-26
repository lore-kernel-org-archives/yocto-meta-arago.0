Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 763ECC77B7F
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 21:32:28 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.5238.1682544740194042384
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Apr 2023 14:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kwEugQeX;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33QLWH8B067696;
	Wed, 26 Apr 2023 16:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682544737;
	bh=HLuaej4I7g56GzFwT2oJ8Gb0X449YtyfLs2py+A/WbM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kwEugQeXHRHC1pLHJMkf+3KBOJ84V42s579ydBDThBRo24qZu5YXtbTDNrhrH/GTT
	 pcZQ2EuCjGRCQxTSy7N/9m0cwC4xRocnWtdlUiKKNh9pJn5u5QsaFIhjNjFJ/jAMYv
	 RLctITsfnSe0gCTLyDTWkIF29UNlhF6/xv+bB+sI=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33QLWHil088768
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Apr 2023 16:32:17 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Apr 2023 16:32:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Apr 2023 16:32:17 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33QLWGvm067242;
	Wed, 26 Apr 2023 16:32:16 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 6/6] HACK: glfw: convert to append and drop patches
Date: Wed, 26 Apr 2023 16:32:13 -0500
Message-ID: <20230426213214.3501230-7-rs@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426213214.3501230-1-rs@ti.com>
References: <20230426213214.3501230-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 26 Apr 2023 21:32:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14351

From: Randolph Sapp <rs@ti.com>

A reasonable version of glfw is now provided by meta-oe. Also the EGL
version this package needs to build a against can be satisfied by Mesa
EGL so this old patch isn't required anymore.

Add a PACKAGECONFIG variable for wayland and use it. This append can be
dropped when meta-oe accpets my PACKAGECONFIG patch [1].

[1] https://lists.openembedded.org/g/openembedded-devel/message/102202

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 ...xt-remove-check-for-Wayland-Egl-prov.patch | 27 -------------------
 .../recipes-graphics/glfw/glfw_%.bbappend     |  6 +++++
 .../recipes-graphics/glfw/glfw_git.bb         | 24 -----------------
 3 files changed, 6 insertions(+), 51 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-graphics/glfw/glfw/0001-HACK-CMakeList.txt-remove-check-for-Wayland-Egl-prov.patch
 create mode 100644 meta-arago-extras/recipes-graphics/glfw/glfw_%.bbappend
 delete mode 100644 meta-arago-extras/recipes-graphics/glfw/glfw_git.bb

diff --git a/meta-arago-extras/recipes-graphics/glfw/glfw/0001-HACK-CMakeList.txt-remove-check-for-Wayland-Egl-prov.patch b/meta-arago-extras/recipes-graphics/glfw/glfw/0001-HACK-CMakeList.txt-remove-check-for-Wayland-Egl-prov.patch
deleted file mode 100644
index 6116fc12..00000000
--- a/meta-arago-extras/recipes-graphics/glfw/glfw/0001-HACK-CMakeList.txt-remove-check-for-Wayland-Egl-prov.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From c6e30af80018f7a6fc7b8b0e810718f4bd646cf6 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Thu, 12 Apr 2018 12:29:39 -0400
-Subject: [PATCH] HACK: CMakeList.txt: remove check for Wayland-Egl, provided
- by SGX libs
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 1f5d6ef..eaf780f 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -266,7 +266,7 @@ if (_GLFW_WAYLAND)
-     find_package(ECM REQUIRED NO_MODULE)
-     list(APPEND CMAKE_MODULE_PATH "${ECM_MODULE_PATH}")
- 
--    find_package(Wayland REQUIRED Client Cursor Egl)
-+    find_package(Wayland REQUIRED Client Cursor)
-     find_package(WaylandScanner REQUIRED)
-     find_package(WaylandProtocols 1.12 REQUIRED)
- 
--- 
-2.7.4
-
diff --git a/meta-arago-extras/recipes-graphics/glfw/glfw_%.bbappend b/meta-arago-extras/recipes-graphics/glfw/glfw_%.bbappend
new file mode 100644
index 00000000..8f80e55d
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/glfw/glfw_%.bbappend
@@ -0,0 +1,6 @@
+# Add some wayland configuration options until meta-oe adds some good
+# PACKAGECONFIGS
+
+PACKAGECONFIG[wayland] = "-DGLFW_USE_WAYLAND=ON,,wayland wayland-native wayland-protocols extra-cmake-modules libxkbcommon"
+
+PACKAGECONFIG += " wayland"
diff --git a/meta-arago-extras/recipes-graphics/glfw/glfw_git.bb b/meta-arago-extras/recipes-graphics/glfw/glfw_git.bb
deleted file mode 100644
index 0e83979f..00000000
--- a/meta-arago-extras/recipes-graphics/glfw/glfw_git.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "GLFW cross platform graphics framework"
-DESCRIPTION = "A multi-platform library for OpenGL and OpenGLES, window and input"
-HOMEPAGE = "http://glfw.org/"
-LICENSE = "Zlib & Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=90c6dd54408744b0f8a55f2a6c7ad870"
-
-PV = "3.2.1+git${SRCPV}"
-PR = "r0"
-
-BRANCH = "master"
-SRC_URI = "git://github.com/glfw/glfw.git;protocol=https;branch=${BRANCH}"
-SRCREV = "0a3c4f5d80b041ee1a12c8da3503653d98bd1a15"
-
-SRC_URI += "file://0001-HACK-CMakeList.txt-remove-check-for-Wayland-Egl-prov.patch"
-
-DEPENDS = "extra-cmake-modules glib-2.0 virtual/libgles2 virtual/egl weston wayland wayland-native wayland-protocols"
-
-S = "${WORKDIR}/git"
-
-inherit cmake pkgconfig
-
-EXTRA_OECMAKE += "-DGLFW_USE_WAYLAND=ON -DGLFW_BUILD_EXAMPLES=OFF -DGLFW_BUILD_TESTS=OFF"
-
-FILES:${PN}-dev += "${libdir}/cmake"
-- 
2.40.0


