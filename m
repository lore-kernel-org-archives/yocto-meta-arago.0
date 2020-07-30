Return-Path: <g-tammana@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 9124A520C0
	for <meta-arago@arago-project.org>;
	Thu, 30 Jul 2020 22:13:09 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06UMAOxq115162
	for <meta-arago@arago-project.org>; Thu, 30 Jul 2020 17:10:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1596147024;
	bh=UGokhraizyxMghjERsj37iIDA1tT1ikCD2Pt2+TBPZs=;
	h=From:To:CC:Subject:Date;
	b=LNAhsnd1IJb54fijGVwh/ofMG8hYiXArvdlW+6JjfS14DdE6yWfAwQhbRudyzTbPY
	ZkrAm/aV02o71SnsXyScYAYkuAZS/xhzg5mVRaaU6OLzHBuSxCc54dSl8N0mjr04w7
	cMEPBOr6tnWhh0TbNNHKMNILwP3ux48Mu6TQfj6g=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06UMAOnm039175
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 30 Jul 2020 17:10:24 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 30 Jul 2020 17:10:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 30 Jul 2020 17:10:24 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06UMAOqw079186;
	Thu, 30 Jul 2020 17:10:24 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.97])
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	06UMAO5H065366; Thu, 30 Jul 2020 17:10:24 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>
Date: Thu, 30 Jul 2020 17:10:21 -0500
Message-ID: <20200730221021.8728-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: k-bhargav@ti.com
Subject: [dunfell/zeus/master][PATCH] qtbase/eglfs: Dont force 888 format
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
X-List-Received-Date: Thu, 30 Jul 2020 22:13:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Dont force 888 format instead set only when the corresponding force888
config is set.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 ...fs-Force-888-format-only-on-env-flag.patch | 44 +++++++++++++++++++
 .../recipes-qt/qt5/qtbase_%.bbappend          |  3 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-eglfs-Force-888-format-only-on-env-flag.patch

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-eglfs-Force-888-format-only-on-env-flag.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-eglfs-Force-888-format-only-on-env-flag.patch
new file mode 100644
index 00000000..b6f0eec8
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-eglfs-Force-888-format-only-on-env-flag.patch
@@ -0,0 +1,44 @@
+From 7288496d08108b8b6514f9fb20c575fd42f8027e Mon Sep 17 00:00:00 2001
+From: Gowtham Tammana <g-tammana@ti.com>
+Date: Mon, 6 Jul 2020 12:47:23 -0500
+Subject: [PATCH] eglfs: Force 888 format only on env flag
+
+[ChangeLog][Platform Specific Changes][eglfs] In the case of elgfs
+platform the surface format is being forced to RGB888 format which
+conflicts if a different default format is specified in the json config
+file. Force the surface format to be of RGB888 only when the environment
+flag QT_QPA_EGLFS_FORCE888 is set.
+set.
+
+Upstream-Status: Pending
+
+Change-Id: Id63f11eed2f41b322a95e103860888694ccd44db
+---
+ .../eglfs_kms_support/qeglfskmsintegration.cpp        | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsintegration.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsintegration.cpp
+index 06bc272050..41f2265208 100644
+--- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsintegration.cpp
++++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsintegration.cpp
+@@ -102,9 +102,14 @@ QSurfaceFormat QEglFSKmsIntegration::surfaceFormatFor(const QSurfaceFormat &inpu
+     QSurfaceFormat format(inputFormat);
+     format.setRenderableType(QSurfaceFormat::OpenGLES);
+     format.setSwapBehavior(QSurfaceFormat::DoubleBuffer);
+-    format.setRedBufferSize(8);
+-    format.setGreenBufferSize(8);
+-    format.setBlueBufferSize(8);
++
++    static const bool force888 = qEnvironmentVariableIntValue("QT_QPA_EGLFS_FORCE888");
++    if (force888) {
++        format.setRedBufferSize(8);
++        format.setGreenBufferSize(8);
++        format.setBlueBufferSize(8);
++    }
++
+     return format;
+ }
+
+--
+2.17.1
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
index 88fea3b2..21dc4f88 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
@@ -4,7 +4,7 @@ GLES_EXTRA_DEPS = "libdrm wayland"
 
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
 
-PR_append = ".arago16"
+PR_append = ".arago17"
 
 QT_CONFIG_FLAGS += "-qpa ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
 
@@ -20,6 +20,7 @@ SRC_URI += "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', "${QT_EGLFS_PATCHES}", d)}\
     file://0001-deform-Fix-how-controls-are-shown.patch \
     file://0001-qtbase-plugins-platforms-eglfs_kms-fix-compiler-erro.patch \
+    file://0001-eglfs-Force-888-format-only-on-env-flag.patch \
 "
 
 python do_patch_append() {
-- 
2.27.0


