Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 5024152007
	for <meta-arago@arago-project.org>;
	Mon, 22 Sep 2014 17:17:02 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCB002Y0BZWF5C0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 22 Sep 2014 12:16:44 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2B06620086; Mon,
	22 Sep 2014 13:16:44 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 22 Sep 2014 13:16:43 -0400
Message-id: <1411406203-8017-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] packagegroup-*-addons*: add canutils for dra7xx family
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
X-List-Received-Date: Mon, 22 Sep 2014 17:17:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb        | 3 ++-
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb      | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 19ecf06..fc0a226 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r4"
+PR = "r5"
 
 inherit packagegroup
 
@@ -11,6 +11,7 @@ UTILS = "libdrm-dev"
 UTILS_append_omap3 = " canutils-dev"
 UTILS_append_ti33x = " canutils-dev"
 UTILS_append_ti43x = " canutils-dev"
+UTILS_append_dra7xx = " canutils-dev"
 
 RDEPENDS_${PN} = "\
     ${UTILS} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 958db56..fe09f35 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r17"
+PR = "r18"
 
 inherit packagegroup
 
@@ -35,6 +35,7 @@ UTILS_append_am180x-evm = " ti-pru-sw-examples"
 UTILS_append_omap3 = " canutils"
 UTILS_append_ti33x = " canutils"
 UTILS_append_ti43x = " canutils"
+UTILS_append_dra7xx = " canutils"
 UTILS_append_omap-a15 = " parted"
 
 RDEPENDS_${PN} = "\
-- 
2.0.4


