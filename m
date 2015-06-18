Return-Path: <hzhang@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id BBBB7529B5
	for <meta-arago@arago-project.org>;
	Thu, 18 Jun 2015 14:48:27 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t5IEmPvh030100
	for <meta-arago@arago-project.org>; Thu, 18 Jun 2015 09:48:25 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t5IEmP1C020535
	for <meta-arago@arago-project.org>; Thu, 18 Jun 2015 09:48:25 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 18 Jun 2015 09:48:25 -0500
Received: from ares-ubuntu (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t5IEmPT1026833;
	Thu, 18 Jun 2015 09:48:25 -0500
Received: from a0868496 by ares-ubuntu with local (Exim 4.76)	(envelope-from
	<hzhang@ti.com>)	id 1Z5b7B-0007rO-41; Thu, 18 Jun 2015 10:48:25 -0400
From: <hzhang@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 18 Jun 2015 10:48:06 -0400
Message-ID: <1434638886-30181-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] keystone: recovery kernel: Add dependency on device tree compiler
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
X-List-Received-Date: Thu, 18 Jun 2015 14:48:29 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 .../recovery-kernel/recovery-kernel_1.0.bb         |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb b/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb
index 6e4f9c7..3fc631b 100644
--- a/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb
+++ b/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb
@@ -1,7 +1,10 @@
 DESCRIPTION = "Recovery kernel building for Keystone EVM"
 LICENSE = "GPLv2"
 
-PR = "r3"
+# recovery kernel needs devtree compiler to add padding bytes
+DEPENDS += "dtc-native"
+
+PR = "r4"
 COMPATIBLE_MACHINE = "keystone"
 BRANCH = "v3.10.72/master"
 SRCREV = "b9bad8fccc5f9c6bcd78363982b3249a15f193fb"
-- 
1.7.9.5


