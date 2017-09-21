Return-Path: <d-senicic1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 6719A529CC
	for <meta-arago@arago-project.org>;
	Thu, 21 Sep 2017 22:34:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8LMYDJ9025479
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 17:34:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506033253;
	bh=owlTQDuxG/2pyfMHXRxRsBU7euMEZgTeSwBZliucu+Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fEPMzDViVnVKEQGGQTAdIq7gX3D2PHvQVD3PhYznYYWLVrBvL7ox/6MSJjDMw2Oxa
	b9f2rFsWiFXtA6XtFDQ6+qXW8Wajg+sQg4YSRAazjMPo4/wpQTEkfJOdaWN6otrGC5
	gv3BCp8jE4w2A4+5jIjP/G0RM0uDYgrQbmwXJwgA=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LMYDpC001151
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 17:34:13 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 21 Sep 2017 17:34:13 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 21 Sep 2017 17:34:12 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LMYBon020956;
	Thu, 21 Sep 2017 17:34:12 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Sep 2017 18:34:02 -0400
Message-ID: <1506033246-18916-2-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506033246-18916-1-git-send-email-x0157990@ti.com>
References: <1506033246-18916-1-git-send-email-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCH v2 1/5] tiovx-sys-iface: Add interface header files between TIOVX library and IPC implementation
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
X-List-Received-Date: Thu, 21 Sep 2017 22:34:13 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-ti/includes/tisdk-paths.inc |  3 +++
 recipes-ti/tiovx/tiovx-sys-iface.bb | 32 ++++++++++++++++++++++++++++++++
 recipes-ti/tiovx/tiovx-sys.inc      |  5 +++++
 3 files changed, 40 insertions(+)
 create mode 100644 recipes-ti/tiovx/tiovx-sys-iface.bb
 create mode 100644 recipes-ti/tiovx/tiovx-sys.inc

diff --git a/recipes-ti/includes/tisdk-paths.inc b/recipes-ti/includes/tisdk-paths.inc
index e6c0e94..300f352 100644
--- a/recipes-ti/includes/tisdk-paths.inc
+++ b/recipes-ti/includes/tisdk-paths.inc
@@ -1 +1,4 @@
 require recipes-ti/includes/arago-paths.inc
+
+export TIOVX_INSTALL_DIR_RECIPE      = "${installdir}/ti-tiovx-lib-tree"
+export TIOVX_INSTALL_DIR      = "${STAGING_DIR_TARGET}${TIOVX_INSTALL_DIR_RECIPE}"
diff --git a/recipes-ti/tiovx/tiovx-sys-iface.bb b/recipes-ti/tiovx/tiovx-sys-iface.bb
new file mode 100644
index 0000000..f4728d9
--- /dev/null
+++ b/recipes-ti/tiovx/tiovx-sys-iface.bb
@@ -0,0 +1,32 @@
+SUMMARY = "TI OpenVX interface header files between TIOVX library and HOST, DSP IPC side implementation "
+DESCRIPTION = "Collection of header files needed to defined interface between TIOVX library and HOST and DSP IPC side implementation. In order to maintain source compatibility, directory structure follows VSDK source tree layout."
+
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://iface/VSDK/docs/TIOVX-SYS-IFACE_1.0.0.0_manifest.html;md5=10904cbdb4f065c025a63ca71ae7de2d"
+
+require recipes-ti/includes/ti-paths-append.inc
+require tiovx-sys.inc
+
+PR = "r1"
+
+COMPATIBLE_MACHINE = "dra7xx"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+S = "${WORKDIR}/git"
+
+do_install () {
+#   Install the header files
+    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+    install -d ${D}${TIOVX_INSTALL_DIR_RECIPE}/sys-iface
+    cp ${CP_ARGS} ${S}/iface/VSDK/* ${D}${TIOVX_INSTALL_DIR_RECIPE}/sys-iface
+    install -d ${D}/${base_libdir}/firmware
+    install -m 0644 ${S}/firmware/tiovx_dsp1.xe66 ${D}/${base_libdir}/firmware/dra7-dsp1-fw.xe66.openvx
+    install -m 0644 ${S}/firmware/tiovx_dsp2.xe66 ${D}/${base_libdir}/firmware/dra7-dsp2-fw.xe66.openvx
+}
+
+FILES_${PN} += "${TIOVX_INSTALL_DIR_RECIPE}/sys-iface/* "
+PACKAGES =+ "${PN}-firmware"
+FILES_${PN}-firmware = "${base_libdir}/firmware/*"
+
+INSANE_SKIP_${PN}-firmware = "arch"
+
diff --git a/recipes-ti/tiovx/tiovx-sys.inc b/recipes-ti/tiovx/tiovx-sys.inc
new file mode 100644
index 0000000..fc24947
--- /dev/null
+++ b/recipes-ti/tiovx/tiovx-sys.inc
@@ -0,0 +1,5 @@
+PV = "01.00.00.00"
+
+BRANCH="master"
+SRCREV = "c208217c5c3788c78d10ff0d25e5db9782e00be9"
+SRC_URI = "git://git.ti.com/processor-sdk/tiovx-app.git;protocol=git;branch=${BRANCH}"
-- 
1.9.1


