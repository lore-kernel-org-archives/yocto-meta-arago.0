Return-Path: <yanivma@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E9DA052A7A
	for <meta-arago@arago-project.org>;
	Mon, 14 Jul 2014 15:09:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6EF9IAD009399
	for <meta-arago@arago-project.org>; Mon, 14 Jul 2014 10:09:18 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6EF9ItB013648
	for <meta-arago@arago-project.org>; Mon, 14 Jul 2014 10:09:18 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 14 Jul 2014 10:09:17 -0500
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s6EF8uSu023580;	Mon, 14 Jul 2014 10:09:17 -0500
From: Yaniv Machani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 14 Jul 2014 18:04:09 +0300
Message-ID: <1405350249-15037-6-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1405350249-15037-1-git-send-email-yanivma@ti.com>
References: <1405350249-15037-1-git-send-email-yanivma@ti.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] wl18xx-target-scripts : Add new WiFi related scripts
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
X-List-Received-Date: Mon, 14 Jul 2014 15:09:19 -0000
Content-Type: text/plain

New scripts to ease the use of wifi modes-
 Start/Stop - Station, AP, P2P and Multi Role.
 Station connection scripts.
 Driver load/unload.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../packagegroup-arago-tisdk-connectivity.bb       |    1 +
 .../wl18xx-target-scripts_r8.a9.14.bb              |   24 ++++++++++++++++++++
 2 files changed, 25 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
 create mode 100755 meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
old mode 100644
new mode 100755
index 7b3480c..4b8fb00
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -24,6 +24,7 @@ WLAN_COMMON = "\
     crda \
     hostap-daemon-wl18xx \
     ti-wifi-utils-wl18xx \
+    wl18xx-target-scripts \
 "
 
 # netperf has non-standard license, needs verifying
diff --git a/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb b/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
new file mode 100755
index 0000000..404b7f6
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Scripts and configuration files for TI wireless drivers"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=b8d6a0865f50159bf5c0d175d1f4a705"
+
+PR ="r1"
+PR_append = "+gitr${SRCPV}"
+
+# Tag: ol_r8.a9.14
+SRCREV = "4d9f47235501fb2c665b6336a54e0ba152e8e941"
+BRANCH = "sitara-mbss"
+SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx-target-scripts.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+
+do_install() {
+	install -d ${D}/usr/share/wl18xx/
+
+    scripts=`find ./ -type f -name "*\.sh"`
+    for s in $scripts
+    do
+        install -m 0755 $s ${D}/usr/share/wl18xx/
+    done
+}
-- 
1.7.9


