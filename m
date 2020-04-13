Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id B929A52A6F
	for <meta-arago@arago-project.org>;
	Mon, 13 Apr 2020 22:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0E82740C40;
	Mon, 13 Apr 2020 22:35:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 2MzE-M3uHaYx; Mon, 13 Apr 2020 22:35:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EBCFD40C35;
	Mon, 13 Apr 2020 22:35:04 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A744C1724AB;
	Mon, 13 Apr 2020 18:35:04 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 13 Apr 2020 18:35:04 -0400
Message-Id: <1586817304-38104-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] packagegroups: limit pa-lld and sa-lld to k2hk, k2l and k2e
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
X-List-Received-Date: Mon, 13 Apr 2020 22:37:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-base-tisdk-server-extra.bb        |  4 +++-
 .../packagegroup-arago-tisdk-addons-sdk-target.bb        | 16 ++++++++++++----
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb  | 12 +++++++++---
 3 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 95617fe..962a6b6 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -42,7 +42,6 @@ ARAGO_TI_KEYSTONE_PKGS = "\
     mpm-transport \
     multiprocmgr \
     rm-lld \
-    pa-lld \
     qmss-lld \
     pktlib \
     cppi-lld \
@@ -68,6 +67,7 @@ ARAGO_TI_PKGS_append_keystone = " ${ARAGO_TI_KEYSTONE_PKGS}"
 ARAGO_TI_PKGS_append_k2l = "\
     dfe-lld \
     iqn2-lld \
+    pa-lld \
     "
 
 # Disable netapi due to libnl and xfrm conflict
@@ -81,6 +81,7 @@ ARAGO_TI_PKGS_append_k2hk = "\
     mmap-lld \
     hyplnk-lld \
     aif2-lld \
+    pa-lld \
     "
 
 # Disable netapi due to libnl and xfrm conflict
@@ -92,6 +93,7 @@ ARAGO_TI_PKGS_append_k2hk = "\
 ARAGO_TI_PKGS_append_k2e = "\
     mmap-lld \
     hyplnk-lld \
+    pa-lld \
     "
 
 # vtun does not build against openssl 1.1
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 9487338..bbdf1d5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -53,12 +53,8 @@ EXTRA_LIBS_append_keystone = "\
 	cppi-lld-staticdev \
 	qmss-lld-dev \
 	qmss-lld-staticdev \
-	pa-lld-dev \
-	pa-lld-staticdev \
 	rm-lld-dev \
 	rm-lld-staticdev \
-	sa-lld-dev \
-	sa-lld-staticdev \
 	pktlib-dev \
 	pktlib-staticdev \
 	libnl-dev \
@@ -88,6 +84,10 @@ EXTRA_LIBS_append_k2l = "\
 	dfe-lld-staticdev \
 	iqn2-lld-dev \
 	iqn2-lld-staticdev \
+	pa-lld-dev \
+	pa-lld-staticdev \
+	sa-lld-dev \
+	sa-lld-staticdev \
 	"
 
 # Disable netapi due to libnl and xfrm conflict
@@ -109,6 +109,10 @@ EXTRA_LIBS_append_k2hk = "\
 	hyplnk-lld-staticdev \
 	aif2-lld-dev \
 	aif2-lld-staticdev \
+	pa-lld-dev \
+	pa-lld-staticdev \
+	sa-lld-dev \
+	sa-lld-staticdev \
 	"
 
 # Disable netapi due to libnl and xfrm conflict
@@ -124,6 +128,10 @@ EXTRA_LIBS_append_k2e = "\
 	mmap-lld-staticdev \
 	hyplnk-lld-dev \
 	hyplnk-lld-staticdev \
+	pa-lld-dev \
+	pa-lld-staticdev \
+	sa-lld-dev \
+	sa-lld-staticdev \
 "
 
 UTILS_append_ti33x = " can-utils-dev"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index a266e26..c4d74f3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -104,13 +104,10 @@ TEST_ADDONS_TI_append_keystone = " \
     mpm-transport-test \
     multiprocmgr-test \
     qmss-lld-test \
-    pa-lld-test \
     cppi-lld-test \
     edma3-lld-test \
     rm-lld \
     rm-lld-test \
-    sa-lld \
-    sa-lld-test \
     traceframework-test \
     udma-test \
     cmem-test \
@@ -136,6 +133,9 @@ TEST_ADDONS_TI_append_k2hk = " \
     hyplnk-lld-test \
     mmap-lld-test \
     aif2-lld-test \
+    pa-lld-test \
+    sa-lld \
+    sa-lld-test \
 "
 
 # Disable netapi due to libnl and xfrm conflict
@@ -148,6 +148,9 @@ TEST_ADDONS_TI_append_k2l = " \
     dfe-lld-test \
     iqn2-lld-test \
     ipc-transport-qmss-test \
+    pa-lld-test \
+    sa-lld \
+    sa-lld-test \
 "
 
 # Disable netapi due to libnl and xfrm conflict
@@ -160,6 +163,9 @@ TEST_ADDONS_TI_append_k2e = " \
     mmap-lld-test \
     hyplnk-lld-test \
     ipc-transport-qmss-test \
+    pa-lld-test \
+    sa-lld \
+    sa-lld-test \
 "
 
 RDEPENDS_${PN} = "\
-- 
2.7.4


