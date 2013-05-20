Return-Path: <hzhang@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6830B529D4
	for <meta-arago@arago-project.org>;
	Mon, 20 May 2013 22:38:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4KMchdm015239
	for <meta-arago@arago-project.org>; Mon, 20 May 2013 17:38:43 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4KMchZq016481
	for <meta-arago@arago-project.org>; Mon, 20 May 2013 17:38:43 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 20 May 2013 17:38:42 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r4KMcgQe006828;	Mon, 20 May 2013 17:38:43 -0500
Received: from a0868496 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <hzhang@ti.com>)	id 1UeYj4-0004ZO-Kv; Mon, 20 May 2013
	18:38:42 -0400
From: <hzhang@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 20 May 2013 18:38:41 -0400
Message-ID: <1369089521-17535-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ti-bmc: startup scirpt to send target IP addr to BMC
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
X-List-Received-Date: Mon, 20 May 2013 22:38:45 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

---
 .../packagegroup-arago-base-tisdk-server-extra.bb  |    3 ++-
 .../recipes-bsp/ti-bmc/ti-bmc_1.00.00.bb           |   28 ++++++++++++++++++++
 meta-arago-extras/recipes-bsp/ti-bmc/tibmc.sh      |    9 +++++++
 3 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-bmc/ti-bmc_1.00.00.bb
 create mode 100755 meta-arago-extras/recipes-bsp/ti-bmc/tibmc.sh

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 0b474fb..297b587 100755
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r7"
+PR = "r8"
 
 inherit packagegroup
 
@@ -95,6 +95,7 @@ RDEPENDS_${PN} = "\
     ti-netapi \
     ti-imageprocdemo \
     ti-ipc \
+    ti-bmc \
     ebtables \
     initscript-debugfs \
 	"
diff --git a/meta-arago-extras/recipes-bsp/ti-bmc/ti-bmc_1.00.00.bb b/meta-arago-extras/recipes-bsp/ti-bmc/ti-bmc_1.00.00.bb
new file mode 100644
index 0000000..6a408c1
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-bmc/ti-bmc_1.00.00.bb
@@ -0,0 +1,28 @@
+DESCRIPTION="Initial script at system boot up to send target IP address to \
+             Board Management Controller."
+
+HOMEPAGE="http://processors.wiki.ti.com/index.php/MCSDK_UG_Chapter_Getting_Started#Hardware_Setup_Guide"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://tibmc.sh;beginline=2;endline=30;md5=c2094cb728f3ab22043dac337202d0da"
+SECTION = "console"
+COMPATIBLE_MACHINE = "keystone"
+TARGET_PLATFORM = "tci6638"
+
+PR = "r0"
+
+
+SRC_URI = "file://tibmc.sh"
+
+S = "${WORKDIR}"
+
+
+INITSCRIPT_NAME = "tibmc.sh"
+INITSCRIPT_PARAMS = "defaults 10"
+
+inherit update-rc.d
+
+do_install_append() {
+	install -d ${D}${sysconfdir}/init.d/
+	install -c -m 755 ${WORKDIR}/tibmc.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+}
diff --git a/meta-arago-extras/recipes-bsp/ti-bmc/tibmc.sh b/meta-arago-extras/recipes-bsp/ti-bmc/tibmc.sh
new file mode 100755
index 0000000..cc28db6
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-bmc/tibmc.sh
@@ -0,0 +1,9 @@
+#! /bin/sh
+
+echo '#>>>>> LCD 12' > ipaddr
+echo 'IP Address:' >> ipaddr
+ifconfig eth0 | grep 'inet ' | awk '{print $2}' | sed 's/addr://' >> ipaddr
+
+
+cat ipaddr
+
-- 
1.7.9.5


