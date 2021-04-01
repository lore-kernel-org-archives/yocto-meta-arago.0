Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 5CBD752CB8
	for <meta-arago@arago-project.org>;
	Thu,  1 Apr 2021 21:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 110D940C8F;
	Thu,  1 Apr 2021 21:24:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ktUEd0i0wl6Z; Thu,  1 Apr 2021 21:24:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E782240C5E;
	Thu,  1 Apr 2021 21:24:11 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 588EB17456A;
	Thu,  1 Apr 2021 17:24:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  1 Apr 2021 17:23:33 -0400
Message-Id: <1617312217-14991-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617312217-14991-1-git-send-email-denis@denix.org>
References: <1617312217-14991-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH 3/7] ti-test: combine main test and addons lists
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
X-List-Received-Date: Thu, 01 Apr 2021 21:23:54 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

Previously, ti-test packagegroup was combined from arago-test and test-addons
packagegroups and hence the lists were kept as is. To make it easier maintaining
and making changes, combine the lists. Still keep TI test tools vs. upstream
separately for now.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-core/packagegroups/ti-test.bb          | 38 +++++++---------------
 1 file changed, 11 insertions(+), 27 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index b9a5965..f86f1f8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -33,6 +33,9 @@ ARAGO_TEST = "\
     mstpd \
     fio \
     git \
+    bridge-utils \
+    linuxptp \
+    openntpd \
 "
 
 ARAGO_TEST_append_armv7a = " \
@@ -57,11 +60,14 @@ ARAGO_TI_TEST_append_ti33x = " \
 
 ARAGO_TI_TEST_append_ti43x = " \
     omapconf \
+    cmem-test \
 "
 
 ARAGO_TI_TEST_append_omap-a15 = " \
     omapconf \
     ti-ipc-test \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} \
+    cmem-test \
 "
 
 ARAGO_TI_TEST_append_k3 = " \
@@ -72,34 +78,14 @@ ARAGO_TI_TEST_append_j7 = " \
     ufs-utils \
 "
 
-ARAGO_TI_TEST_append_keystone = " \
-    ti-ipc-test \
-"
-
 ARAGO_TI_TEST_append_omapl138 = " \
     ti-ipc-test \
 "
 
-TEST_ADDONS = " \
-    bridge-utils \
-    linuxptp \
-    openntpd \
-"
-
-TEST_ADDONS_TI = ""
-
-TEST_ADDONS_TI_append_ti43x = " \
-    cmem-test \
-"
-
-TEST_ADDONS_TI_append_omap-a15 = " \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} \
-    cmem-test \
-"
-
 # Disable ipsecmgr due to libnl and xfrm conflict
 #    ipsecmgr
-TEST_ADDONS_TI_append_keystone = " \
+ARAGO_TI_TEST_append_keystone = " \
+    ti-ipc-test \
     mpm-transport-test \
     multiprocmgr-test \
     qmss-lld-test \
@@ -125,7 +111,7 @@ TEST_ADDONS_TI_append_keystone = " \
 #    hplib-test
 #    nwal-lld-test
 #    nwal-lld
-TEST_ADDONS_TI_append_k2hk = " \
+ARAGO_TI_TEST_append_k2hk = " \
     srio-lld-test \
     ipc-transport-srio-test \
     ipc-transport-qmss-test \
@@ -143,7 +129,7 @@ TEST_ADDONS_TI_append_k2hk = " \
 #    hplib-test
 #    nwal-lld-test
 #    nwal-lld
-TEST_ADDONS_TI_append_k2l = " \
+ARAGO_TI_TEST_append_k2l = " \
     dfe-lld-test \
     iqn2-lld-test \
     ipc-transport-qmss-test \
@@ -158,7 +144,7 @@ TEST_ADDONS_TI_append_k2l = " \
 #    hplib-test
 #    nwal-lld-test
 #    nwal-lld
-TEST_ADDONS_TI_append_k2e = " \
+ARAGO_TI_TEST_append_k2e = " \
     mmap-lld-test \
     hyplnk-lld-test \
     ipc-transport-qmss-test \
@@ -170,6 +156,4 @@ TEST_ADDONS_TI_append_k2e = " \
 RDEPENDS_${PN} = "\
     ${ARAGO_TEST} \
     ${ARAGO_TI_TEST} \
-    ${TEST_ADDONS} \
-    ${TEST_ADDONS_TI} \
 "
-- 
2.7.4


