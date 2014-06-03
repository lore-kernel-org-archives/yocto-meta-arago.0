Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 40F9F52AA6
	for <meta-arago@arago-project.org>;
	Tue,  3 Jun 2014 02:30:18 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N6K00DY3MXPTXD0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 02 Jun 2014 21:30:02 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A076E202AA; Mon,
	02 Jun 2014 22:29:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 02 Jun 2014 22:29:40 -0400
Message-id: <1401762581-31370-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1401762581-31370-1-git-send-email-denis@denix.org>
References: <1401762581-31370-1-git-send-email-denis@denix.org>
Subject: [PATCH 4/5] packagegroup-*-qt5: add Qt5 versions of arago packagegroups
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
X-List-Received-Date: Tue, 03 Jun 2014 02:30:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-qt5.bb            | 15 +++++++++++++++
 .../packagegroups/packagegroup-arago-tisdk-qt5.bb      | 18 ++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qt5.bb
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qt5.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qt5.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qt5.bb
new file mode 100644
index 0000000..ff0f3ed
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qt5.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Task to add Qt embedded related packages"
+LICENSE = "MIT"
+PR = "r0"
+
+inherit packagegroup
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+RDEPENDS_${PN} = "\
+    qtbase-plugins \
+    qtdeclarative-plugins \
+    qtlocation-plugins \
+    qtmultimedia-plugins \
+    qtwayland-plugins \
+"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qt5.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qt5.bb
new file mode 100644
index 0000000..9ce43e6
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qt5.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Task to add Qt embedded related packages"
+LICENSE = "MIT"
+PR = "r0"
+
+inherit packagegroup
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+QT_DEMOS = "\
+    qtwayland-examples \
+    qtwebkit-examples-examples \
+    qt-tstat \
+"
+
+RDEPENDS_${PN} = "\
+    packagegroup-arago-qt5 \
+    ${QT_DEMOS} \
+"
-- 
1.9.2


