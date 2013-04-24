Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 3B09052AA9
	for <meta-arago@arago-project.org>;
	Wed, 24 Apr 2013 14:06:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3OE67mN011670
	for <meta-arago@arago-project.org>; Wed, 24 Apr 2013 09:06:07 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3OE67h5030783
	for <meta-arago@arago-project.org>; Wed, 24 Apr 2013 09:06:07 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 24 Apr 2013 09:06:07 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3OE5xsk000444;
	Wed, 24 Apr 2013 09:06:05 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 24 Apr 2013 09:05:55 -0500
Message-ID: <1366812356-29846-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1366812356-29846-1-git-send-email-fcooper@ti.com>
References: <1366812356-29846-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/4] am33x-cm3: Remove append from meta-arago
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
X-List-Received-Date: Wed, 24 Apr 2013 14:06:08 -0000
Content-Type: text/plain

* The PSP release for am33x-cm3 is available.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-bsp/am335x-cm3/am33x-cm3_git.bbappend  |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-bsp/am335x-cm3/am33x-cm3_git.bbappend

diff --git a/meta-arago-distro/recipes-bsp/am335x-cm3/am33x-cm3_git.bbappend b/meta-arago-distro/recipes-bsp/am335x-cm3/am33x-cm3_git.bbappend
deleted file mode 100644
index 826f250..0000000
--- a/meta-arago-distro/recipes-bsp/am335x-cm3/am33x-cm3_git.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-PR_append = "-arago1"
-
-PV = "05.06.00.00"
-
-BRANCH = "master"
-
-#This SRCREV corresponds to tag AM335xPSP_04.06.00.09-rc
-SRCREV = "7c6075f28d9fdd633175cdbd8dc287613ce92e5d"
-- 
1.7.0.4


