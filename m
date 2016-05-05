Return-Path: <jake@udc0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B17DE52A7D
	for <meta-arago@arago-project.org>;
	Thu,  5 May 2016 20:56:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u45KuTgS002758
	for <meta-arago@arago-project.org>; Thu, 5 May 2016 15:56:29 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u45KuTx0017154
	for <meta-arago@arago-project.org>; Thu, 5 May 2016 15:56:29 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 May 2016 15:56:28 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u45KuSAp017834;
	Thu, 5 May 2016 15:56:29 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ayQJv-0004k0-O1; Thu, 05 May 2016 16:56:27 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 5 May 2016 16:56:26 -0400
Message-ID: <1462481786-18182-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH v2] create-sdcard: use parted instead of sfdisk
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
X-List-Received-Date: Thu, 05 May 2016 20:56:30 -0000
Content-Type: text/plain

* The options for sfdisk have changed since version 2.26
* Ubuntu 16.04 contains sfdisk version 2.27.1 while older Ubuntu
  versions contain sfdisk versions prior to 2.26
* In order to retain compatibility from Ubuntu 12.04 through 16.04,
  use parted instead.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* Fix incomplete sentences in commit message

 create-sdcard.sh | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index 46ed5ae..edf57b0 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -501,13 +501,12 @@ SIZE=`fdisk -l $DRIVE | grep Disk | awk '{print $5}'`
 
 echo DISK SIZE - $SIZE bytes
 
-CYLINDERS=`echo $SIZE/255/63/512 | bc`
+parted -s $DRIVE mklabel msdos
+parted -s $DRIVE unit cyl mkpart primary fat32 -- 0 9
+parted -s $DRIVE set 1 boot on
+parted -s $DRIVE unit cyl mkpart primary ext2 -- 9 310
+parted -s $DRIVE unit cyl mkpart primary ext2 -- 310 -2
 
-sfdisk -D -H 255 -S 63 -C $CYLINDERS $DRIVE << EOF
-,9,0x0C,*
-10,300,,-
-310,,,-
-EOF
 
 cat << EOM
 
@@ -560,12 +559,10 @@ SIZE=`fdisk -l $DRIVE | grep Disk | awk '{print $5}'`
 
 echo DISK SIZE - $SIZE bytes
 
-CYLINDERS=`echo $SIZE/255/63/512 | bc`
-
-sfdisk -D -H 255 -S 63 -C $CYLINDERS $DRIVE << EOF
-,9,0x0C,*
-10,,,-
-EOF
+parted -s $DRIVE mklabel msdos
+parted -s $DRIVE unit cyl mkpart primary fat32 -- 0 9
+parted -s $DRIVE set 1 boot on
+parted -s $DRIVE unit cyl mkpart primary ext2 -- 9 -2
 
 cat << EOM
 
-- 
1.9.1


