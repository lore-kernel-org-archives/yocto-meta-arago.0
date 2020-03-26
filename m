Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 30822529C9
	for <meta-arago@arago-project.org>;
	Thu, 26 Mar 2020 20:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C5A6940BFE;
	Thu, 26 Mar 2020 20:25:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id cbBit1UuaEwb; Thu, 26 Mar 2020 20:25:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B0254409DE;
	Thu, 26 Mar 2020 20:25:57 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 676961718E5;
	Thu, 26 Mar 2020 16:25:57 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 26 Mar 2020 16:25:57 -0400
Message-Id: <1585254357-34528-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] HACK: packagegroups: disable open62541 for now due to breakage
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
X-List-Received-Date: Thu, 26 Mar 2020 20:28:09 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb       | 4 ++--
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb     | 4 ++--
 .../packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb          | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 26925f2..9487338 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -6,9 +6,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
+#         open62541-dev
+#         open62541-staticdev
 UTILS = "libdrm-dev \
-         open62541-dev \
-         open62541-staticdev \
          "
 
 UTILS_append_keystone = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index f3ae83e..50c24ae 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -10,6 +10,8 @@ PACKAGES =+ "${PN}-extra"
 
 #    dt
 
+#    open62541-examples
+#    open62541-tests
 UTILS = " \
     am-sysinfo \
     gdbserver \
@@ -27,8 +29,6 @@ UTILS = " \
     strongswan \
     kexec \
     kdump \
-    open62541-examples \
-    open62541-tests \
 "
 
 UTILS_UBOOT_FW = "libubootenv-bin"
diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
index c24652b..314c025 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
@@ -6,13 +6,13 @@ inherit packagegroup nativesdk
 
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
+#    nativesdk-open62541-examples
+#    nativesdk-open62541-tests
 EXTRA_TI_TOOLS = " \
     nativesdk-ti-cgt6x \
     nativesdk-ti-cgt-pru \
     nativesdk-clocl \
     nativesdk-clacc \
-    nativesdk-open62541-examples \
-    nativesdk-open62541-tests \
     nativesdk-tidl-import \
     nativesdk-tidl-viewer \
     nativesdk-tidl-utils \
-- 
2.7.4


