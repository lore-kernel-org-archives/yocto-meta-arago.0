Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id BC9D452976
	for <meta-arago@arago-project.org>;
	Thu,  1 Mar 2018 21:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 950C120B48;
	Thu,  1 Mar 2018 21:26:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id r08CnNXsw9_e; Thu,  1 Mar 2018 21:26:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5F2432086C;
	Thu,  1 Mar 2018 21:26:31 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id C0F421632DF;
	Thu,  1 Mar 2018 16:26:30 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  1 Mar 2018 16:26:30 -0500
Message-Id: <1519939590-30905-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] packagegroups: disable keystone ipsecmgr-mod, hplib-mod and their deps due to K4.14 breakage
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
X-List-Received-Date: Thu, 01 Mar 2018 21:27:09 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-base-tisdk-server-extra.bb  | 21 ++++++++++-------
 .../packagegroup-arago-test-addons.bb              | 21 +++++++++--------
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    |  3 ++-
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  | 27 ++++++++++++----------
 4 files changed, 42 insertions(+), 30 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index c07cc59..c5dfc99 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -81,6 +81,10 @@ ARAGO_SECURE_STORAGE = "\
     engine-pkcs11 \
     "
 
+# ipsecmgr has been disabled for a while
+# disable ipsecmgr-mod,hplib-mod due to K4.14 API changes
+#    ipsecmgr-mod
+#    hplib-mod
 ARAGO_TI_KEYSTONE_PKGS = "\
     ${ARAGO_SECURE_STORAGE} \
     uio-module-drv \
@@ -99,10 +103,8 @@ ARAGO_TI_KEYSTONE_PKGS = "\
     rm-lld \
     pa-lld \
     qmss-lld \
-    hplib-mod \
     pktlib \
     cppi-lld \
-    ipsecmgr-mod \
     k2-fw-initrd \
     parse-ip \
     "
@@ -119,33 +121,36 @@ ARAGO_TI_PKGS_append_keystone = " ${ARAGO_TI_KEYSTONE_PKGS}"
 # Disable netapi due to libnl and xfrm conflict
 #    netapi
 #    netapi-test
+# Disable hplib,nwal-lld as hplib-mod is broken against K4.14
+#    hplib
+#    nwal-lld
 ARAGO_TI_PKGS_append_k2l-evm = "\
     dfe-lld \
     iqn2-lld \
-    hplib \
-    nwal-lld \
     "
 
 # Disable netapi due to libnl and xfrm conflict
 #    netapi
 #    netapi-test
+# Disable hplib,nwal-lld as hplib-mod is broken against K4.14
+#    hplib
+#    nwal-lld
 ARAGO_TI_PKGS_append_k2hk = "\
     srio-lld \
     mmap-lld \
     hyplnk-lld \
     aif2-lld \
-    hplib \
-    nwal-lld \
     "
 
 # Disable netapi due to libnl and xfrm conflict
 #    netapi
 #    netapi-test
+# Disable hplib,nwal-lld as hplib-mod is broken against K4.14
+#    hplib
+#    nwal-lld
 ARAGO_TI_PKGS_append_k2e = "\
     mmap-lld \
     hyplnk-lld \
-    hplib \
-    nwal-lld \
     "
 
 #    recovery-kernel
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
index f84f7f9..075e470 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
@@ -51,6 +51,10 @@ TEST_ADDONS_TI_append_keystone = " \
 
 # Disable netapi due to libnl and xfrm conflict
 #    netapi-test
+# Disable hplib-test,nwal-lld due to hplib-mod breakage against K4.14
+#    hplib-test
+#    nwal-lld-test
+#    nwal-lld
 TEST_ADDONS_TI_append_k2hk = " \
     srio-lld-test \
     ipc-transport-srio-test \
@@ -58,30 +62,29 @@ TEST_ADDONS_TI_append_k2hk = " \
     hyplnk-lld-test \
     mmap-lld-test \
     aif2-lld-test \
-    nwal-lld-test \
-    hplib-test \
-    nwal-lld \
     "
 
 # Disable netapi due to libnl and xfrm conflict
 #    netapi-test
