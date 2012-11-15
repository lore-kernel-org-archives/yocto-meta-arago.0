Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id BC8F152A0A
	for <meta-arago@arago-project.org>;
	Thu, 15 Nov 2012 23:57:12 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2105502oag.38
	for <meta-arago@arago-project.org>;
	Thu, 15 Nov 2012 15:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=5V9y0jFVXMZefEvtmjiis1aXcGsLvMMqjhTfscqH9a8=;
	b=eH38y7waiT2fGC4ogDWI6+y6BmlPjBk1Yal0WaBmZofpN00LNDgEkOvWp4cli0bjOT
	W7b5CKvdHMpdTG92E+EflTD3c9XDAt5NaeInpBMj9w8+F3JnLPyZg5qaKqTNPv+xtTjB
	GE+9XHzeLA0KfB4pT7JCJHqhbfEaLzwvGTP3hhQRc5jjmzpp2lKOusmW8CZlCNFDbPO4
	CHiQRcm+L4AHgROka6hrhLodce6iFp04V/vcaNnQrchMbwLNY08ls59ymPAWVKcwn19p
	b7U/m5CBvZ6jSj2myNkXoPbEJKJV4R3ImxOv4swC7o0r+u9KMNnv+uebZElOwwAMfnFY
	QSSQ==
Received: by 10.60.22.226 with SMTP id h2mr2366990oef.131.1353023831860;
	Thu, 15 Nov 2012 15:57:11 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id hz6sm17313073obb.1.2012.11.15.15.57.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Nov 2012 15:57:11 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 15 Nov 2012 17:57:05 -0600
Message-Id: <1353023826-19449-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/3 v2] task-arago-qte: Add additional packages
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
X-List-Received-Date: Thu, 15 Nov 2012 23:57:12 -0000

* Adding additional packages that were automatically installed with Qt in
  classic Arago but not being done now.
* This insures the packages installed in the old SDK matches the new one.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/tasks/task-arago-qte.bb           |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-qte.bb b/meta-arago-distro/recipes-core/tasks/task-arago-qte.bb
index 420a061..6fc6b61 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-qte.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-qte.bb
@@ -1,10 +1,16 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r0"
+PR = "r1"
 
 inherit task
 
+QT_SGX_SUPPORT = "\
+    qt4-embedded-plugin-gfxdriver-gfxpvregl \
+    libqt-embeddedopengl4 \
+    libqt-embeddedpvrqwswsegl4 \
+"
+
 RDEPENDS_${PN} = "\
     qt4-embedded \
     qt4-embedded-plugin-mousedriver-tslib \
@@ -13,5 +19,8 @@ RDEPENDS_${PN} = "\
     qt4-embedded-plugin-imageformat-gif \
     qt4-embedded-plugin-imageformat-jpeg \
     qt4-embedded-qml-plugins \
-    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'qt4-embedded-plugin-gfxdriver-gfxpvregl', '', d)} \
+    libqt-embeddedmultimedia4 \
+    libqt-embeddeddeclarative4 \
+    libqt-embeddedxmlpatterns4 \
+    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', '${QT_SGX_SUPPORT}', '', d)} \
 "
-- 
1.7.0.4


