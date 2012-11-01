Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 48CDC529A5
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 18:42:39 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2655281oag.38
	for <meta-arago@arago-project.org>;
	Thu, 01 Nov 2012 11:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=kiNlHICfBGW4tKnmcujB6k44N8val6LkCfIojvyM/DA=;
	b=c8zZ/tNZmrWyGUQ58+/OusesBnNHqeII5SjIaLDLwBDc1hViiEK8kHq1ig8YKsHXyQ
	0xvbzXMdO3GtmK4a2BpGKph7qX2ObKJuhoj08muYWjeQxApSqv02ly0mqaRiQTXVgO2R
	MZuvJgRV95snvoJKC557jJk8V1UD96bI1J/rnIJ2lmV+u2xbdVRAvSuBBUore2qGxbmT
	PBo6lZUyrurSqBt8r4Uc1KCVNqRzta9814HGHpVFpJGbm0cPMvY445hJyCwcRnCOd0gI
	opGu3aqYTu/RoC40UoTQA1iD8L1GnWZlLIMxILloo8Mnoqfisz2aOysMB17Os1gQKGoE
	//wQ==
Received: by 10.60.22.228 with SMTP id h4mr34634032oef.30.1351795358740;
	Thu, 01 Nov 2012 11:42:38 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b5sm6957826obd.18.2012.11.01.11.42.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 11:42:38 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  1 Nov 2012 13:42:33 -0500
Message-Id: <1351795353-5026-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] meta-toolchain-arago-qte: Add qt.conf file
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
X-List-Received-Date: Thu, 01 Nov 2012 18:42:39 -0000

* Qt Creator has issues finding Qt libraries and include files when these files
  aren't in the location it expects these files to be in.
* The qt.conf file is used to point Qt Creator to the proper location of these
  files.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago-qte.bb  |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
index e349783..d8425b9 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
@@ -5,7 +5,7 @@ TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-qte-sdk-${SDK_ARC
 
 require meta-toolchain-arago.bb
 
-PR = "r4"
+PR = "r5"
 
 QT_DIR_NAME = "qtopia"
 
@@ -28,6 +28,16 @@ toolchain_create_sdk_env_script_append() {
     echo 'export OE_QMAKE_QT_CONFIG=$SDK_PATH/$TARGET_SYS${datadir}/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
     echo 'export QMAKESPEC=$SDK_PATH/$TARGET_SYS${datadir}/${QT_DIR_NAME}/mkspecs/linux-g++' >> $script
 
+    #Adds qt.conf file that points qmake to properly locate Qt library and header files.
+    #This enables Qt Creator to work properly
+
+    qt_conf="${SDK_OUTPUT}/${SDKPATH}/bin/qt.conf"
+    touch $qt_conf
+    echo '[Paths]' >> $qt_conf
+    echo 'Prefix = $(SDK_PATH)' >> $qt_conf
+    echo 'Libraries = $(OE_QMAKE_LIBDIR_QT)' >> $qt_conf
+    echo 'Headers = $(OE_QMAKE_INCDIR_QT)' >> $qt_conf
+
     # make a symbolic link to mkspecs for compatibility with Nokia's SDK
     # and QTCreator
     (cd ${SDK_OUTPUT}/${QT_TOOLS_PREFIX}/..; ln -s ${ARAGO_TARGET_SYS}${datadir}/${QT_DIR_NAME}/mkspecs mkspecs;)
-- 
1.7.0.4


