Return-Path: <yanivma@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 3123552974
	for <meta-arago@arago-project.org>;
	Thu, 17 Jul 2014 11:28:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6HBSZIf000907
	for <meta-arago@arago-project.org>; Thu, 17 Jul 2014 06:28:35 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6HBSZgr023300
	for <meta-arago@arago-project.org>; Thu, 17 Jul 2014 06:28:35 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 17 Jul 2014 06:28:34 -0500
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s6HBSXLU015230;	Thu, 17 Jul 2014 06:28:34 -0500
From: Yaniv Machani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 17 Jul 2014 14:23:56 +0300
Message-ID: <1405596236-22128-2-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1405596236-22128-1-git-send-email-yanivma@ti.com>
References: <1405596236-22128-1-git-send-email-yanivma@ti.com>
MIME-Version: 1.0
Subject: [PATCH 5/5 v3] wl18xx-target-scripts : Add new WiFi related scripts
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
X-List-Received-Date: Thu, 17 Jul 2014 11:28:36 -0000
Content-Type: text/plain

New scripts to ease the use of wifi modes-
 Start/Stop - Station, AP, P2P and Multi Role.
 Station connection scripts.
 Driver load/unload.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
v3 - Bumped PR

 .../packagegroup-arago-tisdk-connectivity.bb       |    3 +-
 .../wl18xx-target-scripts_r8.a9.14.bb              |   25 ++++++++++++++++++++
 2 files changed, 27 insertions(+), 1 deletions(-)
 mode change 100644 => 100755 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
 create mode 100755 meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
old mode 100644
new mode 100755
index 7b3480c..fa82e7e
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wireless packages into the target FS"
 LICENSE = "MIT"
-PR = "r24"
+PR = "r25"
 
 inherit packagegroup
 
@@ -24,6 +24,7 @@ WLAN_COMMON = "\
     crda \
     hostap-daemon-wl18xx \
     ti-wifi-utils-wl18xx \
+    wl18xx-target-scripts \
 "
 
 # netperf has non-standard license, needs verifying
diff --git a/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb b/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
new file mode 100755
index 0000000..8ba0092
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Scripts and configuration files for TI wireless drivers"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=b8d6a0865f50159bf5c0d175d1f4a705"
+
+PR ="r1+gitr${SRCPV}"
+
+# Tag: ol_r8.a9.14
+SRCREV = "4d9f47235501fb2c665b6336a54e0ba152e8e941"
+BRANCH = "sitara-mbss"
+SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx-target-scripts.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+FILES_${PN} += "${datadir}/wl18xx/"
+
+do_install() {
+	install -d ${D}${datadir}/wl18xx/
+
+	scripts=`find ./ -type f -name "*\.sh"`
+	for s in $scripts
+	do
+		install -m 0755 $s ${D}${datadir}/wl18xx/
+	done
+}
+
-- 
1.7.9


