Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 17A0B52C9B
	for <meta-arago@arago-project.org>;
	Thu,  1 Apr 2021 16:33:36 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 131GXupH032817;
	Thu, 1 Apr 2021 11:33:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617294836;
	bh=LgbmQeOxn62GjasCgP02geP3QR4UdTNgTDLIIG8tuII=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Vy5zKFI/5kzyyKxuHDVNJvgfD5whszfEBXnJcTWYoB3rtx3J0OpH00HWZn6yukVcb
	terlPzdn8Rim3gH1YhhqUWSboozNP93wpyOHL/bYMJ+oxEiZ9t8ikH1LoDSKdvtErd
	NGejO6HSdgZeyc4oHssqSqaKulQYB/xqxA33R+co=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 131GXuG5130304
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Apr 2021 11:33:56 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Thu, 1 Apr 2021 11:33:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Thu, 1 Apr 2021 11:33:56 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 131GXu3C017837;
	Thu, 1 Apr 2021 11:33:56 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 131GXsVW015613;
	Thu, 1 Apr 2021 11:33:56 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Praneeth Bajjuri <praneeth@ti.com>,
	<denys@konsulko.com>
Date: Thu, 1 Apr 2021 11:33:38 -0500
Message-ID: <20210401163340.12248-2-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401163340.12248-1-g-tammana@ti.com>
References: <20210401163340.12248-1-g-tammana@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Krunal Bhargav <k-bhargav@ti.com>
Subject: [dunfell][PATCH 1/3] Revert "HACK: qtwebkit: define MESA_EGL_NO_X11_HEADERS at ANGLE/khrplatform.h"
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Apr 2021 16:33:36 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This reverts commit 1e83ebf61bd22ca8ad04d5538db044d81330df2c. It is no
longer needed as it is handled through build dependencies.
---
 ...atform.h-add-define-MESA_EGL_NO_X11_.patch | 30 -------------------
 .../recipes-qt/qt5/qtwebkit_%.bbappend        |  3 +-
 2 files changed, 1 insertion(+), 32 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
deleted file mode 100644
index 29521a8e..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 4a21fcedd886772b7e1bd40861835f1b4f33c7ff Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Fri, 30 Aug 2019 17:41:13 -0400
-Subject: [PATCH] HACK: ANGLE/khrplatform.h: add #define
- MESA_EGL_NO_X11_HEADERS
-
-Note: Only the KHR/khrplatform.h at sysroot/usr/include should be used.
-      This patch is a tentative workaround to make both files compatible
-
-Upstream-Status: Inappropriate [tentative workaround only]
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- Source/ThirdParty/ANGLE/include/KHR/khrplatform.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h b/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h
-index c9e6f17d3..4e3ff69a8 100644
---- a/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h
-+++ b/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h
-@@ -279,4 +279,6 @@ typedef enum {
-     KHRONOS_BOOLEAN_ENUM_FORCE_SIZE = KHRONOS_MAX_ENUM
- } khronos_boolean_enum_t;
- 
-+#define MESA_EGL_NO_X11_HEADERS
-+
- #endif /* __khrplatform_h_ */
--- 
-2.17.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
index 1dbe40d1..75213487 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
@@ -6,10 +6,9 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += " \
 	file://GraphicsSurfaceGL_NoX.cpp.patch \
-	file://0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch \
 "
 
-PR_append = ".arago8"
+PR_append = ".arago7"
 
 EXTRA_OECMAKE_append = " -DCMAKE_BUILD_TYPE=Release"
 
-- 
2.31.1


