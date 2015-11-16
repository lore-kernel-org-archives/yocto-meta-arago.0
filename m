Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id B10C75299A
	for <meta-arago@arago-project.org>;
	Mon, 16 Nov 2015 14:23:43 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NXW00J97VYDTBA0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 16 Nov 2015 08:23:12 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=O5veXqAV9swlKrwz20MA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D4D18161D1A;	Mon,
	16 Nov 2015 09:23:01 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 16 Nov 2015 09:23:01 -0500
Message-id: <1447683781-19243-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] packagegroup-*-amsdk-sdk-host: handle source packaging for RT kernel
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
X-List-Received-Date: Mon, 16 Nov 2015 14:23:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index cf5e2e3..ca24d8e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional scripts and applications into the SDK"
 LICENSE = "MIT"
-PR = "r26"
+PR = "r27"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -9,9 +9,9 @@ inherit packagegroup
 # Choose the kernel and u-boot recipe sources to use
 
 U-BOOT_SRC = "${PREFERRED_PROVIDER_virtual/bootloader}-src"
-KERNEL_SRC = "${PREFERRED_PROVIDER_virtual/kernel}-src"
+KERNEL_SRC = "${PREFERRED_PROVIDER_virtual/kernel}-src${ARAGO_RT_SUFFIX}"
 
-KERNEL_SHADOW_CLONE := "${PREFERRED_PROVIDER_virtual/kernel}"
+KERNEL_SHADOW_CLONE := "${PREFERRED_PROVIDER_virtual/kernel}${ARAGO_RT_SUFFIX}"
 KERNEL_SHADOW_CLONE_ENABLED := "${SRCIPK_SHALLOW_CLONE_pn-${KERNEL_SHADOW_CLONE}}"
 
 BOOT_MONITOR = ""
-- 
2.2.0


