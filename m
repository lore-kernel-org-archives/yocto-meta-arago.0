Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 01F9D52A1F
	for <meta-arago@arago-project.org>;
	Mon, 17 Feb 2020 21:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3E3E440BFD;
	Mon, 17 Feb 2020 21:23:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 6HTFWT20IZlZ; Mon, 17 Feb 2020 21:23:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1C69E400E7;
	Mon, 17 Feb 2020 21:23:51 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id C83D8174406;
	Mon, 17 Feb 2020 16:23:50 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 17 Feb 2020 16:23:50 -0500
Message-Id: <1581974630-4809-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH] packagegroup-arago-test: add k3conf tool
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
X-List-Received-Date: Mon, 17 Feb 2020 21:25:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-test.bb       | 24 +++++++++++++---------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index f554153..066bdf8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -33,7 +33,7 @@ ARAGO_TEST = "\
     pcitest \
     mstpd \
     fio \
-    "
+"
 
 ARAGO_TEST_append_armv7a = " \
     cpuburn-neon \
@@ -49,40 +49,44 @@ ARAGO_TI_TEST = " \
     input-utils \
     cpuloadgen \
     uvc-gadget \
-    "
+"
 
 ARAGO_TI_TEST_append_ti33x = " \
     omapconf \
-    "
+"
 
 ARAGO_TI_TEST_append_ti43x = " \
     omapconf \
-    "
+"
 
 ARAGO_TI_TEST_append_omap-a15 = " \
     omapconf \
     ti-ipc-test \
-    "
+"
+
+ARAGO_TI_TEST_append_k3 = " \
+    k3conf \
+"
 
 ARAGO_TI_TEST_append_am65xx = " \
     ti-ipc-test \
-    "
+"
 
 ARAGO_TI_TEST_append_j7-evm = " \
     viddec-test-app \
     videnc-test-app \
     ufs-tool \
-    "
+"
 
 ARAGO_TI_TEST_append_keystone = " \
     ti-ipc-test \
-    "
+"
 
 ARAGO_TI_TEST_append_omapl138 = " \
     ti-ipc-test \
-    "
+"
 
 RDEPENDS_${PN} = "\
     ${ARAGO_TEST} \
     ${ARAGO_TI_TEST} \
-    "
+"
-- 
2.7.4


