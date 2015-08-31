Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id BE19C529F8
	for <meta-arago@arago-project.org>;
	Mon, 31 Aug 2015 09:26:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7V9Q6ji032571
	for <meta-arago@arago-project.org>; Mon, 31 Aug 2015 04:26:06 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7V9Q6V3029361
	for <meta-arago@arago-project.org>; Mon, 31 Aug 2015 04:26:06 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 31 Aug 2015 04:26:06 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7V9Q4dN008850;
	Mon, 31 Aug 2015 04:26:05 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 31 Aug 2015 14:56:02 +0530
Message-ID: <1441013162-23469-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [daisy, master] libdce: update to 3.00.08.02
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
X-List-Received-Date: Mon, 31 Aug 2015 09:26:17 -0000
Content-Type: text/plain

This also corresponds to the ipumm 3.00.08.02

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-multimedia/libdce/libdce_3.00.08.01.bb |   13 -------------
 .../recipes-multimedia/libdce/libdce_3.00.08.02.bb |   14 ++++++++++++++
 2 files changed, 14 insertions(+), 13 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/libdce/libdce_3.00.08.01.bb
 create mode 100644 meta-arago-extras/recipes-multimedia/libdce/libdce_3.00.08.02.bb

diff --git a/meta-arago-extras/recipes-multimedia/libdce/libdce_3.00.08.01.bb b/meta-arago-extras/recipes-multimedia/libdce/libdce_3.00.08.01.bb
deleted file mode 100644
index 2fd642e..0000000
--- a/meta-arago-extras/recipes-multimedia/libdce/libdce_3.00.08.01.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "Library used for remotely invoking the hw accelerated codec on IVA-HD"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://libdce.h;beginline=1;endline=31;md5=0a398cf815b8b5f31f552266cd453dae"
-
-inherit autotools pkgconfig
-
-DEPENDS = "libdrm ti-ipc"
-
-SRC_URI = "git://git.omapzoom.org/repo/libdce.git;protocol=git"
-SRCREV = "15c5b8f2ea1094226a2f14bacb2441a07049631b"
-
-S = "${WORKDIR}/git"
-EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
diff --git a/meta-arago-extras/recipes-multimedia/libdce/libdce_3.00.08.02.bb b/meta-arago-extras/recipes-multimedia/libdce/libdce_3.00.08.02.bb
new file mode 100644
index 0000000..be17d90
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/libdce/libdce_3.00.08.02.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Library used for remotely invoking the hw accelerated codec on IVA-HD"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://libdce.h;beginline=1;endline=31;md5=0a398cf815b8b5f31f552266cd453dae"
+
+inherit autotools pkgconfig
+
+DEPENDS = "libdrm ti-ipc"
+
+SRC_URI = "git://git.omapzoom.org/repo/libdce.git;protocol=git"
+SRCREV = "3040e7e3f7d1ed42a1273ccc6b912328b90b16db"
+
+S = "${WORKDIR}/git"
+EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
+
-- 
1.7.9.5


