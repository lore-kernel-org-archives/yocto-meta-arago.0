Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 508B0529C9
	for <meta-arago@arago-project.org>;
	Tue,  2 May 2017 20:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0EC4B20B49;
	Tue,  2 May 2017 20:02:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id OgCIK3JTNCw2; Tue,  2 May 2017 20:02:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E4A1E20756;
	Tue,  2 May 2017 20:02:47 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 5FC5C162439;
	Tue,  2 May 2017 16:02:47 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue,  2 May 2017 16:02:46 -0400
Message-Id: <1493755366-132358-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] packagegroup*: add ti-ipc test and dev packages to omapl138
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
X-List-Received-Date: Tue, 02 May 2017 20:02:50 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-test.bb   |  6 +++++-
 .../packagegroup-arago-tisdk-addons-sdk-target.bb           | 13 ++++++++++---
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index 4af1cc4..fc9a027 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Extended task to get System Test specific apps"
 LICENSE = "MIT"
-PR = "r47"
+PR = "r48"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -65,6 +65,10 @@ ARAGO_TI_TEST_append_keystone = " \
     ti-ipc-test \
     "
 
+ARAGO_TI_TEST_append_omapl138 = " \
+    ti-ipc-test \
+    "
+
 RDEPENDS_${PN} = "\
     ${ARAGO_TEST} \
     ${ARAGO_TI_TEST} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 708016e..87aedad 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r35"
+PR = "r36"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -58,8 +58,6 @@ EXTRA_LIBS_append_keystone = "\
 	pktlib-staticdev \
 	libnl-dev \
 	libnl-staticdev \
-	ti-ipc-dev \
-	ti-ipc-staticdev \
 	multiprocmgr-dev \
 	multiprocmgr-staticdev \
 	mpm-transport-dev \
@@ -149,6 +147,15 @@ EXTRA_PACKAGES_append_ti33x = " voxelsdk-dev"
 EXTRA_PACKAGES_append_ti43x = " voxelsdk-dev"
 EXTRA_PACKAGES_append_omap-a15 = " voxelsdk-dev"
 
+IPCDEV = " \
+	ti-ipc-dev \
+	ti-ipc-staticdev \
+"
+
+EXTRA_PACKAGES_append_omap-a15 = " ${IPCDEV}"
+EXTRA_PACKAGES_append_keystone = " ${IPCDEV}"
+EXTRA_PACKAGES_append_omapl138 = " ${IPCDEV}"
+
 RDEPENDS_${PN} = "\
     ${UTILS} \
     ${EXTRA_LIBS} \
-- 
2.7.4


