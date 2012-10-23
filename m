Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id BF108529A4
	for <meta-arago@arago-project.org>;
	Tue, 23 Oct 2012 22:38:48 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so3855601obb.38
	for <meta-arago@arago-project.org>;
	Tue, 23 Oct 2012 15:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=VpDxf/JVp2Mf7Z6kKwGNZicPf+xX8AF9DyW9wyiRAWE=;
	b=zFTJrvWx7gPXPYMQxrZ/8iwl1HrB+VYvTzytsANMNioO0DM9YWRtXGGpgBrM2TMD0h
	cBLi3BjSsPlfe8Rp0JLF91InhEZPLTzQQJ/XkEKLMVVr1fXorUl0DN7Ymi49JOjLGAPG
	4TJKdKEmOloBExY4m3jKYGajwBSqLWJCu6FHN3RhKwLRcX9yVqqWG6P/BwiY5eQmlFFP
	dYBT7qPGxnfrWneWSfyEFvvXNV2+UhtTOylB9/qyycG92wgbnTGOimbi5MB9CPkhemlU
	o29NkXNTsUp9BP0HAljK7unZIaqdmHOHn4xsHVNnGVY/eFsUDMcqjW3NvvojMmAx/nmD
	5Gcw==
Received: by 10.182.150.37 with SMTP id uf5mr11364449obb.10.1351031927946;
	Tue, 23 Oct 2012 15:38:47 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id xj9sm13922069obb.17.2012.10.23.15.38.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 15:38:47 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Tue, 23 Oct 2012 17:38:41 -0500
Message-Id: <1351031921-2800-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH v3] arago-tisdk-image: Create image that builds Sitara SDK filesystem
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
X-List-Received-Date: Tue, 23 Oct 2012 22:38:49 -0000

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 3 changes:
Updated comment.
Changed task-arago-qte to task-arago-tisdk-qte

Version 2 changes:
Removed PR_append

 .../recipes-core/images/arago-tisdk-image.bb       |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/images/arago-tisdk-image.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-tisdk-image.bb
new file mode 100644
index 0000000..f77ae52
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/arago-tisdk-image.bb
@@ -0,0 +1,19 @@
+# Arago TI SDK filesystem image
+COMPATIBLE_MACHINE = "omap3|omapl138|ti33x"
+
+require arago-image.inc
+
+IMAGE_INSTALL += "\
+    task-arago-base \
+    task-arago-base-tisdk \
+    task-arago-console \
+    task-arago-tisdk-graphics \
+    task-arago-tisdk-qte \
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


