Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2922552A48
	for <meta-arago@arago-project.org>;
	Wed,  3 Apr 2013 16:48:03 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r33Gm0f7029812
	for <meta-arago@arago-project.org>; Wed, 3 Apr 2013 11:48:01 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r33Gm0ng027735
	for <meta-arago@arago-project.org>; Wed, 3 Apr 2013 22:18:00 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 3 Apr 2013 22:18:00 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r33Glp4V024120;
	Wed, 3 Apr 2013 22:17:59 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Apr 2013 11:47:49 -0500
Message-ID: <1365007669-12577-5-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1365007669-12577-1-git-send-email-Chase.Maupin@ti.com>
References: <1365007669-12577-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] amsdk-sdk-host: add tisdk-readme package
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
X-List-Received-Date: Wed, 03 Apr 2013 16:48:09 -0000
Content-Type: text/plain

* Add the tisdk-readme package for the ti33x and omap-a15 devices

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index 5eacb55..d8846f3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional scripts and applications into the SDK"
 LICENSE = "MIT"
-PR = "r6"
+PR = "r7"
 
 inherit packagegroup
 
@@ -16,10 +16,15 @@ TOOLS_omap-a15 = ""
 TOOLS_am37x-evm_append = " flash-utility"
 TOOLS_am3517-evm_append = " flash-utility"
 
+README = ""
+README_omap-a15 = "tisdk-readme"
+README_ti33x = "tisdk-readme"
+
 RDEPENDS_${PN} = "\
     ${TOOLS} \
     ti-tisdk-setup \
     tisdk-uenv \
+    ${README} \
     board-port-labs-src \
     ti-tisdk-makefile \
     ${U-BOOT_SRC} \
-- 
1.7.0.4


