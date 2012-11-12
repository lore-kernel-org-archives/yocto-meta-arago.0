Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id F3FCF5296D
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 22:33:22 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so6205625oag.38
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 14:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=kj+kwuAASYFkFCelJs72ZyHTo96sF0DGKXeqZ6wwgQQ=;
	b=PV4JjRrkp78Na0FaemQeWqy4sbL8/LVHg54Pd0rjOid61Dgc4TY70P/thGmQ3OQQya
	wMZDrN3MwIDFm3PGyfT3aRXWRKvt4LXr3cS5FpVN9Gf8Fy5uaeeYbyhIU+A0kYt23oa4
	ZonRfoDrBhpSZqX6QsrSI+PJ961n0wDwP8m+/D1iPkwdw+i8DoPefZBVovWlU6PLau83
	Rm61wTR/XlSYJkXO9GaFrU9DtLw0ke/7lpqa5ALGDvd5GZtZXVDGMe7WWYfSsRk9TMWm
	7sKx1MTmXvUtERJ9NCllzJVK4ZQ6pmalXrIu8Q5cEELrcehEppCeP0CiXeiXfL5Mlcd5
	bT+Q==
Received: by 10.182.157.45 with SMTP id wj13mr16641488obb.58.1352759602643;
	Mon, 12 Nov 2012 14:33:22 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id z1sm6400444oeh.7.2012.11.12.14.33.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 14:33:22 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 12 Nov 2012 16:33:18 -0600
Message-Id: <1352759598-5183-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] meta-toolchain-arago: de-bashify
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
X-List-Received-Date: Mon, 12 Nov 2012 22:33:23 -0000

* Replacing "echo -e" with "printf".
* This mimics a previous de-bashify patch applied to this same recipe.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago.bb      |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 09996d6..3d3fb0d 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -4,7 +4,7 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"
 
 require recipes-core/meta/meta-toolchain.bb
 
-PR = "r7"
+PR = "r8"
 
 SDKTARGETSYSROOT = "${SDKPATH}/${ARAGO_TARGET_SYS}"
 
@@ -54,15 +54,15 @@ toolchain_create_sdk_env_script () {
 	echo 'export OECORE_ACLOCAL_OPTS="-I $SDK_PATH/usr/share/aclocal"' >> $script
 	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
-    echo -e 'export CPP="\x24{TARGET_PREFIX}gcc -E"' >> $script
-    echo -e 'export NM=\x24{TARGET_PREFIX}nm' >> $script
-    echo -e 'export RANLIB=\x24{TARGET_PREFIX}ranlib' >> $script
-    echo -e 'export OBJCOPY=\x24{TARGET_PREFIX}objcopy' >> $script
-    echo -e 'export STRIP=\x24{TARGET_PREFIX}strip' >> $script
-    echo -e 'export AS=\x24{TARGET_PREFIX}as' >> $script
-    echo -e 'export AR=\x24{TARGET_PREFIX}ar' >> $script
-    echo -e 'export OBJDUMP=\x24{TARGET_PREFIX}objdump' >> $script
-    echo 'export PKG_CONFIG_ALLOW_SYSTEM_LIBS=1' >> $script
+	printf 'export CPP="\x24{TARGET_PREFIX}gcc -E"\n' >> $script
+	printf 'export NM=\x24{TARGET_PREFIX}nm\n' >> $script
+	printf 'export RANLIB=\x24{TARGET_PREFIX}ranlib\n' >> $script
+	printf 'export OBJCOPY=\x24{TARGET_PREFIX}objcopy\n' >> $script
+	printf 'export STRIP=\x24{TARGET_PREFIX}strip\n' >> $script
+	printf 'export AS=\x24{TARGET_PREFIX}as\n' >> $script
+	printf 'export AR=\x24{TARGET_PREFIX}ar\n' >> $script
+	printf 'export OBJDUMP=\x24{TARGET_PREFIX}objdump\n' >> $script
+	echo 'export PKG_CONFIG_ALLOW_SYSTEM_LIBS=1' >> $script
 }
 
 populate_sdk_ipk_append () {
-- 
1.7.0.4


