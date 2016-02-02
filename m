Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 2BD1B52A95
	for <meta-arago@arago-project.org>;
	Tue,  2 Feb 2016 13:42:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u12Dg80f021869
	for <meta-arago@arago-project.org>; Tue, 2 Feb 2016 07:42:08 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u12Dg8cQ023731
	for <meta-arago@arago-project.org>; Tue, 2 Feb 2016 07:42:08 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Feb 2016 07:42:08 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u12Dg8Re001738;
	Tue, 2 Feb 2016 07:42:08 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aQbDb-0005G6-VH; Tue, 02 Feb 2016 08:42:07 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Feb 2016 08:41:59 -0500
Message-ID: <1454420524-20173-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454420524-20173-1-git-send-email-j-stiffler@ti.com>
References: <1454420524-20173-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] packagegroup-arago-base-tisdk-server-extra: Re-enable keystone LLDs
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
X-List-Received-Date: Tue, 02 Feb 2016 13:42:09 -0000
Content-Type: text/plain

* These had been broken by the kernel upgrade to 4.1 and have since
  been fixed

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroup-arago-base-tisdk-server-extra.bb  | 46 +++++++++++++---------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 98debfa..2fc335e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r6"
+PR = "r7"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -81,19 +81,6 @@ ARAGO_SECURE_STORAGE = "\
     engine-pkcs11 \
     "
 
-# Disable due to IPC for now
-#    demo-image-proc
-#    rm-lld
-#    pa-lld
-#    qmss-lld
-#    hplib
-#    hplib-mod
-#    nwal-lld
-#    netapi
-#    netapi-test
-#    pktlib
-#    cppi-lld
-#    ipsecmgr-mod
 ARAGO_TI_KEYSTONE_PKGS = "\
     ${ARAGO_SECURE_STORAGE} \
     uio-module-drv \
@@ -109,28 +96,51 @@ ARAGO_TI_KEYSTONE_PKGS = "\
     ti-ipc \
     mpm-transport \
     multiprocmgr \
+    rm-lld \
+    demo-image-proc \
+    pa-lld \
+    qmss-lld \
+    hplib-mod \
+    pktlib \
+    cppi-lld \
+    ipsecmgr-mod \
     "
 
+# The following packages are not yet ready for k2g-evm
+#    netapi
+#    netapi-test
+#    hplib
+#    nwal-lld
+
 ARAGO_TI_PKGS = ""
-#    uio-module-drv \
-#    cmem \
-#    cmem-mod \
-#    "
 ARAGO_TI_PKGS_append_keystone = " ${ARAGO_TI_KEYSTONE_PKGS}"
 ARAGO_TI_PKGS_append_k2l-evm = "\
     dfe-lld \
     iqn2-lld \
+    netapi \
+    netapi-test \
+    hplib \
+    nwal-lld \
     "
 
 ARAGO_TI_PKGS_append_k2hk-evm = "\
     srio-lld \
     mmap-lld \
     hyplnk-lld \
+    aif2-lld \
+    netapi \
+    netapi-test \
+    hplib \
+    nwal-lld \
     "
 
 ARAGO_TI_PKGS_append_k2e-evm = "\
     mmap-lld \
     hyplnk-lld \
+    netapi \
+    netapi-test \
+    hplib \
+    nwal-lld \
     "
 
 RDEPENDS_${PN} = "\
-- 
1.9.1


