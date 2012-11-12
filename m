Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 929205208C
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 22:41:00 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id eq6so2773026obc.38
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 14:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=q21FrFfjIM8fQ68znPTO11DPBEtRHVkIHK1Isswa2jQ=;
	b=jfeEvJ2qjx22xzxoWI2GNwi51y19VEvfhB2/cpJjZivU/OiScNsPuM9T3V+3s5ntVG
	TFNjMC+ivXhhj56hQ5sgorX7xkxg3/6CTSscX9T+vhMs9QHZYFDOGrUYoDMSTKSblZQN
	PConI/kyC7Lb7+zXZGuEeJUPPvWH2FR1ebuRgpAchz3E3ik8wdoOhq1JScSdVCNHlMG7
	QiCTfBdjYGZdoWYCmlazOdNJsd8+AxNpfxm1a7ter5EMb+vvcQ8xlR7x+hCi5NKTSwkb
	iScAOlxzUxg2ZMVUIzepbuH6VwyN8n9kRlhjk+xAujN2/3oMdjM5Mcwxa6Q5G2nfcGtb
	m0XQ==
Received: by 10.182.172.74 with SMTP id ba10mr16516707obc.83.1352760059889;
	Mon, 12 Nov 2012 14:40:59 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id d7sm4394896oee.2.2012.11.12.14.40.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 14:40:59 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 12 Nov 2012 16:40:52 -0600
Message-Id: <1352760055-6119-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/4] quick-playground: Port quick-playground from Arago
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
X-List-Received-Date: Mon, 12 Nov 2012 22:41:00 -0000

* Port Qt application qml-playground from Arago.
* Renaming the recipe from qml-playground to quick-playground.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-qt/qt-apps/quick-playground_1.0.bb     |   36 ++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb

diff --git a/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb b/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb
new file mode 100644
index 0000000..ccbde4a
--- /dev/null
+++ b/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "Qt Quick Playground"
+HOMEPAGE = "http://arago-project.org/git/projects/?p=qt4-demos.git;a=summary"
+SECTION = "multimedia"
+LICENSE = "Nokia"
+LIC_FILES_CHKSUM = "file://Licence.txt;md5=7cc88160b55ec5db6c6c5bb8e3238c0b"
+
+require recipes-core/matrix/matrix-gui-paths.inc
+
+INC_PR = "r0"
+
+BRANCH = "master"
+SRCREV = "49bb5b7e1df2f61fc361b7d83a6ec838ffc5381c"
+
+SRC_URI = "git://arago-project.org/git/projects/qt4-demos.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git/qml_playground"
+
+inherit qt4e
+
+# use the make targets already created in the Makefile.build files
+do_install() {
+    make -f Makefile.build DESTDIR=${D} install_common
+}
+
+RDEPENDS  += "matrix-gui-apps-images matrix-gui-submenus-qt4"
+
+PACKAGES += "matrix-gui-apps-quick-playground"
+
+# Add the matrix directory to the FILES
+FILES_${PN} = "${MATRIX_APP_DIR}/qml_playground/qtquickplayground \
+               /usr/bin/runQMLplay.sh"
+
+# Add the .debug directory to the dbg package
+FILES_${PN}-dbg += "${MATRIX_APP_DIR}/qml_playground/.debug"
+
+FILES_matrix-gui-apps-quick-playground = "${MATRIX_APP_DIR}/*"
-- 
1.7.0.4


