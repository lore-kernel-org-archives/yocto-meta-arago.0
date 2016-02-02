Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 367B952A97
	for <meta-arago@arago-project.org>;
	Tue,  2 Feb 2016 13:42:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u12Dg8ZW002019
	for <meta-arago@arago-project.org>; Tue, 2 Feb 2016 07:42:08 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u12Dg8RB006464
	for <meta-arago@arago-project.org>; Tue, 2 Feb 2016 07:42:08 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Feb 2016 07:42:08 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u12Dg8pX018043;
	Tue, 2 Feb 2016 07:42:08 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aQbDc-0005GA-1v; Tue, 02 Feb 2016 08:42:08 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Feb 2016 08:42:00 -0500
Message-ID: <1454420524-20173-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454420524-20173-1-git-send-email-j-stiffler@ti.com>
References: <1454420524-20173-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] packagegroup-arago-test-addons: Re-enable keystone LLDs and tests
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
X-List-Received-Date: Tue, 02 Feb 2016 13:42:10 -0000
Content-Type: text/plain

* These had been broken by the kernel upgrade to 4.1 and have since
  been fixed

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroup-arago-test-addons.bb              | 84 ++++++++++++++--------
 1 file changed, 53 insertions(+), 31 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
index a437c45..9131a37 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to install additional utilities/demos for test image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r4"
+PR = "r5"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -22,38 +22,60 @@ TEST_ADDONS_TI = " \
 TEST_ADDONS_TI_append_keystone = " \
     mpm-transport-test \
     multiprocmgr-test \
+    qmss-lld-test \
+    pa-lld-test \
+    cppi-lld-test \
+    edma3-lld-test \
+    rm-lld \
+    rm-lld-test \
+    sa-lld \
+    sa-lld-test \
+    traceframework-test \
+    multiprocmgr-test \
+    udma-test \
+    mpm-transport-test \
+    ipsecmgr \
+    "
+
+# The following are not yet ready for k2g-evm
+#    nwal-lld-test
+#    hplib-test
+#    nwal-lld
+#    ipc-transport-qmss-test
+#    netapi-test
+
+TEST_ADDONS_TI_append_k2hk-evm = " \
+    srio-lld-test \
+    ipc-transport-srio-test \
+    hyplnk-lld-test \
+    mmap-lld-test \
+    aif2-lld-test \
+    nwal-lld-test \
+    hplib-test \
+    nwal-lld \
+    ipc-transport-qmss-test \
+    netapi-test \
+    "
+
+TEST_ADDONS_TI_append_k2l-evm = " \
+    dfe-lld-test \
+    iqn2-lld-test \
+    nwal-lld-test \
+    hplib-test \
+    nwal-lld \
+    ipc-transport-qmss-test \
+    netapi-test \
     "
 
-#    qmss-lld-test \
-#    pa-lld-test \
-#    cppi-lld-test \
-#    hyplnk-lld-test \
-#    edma3-lld-test \
-#    mmap-lld-test \
-#    rm-lld \
-#    rm-lld-test \
-#    sa-lld \
-#    sa-lld-test \
-#    traceframework-test \
-#    hplib-test \
-#    hyplnk-lld-test \
-#    nwal-lld \
-#    nwal-lld-test \
-#    udma-test \
-#    ipc-transport-qmss-test \
-#    ipsecmgr \
-#    netapi-test \
-#    "
-
-#TEST_ADDONS_TI_append_k2hk-evm = " \
-#    srio-lld-test \
-#    ipc-transport-srio-test \
-#    "
-
-#TEST_ADDONS_TI_append_k2l-evm = " \
-#    dfe-lld-test \
-#    iqn2-lld-test \
-#    "
+TEST_ADDONS_TI_append_k2e-evm = " \
+    mmap-lld-test \
+    hyplnk-lld-test \
+    nwal-lld-test \
+    hplib-test \
+    nwal-lld \
+    ipc-transport-qmss-test \
+    netapi-test \
+    "
 
 RDEPENDS_${PN} = "\
     ${TEST_ADDONS} \
-- 
1.9.1


