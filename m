Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by arago-project.org (Postfix) with ESMTPS id 1F62152A24
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:25:55 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id j6so472802oag.8
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=GR1dWuxjEVTuSoHQbtnIJo/zqPU9DWdFMcJZ6PRZAP0=;
	b=WqTP2jZ9qLSi+aGuygZA6crDg1tW8WhmDONJYFBWsyxdQtixoaMgEa1baQxi7oZoEt
	KiWaB21DjXkSM0iH2ctIC34qofrsk/U6sQ5Si2psD4oVRhIHX8+kQ1QvDBmAGfLhh5qz
	E5d7QMZs14psOxMTFsYw6dsIAzAXIbMr3Eo55iEbDk2sEgXVEaoSgSh4C///ZFNdbjwV
	ULw1gjC5Nirhsgz86Yp+RqAAwuokKYU4zKGjUzH1Wp8f/HFjeTZyBZUG7W+Odg1PHdvK
	thXnAW+ALk946Vu/c+g6tV7EPYnvKCCD8cJuBItFgwx3oHsl/jQ28ZrvQ6ibOu6eQyEf
	GBJg==
X-Received: by 10.60.31.6 with SMTP id w6mr11772140oeh.65.1359393954702;
	Mon, 28 Jan 2013 09:25:54 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.25.53
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:25:53 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:09 -0600
Message-Id: <1359393932-31361-9-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 09/32] task-arago-tisdk-addons: Add canutils
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
X-List-Received-Date: Mon, 28 Jan 2013 17:25:55 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Add back canutils which is used by ti33x and omap3 platforms.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../tasks/task-arago-tisdk-addons-sdk-target.bb    |   19 +++++++++++++++++++
 .../recipes-core/tasks/task-arago-tisdk-addons.bb  |    5 ++++-
 2 files changed, 23 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons-sdk-target.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons-sdk-target.bb
new file mode 100644
index 0000000..cb9cffe
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons-sdk-target.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
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
+UTILS = ""
+
+UTILS_append_omap3 = " canutils-dev"
+UTILS_append_ti33x = " canutils-dev"
+
+RDEPENDS_${PN} = "\
+    ${UTILS} \
+"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb
index dfad051..44846c7 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r2"
+PR = "r3"
 
 inherit task
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -21,6 +21,9 @@ UTILS = " \
 # Add PRU examples for am180x-evm devices
 UTILS_append_am180x-evm = " ti-pru-sw-examples"
 
+UTILS_append_omap3 = " canutils"
+UTILS_append_ti33x = " canutils"
+
 RDEPENDS_${PN} = "\
     ${UTILS} \
 "
-- 
1.7.0.4


