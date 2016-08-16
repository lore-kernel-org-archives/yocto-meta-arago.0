Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTPS id 3256052ACE
	for <meta-arago@arago-project.org>;
	Tue, 16 Aug 2016 02:02:56 +0000 (UTC)
Received: from vz-proxy-m005.mx.aol.com ([64.236.83.15])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OBZ00AVJCCGRZ40@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 15 Aug 2016 21:02:40 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=NimJJ1rWho3RDXpqkQh0Zg==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=MOPCfayYdtw0GiPTG5sA:9
Received: by 100.15.86.14 with SMTP id 65cf40de; Tue, 16 Aug 2016 02:02:40 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id E044B1620DB;	Mon, 15 Aug 2016 22:02:39 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 15 Aug 2016 22:02:39 -0400
Message-id: <1471312959-4360-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] packagegroup: move iproute2 packages from console to connectivity group
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
X-List-Received-Date: Tue, 16 Aug 2016 02:02:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-console.bb  |  4 +---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb    | 11 +++++++----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
index 304ad89..099ab88 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Extended task to get more basic and console apps"
 LICENSE = "MIT"
-PR = "r13"
+PR = "r14"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -51,8 +51,6 @@ ARAGO_UTILS = "\
     fbset \
     usbutils \
     i2c-tools \
-    iproute2 \
-    iproute2-tc \
     strace \
     ${@bb.utils.contains('MACHINE_FEATURES', 'pci', 'pciutils', '',d)} \
     "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 947ab34..047610b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wireless packages into the target FS"
 LICENSE = "MIT"
-PR = "r33"
+PR = "r34"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -10,7 +10,6 @@ inherit packagegroup
 # These are the packages that all platforms use for WLAN support
 WLAN_COMMON = "\
     wireless-tools \
-    htop \
     iw \
     softap-udhcpd-config \
     obexd \
@@ -25,7 +24,6 @@ WLAN_COMMON = "\
     hostap-daemon-wl18xx \
     ti-wifi-utils-wl18xx \
     wl18xx-target-scripts \
-    iptables \
 "
 
 # netperf has non-standard license, needs verifying
@@ -46,7 +44,12 @@ BLUETOOTH_STACK = "\
     uim \
 "
 
-CONNECTIVITY_RDEPENDS = ""
+CONNECTIVITY_RDEPENDS = " \
+    htop \
+    iptables \
+    iproute2 \
+    iproute2-tc \
+"
 
 CONNECTIVITY_RDEPENDS_ti33x = "\
     ${WLAN_COMMON} \
-- 
2.7.4


