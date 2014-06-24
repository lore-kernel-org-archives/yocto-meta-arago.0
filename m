Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id D87C2529C8
	for <meta-arago@arago-project.org>;
	Tue, 24 Jun 2014 03:17:22 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7N00LQ5L4OEJ10@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 23 Jun 2014 22:17:22 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F1CC6202AA; Mon,
	23 Jun 2014 23:17:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 23 Jun 2014 23:17:09 -0400
Message-id: <1403579830-27590-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1403579830-27590-1-git-send-email-denis@denix.org>
References: <1403579830-27590-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/3] arago-prefs: remove old preferred providers and versions for legacy platforms
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
X-List-Received-Date: Tue, 24 Jun 2014 03:17:23 -0000

From: Denys Dmytriyenko <denys@ti.com>

Set default preference for 3.14 ti-staging kernel

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            | 33 +---------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 437bb61..bcc885c 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -69,39 +69,8 @@ PREFERRED_PROVIDER_virtual/bootloader_keystone = "u-boot-keystone"
 PREFERRED_PROVIDER_u-boot_keystone = "u-boot-keystone"
 
 PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-ti-staging"
-
 PREFERRED_PROVIDER_virtual/kernel_am437x-evm = "linux-ti-staging"
-
-PREFERRED_VERSION_linux-libc-headers_am180x-evm = "2.6.37.2"
-PREFERRED_PROVIDER_virtual/kernel_am180x-evm = "linux-omapl138-psp"
-PREFERRED_VERSION_linux-omapl138-psp = "2.6.37"
-PREFERRED_PROVIDER_ltp-ddt_am180x-evm = "ltp-ddt-legacy"
-PREFERRED_PROVIDER_virtual/bootloader_am180x-evm = "u-boot-am180x"
-PREFERRED_PROVIDER_u-boot_am180x-evm = "u-boot-am180x"
-PREFERRED_VERSION_u-boot-am180x = "2010.12"
-
-PREFERRED_VERSION_linux-libc-headers_am37x-evm = "2.6.37.2"
-PREFERRED_PROVIDER_virtual/kernel_am37x-evm = "linux-omap-psp"
-PREFERRED_VERSION_linux-omap-psp = "2.6.37"
-PREFERRED_PROVIDER_ltp-ddt_am37x-evm = "ltp-ddt-legacy"
-PREFERRED_PROVIDER_virtual/bootloader_am37x-evm = "u-boot-am37x"
-PREFERRED_PROVIDER_u-boot_am37x-evm = "u-boot-am37x"
-PREFERRED_VERSION_u-boot-am37x_am37x-evm = "2012.04.01"
-
-PREFERRED_VERSION_linux-libc-headers_am3517-evm = "2.6.37.2"
-PREFERRED_PROVIDER_virtual/kernel_am3517-evm = "linux-omap-psp"
-PREFERRED_VERSION_linux-omap-psp_am3517-evm = "2.6.37"
-PREFERRED_PROVIDER_ltp-ddt_am3517-evm = "ltp-ddt-legacy"
-PREFERRED_PROVIDER_virtual/bootloader_am3517-evm = "u-boot-am3517"
-PREFERRED_PROVIDER_u-boot_am3517-evm = "u-boot-am3517"
-
-PREFERRED_PROVIDER_virtual/kernel_beagleboard = "linux"
-PREFERRED_VERSION_linux_beagleboard = "3.3.7"
-PREFERRED_PROVIDER_ltp-ddt_beagleboard = "ltp-ddt-legacy"
-PREFERRED_VERSION_linux-libc-headers_beagleboard = "3.2"
-PREFERRED_PROVIDER_virtual/bootloader_beagleboard = "u-boot-am37x"
-PREFERRED_PROVIDER_u-boot_beagleboard = "u-boot-am37x"
-PREFERRED_VERSION_u-boot-am37x_beagleboard = "2012.04.01"
+PREFERRED_VERSION_linux-ti-staging = "3.14%"
 
 # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
 PREFERRED_VERSION_udev = "182"
-- 
2.0.0


