Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 77C6052A21
	for <meta-arago@arago-project.org>;
	Fri,  4 Sep 2015 20:01:10 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NU6000JA4XA1U90@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 04 Sep 2015 15:00:46 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=ff-B7xzCdYMA:10 a=sozttTNsAAAA:8
	a=eNSs0AzVi8gfCgP-aKcA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2134D161BD2;	Fri,
	4 Sep 2015 16:00:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 04 Sep 2015 16:00:45 -0400
Message-id: <1441396845-19291-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [master/fido][PATCH v2] arago-prefs: u-boot-ti-staging is now default for keystone
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
X-List-Received-Date: Fri, 04 Sep 2015 20:01:13 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 4f47d5b..cc2c4db 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -69,16 +69,7 @@ PREFERRED_PROVIDER_virtual/libgles2_keystone = "mesa"
 PREFERRED_PROVIDER_virtual/libgl_keystone = "mesa"
 PREFERRED_PROVIDER_virtual/mesa_keystone = "mesa"
 
-# Use the mainline u-boot recipe for TI devices unless overridden below
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
-PREFERRED_PROVIDER_u-boot = "u-boot"
-PREFERRED_VERSION_u-boot = "2014.07"
-
 # Use latest TI staging kernel and u-boot trees
-PREFERRED_PROVIDER_virtual/bootloader_keystone = "u-boot-keystone"
-PREFERRED_PROVIDER_u-boot_keystone = "u-boot-keystone"
-PREFERRED_VERSION_linux-keystone = "3.10%"
-
 PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/kernel_am437x-evm = "linux-ti-staging"
 PREFERRED_VERSION_linux-ti-staging = "4.1%"
-- 
2.2.0


