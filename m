Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 4E79C529B8
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 18:36:28 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so2627663obb.38
	for <meta-arago@arago-project.org>;
	Thu, 01 Nov 2012 11:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=K0MK1qpI68jDMy18T9qqRElJIZ49O8NM9dRxRHsT038=;
	b=RzLGP+q0Ac36E1O3H+8wfvz8+Ue2CthFopPvPcNVtXhP0bwz/qGw3kA0qKZt/vr78g
	zs8/thvgQtr+MaHVMONmQY+BoQlkmy90rbCnzTDay7HjRZyTGOaDBvpD4z7rX56uqhIe
	7ygsTMIfCB6B3kiOLbTFuX2s7BAWPVFaU8mdpzDhnSORG413JndkUnAS8Bh26lzSJD7w
	8hLpLgT+irtA7h1cuo0a1NhN8bNhta5DDZpcO+KtDcpDA7g8VCfbMJK4r/7WAI+dLlDj
	fFXRVQcKxd0Elq23L+8RV/riIDMwqKeshXTHFP7IoHIVV67tWK6f+AXZJRcWXAFNfx15
	pxBg==
Received: by 10.60.0.166 with SMTP id 6mr34413026oef.6.1351794987845;
	Thu, 01 Nov 2012 11:36:27 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id n7sm6946023obd.16.2012.11.01.11.36.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 11:36:27 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  1 Nov 2012 13:36:23 -0500
Message-Id: <1351794983-4386-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] task-arago-tisdk-matrix: Remove wifi and bluetooth demos
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
X-List-Received-Date: Thu, 01 Nov 2012 18:36:28 -0000

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


