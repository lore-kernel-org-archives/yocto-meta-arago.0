Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6E9D552A51
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 02:05:49 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2K25l97023809
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 21:05:48 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K25k2u022918
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 07:35:46 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 20 Mar 2013 07:35:46 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K25epG026167;
	Wed, 20 Mar 2013 07:35:45 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Mar 2013 21:05:24 -0500
Message-ID: <1363745138-10288-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363745138-10288-1-git-send-email-fcooper@ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 03/17] ti-compat-bluetooth: Split recipe
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
X-List-Received-Date: Wed, 20 Mar 2013 02:05:49 -0000
Content-Type: text/plain

* Generate a common .inc file to allow support for multiple versions of the
  ti-compat-bluetooth recipe.
* Change the recipe name to reflect the specific TI compat-bluetooth release

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-compat-bluetooth/ti-compat-bluetooth.inc    |   31 ++++++++++++++++
 .../ti-compat-bluetooth/ti-compat-bluetooth_1.0.bb |   39 --------------------
 .../ti-compat-bluetooth_r5.sp3.05.bb               |    8 ++++
 3 files changed, 39 insertions(+), 39 deletions(-)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth.inc
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_1.0.bb
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_r5.sp3.05.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth.inc b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth.inc
new file mode 100644
index 0000000..bdffeeb
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth.inc
@@ -0,0 +1,31 @@
+DESCRIPTION = "TI compat-bluetooth drivers"
+HOMEPAGE = "https://gforge.ti.com/gf/project/ecs_nlcp/"
+SECTION = "kernel/modules"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+inherit module
+
+RDEPENDS_${PN} = "ti-compat-wireless-wl12xx"
+
+PR = "${MACHINE_KERNEL_PR}+b"
+
+SRC_URI = "file://0001-compat-bluetooth-2.6-removed-unused-BT-modules-from-.patch \
+            file://0002-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch \
+            file://0001-compat-bluetooth-fixing-kernel-panic-in-l2cap.patch \
+           "
+
+S = "${WORKDIR}/compat-bluetooth/"
+
+EXTRA_OEMAKE = "KLIB_BUILD=${STAGING_KERNEL_DIR} KLIB=${D}"
+
+do_configure() {
+    cd ${S}
+    ./scripts/driver-select bt
+}
+
+do_install() {
+    oe_runmake DEPMOD=echo DESTDIR="${D}" INSTALL_MOD_PATH="${D}" LDFLAGS="" install-modules
+    find ${D} -name compat.ko | xargs rm
+}
+
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_1.0.bb b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_1.0.bb
deleted file mode 100644
index 9ce50f7..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_1.0.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-DESCRIPTION = "TI compat-bluetooth drivers"
-HOMEPAGE = "https://gforge.ti.com/gf/project/ecs_nlcp/"
-SECTION = "kernel/modules"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d7810fab7487fb0aad327b76f1be7cd7"
-
-inherit module
-
-RDEPENDS_${PN} = "ti-compat-wireless-wl12xx"
-
-PR = "${MACHINE_KERNEL_PR}"
-PR_append = "b"
-
-COMPAT_BLUETOOTH_VERSION = "2012-11-19-r5-sp3"
-TAG = "${@'${COMPAT_BLUETOOTH_VERSION}'.replace('-', '')}"
-PV = "0.${TAG}"
-
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/802/5435/ti-compat-bluetooth-2012-02-20.tar.gz \
-           file://0001-compat-bluetooth-2.6-removed-unused-BT-modules-from-.patch \
-           file://0002-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch \
-           file://0001-compat-bluetooth-fixing-kernel-panic-in-l2cap.patch \
-          "
-
-SRC_URI[md5sum] = "7c231b35a2297391b5192f86ff4f10dd"
-SRC_URI[sha256sum] = "d8882da8bb37821bfd0b9334b859f64d0ce82ae5262360367a3f3fdf31c7f350"
-
-S = "${WORKDIR}/compat-bluetooth/"
-
-EXTRA_OEMAKE = "KLIB_BUILD=${STAGING_KERNEL_DIR} KLIB=${D}"
-
-do_configure() {
-    cd ${S}
-    ./scripts/driver-select bt
-}
-
-do_install() {
-    oe_runmake DEPMOD=echo DESTDIR="${D}" INSTALL_MOD_PATH="${D}" LDFLAGS="" install-modules
-    find ${D} -name compat.ko | xargs rm
-}
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_r5.sp3.05.bb b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_r5.sp3.05.bb
new file mode 100644
index 0000000..2df61c2
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_r5.sp3.05.bb
@@ -0,0 +1,8 @@
+require ti-compat-bluetooth.inc
+
+PR_append = "-r0"
+
+SRC_URI += "https://gforge.ti.com/gf/download/frsrelease/802/5435/ti-compat-bluetooth-2012-02-20.tar.gz"
+
+SRC_URI[md5sum] = "7c231b35a2297391b5192f86ff4f10dd"
+SRC_URI[sha256sum] = "d8882da8bb37821bfd0b9334b859f64d0ce82ae5262360367a3f3fdf31c7f350"
-- 
1.7.0.4


