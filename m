Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7B0A9529D8
	for <meta-arago@arago-project.org>;
	Wed, 29 Aug 2012 20:33:21 +0000 (UTC)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7TKXKmt022905
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2012 15:33:20 -0500
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7TKXKf7024893
	for <meta-arago@arago-project.org>;
	Wed, 29 Aug 2012 15:33:20 -0500 (CDT)
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Aug 2012 15:33:20 -0500
Received: from DFLE72.ent.ti.com (dlep26.itg.ti.com [157.170.170.121])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7TKXKNB019719	for
	<meta-arago@arago-project.org>; Wed, 29 Aug 2012 15:33:20 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Aug 2012 15:33:20 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7TKXKE9025548;	Wed, 29 Aug 2012 15:33:20 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T6pBK-000882-Ni; Wed, 29 Aug 2012 15:48:10 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 29 Aug 2012 15:48:09 -0500
Message-ID: <1346273289-31211-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-extras][PATCH] av-examples: Adjust compatible machine
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
X-List-Received-Date: Wed, 29 Aug 2012 20:33:21 -0000
Content-Type: text/plain

* av-examples contains programs that will run on the omap3 SOC. Adjusting
  the COMPATIBLE_MACHINE to reflect this limitation instead of limiting it
  to particular evms.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../av-examples/av-examples_1.0.bb                 |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
index 1025f96..c16e78c 100644
--- a/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
@@ -5,12 +5,12 @@ LIC_FILES_CHKSUM := "file://COPYING;md5=80ea1ff5788f65d5c5b3206d50d4bc6c"
 SECTION = "system"
 PRIORITY = "optional"
 
-PR = "r0"
+PR = "r1"
 
-DEPENDS += "virtual/kernel"
+DEPENDS = "virtual/kernel"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-COMPATIBLE_MACHINE = "(am37x-evm|am3517-evm)"
+COMPATIBLE_MACHINE = "(omap3)"
 
 BRANCH ?= "master"
 SRCREV = "ac75d09d29a805d89c49dd2741b79f3069e97827"
-- 
1.7.0.4


