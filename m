Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 11811529AA
	for <meta-arago@arago-project.org>;
	Fri, 12 Oct 2012 05:27:03 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so2449246obb.38
	for <meta-arago@arago-project.org>;
	Thu, 11 Oct 2012 22:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=PJK4FFIEkZ/ic+34jThzWC0jOw1/A1tGDHu+r2AokMI=;
	b=wy/0LMUn2DDNwxC/dm9wGQfox4pIcWuo+h4Tlc0BiD71PZigbi+9TNNCqdwoOERYUm
	8/RmQYnbW/Ss1BvtdNZGLqsd8Bgd4+LUrCc6mFvGiCcNMxSBgZ7Xm1u0unZ5mCcrlQ50
	CFMMO4/vuEfIVYyzKsZPPOZSKVJT9F9ha1blSUUeUkVzN5SA+3MJIf1EMOpujjC0q7H4
	MPS681wIZmpXDU+lPQvVVlOGMBZBsKKEu8dghbPc7ctbwkGcC/ohkDNdC/wVF2aKgEZu
	sPZaURIrvmUXPJo+f4h4yYEWcy8AtQHlM9NcR/Sj3gfn/iyoXwZpqmqcj9RsTJdD7Iy7
	PWmw==
Received: by 10.182.21.135 with SMTP id v7mr71613obe.101.1350019622273;
	Thu, 11 Oct 2012 22:27:02 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id f3sm3006967obz.8.2012.10.11.22.26.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Oct 2012 22:27:01 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 12 Oct 2012 00:57:34 -0500
Message-Id: <1350021454-12557-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] task-arago-tisdk-graphics: Create graphics task
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
X-List-Received-Date: Fri, 12 Oct 2012 05:27:03 -0000

* Create graphics task that groups the various packages from the Graphics SDK
  recipe.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../tasks/task-arago-tisdk-graphics-sdk-target.bb  |   11 +++++++++++
 .../tasks/task-arago-tisdk-graphics.bb             |   17 +++++++++++++++++
 2 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-graphics-sdk-target.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-graphics.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-graphics-sdk-target.bb
new file mode 100644
index 0000000..3de0809
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-graphics-sdk-target.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Task to install graphics binaries on sdk target"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+COMPATIBLE_MACHINE = "ti33x|omap3"
+PR = "r0"
+
+inherit task
+
+RDEPENDS_${PN} = "\
+    libgles-omap3-dev \
+"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-graphics.bb
new file mode 100644
index 0000000..2c0b3a6
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-graphics.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Task to install graphics binaries"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+COMPATIBLE_MACHINE = "ti33x|omap3"
+PR = "r0"
+
+inherit task
+
+RDEPENDS_${PN} = "\
+    libgles-omap3 \
+    libgles-omap3-blitwsegl \
+    libgles-omap3-flipwsegl \
+    libgles-omap3-frontwsegl \
+    libgles-omap3-linuxfbwsegl \
+    libgles-omap3-rawdemos \
+    omap3-sgx-modules \
+"
-- 
1.7.0.4


