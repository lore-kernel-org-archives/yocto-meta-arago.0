Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 555E0529A7
	for <meta-arago@arago-project.org>;
	Fri, 27 Feb 2015 22:24:03 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NKG008CSBJMRMF0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 27 Feb 2015 16:23:47 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=OYkv1aXd c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=0HtSIViG9nkA:10
	a=sozttTNsAAAA:8	a=6YGfpRQ_WjbJymZHyf0A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id AACE920030;	Fri,
	27 Feb 2015 17:23:46 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 27 Feb 2015 17:23:46 -0500
Message-id: <1425075826-11665-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] arago-prefs: pin keystone kernel version to 3.10 as the default
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
X-List-Received-Date: Fri, 27 Feb 2015 22:24:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 5092b25..e689f8b 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -68,6 +68,7 @@ PREFERRED_VERSION_u-boot = "2014.07"
 # Use latest TI staging kernel and u-boot trees
 PREFERRED_PROVIDER_virtual/bootloader_keystone = "u-boot-keystone"
 PREFERRED_PROVIDER_u-boot_keystone = "u-boot-keystone"
+PREFERRED_VERSION_linux-keystone = "3.10%"
 
 PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/kernel_am437x-evm = "linux-ti-staging"
-- 
2.2.0


