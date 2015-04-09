Return-Path: <a0866934local@udb0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 1A266529A9
	for <meta-arago@arago-project.org>;
	Thu,  9 Apr 2015 14:53:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t39ErJgX026872
	for <meta-arago@arago-project.org>; Thu, 9 Apr 2015 09:53:19 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t39ErIDj029655
	for <meta-arago@arago-project.org>; Thu, 9 Apr 2015 09:53:18 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 9 Apr 2015 09:53:17 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t39ErHFp029537;
	Thu, 9 Apr 2015 09:53:17 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YgDpV-0006cI-8K;
	Thu, 09 Apr 2015 10:53:17 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 9 Apr 2015 10:53:11 -0400
Message-ID: <1428591191-25404-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH] create-sdcard: Fix issue when root is not mounted on /dev/sda.
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
X-List-Received-Date: Thu, 09 Apr 2015 14:53:20 -0000
Content-Type: text/plain

* The drive from which the rootfs is mounted is correctly filtered out
  when giving the sd card device options, but this is ignored when
  actually setting up the sd card.
* This can cause the users option to point to the incorrect device.
* This filters out the auto-detected root drive from all operations.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 create-sdcard.sh |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index ca02ad2..018487a 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -298,11 +298,11 @@ do
                continue
         fi
 
-	DEVICEDRIVENAME=`cat /proc/partitions | grep -v 'sda' | grep '\<sd.\>\|\<mmcblk.\>' | grep -n '' | grep "${DEVICEDRIVENUMBER}:" | awk '{print $5}'`
+	DEVICEDRIVENAME=`cat /proc/partitions | grep -v $ROOTDRIVE | grep '\<sd.\>\|\<mmcblk.\>' | grep -n '' | grep "${DEVICEDRIVENUMBER}:" | awk '{print $5}'`
 	if [ -n "$DEVICEDRIVENAME" ]
 	then
 	        DRIVE=/dev/$DEVICEDRIVENAME
-	        DEVICESIZE=`cat /proc/partitions | grep -v 'sda' | grep '\<sd.\>\|\<mmcblk.\>' | grep -n '' | grep "${DEVICEDRIVENUMBER}:" | awk '{print $4}'`
+	        DEVICESIZE=`cat /proc/partitions | grep -v $ROOTDRIVE | grep '\<sd.\>\|\<mmcblk.\>' | grep -n '' | grep "${DEVICEDRIVENUMBER}:" | awk '{print $4}'`
 		break
 	else
 		echo -e "Invalid selection!"
@@ -379,17 +379,17 @@ fi
 
 # Refresh this variable as the device may not be mounted at script instantiation time
 # This will always return one more then needed
-NUM_OF_PARTS=`cat /proc/partitions | grep -v 'sda' | grep -c $DEVICEDRIVENAME`
+NUM_OF_PARTS=`cat /proc/partitions | grep -v $ROOTDRIVE | grep -c $DEVICEDRIVENAME`
 for ((c=1; c<"$NUM_OF_PARTS"; c++ ))
 do
-        SIZE=`cat /proc/partitions | grep -v 'sda' | grep '\<'$DEVICEDRIVENAME$P$c'\>'  | awk '{print $3}'`
+        SIZE=`cat /proc/partitions | grep -v $ROOTDRIVE | grep '\<'$DEVICEDRIVENAME$P$c'\>'  | awk '{print $3}'`
         echo "Current size of $DEVICEDRIVENAME$P$c $SIZE bytes"
 done
 
 # check to see if the device is already partitioned
 for ((  c=1; c<5; c++ ))
 do
-	eval "SIZE$c=`cat /proc/partitions | grep -v 'sda' | grep '\<'$DEVICEDRIVENAME$P$c'\>'  | awk '{print $3}'`"
+	eval "SIZE$c=`cat /proc/partitions | grep -v $ROOTDRIVE | grep '\<'$DEVICEDRIVENAME$P$c'\>'  | awk '{print $3}'`"
 done
 
 PARTITION="0"
-- 
1.7.9.5


