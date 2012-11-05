Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 1A06B5208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:35 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so4861422oag.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=vIgHsKRQ8s+K/aawrGPdsaU8jQm/VOQNWrT3YzQ9UjQ=;
	b=pz9NIeOQNsXfesGwb5ZOn5crkIZMOLxQD2nywSrVcQL4k1cbXzdkR/2UD3RnxrgDQY
	GEKHbIvx2bsH8mrGxQDRLfbDSPvH750OQL2l3j2nag/pPjulvbwGOnb+IxrcDEEct7Qx
	NCNFR+akFtvZw2Mzt9jTTVP/AALc6gGCUAm+6Jq6tFxLDgFM1V3E1NvUQ417QaPElwhO
	awxRIS5OtB18zJ7MmBzUjb/7dTHnih9a71JRCbf0eo0/SJy+t5X6BwE14H2/UxWWJaHr
	M/DUWL3jR3Wh6/9I29h1FZcWb7dh3kYeIxuidNlrN6j473QLdW+ySjfBeXvI7Db8dpH4
	Ty/A==
Received: by 10.182.52.105 with SMTP id s9mr6715496obo.25.1352080474780;
	Sun, 04 Nov 2012 17:54:34 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:34 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:36 -0600
Message-Id: <1352080417-9792-39-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 41/42] meta-toolchain-arago-qte: Add force option to symbolic link command
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:35 -0000

* Once the mkspecs file is created any subsequential build will fail due to a
  "ln: creating symbolic link `mkspecs': File exists" error when trying
  to create a symbolic link that already exist.
* Add the -f option which removes existing symbolic links allowing a new one to
  be created.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago-qte.bb  |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
index d8425b9..3cc8689 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
@@ -5,7 +5,7 @@ TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-qte-sdk-${SDK_ARC
 
 require meta-toolchain-arago.bb
 
-PR = "r5"
+PR = "r6"
 
 QT_DIR_NAME = "qtopia"
 
@@ -40,5 +40,5 @@ toolchain_create_sdk_env_script_append() {
 
     # make a symbolic link to mkspecs for compatibility with Nokia's SDK
     # and QTCreator
-    (cd ${SDK_OUTPUT}/${QT_TOOLS_PREFIX}/..; ln -s ${ARAGO_TARGET_SYS}${datadir}/${QT_DIR_NAME}/mkspecs mkspecs;)
+    (cd ${SDK_OUTPUT}/${QT_TOOLS_PREFIX}/..; ln -sf ${ARAGO_TARGET_SYS}${datadir}/${QT_DIR_NAME}/mkspecs mkspecs;)
 }
-- 
1.7.0.4


