Return-Path: <d-senicic1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 0CA0D52993
	for <meta-arago@arago-project.org>;
	Mon, 23 Jul 2018 23:52:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6NNqLW7065108
	for <meta-arago@arago-project.org>; Mon, 23 Jul 2018 18:52:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532389941;
	bh=6rLNi7C6QjM43XhieZ+UtnWbs1Kf4B9piuki6ACFJgQ=;
	h=From:To:CC:Subject:Date;
	b=P9wYwwDx6iDh+fOOE6GxIt/cL5W+Ff4pkP7G+C+8TX8DC/AvvFnn8S8I4muGLLxrX
	Z330Qx/8cSTvCRPWZPWkp5TQMAELOYVV/3oHah4Am79rbuJ1BitNH5g2wueZCJuidp
	QKKmRbrP8J1ZXXLxPZVWegz4lNXTH/N9e8RzZePw=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6NNqLVq028494
	for <meta-arago@arago-project.org>; Mon, 23 Jul 2018 18:52:21 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 23 Jul 2018 18:52:20 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 23 Jul 2018 18:52:20 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6NNqKqO015826;
	Mon, 23 Jul 2018 18:52:20 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 23 Jul 2018 19:52:18 -0400
Message-ID: <1532389938-1170-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCH] tiovx-app-host: patch for makefiles is pushed to sources
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
X-List-Received-Date: Mon, 23 Jul 2018 23:52:28 -0000
Content-Type: text/plain

* Add /lib to library search path

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-ti/tiovx/files/hack-to-add-lib-path.patch | 28 -----------------------
 recipes-ti/tiovx/tiovx-app-host.bb                |  1 -
 recipes-ti/tiovx/tiovx-sys.inc                    |  2 +-
 3 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 recipes-ti/tiovx/files/hack-to-add-lib-path.patch

diff --git a/recipes-ti/tiovx/files/hack-to-add-lib-path.patch b/recipes-ti/tiovx/files/hack-to-add-lib-path.patch
deleted file mode 100644
index 8223a11..0000000
--- a/recipes-ti/tiovx/files/hack-to-add-lib-path.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-diff --git a/host/makefile b/host/makefile
-index 469aeb0..295deda 100644
---- a/host/makefile
-+++ b/host/makefile
-@@ -102,7 +102,8 @@ CPPFLAGS =
- LDFLAGS = -L$(IPC_INSTALL_DIR)/linux/src/api/.libs/ \
-     -L$(IPC_INSTALL_DIR)/linux/src/utils/.libs \
-     -L$(IPC_INSTALL_DIR)/linux/src/transport/.libs \
--    -L$(TARGET_INSTALL_DIR)/usr/lib
-+    -L$(TARGET_INSTALL_DIR)/usr/lib \
-+    -L$(TARGET_INSTALL_DIR)/lib
- 
- else
- LD = $(CC)
-diff --git a/khronos_example/makefile b/khronos_example/makefile
-index a54aa33..1e9a75f 100644
---- a/khronos_example/makefile
-+++ b/khronos_example/makefile
-@@ -101,7 +101,8 @@ CPPFLAGS =
- LDFLAGS = -L$(IPC_INSTALL_DIR)/linux/src/api/.libs/ \
-     -L$(IPC_INSTALL_DIR)/linux/src/utils/.libs \
-     -L$(IPC_INSTALL_DIR)/linux/src/transport/.libs \
--    -L$(TARGET_INSTALL_DIR)/usr/lib
-+    -L$(TARGET_INSTALL_DIR)/usr/lib \
-+    -L$(TARGET_INSTALL_DIR)/lib
- 
- else
- LD = $(CC)
diff --git a/recipes-ti/tiovx/tiovx-app-host.bb b/recipes-ti/tiovx/tiovx-app-host.bb
index a5c29ab..097f045 100644
--- a/recipes-ti/tiovx/tiovx-app-host.bb
+++ b/recipes-ti/tiovx/tiovx-app-host.bb
@@ -8,7 +8,6 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 SRC_URI_append += "\
      file://setenv.sh \
-     file://hack-to-add-lib-path.patch \
 "
 
 require recipes-ti/includes/tisdk-paths.inc
diff --git a/recipes-ti/tiovx/tiovx-sys.inc b/recipes-ti/tiovx/tiovx-sys.inc
index e45f130..56b4385 100644
--- a/recipes-ti/tiovx/tiovx-sys.inc
+++ b/recipes-ti/tiovx/tiovx-sys.inc
@@ -1,5 +1,5 @@
 PV = "01.00.01.00"
 
 BRANCH="master"
-SRCREV = "dc60c253a218fb3ec92fdeeaa454fce047f8964a"
+SRCREV = "b44eece0a22b97de59c964acb2a910fc56cdf3ac"
 SRC_URI = "git://git.ti.com/processor-sdk/tiovx-app.git;protocol=git;branch=${BRANCH}"
-- 
1.9.1


