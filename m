Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 3A1925208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:09 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so4861422oag.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=f8eI2Hlh80Os0pM9zdEcRwC1fp4M8v9pY2crTS/Flck=;
	b=WqS1+Y7zc9zbRKRJ6YxcaPBWCnT35M8BcjV6vJ4rWREpEWE/AEiR/rocilg6y8aN/a
	VinRUlXnL1IJfX1FemFfa/9ewyr2QijFe72wYz15q9osyRwSEackHaWbNhf9nNIZ6wZq
	X9Mpdnw3wKKYbLBnzKIpNaPUmSAbVEYc5gpcVI7AzUDzH+ZG8DV4RvzhdF0PgzXkSNYo
	rMerxdRNPD8x69GLKaJTIH8iWr9wuXYaY4XZ4/MZiSZPZmxDvmZe0ZdbJW2dL91nPeOC
	mI36TkUnJxrtNiWFBhJ68LCgtBn6pfaQSR8zk8ACY3vCg64htn3/5ZHa8e8kFn+1GR8U
	7X6w==
Received: by 10.60.23.199 with SMTP id o7mr6969172oef.20.1352080448811;
	Sun, 04 Nov 2012 17:54:08 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:08 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:13 -0600
Message-Id: <1352080417-9792-16-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 18/42] meta-toolchain-arago-qte: Fix Qt library and include files path
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:10 -0000

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


