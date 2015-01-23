Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D621852ABB
	for <meta-arago@arago-project.org>;
	Fri, 23 Jan 2015 03:37:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0N3bsCR025913
	for <meta-arago@arago-project.org>; Thu, 22 Jan 2015 21:37:54 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0N3brZZ022056
	for <meta-arago@arago-project.org>; Thu, 22 Jan 2015 21:37:53 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 22 Jan 2015 21:37:52 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0N3bmoE021861;	Thu, 22 Jan 2015 21:37:52 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Jan 2015 22:37:42 -0500
Message-ID: <1421984265-11173-4-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1421984265-11173-1-git-send-email-sam.nelson@ti.com>
References: <1421984265-11173-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 4/7] matrix-gui-*: Add recipe for keystone2 specific images
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
X-List-Received-Date: Fri, 23 Jan 2015 03:37:55 -0000
Content-Type: text/plain

- Keystone matrix gui files are maintained in a different git (keystone-demos/matrix-apps)
- Add common include file for ks2 git, so that other keystone modules can reuse
- Add recipe for including images used by keystone2 apps matrix gui

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../matrix/matrix-gui-apps-ks2-git.inc             |   10 ++++++++++
 .../matrix/matrix-gui-apps-ks2-images_2.0.bb       |   18 ++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-ks2-git.inc
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-ks2-images_2.0.bb

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-ks2-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-ks2-git.inc
new file mode 100644
index 0000000..7ae97d7
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-ks2-git.inc
@@ -0,0 +1,10 @@
+# Pull in the base package for installing matrix applications
+require matrix-gui-apps-git.inc
+
+# Change SRC URL and revision
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-demos/matrix-apps.git;protocol=git;branch=${BRANCH}"
+# commit corresponds to DEV.MATRIX.APPS.01.00.00.04
+SRCREV = "04a9a07d600cf26a114fbb60a6f7fc6c3c70f506"
+
+INC_PR = "r0"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-ks2-images_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-ks2-images_2.0.bb
new file mode 100644
index 0000000..a8e49b6
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-ks2-images_2.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Images package for Matrix GUI v2 Applications for Keystone II"
+HOMEPAGE = "http://git.ti.com/cgit/cgit.cgi/keystone-demos/matrix-apps.git"
+
+require matrix-gui-apps-ks2-git.inc
+require matrix-gui-paths.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = "${WORKDIR}/git/images"
+
+do_install(){
+    install -d ${D}${MATRIX_APP_DIR}
+    cp -rf ${S} ${D}${MATRIX_APP_DIR}
+}
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
-- 
1.7.9.5


