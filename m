Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id D845552A23
	for <meta-arago@arago-project.org>;
	Thu, 29 Jan 2015 14:31:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0TEVTac023129
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 08:31:29 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0TEVSjj006733
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 08:31:28 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 29 Jan 2015 08:31:28 -0600
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0TEVQ53018082;
	Thu, 29 Jan 2015 08:31:27 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 29 Jan 2015 20:01:25 +0530
Message-ID: <1422541885-5800-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [RFC PATCH] base-files: Increase /var/volatile size
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
X-List-Received-Date: Thu, 29 Jan 2015 14:31:32 -0000
Content-Type: text/plain

* Weston applications allocate memory from tmpfs, need to 
  increase the tmpfs area to atleast 50M. Can this be 
  increased more - what are the pros/cons?

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-core/base-files/base-files/fstab       |    2 +-
 .../base-files/base-files_3.0.14.bbappend          |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/base-files/base-files/fstab b/meta-arago-distro/recipes-core/base-files/base-files/fstab
index 9ed6f33..8ddadd9 100644
--- a/meta-arago-distro/recipes-core/base-files/base-files/fstab
+++ b/meta-arago-distro/recipes-core/base-files/base-files/fstab
@@ -5,7 +5,7 @@ proc                 /proc                proc       defaults              0  0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
 usbdevfs             /proc/bus/usb        usbdevfs   noauto                0  0
 tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0
-tmpfs                /var/volatile        tmpfs      defaults,size=16M     0  0
+tmpfs                /var/volatile        tmpfs      defaults,size=50M     0  0
 tmpfs                /media/ram           tmpfs      defaults,size=16M     0  0
 
 # uncomment this if your device has a SD/MMC/Transflash slot
diff --git a/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend b/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
index 40b7722..956a057 100644
--- a/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
+++ b/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
@@ -1,4 +1,4 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago3"
+PR_append = "-arago4"
-- 
1.7.9.5


