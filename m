Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 71E1C5299B
	for <meta-arago@arago-project.org>;
	Tue, 17 Sep 2013 20:47:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8HKlda6002340
	for <meta-arago@arago-project.org>; Tue, 17 Sep 2013 15:47:39 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8HKld9k027366
	for <meta-arago@arago-project.org>; Tue, 17 Sep 2013 15:47:39 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 17 Sep 2013 15:47:38 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8HKlaMd022414;
	Tue, 17 Sep 2013 15:47:37 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 17 Sep 2013 16:28:05 -0500
Message-ID: <1379453285-14892-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [for comments][PATCH] packagegroup-arago-base: Create new tisdk package
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
X-List-Received-Date: Tue, 17 Sep 2013 20:47:40 -0000
Content-Type: text/plain

* Consolidate packagegroups by creating a new package that will contain packages
  specific to the tisdk.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroups/packagegroup-arago-base-tisdk.bb |   20 --------------------
 .../packagegroups/packagegroup-arago-base.bb       |   18 +++++++++++++++++-
 2 files changed, 17 insertions(+), 21 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
deleted file mode 100644
index 16b5df1..0000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
-LICENSE = "MIT"
-PR = "r13"
-
-inherit packagegroup
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-RDEPENDS_${PN} = "\
-    dbus \
-    expat \
-    glib-2.0 \
-    libxml2 \
-    libpcre \
-    iptables \
-    iperf \
-    psplash \
-    arago-gpl-notice \
-    nfs-utils-client \
-    "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index fd9cd15..02242c7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Basic task to get a device booting"
 LICENSE = "MIT"
-PR = "r3"
+PR = "r4"
 
 inherit packagegroup
 
@@ -23,9 +23,25 @@ ARAGO_EXTRA = "\
     tcpdump \
     "
 
+PACKAGES += "${PN}-tisdk"
+
 # minimal set of packages - needed to boot
 RDEPENDS_${PN} = "\
     ${ARAGO_ALSA_BASE} \
     ${ARAGO_BASE} \
     ${ARAGO_EXTRA} \
     "
+
+RDEPENDS_${PN}-tisdk = "\
+    ${PN} \
+    dbus \
+    expat \
+    glib-2.0 \
+    libxml2 \
+    libpcre \
+    iptables \
+    iperf \
+    psplash \
+    arago-gpl-notice \
+    nfs-utils-client \
+    "
-- 
1.7.0.4


