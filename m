Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 4AA1B529C0
	for <meta-arago@arago-project.org>;
	Fri, 13 Jul 2018 01:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C149320DEC;
	Fri, 13 Jul 2018 01:06:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8Bx5RUpETsZ8; Fri, 13 Jul 2018 01:06:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A019E20DD7;
	Fri, 13 Jul 2018 01:06:37 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 59204163512;
	Thu, 12 Jul 2018 21:06:37 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Jul 2018 21:06:36 -0400
Message-Id: <1531443996-23038-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] packagegroup-*-addons*: pull pru-icss packages for am65xx-evm
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
X-List-Received-Date: Fri, 13 Jul 2018 01:06:45 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb      | 7 +++++--
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb  | 6 +++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 6ed5aff..142e4b3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r32"
+PR = "r33"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -32,11 +32,14 @@ UTILS_append_ti43x = " \
     pru-icss-src \
 "
 
+UTILS_append_k3 = " \
+    pru-icss-src \
+"
+
 EXTRA_LIBS = ""
 
 EXTRA_LIBS_append_omap-a15 = " \
     cmem-mod-src \
-    pru-icss-src \
     uio-module-drv-src \
     big-data-ipc-demo-linux-src \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 94303e3..08df10e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r67"
+PR = "r68"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -63,6 +63,10 @@ UTILS_append_omap-a15 = " mmc-utils \
                           uio-module-drv-test \
 "
 
+UTILS_append_k3 = " mmc-utils \
+                    pru-icss \
+"
+
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
 
 UTILS_append_dra7xx = " can-utils \
-- 
2.7.4


