Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id DED19529A5
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 18:41:54 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so2632750obb.38
	for <meta-arago@arago-project.org>;
	Thu, 01 Nov 2012 11:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=f8eI2Hlh80Os0pM9zdEcRwC1fp4M8v9pY2crTS/Flck=;
	b=shRGsNjft1DIf/Efq1aYK2xXxCM1IgAH7bypWWWieuJKx7GB0aRp19Fl7s1ZJgl+T6
	w6RY0d1IvyHj3Mtk9jDNOu/DV7tlH0RVJpeAwSf2d9lJ3T2je+AXwJpEw8rAlCxSn65t
	EKg7gx9N8zpF8Es5b0F7YOd1y9ytzf59aNjs1quUc/0mDSFupvBNhoeGPd9Dg1pcS7Y6
	CD923i/t4t0iBXEVvQW7zXODRXij+X5Xg+P+nJTXbCdExoMglsyHZHvX+SQwES6gWFtp
	rTXQTudJM8JwbNripxCEWmS/LZHTpKOtW4sQcgKCux7gHZAZoorHVY6YcA5X+ZHTEpuX
	EybA==
Received: by 10.182.95.205 with SMTP id dm13mr34488329obb.9.1351795314266;
	Thu, 01 Nov 2012 11:41:54 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id fo6sm6954471obc.20.2012.11.01.11.41.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 11:41:53 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  1 Nov 2012 13:41:50 -0500
Message-Id: <1351795310-4966-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] meta-toolchain-arago-qte: Fix Qt library and include files path
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
X-List-Received-Date: Thu, 01 Nov 2012 18:41:55 -0000

* Within the toolchain sdk the Qt library files are located at
  SDK_PATH/arm-arago-linux-gnueabi/usr/lib not at SDK_PATH/usr/lib.
  The Qt include files are located in a similar location but instead of /usr/lib
  it is located at /usr/include.
* This commit points qmake to the proper location of these Qt library and include
  files.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago-qte.bb  |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
index 54040e0..e349783 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
@@ -5,7 +5,7 @@ TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-qte-sdk-${SDK_ARC
 
 require meta-toolchain-arago.bb
 
-PR = "r3"
+PR = "r4"
 
 QT_DIR_NAME = "qtopia"
 
@@ -17,8 +17,8 @@ toolchain_create_sdk_env_script_append() {
     echo -e 'export OE_QMAKE_CXX=\x24{TARGET_PREFIX}g++' >> $script
     echo -e 'export OE_QMAKE_LINK=\x24{TARGET_PREFIX}g++' >> $script
     echo -e 'export OE_QMAKE_AR=\x24{TARGET_PREFIX}ar' >> $script
-    echo 'export OE_QMAKE_LIBDIR_QT=$SDK_PATH${libdir}' >> $script
-    echo 'export OE_QMAKE_INCDIR_QT=$SDK_PATH${includedir}/${QT_DIR_NAME}' >> $script
+    echo 'export OE_QMAKE_LIBDIR_QT=$SDK_PATH/$TARGET_SYS${libdir}' >> $script
+    echo 'export OE_QMAKE_INCDIR_QT=$SDK_PATH/$TARGET_SYS${includedir}/${QT_DIR_NAME}' >> $script
     echo 'export OE_QMAKE_MOC=$SDK_PATH${bindir_nativesdk}/moc4' >> $script
     echo 'export OE_QMAKE_UIC=$SDK_PATH${bindir_nativesdk}/uic4' >> $script
     echo 'export OE_QMAKE_UIC3=$SDK_PATH${bindir_nativesdk}/uic34' >> $script
-- 
1.7.0.4


