Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 714AE5208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:23 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so4861422oag.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=2yOr8cCzxF8IR9wHYIpAqFqM+cDnZAGBFGPVHgyJapU=;
	b=zfhiVv8FtBejBDKeJIRza/7+zkEus9rIEJBQ/34gyF7mLOmGtO2npUJOleqk4bmHF6
	dOEbng4oSTZ3a6VLNe2P2NuyhvlUwoR1NPC70+lsBvnvcnuKKNkxUCwtqDD8g6BTDf3s
	JXgveBG4jFy508kufX+EXdQ7RSIhW2hlTOTfKQZCJQDloIrwBKHRLTaiqWVvZBE+zaxr
	ciHlKBcmyH3ycXx/+RkX97t6431ziROJ58/2oL9MBpqEspEJkuPYt2q3NCWmKYp+zLAB
	IVPQkFxDTaq+Crk8Qi2pY9aQ4qnwDOhNGkwa3sIHK15E3ZFqC+8qaAHEi+gfWismJ4NB
	mMrQ==
Received: by 10.182.45.42 with SMTP id j10mr6633462obm.60.1352080463128;
	Sun, 04 Nov 2012 17:54:23 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:22 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:27 -0600
Message-Id: <1352080417-9792-30-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 32/42] meta-toolchain-arago: Pull in additional environmental variables settings
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:24 -0000

* Pull in non TI SDK specific environmental variable settings.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago.bb      |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index d3d0d12..9857de2 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -4,7 +4,7 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"
 
 require recipes-core/meta/meta-toolchain.bb
 
-PR = "r3"
+PR = "r4"
 
 SDKTARGETSYSROOT = "${SDKPATH}/${ARAGO_TARGET_SYS}"
 
@@ -45,4 +45,13 @@ toolchain_create_sdk_env_script () {
 	echo 'export OECORE_ACLOCAL_OPTS="-I $SDK_PATH/usr/share/aclocal"' >> $script
 	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
+    echo -e 'export CPP="\x24{TARGET_PREFIX}gcc -E"' >> $script
+    echo -e 'export NM=\x24{TARGET_PREFIX}nm' >> $script
+    echo -e 'export RANLIB=\x24{TARGET_PREFIX}ranlib' >> $script
+    echo -e 'export OBJCOPY=\x24{TARGET_PREFIX}objcopy' >> $script
+    echo -e 'export STRIP=\x24{TARGET_PREFIX}strip' >> $script
+    echo -e 'export AS=\x24{TARGET_PREFIX}as' >> $script
+    echo -e 'export AR=\x24{TARGET_PREFIX}ar' >> $script
+    echo -e 'export OBJDUMP=\x24{TARGET_PREFIX}objdump' >> $script
+    echo 'export PKG_CONFIG_ALLOW_SYSTEM_LIBS=1' >> $script
 }
-- 
1.7.0.4


