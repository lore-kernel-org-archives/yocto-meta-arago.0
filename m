Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 0CC0552988
	for <meta-arago@arago-project.org>;
	Thu, 15 Nov 2012 23:26:05 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id eq6so2082777obc.38
	for <meta-arago@arago-project.org>;
	Thu, 15 Nov 2012 15:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=9r7u3DF0cJNO0kSW+p2VoIRXkcS8Uw/jXuRGLWmjWuw=;
	b=j2WnG8xKhnzXbgvw94RSLzInSlkVRqfnPhSfVv5FC4zXN7kjBFeCm1jWcj7UXsOrc/
	ipwj7pFnerBajp63VS0bPHjpOGdcvI9q0kZu082cmJSG8liibU0+FmfL3zEWHsbEggea
	TU3d6+67ZxPbyJtZuCtH+x7BtkJpkAfEU37W9Rucdd/ilQB+mSbi087JGUHhffLHUHRS
	LT+3S8DVuu/H65dw06tagWOmTdBkQ785EEwoY/bKBToMKWFzaRZrCHw7dbQsBkc9RMQT
	eod5GWhC11LJs0eJZNgQf89lo7OKPpLhNBHCZpeTOuHAerIP3J0DbjJwFR3raYlV59lP
	QOIA==
Received: by 10.60.10.201 with SMTP id k9mr2433115oeb.105.1353021964877;
	Thu, 15 Nov 2012 15:26:04 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m8sm13533403oeb.3.2012.11.15.15.26.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Nov 2012 15:26:04 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 15 Nov 2012 17:25:56 -0600
Message-Id: <1353021956-18687-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1353021956-18687-1-git-send-email-fcooper@ti.com>
References: <1353021956-18687-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/3] task-arago-qte-toolchain-target: Add additional packages
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
X-List-Received-Date: Thu, 15 Nov 2012 23:26:05 -0000

* Adding additional packages that were automatically installed with Qt in
  classic Arago but not being done now.
* This insures the packages installed in the old SDK matches the new one.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../tasks/task-arago-qte-toolchain-target.bb       |   16 ++++++++++++++--
 1 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-target.bb
index d919af2..2635c63 100644
--- a/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-target.bb
+++ b/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-target.bb
@@ -2,12 +2,20 @@ DESCRIPTION = "Target packages for Qt Embedded SDK"
 LICENSE = "MIT"
 ALLOW_EMPTY = "1"
 
-PR = "r2"
+PR = "r3"
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
+
+QT_SGX_SUPPORT = "\
+    qt4-embedded-gles-dev \
+    libqt-embeddedopengl4-dev \
+    libqt-embeddedpvrqwswsegl4-dev \
+"
+
 RDEPENDS_${PN} += " \
+        qt4-embedded-dev \
         task-core-standalone-sdk-target \
         qt4-embedded-mkspecs \
         libqt-embeddedmultimedia4-dev \
@@ -30,4 +38,8 @@ RDEPENDS_${PN} += " \
         libqt-embeddedwebkit4-dev \
         libqt-embeddedxml4-dev \
         libsqlite3-dev \
-        "
+        libqt-embeddedxmlpatterns4-dev \
+        libqt-embeddedmultimedia4-dev \
+        libqt-embeddeddeclarative4-dev \
+        ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles','${QT_SGX_SUPPORT}', '', d)} \
+"
-- 
1.7.0.4


