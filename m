Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTP id B362E529BE
	for <meta-arago@arago-project.org>;
	Sun,  1 Sep 2013 03:17:45 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MSF00CSXFT578L2@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Sat, 31 Aug 2013 22:17:30 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 748FE2004C; Sat,
	31 Aug 2013 23:17:29 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 31 Aug 2013 23:17:27 -0400
Message-id: <1378005447-32278-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] arago-prefs: set up remaining preferred providers for libgles packages
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
X-List-Received-Date: Sun, 01 Sep 2013 03:17:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 28b4caf..70f02b9 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -16,7 +16,11 @@ PREFERRED_VERSION_omap3-sgx-modules = "4.09.00.01"
 PREFERRED_VERSION_libgles-omap3 = "4.09.00.01"
 PREFERRED_PROVIDER_omap3-sgx-modules = "omap3-sgx-modules"
 PREFERRED_PROVIDER_libgles-omap3 = "libgles-omap3"
+PREFERRED_PROVIDER_libgles-omap3-dev = "libgles-omap3-dev"
+PREFERRED_PROVIDER_libgles-omap3-dbg = "libgles-omap3-dbg"
 PREFERRED_PROVIDER_virtual/egl = "libgles-omap3"
+PREFERRED_PROVIDER_virtual/libgles1 = "libgles-omap3"
+PREFERRED_PROVIDER_virtual/libgles2 = "libgles-omap3"
 
 # Use latest TI staging kernel and u-boot trees
 PREFERRED_VERSION_linux-libc-headers_am335x-evm = "3.8"
-- 
1.8.3.2


