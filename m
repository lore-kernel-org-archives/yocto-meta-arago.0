Return-Path: <eyalr@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9C9CE52A19
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 16:07:28 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2JG7QF0011964
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 11:07:27 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JG7QCS013439
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 21:37:26 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 19 Mar 2013 21:37:26 +0530
Received: from user-VirtualBox.emea.dhcp.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r2JG6tet026686;	Tue, 19 Mar 2013 21:37:25 +0530
From: Eyal Reizer <eyalr@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Mar 2013 18:06:36 +0200
Message-ID: <1363709200-2854-6-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1363709200-2854-2-git-send-email-eyalr@ti.com>
References: <1363709200-2854-2-git-send-email-eyalr@ti.com>
MIME-Version: 1.0
Subject: [PATCHv2 5/9] ti-wifi-utils-wl18xx: build the calibrator tool for wilin8
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
X-List-Received-Date: Tue, 19 Mar 2013 16:07:28 -0000
Content-Type: text/plain

Add a recipe for building and installing the calibrator tool
used with the wilink8 family of chips.

This package replace the wilink6 package which is provided by the
ti-wifi-utils recipe. Selection between the two is done using a
"WILINK_VERSION" switch added to arago.conf

Changes in v2:
* Use an actual release name in the recipe name instead of _git
* Add RPROVIDES, RREPLACES, RCONFLICTS as this recipe completely 
  replace the wilink6 one.

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a6.01.bb |   27 ++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a6.01.bb

diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a6.01.bb
new file mode 100644
index 0000000..1ea9990
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a6.01.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "The calibrator and other useful utilities for TI wireless solution based on wl12xx driver"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
+
+DEPENDS = "libnl"
+RDEPENDS = "ti-compat-wireless-wl12xx wl12xx-firmware"
+
+PR ="r1+gitr${SRCREV}"
+
+SRCREV = "ol_r8.a6.01"
+SRC_URI = "git://github.com/TI-OpenLink/18xx-ti-utils.git \
+"
+
+PROVIDES += "ti-wifi-utils"
+RPROVIDES += "ti-wifi-utils"
+RREPLACES +=  "ti-wifi-utils"
+RCONFLICTS +=  "ti-wifi-utils"
+
+S = "${WORKDIR}/git"
+
+export CROSS_COMPILE = "${TARGET_PREFIX}"
+CFLAGS += " -DCONFIG_LIBNL20"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 calibrator ${D}${bindir}/
+}
-- 
1.7.9.5


