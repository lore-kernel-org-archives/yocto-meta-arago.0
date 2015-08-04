Return-Path: <jake@udc0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 3719C52991
	for <meta-arago@arago-project.org>;
	Tue,  4 Aug 2015 16:13:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t74GDB54019852
	for <meta-arago@arago-project.org>; Tue, 4 Aug 2015 11:13:11 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74GDB0p028880
	for <meta-arago@arago-project.org>; Tue, 4 Aug 2015 11:13:11 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 4 Aug 2015 11:13:10 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74GDAsQ028790;
	Tue, 4 Aug 2015 11:13:10 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZMepy-0005Zd-DK; Tue, 04 Aug 2015 12:13:10 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Aug 2015 12:13:03 -0400
Message-ID: <1438704785-21392-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH 1/3] create-sdcard: Increase rootfs size when creating 3 partition
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
X-List-Received-Date: Tue, 04 Aug 2015 16:13:14 -0000
Content-Type: text/plain

* And fix minor misspelling

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 create-sdcard.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index 018487a..4138dfb 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -274,7 +274,7 @@ PARTITION_TEST=`cat /proc/partitions | grep -v $ROOTDRIVE | grep '\<sd.\>\|\<mmc
 # Check for available mounts
 check_for_sdcards
 
-echo -e "\nAvailible Drives to write images to: \n"
+echo -e "\nAvailable Drives to write images to: \n"
 echo "#  major   minor    size   name "
 cat /proc/partitions | grep -v $ROOTDRIVE | grep '\<sd.\>\|\<mmcblk.\>' | grep -n ''
 echo " "
@@ -517,8 +517,8 @@ CYLINDERS=`echo $SIZE/255/63/512 | bc`
 
 sfdisk -D -H 255 -S 63 -C $CYLINDERS $DRIVE << EOF
 ,9,0x0C,*
-10,90,,-
-100,,,-
+10,300,,-
+310,,,-
 EOF
 
 cat << EOM
-- 
1.9.1


