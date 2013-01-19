Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by arago-project.org (Postfix) with ESMTPS id 6136352ABB
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:41 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id v19so4887951obq.14
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=gcaVYhuFFtQXH7VR/upYALv/mZCsRI6RzJ37nkPkiMY=;
	b=SJ+6pQTsDWzfVmgwWquSN0yY2tHuHDQ5DgMUhlO6HPlhZcBNqt3aXnypuq0K3PNSFh
	IN58Xz+OM4XkuE0kdcta9Qoo8kcZOT7r2v8G5nf43gVDgHm/pYlxyfaqHo6MnzZ4hdYA
	+iMKMYeCjprmSnX0CtoO1SSD14ErVlUU4BB0YkzHZreDFg8wMXCXFK/QMB5YZdnPiicz
	4CUTgHR0bbm2VEgj9KNmG0sGQ504nf+pa9cJFD2F486WzStzOA/s6c4A1V8/TAOrProG
	fqFZRT9PUr+7qtIUOUCo/0+Cf2f7CkLUe9w+ijxxRpayT77yT/hWwDoXnu/8eYNgNaGo
	i1VQ==
X-Received: by 10.60.19.231 with SMTP id i7mr10399232oee.34.1358632360758;
	Sat, 19 Jan 2013 13:52:40 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.38
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:39 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:47 -0600
Message-Id: <1358632316-12266-22-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 22/31] task-arago-tisdk-matrix: Add back Bluetooth and WLAN Matrix Demos
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:41 -0000

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/tasks/task-arago-tisdk-matrix.bb  |   16 +++++++++++++++-
 1 files changed, 15 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
index 529dd55..3169026 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r5"
+PR = "r6"
 
 inherit task
 
@@ -53,6 +53,11 @@ MATRIX_APPS_append_ti33x = "        \
                                     \
     matrix-gui-generic-pm           \
     matrix-gui-pm-demos-suspend     \
+                                    \
+    matrix-gui-wifi-demos           \
+    matrix-gui-bluetooth-demos      \
+    matrix-gui-wifi-direct-demo     \
+    matrix-gui-wifi-battleship-demo \
 "
 
 MATRIX_APPS_append_beagleboard = "  \
@@ -80,9 +85,18 @@ MATRIX_APPS_append_am37x-evm = "    \
     matrix-gui-camera-loopback      \
     matrix-gui-v4l2-demos           \
     matrix-gui-display-control      \
+                                    \
+    matrix-gui-wifi-demos           \
+    matrix-gui-bluetooth-demos      \
+    matrix-gui-wifi-direct-demo     \
+    matrix-gui-wifi-battleship-demo \
 "
 
 RDEPENDS_append_am180x-evm = "      \
+    matrix-gui-wifi-demos           \
+    matrix-gui-bluetooth-demos      \
+    matrix-gui-wifi-direct-demo     \
+    matrix-gui-wifi-battleship-demo \
 "
 
 RDEPENDS_${PN} = "        \
-- 
1.7.0.4


