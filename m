Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 6A910529D5
	for <meta-arago@arago-project.org>;
	Wed, 23 Jan 2019 04:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4599140AB7;
	Wed, 23 Jan 2019 04:52:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id xV_L9LrWTfd3; Wed, 23 Jan 2019 04:52:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 17D7840AD8;
	Wed, 23 Jan 2019 04:52:14 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 294B8169B49;
	Tue, 22 Jan 2019 23:52:10 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 22 Jan 2019 23:52:07 -0500
Message-Id: <1548219129-12459-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548219129-12459-1-git-send-email-denis@denix.org>
References: <1548219129-12459-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 7/9] packagegroup-*-addons: make gdbc6x and dsptop conditional on 'dsp' machine feature
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
X-List-Received-Date: Wed, 23 Jan 2019 04:52:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb   | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index b3a5c09..5dc3187 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r72"
+PR = "r73"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -36,6 +36,10 @@ UTILS_UBOOT_FW = "u-boot-fw-utils"
 UTILS_UBOOT_FW_keystone = ""
 UTILS_UBOOT_FW_k3 = ""
 
+UTILS_DSP = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'gdbc6x dsptop', '', d)} \
+"
+
 UTILS_append_ti33x = " mmc-utils \
                        can-utils \
                        switch-config \
@@ -75,8 +79,7 @@ UTILS_append_k3 = " mmc-utils \
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
 
 UTILS_append_dra7xx = " can-utils \
-                        dsptop \
-                        gdbc6x \
+                        ${UTILS_DSP} \
                         glsdk-example-apps \
 "
 
@@ -86,18 +89,15 @@ UTILS_append_keystone = " \
 "
 
 UTILS_append_k2hk = " \
-    gdbc6x \
-    dsptop \
+    ${UTILS_DSP} \
 "
 
 UTILS_append_k2l = " \
-    gdbc6x \
-    dsptop \
+    ${UTILS_DSP} \
 "
 
 UTILS_append_k2e = " \
-    gdbc6x \
-    dsptop \
+    ${UTILS_DSP} \
 "
 
 UTILS_append_k2g = " \
-- 
2.7.4


