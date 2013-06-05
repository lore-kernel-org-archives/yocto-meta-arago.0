Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2507C52A9D
	for <meta-arago@arago-project.org>;
	Wed,  5 Jun 2013 19:04:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r55J4A3P009650
	for <meta-arago@arago-project.org>; Wed, 5 Jun 2013 14:04:10 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r55J4Ao9020555
	for <meta-arago@arago-project.org>; Wed, 5 Jun 2013 14:04:10 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 5 Jun 2013 14:04:10 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r55J475i017863;
	Wed, 5 Jun 2013 14:04:09 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 5 Jun 2013 14:10:22 -0500
Message-ID: <1370459422-30924-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] meta-toolchain-arago: Fix mkspecs and qt.conf for Qt Creator
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
X-List-Received-Date: Wed, 05 Jun 2013 19:04:15 -0000
Content-Type: text/plain

* Needed to adjust the location of the mkspecs and update the Prefix option in
  qt.conf for Qt Creator to properly detect the Qt installation within the SDK.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../meta/meta-toolchain-arago-tisdk.bb             |    2 +-
 .../recipes-core/meta/meta-toolchain-arago-qte.bb  |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
index 114ae1c..68df1bf 100644
--- a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
+++ b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
@@ -4,7 +4,7 @@ TOOLCHAIN_CLEANUP_PACKAGES ?= "libgnutls-dev libgnutls-extra26 libgnutls-openssl
 
 require recipes-core/meta/meta-toolchain-arago-qte.bb
 
-PR = "r2"
+PR = "r3"
 
 toolchain_create_sdk_env_script_append() {
     echo -e 'export PS1="\[\\e[32;1m\][linux-devkit]\[\\e[0m\]:\w> "' >> $script
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
index 11ff5b4..a104ca0 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
@@ -5,7 +5,7 @@ TOOLCHAIN_SUFFIX ?= "-qte-sdk"
 
 require meta-toolchain-arago.bb
 
-PR = "r14"
+PR = "r15"
 
 QT_DIR_NAME = "qtopia"
 
@@ -35,11 +35,11 @@ toolchain_create_sdk_env_script_append() {
 	qt_conf="${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/qt.conf"
 	touch $qt_conf
 	echo '[Paths]' >> $qt_conf
-	echo 'Prefix = $(SDK_PATH)' >> $qt_conf
+	echo 'Prefix = $(SDK_PATH_TARGET)' >> $qt_conf
 	echo 'Libraries = $(OE_QMAKE_LIBDIR_QT)' >> $qt_conf
 	echo 'Headers = $(OE_QMAKE_INCDIR_QT)' >> $qt_conf
 
 	# make a symbolic link to mkspecs for compatibility with Nokia's SDK
 	# and QTCreator
-	(cd ${SDK_OUTPUT}/${SDKPATH}; ln -sf sysroots/${REAL_MULTIMACH_TARGET_SYS}${datadir}/${QT_DIR_NAME}/mkspecs mkspecs;)
+	(cd ${SDK_OUTPUT}/${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}; ln -sf usr/share/${QT_DIR_NAME}/mkspecs mkspecs;)
 }
-- 
1.7.0.4


