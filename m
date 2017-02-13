Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 4629A52AAB
	for <meta-arago@arago-project.org>;
	Mon, 13 Feb 2017 23:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4CD9220B96;
	Mon, 13 Feb 2017 23:07:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id hC86sur3hBES; Mon, 13 Feb 2017 23:07:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2D30A208B1;
	Mon, 13 Feb 2017 23:07:23 +0000 (UTC)
Received: from gimli.denix (pippin [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 9D2E5162325;
	Mon, 13 Feb 2017 18:07:22 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 13 Feb 2017 18:07:14 -0500
Message-Id: <1487027238-101793-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH 1/5] packagegroup-arago-test: cpuburn-neon only works on ARMv7, mark accordingly
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
X-List-Received-Date: Mon, 13 Feb 2017 23:07:26 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-test.bb   | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index d01ba36..330cce2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Extended task to get System Test specific apps"
 LICENSE = "MIT"
-PR = "r44"
+PR = "r45"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -25,7 +25,6 @@ ARAGO_TEST = "\
     v4l-utils \
     smcroute \
     rwmem \
-    cpuburn-neon \
     pulseaudio-misc \
     kselftests \
     cpuset \
@@ -33,7 +32,15 @@ ARAGO_TEST = "\
     mtd-utils-ubifs-tests \
     "
 
-ARAGO_TI_TEST = "\
+ARAGO_TEST_append_armv7a = " \
+    cpuburn-neon \
+"
+
+ARAGO_TEST_append_armv7ve = " \
+    cpuburn-neon \
+"
+
+ARAGO_TI_TEST = " \
     ltp-ddt \
     input-utils \
     cpuloadgen \
-- 
2.7.4


