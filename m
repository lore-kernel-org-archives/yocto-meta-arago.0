Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 56F79529AB
	for <meta-arago@arago-project.org>;
	Fri, 12 Oct 2012 05:34:02 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so2452280obb.38
	for <meta-arago@arago-project.org>;
	Thu, 11 Oct 2012 22:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=xTjO08FZQhvQK7SkvklzjxuIWZfM4mqYWXJ5DXz5bMk=;
	b=W4V4b9Qejo3AqvxtYonHsbMnn/aYzbxANkepcH6qD6FPPGs9D50yBuWdRZqAZPiPYD
	dhu6+5wBr0e1Fv6fHPWw193wMH1bkytXkGbXmsp1Mr8cRRzJRFVI7BqHsSLuVYt6RdH/
	Adtkgsp0PKquRO7IOYUVQCEZioSVGY8mmtqmuEtKwjtzxN1UXgFKwND1OZ2JAw1YneIs
	08G0D3TD+YbZsqdKwYZU3vyburgZOdc3cOdfyKLtUPVlpd4EvS7iW5LDXQcCyR3Rssfk
	UOoZ9q1/1qddwKu8zMjb2tVaJelCkEVad92JV4Vfjh/CVfgdLXY8JIKCjKfL6ZJHawej
	cIPw==
Received: by 10.182.177.99 with SMTP id cp3mr2545975obc.92.1350020041769;
	Thu, 11 Oct 2012 22:34:01 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id jd10sm6019389obb.13.2012.10.11.22.34.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Oct 2012 22:34:01 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 12 Oct 2012 01:04:55 -0500
Message-Id: <1350021895-13144-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] task-arago-qte: Port task-arago-qte task from Arago
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
X-List-Received-Date: Fri, 12 Oct 2012 05:34:02 -0000

* Port task-arago-qte task from Arago to meta-arago.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../tasks/task-arago-qte-sdk-target.bb             |   28 ++++++++++++++++++++
 .../recipes-core/tasks/task-arago-qte.bb           |   18 ++++++++++++
 2 files changed, 46 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-qte-sdk-target.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-qte.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-qte-sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-qte-sdk-target.bb
new file mode 100644
index 0000000..c89ab6b
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-qte-sdk-target.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Task to add gstreamer and gstreamer plugins"
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
index 0000000..d09f3e2
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-qte.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Task to add gstreamer and gstreamer plugins"
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
+    qt4-embedded-qmlimports-particles \
+    qt4-embedded-qmlimports-webkit \
+    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'qt4-embedded-plugin-gfxdriver-gfxpvregl', '', d)} \
+"
-- 
1.7.0.4


