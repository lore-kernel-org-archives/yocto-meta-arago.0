Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id B9B6852981
	for <meta-arago@arago-project.org>;
	Mon, 21 Jul 2014 23:30:50 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N9300BB25ARLV50@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 21 Jul 2014 18:30:34 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C201D2008D; Mon,
	21 Jul 2014 19:30:26 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 21 Jul 2014 19:30:26 -0400
Message-id: <1405985426-22369-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.2
Subject: [PATCH] arago-prefs: update preference for new 2014.07 u-boot version
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
X-List-Received-Date: Mon, 21 Jul 2014 23:30:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 8261d10..5d4a8fd 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -62,7 +62,7 @@ PREFERRED_PROVIDER_virtual/mesa_keystone = "mesa"
 # Use the mainline u-boot recipe for TI devices unless overridden below
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
 PREFERRED_PROVIDER_u-boot = "u-boot"
-PREFERRED_VERSION_u-boot = "2014.04+2014.07-rc3"
+PREFERRED_VERSION_u-boot = "2014.07"
 
 # Use latest TI staging kernel and u-boot trees
 PREFERRED_PROVIDER_virtual/bootloader_keystone = "u-boot-keystone"
-- 
2.0.2


