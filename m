Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 365DB5296D
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 22:33:05 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so6205625oag.38
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 14:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=CayiBSzn/V5gPwNE6oYRDBHyvBVdJRozmvVFxi6rNl4=;
	b=LprbsmVAcdc3nyo8rAiXK/N/YS70wdTPfvpVc+ObUS3ObKhYOWXHxZOz1Oyphk1esh
	wMaX47mL6iWVcbPbfmpnqiQneDkSNCP1VOTHXNgpu4qYH/3Ybleapcl8fd6mlVgD8F7Z
	28TPQxfPogeguP57x76BkvDwZ0W7WAVWKV9KhpMnapgyLloDAo4g0JLUpEPglTxZg40y
	J0Geqea23EJC8a00dUjIW4D4JZdOEJX6dlGzkuk/oHWfuJ4gU661gANKNhQumfjKMBln
	W+akfllGMKfQcjPnz5kJHzvor4+aWAp42njx+wQUCLGpHSXb9WwEmUZoQdWM59PFWYQQ
	W5bA==
Received: by 10.60.28.3 with SMTP id x3mr15502352oeg.14.1352759584063;
	Mon, 12 Nov 2012 14:33:04 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id 9sm8242783obi.22.2012.11.12.14.33.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 14:33:03 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 12 Nov 2012 16:32:56 -0600
Message-Id: <1352759576-5144-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] meta-toolchain-arago-qte: Fix mkspecs location
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
X-List-Received-Date: Mon, 12 Nov 2012 22:33:05 -0000

* Mkspecs symbolic link was previously being placed way out side of the toolchain
  sdk directory.
* Create the mkspecs symbolic link inside of the toolchain sdk directory.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago-qte.bb  |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
index e11b7e6..cadb861 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
@@ -5,7 +5,7 @@ TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-qte-sdk-${SDK_ARC
 
 require meta-toolchain-arago.bb
 
-PR = "r8"
+PR = "r9"
 
 QT_DIR_NAME = "qtopia"
 
@@ -40,5 +40,5 @@ toolchain_create_sdk_env_script_append() {
 
 	# make a symbolic link to mkspecs for compatibility with Nokia's SDK
 	# and QTCreator
-	(cd ${SDK_OUTPUT}/${QT_TOOLS_PREFIX}/..; ln -sf ${ARAGO_TARGET_SYS}${datadir}/${QT_DIR_NAME}/mkspecs mkspecs;)
+	(cd ${SDK_OUTPUT}/${SDKPATH}; ln -sf ${ARAGO_TARGET_SYS}${datadir}/${QT_DIR_NAME}/mkspecs mkspecs;)
 }
-- 
1.7.0.4


