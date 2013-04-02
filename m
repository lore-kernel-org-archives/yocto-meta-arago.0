Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id F41B45298C
	for <meta-arago@arago-project.org>;
	Tue,  2 Apr 2013 17:03:56 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r32H3s8j029569
	for <meta-arago@arago-project.org>; Tue, 2 Apr 2013 12:03:55 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r32H3r0o023041
	for <meta-arago@arago-project.org>; Tue, 2 Apr 2013 22:33:54 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 2 Apr 2013 22:33:52 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r32H3oth014353;
	Tue, 2 Apr 2013 22:33:51 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Apr 2013 12:03:48 -0500
Message-ID: <1364922228-2628-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] arago-test: make MACHINE specific architecture
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
X-List-Received-Date: Tue, 02 Apr 2013 17:03:58 -0000
Content-Type: text/plain

* This packagegroup has MACHINE specific overrides so it should
  have a machine specific architecture.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../packagegroups/packagegroup-arago-test.bb       |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index a7bfa09..ba98c17 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -1,9 +1,11 @@
 DESCRIPTION = "Extended task to get System Test specific apps"
 LICENSE = "MIT"
-PR = "r3"
+PR = "r4
 
 inherit packagegroup
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 ARAGO_TEST = "\
     bonnie++ \
     hdparm \
-- 
1.7.0.4


