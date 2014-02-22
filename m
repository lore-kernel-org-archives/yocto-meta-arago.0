Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 3D8E652972
	for <meta-arago@arago-project.org>;
	Sat, 22 Feb 2014 00:18:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1M0I4Lm013446
	for <meta-arago@arago-project.org>; Fri, 21 Feb 2014 18:18:04 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1M0I484006822
	for <meta-arago@arago-project.org>; Fri, 21 Feb 2014 18:18:04 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 21 Feb 2014 18:18:04 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1M0I13f010724;
	Fri, 21 Feb 2014 18:18:02 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 21 Feb 2014 18:17:55 -0600
Message-ID: <1393028277-20051-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/3] busybox: Add TFTP Blocksize option
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
X-List-Received-Date: Sat, 22 Feb 2014 00:18:05 -0000
Content-Type: text/plain

* Add option to tftp which is needed by the flash tool.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/busybox/busybox/defconfig         |    2 +-
 .../recipes-core/busybox/busybox_1.20.2.bbappend   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
index d8d1658..6682328 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
@@ -821,7 +821,7 @@ CONFIG_TFTPD=y
 #
 CONFIG_FEATURE_TFTP_GET=y
 CONFIG_FEATURE_TFTP_PUT=y
-# CONFIG_FEATURE_TFTP_BLOCKSIZE is not set
+CONFIG_FEATURE_TFTP_BLOCKSIZE=y
 # CONFIG_FEATURE_TFTP_PROGRESS_BAR is not set
 # CONFIG_TFTP_DEBUG is not set
 CONFIG_TRACEROUTE=y
diff --git a/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend
index 76d1300..bc8c837 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend
+++ b/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend
@@ -1,7 +1,7 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago11"
+PR_append = "-arago12"
 
 SRC_URI += " \
 	file://inetd \
-- 
1.7.0.4


