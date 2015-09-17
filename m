Return-Path: <jake@udc0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 4A1F9529FB
	for <meta-arago@arago-project.org>;
	Thu, 17 Sep 2015 16:21:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8HGL8Ow004252
	for <meta-arago@arago-project.org>; Thu, 17 Sep 2015 11:21:08 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8HGL8U7015406
	for <meta-arago@arago-project.org>; Thu, 17 Sep 2015 11:21:08 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 17 Sep 2015 11:21:08 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8HGL7bu007558;
	Thu, 17 Sep 2015 11:21:07 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1Zcbvn-0000ok-89; Thu, 17 Sep 2015 12:21:07 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 17 Sep 2015 12:21:05 -0400
Message-ID: <1442506865-3108-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH] create-sdcard: Remove packaging of CCS.
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
X-List-Received-Date: Thu, 17 Sep 2015 16:21:10 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 create-sdcard.sh | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index 4138dfb..c877da7 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -228,17 +228,6 @@ EOM
 cat << EOM
 
 ################################################################################
-        Extracting CCS tarball
-
-################################################################################
-EOM
-        mv tmp/CCS-5*.tar.gz .
-        untar_progress CCS-5*.tar.gz tmp/
-        rm CCS-5*.tar.gz
-
-cat << EOM
-
-################################################################################
         Copying Contents to START_HERE
 
 ################################################################################
@@ -251,7 +240,6 @@ EOM
         # Fix up the START_HERE partitoin permissions
         chown nobody -R start_here
         chgrp nogroup -R start_here
-        chmod -R g+r+x,o+r+x start_here/CCS
 
         umount boot rootfs start_here
         sync;sync
@@ -459,9 +447,9 @@ cat << EOM
 
 ################################################################################
 
-	Select 2 partitions if only need boot and rootfs (most users)
-	Select 3 partitions if need SDK & CCS on SD card.  This is usually used
-        by device manufacturers with access to partition tarballs.
+	Select 2 partitions if only need boot and rootfs (most users).
+	Select 3 partitions if need SDK & other content on SD card.  This is
+        usually used by device manufacturers with access to partition tarballs.
 
 	****WARNING**** continuing will erase all data on $DEVICEDRIVENAME
 
-- 
1.9.1


