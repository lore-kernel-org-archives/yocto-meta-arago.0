Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id DF626529F4
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:53:55 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so4861422oag.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=K0MK1qpI68jDMy18T9qqRElJIZ49O8NM9dRxRHsT038=;
	b=Q+VQUp1VvCc8C+oZEC4Jqg412bcGmm1vTHZkgFgaICJ/cuwAERtmghKqgmZ7qyl6iN
	QowAY0fVlXpOULhUPSiDDKtbJrm8qsaHtNLj5o8K4YO4+NK3xi5DOlh98PmSGvzd/4Hw
	M2s0qHBaFx8uvvJELWHsXQb0XemDXoYFrytooOJq2nPO37KyNGmB6m59Oh49IkkiuMRj
	5iHI9lL2ky1otFPBfB2xvCik1jnaX20jFvaDl3l2RXzaS8FwAsrZYR+VTeQshIprBcli
	xgx8oMFhLmih9EGryNtz+Qu4luUhXTPcssbtlUleB5X0EfmAp67eHAriM6QSR/9SmrQ4
	N6pg==
Received: by 10.182.86.225 with SMTP id s1mr6592733obz.91.1352080435632;
	Sun, 04 Nov 2012 17:53:55 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.53.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:53:55 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:03 -0600
Message-Id: <1352080417-9792-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 08/42] task-arago-tisdk-matrix: Remove wifi and bluetooth demos
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
X-List-Received-Date: Mon, 05 Nov 2012 01:53:56 -0000

* Wifi and bluetooth firmware and drivers have not been accepted in meta-ti.
* There are also issues with required scripts and other applications.
* Pulling wifi and bluetooth demos until these issues are fixed.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/tasks/task-arago-tisdk-matrix.bb  |   13 +------------
 1 files changed, 1 insertions(+), 12 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
index 91e095f..754b98d 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r2"
+PR = "r3"
 
 inherit task
 
@@ -42,10 +42,6 @@ MATRIX_APPS_append_ti33x = "        \
                                     \
     matrix-gui-generic-pm           \
     matrix-gui-pm-demos-suspend     \
-                                    \
-    matrix-gui-wifi-demos           \
-    matrix-gui-bluetooth-demos      \
-    matrix-gui-wifi-direct-demo     \
 "
 
 MATRIX_APPS_append_beagleboard = "  \
@@ -69,10 +65,6 @@ MATRIX_APPS_append_am37x-evm = "    \
     matrix-gui-pm-demos-snapshot2   \
     matrix-gui-pm-demos-suspend     \
                                     \
-    matrix-gui-wifi-demos           \
-    matrix-gui-wifi-direct-demo     \
-    matrix-gui-bluetooth-demos      \
-                                    \
     matrix-gui-display-control      \
     matrix-gui-camera-loopback      \
     matrix-gui-v4l2-demos           \
@@ -80,9 +72,6 @@ MATRIX_APPS_append_am37x-evm = "    \
 "
 
 RDEPENDS_append_am180x-evm = "      \
-    matrix-gui-wifi-demos           \
-    matrix-gui-bluetooth-demos      \
-    matrix-gui-wifi-direct-demo     \
 "
 
 RDEPENDS_${PN} = "        \
-- 
1.7.0.4


