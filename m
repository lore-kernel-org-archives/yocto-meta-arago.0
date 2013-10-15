Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTP id A54A45299D
	for <meta-arago@arago-project.org>;
	Tue, 15 Oct 2013 03:22:58 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUO00G7KXCW0K20@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 14 Oct 2013 22:22:24 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5892F213B1; Mon,
	14 Oct 2013 23:22:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 14 Oct 2013 23:21:57 -0400
Message-id: <1381807317-3759-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1381807317-3759-1-git-send-email-denis@denix.org>
References: <1381807317-3759-1-git-send-email-denis@denix.org>
Subject: [PATCH 5/5] arago-qt5-test-image: replace matrix-browser with qt-tstat demo
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
X-List-Received-Date: Tue, 15 Oct 2013 03:22:58 -0000

From: Denys Dmytriyenko <denys@ti.com>

* As matrix-browser requires QtWebKit, which depends on QtDeclarative, that
  depends on QtQuick, which requires GLES to build and function.
* Instead, use QtWidgets based Thermostat demo app to showcase Qt 5.1.1 on
  framebuffer when GLES is not available.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-qt5-test-image.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-qt5-test-image.bb b/meta-arago-distro/recipes-core/images/arago-qt5-test-image.bb
index cd5c054..5fbbfd3 100644
--- a/meta-arago-distro/recipes-core/images/arago-qt5-test-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-qt5-test-image.bb
@@ -8,9 +8,12 @@ IMAGE_INSTALL += "\
     packagegroup-arago-base \
     packagegroup-arago-console \
     packagegroup-arago-base-tisdk \
-    matrix-gui-browser \
-    qtwebkit-examples-examples \
     qtbase-plugins \
+    qt-tstat \
     "
 
+# These are now disabled due to gles dependency
+#    matrix-gui-browser
+#    qtwebkit-examples-examples
+
 export IMAGE_BASENAME = "arago-qt5-test-image"
-- 
1.8.3.2


