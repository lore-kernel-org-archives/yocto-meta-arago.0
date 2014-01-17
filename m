Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 82E7B52986
	for <meta-arago@arago-project.org>;
	Fri, 17 Jan 2014 20:27:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0HKR5Io012922
	for <meta-arago@arago-project.org>; Fri, 17 Jan 2014 14:27:05 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0HKR51N023874
	for <meta-arago@arago-project.org>; Fri, 17 Jan 2014 14:27:05 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 17 Jan 2014 14:27:05 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0HKR2MR016859;
	Fri, 17 Jan 2014 14:27:03 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 17 Jan 2014 15:48:49 -0600
Message-ID: <1389995329-12742-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] packagegroup-arago-test: install libdrm-tests for all machines
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
X-List-Received-Date: Fri, 17 Jan 2014 20:27:06 -0000
Content-Type: text/plain

* Install the libdrm-tests package for all machines and not just
  for omap-a15 machines.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../packagegroups/packagegroup-arago-test.bb       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index b7fa806..399eea9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Extended task to get System Test specific apps"
 LICENSE = "MIT"
-PR = "r12"
+PR = "r13"
 
 inherit packagegroup
 
@@ -16,6 +16,7 @@ ARAGO_TEST = "\
     evtest \
     bc \
     memtester \
+    libdrm-tests \
     "
 
 ARAGO_TI_TEST = "\
@@ -27,7 +28,6 @@ ARAGO_TI_TEST = "\
 
 ARAGO_TI_TEST_append_omap-a15 = " \
     omapconf \
-    libdrm-tests \
     "
 
 ARAGO_TI_TEST_append_dra7xx-evm = " \
-- 
1.7.0.4


