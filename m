Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id CC3DC52A51
	for <meta-arago@arago-project.org>;
	Thu, 14 Aug 2014 22:51:53 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NAB00EF9JI4G930@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 14 Aug 2014 17:51:40 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1BFE32008C; Thu,
	14 Aug 2014 18:51:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 14 Aug 2014 18:51:38 -0400
Message-id: <1408056698-4904-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] packagegroup-*-matrix-sdk-host: skip matrix-browser and refresh-screen for keystone
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
X-List-Received-Date: Thu, 14 Aug 2014 22:51:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Keystone doesn't use GUI pieces of the Matrix component, so don't pull
sources in to the devkit.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-matrix-sdk-host.bb              | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
index fa1036b..67f9eff 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
@@ -1,11 +1,17 @@
 DESCRIPTION = "Task to install Matrix v2 and associated applications sources in the SDK"
 LICENSE = "MIT"
-PR = "r2"
+PR = "r3"
 
 inherit packagegroup
 
-RDEPENDS_${PN} = "\
-    matrix-gui-src \
+MATRIX_GUI = " \
     matrix-gui-browser-src \
     refresh-screen-src \
 "
+
+MATRIX_GUI_keystone = ""
+
+RDEPENDS_${PN} = "\
+    matrix-gui-src \
+    ${MATRIX_GUI} \
+"
-- 
2.0.4


