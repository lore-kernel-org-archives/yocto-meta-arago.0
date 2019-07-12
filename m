Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id C171B52092
	for <meta-arago@arago-project.org>;
	Fri, 12 Jul 2019 21:43:40 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6CLgqXZ067867
	for <meta-arago@arago-project.org>; Fri, 12 Jul 2019 16:42:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562967772;
	bh=MkbKh99dEPfzlsrCRm84IovyJz3ix1EH1ANoEE1Med0=;
	h=From:To:Subject:Date;
	b=JUAfjcrsR9PMUi7pohT4jeAiKZycpBDf+I43uLDLNsOD0AokblHKpaloPZNL2wPko
	McgC46gKqIkFbya5NsosxU4KH5j8VXX87DakHEAUT8e2jUuRQsQm7BHsTXDzPVKiPm
	6wj6qbJzPcHR0VwpfjsnRmClhG7q6oprRX5VupkQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6CLgq8M116848
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 12 Jul 2019 16:42:52 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 12 Jul 2019 16:42:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 12 Jul 2019 16:42:52 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6CLgpC0029151
	for <meta-arago@arago-project.org>; Fri, 12 Jul 2019 16:42:52 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 12 Jul 2019 17:41:52 -0400
Message-ID: <20190712214152.3010-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] weston: re-enable support of soc performance monitor
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
X-List-Received-Date: Fri, 12 Jul 2019 21:43:41 -0000
Content-Type: text/plain

- rebase and enable the patch of adding soc performance monitor for
  weston 5.0.0


Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...Add-soc-performance-monitor-utilites.patch | 55 ++++++++++---------
 ...n_2.0.0.bbappend => weston_5.0.0.bbappend} |  0
 2 files changed, 28 insertions(+), 27 deletions(-)
 rename recipes-graphics/wayland/{weston_2.0.0.bbappend => weston_5.0.0.bbappend} (100%)

diff --git a/recipes-graphics/wayland/weston/0001-Add-soc-performance-monitor-utilites.patch b/recipes-graphics/wayland/weston/0001-Add-soc-performance-monitor-utilites.patch
index 0eafbfc..623c1bb 100644
--- a/recipes-graphics/wayland/weston/0001-Add-soc-performance-monitor-utilites.patch
+++ b/recipes-graphics/wayland/weston/0001-Add-soc-performance-monitor-utilites.patch
@@ -1,20 +1,21 @@
-From 7830118ecb980766f4a6e3997769d7ae326bee77 Mon Sep 17 00:00:00 2001
+From e00a9d4a3c535997a37429ef00b13b58d696ffd0 Mon Sep 17 00:00:00 2001
 From: Karthik Ramanan <a0393906@ti.com>
 Date: Fri, 3 Jun 2016 18:32:50 +0530
 Subject: [PATCH] Add soc performance monitor utilites
 
 Signed-off-by: Karthik Ramanan <a0393906@ti.com>
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
 ---
  Makefile.am                       |   17 +-
- clients/Dra7xx_ddrstat_speed.c    |  494 +++++++++++++
- clients/soc_performance_monitor.c |  630 ++++++++++++++++
- clients/soc_performance_monitor.h |   40 ++
- clients/statcoll.c                | 1433 +++++++++++++++++++++++++++++++++++++
- clients/statcoll.h                |  152 ++++
- clients/statcoll_gui.h            |  101 +++
- clients/time_bar_graph.c          |  515 +++++++++++++
- clients/time_bar_graph.h          |   93 +++
- 10 files changed, 4873 insertions(+), 1 deletion(-)
+ clients/Dra7xx_ddrstat_speed.c    |  494 ++++++++++
+ clients/soc_performance_monitor.c |  630 +++++++++++++
+ clients/soc_performance_monitor.h |   40 +
+ clients/statcoll.c                | 1433 +++++++++++++++++++++++++++++
+ clients/statcoll.h                |  152 +++
+ clients/statcoll_gui.h            |  101 ++
+ clients/time_bar_graph.c          |  515 +++++++++++
+ clients/time_bar_graph.h          |   93 ++
+ 9 files changed, 3474 insertions(+), 1 deletion(-)
  create mode 100644 clients/Dra7xx_ddrstat_speed.c
  create mode 100644 clients/soc_performance_monitor.c
  create mode 100644 clients/soc_performance_monitor.h
@@ -25,13 +26,13 @@ Signed-off-by: Karthik Ramanan <a0393906@ti.com>
  create mode 100644 clients/time_bar_graph.h
 
 diff --git a/Makefile.am b/Makefile.am
-index 62719c9..55aed6d 100644
+index 83bb2533..7b4048fb 100644
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
@@ -39,7 +40,7 @@ index 62719c9..55aed6d 100644
  
  if INSTALL_DEMO_CLIENTS
  bin_PROGRAMS += $(demo_clients)
