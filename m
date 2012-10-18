Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 9BA5552980
	for <meta-arago@arago-project.org>;
	Thu, 18 Oct 2012 22:24:35 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so8924076oag.38
	for <meta-arago@arago-project.org>;
	Thu, 18 Oct 2012 15:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=0/wdVksYkelbphTVnbVo5siHisVRjnqfqGcPvamhQtQ=;
	b=z6WPsjSz50ScLO+7yhDP6qq30JTEG6pUDkIGWzDy9xQSbO+Gc7yFJrUhgSZL3cPgXJ
	3vha4WsEUpXDVxvVUGCb7JU5pPVWaUZyB2ocRajNhNwcesnMHOc8O6JSp0qTWWg8cCLo
	JuUapE1v9nQda2UtDTzYYX3putR++VYKnXKvNh6Kk2e2JKlZq1yUuT/JGZHh+4sYOGD0
	YFDY/1X5q3LFXvS7qaK1bWHPhR4N3+0ABpoj/kR2kXIRMjJpmCWO34gfIQ5XHPdBtMc5
	7UiF3pc7l0Nymqpl/t5HwGx532Eh4O9yaQZRp+8vphEQUrFINKJUO35TN0nD30tqRuru
	NEwQ==
Received: by 10.60.170.165 with SMTP id an5mr8576672oec.34.1350599075130;
	Thu, 18 Oct 2012 15:24:35 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id h13sm24614425obp.2.2012.10.18.15.24.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Oct 2012 15:24:34 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 18 Oct 2012 17:24:30 -0500
Message-Id: <1350599070-19579-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH v2] task-arago-tisdk-graphics: Create graphics task
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
X-List-Received-Date: Thu, 18 Oct 2012 22:24:35 -0000

* Create graphics task that groups the various packages from the Graphics SDK
  recipe.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
 Remove COMPATIBLE_MACHINE.
 Added PACKAGE_ARCH and ALLOW_EMPTY when needed.

 .../tasks/task-arago-tisdk-graphics-sdk-target.bb  |   22 +++++++++++++
 .../tasks/task-arago-tisdk-graphics.bb             |   34 ++++++++++++++++++++
 2 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-graphics-sdk-target.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-graphics.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-graphics-sdk-target.bb
new file mode 100644
index 0000000..3ff527b
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-graphics-sdk-target.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Task to install graphics binaries on sdk target"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+ALLOW_EMPTY = "1"
+
+GRAPHICS_RDEPENDS = ""
+
+GRAPHICS_RDEPENDS_ti33x = "\
+    libgles-omap3-dev \
+"
+GRAPHICS_RDEPENDS_omap3 = "\
+    libgles-omap3-dev \
+"
+
+RDEPENDS_${PN} = "\
+    ${GRAPHICS_RDEPENDS} \
+"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-graphics.bb
new file mode 100644
index 0000000..5dc1fe8
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-graphics.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Task to install graphics binaries"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PR = "r0"
+
+inherit task
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+ALLOW_EMPTY = "1"
+
+GRAPHICS_SDK = "\
+    libgles-omap3 \
+    libgles-omap3-blitwsegl \
+    libgles-omap3-flipwsegl \
+    libgles-omap3-frontwsegl \
+    libgles-omap3-linuxfbwsegl \
+    libgles-omap3-rawdemos \
+    omap3-sgx-modules \
+"
+
+GRAPHICS_RDEPENDS = ""
+
+GRAPHICS_RDEPENDS_ti33x = "\
+    ${GRAPHICS_SDK} \
+"
+
+GRAPHICS_RDEPENDS_omap3 = "\
+    ${GRAPHICS_SDK} \
+"
+
+RDEPENDS_${PN} = "\
+    ${GRAPHICS_RDEPENDS} \
+"
-- 
1.7.0.4


