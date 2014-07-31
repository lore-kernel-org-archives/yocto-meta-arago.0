Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 297065298E
	for <meta-arago@arago-project.org>;
	Thu, 31 Jul 2014 18:31:38 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N9L00588A43X0B0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 31 Jul 2014 13:31:16 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 593CE2001F; Thu,
	31 Jul 2014 14:31:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 31 Jul 2014 14:31:13 -0400
Message-id: <1406831474-1160-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.2
Subject: [PATCH 1/2] arago-prefs.inc: switch u-boot preference to ti-staging variant
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
X-List-Received-Date: Thu, 31 Jul 2014 18:31:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 5d4a8fd..eada6a8 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -72,6 +72,12 @@ PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/kernel_am437x-evm = "linux-ti-staging"
 PREFERRED_VERSION_linux-ti-staging = "3.14%"
 
+PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-ti-staging"
+PREFERRED_PROVIDER_virtual/bootloader_am437x-evm = "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot_am437x-evm = "u-boot-ti-staging"
+PREFERRED_VERSION_u-boot-ti-staging = "2014.07%"
+
 # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
 PREFERRED_VERSION_udev = "182"
 PREFERRED_PROVIDER_udev = "udev"
-- 
2.0.2


