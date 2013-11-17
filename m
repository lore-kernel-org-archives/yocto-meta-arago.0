Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id DCBDE52A1B
	for <meta-arago@arago-project.org>;
	Sun, 17 Nov 2013 17:06:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAHH6Sur001463
	for <meta-arago@arago-project.org>; Sun, 17 Nov 2013 11:06:28 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAHH6RZt007767
	for <meta-arago@arago-project.org>; Sun, 17 Nov 2013 11:06:27 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 17 Nov 2013 11:06:27 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAHH6OpU014432;
	Sun, 17 Nov 2013 11:06:26 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Sun, 17 Nov 2013 12:06:53 -0600
Message-ID: <1384711613-29582-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] meta-toolchain-arago-qte: Fix location for host Qt tools
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
X-List-Received-Date: Sun, 17 Nov 2013 17:06:29 -0000
Content-Type: text/plain

* By default Qt5 is looking at cortexa8hf-vfp-neon-oe-linux-gnueabi/bin instead
  of the proper location i686-arago-linux/usr/bin/qt5.
* Update qmake.conf to insure qmake looks at the proper location for host
  binaries.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago-qte.bb  |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
index e3bf80f..6220578 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
@@ -5,7 +5,7 @@ TOOLCHAIN_SUFFIX ?= "-qte-sdk"
 
 require meta-toolchain-arago.bb
 
-PR = "r16"
+PR = "r17"
 
 # There could be qt5, qt4e and qt4x11 providers, but we don't support qt4x11 for now
 QT_DIR_NAME = "${@base_conditional('QT_PROVIDER', 'qt5', 'qt5', 'qtopia', d)}"
@@ -46,6 +46,12 @@ toolchain_create_sdk_env_script_append() {
 	echo 'Libraries = $(OE_QMAKE_LIBDIR_QT)' >> $qt_conf
 	echo 'Headers = $(OE_QMAKE_INCDIR_QT)' >> $qt_conf
 
+	if [ "${QT_PROVIDER}" = "qt5" ]
+	then
+		echo 'HostBinaries = ../${SDK_SYS}/usr/bin/qt5' >> $qt_conf
+	fi
+
+
 	# make a symbolic link to mkspecs for compatibility with Nokia's SDK
 	# and QTCreator
 	(cd ${SDK_OUTPUT}/${SDKTARGETSYSROOT}; ln -sf .${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs mkspecs;)
-- 
1.7.0.4


