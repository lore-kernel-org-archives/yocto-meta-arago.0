Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id B196B52A70
	for <meta-arago@arago-project.org>;
	Fri, 12 Oct 2012 05:35:49 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so2453080obb.38
	for <meta-arago@arago-project.org>;
	Thu, 11 Oct 2012 22:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=5aujWvW+BvuEb4V8QXZvLTuqxmHwyPGI9LFgmnURkT8=;
	b=FqiTVN8IDuw4PWwGr/XULibs8rySn6keHKaEi47EsZyMjmsyvYNIJtjT/1wu3otnne
	XYRqrpRzxAMrAxqyO/JbplIl3Lq8OIcDHq5ciNxqa8TCOD256nqnz+I5oPAAA4LUbXZ4
	kVtlG6vIDOL4fAJJOYPX2rRSr7Oh//vgdvspkJZo3nStEad/UDdLcP4IVde+ed73GlCU
	m3VYa1rGKhhz72REQ+ZODJPpYIrfNj4voGoSE/I3/DdhqqD+S9OTvC8ROvT5w15g+Hj/
	u95fawvG6EgrHd2huY6LHDcTLYdugLgJfanhkNhccWG6vAsSF0ELxCjotQwoV50MilYG
	IsCg==
Received: by 10.182.144.100 with SMTP id sl4mr2739478obb.14.1350020149137;
	Thu, 11 Oct 2012 22:35:49 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id 3sm4693859oee.13.2012.10.11.22.35.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Oct 2012 22:35:48 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 12 Oct 2012 01:06:44 -0500
Message-Id: <1350022004-13294-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] arago-tisdk-image: Create image that builds Sitara SDK filesystem
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
X-List-Received-Date: Fri, 12 Oct 2012 05:35:49 -0000

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/images/arago-tisdk-image.bb       |   21 ++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/images/arago-tisdk-image.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-tisdk-image.bb
new file mode 100644
index 0000000..e9e6781
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/arago-tisdk-image.bb
@@ -0,0 +1,21 @@
+# Arago TI SDK base image
+# gives you an image with Qt/E and other common packages shared by all TI SDKs.
+
+require arago-image.inc
+PR_append = "-arago0"
+COMPATIBLE_MACHINE = "omap3|omapl138|ti33x"
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


