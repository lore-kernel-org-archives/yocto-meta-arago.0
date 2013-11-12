Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 6E92F52A96
	for <meta-arago@arago-project.org>;
	Tue, 12 Nov 2013 04:42:41 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MW400M8MVQKNEF0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 11 Nov 2013 22:42:31 -0600 (CST)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CBB67200DD; Mon,
	11 Nov 2013 23:42:20 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 11 Nov 2013 23:42:12 -0500
Message-id: <1384231333-26952-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1384231333-26952-1-git-send-email-denis@denix.org>
References: <1384231333-26952-1-git-send-email-denis@denix.org>
Subject: [PATCH 5/6] packagegroup-arago-qt5-toolchain-target: add Qt5-specific version
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
X-List-Received-Date: Tue, 12 Nov 2013 04:42:41 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-qt5-toolchain-target.bb     | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qt5-toolchain-target.bb

diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qt5-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qt5-toolchain-target.bb
new file mode 100644
index 0000000..7e0d12c
--- /dev/null
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qt5-toolchain-target.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "Target packages for Qt5 SDK"
+LICENSE = "MIT"
+
+PR = "r1"
+
+inherit packagegroup
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+RDEPENDS_${PN} += " \
+        packagegroup-arago-standalone-sdk-target \
+        libsqlite3-dev \
+        qtbase-mkspecs \
+        qtdeclarative-mkspecs \
+        qtscript-mkspecs \
+        qtwebkit-mkspecs \
+        qt3d-mkspecs \
+        qtlocation-mkspecs \
+        qtsensors-mkspecs \
+        qtsvg-mkspecs \
+        qtjsbackend-mkspecs \
+        qtxmlpatterns-mkspecs \
+        qtbase-dev \
+        qtdeclarative-dev \
+        qtscript-dev \
+        qtwebkit-dev \
+        qt3d-dev \
+        qtlocation-dev \
+        qtsensors-dev \
+        qtsvg-dev \
+        qtjsbackend-dev \
+        qtxmlpatterns-dev \
+"
-- 
1.8.3.2


