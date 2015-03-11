Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 1DAA352A43
	for <meta-arago@arago-project.org>;
	Wed, 11 Mar 2015 20:41:51 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NL200M8NETNA180@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 11 Mar 2015 15:41:48 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpCc6mbq c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8	a=IMTM7j9x_xrAED9KZOwA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 884FE200EB;	Wed,
	11 Mar 2015 16:41:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 11 Mar 2015 16:41:46 -0400
Message-id: <1426106507-30958-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] arago-prefs: point am57x u-boot back to default u-boot-ti-staging tree
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
X-List-Received-Date: Wed, 11 Mar 2015 20:41:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index c872d9a..fa7a83c 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -78,18 +78,11 @@ PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader_am437x-evm = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot_am437x-evm = "u-boot-ti-staging"
-
 PREFERRED_PROVIDER_virtual/bootloader_omap-a15 = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot_omap-a15 = "u-boot-ti-staging"
 
 PREFERRED_VERSION_u-boot-ti-staging = "2014.07%"
 
-# Point am57xx-evm to latest mainline
-PREFERRED_PROVIDER_virtual/bootloader_am57xx-evm = "u-boot"
-PREFERRED_PROVIDER_u-boot_am57xx-evm = "u-boot"
-
-PREFERRED_VERSION_u-boot_am57xx-evm = "2014.10+2015.01%"
-
 # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
 PREFERRED_VERSION_udev = "182"
 PREFERRED_PROVIDER_udev = "udev"
-- 
2.2.0


