Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 9D8E552993
	for <meta-arago@arago-project.org>;
	Tue,  1 Mar 2016 01:22:01 +0000 (UTC)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.152])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O3C00GEW6G1XKD0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 29 Feb 2016 19:21:43 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=5DbPclOTyY7KFWgF6t0A:9
Received: by 100.15.86.14 with SMTP id 0ee6e420; Tue, 01 Mar 2016 01:21:43 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5A66F161EF8;	Mon,
	29 Feb 2016 20:21:37 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 29 Feb 2016 20:21:35 -0500
Message-id: <1456795296-15716-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] init-ifupdown: pass udhcpc_opts to eth0 for easy configuration
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
X-List-Received-Date: Tue, 01 Mar 2016 01:22:01 -0000

From: Denys Dmytriyenko <denys@ti.com>

Also pre-configure few more dynamic ethX interfaces for testing.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/init-ifupdown/init-ifupdown/interfaces              | 5 ++++-
 .../recipes-core/init-ifupdown/init-ifupdown_%.bbappend              | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/interfaces b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/interfaces
index 15bc31c..15460a4 100644
--- a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/interfaces
+++ b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/interfaces
@@ -21,8 +21,12 @@ iface atml0 inet dhcp
 auto eth0
 iface eth0 inet dhcp
         pre-up /bin/grep -v -e "ip=[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" /proc/cmdline > /dev/null
+        udhcpc_opts -R -b
 
 iface eth1 inet dhcp
+iface eth2 inet dhcp
+iface eth3 inet dhcp
+iface eth4 inet dhcp
 
 # Ethernet/RNDIS gadget (g_ether)
 # ... or on host side, usbnet and random hwaddr
@@ -30,4 +34,3 @@ iface usb0 inet dhcp
 
 # Bluetooth networking
 iface bnep0 inet dhcp
-
diff --git a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
index c0ab069..997adf2 100644
--- a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
+++ b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
@@ -1,4 +1,4 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago0"
+PR_append = "-arago1"
-- 
2.2.0


