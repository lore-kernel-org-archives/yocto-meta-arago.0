Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 7234C5296D
	for <meta-arago@arago-project.org>;
	Tue, 23 Oct 2012 21:54:48 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so3870097oag.38
	for <meta-arago@arago-project.org>;
	Tue, 23 Oct 2012 14:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=NnNgZ91mMHiDIWsHHYI+fwWDvbRzfsTEMQYYImNzZYE=;
	b=WjNzfuw/u2Y9oGiVkSt92/zSF4pkT01M5G5M6Vm6XPG03vT3lJmKIsLNpsD6Sbxl/8
	llTWgkSbo9p0r5wEzDR37hDs9X+6wgGC6hLyggiiSKmqe+zli8tGPG096izu/YANCmpm
	U0U5kbOhe8PcH09lA2AIhKAjwEfTWStd5bImIOOHg30GseL/aXvhjt1oST2WpuyK6apI
	ipl7RpbH7HEzXKZuVfbrzdUsV8BlU7Ie+5l6jbvpQzXyD20L5Vn8pPccRq/vrTBXkwyW
	+0DRoNkhlGC0p/BYx8EAZpRTMCWw9FDR4e+xT/VeGvlvLRtjOVOYXxmfju80v9fFQVoO
	6VeA==
Received: by 10.182.117.74 with SMTP id kc10mr11185239obb.63.1351029287838;
	Tue, 23 Oct 2012 14:54:47 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m8sm3506637oeb.3.2012.10.23.14.54.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 14:54:47 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Tue, 23 Oct 2012 16:54:42 -0500
Message-Id: <1351029282-13406-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] task-arago-tisdk-qte: Add new Qt embedded task.
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
X-List-Received-Date: Tue, 23 Oct 2012 21:54:48 -0000

* These new tasks are used to pull in the Qt embedded library,
  examples and demos that are built with Qt. Additional Qt
  applications that are from different sources are also pulled in.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../tasks/task-arago-tisdk-qte-sdk-host.bb         |   14 ++++++++++++++
 .../recipes-core/tasks/task-arago-tisdk-qte.bb     |   17 +++++++++++++++++
 2 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte-sdk-host.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte-sdk-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte-sdk-host.bb
new file mode 100644
index 0000000..b68d1c7
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte-sdk-host.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Task to add Qt embedded related sources into the sdk"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+
+QT_DEMOS = "\
+    qt-tstat-src \
+"
+
+RDEPENDS_${PN} = "\
+    ${QT_DEMOS} \
+"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte.bb
new file mode 100644
index 0000000..63ef58a
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Task to add Qt embedded related packages"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+
+QT_DEMOS = "\
+    qt4-embedded-examples \
+    qt4-embedded-demos \
+    qt-tstat \
+"
+
+RDEPENDS_${PN} = "\
+    task-arago-qte \
+    ${QT_DEMOS} \
+"
-- 
1.7.0.4


