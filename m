Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D7CCE5298F
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 22:45:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0UMj53O012051
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 16:45:05 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UMj55c000361
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 16:45:05 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 30 Jan 2014 16:45:04 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UMj14M016751;
	Thu, 30 Jan 2014 16:45:03 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Jan 2014 18:11:33 -0600
Message-ID: <1391127094-6758-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/2] busybox: Enable nice and bridge control utility
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
X-List-Received-Date: Thu, 30 Jan 2014 22:45:06 -0000
Content-Type: text/plain

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/busybox/busybox/defconfig         |    8 ++++----
 .../recipes-core/busybox/busybox_1.20.2.bbappend   |    2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
index a54c32d..d8d1658 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
@@ -241,7 +241,7 @@ CONFIG_MKFIFO=y
 CONFIG_MKNOD=y
 CONFIG_MV=y
 # CONFIG_FEATURE_MV_LONG_OPTIONS is not set
-# CONFIG_NICE is not set
+CONFIG_NICE=y
 CONFIG_NOHUP=y
 CONFIG_OD=y
 # CONFIG_PRINTENV is not set
@@ -731,9 +731,9 @@ CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
 # CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
 # CONFIG_ARP is not set
 # CONFIG_ARPING is not set
-# CONFIG_BRCTL is not set
-# CONFIG_FEATURE_BRCTL_FANCY is not set
-# CONFIG_FEATURE_BRCTL_SHOW is not set
+CONFIG_BRCTL=y
+CONFIG_FEATURE_BRCTL_FANCY=y
+CONFIG_FEATURE_BRCTL_SHOW=y
 # CONFIG_DNSD is not set
 # CONFIG_ETHER_WAKE is not set
 # CONFIG_FAKEIDENTD is not set
diff --git a/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend
index d3ff409..76d1300 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend
+++ b/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend
@@ -1,7 +1,7 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago10"
+PR_append = "-arago11"
 
 SRC_URI += " \
 	file://inetd \
-- 
1.7.0.4


