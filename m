Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id A625852998
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 20:15:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JKEIZl015299
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 15:14:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521490458;
	bh=6OB6dSEqY2MRfL0fy3xRwM5ehFDu7U/+083nQ3j3rGQ=;
	h=From:To:CC:Subject:Date;
	b=ice5KN8N3gHSS8iHjabUkPzyuzEtOqyNoGHVRmdU0R+0pq6ntLjVd1hEfTlD/IKf1
	JweYtcaBtn6Sfo9UkXZixjoNiXAsPNuNSh2jyPjYmQcN+/VOLWQvil/F6ohqN2KKV6
	5C6GKEPM54UCzs6S2xOdk5VylsT1aGNQ/tSXTI7I=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JKEI4O011139
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 15:14:18 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 15:14:17 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 15:14:17 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JKEHpj014855;
	Mon, 19 Mar 2018 15:14:17 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Mar 2018 16:14:14 -0400
Message-ID: <1521490454-30038-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 5/6] [PATCH v2] tiovx-app-host: enable compilation of app-host and tutorial example on target
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
X-List-Received-Date: Mon, 19 Mar 2018 20:15:16 -0000
Content-Type: text/plain

* Copy source files and makefiles to target
* Create setenv.sh and copy it to target
* Create examples package with tiovx-lib-host dependencies specified
* Build procedure on target: "source setenv.sh; make"

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
V2 changes:
 * add setenv.sh
 * skip dev-deps for the examples package instead of the main package

 recipes-ti/tiovx/files/setenv.sh   |  8 ++++++++
 recipes-ti/tiovx/tiovx-app-host.bb | 22 +++++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 recipes-ti/tiovx/files/setenv.sh

diff --git a/recipes-ti/tiovx/files/setenv.sh b/recipes-ti/tiovx/files/setenv.sh
new file mode 100644
index 0000000..dc7bcea
--- /dev/null
+++ b/recipes-ti/tiovx/files/setenv.sh
@@ -0,0 +1,8 @@
+#!/bin/bash
+
+export PROC_LIST='host khronos_example'
+
+export LINUX_SYSROOT_DIR=/
+export TIOVXPATH=/usr/include/VX
+export IPCPATH=/usr/share/ti/ti-ipc-tree
+export SDKPLATFORMIFPATH=/usr/share/ti/ti-tiovx-lib-tree/sys-iface
diff --git a/recipes-ti/tiovx/tiovx-app-host.bb b/recipes-ti/tiovx/tiovx-app-host.bb
index eb312b3..be865bc 100644
--- a/recipes-ti/tiovx/tiovx-app-host.bb
+++ b/recipes-ti/tiovx/tiovx-app-host.bb
@@ -4,13 +4,19 @@ DESCRIPTION = "TI OpenVX implementation, TIOVX, includes Khronos defined conform
 LICENSE = "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = "file://docs/manifest/TIOVX-APP-HOST_01.00.01.00_manifest.html;md5=247d7c56d783f583bf802490d5c93db3"
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI_append += "\
+     file://setenv.sh \
+"
+
 require recipes-ti/includes/tisdk-paths.inc
 require tiovx-sys.inc
 
 DEPENDS = " tiovx-sys-iface tiovx-lib-host ti-ipc cmem opencv"
 RDEPENDS_${PN} = " tiovx-sys-iface tiovx-sys-iface-firmware tiovx-lib-host ti-ipc cmem "
 
-PR = "r1"
+PR = "r2"
 
 COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -28,10 +34,24 @@ do_install () {
     install -d ${D}${bindir}/
     install -m 0755 ${S}/host/bin/debug/app_host ${D}${bindir}/tiovx-app_host
     install -m 0755 ${S}/khronos_example/bin/debug/opticalflow ${D}${bindir}/tiovx-opticalflow
+
+    oe_runmake clean
+    install -d ${D}${datadir}/ti/examples/openvx
+    install -m 644 ${S}/products.mak ${D}${datadir}/ti/examples/openvx
+    install -m 644 ${S}/makefile ${D}${datadir}/ti/examples/openvx
+    install -m 644 ${WORKDIR}/setenv.sh ${D}${datadir}/ti/examples/openvx
+    cp -r ${S}/host ${D}${datadir}/ti/examples/openvx
+    cp -r ${S}/khronos_example  ${D}${datadir}/ti/examples/openvx
+    cp -r ${S}/shared ${D}${datadir}/ti/examples/openvx
 }
 
+PACKAGES += "${PN}-examples"
+FILES_${PN}-examples = "${datadir}/ti/examples/openvx"
+RDEPENDS_${PN}-examples = "tiovx-lib-host-staticdev tiovx-lib-host-dev"
+
 CREATE_SRCIPK = "1"
 SRCIPK_INSTALL_DIR = "example-applications/${PN}-${PV}"
 
 FILES_${PN} += "${bindir}/*"
 INSANE_SKIP_${PN} = "ldflags"
+INSANE_SKIP_${PN}-examples = "dev-deps"
-- 
1.9.1


