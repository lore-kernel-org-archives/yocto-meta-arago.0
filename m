Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by arago-project.org (Postfix) with ESMTPS id D950C529E1
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 17:53:40 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id wp18so2861900obc.1
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 09:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=ry3i3BS9QQdyxGfWzXzkM3IT7vERP/5uyQFic0eya1Y=;
	b=j+Goe/V4q3DZQC+WzAc6bgvPvbDdMarBZ2C6pZx1DWtrcp7rMNOgroPlrwyqXV2gN1
	CYl+O4NoCo+PXc/23h3941vdGXyktluQBsBdojK/y/OVnQOn+JxO94mjw7HULus0yR7A
	Bqsv2m14jXVwayboR0ovlIvHv7NvfFul2kFHuCZB90+2Y5p+J3+hL8/q600LFg4eGGrp
	nv6S3Vm4Ko76eVpW0aOj9lg6I5vSN1n0hJ4Z8sKhSbYpc7Mu+gjuTR+hyQHg1DwqAu8n
	7gkqy4YXCDDgZJrK1RvRO2GZHkCu4khrdd3nUuQ4wbGd6Rfb8Rcs0Yeuipw/IVfoGRX5
	X3RA==
X-Received: by 10.182.130.38 with SMTP id ob6mr4616645obb.100.1358445220284;
	Thu, 17 Jan 2013 09:53:40 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id zn9sm1503218obb.23.2013.01.17.09.53.38
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 09:53:39 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 17 Jan 2013 11:53:09 -0600
Message-Id: <1358445195-22441-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358445195-22441-1-git-send-email-fcooper@ti.com>
References: <1358445195-22441-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 06/12] quick-playground: Port quick-playground from Arago
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
X-List-Received-Date: Thu, 17 Jan 2013 17:53:41 -0000

* Port Qt application qml-playground from Arago.
* Renaming the recipe from qml-playground to quick-playground.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-qt/qt-apps/quick-playground_1.0.bb     |   36 ++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb

diff --git a/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb b/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb
new file mode 100644
index 0000000..a8e8869
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
+PR = "r0"
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
+PACKAGES += "matrix-gui-apps-quick-playground"
+
+RDEPENDS_matrix-gui-apps-quick-playground  = "matrix-gui-apps-images matrix-gui-submenus-qt4 ${PN}"
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