+# Disable hplib-test,nwal-lld due to hplib-mod breakage against K4.14
+#    hplib-test
+#    nwal-lld-test
+#    nwal-lld
 TEST_ADDONS_TI_append_k2l-evm = " \
     dfe-lld-test \
     iqn2-lld-test \
-    nwal-lld-test \
-    hplib-test \
-    nwal-lld \
     ipc-transport-qmss-test \
     "
 
 # Disable netapi due to libnl and xfrm conflict
 #    netapi-test
+# Disable hplib-test,nwal-lld due to hplib-mod breakage against K4.14
+#    hplib-test
+#    nwal-lld-test
+#    nwal-lld
 TEST_ADDONS_TI_append_k2e = " \
     mmap-lld-test \
     hyplnk-lld-test \
-    nwal-lld-test \
-    hplib-test \
-    nwal-lld \
     ipc-transport-qmss-test \
     "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 2175501..5a80bf4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -57,10 +57,11 @@ EXTRA_LIBS_append_ti43x = " \
 
 # Disable ipsecmgr due to libnl and xfrm conflict
 #    ipsecmgr-mod-src
+# Disable hplib-mod-srv due to K4.14 breakage
+#    hplib-mod-src
 EXTRA_LIBS_append_keystone = " \
     cmem-mod-src \
     uio-module-drv-src \
-    hplib-mod-src \
 "
 
 EXTRA_LIBS_append_k2hk = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 21beca4..3ca669e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -73,20 +73,26 @@ EXTRA_LIBS_append_keystone = "\
 # Disable netapi due to libnl and xfrm conflict
 #	netapi-dev
 #	netapi-staticdev
+# Disable hplib-dev/staticdev,nwal-lld due to hplib-mod breakage against K4.14
+#	hplib-dev
+#	hplib-staticdev
+#	nwal-lld-dev
+#	nwal-lld-staticdev
 EXTRA_LIBS_append_k2l-evm = "\
 	dfe-lld-dev \
 	dfe-lld-staticdev \
 	iqn2-lld-dev \
 	iqn2-lld-staticdev \
-	hplib-dev \
-	hplib-staticdev \
-	nwal-lld-dev \
-	nwal-lld-staticdev \
 	"
 
 # Disable netapi due to libnl and xfrm conflict
 #	netapi-dev
 #	netapi-staticdev
+# Disable hplib-dev/staticdev,nwal-lld due to hplib-mod breakage against K4.14
+#	hplib-dev
+#	hplib-staticdev
+#	nwal-lld-dev
+#	nwal-lld-staticdev
 EXTRA_LIBS_append_k2hk = "\
 	srio-lld-dev \
 	srio-lld-staticdev \
@@ -96,10 +102,6 @@ EXTRA_LIBS_append_k2hk = "\
 	mmap-lld-staticdev \
 	hyplnk-lld-dev \
 	hyplnk-lld-staticdev \
-	hplib-dev \
-	hplib-staticdev \
-	nwal-lld-dev \
-	nwal-lld-staticdev \
 	aif2-lld-dev \
 	aif2-lld-staticdev \
 	"
@@ -107,15 +109,16 @@ EXTRA_LIBS_append_k2hk = "\
 # Disable netapi due to libnl and xfrm conflict
 #	netapi-dev
 #	netapi-staticdev
+# Disable hplib-dev/staticdev,nwal-lld due to hplib-mod breakage against K4.14
+#	hplib-dev
+#	hplib-staticdev
+#	nwal-lld-dev
+#	nwal-lld-staticdev
 EXTRA_LIBS_append_k2e = "\
 	mmap-lld \
 	mmap-lld-staticdev \
 	hyplnk-lld-dev \
 	hyplnk-lld-staticdev \
-	hplib-dev \
-	hplib-staticdev \
-	nwal-lld-dev \
-	nwal-lld-staticdev \
 "
 
 UTILS_append_ti33x = " can-utils-dev"
-- 
2.7.4


