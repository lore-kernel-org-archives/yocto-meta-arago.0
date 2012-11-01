Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 35D1A529A5
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 18:42:59 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so2633768obb.38
	for <meta-arago@arago-project.org>;
	Thu, 01 Nov 2012 11:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=zOHvRrRF3ewwlbIi4sTmQbLt4QyjLZh5IM5qAqTKNec=;
	b=ifo5HeRMl725yW9kh1Etz4utjyeACzTnCTyi/fe8by2/W5QvL/1GjPkA/pQ/qefut8
	4CTLJ4q10sYPxdrzE+kf6HhA5YxI9pIwIIA11OCV2fHebyG6mfk4WA5S8hf/JmVBhtoX
	VdKbvVkx2gQYqiqLW1FKMcOMUG5mmKVGgXQi66Vy/dsgu1fqfEvQRnz0d4jIrda4FZhT
	NtznI4a1RowcTNRlS1gdeWef2R4oaUcPXBUs6gY52i45Qtiug3yHglzknIi053UszpUn
	qZIDfXaa4DAWauc/GMUx/JbeWqJwv7PJ4MEpcMSsCwIIy9mhJRb/FvgEwiCcE81LD0rH
	cHUw==
Received: by 10.60.32.171 with SMTP id k11mr34570751oei.113.1351795378726;
	Thu, 01 Nov 2012 11:42:58 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id zn9sm6955888obb.23.2012.11.01.11.42.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 11:42:58 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  1 Nov 2012 13:42:55 -0500
Message-Id: <1351795375-5086-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] task-arago-toolchain-tisdk-target: Add task-arago-toolchain-tisdk-target
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
X-List-Received-Date: Thu, 01 Nov 2012 18:42:59 -0000

* This task is used to group up all the various sdk-target tasks to enable SDK
  users to build applications using libraries that are included in the SDK.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../tasks/task-arago-toolchain-tisdk-target.bb     |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-toolchain-tisdk-target.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-toolchain-tisdk-target.bb
new file mode 100644
index 0000000..ef1a803
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-toolchain-tisdk-target.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Task to build and install header and libs into the sdk"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+
+RDEPENDS_${PN} = "\
+    task-arago-qte-toolchain-target \
+    task-arago-tisdk-multimedia-sdk-target \
+    task-arago-tisdk-connectivity-sdk-target \
+    task-arago-tisdk-crypto-sdk-target \
+    task-arago-tisdk-graphics-sdk-target \
+"
-- 
1.7.0.4


