Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 4A95D529CC
	for <meta-arago@arago-project.org>;
	Wed,  6 Sep 2017 01:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3B10B20999;
	Wed,  6 Sep 2017 01:31:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gjL5rGjAaYrl; Wed,  6 Sep 2017 01:31:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 13EE8207BA;
	Wed,  6 Sep 2017 01:31:04 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 8BCBA1625EE;
	Tue,  5 Sep 2017 21:31:03 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue,  5 Sep 2017 21:31:02 -0400
Message-Id: <1504661462-77396-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1504661462-77396-1-git-send-email-denys@ti.com>
References: <1504661462-77396-1-git-send-email-denys@ti.com>
Subject: [morty/master][PATCH 2/2] packagegroup-*-addons*: replace canutils with can-utils
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
X-List-Received-Date: Wed, 06 Sep 2017 01:31:05 -0000

The latter supports CAN-FD and is required for MCAN IP on dra76

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-target.bb              | 10 +++++-----
 .../packagegroups/packagegroup-arago-tisdk-addons.bb           | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 87aedad..387d39e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r36"
+PR = "r37"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -118,13 +118,13 @@ EXTRA_LIBS_append_k2e = "\
 	nwal-lld-staticdev \
 "
 
-UTILS_append_ti33x = " canutils-dev"
-UTILS_append_ti43x = " canutils-dev"
-UTILS_append_dra7xx = " canutils-dev \
+UTILS_append_ti33x = " can-utils-dev"
+UTILS_append_ti43x = " can-utils-dev"
+UTILS_append_dra7xx = " can-utils-dev \
                         elfutils-dev \
                         elfutils-staticdev \
 "
-UTILS_append_k2g = " canutils-dev"
+UTILS_append_k2g = " can-utils-dev"
 
 EXTRA_LIBS = ""
 EXTRA_LIBS_append_omap-a15 = " cmem-dev"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 5e1e2c7..f1a3456 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r62"
+PR = "r63"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -34,7 +34,7 @@ UTILS_UBOOT_FW = "u-boot-fw-utils"
 UTILS_UBOOT_FW_keystone = ""
 
 UTILS_append_ti33x = " mmc-utils \
-                       canutils \
+                       can-utils \
                        switch-config \
                        pru-icss \
                        uio-module-drv-test \
@@ -42,7 +42,7 @@ UTILS_append_ti33x = " mmc-utils \
 "
 
 UTILS_append_ti43x = " mmc-utils \
-                       canutils \
+                       can-utils \
                        switch-config \
                        libdrm-omap \
                        pru-icss \
@@ -63,7 +63,7 @@ UTILS_append_omap-a15 = " mmc-utils \
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
 
-UTILS_append_dra7xx = " canutils \
+UTILS_append_dra7xx = " can-utils \
                         dsptop \
                         gdbc6x \
                         glsdk-example-apps \
@@ -90,7 +90,7 @@ UTILS_append_k2e = " \
 "
 
 UTILS_append_k2g = " \
-    canutils \
+    can-utils \
     pru-icss \
 "
 
-- 
2.7.4


