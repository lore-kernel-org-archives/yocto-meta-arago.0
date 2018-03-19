Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 7EDA7529A2
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 18:37:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JIa5pG007746
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 13:36:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521484565;
	bh=Xa00ueJIkDjJpHcOizXxOsuAzf9G7HsY2jFpTg6xjCE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EIJNw1anwW42ASx6GK5eQSlKQbANPwslboKzsv5z/MByxodR0JtInfsD9dOMZlqfD
	XkcizmoKv4GD8FQAW0/4t0sTF/s5sSAmx+KjMpx48Pgt5KBT/A/odkFwBUz3x3j/Hy
	Hu53F6gte62Ixo3sUhHqp8jsot/oMx12nR4lcKgM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JIa5qr014729
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 13:36:05 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 13:36:05 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 13:36:05 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JIa4S8009580;
	Mon, 19 Mar 2018 13:36:05 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Mar 2018 14:35:36 -0400
Message-ID: <1521484541-8104-2-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521484541-8104-1-git-send-email-a0271529@ti.com>
References: <1521484541-8104-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 1/6] [PATCH] tiovx-app-host: add Khronos tutorial example
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

* bump SRCREV and version
* update SUMMARY, DESCRIPTION, LICENSE, and software manifest
* add DEPENDs on opencv
* build and install the example binary

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-ti/tiovx/tiovx-app-host.bb | 17 +++++++++--------
 recipes-ti/tiovx/tiovx-sys.inc     |  4 ++--
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/recipes-ti/tiovx/tiovx-app-host.bb b/recipes-ti/tiovx/tiovx-app-host.bb
index 097fede..c45c4b8 100644
--- a/recipes-ti/tiovx/tiovx-app-host.bb
+++ b/recipes-ti/tiovx/tiovx-app-host.bb
@@ -1,32 +1,33 @@
-SUMMARY = "TI OpenVX HOST (Linux A15) conformance verification application, and Host side IPC implementation "
-DESCRIPTION = "TI OpenVX implementation, TIOVX, includes Khronos defined conformance test as well as additional TI specific tests. This package creates application which runs all the tests (7K-8K). Same package includes IPC implementation (MessageQ based) needed for communication with DSP firmware (loaded at boot time) "
+SUMMARY = "TI OpenVX HOST (Linux A15) conformance verification application, Khronos tutorial example, and Host side IPC implementation "
+DESCRIPTION = "TI OpenVX implementation, TIOVX, includes Khronos defined conformance test and tutorial example, as well as additional TI specific tests. This package creates application which runs all the conformance tests (7K-8K) and Khronos tutorial exercise1. Same package includes IPC implementation (MessageQ based) needed for communication with DSP firmware (loaded at boot time) "
 
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://docs/manifest/TIOVX-APP-HOST_1.0.0.0_manifest.html;md5=de53bc8bf67ffa9a316fe48e3bacbf6d"
+LICENSE = "BSD-3-Clause & MIT"
+LIC_FILES_CHKSUM = "file://docs/manifest/TIOVX-APP-HOST_01.00.01.00_manifest.html;md5=247d7c56d783f583bf802490d5c93db3"
 
 require recipes-ti/includes/tisdk-paths.inc
 require tiovx-sys.inc
 
-DEPENDS = " tiovx-sys-iface tiovx-lib-host ti-ipc cmem "
+DEPENDS = " tiovx-sys-iface tiovx-lib-host ti-ipc cmem opencv"
 RDEPENDS_${PN} = " tiovx-sys-iface tiovx-sys-iface-firmware tiovx-lib-host ti-ipc cmem "
 
-PR = "r2"
+PR = "r0"
 
 COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PROCLIST = "host"
+PROCLIST = "host khronos_example"
 
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE += " TARGET_ROOTDIR=${STAGING_DIR_HOST} "
 EXTRA_OEMAKE += " GCCLINARO=${TOOLCHAIN_PATH} TIOVXPATH=${TIOVX_INSTALL_DIR} IPCPATH=${IPC_INSTALL_DIR} "
 EXTRA_OEMAKE += " SDKPLATFORMIFPATH=${TIOVX_INSTALL_DIR}/sys-iface "
-EXTRA_OEMAKE += " PROC_LIST=${PROCLIST} "
+EXTRA_OEMAKE += " PROC_LIST='${PROCLIST}' "
 
 do_install () {
     install -d ${D}${bindir}/
     install -m 0755 ${S}/host/bin/debug/app_host ${D}${bindir}/tiovx-app_host
+    install -m 0755 ${S}/khronos_example/bin/debug/opticalflow ${D}${bindir}/tiovx-opticalflow
 }
 
 FILES_${PN} += "${bindir}/*"
diff --git a/recipes-ti/tiovx/tiovx-sys.inc b/recipes-ti/tiovx/tiovx-sys.inc
index 43c4e1d..e45f130 100644
--- a/recipes-ti/tiovx/tiovx-sys.inc
+++ b/recipes-ti/tiovx/tiovx-sys.inc
@@ -1,5 +1,5 @@
-PV = "01.00.00.00"
+PV = "01.00.01.00"
 
 BRANCH="master"
-SRCREV = "375fa639773970e433171686f01f360a9a5b2ad4"
+SRCREV = "dc60c253a218fb3ec92fdeeaa454fce047f8964a"
 SRC_URI = "git://git.ti.com/processor-sdk/tiovx-app.git;protocol=git;branch=${BRANCH}"
-- 
1.9.1


