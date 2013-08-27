Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 024CB52090
	for <meta-arago@arago-project.org>;
	Tue, 27 Aug 2013 19:18:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7RJIClJ021199
	for <meta-arago@arago-project.org>; Tue, 27 Aug 2013 14:18:12 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7RJICh0023055
	for <meta-arago@arago-project.org>; Tue, 27 Aug 2013 14:18:12 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 27 Aug 2013 14:18:11 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7RJHxot028646;
	Tue, 27 Aug 2013 14:18:10 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 27 Aug 2013 14:51:31 -0500
Message-ID: <1377633092-29917-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1377633092-29917-1-git-send-email-fcooper@ti.com>
References: <1377633092-29917-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 5/6 v2] packagegroup-arago-tisdk-amsdk-sdk-host: Use new board-port-labs recipe
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
X-List-Received-Date: Tue, 27 Aug 2013 19:18:13 -0000
Content-Type: text/plain

* Use new board-port-labs recipe

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Remove board-port-labs recipe removal from this patch.

 .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index 70f767d..94d8288 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional scripts and applications into the SDK"
 LICENSE = "MIT"
-PR = "r11"
+PR = "r12"
 
 inherit packagegroup
 
@@ -24,7 +24,8 @@ RDEPENDS_${PN} = "\
     ${TOOLS} \
     ti-tisdk-setup \
     ${EXTRA_FILES} \
-    board-port-labs-src \
+    board-port-labs-u-boot-src \
+    board-port-labs-linux-src \
     ti-tisdk-makefile \
     ${U-BOOT_SRC} \
     ${KERNEL_SRC} \
-- 
1.7.0.4


