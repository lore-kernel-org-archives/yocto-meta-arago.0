Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 1CF1252A5B
	for <meta-arago@arago-project.org>;
	Thu, 19 Jan 2017 23:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 78D6C20866;
	Thu, 19 Jan 2017 23:23:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id yiG4Q__LFkwg; Thu, 19 Jan 2017 23:23:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 58DAB20B66;
	Thu, 19 Jan 2017 23:22:59 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 9B1F9162326;
	Thu, 19 Jan 2017 18:22:58 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 19 Jan 2017 18:22:58 -0500
Message-Id: <1484868178-24500-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484868178-24500-1-git-send-email-denys@ti.com>
References: <1484868178-24500-1-git-send-email-denys@ti.com>
Subject: [PATCH 2/2] FIXME: packagegroups: disable ipsecmgr and netapi due to libnl and xfrm conflict
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
X-List-Received-Date: Thu, 19 Jan 2017 23:23:06 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |  2 ++
 .../packagegroup-arago-base-tisdk-server-extra.bb  | 18 +++++++++------
 .../packagegroup-arago-test-addons.bb              | 14 +++++++-----
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    |  5 +++--
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  | 26 +++++++++++++---------
 5 files changed, 40 insertions(+), 25 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 5b9d56b..a02276a 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -42,6 +42,8 @@ PREFERRED_VERSION_bash = "3.2.57"
 PREFERRED_VERSION_gettext = "0.16.1"
 PREFERRED_VERSION_elfutils = "0.148"
 
+PREFERRED_PROVIDER_libnl-xfrm = "libnl"
+
 PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
 PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 6a7019a..394482d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r14"
+PR = "r15"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -114,31 +114,35 @@ ARAGO_TI_KEYSTONE_PKGS = "\
 
 ARAGO_TI_PKGS = ""
 ARAGO_TI_PKGS_append_keystone = " ${ARAGO_TI_KEYSTONE_PKGS}"
+
+# Disable netapi due to libnl and xfrm conflict
+#    netapi
+#    netapi-test
 ARAGO_TI_PKGS_append_k2l-evm = "\
     dfe-lld \
     iqn2-lld \
-    netapi \
-    netapi-test \
     hplib \
     nwal-lld \
     "
 
+# Disable netapi due to libnl and xfrm conflict
+#    netapi
+#    netapi-test
 ARAGO_TI_PKGS_append_k2hk-evm = "\
     srio-lld \
     mmap-lld \
     hyplnk-lld \
     aif2-lld \
-    netapi \
-    netapi-test \
     hplib \
     nwal-lld \
     "
 
+# Disable netapi due to libnl and xfrm conflict
+#    netapi
+#    netapi-test
 ARAGO_TI_PKGS_append_k2e = "\
     mmap-lld \
     hyplnk-lld \
-    netapi \
-    netapi-test \
     hplib \
     nwal-lld \
     "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
index 54fb39e..8bc9dec 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to install additional utilities/demos for test image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r12"
+PR = "r13"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -20,6 +20,8 @@ TEST_ADDONS_TI_append_omap-a15 = " \
     cmem-test \
     "
 
+# Disable ipsecmgr due to libnl and xfrm conflict
+#    ipsecmgr
 TEST_ADDONS_TI_append_keystone = " \
     mpm-transport-test \
     multiprocmgr-test \
@@ -33,7 +35,6 @@ TEST_ADDONS_TI_append_keystone = " \
     sa-lld-test \
     traceframework-test \
     udma-test \
-    ipsecmgr \
     cmem-test \
     "
 
@@ -44,6 +45,8 @@ TEST_ADDONS_TI_append_keystone = " \
 #    ipc-transport-qmss-test
 #    netapi-test
 
+# Disable netapi due to libnl and xfrm conflict
+#    netapi-test
 TEST_ADDONS_TI_append_k2hk-evm = " \
     srio-lld-test \
     ipc-transport-srio-test \
@@ -54,9 +57,10 @@ TEST_ADDONS_TI_append_k2hk-evm = " \
     nwal-lld-test \
     hplib-test \
     nwal-lld \
-    netapi-test \
     "
 
