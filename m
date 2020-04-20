Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 63C34529BE
	for <meta-arago@arago-project.org>;
	Mon, 20 Apr 2020 22:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2376C40C1C;
	Mon, 20 Apr 2020 22:30:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id PkeWHoOCn01Q; Mon, 20 Apr 2020 22:30:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0352040A32;
	Mon, 20 Apr 2020 22:30:10 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B594016E3AC;
	Mon, 20 Apr 2020 18:30:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 20 Apr 2020 18:30:10 -0400
Message-Id: <1587421810-17904-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] Revert "HACK: packagegroups: disable open62541 for now due to breakage"
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
X-List-Received-Date: Mon, 20 Apr 2020 22:32:30 -0000

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit 188e403122833cbc6292466119b24fc7fe83b38a.
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb       | 4 ++--
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb     | 4 ++--
 .../packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb          | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index bbdf1d5..dfc3741 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -6,9 +6,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-#         open62541-dev
-#         open62541-staticdev
 UTILS = "libdrm-dev \
+         open62541-dev \
+         open62541-staticdev \
          "
 
 UTILS_append_keystone = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index bc2d121..e694765 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -10,8 +10,6 @@ PACKAGES =+ "${PN}-extra"
 
 #    dt
 
-#    open62541-examples
-#    open62541-tests
 UTILS = " \
     am-sysinfo \
     gdbserver \
@@ -29,6 +27,8 @@ UTILS = " \
     strongswan \
     kexec \
     kdump \
+    open62541-examples \
+    open62541-tests \
 "
 
 UTILS_UBOOT_FW = "libubootenv-bin"
diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
index 88af814..ab212fa 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
@@ -12,13 +12,13 @@ TIDL_TOOLS = " \
     nativesdk-tidl-utils \
 "
 
-#    nativesdk-open62541-examples
-#    nativesdk-open62541-tests
 EXTRA_TI_TOOLS = " \
     nativesdk-ti-cgt6x \
     nativesdk-ti-cgt-pru \
     nativesdk-clocl \
     ${@oe.utils.all_distro_features(d, "opencl openmp", "nativesdk-clacc")} \
+    nativesdk-open62541-examples \
+    nativesdk-open62541-tests \
     nativesdk-gcc-arm-none-eabi \
     ${@oe.utils.all_distro_features(d, "opencl opencv", "${TIDL_TOOLS}")} \
 "
-- 
2.7.4


