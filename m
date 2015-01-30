Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 213AE529B3
	for <meta-arago@arago-project.org>;
	Fri, 30 Jan 2015 22:31:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0UMVlwD021657
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 16:31:47 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0UMVkTl006958
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 16:31:46 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 30 Jan 2015 16:31:46 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0UMVjVh008237;	Fri, 30 Jan 2015 16:31:45 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t0UMVf1n007326;	Sat, 31 Jan 2015 04:01:43 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 30 Jan 2015 16:31:35 -0600
Message-ID: <1422657099-15544-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1422657099-15544-1-git-send-email-fcooper@ti.com>
References: <1422657099-15544-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/6] busybox: Add mpstat utility which is useful for multicore devices.
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
X-List-Received-Date: Fri, 30 Jan 2015 22:31:48 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/busybox/busybox/defconfig         |    2 +-
 .../recipes-core/busybox/busybox_1.22.1.bbappend   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
index 69d7e5f..173a9c8 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
@@ -877,7 +877,7 @@ CONFIG_FEATURE_MIME_CHARSET=""
 # Process Utilities
 #
 # CONFIG_IOSTAT is not set
-# CONFIG_MPSTAT is not set
+CONFIG_MPSTAT=y
 # CONFIG_NMETER is not set
 # CONFIG_PMAP is not set
 # CONFIG_POWERTOP is not set
diff --git a/meta-arago-distro/recipes-core/busybox/busybox_1.22.1.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_1.22.1.bbappend
index 0f49e64..a01a880 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox_1.22.1.bbappend
+++ b/meta-arago-distro/recipes-core/busybox/busybox_1.22.1.bbappend
@@ -1,7 +1,7 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago13"
+PR_append = "-arago14"
 
 SRC_URI += " \
 	file://inetd \
-- 
1.7.9.5