+# Disable netapi due to libnl and xfrm conflict
+#    netapi-test
 TEST_ADDONS_TI_append_k2l-evm = " \
     dfe-lld-test \
     iqn2-lld-test \
@@ -64,9 +68,10 @@ TEST_ADDONS_TI_append_k2l-evm = " \
     hplib-test \
     nwal-lld \
     ipc-transport-qmss-test \
-    netapi-test \
     "
 
+# Disable netapi due to libnl and xfrm conflict
+#    netapi-test
 TEST_ADDONS_TI_append_k2e = " \
     mmap-lld-test \
     hyplnk-lld-test \
@@ -74,7 +79,6 @@ TEST_ADDONS_TI_append_k2e = " \
     hplib-test \
     nwal-lld \
     ipc-transport-qmss-test \
-    netapi-test \
     "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index c402eff..148e9a3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r28"
+PR = "r29"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -43,11 +43,12 @@ EXTRA_LIBS_append_dra7xx = " \
     gdbserverproxy-module-drv-src \
 "
 
+# Disable ipsecmgr due to libnl and xfrm conflict
+#    ipsecmgr-mod-src
 EXTRA_LIBS_append_keystone = " \
     cmem-mod-src \
     uio-module-drv-src \
     hplib-mod-src \
-    ipsecmgr-mod-src \
 "
 
 EXTRA_LIBS_append_k2hk-evm = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index b31d729..b2586d5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r33"
+PR = "r34"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -28,6 +28,11 @@ TI_SECURE_STORAGE_DEV = "\
 	libp11-staticdev \
 	"
 
+# Disable ipsecmgr due to libnl and xfrm conflict
+#	ipsecmgr-dev
+#	ipsecmgr-staticdev
+#	libnl-xfrm-dev
+#	libnl-xfrm-staticdev
 EXTRA_LIBS_append_keystone = "\
 	${TI_SECURE_STORAGE_DEV} \
 	cmem-dev \
@@ -51,8 +56,6 @@ EXTRA_LIBS_append_keystone = "\
 	sa-lld-staticdev \
 	pktlib-dev \
 	pktlib-staticdev \
-	libnl-xfrm-dev \
-	libnl-xfrm-staticdev \
 	libnl-dev \
 	libnl-staticdev \
 	ti-ipc-dev \
@@ -67,23 +70,25 @@ EXTRA_LIBS_append_keystone = "\
 	lksctp-tools-staticdev \
 	ipc-transport-qmss-dev \
 	ipc-transport-qmss-staticdev \
-	ipsecmgr-dev \
-	ipsecmgr-staticdev \
 	"
 
+# Disable netapi due to libnl and xfrm conflict
+#	netapi-dev
+#	netapi-staticdev
 EXTRA_LIBS_append_k2l-evm = "\
 	dfe-lld-dev \
 	dfe-lld-staticdev \
 	iqn2-lld-dev \
 	iqn2-lld-staticdev \
-	netapi-dev \
-	netapi-staticdev \
 	hplib-dev \
 	hplib-staticdev \
 	nwal-lld-dev \
 	nwal-lld-staticdev \
 	"
 
+# Disable netapi due to libnl and xfrm conflict
+#	netapi-dev
+#	netapi-staticdev
 EXTRA_LIBS_append_k2hk-evm = "\
 	srio-lld-dev \
 	srio-lld-staticdev \
@@ -93,8 +98,6 @@ EXTRA_LIBS_append_k2hk-evm = "\
 	mmap-lld-staticdev \
 	hyplnk-lld-dev \
 	hyplnk-lld-staticdev \
-	netapi-dev \
-	netapi-staticdev \
 	hplib-dev \
 	hplib-staticdev \
 	nwal-lld-dev \
@@ -103,13 +106,14 @@ EXTRA_LIBS_append_k2hk-evm = "\
 	aif2-lld-staticdev \
 	"
 
+# Disable netapi due to libnl and xfrm conflict
+#	netapi-dev
+#	netapi-staticdev
 EXTRA_LIBS_append_k2e = "\
 	mmap-lld \
 	mmap-lld-staticdev \
 	hyplnk-lld-dev \
 	hyplnk-lld-staticdev \
-	netapi-dev \
-	netapi-staticdev \
 	hplib-dev \
 	hplib-staticdev \
 	nwal-lld-dev \
-- 
2.7.4


