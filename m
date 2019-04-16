Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 0579352A2B
	for <meta-arago@arago-project.org>;
	Tue, 16 Apr 2019 18:46:11 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3GIjo8j115502
	for <meta-arago@arago-project.org>; Tue, 16 Apr 2019 13:45:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1555440350;
	bh=zNydwjPLRrNmQW0htcMDqMXL5QHiRKZvQW+ZqgbWfbc=;
	h=From:To:CC:Subject:Date;
	b=PFeOIc1uj4n3Y9rrfP4lvdPxRlHs8yPcitrk+P9d+NjUVTkYx1l9YWvJM0VIHIZD9
	Z05paxwT80yIc+kAvvhW/48+35g6m7ItITY7mpt2wQI9rIs9zyUkWo58nEyNxPVaom
	JYGHWAvyzq7eKj3lfDBTnwxOrZohTe20EQvYDqyE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3GIjo54072973
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 16 Apr 2019 13:45:50 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 16 Apr 2019 13:45:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 16 Apr 2019 13:45:49 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3GIjnKa130722;
	Tue, 16 Apr 2019 13:45:49 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 16 Apr 2019 14:33:38 -0400
Message-ID: <1555439618-14087-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] weston: make bbappend version agnostic
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
X-List-Received-Date: Tue, 16 Apr 2019 18:46:12 -0000
Content-Type: text/plain

* rebase patch against weston 5.0.0

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../0001-Add-soc-performance-monitor-utilites.patch    | 18 +++++++++---------
 .../{weston_2.0.0.bbappend => weston_%.bbappend}       |  0
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename recipes-graphics/wayland/{weston_2.0.0.bbappend => weston_%.bbappend} (100%)

diff --git a/recipes-graphics/wayland/weston/0001-Add-soc-performance-monitor-utilites.patch b/recipes-graphics/wayland/weston/0001-Add-soc-performance-monitor-utilites.patch
index 0eafbfc..013209e 100644
--- a/recipes-graphics/wayland/weston/0001-Add-soc-performance-monitor-utilites.patch
+++ b/recipes-graphics/wayland/weston/0001-Add-soc-performance-monitor-utilites.patch
@@ -1,4 +1,4 @@
-From 7830118ecb980766f4a6e3997769d7ae326bee77 Mon Sep 17 00:00:00 2001
+From 8b47050702b51cc335ff69c6f5c42f3ae760758a Mon Sep 17 00:00:00 2001
 From: Karthik Ramanan <a0393906@ti.com>
 Date: Fri, 3 Jun 2016 18:32:50 +0530
 Subject: [PATCH] Add soc performance monitor utilites
@@ -14,7 +14,7 @@ Signed-off-by: Karthik Ramanan <a0393906@ti.com>
  clients/statcoll_gui.h            |  101 +++
  clients/time_bar_graph.c          |  515 +++++++++++++
  clients/time_bar_graph.h          |   93 +++
- 10 files changed, 4873 insertions(+), 1 deletion(-)
+ 9 files changed, 3474 insertions(+), 1 deletion(-)
  create mode 100644 clients/Dra7xx_ddrstat_speed.c
  create mode 100644 clients/soc_performance_monitor.c
  create mode 100644 clients/soc_performance_monitor.h
@@ -25,13 +25,13 @@ Signed-off-by: Karthik Ramanan <a0393906@ti.com>
  create mode 100644 clients/time_bar_graph.h
 
 diff --git a/Makefile.am b/Makefile.am
-index 62719c9..55aed6d 100644
+index 83bb253..7b4048f 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -432,7 +432,9 @@ demo_clients =					\
- 	weston-fullscreen			\
+@@ -545,7 +545,9 @@ demo_clients =					\
  	weston-stacking				\
  	weston-calibrator			\
+ 	weston-touch-calibrator			\
 -	weston-scaler
 +	weston-scaler				\
 +	soc-performance-monitor			\
@@ -39,7 +39,7 @@ index 62719c9..55aed6d 100644
  
  if INSTALL_DEMO_CLIENTS
  bin_PROGRAMS += $(demo_clients)
-@@ -570,6 +572,19 @@ weston_image_SOURCES = clients/image.c
+@@ -702,6 +704,19 @@ weston_image_SOURCES = clients/image.c
  weston_image_LDADD = libtoytoolkit.la
  weston_image_CFLAGS = $(AM_CFLAGS) $(CLIENT_CFLAGS)
  
@@ -58,7 +58,7 @@ index 62719c9..55aed6d 100644
 +
  weston_cliptest_SOURCES =				\
  	clients/cliptest.c				\
- 	src/vertex-clipping.c				\
+ 	libweston/vertex-clipping.c			\
 diff --git a/clients/Dra7xx_ddrstat_speed.c b/clients/Dra7xx_ddrstat_speed.c
 new file mode 100644
 index 0000000..af06733
@@ -561,7 +561,7 @@ index 0000000..af06733
 +
 diff --git a/clients/soc_performance_monitor.c b/clients/soc_performance_monitor.c
 new file mode 100644
-index 0000000..5d1db32
+index 0000000..2721059
 --- /dev/null
 +++ b/clients/soc_performance_monitor.c
 @@ -0,0 +1,630 @@
@@ -3566,5 +3566,5 @@ index 0000000..97ac05a
 +
 +#endif /* _BAR_GRAPH_H_ */
 -- 
-1.9.1
+2.7.4
 
diff --git a/recipes-graphics/wayland/weston_2.0.0.bbappend b/recipes-graphics/wayland/weston_%.bbappend
similarity index 100%
rename from recipes-graphics/wayland/weston_2.0.0.bbappend
rename to recipes-graphics/wayland/weston_%.bbappend
-- 
2.7.4


