Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 82D4D529A1
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 06:24:19 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so1304151obb.38
	for <meta-arago@arago-project.org>;
	Thu, 04 Oct 2012 23:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=juxTjdWQlyjCYko8U6wHwbXUn0YCcLZBjnZxAtCktXU=;
	b=v02cjLKpdOPaNpBPA4RqpBH4ljqI5fDpRTFhO27Du/GYgY05qGG5UCUGUsSDIEekDa
	SigTl+i7vacGkLi7JNyLcI4eoGsj2jVOGsRjV8TVLVKt+QKiXxnSztNwcvXKwiAhsGob
	laktyhBA/p6+Hc566zIht8n8soJ/nrCpmJx3tmqVLr5A0MuT6d+BGOnbrMU761ix/DXz
	S18CBB5BkLE65WpfAELdjuNXSjj+MLlRMNRh0xQBdfiQZiKfzSdWSDzoDXuNYqQbuo7m
	qQVwDIJgtupuQON3E7XOc+RetzFt2/dkVp8zEipiViy1rJdf8JYBCS9PA9hvB2jHlVwi
	hn1w==
Received: by 10.182.1.72 with SMTP id 8mr6257127obk.61.1349418259010;
	Thu, 04 Oct 2012 23:24:19 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id 2sm8716627obi.20.2012.10.04.23.24.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 23:24:18 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  5 Oct 2012 01:52:39 -0500
Message-Id: <1349419959-21857-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] task-arago-gst: Add gst-plugins-ugly
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
X-List-Received-Date: Fri, 05 Oct 2012 06:24:19 -0000

* Gst-plugins-ugly and several dependencies have a commercial license.
* Add back gst-plugins-ugly and whitelist these needed recipes.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf           |    9 +++++++++
 .../tasks/task-arago-gst-sdk-target.bb             |    3 ++-
 .../recipes-core/tasks/task-arago-gst.bb           |    2 ++
 3 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 381118d..002f000 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -27,3 +27,12 @@ POLKITAUTH = ""
 
 # Enable generation of source packages for SDKs
 require arago-source-ipk.conf
+
+# Whitelist several recipes that have commercial licenses
+# Need to verify with legal that the following recipes are ok to distribute
+# with the SDK
+LICENSE_FLAGS_WHITELIST = "\
+    commercial_gst-plugins-ugly \
+    commercial_mpeg2dec \
+    commercial_lame \
+"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
index 655cd20..d2ccba3 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to build and install header and libs in sdk"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r0"
+PR = "r1"
 
 inherit task
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -11,4 +11,5 @@ RDEPENDS_${PN} = "\
     gst-plugins-base-dev \
     gst-plugins-good-dev \
     gst-plugins-bad-dev \
+    gst-plugins-ugly-dev \
 "
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb b/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
index da9e41c..fc0962a 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
@@ -11,9 +11,11 @@ GSTREAMER = " \
     gst-plugins-base \
     gst-plugins-good \
     gst-plugins-bad \
+    gst-plugins-ugly \
     gst-plugins-base-meta \
     gst-plugins-good-meta \
     gst-plugins-bad-meta \
+    gst-plugins-ugly-meta \
     "
 
 RDEPENDS_${PN} = "\
-- 
1.7.0.4


