Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTP id 5883552A19
	for <meta-arago@arago-project.org>;
	Wed, 11 Sep 2013 17:26:48 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MSZ00FPL1S8XNN1@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 11 Sep 2013 12:26:33 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 762DA2008D; Wed,
	11 Sep 2013 13:26:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 11 Sep 2013 13:26:31 -0400
Message-id: <1378920391-20044-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] packagegroup-*connectivity*: disable ti-compat-{wireless, bluetooth} for now due to breakage
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
X-List-Received-Date: Wed, 11 Sep 2013 17:26:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-connectivity-sdk-host.bb             | 8 +++++---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb        | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
index 398d6d6..8d4d081 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
@@ -1,14 +1,16 @@
 DESCRIPTION = "Task to install wlan and bluetooth sources into the SDK"
 LICENSE = "MIT"
-PR = "r5"
+PR = "r6"
 
 inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+# Further breaks to resolve
+#    ti-compat-wireless-wl12xx-src
+#    ti-compat-bluetooth-src
+
 FIRMWARE_AND_DRIVERS_SRC = "\
-    ti-compat-wireless-wl12xx-src \
-    ti-compat-bluetooth-src \
     bt-firmware-src \
     bt-enable-src \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 61fe6cf..0aa019d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wlan and bluetooth packages into the target FS"
 LICENSE = "MIT"
-PR = "r16"
+PR = "r17"
 
 inherit packagegroup
 
@@ -37,9 +37,11 @@ WLAN_COMMON = "\
 # netperf has non-standard license, needs verifying
 #    netperf
 
+# Further breaks to resolve
+#    ti-compat-wireless-wl12xx
+#    ti-compat-bluetooth
+
 FIRMWARE_AND_DRIVERS = "\
-    ti-compat-wireless-wl12xx \
-    ti-compat-bluetooth \
     bt-firmware \
     bt-enable \
     wl12xx-firmware \
-- 
1.8.3.2


