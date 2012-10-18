Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 1A733529B9
	for <meta-arago@arago-project.org>;
	Thu, 18 Oct 2012 22:32:51 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so8930073oag.38
	for <meta-arago@arago-project.org>;
	Thu, 18 Oct 2012 15:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=aJtvkDDNpvvqHGMjDZV1W0stWJfvB7EovlP2cfiWfY4=;
	b=bSZzc32ZCZzBjGbHJ8AWurW6nMM5EYLuM/5/eBDiVIx0PKcHStBdTt3h4+uCkXX3zn
	KcQn26P172UAFXEbFt5fcAoMQY196nmbHJq2l/eeg2V7tmccwAUhSLgGFKlCjXFp7G1e
	yh5LgT+fWOe2ORg74JoOptJvSo3CU54+Um1QHYqaWNNwO4NDp1Og4vq5N+i4MwNUW1lQ
	I6jRfz2L4TCTvfXyhwxDhB710fKvoYpmh+Ob7SWWLF/wxjA+nV2ME2uW+iQV2yYBNs+l
	tHN/ZYRWCJ9QFx+ANZOrk1JgIYc3QO+HJv6RwzAnlY+0JHZJid6rCoeIIrOg0otokZ6I
	Zzvw==
Received: by 10.60.24.228 with SMTP id x4mr5718035oef.5.1350599570550;
	Thu, 18 Oct 2012 15:32:50 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id o3sm10303648obk.13.2012.10.18.15.32.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Oct 2012 15:32:50 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 18 Oct 2012 17:32:43 -0500
Message-Id: <1350599563-18636-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH v2] task-arago-qte: Port task-arago-qte task from Arago
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
X-List-Received-Date: Thu, 18 Oct 2012 22:32:51 -0000

* Port task-arago-qte task from Arago to meta-arago.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Replace qt4-embedded-qmlimports-* with qt4-embedded-qml-plugins.

 .../tasks/task-arago-qte-sdk-target.bb             |   28 ++++++++++++++++++++
 .../recipes-core/tasks/task-arago-qte.bb           |   17 ++++++++++++
 2 files changed, 45 insertions(+), 0 deletions(-)
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
index 0000000..c89e3f0
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-qte.bb
@@ -0,0 +1,17 @@
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
+    qt4-embedded-qml-plugins \
+    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'qt4-embedded-plugin-gfxdriver-gfxpvregl', '', d)} \
+"
-- 
1.7.0.4


