Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D7C5D52AB0
	for <meta-arago@arago-project.org>;
	Thu, 23 Jun 2016 12:52:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5NCpWHZ009981
	for <meta-arago@arago-project.org>; Thu, 23 Jun 2016 07:51:32 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5NCqKbm008078
	for <meta-arago@arago-project.org>; Thu, 23 Jun 2016 07:52:20 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 23 Jun 2016 07:52:20 -0500
Received: from swubn04.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5NCqI16017269;
	Thu, 23 Jun 2016 07:52:19 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 23 Jun 2016 18:21:30 +0530
Message-ID: <1466686290-6465-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] weston: Add minor fix for soc performance monitor
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
X-List-Received-Date: Thu, 23 Jun 2016 12:52:21 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../wayland/weston/0001-Add-soc-performance-monitor-utilites.patch   | 5 +++--
 meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend     | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Add-soc-performance-monitor-utilites.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Add-soc-performance-monitor-utilites.patch
index 9da541c..751a7ce 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Add-soc-performance-monitor-utilites.patch
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Add-soc-performance-monitor-utilites.patch
@@ -7,7 +7,7 @@ Signed-off-by: Karthik Ramanan <a0393906@ti.com>
 ---
  Makefile.am                       |   17 +-
  clients/Dra7xx_ddrstat_speed.c    |  494 +++++++++++++
- clients/soc_performance_monitor.c |  624 ++++++++++++++++
+ clients/soc_performance_monitor.c |  625 ++++++++++++++++
  clients/soc_performance_monitor.h |   40 ++
  clients/statcoll.c                | 1433 +++++++++++++++++++++++++++++++++++++
  clients/statcoll.h                |  152 ++++
@@ -564,7 +564,7 @@ new file mode 100644
 index 0000000..5d1db32
 --- /dev/null
 +++ b/clients/soc_performance_monitor.c
-@@ -0,0 +1,624 @@
+@@ -0,0 +1,625 @@
 +/*
 + * Copyright (C) 2016 Texas Instruments
 + * Author: Karthik Ramanan <karthik.ramanan@ti.com>
@@ -640,6 +640,7 @@ index 0000000..5d1db32
 +
 +			/* open, read, and display the message from the FIFO */
 +			bytes=read(fd, buf, MAX_BUF);
++                       buf[bytes]='\0';
 +			if(bytes > 0) 
 +			{
 +				char command[100];
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
index 4c8bd20..0a3e223 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
@@ -2,7 +2,7 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = ".arago10"
+PR_append = ".arago11"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-- 
1.9.1


