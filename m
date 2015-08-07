Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id E3D1652AB5
	for <meta-arago@arago-project.org>;
	Fri,  7 Aug 2015 21:20:39 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSQ00AD1DXU7HO0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 07 Aug 2015 16:20:19 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=-fcZcDzWTgiWMpGjppoA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 44F2F161B4C;	Fri,
	7 Aug 2015 17:20:18 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 07 Aug 2015 17:20:12 -0400
Message-id: <1438982412-15565-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1438982412-15565-1-git-send-email-denis@denix.org>
References: <1438982412-15565-1-git-send-email-denis@denix.org>
Subject: [fido/master][PATCH 5/5] HACK: packagegroup-*: disable Keystone specific LLDs and deps for IPC
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
X-List-Received-Date: Fri, 07 Aug 2015 21:20:40 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-base-tisdk-server-extra.bb  | 53 ++++++++--------
 .../packagegroup-arago-test-addons.bb              | 71 +++++++++++-----------
 2 files changed, 63 insertions(+), 61 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 73e0928..6040879 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r2"
+PR = "r3"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -81,51 +81,52 @@ ARAGO_SECURE_STORAGE = "\
     engine-pkcs11 \
     "
 
+# Disable due to IPC for now
+#    ti-ipc
+#    demo-image-proc
+#    rm-lld
+#    cmem
+#    cmem-mod
+#    pa-lld
+#    qmss-lld
+#    hplib
+#    hplib-mod
+#    multiprocmgr
+#    nwal-lld
+#    netapi
+#    netapi-test
+#    mpm-transport
+#    pktlib
+#    cppi-lld
+#    ipsecmgr-mod
 ARAGO_TI_KEYSTONE_PKGS = "\
     ${ARAGO_SECURE_STORAGE} \
     uio-module-drv \
-    multiprocmgr \
-    mpm-transport \
     traceframework \
     cuia \
-    hplib \
-    hplib-mod \
-    netapi \
-    netapi-test \
-    ipsecmgr-mod \
     libnl-xfrm \
-    demo-image-proc \
-    ti-ipc \
-    rm-lld \
-    cmem \
-    cmem-mod \
     mmap-lld \
     udma \
     cuia \
-    qmss-lld \
-    pa-lld \
-    cppi-lld \
     edma3-lld \
     hyplnk-lld \
-    pktlib \
-    nwal-lld \
     srss-tc \
     "
 
-ARAGO_TI_PKGS = "\
-    uio-module-drv \
-    cmem \
-    cmem-mod \
-    "
+ARAGO_TI_PKGS = ""
+#    uio-module-drv \
+#    cmem \
+#    cmem-mod \
+#    "
 ARAGO_TI_PKGS_append_keystone = "${ARAGO_TI_KEYSTONE_PKGS}"
 ARAGO_TI_PKGS_append_k2l-evm = "\
     dfe-lld \
     iqn2-lld \
     "
 
-ARAGO_TI_PKGS_append_k2hk-evm = "\
-    srio-lld \
-    "
+#ARAGO_TI_PKGS_append_k2hk-evm = "\
+#    srio-lld \
+#    "
 
 RDEPENDS_${PN} = "\
     ${ARAGO_LIBNL} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
index 3e1fa8f..9affd75 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to install additional utilities/demos for test image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r2"
+PR = "r3"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -15,42 +15,43 @@ TEST_ADDONS = " \
     gdb \
     "
 
-TEST_ADDONS_TI = " \
-    cmem-test \
-    "
-TEST_ADDONS_TI_append_keystone = " \
-    qmss-lld-test \
-    pa-lld-test \
-    cppi-lld-test \
-    hyplnk-lld-test \
-    edma3-lld-test \
-    mmap-lld-test \
-    rm-lld \
-    rm-lld-test \
-    sa-lld \
-    sa-lld-test \
-    traceframework-test \
-    multiprocmgr-test \
-    hplib-test \
-    hyplnk-lld-test \
-    nwal-lld \
-    nwal-lld-test \
-    udma-test \
-    mpm-transport-test \
-    ipc-transport-qmss-test \
-    ipsecmgr \
-    netapi-test \
-    "
+TEST_ADDONS_TI = ""
 
-TEST_ADDONS_TI_append_k2hk-evm = " \
-    srio-lld-test \
-    ipc-transport-srio-test \
-    "
+#    cmem-test \
+#    "
+#TEST_ADDONS_TI_append_keystone = " \
+#    qmss-lld-test \
+#    pa-lld-test \
+#    cppi-lld-test \
+#    hyplnk-lld-test \
+#    edma3-lld-test \
+#    mmap-lld-test \
+#    rm-lld \
+#    rm-lld-test \
+#    sa-lld \
+#    sa-lld-test \
+#    traceframework-test \
+#    multiprocmgr-test \
+#    hplib-test \
+#    hyplnk-lld-test \
+#    nwal-lld \
+#    nwal-lld-test \
+#    udma-test \
+#    mpm-transport-test \
+#    ipc-transport-qmss-test \
+#    ipsecmgr \
+#    netapi-test \
+#    "
 
-TEST_ADDONS_TI_append_k2l-evm = " \
-    dfe-lld-test \
-    iqn2-lld-test \
-    "
+#TEST_ADDONS_TI_append_k2hk-evm = " \
+#    srio-lld-test \
+#    ipc-transport-srio-test \
+#    "
+
+#TEST_ADDONS_TI_append_k2l-evm = " \
+#    dfe-lld-test \
+#    iqn2-lld-test \
+#    "
 
 RDEPENDS_${PN} = "\
     ${TEST_ADDONS} \
-- 
2.2.0


