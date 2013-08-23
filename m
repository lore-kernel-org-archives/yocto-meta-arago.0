Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTP id B184952A19
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2013 20:16:54 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MS0009V52ZZC563@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 23 Aug 2013 15:16:53 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 84DBF20011; Fri,
	23 Aug 2013 16:16:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 23 Aug 2013 16:16:39 -0400
Message-id: <1377289002-20230-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 1/4] arago-prefs: set default preferences for am437x-evm
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
X-List-Received-Date: Fri, 23 Aug 2013 20:16:55 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index b125957..49268c4 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -9,6 +9,7 @@ PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
 PREFERRED_VERSION_qt4-embedded = "4.8.4"
 PREFERRED_VERSION_qt4-native = "4.8.4"
 PREFERRED_VERSION_nativesdk-qt4-tools = "4.8.4"
+PREFERRED_VERSION_linux-libc-headers = "3.8"
 
 # Use v4.09.00.01 of the Graphics SDK
 PREFERRED_VERSION_omap3-sgx-modules = "4.09.00.01"
@@ -23,6 +24,12 @@ PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-ti-staging"
 
+PREFERRED_VERSION_linux-libc-headers_am437x-evm = "3.8"
+PREFERRED_PROVIDER_virtual/kernel_am437x-evm = "linux-ti-staging"
+PREFERRED_PROVIDER_virtual/bootloader_am437x-evm = "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot_am437x-evm = "u-boot-ti-staging"
+PREFERRED_VERSION_u-boot-ti-staging_am437x-evm = "2013.09+2013.10-rc1"
+
 PREFERRED_VERSION_linux-libc-headers_am180x-evm = "2.6.37.2"
 PREFERRED_PROVIDER_virtual/kernel_am180x-evm = "linux-omapl138-psp"
 PREFERRED_VERSION_linux-omapl138-psp = "2.6.37"
-- 
1.8.3.2


