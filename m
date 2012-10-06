Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 0A175529A1
	for <meta-arago@arago-project.org>;
	Sat,  6 Oct 2012 16:18:48 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2501488oag.38
	for <meta-arago@arago-project.org>;
	Sat, 06 Oct 2012 09:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=6IQTzGeFC/nUHK8O5UZuFC7NtSR52LIpvydOI8YaDhE=;
	b=uXieBQZaXUJQojXacIJedme6VmB8ddUxM6dT0BzhKZg+W8VxDo0uGdLsPx3atAain8
	ABfbOEFh9Xqk8nQS6LI155aVrUwEIFBfT0ahK/+DNVsxTAMFviYCmj/quu14IPeLpEo4
	TgVaVFvF2B8mPAfzFUMr/K/ZLOzAOGWSyOhbsd7SLwRvCC7SjWj36vIOYhSL06hDWijd
	4v3GFCYstj/+jUGGS6Xj3ee0GJUFPwMgXiSwD6AamtmSDVZSUWxNlq+NEOE3tWt5Awqd
	mZ36zKMqEla3gpASlLUhla9qEUVik4WavPx53WYlLSMmuIWKG5k+QML2R4kd1Jq1zf7P
	Iq7Q==
Received: by 10.60.13.37 with SMTP id e5mr9325893oec.98.1349540328409;
	Sat, 06 Oct 2012 09:18:48 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b7sm8435729oef.12.2012.10.06.09.18.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Oct 2012 09:18:48 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat,  6 Oct 2012 11:47:33 -0500
Message-Id: <1349542053-31639-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v3] task-arago-tisdk-multimedia: Port multimedia task from arago to meta-arago
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
X-List-Received-Date: Sat, 06 Oct 2012 16:18:49 -0000

From: Franklin S Cooper Jr <fcooper@ti.com>

* Port task-arago-tisdk-multimedia from arago to meta-arago.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
Version 3 changes:
Remove unneeded PACKAGE_ARCH = "${MACHINE_ARCH}" statement.

 .../tasks/task-arago-tisdk-multimedia-sdk-host.bb  |   21 ++++++++++++++
 .../task-arago-tisdk-multimedia-sdk-target.bb      |   10 ++++++
 .../tasks/task-arago-tisdk-multimedia.bb           |   30 ++++++++++++++++++++
 3 files changed, 61 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-host.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-target.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-host.bb
new file mode 100644
index 0000000..17defc2
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-host.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Task to add multimedia related sources into the SDK"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+MULTIMEDIA = ""
+
+MULTIMEDIA_append_am37x-evm = " \
+    av-examples-src \
+"
+
+MULTIMEDIA_append_am3517-evm = " \
+    av-examples-src \
+"
+
+RDEPENDS_${PN} = "\
+    ${MULTIMEDIA} \
+"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-target.bb
new file mode 100644
index 0000000..7058c99
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-target.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "Task to build and install header and libs into sdk"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+
+RDEPENDS_${PN} = "\
+    task-arago-gst-sdk-target \
+"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia.bb
new file mode 100644
index 0000000..8cd0d2a
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Task to add multimedia related packages"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+MULTIMEDIA = ""
+
+MULTIMEDIA_append_omap3 = " \
+    amsdk-av-files \
+"
+
+MULTIMEDIA_append_ti33x = " \
+    amsdk-av-files \
+"
+
+MULTIMEDIA_append_am37x-evm = " \
+    av-examples \
+"
+
+MULTIMEDIA_append_am3517-evm = " \
+    av-examples \
+"
+
+RDEPENDS_${PN} = "\
+    task-arago-gst \
+    ${MULTIMEDIA} \
+"
-- 
1.7.0.4


