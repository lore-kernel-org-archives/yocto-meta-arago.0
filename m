Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 0E37652981
	for <meta-arago@arago-project.org>;
	Thu, 18 Apr 2013 17:39:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3IHdkNa029505
	for <meta-arago@arago-project.org>; Thu, 18 Apr 2013 12:39:46 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3IHdkVP008305
	for <meta-arago@arago-project.org>; Thu, 18 Apr 2013 12:39:46 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 18 Apr 2013 12:39:46 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3IHdhmB016959;
	Thu, 18 Apr 2013 12:39:45 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 18 Apr 2013 12:39:41 -0500
Message-ID: <1366306781-17062-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] am33x-cm3: remove the SRC_URI setting
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
X-List-Received-Date: Thu, 18 Apr 2013 17:39:49 -0000
Content-Type: text/plain

* The base recipe SRC_URI has been updated so remove the setting
  that overwrites this.  This was preventing picking up the
  init script required to load the firmware

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-bsp/am335x-cm3/am33x-cm3_git.bbappend  |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/am335x-cm3/am33x-cm3_git.bbappend b/meta-arago-distro/recipes-bsp/am335x-cm3/am33x-cm3_git.bbappend
index 61547e3..826f250 100644
--- a/meta-arago-distro/recipes-bsp/am335x-cm3/am33x-cm3_git.bbappend
+++ b/meta-arago-distro/recipes-bsp/am335x-cm3/am33x-cm3_git.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-arago0"
+PR_append = "-arago1"
 
 PV = "05.06.00.00"
 
@@ -6,5 +6,3 @@ BRANCH = "master"
 
 #This SRCREV corresponds to tag AM335xPSP_04.06.00.09-rc
 SRCREV = "7c6075f28d9fdd633175cdbd8dc287613ce92e5d"
-
-SRC_URI = "git://arago-project.org/git/projects/am33x-cm3.git;protocol=git;branch=${BRANCH}"
-- 
1.7.0.4


