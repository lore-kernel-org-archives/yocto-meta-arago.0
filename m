Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 161215208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:53:52 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so4802582obb.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=gbRIdElPGrRNsufN7HfFZDpwyQEO8uw0WhFgI+s4T1k=;
	b=vYwlofkZkSRwqo6tVAK//gtZsPfj673pA4+9j1Dkt6yfW/Ly4tJegpsufwv4s7zEjh
	NZfcwxrmo83vpPYBGQjF7g6nRl6mTuFoftK7G7TB5cPyRQWllx4LH7qpL5K6DzS+I3aQ
	5UAK+EYDd66LZCRIOeeyMku/ZcjtLnU3dQ08h/y2x3KXfyKWJprVlf0gPaBgGFBbypqZ
	b5Zh1vWvkrCrSveSD7tjl8AHPDTd0kLHPvuCeMRs8Demfy/IsMCp38U3C4EyQzcmlIHf
	1dy3hkgBwOaDJO8ExqQXBdv4IZWeIyvTJOzdTarGiV2F1KcU6u/nv4eJUJVEGY2BzWF5
	N8/g==
Received: by 10.182.47.66 with SMTP id b2mr6596407obn.34.1352080431850;
	Sun, 04 Nov 2012 17:53:51 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.53.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:53:51 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:01 -0600
Message-Id: <1352080417-9792-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Subject: [PATCH 06/42] arago-amsdk-image: Add TI AMSDK image recipe
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
X-List-Received-Date: Mon, 05 Nov 2012 01:53:52 -0000

From: Chase Maupin <Chase.Maupin@ti.com>

* This recipe will build a tarball image representing the TISDK
  installer contents.  This tarball can be extracted and used
  stand-alone or packaged inside of an InstallJammer installer
* This recipe will pull in target images to build as well as
  the meta toolchain image to be used.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-core/images/arago-amsdk-image.bb       |   21 ++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/images/arago-amsdk-image.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
new file mode 100644
index 0000000..82e0527
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
@@ -0,0 +1,21 @@
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+IMAGE_FSTYPES = "tar.bz2"
+
+inherit tisdk-image
+
+COMPATIBLE_MACHINE = "omap3|omapl138|ti33x"
+
+# List of packages to remove from the host package.  This is usually due to
+# licensing issues and unneeded dependencies.
+HOST_CLEANUP_PACKAGES = ""
+TOOLCHAIN_CLEANUP_PACKAGES = ""
+
+# List of target side images to build for the SDK
+TARGET_IMAGES = "arago-base-tisdk-image"
+
+IMAGE_INSTALL = "task-arago-tisdk-addons-sdk-host"
+
+export IMAGE_BASENAME = "arago-amsdk-image"
+
-- 
1.7.0.4


