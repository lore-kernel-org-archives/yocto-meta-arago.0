Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 9832952CBA
	for <meta-arago@arago-project.org>;
	Thu,  1 Apr 2021 21:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1ECA640C56;
	Thu,  1 Apr 2021 21:24:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id baxd91h1pGEZ; Thu,  1 Apr 2021 21:24:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E496E40C34;
	Thu,  1 Apr 2021 21:24:11 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6458817456B;
	Thu,  1 Apr 2021 17:24:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  1 Apr 2021 17:23:34 -0400
Message-Id: <1617312217-14991-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617312217-14991-1-git-send-email-denis@denix.org>
References: <1617312217-14991-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH 4/7] packagegroups: move generic tools to base packagegroup
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
X-List-Received-Date: Thu, 01 Apr 2021 21:23:55 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

These tools are useful in the base image and don't increase the size too much.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-base.bb  | 14 ++++++++++----
 .../packagegroups/packagegroup-arago-tisdk-addons.bb       | 12 +-----------
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index 3e2517d..ac87142 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -9,7 +9,7 @@ inherit packagegroup
 ARAGO_ALSA_BASE = "\
     libasound \
     alsa-utils-aplay \
-    "
+"
 
 ARAGO_BASE = "\
     module-init-tools \
@@ -22,13 +22,19 @@ ARAGO_BASE = "\
     bash \
     opkg-bash-completion \
     udev-extraconf \
-    "
+"
 
 # these require meta-openembedded/meta-oe layer
 ARAGO_EXTRA = "\
     devmem2 \
     tcpdump \
-    "
+    parted \
+    dropbear \
+    openssh-sftp-server \
+    kms++ \
+    kms++-python \
+    can-utils \
+"
 
 ARAGO_EXTRA_append_keystone = "\
     k2-fw-initrd \
@@ -40,4 +46,4 @@ RDEPENDS_${PN} = "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'alsa', '${ARAGO_ALSA_BASE}', '',d)} \
     ${ARAGO_BASE} \
     ${ARAGO_EXTRA} \
-    "
+"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 659f6c1..c5a6a3a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -16,13 +16,9 @@ UTILS = " \
     oprofile \
     nbench-byte \
     arm-benchmarks \
-    dropbear \
-    openssh-sftp-server \
     netkit-ftp \
     ptpd \
     libdrm-kms \
-    kms++ \
-    kms++-python \
     stream \
     strongswan \
     kexec \
@@ -38,7 +34,6 @@ UTILS_DSP = " \
 "
 
 UTILS_append_ti33x = " mmc-utils \
-                       can-utils \
                        switch-config \
                        pru-icss \
                        pru-swuart-fw \
@@ -47,7 +42,6 @@ UTILS_append_ti33x = " mmc-utils \
 "
 
 UTILS_append_ti43x = " mmc-utils \
-                       can-utils \
                        switch-config \
                        libdrm-omap \
                        pru-icss \
@@ -56,7 +50,6 @@ UTILS_append_ti43x = " mmc-utils \
 "
 
 UTILS_append_omap-a15 = " mmc-utils \
-                          parted \
                           switch-config \
                           libdrm-omap \
                           stream-openmp \
@@ -67,8 +60,6 @@ UTILS_append_omap-a15 = " mmc-utils \
 "
 
 UTILS_append_k3 = " mmc-utils \
-                    can-utils \
-                    parted \
                     switch-config \
                     irqbalance \
                     jailhouse \
@@ -85,7 +76,7 @@ UTILS_append_j7-hs-evm = " pru-icss"
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
 
-UTILS_append_dra7xx = " can-utils \
+UTILS_append_dra7xx = " \
                         ${UTILS_DSP} \
                         ${@bb.utils.contains('MACHINE_FEATURES','gpu','glsdk-example-apps','',d)} \
 "
@@ -108,7 +99,6 @@ UTILS_append_k2e = " \
 "
 
 UTILS_append_k2g = " \
-    can-utils \
     pru-icss \
     uio-test-pruss \
 "
-- 
2.7.4


