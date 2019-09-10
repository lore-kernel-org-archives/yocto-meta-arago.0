Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id D2F2352A3E
	for <meta-arago@arago-project.org>;
	Tue, 10 Sep 2019 18:15:03 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8AIDwZY098031
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568139238;
	bh=ITwCOnwCC+WdTWNG+y9KVa9LVdPVwlMTXXqUvUt3uYg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=nt+pXzQ6IIvYUpN2sswBfodKfpiwbuCW7BdIIjkgEbwPkFlFmRnZAA0alc9qbrlq4
	orq0ueg0qb6LEtB8pxL7LRZFmzwo4abe0ojV/nEYGldby4WkM3a2OkwLcvSAYvm+vS
	VTRgg6KY18Rk7iDDRl/90WLU/Mgp1KCG1mwmm0K4=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8AIDw7p051247
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:58 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 10 Sep 2019 13:13:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 10 Sep 2019 13:13:57 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8AIDuo0035961
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:58 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Sep 2019 14:11:28 -0400
Message-ID: <20190910181131.8808-7-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910181131.8808-1-e-ruei1@ti.com>
References: <20190910181131.8808-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH 6/9] HACK: qtwebkit: sync up the khrplatform.h under ANGLE/include/KHR with the one provided by mesa-egl
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
X-List-Received-Date: Tue, 10 Sep 2019 18:15:05 -0000
Content-Type: text/plain

Note: This khrplatform.h should not be used, but it is for some include
path search. Add "#define MESA_EGL_NO_X11_HEADERS" to be consistent with
the one provided by mesa-egl

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...atform.h-add-define-MESA_EGL_NO_X11_.patch | 28 +++++++++++++++++++
 recipes-qt/qt5/qtwebkit_%.bbappend            | 10 +++++++
 2 files changed, 38 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
 create mode 100644 recipes-qt/qt5/qtwebkit_%.bbappend

diff --git a/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch b/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
new file mode 100644
index 0000000..c6022ef
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
@@ -0,0 +1,28 @@
+From c969fa7eedb3bce04c8f48caf469a46361437aa7 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Fri, 30 Aug 2019 17:41:13 -0400
+Subject: [PATCH] HACK: ANGLE/khrplatform.h: add #define
+ MESA_EGL_NO_X11_HEADERS
+
+Note: Only the KHR/khrplatform.h at sysroot/usr/include should be used.
+      This patch is a tentative workaround to make both files compatible
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ Source/ThirdParty/ANGLE/include/KHR/khrplatform.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h b/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h
+index c9e6f17d3..4e3ff69a8 100644
+--- a/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h
++++ b/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h
+@@ -279,4 +279,6 @@ typedef enum {
+     KHRONOS_BOOLEAN_ENUM_FORCE_SIZE = KHRONOS_MAX_ENUM
+ } khronos_boolean_enum_t;
+ 
++#define MESA_EGL_NO_X11_HEADERS
++
+ #endif /* __khrplatform_h_ */
+-- 
+2.17.1
+
diff --git a/recipes-qt/qt5/qtwebkit_%.bbappend b/recipes-qt/qt5/qtwebkit_%.bbappend
new file mode 100644
index 0000000..d51ab64
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit_%.bbappend
@@ -0,0 +1,10 @@
+PR_append = ".tisdk0"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+
+SRC_URI += "\
+    file://0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch \
+"
+
+
-- 
2.17.1


