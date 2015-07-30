Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 0485952A52
	for <meta-arago@arago-project.org>;
	Thu, 30 Jul 2015 16:03:33 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSB00F525XCQO70@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 30 Jul 2015 11:03:12 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=3pxDXebWkBK0uhMcHVUA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E8B7F161B2E;	Thu,
	30 Jul 2015 12:03:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 30 Jul 2015 12:03:11 -0400
Message-id: <1438272191-15395-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1438272191-15395-1-git-send-email-denis@denix.org>
References: <1438272191-15395-1-git-send-email-denis@denix.org>
Subject: [PATCH 5/5] arago-prefs: switch over to 4.1 kernel and 2015.07 u-boot
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
X-List-Received-Date: Thu, 30 Jul 2015 16:03:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index c9be400..a30889c 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -71,7 +71,7 @@ PREFERRED_VERSION_linux-keystone = "3.10%"
 
 PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/kernel_am437x-evm = "linux-ti-staging"
-PREFERRED_VERSION_linux-ti-staging = "3.14%"
+PREFERRED_VERSION_linux-ti-staging = "4.1%"
 
 PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-ti-staging"
@@ -80,7 +80,7 @@ PREFERRED_PROVIDER_u-boot_am437x-evm = "u-boot-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader_omap-a15 = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot_omap-a15 = "u-boot-ti-staging"
 
-PREFERRED_VERSION_u-boot-ti-staging = "2014.07%"
+PREFERRED_VERSION_u-boot-ti-staging = "2015.07%"
 
 # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
 PREFERRED_VERSION_udev = "182"
-- 
2.2.0


