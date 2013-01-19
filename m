Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by arago-project.org (Postfix) with ESMTPS id C09B452AB8
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:51 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id ta14so4849375obb.33
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=5V9y0jFVXMZefEvtmjiis1aXcGsLvMMqjhTfscqH9a8=;
	b=BkMPKO+4qIPKe+OFTDr45O1aSDUwk2CFQeF+3FO8vIpq6cN5ngOwcOKYmj2XWnId2/
	D39GJi3GYZTkfRatyZSK/DiE7vuf7f/G47NugEI0wwQGhlwLzGRYftAP3TdOmaoMIJkr
	d+RlDXbB/rr3pQAuCT/XBJ6i7a3ob/tEp31VcIai54CRxnxo6f2tsaRg66NNLrgzeZAj
	x6oYhPM/3ojfR1YSRK0HwjF7PXDOk+YjdTfVjiE6qZYjrbFNY/9PecZggafrXTphduKz
	Fofnx9dsX1MEKfAaVY5xMs0AtZuE2IKhu7p5xV8d+K7eJryCEJhObTj7jJveZZtBEck2
	qfYg==
X-Received: by 10.60.24.135 with SMTP id u7mr10057039oef.90.1358632371066;
	Sat, 19 Jan 2013 13:52:51 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.49
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:50 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:53 -0600
Message-Id: <1358632316-12266-28-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 28/31] task-arago-qte: Add additional packages
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:52 -0000

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


