Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6CC0852AB1
	for <meta-arago@arago-project.org>;
	Mon,  1 Apr 2013 14:55:23 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31EtLP2028650
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 09:55:22 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31EtKP5011795
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 20:25:20 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 1 Apr 2013 20:25:20 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31EsxCm020052;
	Mon, 1 Apr 2013 20:25:19 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 1 Apr 2013 09:54:51 -0500
Message-ID: <1364828095-28755-13-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1364828095-28755-1-git-send-email-fcooper@ti.com>
References: <1364828095-28755-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 13/17 v2] wilink-calibrate: Add Wilink calibration script
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
X-List-Received-Date: Mon, 01 Apr 2013 14:55:23 -0000
Content-Type: text/plain

* Add a script that runs at startup that insures that the wilink MAC address used
  is unique.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
No changes other than changing order within this patchset.

 .../calibrate.sh                                   |    0
 .../ti-wifi-utils/wilink-calibrate_1.0.bb          |   17 +++++++++++++++++
 2 files changed, 17 insertions(+), 0 deletions(-)
 copy meta-arago-extras/recipes-devtools/ti-wifi-utils/{ti-wifi-utils => wilink-calibrate}/calibrate.sh (100%)
 create mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/wilink-calibrate_1.0.bb

diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils/calibrate.sh b/meta-arago-extras/recipes-devtools/ti-wifi-utils/wilink-calibrate/calibrate.sh
similarity index 100%
copy from meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils/calibrate.sh
copy to meta-arago-extras/recipes-devtools/ti-wifi-utils/wilink-calibrate/calibrate.sh
diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/wilink-calibrate_1.0.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/wilink-calibrate_1.0.bb
new file mode 100644
index 0000000..d0aadfb
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/wilink-calibrate_1.0.bb
@@ -0,0 +1,17 @@
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+inherit update-rc.d
+INITSCRIPT_NAME="calibrate.sh"
+INITSCRIPT_PARAMS = "start 20 2 3 4 5 ."
+
+PR ="r0"
+
+SRC_URI = "file://calibrate.sh"
+
+S = "${WORKDIR}"
+
+do_install() {
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/calibrate.sh ${D}${sysconfdir}/init.d
+}
-- 
1.7.0.4


