Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id 3287B52099
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 07:17:52 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTZ00ISAAXRXGQ0@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 01 Oct 2013 02:17:51 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 773C5273BD; Tue,
	01 Oct 2013 03:11:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 01 Oct 2013 03:11:12 -0400
Message-id: <1380611472-23600-14-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1380611472-23600-1-git-send-email-denis@denix.org>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
Subject: [PATCH 13/13] arago-qt5-image: add test minimal image for testing Qt5 migration
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
X-List-Received-Date: Tue, 01 Oct 2013 07:17:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/arago-qt5-image.bb             | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/arago-qt5-image.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-qt5-image.bb b/meta-arago-distro/recipes-core/images/arago-qt5-image.bb
new file mode 100644
index 0000000..7d8ced9
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/arago-qt5-image.bb
@@ -0,0 +1,18 @@
+# Arago TI SDK base image
+# gives you an image with Qt/E and other common packages shared by all TI SDKs.
+
+require arago-image.inc
+inherit remove-net-rules
+
+COMPATIBLE_MACHINE = "omap3|omapl138|ti33x|ti43x|omap4|omap-a15"
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
+export IMAGE_BASENAME = "arago-qt5-image"
-- 
1.8.3.2


