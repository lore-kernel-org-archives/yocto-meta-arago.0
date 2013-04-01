Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7636252AB3
	for <meta-arago@arago-project.org>;
	Mon,  1 Apr 2013 14:55:17 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31EtFsi015283
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 09:55:16 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31EtEfX011745
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 20:25:14 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 1 Apr 2013 20:25:14 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31EsxCi020052;
	Mon, 1 Apr 2013 20:25:13 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 1 Apr 2013 09:54:47 -0500
Message-ID: <1364828095-28755-9-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1364828095-28755-1-git-send-email-fcooper@ti.com>
References: <1364828095-28755-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 09/17 v2] wifi-direct-launcher: Add script used to launch wifi-direct demos
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
X-List-Received-Date: Mon, 01 Apr 2013 14:55:17 -0000
Content-Type: text/plain

* Placing the kill_wpa_supplicant.sh script in its own recipe.
* Future commit will delete this script from wpa-supplicant to avoid
  duplication.
* Other than a new name the only other difference between this script and
  kill_wpa_supplicant.sh is that this script now also makes sure the dbus
  executable has the correct permission.
* Incorrect permission caused the demos to fail with a "There is no wpa
  supplicant interface"

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Brand new patch. Apart of new patchset.


 .../wifi-direct-launcher/wifi-direct-launcher.sh   |   13 +++++++++++++
 .../wifi-direct-launcher_1.0.bb                    |   17 +++++++++++++++++
 2 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/wifi-direct-launcher/wifi-direct-launcher/wifi-direct-launcher.sh
 create mode 100644 meta-arago-extras/recipes-connectivity/wifi-direct-launcher/wifi-direct-launcher_1.0.bb

diff --git a/meta-arago-extras/recipes-connectivity/wifi-direct-launcher/wifi-direct-launcher/wifi-direct-launcher.sh b/meta-arago-extras/recipes-connectivity/wifi-direct-launcher/wifi-direct-launcher/wifi-direct-launcher.sh
new file mode 100644
index 0000000..5a94d22
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wifi-direct-launcher/wifi-direct-launcher/wifi-direct-launcher.sh
@@ -0,0 +1,13 @@
+#check if the wpa_suppicant is already running
+#if it does, stop it.
+StationRunning=`ps | grep -c wpa_supplicant`
+if [ $StationRunning -eq 2 ]; then
+        killall wpa_supplicant
+fi
+
+# Correct dbus permission. Incorrect permission causes dbus (wifi direct demos)
+# dependent demos to fail. 
+chmod u+s /usr/libexec/dbus-daemon-launch-helper
+
+# start the application
+$*
diff --git a/meta-arago-extras/recipes-connectivity/wifi-direct-launcher/wifi-direct-launcher_1.0.bb b/meta-arago-extras/recipes-connectivity/wifi-direct-launcher/wifi-direct-launcher_1.0.bb
new file mode 100644
index 0000000..28f5590
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wifi-direct-launcher/wifi-direct-launcher_1.0.bb
@@ -0,0 +1,17 @@
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+inherit allarch
+
+PR ="r0"
+
+SRC_URI = "file://wifi-direct-launcher.sh"
+
+S = "${WORKDIR}"
+
+do_install() {
+    install -d ${D}${sbindir}
+    install -m 755 ${WORKDIR}/wifi-direct-launcher.sh ${D}${sbindir}
+}
+
+FILES_${PN} = "/usr/sbin/wifi-direct-launcher.sh"
-- 
1.7.0.4


