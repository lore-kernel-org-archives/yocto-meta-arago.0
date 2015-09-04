Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id E05105209B
	for <meta-arago@arago-project.org>;
	Fri,  4 Sep 2015 15:56:51 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NU50045NTMHQ3A0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 04 Sep 2015 10:56:46 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=ff-B7xzCdYMA:10 a=sozttTNsAAAA:8
	a=hQG7Js5gOTVZZVppglcA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4FBDC161BD2;	Fri,
	4 Sep 2015 11:56:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 04 Sep 2015 11:56:40 -0400
Message-id: <1441382200-1234-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [master/fido][PATCH] tisdk-server-rootfs: update to match main tisdk-rootfs and include test packages
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
X-List-Received-Date: Fri, 04 Sep 2015 15:56:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Carlos Hernandez <ceh@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
index 3e9a30e..13bf875 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
@@ -1,14 +1,11 @@
 # Arago TI SDK filesystem image
-COMPATIBLE_MACHINE = "omap3|omapl138|ti33x|keystone"
 
-require arago-image.inc
+require arago-base-tisdk-image.inc
 
 SPLASH = ""
 
 IMAGE_INSTALL += "\
-    packagegroup-arago-base \
-    packagegroup-arago-console \
-    packagegroup-arago-base-tisdk \
+    packagegroup-arago-test \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-crypto \
     packagegroup-arago-tisdk-matrix \
-- 
2.2.0


