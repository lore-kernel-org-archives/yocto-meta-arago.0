Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id B74025296D
	for <meta-arago@arago-project.org>;
	Tue, 23 Oct 2012 22:39:21 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so3902179oag.38
	for <meta-arago@arago-project.org>;
	Tue, 23 Oct 2012 15:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=0zCuokiICzvHXnvE7ByvIPbGzV4TPKsKaYKdj6PiZ5E=;
	b=Ip5Ahvxha+yCcqe9Z9gMdWFOmz+C6mnYYw2eXC1nkDncDsxWpJ1FkIE6KtfxTpK6ky
	S40OPXYw7jb9cNThCczoU10sB4jWooZB5pPf9NOqYjYC+YCK7sO4W6nSzW6goavtkqPD
	jMDlZunzJzgoYcDKNZAkeMPMNexdPOZs9pzfotHpbG4UM/yd3+Ouev0PZBBWYlgbWhuS
	jz9UXoixPk01POAYPcCG182siwuc0LThQ39yK9QIt89CyZSE0hF3pJeVa0YMYBUUhU/J
	jQvebEL6StAHoFIobJfwqFQ/g4kt+ktq4W//wijMbveguCqWG38Tw+N+AbWIZUg8+A6e
	4Gpw==
Received: by 10.60.28.234 with SMTP id e10mr12704698oeh.67.1351031961035;
	Tue, 23 Oct 2012 15:39:21 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id c1sm10829002oee.10.2012.10.23.15.39.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 15:39:20 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Tue, 23 Oct 2012 17:39:16 -0500
Message-Id: <1351031956-2850-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH v3] task-arago-qte: Port task-arago-qte task from Arago
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
X-List-Received-Date: Tue, 23 Oct 2012 22:39:22 -0000

* Port task-arago-qte task from Arago to meta-arago.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 3 changes:
Correct recipes descriptions

Version 2 changes:
Replace qt4-embedded-qmlimports-* with qt4-embedded-qml-plugins

 .../tasks/task-arago-qte-sdk-target.bb             |   28 ++++++++++++++++++++
 .../recipes-core/tasks/task-arago-qte.bb           |   17 ++++++++++++
 2 files changed, 45 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-qte-sdk-target.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-qte.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-qte-sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-qte-sdk-target.bb
new file mode 100644
index 0000000..cf444f9
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-qte-sdk-target.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Task to build and install Qt embedded headers and libs into the sdk"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+
+RDEPENDS_${PN} = "\
+    qt4-embedded-dev \
+    qt4-embedded-mkspecs \
+    libqt-embeddedphonon4-dev \
+    libqt-embedded3support4-dev \
+    libqt-embeddedclucene4-dev \
+    libqt-embeddedcore4-dev \
+    libqt-embeddeddbus4-dev \
+    libqt-embeddeddesignercomponents4-dev \
+    libqt-embeddeddesigner4-dev \
+    libqt-embeddeduitools4-dev \
+    libqt-embeddedgui4-dev \
+    libqt-embeddedhelp4-dev \
+    libqt-embeddednetwork4-dev \
+    libqt-embeddedscript4-dev \
+    libqt-embeddedscripttools4-dev \
+    libqt-embeddedsvg4-dev \
+    libqt-embeddedtest4-dev \
+    libqt-embeddedwebkit4-dev \
+    libqt-embeddedxml4-dev \
+"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-qte.bb b/meta-arago-distro/recipes-core/tasks/task-arago-qte.bb
new file mode 100644
index 0000000..420a061
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-qte.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Task to add Qt embedded related packages"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+
+RDEPENDS_${PN} = "\
+    qt4-embedded \
+    qt4-embedded-plugin-mousedriver-tslib \
+    qt4-embedded-plugin-gfxdriver-gfxtransformed \
+    qt4-embedded-plugin-phonon-backend-gstreamer \
+    qt4-embedded-plugin-imageformat-gif \
+    qt4-embedded-plugin-imageformat-jpeg \
+    qt4-embedded-qml-plugins \
+    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'qt4-embedded-plugin-gfxdriver-gfxpvregl', '', d)} \
+"
-- 
1.7.0.4


