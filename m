Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 58EB4529B9
	for <meta-arago@arago-project.org>;
	Thu, 18 Oct 2012 22:29:57 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so8837114obb.38
	for <meta-arago@arago-project.org>;
	Thu, 18 Oct 2012 15:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=PGAFLhrorNJCklN1zoZSQQWPG+0NwRutx3EeC6Xp+nc=;
	b=oDRuftAxfUWjiOjBj1wDMVMh6iSvXU7qFavlcOWb9T+PttRlo73aePslJ7LEXoc4JI
	UvFyRf6sSwsb33/LYxDMqVKZ/lNUXjpo2C3bUMs+QRedojlLX+EKPIvQFueyG8Ci9qdc
	QXCYFYXIzsieDHp65lio82ecmG3ApX6+E9zkMqOYxGwFzC2gMot9sboTa3hLoBQUGXfp
	EWCtWnID760yTiBJy7Gd2gEiRnf6Zl7jmJCDs1lMfMZ+51ea/Gw2HUYIVyPMvYKB6w20
	/RJfWsrMo2xFOjp6AwMOiFgN0xKmVVIxs62qsnK+F2rPfXNGzmGLOrTdtkO1QcI1lNpj
	jLJw==
Received: by 10.60.26.232 with SMTP id o8mr13325320oeg.7.1350599396773;
	Thu, 18 Oct 2012 15:29:56 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id fo6sm24632709obc.20.2012.10.18.15.29.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Oct 2012 15:29:56 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 18 Oct 2012 17:29:46 -0500
Message-Id: <1350599386-7511-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH v2] arago-tisdk-image: Create image that builds Sitara SDK filesystem
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
X-List-Received-Date: Thu, 18 Oct 2012 22:29:57 -0000

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Removed PR_append

 .../recipes-core/images/arago-tisdk-image.bb       |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/images/arago-tisdk-image.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-tisdk-image.bb
new file mode 100644
index 0000000..2011ab7
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/arago-tisdk-image.bb
@@ -0,0 +1,20 @@
+# Arago TI SDK base image
+# gives you an image with Qt/E and other common packages shared by all TI SDKs.
+COMPATIBLE_MACHINE = "omap3|omapl138|ti33x"
+
+require arago-image.inc
+
+IMAGE_INSTALL += "\
+    task-arago-base \
+    task-arago-base-tisdk \
+    task-arago-console \
+    task-arago-tisdk-graphics \
+    task-arago-qte \
+    task-arago-tisdk-addons \
+    task-arago-tisdk-connectivity \
+    task-arago-tisdk-crypto \
+    task-arago-tisdk-matrix \
+    task-arago-tisdk-multimedia \
+"
+
+export IMAGE_BASENAME = "tisdk-rootfs"
-- 
1.7.0.4


