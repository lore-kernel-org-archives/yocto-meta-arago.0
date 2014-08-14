Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id F266052A51
	for <meta-arago@arago-project.org>;
	Thu, 14 Aug 2014 23:07:02 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NAB000QRK7CQG00@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 14 Aug 2014 18:06:49 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7030920120; Thu,
	14 Aug 2014 19:06:48 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 14 Aug 2014 19:06:47 -0400
Message-id: <1408057607-15900-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
In-reply-to: <1408057607-15900-1-git-send-email-denis@denix.org>
References: <1408057607-15900-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] packagegroups*: install omapconf for ti33x platforms as well
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
X-List-Received-Date: Thu, 14 Aug 2014 23:07:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-test.bb           | 6 +++++-
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb       | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index fdca3fb..0f3d01e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Extended task to get System Test specific apps"
 LICENSE = "MIT"
-PR = "r19"
+PR = "r20"
 
 inherit packagegroup
 
@@ -31,6 +31,10 @@ ARAGO_TI_TEST = "\
     cpuloadgen \
     "
 
+ARAGO_TI_TEST_append_ti33x = " \
+    omapconf \
+    "
+
 ARAGO_TI_TEST_append_omap-a15 = " \
     omapconf \
     ipc-test-fw \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 1285d68..298ba57 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r6"
+PR = "r7"
 
 inherit packagegroup
 
@@ -21,6 +21,10 @@ UTILS_append_omap-a15 = " \
     omapconf-src \
 "
 
+UTILS_append_ti33x = " \
+    omapconf-src \
+"
+
 RDEPENDS_${PN} = "\
     ${UTILS} \
 "
-- 
2.0.4


