Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id 5D60152975
	for <meta-arago@arago-project.org>;
	Wed, 14 Sep 2016 04:46:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8E4kGxV019165
	for <meta-arago@arago-project.org>; Tue, 13 Sep 2016 23:46:17 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8E4kGks021441
	for <meta-arago@arago-project.org>; Tue, 13 Sep 2016 23:46:16 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 13 Sep 2016 23:46:16 -0500
Received: from swubn04.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8E4kEZq019689;
	Tue, 13 Sep 2016 23:46:15 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 14 Sep 2016 10:13:52 +0530
Message-ID: <1473828232-25247-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [krogoth] weston: soc-performance-monitor, fix for text entries
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
X-List-Received-Date: Wed, 14 Sep 2016 04:46:18 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../0001-Add-soc-performance-monitor-utilites.patch       | 15 ++++++++++-----
 .../recipes-graphics/wayland/weston_1.9.0.bbappend        |  2 +-
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Add-soc-performance-monitor-utilites.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Add-soc-performance-monitor-utilites.patch
index 751a7ce..4268b7d 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Add-soc-performance-monitor-utilites.patch
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Add-soc-performance-monitor-utilites.patch
@@ -7,7 +7,7 @@ Signed-off-by: Karthik Ramanan <a0393906@ti.com>
 ---
  Makefile.am                       |   17 +-
  clients/Dra7xx_ddrstat_speed.c    |  494 +++++++++++++
- clients/soc_performance_monitor.c |  625 ++++++++++++++++
+ clients/soc_performance_monitor.c |  630 ++++++++++++++++
  clients/soc_performance_monitor.h |   40 ++
  clients/statcoll.c                | 1433 +++++++++++++++++++++++++++++++++++++
  clients/statcoll.h                |  152 ++++
@@ -564,7 +564,7 @@ new file mode 100644
 index 0000000..5d1db32
 --- /dev/null
 +++ b/clients/soc_performance_monitor.c
-@@ -0,0 +1,625 @@
+@@ -0,0 +1,630 @@
 +/*
 + * Copyright (C) 2016 Texas Instruments
 + * Author: Karthik Ramanan <karthik.ramanan@ti.com>
@@ -666,9 +666,14 @@ index 0000000..5d1db32
 +
 +					for(i=cpu_load_offset; i<cpu_load_offset+total_cpu_load_items; i++) {
 +						if(strcmp(text[i*2], field) == 0) {
-+							y[i*2+1] = atoi(value)/100.0;
-+							sprintf(text[i*2+1], " %02s%s", value,"%");
-+							printd("CPULOAD: Updating %s with %s\n", field, value);
++							if(strlen(value) <= 2) {
++								y[i*2+1] = atoi(value)/100.0;
++								sprintf(text[i*2+1], " %02s%s", value,"%");
++								printd("CPULOAD: Updating %s with %s\n", field, value);
++							}
++							else {
++								printf("Ignoring value: %s\n", value);
++							}
 +						}
 +					}
 +				}
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
index 0a3e223..6b00ae0 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
@@ -2,7 +2,7 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = ".arago11"
+PR_append = ".arago14"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-- 
1.9.1


