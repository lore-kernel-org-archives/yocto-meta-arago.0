Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 4206C52CBD
	for <meta-arago@arago-project.org>;
	Thu,  1 Apr 2021 21:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D0BA640BA9;
	Thu,  1 Apr 2021 21:24:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Xd-BfcTbH6Kh; Thu,  1 Apr 2021 21:24:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B203840C8E;
	Thu,  1 Apr 2021 21:24:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7CB9C17456D;
	Thu,  1 Apr 2021 17:24:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  1 Apr 2021 17:23:36 -0400
Message-Id: <1617312217-14991-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617312217-14991-1-git-send-email-denis@denix.org>
References: <1617312217-14991-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH 6/7] ti-test: disable cmem, omapdrmtest, ti-ipc, llds for mainline brand
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
X-List-Received-Date: Thu, 01 Apr 2021 21:23:57 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

These components require drivers that are not upstream (cmem, uio, rpmsg...)

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-core/packagegroups/ti-test.bb          | 84 ++++++++++++----------
 1 file changed, 47 insertions(+), 37 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index b48aa9e..5b04d85 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -63,14 +63,16 @@ ARAGO_TI_TEST_append_ti33x = " \
 
 ARAGO_TI_TEST_append_ti43x = " \
     omapconf \
-    cmem-test \
+    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'cmem-test', d)} \
 "
 
 ARAGO_TI_TEST_append_omap-a15 = " \
     omapconf \
-    ti-ipc-test \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} \
-    cmem-test \
+    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', ' \
+        ti-ipc-test \
+        ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} \
+        cmem-test \
+    ', d)} \
 "
 
 ARAGO_TI_TEST_append_k3 = " \
@@ -82,23 +84,25 @@ ARAGO_TI_TEST_append_j7 = " \
 "
 
 ARAGO_TI_TEST_append_omapl138 = " \
-    ti-ipc-test \
+    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'ti-ipc-test', d)} \
 "
 
 # Disable ipsecmgr due to libnl and xfrm conflict
 #    ipsecmgr
 ARAGO_TI_TEST_append_keystone = " \
-    ti-ipc-test \
-    mpm-transport-test \
-    multiprocmgr-test \
-    qmss-lld-test \
-    cppi-lld-test \
-    edma3-lld-test \
-    rm-lld \
-    rm-lld-test \
-    traceframework-test \
-    udma-test \
-    cmem-test \
+    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', ' \
+        ti-ipc-test \
+        mpm-transport-test \
+        multiprocmgr-test \
+        qmss-lld-test \
+        cppi-lld-test \
+        edma3-lld-test \
+        rm-lld \
+        rm-lld-test \
+        traceframework-test \
+        udma-test \
+        cmem-test \
+    ', d)} \
 "
 
 # The following are not yet ready for k2g-evm
@@ -115,15 +119,17 @@ ARAGO_TI_TEST_append_keystone = " \
 #    nwal-lld-test
 #    nwal-lld
 ARAGO_TI_TEST_append_k2hk = " \
-    srio-lld-test \
-    ipc-transport-srio-test \
-    ipc-transport-qmss-test \
-    hyplnk-lld-test \
-    mmap-lld-test \
-    aif2-lld-test \
-    pa-lld-test \
-    sa-lld \
-    sa-lld-test \
+    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', ' \
+        srio-lld-test \
+        ipc-transport-srio-test \
+        ipc-transport-qmss-test \
+        hyplnk-lld-test \
+        mmap-lld-test \
+        aif2-lld-test \
+        pa-lld-test \
+        sa-lld \
+        sa-lld-test \
+    ', d)} \
 "
 
 # Disable netapi due to libnl and xfrm conflict
@@ -133,12 +139,14 @@ ARAGO_TI_TEST_append_k2hk = " \
 #    nwal-lld-test
 #    nwal-lld
 ARAGO_TI_TEST_append_k2l = " \
-    dfe-lld-test \
-    iqn2-lld-test \
-    ipc-transport-qmss-test \
-    pa-lld-test \
-    sa-lld \
-    sa-lld-test \
+    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', ' \
+        dfe-lld-test \
+        iqn2-lld-test \
+        ipc-transport-qmss-test \
+        pa-lld-test \
+        sa-lld \
+        sa-lld-test \
+    ', d)} \
 "
 
 # Disable netapi due to libnl and xfrm conflict
@@ -148,12 +156,14 @@ ARAGO_TI_TEST_append_k2l = " \
 #    nwal-lld-test
 #    nwal-lld
 ARAGO_TI_TEST_append_k2e = " \
-    mmap-lld-test \
-    hyplnk-lld-test \
-    ipc-transport-qmss-test \
-    pa-lld-test \
-    sa-lld \
-    sa-lld-test \
+    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', ' \
+        mmap-lld-test \
+        hyplnk-lld-test \
+        ipc-transport-qmss-test \
+        pa-lld-test \
+        sa-lld \
+        sa-lld-test \
+    ', d)} \
 "
 
 RDEPENDS_${PN} = "\
-- 
2.7.4


