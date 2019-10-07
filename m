Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 6ADDB529F3
	for <meta-arago@arago-project.org>;
	Mon,  7 Oct 2019 22:32:47 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97MVY1j044186
	for <meta-arago@arago-project.org>; Mon, 7 Oct 2019 17:31:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570487494;
	bh=HWB0T6qZ7ovMlMQ5FCu2k+H1NBZB4yGSrt8r+e6kB2A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UrPJndfbk0t5frGASNYfXVal0JK25pohYITLOeRWm8/eA8KrtBtXEvOw/h6B6lWBn
	wjfWWEX5Qb4nNZn6hi0Rld3L8dynG1aE4s1i0GENH+SbNrA+0UvPrIW0qwzzO+mh2+
	vfI8FIng4MMaRD72O0sYukXoZnGffhFvHxdnYH/4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97MVY5O079434
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 7 Oct 2019 17:31:34 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 7 Oct 2019 17:31:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 7 Oct 2019 17:31:31 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97MVJNw090165;
	Mon, 7 Oct 2019 17:31:33 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 7 Oct 2019 18:29:20 -0400
Message-ID: <20191007222920.28206-3-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007222920.28206-1-a0271529@ti.com>
References: <20191007222920.28206-1-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>, Djordje Senicic <x0157990@ti.com>
Subject: [master/thud] [PATCH v2 3/4] tiovx-app-host: TI OpenVX IPC HOST implementation and sample applications
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
X-List-Received-Date: Mon, 07 Oct 2019 22:32:47 -0000
Content-Type: text/plain

* The sample applications include running OpenVX conformance tests
  as well as a Khronos tutorial example

Signed-off-by: Djordje Senicic <x0157990@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
v2 changes:
Update the recipe to use arago-paths.inc

 .../recipes-ti/tiovx/files/setenv.sh          |  8 +++
 .../recipes-ti/tiovx/tiovx-app-host.bb        | 56 +++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta-arago-extras/recipes-ti/tiovx/files/setenv.sh
 create mode 100644 meta-arago-extras/recipes-ti/tiovx/tiovx-app-host.bb

diff --git a/meta-arago-extras/recipes-ti/tiovx/files/setenv.sh b/meta-arago-extras/recipes-ti/tiovx/files/setenv.sh
new file mode 100644
index 00000000..dc7bcea3
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/tiovx/files/setenv.sh
@@ -0,0 +1,8 @@
+#!/bin/bash
+
+export PROC_LIST='host khronos_example'
+
+export LINUX_SYSROOT_DIR=/
+export TIOVXPATH=/usr/include/VX
+export IPCPATH=/usr/share/ti/ti-ipc-tree
+export SDKPLATFORMIFPATH=/usr/share/ti/ti-tiovx-lib-tree/sys-iface
diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-app-host.bb b/meta-arago-extras/recipes-ti/tiovx/tiovx-app-host.bb
new file mode 100644
index 00000000..1480d5cb
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/tiovx/tiovx-app-host.bb
@@ -0,0 +1,56 @@
+SUMMARY = "TI OpenVX HOST (Linux A15) conformance verification application, Khronos tutorial example, and Host side IPC implementation "
+DESCRIPTION = "TI OpenVX implementation, TIOVX, includes Khronos defined conformance test and tutorial example, as well as additional TI specific tests. This package creates application which runs all the conformance tests (7K-8K) and Khronos tutorial exercise1. Same package includes IPC implementation (MessageQ based) needed for communication with DSP firmware (loaded at boot time) "
+
+LICENSE = "BSD-3-Clause & MIT"
+LIC_FILES_CHKSUM = "file://docs/manifest/TIOVX-APP-HOST_01.00.01.00_manifest.html;md5=247d7c56d783f583bf802490d5c93db3"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI_append += "\
+     file://setenv.sh \
+"
+
+inherit pkgconfig
+
+require recipes-ti/includes/arago-paths.inc
+require tiovx-sys.inc
+
+DEPENDS = " tiovx-sys-iface tiovx-lib-host ti-ipc cmem opencv udev"
+RDEPENDS_${PN} = " tiovx-sys-iface tiovx-sys-iface-firmware tiovx-lib-host ti-ipc cmem"
+
+PR = "r3"
+
+COMPATIBLE_MACHINE = "dra7xx"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PROCLIST = "host khronos_example"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE += " TARGET_ROOTDIR=${STAGING_DIR_HOST} "
+EXTRA_OEMAKE += " GCCLINARO=${TOOLCHAIN_PATH} TIOVXPATH=${TIOVX_INSTALL_DIR} IPCPATH=${IPC_INSTALL_DIR} "
+EXTRA_OEMAKE += " SDKPLATFORMIFPATH=${TIOVX_INSTALL_DIR}/sys-iface "
+EXTRA_OEMAKE += " PROC_LIST='${PROCLIST}' "
+
+do_install () {
+    install -d ${D}${bindir}/
+    install -m 0755 ${S}/host/bin/debug/app_host ${D}${bindir}/tiovx-app_host
+    install -m 0755 ${S}/khronos_example/bin/debug/opticalflow ${D}${bindir}/tiovx-opticalflow
+
+    oe_runmake clean
+    install -d ${D}${datadir}/ti/examples/openvx
+    install -m 644 ${S}/products.mak ${D}${datadir}/ti/examples/openvx
+    install -m 644 ${S}/makefile ${D}${datadir}/ti/examples/openvx
+    install -m 644 ${WORKDIR}/setenv.sh ${D}${datadir}/ti/examples/openvx
+    cp -r ${S}/host ${D}${datadir}/ti/examples/openvx
+    cp -r ${S}/khronos_example  ${D}${datadir}/ti/examples/openvx
+    cp -r ${S}/shared ${D}${datadir}/ti/examples/openvx
+}
+
+PACKAGES += "${PN}-examples"
+FILES_${PN}-examples = "${datadir}/ti/examples/openvx"
+RDEPENDS_${PN}-examples = "tiovx-lib-host-staticdev tiovx-lib-host-dev"
+
+FILES_${PN} += "${bindir}/*"
+INSANE_SKIP_${PN} = "ldflags"
+INSANE_SKIP_${PN}-examples = "dev-deps"
-- 
2.17.1


