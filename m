Return-Path: <a0850405@a0850405-off1>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id BE08B52A5C
	for <meta-arago@arago-project.org>;
	Fri,  9 Aug 2013 14:25:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r79EPnbb019021
	for <meta-arago@arago-project.org>; Fri, 9 Aug 2013 09:25:49 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r79EPn0i023542
	for <meta-arago@arago-project.org>; Fri, 9 Aug 2013 09:25:49 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 9 Aug 2013 09:25:48 -0500
Received: from a0850405-off1 (a0850405-off1.am.dhcp.ti.com [158.218.103.10])
	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r79EPndf032144;
	Fri, 9 Aug 2013 09:25:49 -0500
Received: from a0850405 by a0850405-off1 with local (Exim 4.76)	(envelope-from
	<a0850405@a0850405-off1>)	id 1V7ndU-0008JU-JS;
	Fri, 09 Aug 2013 10:25:48 -0400
From: Carlos Hernandez <ceh@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 9 Aug 2013 10:25:36 -0400
Message-ID: <1376058336-31921-1-git-send-email-ceh@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Yan Liu <yan-liu@ti.com>
Subject: [PATCH] busybox: Enable timeout command
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
X-List-Received-Date: Fri, 09 Aug 2013 14:25:51 -0000
Content-Type: text/plain

Signed-off-by: Yan Liu <yan-liu@ti.com>
Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 .../recipes-core/busybox/busybox/defconfig         |    2 +-
 .../recipes-core/busybox/busybox_1.20.2.bbappend   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
index 16ebdf0..5961447 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
@@ -705,7 +705,7 @@ CONFIG_STRINGS=y
 # CONFIG_TASKSET is not set
 # CONFIG_FEATURE_TASKSET_FANCY is not set
 CONFIG_TIME=y
-# CONFIG_TIMEOUT is not set
+CONFIG_TIMEOUT=y
 # CONFIG_TTYSIZE is not set
 # CONFIG_VOLNAME is not set
 # CONFIG_WALL is not set
diff --git a/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend
index 4cf7821..8edb493 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend
+++ b/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend
@@ -1,7 +1,7 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago7"
+PR_append = "-arago8"
 
 SRC_URI += " \
 	file://inetd \
-- 
1.7.9.5


