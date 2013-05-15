Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D4E2152A8A
	for <meta-arago@arago-project.org>;
	Wed, 15 May 2013 03:54:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4F3stBQ005380
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 22:54:55 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4F3ssPe014608
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 22:54:55 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 14 May 2013 22:54:54 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r4F3sXkV004084;
	Tue, 14 May 2013 22:54:53 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 14 May 2013 22:54:28 -0500
Message-ID: <1368590069-6700-8-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1368590069-6700-1-git-send-email-fcooper@ti.com>
References: <1368590069-6700-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 8/9] Revert "packagegroup-*-connectivity: disable battleship and wpa-gui-e for now"
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
X-List-Received-Date: Wed, 15 May 2013 03:54:56 -0000
Content-Type: text/plain

This reverts commit 66b017b74ceb7d9e918099bcec4139fb1f3678f2.

Conflicts:

	meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
---
 .../packagegroup-arago-tisdk-connectivity.bb       |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index b257ba4..b989ec7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wlan and bluetooth packages into the target FS"
 LICENSE = "MIT"
-PR = "r8"
+PR = "r9"
 
 inherit packagegroup
 
@@ -53,13 +53,11 @@ BLUETOOTH_STACK = "\
 DEMO_APPS = "\
     bluetooth-gui \
     wifi-direct-demo \
+    wpa-gui-e \
     wl1271-demo \
+    battleship \
 "
 
-# Won't build with new gcc-4.7, need to include <unistd.h>
-#    wpa-gui-e
-#    battleship
-
 CONNECTIVITY_RDEPENDS = ""
 
 CONNECTIVITY_RDEPENDS_am37x-evm = "\
-- 
1.7.0.4


