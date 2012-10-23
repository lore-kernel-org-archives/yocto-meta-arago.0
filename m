Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id D80AD5296D
	for <meta-arago@arago-project.org>;
	Tue, 23 Oct 2012 22:00:25 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so3874852oag.38
	for <meta-arago@arago-project.org>;
	Tue, 23 Oct 2012 15:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=2aJw7vobychvhr0KHDm3QUqvXzdxsA5cQPpgafyavUw=;
	b=iK94nXs1E933pTLFwBeA3kdEayPWJNobTZU5K/HKKdoGj12ZSKkxomD2j1NS6JZdNI
	x4pI/Zm5OPnWurCB8CyNVv7NJ+edCYeanuz1Mq5HV7M6+TQ7zpnK17t1jdS6BxCqxKsr
	+7guhRgccVAy+IrMBwYcRE2SWMuhkNOpHBG+ihTvgk9f4JHUys/EZi4D+O9q1q7kvlOg
	rG+cXzql160s84/6tHrcKEsoIodSFphvYx0YdjOnTEO6KJb+CUIfqI5a6wqeU35pRUuC
	4eTg4EY2czi+QSPj54zGYNGLUg+CpWgZhNFlRAMRnu4r+8GIVBnqmWmaMICo0PFkTjEY
	oDow==
Received: by 10.182.185.12 with SMTP id ey12mr11369565obc.7.1351029625449;
	Tue, 23 Oct 2012 15:00:25 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm10753329oeh.13.2012.10.23.15.00.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 15:00:24 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Tue, 23 Oct 2012 17:00:22 -0500
Message-Id: <1351029622-13540-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] task-arago-tisdk-matrix: Add thermostat demo
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
X-List-Received-Date: Tue, 23 Oct 2012 22:00:26 -0000

* Add thermostat demo to Matrix

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/tasks/task-arago-tisdk-matrix.bb  |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
index f4feef3..91e095f 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r1"
+PR = "r2"
 
 inherit task
 
@@ -20,6 +20,7 @@ MATRIX_COMMON_APPS = "              \
     matrix-gui-settings-demos       \
     matrix-gui-usb-demos            \
     matrix-gui-submenus-ethernet    \
+    matrix-gui-thermostat-demo      \
 "
 
 MATRIX_APPS = ""
-- 
1.7.0.4


