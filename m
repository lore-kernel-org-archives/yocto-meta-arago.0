Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 589DC52A10
	for <meta-arago@arago-project.org>;
	Fri, 12 Apr 2013 21:00:27 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3CL0PEJ026748
	for <meta-arago@arago-project.org>; Fri, 12 Apr 2013 16:00:26 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3CL0O3T019522
	for <meta-arago@arago-project.org>;
	Sat, 13 Apr 2013 02:30:25 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Sat, 13 Apr 2013 02:30:24 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3CL0MZH016623;
	Sat, 13 Apr 2013 02:30:23 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 12 Apr 2013 16:00:21 -0500
Message-ID: <1365800421-26500-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/1] matrix-gui-crypto-demos: update to new apps layout
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
X-List-Received-Date: Fri, 12 Apr 2013 21:00:27 -0000
Content-Type: text/plain

* Updated the S directory to the new layout in the matrix GUI
  apps repository.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../matrix/matrix-gui-crypto-demos_2.0.bb          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
index 7d8f319..123f6e5 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
@@ -4,11 +4,11 @@ LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 inherit allarch
 
-S = "${WORKDIR}/git/cryptos_apps"
+S = "${WORKDIR}/git/cryptos_apps_scripts"
 
 # Make sure crypto submenu and app images has been installed. Also make sure openssl is available
 RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-cryptos openssl ti-crypto-examples"
-- 
1.7.0.4


