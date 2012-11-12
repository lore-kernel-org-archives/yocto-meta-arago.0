Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id B5D8F529A4
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 22:41:07 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so6212054oag.38
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 14:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=7t6mgqtUdCfhLDRAaXoAhCn2QXd91/YQaC1nEGPUzjw=;
	b=x/TVUKPVBcxJneCR5/IDzYCvCA6C2Q79PfD9ezsfD2VCp0lzbTSjgR+QvCbuZ0OQJe
	OJY+vdk04N2hWVTEcYSdJGXmd0muCI/u3+U3wE+c9OebM9Db9Ek8fhnK3VrNlIPaoWDK
	KqrlF7vWZvKt7eS7xSp+bMDmwpXpD2EgjfqQGdVxeVU4D4zfQyakRUh08F74StdAKDwo
	lSuqb4ZKAWdmm/7qq1gbg335qoPVkgMaHmCoYZbXUgE61XtCzpSrZ3ecG5HnV6Ay2a3u
	7IUUNRyR3asjUUrIYpiY9tsjtjuCV8ckk18Ls1dj9fXoIzpe2pCASKEaDNZ5YNxIAO6i
	brSA==
Received: by 10.60.169.198 with SMTP id ag6mr15530902oec.35.1352760067437;
	Mon, 12 Nov 2012 14:41:07 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id d7sm4394896oee.2.2012.11.12.14.41.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 14:41:07 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 12 Nov 2012 16:40:55 -0600
Message-Id: <1352760055-6119-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352760055-6119-1-git-send-email-fcooper@ti.com>
References: <1352760055-6119-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/4] task-arago-tisdk-matrix: Add quick-playground Matrix application
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
X-List-Received-Date: Mon, 12 Nov 2012 22:41:08 -0000

* Add quick-playground to the list of Qt applications.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/tasks/task-arago-tisdk-matrix.bb  |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
index 754b98d..d32bcf1 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r3"
+PR = "r4"
 
 inherit task
 
@@ -28,6 +28,8 @@ MATRIX_APPS = ""
 MATRIX_APPS_append_omap3 = "        \
     matrix-gui-3d-demos             \
     matrix-gui-multimedia-demos     \
+                                    \
+    matrix-gui-apps-quick-playground\
 "
 
 MATRIX_APPS_append_ti33x = "        \
@@ -42,6 +44,8 @@ MATRIX_APPS_append_ti33x = "        \
                                     \
     matrix-gui-generic-pm           \
     matrix-gui-pm-demos-suspend     \
+                                    \
+    matrix-gui-apps-quick-playground\
 "
 
 MATRIX_APPS_append_beagleboard = "  \
-- 
1.7.0.4


