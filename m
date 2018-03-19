Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 98F95529F4
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 18:37:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JIa741000382
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 13:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521484567;
	bh=j8RDpCDVayvGiciC4H56GrQnucT1r3pNE6ZlLJOUIGs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Wmdy7K4F1vUFAO6ZDaEE75Ea+2LhKADIF7JYVi6VAr45ZwpYyC/vcdX0XDzIxYorV
	8wg155kG6qZhfEALycyl+TIEa/wj9nzDdoMqGn6fGUVqPkDI9NetVBEBelzGO9DFBr
	44nbhJKfDXkUbotSUgWXJZhtuCsbjDYW4vxwuNi0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JIa6s9014783
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 13:36:07 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 13:36:06 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 13:36:06 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JIa4SC009580;
	Mon, 19 Mar 2018 13:36:06 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Mar 2018 14:35:40 -0400
Message-ID: <1521484541-8104-6-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521484541-8104-1-git-send-email-a0271529@ti.com>
References: <1521484541-8104-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 5/6] [PATCH] tiovx-app-host: enable compilation of app-host and tutorial example on target
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
X-List-Received-Date: Mon, 19 Mar 2018 18:37:06 -0000
Content-Type: text/plain

* Copy source files and makefiles to target
* Create setenv.sh and copy it to target
* Create examples package with tiovx-lib-host dependencies specified
* Build procedure on target: "source setenv.sh; make"

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-ti/tiovx/tiovx-app-host.bb | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/tiovx/tiovx-app-host.bb b/recipes-ti/tiovx/tiovx-app-host.bb
index eb312b3..093025e 100644
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
@@ -28,10 +34,23 @@ do_install () {
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
-INSANE_SKIP_${PN} = "ldflags"
+INSANE_SKIP_${PN} = "ldflags dev-deps"
-- 
1.9.1


