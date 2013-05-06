Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6924B52981
	for <meta-arago@arago-project.org>;
	Mon,  6 May 2013 22:15:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r46MF19a020525
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 17:15:01 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r46MF1lx025996
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 17:15:01 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 6 May 2013 17:15:01 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r46MEwu4014924;
	Mon, 6 May 2013 17:14:59 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 6 May 2013 17:14:54 -0500
Message-ID: <1367878495-17492-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/2] linux-am335x: Update variables for sourceipk
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
X-List-Received-Date: Mon, 06 May 2013 22:15:04 -0000
Content-Type: text/plain

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../linux/linux-am335x-psp_3.2.bbappend            |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-psp_3.2.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-am335x-psp_3.2.bbappend
index 3c02ca6..701666f 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-am335x-psp_3.2.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-psp_3.2.bbappend
@@ -1,6 +1,6 @@
-PR_append = "-arago3"
+PR_append = "-arago4"
 
 # KVER is used by arago-source-ipk.conf
-KVER = "${PV}"
+KVER = "3.2.0-psp04.06.00.10"
 
 require copy-defconfig.inc
-- 
1.7.0.4


