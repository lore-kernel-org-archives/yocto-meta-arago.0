Return-Path: <heroor@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id F38FE529EA
	for <meta-arago@arago-project.org>;
	Mon,  1 Jul 2013 15:48:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61FmHpm007038
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2013 10:48:17 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61FmH6I013115
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2013 10:48:17 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 1 Jul 2013 10:48:16 -0500
Received: from ti.com (swubn01.india.ti.com [172.24.162.214])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with SMTP id r61FmFf3018703;
	Mon, 1 Jul 2013 10:48:16 -0500
Date: Mon, 1 Jul 2013 21:18:14 +0530
From: Siddharth Heroor <heroor@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20130701154814.GA1802@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH 2/2] images: Add new arago-glsdk-console-image
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
X-List-Received-Date: Mon, 01 Jul 2013 15:48:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Signed-off-by: Siddharth Heroor <heroor@ti.com>
Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 .../images/arago-glsdk-console-image.bb            |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/images/arago-glsdk-console-image.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-glsdk-console-image.bb b/meta-arago-distro/recipes-core/images/arago-glsdk-console-image.bb
new file mode 100644
index 0000000..8ce905c
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/arago-glsdk-console-image.bb
@@ -0,0 +1,16 @@
+# GLSDK console image
+# gives you an image with basic media libraries
+
+require arago-image.inc
+
+COMPATIBLE_MACHINE = "(?!omap-a15)"
+
+# The size of the uncompressed ramdisk is 32MB
+ROOTFS_SIZE = "32768"
+
+IMAGE_INSTALL += "\
+    packagegroup-arago-base \
+    packagegroup-arago-console \
+    packagegroup-arago-glsdk-console \
+    "
+export IMAGE_BASENAME = "arago-glsdk-console-image"
-- 
1.7.0.4


