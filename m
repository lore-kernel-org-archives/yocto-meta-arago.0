Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by arago-project.org (Postfix) with ESMTP id 2F78152AB1
	for <meta-arago@arago-project.org>;
	Mon,  7 Oct 2013 19:01:05 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUB00CCKBH2I6J0@vms173005.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 07 Oct 2013 14:00:42 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8637820011; Mon,
	07 Oct 2013 15:00:42 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 07 Oct 2013 15:00:27 -0400
Message-id: <1381172427-18302-13-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1381172427-18302-1-git-send-email-denis@denix.org>
References: <1381172427-18302-1-git-send-email-denis@denix.org>
Subject: [PATCHv2 12/12] arago-qt5-test-image: add test minimal image for testing Qt5 migration
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
X-List-Received-Date: Mon, 07 Oct 2013 19:01:06 -0000

From: Denys Dmytriyenko <denys@ti.com>

This is a temporary image for testing Qt5 integration

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - update image name and provide comment and description

 .../recipes-core/images/arago-qt5-test-image.bb          | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/arago-qt5-test-image.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-qt5-test-image.bb b/meta-arago-distro/recipes-core/images/arago-qt5-test-image.bb
new file mode 100644
index 0000000..cd5c054
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/arago-qt5-test-image.bb
@@ -0,0 +1,16 @@
+# Arago Qt5 test image
+# gives you an image with Qt5 for basic testing purposes.
+
+require arago-image.inc
+inherit remove-net-rules
+
+IMAGE_INSTALL += "\
+    packagegroup-arago-base \
+    packagegroup-arago-console \
+    packagegroup-arago-base-tisdk \
+    matrix-gui-browser \
+    qtwebkit-examples-examples \
+    qtbase-plugins \
+    "
+
+export IMAGE_BASENAME = "arago-qt5-test-image"
-- 
1.8.3.2