-@@ -570,6 +572,19 @@ weston_image_SOURCES = clients/image.c
+@@ -702,6 +704,19 @@ weston_image_SOURCES = clients/image.c
  weston_image_LDADD = libtoytoolkit.la
  weston_image_CFLAGS = $(AM_CFLAGS) $(CLIENT_CFLAGS)
  
@@ -58,10 +59,10 @@ index 62719c9..55aed6d 100644
 +
  weston_cliptest_SOURCES =				\
  	clients/cliptest.c				\
- 	src/vertex-clipping.c				\
+ 	libweston/vertex-clipping.c			\
 diff --git a/clients/Dra7xx_ddrstat_speed.c b/clients/Dra7xx_ddrstat_speed.c
 new file mode 100644
-index 0000000..af06733
+index 00000000..af067335
 --- /dev/null
 +++ b/clients/Dra7xx_ddrstat_speed.c
 @@ -0,0 +1,494 @@
@@ -561,7 +562,7 @@ index 0000000..af06733
 +
 diff --git a/clients/soc_performance_monitor.c b/clients/soc_performance_monitor.c
 new file mode 100644
-index 0000000..5d1db32
+index 00000000..0036f6ca
 --- /dev/null
 +++ b/clients/soc_performance_monitor.c
 @@ -0,0 +1,630 @@
@@ -1125,12 +1126,12 @@ index 0000000..5d1db32
 +		tg_y[i] = 0.1 * i;
 +	}
 +
-+	struct table_configuration boot_table_config; 
-+        populate_table_configuration(&boot_table_config, total_boot_items, boot_list);
-+
 +	struct table_configuration temp_table_config; 
 +        populate_table_configuration(&temp_table_config, total_temperature_items, temperature_list);
 +
++	struct table_configuration boot_table_config;
++        populate_table_configuration(&boot_table_config, total_boot_items, boot_list);
++
 +	struct table_configuration voltage_table_config; 
 +        populate_table_configuration(&voltage_table_config, total_voltage_items, voltage_list);
 +
@@ -1197,7 +1198,7 @@ index 0000000..5d1db32
 +}
 diff --git a/clients/soc_performance_monitor.h b/clients/soc_performance_monitor.h
 new file mode 100644
-index 0000000..861c8c7
+index 00000000..861c8c7a
 --- /dev/null
 +++ b/clients/soc_performance_monitor.h
 @@ -0,0 +1,40 @@
@@ -1243,7 +1244,7 @@ index 0000000..861c8c7
 +
 diff --git a/clients/statcoll.c b/clients/statcoll.c
 new file mode 100644
-index 0000000..5d5cae7
+index 00000000..5d5cae7c
 --- /dev/null
 +++ b/clients/statcoll.c
 @@ -0,0 +1,1433 @@
@@ -2682,7 +2683,7 @@ index 0000000..5d5cae7
 +
 diff --git a/clients/statcoll.h b/clients/statcoll.h
 new file mode 100644
-index 0000000..fa92753
+index 00000000..fa927538
 --- /dev/null
 +++ b/clients/statcoll.h
 @@ -0,0 +1,152 @@
@@ -2840,7 +2841,7 @@ index 0000000..fa92753
 +#endif
 diff --git a/clients/statcoll_gui.h b/clients/statcoll_gui.h
 new file mode 100644
-index 0000000..7362bde
+index 00000000..7362bde3
 --- /dev/null
 +++ b/clients/statcoll_gui.h
 @@ -0,0 +1,101 @@
@@ -2947,7 +2948,7 @@ index 0000000..7362bde
 +
 diff --git a/clients/time_bar_graph.c b/clients/time_bar_graph.c
 new file mode 100644
-index 0000000..9fa9c12
+index 00000000..9fa9c12d
 --- /dev/null
 +++ b/clients/time_bar_graph.c
 @@ -0,0 +1,515 @@
@@ -3468,7 +3469,7 @@ index 0000000..9fa9c12
 +
 diff --git a/clients/time_bar_graph.h b/clients/time_bar_graph.h
 new file mode 100644
-index 0000000..97ac05a
+index 00000000..97ac05a0
 --- /dev/null
 +++ b/clients/time_bar_graph.h
 @@ -0,0 +1,93 @@
@@ -3566,5 +3567,5 @@ index 0000000..97ac05a
 +
 +#endif /* _BAR_GRAPH_H_ */
 -- 
-1.9.1
+2.17.1
 
diff --git a/recipes-graphics/wayland/weston_2.0.0.bbappend b/recipes-graphics/wayland/weston_5.0.0.bbappend
similarity index 100%
rename from recipes-graphics/wayland/weston_2.0.0.bbappend
rename to recipes-graphics/wayland/weston_5.0.0.bbappend
-- 
2.17.1


