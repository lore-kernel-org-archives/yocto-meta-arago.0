Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 07068520E1
	for <meta-arago@arago-project.org>;
	Thu, 20 Jun 2019 02:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7C5D940BC7;
	Thu, 20 Jun 2019 02:16:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id TZOV_mdfx3iB; Thu, 20 Jun 2019 02:16:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 63EF340B86;
	Thu, 20 Jun 2019 02:16:19 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 88466170496;
	Wed, 19 Jun 2019 22:16:18 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 19 Jun 2019 22:16:17 -0400
Message-Id: <1560996977-17881-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] packagegroups, ti-tisdk-makefile: make sure ti-sgx-ddk-km is not pulled for j7-evm
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
X-List-Received-Date: Thu, 20 Jun 2019 02:17:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb         | 1 +
 .../packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb       | 1 +
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb     | 1 +
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb            | 2 +-
 4 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
index 96ed27b..d7ac1ef 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
@@ -7,6 +7,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
 GRAPHICS_RDEPENDS = "ti-sgx-ddk-km-src"
+GRAPHICS_RDEPENDS_remove_j7-evm = "ti-sgx-ddk-km-src"
 
 GRAPHICS_RDEPENDS_append_omap-a15 = "\
     ti-gc320-driver-src \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index 7e18d08..c461f9b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -14,6 +14,7 @@ GRAPHICS_RDEPENDS = "\
     ${PREFERRED_PROVIDER_virtual/egl}-dev \
     ti-sgx-ddk-km-dev \
 "
+GRAPHICS_RDEPENDS_remove_j7-evm = "ti-sgx-ddk-km-dev"
 
 GRAPHICS_RDEPENDS_append_omap-a15 = "\
     ti-gc320-libs-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 69cfea5..16be54a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -27,6 +27,7 @@ GRAPHICS_RDEPENDS = "\
     ${@bb.utils.contains('MACHINE_FEATURES','sgx','ti-sgx-ddk-km','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','sgx','glmark2','',d)} \
 "
+GRAPHICS_RDEPENDS_remove_j7-evm = "ti-sgx-ddk-km"
 
 GRAPHICS_DISPLAY_UTILS = "\
 "
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index f289a56..25befc0 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -179,7 +179,6 @@ MAKEFILES_append_k3 = " u-boot-spl \
                         linux-dtbs \
                         barcode-roi \
                         cryptodev \
-                        ti-sgx-ddk-km-k3 \
                         sysfw-image \
 			mmwavegesture-hmi \
                         pdm-anomaly-detection \
@@ -187,6 +186,7 @@ MAKEFILES_append_k3 = " u-boot-spl \
 
 MAKEFILES_append_am65xx = " \
                         pru-icss \
+                        ti-sgx-ddk-km-k3 \
 "
 
 # Use this to export kernel arch to ARCH
-- 
2.7.4


