Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 3AC30529AA
	for <meta-arago@arago-project.org>;
	Wed, 10 Aug 2016 19:44:13 +0000 (UTC)
Received: from vz-proxy-m003.mx.aol.com ([64.236.83.2])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OBP00AGNLH66B70@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 10 Aug 2016 14:44:00 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=EDCZS3Slg7tGr17y9w9vtg==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=UnlzRPJZ_KHurPqH_dsA:9
Received: by 100.15.86.14 with SMTP id 59904f76; Wed, 10 Aug 2016 19:44:00 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 82F9E1620E7;	Wed, 10 Aug 2016 15:43:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 10 Aug 2016 15:43:52 -0400
Message-id: <1470858232-3586-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-reply-to: <1470858232-3586-1-git-send-email-denis@denix.org>
References: <1470858232-3586-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/3] images: clean up old use of ROOTFS_SIZE for initrd/ext images
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
X-List-Received-Date: Wed, 10 Aug 2016 19:44:13 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-base-image.bb  |  3 ---
 .../recipes-core/images/arago-console-image.bb             | 14 --------------
 2 files changed, 17 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-base-image.bb b/meta-arago-distro/recipes-core/images/arago-base-image.bb
index 5d88872..57ca93a 100644
--- a/meta-arago-distro/recipes-core/images/arago-base-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-base-image.bb
@@ -3,9 +3,6 @@
 
 require arago-image.inc
 
-# The size of the uncompressed ramdisk is 8MB
-ROOTFS_SIZE = "10240"
-
 IMAGE_INSTALL += "packagegroup-arago-base"
 
 export IMAGE_BASENAME = "arago-base-image"
diff --git a/meta-arago-distro/recipes-core/images/arago-console-image.bb b/meta-arago-distro/recipes-core/images/arago-console-image.bb
index cb8b1cc..b455b2e 100644
--- a/meta-arago-distro/recipes-core/images/arago-console-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-console-image.bb
@@ -5,20 +5,6 @@ require arago-image.inc
 
 COMPATIBLE_MACHINE = "(?!arago)"
 
-# The size of the uncompressed ramdisk is 32MB
-ROOTFS_SIZE = "32768"
-
-# DM646x have many modules, bump to 40MB
-ROOTFS_SIZE_dm6467 = "40960"
-
-# AM3517 have many modules, bump to 64MB
-ROOTFS_SIZE_am3517-evm = "65536"
-
-# Double beagle/hawk/overo ramdisk size, due to gazillions of kernel modules
-ROOTFS_SIZE_beagleboard = "81920"
-ROOTFS_SIZE_hawkboard = "81920"
-ROOTFS_SIZE_overo = "81920"
-
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
     packagegroup-arago-console \
-- 
2.7.4


