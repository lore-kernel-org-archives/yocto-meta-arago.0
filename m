Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C2BF452AAE
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 13:33:00 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id qACDWwWJ025054
	for <meta-arago@arago-project.org>; Mon, 12 Nov 2012 07:32:59 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id qACDWuPj008267
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 19:02:58 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 12 Nov 2012 19:02:56 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id qACDWsB0021812;
	Mon, 12 Nov 2012 19:02:55 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 12 Nov 2012 07:32:49 -0600
Message-ID: <1352727169-26824-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] tisdk-rootfs-image: derive the rootfs image from base image
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
X-List-Received-Date: Mon, 12 Nov 2012 13:33:01 -0000
Content-Type: text/plain

* Derive the tisdk-rootfs-image from the arago-base-tisdk-image.
* This brings in functionality like remove-net-rules as well as
  keeping these two images aligned.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-core/images/tisdk-rootfs-image.bb      |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index fc5d39e..2574329 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -1,12 +1,9 @@
 # Arago TI SDK filesystem image
 COMPATIBLE_MACHINE = "omap3|omapl138|ti33x"
 
-require arago-image.inc
+require arago-base-tisdk-image.bb
 
 IMAGE_INSTALL += "\
-    task-arago-base \
-    task-arago-console \
-    task-arago-base-tisdk \
     task-arago-tisdk-graphics \
     task-arago-tisdk-qte \
     task-arago-tisdk-addons \
-- 
1.7.0.4


